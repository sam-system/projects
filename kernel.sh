#!/bin/bash

echo "=== Mise à jour des dépôts ==="
sudo apt-get update

echo "=== Réparation des dépendances ==="
sudo apt-get -f install

echo "=== Mise à niveau des paquets ==="
sudo apt-get upgrade

echo "=== Suppression des paquets inutiles ==="
sudo apt-get autoremove --purge

echo "=== Nettoyage du cache APT ==="
sudo apt-get autoclean
sudo apt-get clean

echo "=== Suppression des paquets résiduels (rc) ==="
residus=$(dpkg -l | awk '/^rc/{print $2}')

if [ -n "$residus" ]; then
    sudo dpkg --purge $residus
    echo "Résidus supprimés."
else
    echo "Aucun résidu trouvé."
fi

echo "=== Vérification finale des dépendances ==="
sudo apt-get -f install

echo "=== Nettoyage terminé ==="
