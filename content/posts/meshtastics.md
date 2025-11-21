+++
date = '2025-11-11T22:51:51+02:00'
draft = false
title = 'Meshtastic'
tags = ["LoRa","Meshtastic"]
+++
Viime aikoina olen monen muun projektin lisäksi puuhastellut pienten LoRa-laitteiden parissa. Etenkin Meshtastic-projektin parissa, joka siis on
avoimen lähdekoodin hajautettu mesh-verkko, joka on suunniteltu toimimaan vähän virtaa kuluttavilla laitteilla -> lisää aiheesta osoitteessa 
[MeshAbout.fi](https://www.meshabout.fi/). 

Jyväskylän, Kangaslammella minulla on oma "basenode" eli kiinteä node; Vadelma Base (VDLM), jonka sydämenä hyrrää LILYGO T-LoRa V2.1-1.6 ja erilinen
ulkoantenni. Asustelen kerrostalon viidennessä, ylimmässä kerroksessa (ASL n.160) joten tällä tavoin saan katettua verkkoa varsin kohtuullisesti.
Toisena laitteena on Vadelma Portable (VDL2), jonka sydämenä sykkii Heltec V3. Tämä aparaatti kulkee aina matkassa missä päin kulloinkin liikun.

Tällä hetkellä Jyvässeudulla on vähänlaisesti nodeja ja ne harvat mitä löytyy ovat usein offline 😒 Sen lisäksi oletusasetuksena oleva LongFast
ei mielestäni ole niitä kaikkein otollisimpia suhteellisen ruuhkaisella bandilla, jossa oletuksena on monenlaista LoRa-laitetta sähkömittareista 
etäohjattaviin valoihin on mm. Pirkanmaalla siirrytty EdgeFastLow asetuksiin -> [MeshPirkanmaa](https://meshpirkanmaa.org/EdgeFastLow_Jakeluun.pdf)
Omissa kokeilussa EFL on selkeästi parantunut yhteysväliä ja olisikin toivottavaa, että muuallakin siirryttäisiin EFL:n. 
