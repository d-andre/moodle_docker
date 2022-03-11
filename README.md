# Deployment

- Make a copy of .env_example as .env and edit accordingly
- If in local environment, add domain in hosts file
- Create empty directories: src, moodledata, mysql
- Run: docker-compose up -d --build to build and run image