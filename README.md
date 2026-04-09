# 🎵 Spotify Audio Classification - Data Engineering Project

Este proyecto utiliza Machine Learning para clasificar canciones de Spotify basándose en sus características de audio.

## 🚀 Tecnologías
- **Docker:** Contenedorización del entorno.
- **uv:** Gestión de paquetes y entorno Python.
- **Scikit-learn:** Modelos de Regresión Logística.
- **KaggleHub:** Ingestión automática de datos.

## 🛠️ Cómo ejecutar
1. Clona el repositorio.
2. Construye la imagen: `docker build -t spotify-pro .`
3. Lanza el contenedor: `docker run -p 8888:8888 -v $(pwd):/app spotify-pro`
4. Abre el enlace con el token en tu navegador.

## 📈 Resultados
- **Filtro Parental (Binary):** Recall de 0.72 en detección de contenido explícito.
- **Géneros (Multiclass):** Accuracy de 0.71 (Classical, Pop, Rock, Hip-hop).