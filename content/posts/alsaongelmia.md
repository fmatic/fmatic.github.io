+++
date = '2025-12-14T12:34:43+02:00'
draft = false
title = 'Alsaongelmia'
tags = ["Linux", "ALSA"]
+++
## Kun kaikki näyttää toimivan – mutta ääntä ei kuulu

Tämä on tarina tilanteesta, joka on varmasti tuttu monelle Linuxia, SDR:ää ja radiotekniikkaa harrastavalle.

Kaikki **näyttää** toimivan:

- FM-DX-Webserver pyörii normaalisti
- selainliittymä toimii
- spektri elää
- signaalimittarit liikkuvat
- RDS dekoodautuu

Mutta silti:

> **Web-audio on täysin mykkä.**

Ei virheilmoituksia.  
Ei kaatumisia.  
Ei mitään selkeää vihjettä siitä, missä vika on.

---

## Ympäristö lyhyesti

Kokoonpano oli seuraava:

- Raspberry Pi 3B+
- FM-DX-Webserver
- TEF668x-vastaanotin
- USB-äänikortti (ESI MAYA U5)
- Audio TEF:ltä line-inin kautta äänikortille
- ALSA + FFmpeg web-audiolle

Kaikki oli aiemmin toiminut.

---

## Ensimmäinen harhapolku: “Spektri elää, joten audiokin on kunnossa”

Tämä on se oletus, johon moni – myös kokenut harrastaja – sortuu.

Jos spektri elää ja tasomittarit liikkuvat, **signaaliahan siellä on**.  
Ja se pitää paikkansa.

Mutta se ei tarkoita, että **encoder saa oikeaa audiota**.

FM-DX-Webserverissä on kaksi eri maailmaa:

1. **DSP / analyysi**
   - spektri
   - signaalitasot
   - RDS-dekoodaus

2. **Web-audio / encoder**
   - FFmpeg
   - MP3 / Opus
   - selaimen WebAudio

Nämä eivät ole sama audiopolku.

---

## ALSA:n hiljainen ansa

Kaikki mikserisäädöt näyttivät oikeilta:

- Line In capture päällä
- gainit kohdallaan
- mikrofoni mykistetty
- mitään ei ollut mutella

Silti web-audio pysyi mykkänä.

Ratkaiseva vihje löytyi komennolla:

```bash
amixer -c 0```

Sieltä löytyi rivi, jota en ollut aluksi huomannut:

```bash
Simple mixer control 'PCM Capture Source',0
Items: 'Microphone' 'Line In' 'Stereo Mix' 'Spdif Rx'
Item0: 'Microphone'
```

Se yksi väärä valinta

Vaikka Line In oli capture-tilassa aktiivinen ja gainit auki,
PCM Capture Source osoitti silti Microphoneen.

FM-DX-Webserver (ja FFmpeg) lukevat PCM-lähdettä, eivät yksittäisten faderien tilaa.

Yksi komento ratkaisi kaiken:

```bash
amixer -c 0 set 'PCM Capture Source' 'Line In'```

Heti tämän jälkeen:

    web-audio heräsi henkiin

    ääni kuului selaimessa normaalisti

    mitään muuta ei tarvinnut muuttaa

Miksi tämä on niin petollinen vika?

Koska:

    ALSA ei varoita

    mikään ei kaadu

    UI ei näytä virhettä

    spektri elää normaalisti

DSP näkee energiaa, mutta encoder tarvitsee oikean lähteen.

Tämä on täysin analoginen tilanne sille, että:

    IF-asteessa näkyy vahva signaali

    mutta AF-vahvistin on mykkä

Vastaanotin ei ole rikki – audiopolku vain katkeaa yhdessä kohdassa.
Opetus

    Linux-audiossa kaikki voi olla “melkein oikein” – ja silti täysin mykkää.

Erityisesti USB-äänikorteissa:

    mikserit resetoutuvat

    lähdevalinnat unohtuvat

    yksi väärä MUX-valinta riittää katkaisemaan koko ketjun

Ja tämä tapahtuu hiljaa.
Yhteenveto

    Vika ei ollut kaapelissa

    Vika ei ollut FFmpegissä

    Vika ei ollut selaimessa

    Vika ei ollut FM-DX-Webserverissä

Vika oli yksi ALSA-valinta:

PCM Capture Source = Microphone

Kun sen vaihtoi:

PCM Capture Source = Line In

…kaikki alkoi toimia.
