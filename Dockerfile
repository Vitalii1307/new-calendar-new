FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt /app/

# Install necessary packages
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

# Set environment variable for Django settings module
ENV DJANGO_SETTINGS_MODULE=mycalendar_project.settings

# Collect static files (if needed)
# RUN python manage.py collectstatic --noinput

# Expose the port your app runs on
EXPOSE 8000

# Start the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "mycalendar_project.wsgi:application"]
