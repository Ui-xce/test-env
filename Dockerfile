FROM python:3.12-slim AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM base AS test
RUN pip install --no-cache-dir pytest
COPY . .
RUN pytest -v

FROM base AS runtime
COPY . .
CMD ["python", "app.py"]
