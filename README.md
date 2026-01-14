# 🇫🇷 Patch Français (FR) pour **Hytale**

Bienvenue sur un dépôt NON-officiel du **Patch Français pour Hytale** ! 🎉
Ce projet a pour objectif de proposer une **traduction française** du jeu **Hytale**, aussi bien **côté client** que **côté serveur**, afin d’offrir une expérience plus accessible aux joueurs francophones.

---

## 📦 Contenu du dépôt

Ce dépôt contient **deux dossiers principaux** :

```
📁 fr-FR
📁 Server
```

Chacun de ces dossiers correspond à une partie bien précise du jeu. Merci de suivre attentivement les instructions ci-dessous pour une installation correcte.

---

## 🖥️ Installation – Partie CLIENT (Jeu)

### 📁 Dossier `fr-FR`

Ce dossier contient les fichiers de langue française utilisés par **le client du jeu**.

### 🔧 Étapes d’installation

1. **Fermez Hytale** s’il est en cours d’exécution
2. Copiez le dossier **`fr-FR`** présent dans ce dépôt
3. Collez-le à l’emplacement suivant :

```text
C:\Users\%USERNAME%\AppData\Roaming\Hytale\install\release\package\game\latest\Client\Data\Shared\Language
```

4. Si un dossier `fr-FR` existe déjà, **remplacez-le**

✅ La partie client du patch est maintenant installée !

---

## 🧩 Installation – Partie SERVEUR

⚠️ Cette partie est **un peu plus technique**, mais reste simple si vous suivez les étapes pas à pas.

### 📁 Dossier `Server`

Dans ce dossier se trouve un fichier important :

```
server.lang
```

Ce fichier doit être intégré **à l’intérieur d’un fichier ZIP existant** nommé **`Assets.zip`**.

---

### 📍 Où se trouve `Assets.zip` ?

Selon votre configuration, il peut se trouver :

#### 🔹 Jeu en local

```text
C:\Users\%USERNAME%\AppData\Roaming\Hytale\install\release\package\game\latest\Assets.zip
```

#### 🔹 Serveur dédié

* À côté du dossier du serveur
* Ou directement **dans** le dossier du serveur

---

### 🔧 Étapes d’installation serveur

1. Ouvrez le fichier **`Assets.zip`** (avec 7-Zip, WinRAR, etc.)
2. Naviguez à l’intérieur de l’archive jusqu’au chemin suivant :

```text
Assets.zip\Server\Languages\fr-FR
```

3. Remplacez le fichier **`server.lang`** existant par celui fourni dans ce dépôt
4. Sauvegardez l’archive ZIP

✅ La partie serveur du patch est maintenant installée !

---

## ▶️ Finalisation

Une fois les deux parties installées :

* 🔁 **Relancez votre jeu**
* ⚙️ Allez dans les **paramètres** et sélectionnez **Français** comme langue
* 🌐 **Relancez votre serveur** si nécessaire

🎉 Profitez de Hytale en français !

---

## 🛠️ Compatibilité

* Version du jeu : **Hytale (Release / Latest)**
* Client : ✅ Oui
* Serveur local : ✅ Oui
* Serveur dédié : ✅ Oui

---

## 📜 Disclaimer

Ce projet est **non officiel** et n’est **pas affilié à Hypixel Studios**.
Hytale et tous les éléments associés sont la propriété de leurs détenteurs respectifs.

---

## ❤️ Remerciements

Merci à tous ceux qui soutiennent la communauté francophone de Hytale et contribuent à rendre le jeu plus accessible !

Bon jeu à tous ! 🎮🇫🇷
