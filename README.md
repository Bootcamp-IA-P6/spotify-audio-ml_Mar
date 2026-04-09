# 🎵 Spotify Tracks Classification: 

[![Python](https://img.shields.io/badge/Python-3.12-blue.svg)](https://www.python.org/)
[![Docker](https://img.shields.io/badge/Docker-Enabled-blue.svg)](https://www.docker.com/)
[![uv](https://img.shields.io/badge/Package_Manager-uv-orange.svg)](https://github.com/astral-sh/uv)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📋 Descripción del Proyecto
Este proyecto implementa un sistema de clasificación automática de canciones utilizando el dataset de Spotify (114,000 registros). El objetivo es doble: 
1.  **Filtro Parental (Binario):** Detectar contenido explícito basado en audio features.
2.  **Clasificación de Géneros (Multiclase):** Categorizar canciones entre Pop, Rock, Hip-hop y Classical.

El enfoque principal es la **Ingeniería de Datos**, asegurando la reproducibilidad total del entorno mediante contenedores y gestión de dependencias moderna.

---

## 🛠️ Stack Tecnológico
- **Entorno:** Linux (Ubuntu)
- **Contenedorización:** Docker (Aislamiento total del motor de ejecución).
- **Gestión de Paquetes:** `uv` (Instalación ultra-rápida y fijado de versiones mediante `uv.lock`).
- **Análisis de Datos:** `Pandas`, `NumPy`.
- **Machine Learning:** `Scikit-learn` (Logistic Regression).
- **Visualización:** `Matplotlib`, `Seaborn`.
- **Ingestión:** `KaggleHub` para descarga automatizada de datasets.

---

## 🏗️ Arquitectura del Sistema
El proyecto separa el **Motor de Cálculo** (Docker) de la **Interfaz de Usuario** (Jupyter Notebook en Navegador), permitiendo que el procesamiento ocurra en un entorno controlado mientras el ingeniero supervisa los resultados de forma visual.

### Estructura de Carpetas
```text
spotify_pro/
├── data/           # Ignorado en Git (se descarga automáticamente)
├── notebooks/      # Notebooks interactivos de experimentación
├── Dockerfile      # Configuración de la imagen del contenedor
├── pyproject.toml  # Definición de dependencias
└── README.md       # Documentación técnica

🚀 Instalación y Ejecución
Requisitos Previos

    Docker instalado.

    Git instalado.

Pasos para Replicar

    Clonar el repositorio:
    

    git clone https://github.com/TU_USUARIO/spotify-audio-ml.git
    cd spotify-audio-ml

    Construir la imagen de Docker:
   

    docker build -t spotify-pro .

    Lanzar el contenedor:
   

    docker run -p 8888:8888 -v $(pwd):/app spotify-pro

    Acceder al entorno:
    Copia el enlace con el token que aparecerá en tu terminal y pégalo en tu navegador.

📊 Metodología y Resultados
1. Ingestión y Calidad

Se implementó un pipeline de limpieza que elimina registros nulos (3 de 114,000) y estandariza las variables numéricas utilizando StandardScaler. Esto previene que variables con escalas grandes (como duration_ms) dominen injustamente el modelo sobre variables de escala 0-1 (como danceability).
2. Modelo A: Detección de Contenido Explícito

    Desafío: Desbalance de clases (solo el 8.5% es explícito).

    Solución: Uso de class_weight='balanced' en la Regresión Logística.

    Resultado: Incremento del Recall de la clase minoritaria de 0.09 a 0.72. El modelo ahora es un detective eficaz para filtros parentales.

3. Modelo B: Clasificación de Géneros

    Accuracy Global: 71% (Superando el baseline de azar del 25%).

    Insights:

        El género Classical es el más distintivo (F1-Score: 0.93) debido a su baja energía y alta densidad acústica.

        El Pop presenta el mayor reto (F1-Score: 0.51) por su naturaleza híbrida que se confunde con Rock y Hip-hop.

📝 Conclusiones

Este proyecto demuestra cómo la ingeniería de datos y la configuración correcta del entorno son tan vitales como el modelo mismo. La capacidad de detectar sesgos (como el desbalance de clases) y corregirlos mediante pesos en el modelo es la clave para soluciones de IA responsables y útiles en el mundo real.

Inspirado por el método de aprendizaje de Richard Feynman.


### ¿Qué hace a este README "Senior"?
1.  **Badges:** Los escudos de arriba dan un aspecto profesional instantáneo.
2.  **Instrucciones Claras:** Cualquiera puede clonar tu proyecto y correrlo en 3 pasos.
3.  **Justificación Técnica:** No solo dices qué hiciste, sino **por qué** (ej. por qué usaste `StandardScaler` o `class_weight`).
4.  **Enfoque en Resultados:** Destacas el "Recall" y el "Accuracy", que es lo que le interesa al negocio.
