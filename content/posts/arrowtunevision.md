+++
date = '2026-04-11T04:43:35+03:00'
draft = true
title = 'FM Arrow Tune – pienestä nuolinäppäinideasta FM-DX analyysityökaluksi'
tags = ["SDR", "FM-DX", "Airspy", "SDRSharp", "radio", "dashboard"]
+++

FM Arrow Tune lähti liikkeelle hyvin yksinkertaisesta tarpeesta:

*halusin vain virittää SDR#:ää nuolinäppäimillä.*

Etäkäytössä, varsinkin iPadilta ja Splashtopin kautta, tämä tuntui luontevalta tavalta selata FM-bändiä nopeasti ilman jatkuvaa hiirellä tähtäilyä. Vasen, oikea, ylös, alas. Nopea ja intuitiivinen tapa liikkua taajuudelta toiselle.

Siitä pienestä ideasta projekti on kuitenkin kasvanut paljon pidemmälle kuin alun perin kuvittelin.

## Nuolinäppäimistä oikeaksi DX-työkaluksi

Aluksi FM Arrow Tune oli käytännössä kevyt viritysapuri. Sittemmin mukaan on tullut yhä enemmän ominaisuuksia, jotka tekevät siitä aidosti hyödyllisen FM-DX-käytössä:

- askellus ja hyppy taajuuksilla
- hold-to-scan ja auto scan
- PI-first logging
- Radiotextin ja signaalimittareiden tallennus
- station settle time
- virheellisten PI-koodien suodatus
- live-dashboard
- FMScan/FMLIST enrichment
- confidence scoring
- DX event detection
- nearest transmitter selection käyttäjän koordinaattien perusteella

Tässä vaiheessa FM Arrow Tune ei ole enää pelkkä viritysplugari. Se on käytännössä pieni FM-DX analyysialusta.

## Mikä muuttui olennaisesti

Yksi tärkeimmistä kehityskohdista on ollut logiikan siirtyminen pelkästä “taajuus vaihtui → kirjoita lokiin” -mallista kohti oikeasti vakaampaa havaintoa.

FM-DX:ssä ongelma ei ole vain se, kuuluuko asema vai ei. Ongelma on myös se, että RDS-data voi tulla viiveellä, jäädä hetkeksi roikkumaan tai vuotaa viereiselle kanavalle. Tämän vuoksi loggingiin tarvittiin enemmän älyä:

- havainto ei mene lokiin heti
- aseman tiedot saavat stabiloitua
- väärät alku-PI:t voidaan ohittaa
- taajuus ja aseman tiedot eivät enää mene sekaisin samalla tavalla kuin varhaisissa versioissa

Tämä on ollut ehkä tärkein yksittäinen askel siitä, että projektista tuli luotettava oikeassa käytössä.

## Dashboard muutti koko projektin luonteen

Versioon 0.5.0 mennessä mukaan tuli dashboard, ja siinä kohtaa projektin luonne muuttui selvästi.

Dashboard ei ole vain lokinlukija. Se näyttää esimerkiksi:

- viimeisimmän aseman
- päivän logit
- best DX -havainnot
- top stationit
- confidence-luokituksen
- DX eventit
- FMScan-matchit

Myöhemmin mukaan tuli myös mahdollisuus määrittää käyttäjän oma sijainti erillisellä `dashboard-config.json`-tiedostolla, jolloin dashboard osaa valita saman PI-koodin useista lähettimistä lähimmän. Tämä on erityisen hyödyllistä verkkoasemien kohdalla, joissa sama PI voi kuulua usealta eri TX-paikalta.

## Tärkeä linjaus tulevaisuutta varten

Projektin tulevaisuuden kannalta tärkeä ajatus on tämä:

**Plugin core = multi-band capable**  
**DX intelligence = FM-first**

Toisin sanoen:

- viritys- ja scan-logiikka voidaan tulevaisuudessa tehdä hyödylliseksi myös muille bandeille
- mutta raskas analytiikka, logging ja dashboard-ajattelu ovat ennen kaikkea FM-DX:ää varten

Tämä tuntuu järkevimmältä tavalta kehittää projektia ilman että se menettää identiteettiään.

## Roadmap tästä eteenpäin

Tällä hetkellä suunta näyttää tältä:

### v0.5.3
- adjacent channel detection
- duplicate filtering

### v0.6.0
- band opening detection
- country tracking
- session stats

### v0.7.0
- map view
- distance calculations
- visual DX paths

Ajatus on pitää kehitys käytännöllisenä. Ei turhaa kikkailua, vaan oikeasti hyödyllisiä asioita FM-DX-harrastukseen.

## Yhteenveto

FM Arrow Tune lähti liikkeelle hyvin pienestä tarpeesta. Nyt se on pisteessä, jossa se toimii jo paljon enemmän analyysi- ja logging-ympäristönä kuin pelkkänä viritysapuna.

Ja ehkä juuri se tekee tästä projektista kiinnostavan.

Pitkälle on tultu siitä, kun halusin vain tunata nuolinäppäimillä.
