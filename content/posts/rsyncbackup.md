+++
title = "rsync snapshot -varmuuskopiointi käytännössä: --link-dest, retention ja sudenkuopat"
date = 2026-01-07
tags = ["rsync", "backup", "linux", "snapshots", "homelab"]
draft = false
+++

## Miksi rsync snapshotteihin?

Moni ajattelee varmuuskopiointia kahdella tavalla:

- joko kopioidaan kaikki aina uudestaan
- tai luotetaan johonkin mustaan laatikkoon

`rsync` tarjoaa kolmannen vaihtoehdon:
**yksinkertaisen, läpinäkyvän ja tehokkaan snapshot-mallin**, joka ei vaadi erikoistyökaluja.

---

## Perusidea lyhyesti

Snapshot-mallissa:

- jokainen varmuuskopiointi näyttää täydeltä kopiolta
- todellisuudessa vain muuttuneet tiedostot vievät tilaa
- muuttumattomat tiedostot ovat **kovia linkkejä**

Tämä saavutetaan `--link-dest`-valitsimella.

---

## Hakemistorakenne

Yksi kone, yksi rakenne:

```text
backups/
└── host1/
    ├── 2026-01-05/
    ├── 2026-01-06/
    └── latest -> 2026-01-06/
````

jokainen päivä on oma snapshot

- latest osoittaa viimeisimpään
- palautus on aina helppoa

## Ensimmäinen ajo (täysi kopio)

Kun aiempaa snapshotia ei ole:

```bash
rsync -a --delete \
  /source/ \ /backups/host1/2026-01-06

```

Tämä kopioi kaiken normaalisti.

⸻

## Seuraavat ajot (–link-dest)

Kun edellinen snapshot on olemassa:

```bash
rsync -a --delete \
  --link-dest=/backups/host1/latest \ /source/ \ /backups/host1/2026-01-07/
```

Mitä tapahtuu:

- muuttuneet tiedostot kopioidaan
- muuttumattomat linkitetään
- levytila säästyy
- jokainen snapshot on silti itsenäinen

⸻

## Miksi –delete on tärkeä

Ilman --delete-valitsinta:

- poistetut tiedostot jäävät kummittelemaan
- snapshot ei vastaa todellista tilannetta

--delete varmistaa, että snapshot vastaa lähdejärjestelmän tilaa kyseisenä päivänä.

⸻

## Excludet – kriittinen osa

Kaikkea ei pidä varmuuskopioida.

Tyypilliset poissuljettavat:

```bash
--exclude='.cache/**' \
--exclude='/proc/**' \
--exclude='/sys/**' \
--exclude='/dev/**' \
--exclude='/run/**' \
--exclude='/tmp/**'
```

Erityisesti:
- .cache → turhaa, muuttuu jatkuvasti
- virtuaaliset fs:t → eivät kuulu backupiin

⸻

## Excludes.txt – siistimpi ratkaisu

Pitkät exclude-listat kannattaa siirtää tiedostoon:

```bash
.cache/**
/proc/**
/sys/**
/dev/**
/run/**
/tmp/**
```

ja käyttää

```bash
rsync -a --delete \
  --link-dest=... \
  --exclude-from=excludes.txt \
  /source/ /dest/
```

Tämä tekee skriptistä luettavan ja huollettavan.

⸻

## Retention – vanhojen snapshotien siivous

Snapshotit eivät ole ikuisia.

Yksinkertainen retention:

```bash
find /backups/host1 \
  -maxdepth 1 \
  -type d \
  -name "20*" \
  -mtime +30 \
  -exec rm -rf {} \;
```

Tämä:
- säilyttää 30 päivää
- ei koske latest-symlinkkiin
- on helppo ymmärtää

## Palautus on koko idean ydin

Yksittäinen tiedosto:

```bash
cp /backups/host1/latest/etc/config.conf /etc/config.conf
```

Koko järjestelmä:

```bash
rsync -a /backups/host1/latest/ /
```

Ei restore-ohjelmia.
Ei formaatteja.
Ei tulkintaa.

⸻

## Yleiset sudenkuopat

1️⃣ Unohdetaan –link-dest

→ kaikki vie täyden tilan

2️⃣ Snapshotit sekoitetaan

→ pidä aina yksi kone = yksi hakemisto

3️⃣ Backup-levy ei ole mountattu

→ backup menee väärään paikkaan

Ratkaisu:

- tarkista mountpoint
- keskeytä ajo jos ei ole kiinni

⸻

## Milloin rsync EI riitä

rsync ei ole

- block-level snapshot
- image backup
- ransomware-suoja

Siksi hyvä malli on:

- rsync snapshotit päivittäin
- full image backup harvemmin (esim. kuukausittain)

⸻

Yhteenveto

rsync snapshot-malli toimii, koska se on:

- yksinkertainen
- läpinäkyvä
- nopea
- helposti palautettava

Jos ymmärrät:

- --link-dest
- hyvän hakemistorakenteen
- järkevän retentionin

…sinulla on varmuuskopiointi, johon voi oikeasti luottaa.

Ja mikä parasta:

et tarvitse mitään muuta kuin rsyncin.
