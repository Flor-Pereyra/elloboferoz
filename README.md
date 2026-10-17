# 🎬 Cine & Anime Hub en Wollok Game

Catálogo interactivo de películas y animes desarrollado en Wollok.

## 🚀 Cómo ejecutarlo

1. Clona este repositorio en tu computadora.
2. Abre el proyecto utilizando **Wollok Studio** o **VS Code** con la extensión de Wollok.
3. Ejecuta el archivo `src/program.wpgm`.

## 🎮 Controles

- **T**: Ver Todo el catálogo
- **P**: Filtrar solo Películas
- **A**: Filtrar solo Animes
- **X**: Filtrar por Acción
- **F**: Filtrar por Fantasía
-





# 🎬 Cine & Anime Hub | Wollok Edition
¡Bienvenido a **Cine & Anime Hub**! Una aplicación interactiva desarrollada en **Wollok Game** que funciona como un catálogo dinámico para explorar, filtrar y descubrir películas y animes por categorías.
> 🌟 **Nota:** Proyecto desarrollado como interfaz interactiva con motor de objetos en Wollok.
---
## 📌 Vista Previa

| Vista General del Catálogo | Filtrado por Categorías |
| :--- | :--- |
| ![Catálogo Principal](assets/preview-main.png) | ![Filtro Anime](assets/preview-anime.png) |

*(Reemplaza las imágenes de arriba agregando capturas reales a la carpeta `assets/`)*
---
## ✨ Características Principales
* 🏷️ **Categorización Dual:** Clasificación rápida entre **Películas** y **Animes**.
* 🎭 **Filtro por Géneros:** Encuentra títulos por Acción, Sci-Fi, Fantasía y más.
* ⚡ **Reorganización Dinámica:** La grilla del catálogo se redibuja automáticamente en pantalla al aplicar un filtro.
* 🖥️ **Interfaz Estilo Streaming:** Diseño limpio pensado para simular una plataforma de contenido visual.
---
## 🎮 Controles y Navegación
Usa las siguientes teclas dentro de la ventana de Wollok Game para filtrar el catálogo en tiempo real:

| Tecla | Acción / Filtro |
| :--- | :--- |
| <kbd>T</kbd> | Ver **Todo** el catálogo |
| <kbd>P</kbd> | Filtrar por **Películas** |
| <kbd>A</kbd> | Filtrar por **Animes** |
| <kbd>X</kbd> | Filtrar género **Acción** |
| <kbd>F</kbd> | Filtrar género **Fantasía** |

---
## 🛠️ Estructura del Proyecto
```text
catalogo-wollok/
│
├── assets/             # Imágenes, posters (.png) y fondo de pantalla
├── src/
│   ├── elementos.wlk   # Modelo de datos (Clase ItemCatalogo)
│   ├── interfaz.wlk    # Gestor del catálogo, grilla y carteles de UI
│   └── program.wpgm    # Punto de entrada y configuración de Wollok Game
└── README.md           # Presentación del repositorio
