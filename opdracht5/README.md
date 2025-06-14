# IAC les03 opdracht 5
Ruben Baas s1190828


## Opdracht
In deze opdracht heb ik een Ansible playbook geschreven dat alle VM’s op een Proxmox Hypervisor back-upt. Hiervoor is gebruik gemaakt van de community module `community.general.proxmox_kvm`.

Het doel van dit playbook is om op geautomatiseerde wijze snapshots of back-ups van VM's te maken, wat belangrijk is voor disaster recovery en systeembeheer.


## Benodigdheden
- **Proxmox API host**: `node1`
- **API gebruiker**: `test`
- **API wachtwoord**: `test`
- **Backup opslaglocatie**: `backup_vm`
- **Vereiste Ansible module**: `community.general`


Installeer de benodigde collectie met:

```bash
ansible-galaxy collection install community.general
```

## Wat doet de code:

De Proxmox API wordt benaderd via Ansible.
Voor elke VM-ID op node1 wordt een back-up taak uitgevoerd.
De output wordt bewaard op backup_vm.
Het gebruik van een loop zorgt ervoor dat het dynamisch is, ongeacht hoeveel VM’s er draaien.



## Bronnen

AI prompt: Zorg dat er bij het deployen van deze VM automatisch een inventory voor Ansible wordt aangemaakt.
https://chatgpt.com/share/682f719d-12dc-8007-99e2-92b8e738700e
AI prompt : Maak voor opdracht 5 van week 3 de readme verder af
https://chatgpt.com/share/684d7be1-6b0c-8007-9332-b22ebbb58eb5
Ansible apt update all packages using apt module en install package
https://www.cyberciti.biz/faq/ansible-apt-update-all-packages-on-ubuntu-debian-linux/
Een user test toevoegen op de VM
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html
Lokaal bestand kopieeren
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html
Ansible cronjob
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/cron_module.html
Ansible start service
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/service_module.html
Proxmox backup playbook
https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_backup_module.html#examples 