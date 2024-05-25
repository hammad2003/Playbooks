#!/bin/bash

mensaje_smai() {
  figlet "SMAI    CLIENT"
}

mensaje_smai

# Función para mostrar un mensaje de advertencia en ASCII usando figlet
mensaje_password() {
  figlet "password"
}

# Instalación de herramientas necesarias para la configuración remota
sudo apt install -y openssh-server ansible sshpass

# Generación de clave SSH para acceso seguro
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N "" -q <<< y

# Copia de la clave pública al servidor remoto
mensaje_password
ssh-copy-id -f -i ~/.ssh/id_rsa.pub usuario@$(hostname -I | cut -d ' ' -f1)

# Preparación del entorno de Ansible
if [ ! -d /etc/ansible ]; then
  sudo mkdir -p /etc/ansible
fi

if [ ! -f /etc/ansible/hosts ]; then
  sudo touch /etc/ansible/hosts
fi

# Configuración del servidor en el archivo de hosts de Ansible
echo "[clientes]" | sudo tee -a /etc/ansible/hosts
echo "$(hostname -I | cut -d ' ' -f1)" | sudo tee -a /etc/ansible/hosts

# Crear archivo ansible.cfg si no existe
print_message "Creando archivo ansible.cfg si no existe..." "$BLUE"
if [ ! -f /etc/ansible/ansible.cfg ]; then
  sudo touch /etc/ansible/ansible.cfg
fi

# Añadir configuración para deshabilitar la comprobación de la clave de host
print_message "Configurando Ansible para deshabilitar la comprobación de clave de host..." "$BLUE"
echo "[defaults]" | sudo tee -a /etc/ansible/ansible.cfg
echo "host_key_checking = False" | sudo tee -a /etc/ansible/ansible.cfg

# Ejecución de la configuración del cliente mediante Ansible
mensaje_password
sudo ansible-playbook configuration_client.yml -k -b -K