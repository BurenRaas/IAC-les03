# IAC Les 03 - Opdracht 1 tm 4
Ruben Baas s1190828

## Opdrachtomschrijving

Met behulp van **Terraform** en **Ansible** is een infrastructuur uitgerold bestaande uit:
- Twee **webservers** waarop automatisch **Nginx** wordt geïnstalleerd.
- Eén **databaseserver** waarop automatisch **MariaDB** wordt geïnstalleerd.
- Automatische aanmaak van een **Ansible inventory** tijdens deployment.
- Gebruik van een **SSH-key** voor inloggen op de VM’s.
- **Alle VMs** moeten:
  - Automatisch worden geüpdatet.
  - `/etc/hosts` aanpassen met een verwijzing naar de ESXi-host (`esxi`).
  - Een **user 'test'** bevatten.
  - Een **lokaal bestand (`main.tf`)** bevatten dat wordt gekopieerd naar de VM.
- Een **Ansible playbook** maakt dagelijks een backup van `/etc/` en `/var/www/` via een **cronjob**, en kopieert die naar `/tmp`.

---
## Uitvoeren van de code

1. **Terraform uitrollen**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
   Dit maakt de virtuele machines aan en genereert automatisch het `inventory.ini` bestand voor Ansible.

2. **Ansible uitvoeren**
   ```bash
   ansible-playbook -i inventory.ini playbook.yml
   ```

## Belangrijkste onderdelen

- **Inventory-automatisering**: De VMs worden gedetecteerd en automatisch toegevoegd aan een Ansible inventory. Dit bestand wordt gegeneerd in de main.tf.
- **Roles & Tasks**:
In het inventory.ini bestand worden de vms onderverdeeld in roles. Via het playbook krijgen de vms:
  - Webservers krijgen `nginx` via `apt`.
  - De databaseserver krijgt `mariadb-server`.
  - Via het `user`-module wordt een gebruiker `test` toegevoegd.
  - De `copy`-module plaatst het bestand `main.tf` op de VM.
  - Een `cronjob` maakt dagelijks een back-up van `/etc/` en `/var/www/` naar `/tmp`.

---

## Bronnen

Gebruikte bronnen:

- Ansible apt update:  
  https://www.cyberciti.biz/faq/ansible-apt-update-all-packages-on-ubuntu-debian-linux/
- Ansible user module:  
  https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html
- Lokaal bestand kopiëren:  
  https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html
- Ansible service starten:  
  https://docs.ansible.com/ansible/latest/collections/ansible/builtin/service_module.html
- Backup playbook inspiratie:  
  https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_backup_module.html#examples
- code uit opdracht 2A van les02

- AI prompt: Zorg dat er bij het deployen van deze VM automatisch een inventory voor Ansible wordt aangemaakt.
https://chatgpt.com/share/682f719d-12dc-8007-99e2-92b8e738700e
- AI prompt: Ansible apt foutmelding oplossen
https://chatgpt.com/share/682f8b33-42d8-8007-bfbd-e5f8278908e9
- AI pompt: Schrijf de readme.md op basis van deze code
https://chatgpt.com/share/682f9ab9-3b5c-8007-bd17-461ac29b633e