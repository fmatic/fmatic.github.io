#!/bin/bash
set -e  # pysähtyy, jos jokin komento epäonnistuu

echo "🔹 Päivitetään Archie-submodule"

# Mene submodule-kansioon
cd themes/archie

# Hae viimeisimmät commitit
git fetch origin

# Checkout master ja päivitä
git checkout master
git pull origin master

# Palaa pääprojektiin
cd ../..

# Varmista, että olet main-branchissa
git checkout main

# Tee todellinen muutos, jos GH Actions ei triggeröidy pelkästä submodulesta
# Lisää pieni comment rivi assets/css/custom.css
if [ ! -f assets/css/custom.css ]; then
    mkdir -p assets/css
    touch assets/css/custom.css
fi
echo "/* trigger GH Actions build */" >> assets/css/custom.css

# Lisää submodule ja muutokset committiin
git add themes/archie assets/css/custom.css

# Tee commit
git commit -m "Update submodule and trigger GH Actions build"

# Pushaa mainiin
git push origin main

echo "✅ Submodule päivitetty ja GH Actions build käynnistetty"
