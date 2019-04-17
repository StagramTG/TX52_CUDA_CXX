# Projet TX52 - P19

**Auteur** : Thomas Gredin (Ettudiant ingénieur Informatique spécialité Imagerie, Interaction et Réalité Virtuelle)<br>
**Tuteur** : Jean-Charles Créput (Enseignant chercheur à l'UTBM)

Projet réalisé dans le cadre de l'UV TX52.

## Buts
- Remplacer le système de gestion de projet actuel (QMake), en profiter pour utiliser également une autre bibliothèque que Qt pour l'interface graphique. 
- Repenser le moteur de rendu OpenGL.
- Pouvoir charger directement une vidéo pour effectuer le traitement.

## Etat actuel du projet
Le projet est actuellement sous QMake et utilise Qt pour l'interface utilisateur. Utilisation d'une compilation séparée pour la librairie contenant les kernels CUDA.

## Utilisation de ce projet
Pour pouvoir utiliser ce projet plusieurs outils sont nécessaires :
- Visual C++ Build Tools (Pour compiler les sources C++).
- CUDA Toolkit (Pour compiler les sources CUDA).
- CMake (Génération de projet pour l'OS courant).
- VCPKG (Gestion des bibliothèques tierces).

**Les outils sont à installer dans cette ordre. A noter que pour pouvoir compiler vcpkg il est important d'avoir le package anglais de Visual C++ Build Tools !**

> **NOTE** : Les outils de compilation ne sont plus disponibles en standalone... Il faut donc maintenant installer la version community de visual studio (ou entreprise) pour avoir accès à ces outils. [Page de téléchargement](https://visualstudio.microsoft.com/fr/downloads/?rr=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fcpp%2Fbuild%2Fwalkthrough-compiling-a-native-cpp-program-on-the-command-line%3Fview%3Dvs-2019).
**Ne pas oublier de cocher les outils C++ et d'inclure le package de langage anglais !**

Ensuite il faut s'assurer que :
1. Les outils de développement de Visual C++ Build Tools sont accesssible depuis le terminal (dans la variable système PATH ou par l'utilisation d'un alias qui appelle un script de mise en place des variables systèmes pour l'instance du terminal en cours).
2. De même pour le compilateur CUDA (nvcc).
3. De même pour CMake
4. vcpkg ne doit pas être accessible en global, il offre un fichier de configuration CMake permettant de renseigner les informations sur les différentes bibliothèques installées. 

### Installation des bibliothèques avec VCPKG
Pour installer VCPKG il suffit de cloner [le dépôt](https://github.com/Microsoft/vcpkg) et de lancer le script ```bootstrap-vcpkg.bat``` depuis un terminal.

Pour installer les bibliothèques nécessaires avec VCPKG il suffit d'ouvrir un terminal dans le répertoire ou il est installé et utiliser cette commande :
```
./vcpkg.exe integrate install
./vcpkg.exe install glfw3:x64-windows-static glm:x64-windows-static glew:x64-windows-static imgui:x64-windows-static glfw3:x64-windows glm:x64-windows glew:x64-windows imgui:x64-windows
```

> Il faudra réaliser une modification dans les fichiers ```CMakeLists.txt``` pour que le chemin vers le fichier de configuration CMake de votre installation VCPKG.