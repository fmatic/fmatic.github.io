+++
title: "FM Arrow Tune: ensimmäinen SDR# pluginini"
date: 2026-03-23T03:45:00+02:00
draft: false
tags: ["sdr", "sdrsharp", "airspy", "fm", "plugin", "radio", "kehitys"]
+++

## Pieni mutta yllättävän hyödyllinen lisä SDR#:ään

Olen viime aikoina harjoitellut SDR#-pluginien tekemistä, ja tämä projekti muodostui samalla ensimmäiseksi oikeasti toimivaksi versioksi.

Idea syntyi täysin käytännön tarpeesta. Kuuntelen SDR#:ää usein etänä iPadilla Splashtopin kautta, ja siinä on virtuaaliset nuolinäppäimet. Siitä tuli ajatus: *entä jos FM-bandia voisi selata vain naputtelemalla vasenta ja oikeaa nuolta?*

Ja siitä tämä plugin syntyi.

## Idea

Pluginin nimi on **FM Arrow Tune**.

Sen tarkoitus on yksinkertainen: tehdä FM-bandin selailusta sujuvaa käyttämällä nuolinäppäimiä viritykseen.

Omassa käytössä tämä toimii erityisen hyvin juuri iPad + Splashtop -yhdistelmällä. Sen sijaan että klikkailen pieniä UI-elementtejä tai syötän taajuuksia käsin, voin vain napauttaa vasenta ja oikeaa nuolta ja liikkua bandilla.

Yllättävän mukavaa käytännössä.

## Ominaisuudet

Ensimmäisessä julkisessa versiossa on jo ihan mukavasti toiminnallisuutta:

- Vasen / oikea nuoli viritykseen
- Säädettävä askelkoko
- Mahdollisuus rajata toiminta vain WFM-tilaan
- FM-bandin rajaus (87.5–108.0 MHz)
- Wrap-around (108 → 87.5 ja toisinpäin)
- Mahdollisuus vaatia Ctrl + nuoli

Eli vaikka tämä alkoi pienenä kokeiluna, siitä tuli heti ihan oikeasti käyttökelpoinen työkalu.

## Miksi tein tämän

Tämä ei ollut mikään iso projekti, vaan enemmänkin:

- SDR# plugin-arkkitehtuurin opettelua
- oman käyttökokemuksen parantamista
- pienen mutta ärsyttävän käytettävyysongelman ratkaisemista

Halusin:

- helpomman tavan selata FM-bandia
- sujuvamman “band browsing” -fiiliksen
- näppäimistöpohjaisen ohjauksen
- paremman käytön iPadilla etänä

Ja nyt kun tämä toimii, voin sanoa että lopputulos on juuri sellainen kuin ajattelin.

## Kehityksestä

Pluginin tekeminen oli myös hyvä oppimiskokemus:

- SDR# plugin SDK:n käyttöönotto
- oikean projektirakenteen selvittäminen
- .NET-yhteensopivuuden kanssa säätäminen
- testaus oikeassa SDR#-ympäristössä

Kuten usein, itse idea oli yksinkertainen — mutta toteutus vaati hieman kaivamista.

## Mitä seuraavaksi

Tämä ensimmäinen versio keskittyy vasen/oikea -viritykseen, mutta jatkokehitysideoita on jo mielessä.

Mahdollisia seuraavia ominaisuuksia:

- **Ylös / alas nuolilla isommat loikat**
  - esim. 500 kHz tai 1 MHz

- **Hold-to-scan**
  - pidä oikeaa nuolta → skannaa ylöspäin
  - pidä vasenta nuolta → skannaa alaspäin
  - vapauta → pysähtyy

Nämä sopisivat erityisen hyvin juuri iPad-käyttöön.

## Ensimmäinen julkaisu

Julkaisin tämän versiona **v0.1.0**. Se tuntuu sopivalta: toimiva ja hyödyllinen, mutta selkeästi vielä kehityksen alussa.

## Loppufiilis

Tykkään tällaisista projekteista.

Yksinkertainen idea, käytännön tarve, vähän kokeilua, hieman debuggausta — ja lopputuloksena työkalu, joka oikeasti parantaa käyttökokemusta.

Ja täytyy sanoa: FM-bandin selailu pelkällä nuolinäppäinten naputtelulla iPadilla on yllättävän nautinnollista.

Jo pelkästään se teki tästä projektista vaivan arvoisen.
