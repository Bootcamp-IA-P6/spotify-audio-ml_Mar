FROM python:3.12-slim

# Instalamos uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Evitamos que Python genere archivos basura .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copiamos archivos de configuración
COPY pyproject.toml uv.lock ./

# Instalamos dependencias
RUN uv sync --frozen

# Copiamos el resto
COPY . .

# Comando para lanzar Jupyter
CMD ["uv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]