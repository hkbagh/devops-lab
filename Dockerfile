# Start with a tiny version of Python
FROM python:3.9-slim

# Create a folder for our app
WORKDIR /app

# Install the "Flask" web framework
RUN pip install flask

# Copy our code into the image
COPY app.py .

# Run the app when the container starts
CMD ["python", "app.py"]
