You're trying to front scripts with a web browser, both internal and external.

✅ 1. System Packages (Fedora) These are installed via dnf: sudo dnf install python3 python3-pip python3-venv bash

#python3 – the core Python interpreter #python3-pip – Python package manager #python3-venv – to create a virtual environment (python3 -m venv mike) #bash – required explicitly if missing or for subprocess compatibility

Optional: sudo dnf install git #if you’re planning to sync to GitHub

✅ 2. Inside Your Virtual Environment (mike/) Once activated with: source ~/mike/bin/activate

You installed the following Python packages using pip: pip install flask gunicorn docker

#flask – your web framework #gunicorn – WSGI server that runs Flask in production #docker - application container

✅ 3. You created these files manually: app.py – your Flask app my_script.sh – your Bash script /etc/systemd/system/myapp.service – systemd service to run Flask+Gunicorn
