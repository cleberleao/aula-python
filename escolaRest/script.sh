#!/bin/bash
sudo podman stop django-docker
sudo podman rm django-docker
cd /home/opc/projeto
sudo rm -rf aula-python
git clone https://github.com/cleberleao/aula-python.git
cd /home/opc/projeto/aula-python/escolaRest
sudo podman build -t django-docker .
sleep 10
sudo podman run --name django-docker -d -p 8000:8000 django-docker

sleep 5
sudo podman exec -it django-docker python manage.py migrate
sudo podman exec -it django-docker python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('cleberleao', 'cleberleao@example.com', '@dmin123')"
