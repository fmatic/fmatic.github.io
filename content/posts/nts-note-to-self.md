+++
date = '2026-01-10T14:28:58+02:00'
draft = false
title = 'Nts Note to Self'
tags = ["linux", "cli", "bash", "productivity", "tools"]
+++

Monesti parhaat työkalut syntyvät omasta tarpeesta.

Halusin Linux-komentoriville **yksinkertaisen mutta järkevän tavan** kirjata
*”työn alla olevia asioita”* – ilman tietokantoja, pilvipalveluja tai raskaita
todo-sovelluksia.

Näin syntyi **NTS – Note To Self**.

---

## 🧠 Mikä on NTS?

**NTS** on pieni komentorivityökalu, jolla voi:

- lisätä muistiinpanoja suoraan terminaalista
- pitää kirjaa työn alla olevista asioista
- merkitä tehtäviä valmiiksi
- käyttää tageja vapaasti (`#linux`, `#backup`, `#radio`)
- listata tehtäviä suodattimilla
- lukea ja muokata kaikkea Markdownina

Kaikki data tallennetaan **yhteen tiedostoon**:

```text
~/.nts.md
```

Ei lukitusta. Ei formaattihässäkkää.
Pelkkää tekstiä.

##✍️ Muistiinpanon lisääminen

```bash
nts add "Korjaa skripti #linux #nts"
```

Tämä lisää tiedostoon rivin:

```bash
- [ ] Korjaa skripti #linux #nts _(10.01.2026 12:44)_
```

Päivämäärä on automaattisesti EU-muodossa.

##📋 Tehtävien listaaminen

```bash
nts list
```

Tulostus on värikoodattu, mutta toimii myös putkessa:

```bash
nts list | less
```

🏷️ Suodatus tageilla

```bash
nts list #nts
nts list #backup
```

Tagit ovat vapaata tekstiä – ei rekisteriä, ei pakkoa.

📅 Tänään tehdyt asiat

```bash
nts list --today
```

✅ Valmiit tehtävät

```bash
nts list --done
```

Tehtävän merkitseminen valmiiksi:

```bash
nts done 2
```

##  ⌨️ Autocomplete (bash / zsh / fish)

NTS tukee shell-autocompletea.

Erityisen kätevä ominaisuus on tag-only autocomplete:

```bash
nts add "#<TAB>"
nts add "Korjaa skripti #<TAB>"
```

Autocomplete ehdottaa aiemmin käytettyjä tageja suoraan muistiinpanoista.

Autocomplete voidaan kytkeä pois/pois:

```bash
nts config completion off
nts config completion on
```

## 🔧 Asennus

```bash
sudo ./nts install
```

Asennus:

- kopioi nts-komennon /usr/local/bin
- asentaa bash/zsh-completionit
- Käynnistä shell uudelleen asennuksen jälkeen.

## 🤔 Miksi tällainen työkalu?

NTS ei yritä olla täydellinen todo-järjestelmä.

Se on:

- nopea
- tekstipohjainen
- Git-ystävällinen
- helppo varmuuskopioida
- helppo laajentaa
- Paljon Linuxia käyttävillä on aina vähintään yksi CLI auki

Se noudattaa vanhaa Unix-filosofiaa:

Data on tekstiä. Työkalut tekevät työn.

##🔜 Jatkokehitysideoita

Mahdollisia seuraavia askelia:

- nts tags – listaa tagit ja laskurit
- nts stats – pieni yhteenveto
- nts doctor – tarkistaa ympäristön
- Git-pohjainen synkkaus

Mutta jo nyt NTS on päivittäisessä käytössä hyödyllinen.

Jos kiinnostaa, lähdekoodi löytyy GitHubista.
