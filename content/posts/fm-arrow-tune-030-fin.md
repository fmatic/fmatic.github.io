+++
date = '2026-03-30T02:55:48+03:00'
draft = false
title = 'FM Arrow Tune: yksinkertaisesta virityksestä oikeaksi skannaukseksi (v0.1.0 → v0.3.0)'
tags =  ["sdr", "radio", "fm-dx", "sdrsharp", "plugin"]
+++
## Yleiskatsaus

FM Arrow Tune sai alkunsa pienestä käyttömukavuusparannuksesta SDR#:lle.

Alkuperäinen idea oli yksinkertainen:  
tehdä FM-bandin selaamisesta nopeampaa ja luonnollisempaa nuolinäppäimillä.

Hyvin nopeasti projekti kuitenkin kasvoi paljon pidemmälle — kevyeksi skannaus- ja DX-työkaluksi.

---

## Miksi tein tämän

Käytän SDR#:ää usein etänä Splashtopin kautta iPadilla.  
Virtuaaliset nuolinäppäimet paljastivat nopeasti, kuinka kätevää näppäimistöpohjainen viritys voi olla.

Taajuuksien klikkailu tai käsin syöttäminen tuntui hitaalta.  
Nuolinäppäimet tuntuivat luonnollisilta.

Siitä tämä lähti.

---

## v0.1.0 — Alku

Ensimmäinen versio oli tarkoituksella yksinkertainen:

- Vasen / oikea nuoli virittää taajuutta
- Kiinteä askel
- FM-käyttöön suunnattu

Jo tämä paransi kuuntelukokemusta selvästi.

---

## v0.2.0 — Bandin hallinta

Seuraavaksi tuli iso käytettävyysparannus:

- Ylös / alas nuolilla suuremmat loikat
- Säädettävä step-koko
- Säädettävä jump-koko
- FM-bandin rajaus (87.5–108.0 MHz)
- Wrap-around (bandin kierto)

Tämä teki bandin selailusta paljon nopeampaa.

---

## v0.3.0 — Skannaus syntyy

Tämä oli käännekohta.

### Hold-to-scan

Ei enää naputtelua:

- Pidä nuolta → jatkuva viritys
- Vapauta → pysähtyy

Tämä loi luonnollisen “manuaalisen skannauksen”.

---

### Säädettävä skannausnopeus

Skannauksen nopeus on nyt säädettävissä:

- Nopea sweep
- Hidas tarkka kuuntelu

---

### Lopputulos

Tässä vaiheessa FM Arrow Tune ei ole enää pelkkä pikanäppäinplugin.

Se toimii käytännössä oikeana skannaustyökaluna:
- nopea
- intuitiivinen
- tehokas

---

## Mitä seuraavaksi

Seuraava versio menee vielä pidemmälle.

### Suunnitteilla v0.4.0

- Auto scan (käynnistys/pysäytys pikanäppäimellä)
- TXT-logitus
- Aikaleimattu taajuuslogi
- Stop on signal (RSSI)
- RDS-tunnistus (PI / aseman nimi)

Tavoitteena on kehittyä kevyeksi FM-DX-loggaustyökaluksi.

---

## Loppusanat

Pienestä ideasta tuli työkalu, jota käytän päivittäin.

Usein parhaat työkalut syntyvät omien pienten ärsytyksien ratkaisemisesta.

---

## Linkit

- GitHub: https://github.com/fmatic/FM-Arrow-Tune
