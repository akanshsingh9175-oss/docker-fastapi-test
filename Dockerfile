FROM python:3.9-slim

# Set the working directory to the project root
WORKDIR /usr/src/app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all files (app folder, data folder, etc.)
COPY . .

# Ensure Python can see the 'app' directory as a package
ENV PYTHONPATH=/usr/src/app

# Start the app using the module.variable syntax
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
