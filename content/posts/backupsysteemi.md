+++
date = '2026-01-07T13:58:25+02:00'
draft = true
title = 'Backupsysteemi'
tags: ["backup", "linux", "rsync", "rainmeter", "powershell", "homelab"]
+++

## Lähtötilanne

Kotiverkossani pyörii useita Linux-koneita eri tehtävissä:  
Raspberry Pi -palvelimia, yksi MiniPC, yksi Debian-pohjainen pääkone sekä Windows-työpöytä.

Koneet tekevät asioita, jotka **eivät saa mennä rikki**:

- OpenWebRX
- FM-DX-palvelimia
- ADS-B
- musiikkipalvelu
- blogi ja kehitysympäristö

Yksi asia kuitenkin puuttui:

> **Yhtenäinen varmuuskopiointi – ja ennen kaikkea näkyvyys siihen, että se oikeasti toimii.**

---

## Varmuuskopioinnin perusta

Varsinainen backup-ratkaisu syntyi melko suoraviivaisesti:

- yksi keskuskone varmuuskopioille
- SSH-yhteys kaikkiin koneisiin
- `rsync` ja snapshotit (`--link-dest`)
- ajastus cronilla
- retention (esim. 30 päivää)

Periaatteet olivat selkeät:

- jokaiselle koneelle oma hakemisto
- `latest`-symlinkki viimeisimpään tilaan
- ei turhaa dataa (`.cache`, `/proc`, `/sys`, jne.)

Teknisesti tämä osa oli yllättävän kivuton.

---

## Todellinen haaste: monitorointi

Todellinen ongelma ei ollut varmuuskopiointi, vaan tämä kysymys:

> *Mistä tiedän yhdellä silmäyksellä, että kaikki backupit ovat oikeasti onnistuneet?*

Halusin nähdä:
- kaikki koneet listattuna
- viimeisimmän onnistuneen ajon ajan
- selkeän OK / FAIL -tilan

Ratkaisu alkoi hahmottua arkkitehtuurina:

Linux (backup) → status.json → Windows → Rainmeter

Yksinkertaista, mutta toteutus ei ollut.

---

## Yksi totuuden lähde: status.json

Backup-skripti kirjoittaa ajon lopuksi tiedoston, joka sisältää vain faktaa:

- milloin backup ajettiin
- mitkä koneet onnistuivat
- mitkä eivät

Tämä osoittautui kriittiseksi päätökseksi:

> **Yksi kone kirjoittaa totuuden.  
> Kaikki muut vain lukevat sitä.**

Ei tilannepäätelmiä käyttöliittymässä.  
Ei arvailua.

---

## Miksi PowerShell tuli väliin

Ajatus oli aluksi lukea JSON suoraan Rainmeterilla.

Todellisuus:
- WebParser
- JSON-rakenne
- aikaleimojen käsittely
- päivitysrytmit
- encoding-ongelmat

Jossain vaiheessa kävi selväksi, että taistelen väärää sotaa.

Ratkaisu oli yllättävän yksinkertainen:

- PowerShell hakee JSONin
- kirjoittaa sen sisällön yksinkertaiseen tekstitiedostoon
- Rainmeter lukee vain tekstiä

Tämä erotti:
- **datan hakemisen**
- **datan esittämisen**

Ja koko ketju muuttui vakaaksi.

---

## Task Scheduler: yllättävän vaikea osa

Task Scheduler osoittautui projektin henkisesti raskaimmaksi osaksi.

Ongelmia mm.:

- tehtävä “ajaa” mutta ei tee mitään
- Microsoft-tilin ja ajastimen yhteensopivuus
- repeat-ajot jäävät päälle
- PowerShell vilahtelee työpöydällä

Lopullinen ratkaisu vaati:

- selkeän ajastusmallin
- yhden vastuun per komponentti
- PowerShellin ajamisen täysin piilotettuna VBS-wrapperin kautta

Tässä kohtaa opin tärkeän läksyn:

> **Rainmeter ei ole ajastin.  
> Task Scheduler ei ole käyttöliittymä.  
> Jokaisella osalla on yksi vastuu.**

---

## Navidrome mukaan varmuuskopioihin

Kun pääkoneelle tuli musiikkipalvelu, oli selvää että sekin kuuluu backupeihin.

Tärkeä oivallus:
- musiikkikirjastoa ei tarvitse varmuuskopioida
- mutta **tietokanta ja asetukset kyllä**

Näin mukaan päätyivät:
- käyttäjät
- soittolistat
- kuunteluhistoria

Ilman turhaa datamäärää.

---

## Dokumentaatio on osa infraa

Projektin lopussa syntyi vielä yksi tärkeä tiedosto: DISASTER-RECOVERY.md

Se vastaa kysymykseen:

> *“Jos koko järjestelmä katoaa, mitä teen ensimmäisenä?”*

Se ei ole README.  
Se ei ole blogipostaus.

Se on käyttöohje pahimpaan päivään.

---

## Mitä tästä opin

- Varmuuskopio ilman näkyvyyttä on vain toivoa
- Yksi totuuden lähde on kullanarvoinen
- Yksi väärä merkki tiedostonimessä voi viedä tunnin debuggausta
- Infra ei ole valmis ennen kuin siihen voi luottaa ja sen voi unohtaa

---

## Seuraavat askeleet

- kuukausittaiset full image -backupit erilliselle levylle
- palautustestit
- tästä ehkä joskus siistitty public-versio

Mutta juuri nyt tärkeintä on tämä:

> **Backupit pyörivät.  
> Monitorointi toimii.  
> Työpöytä on rauhallinen.**

Ja se on yllättävän hyvä tunne.
