Playbook Modules:
- ping
- file
- hosts
- become
- state

# PLAYBOOK.yaml
```
---

- name: my-playbook  #giving name for the folder
  hosts: all         # where should the file need to delpoy/execute like which node
  become: true       # if we want to run with root permission
  tasks:
       - name: creating directory   # what task we are creating
         file:
            name: ansible-test      # giving name for folder
            path: /root/            # giving location where the file to create
            state: directory        # considering what kind of directory/touch file
  
       - name: Create a directory
         file:
           name: ansible-test5
           path: /root/
           state: directory

       - name: Add content to the file
         copy:
           dest: /root/ansible-test5/mytest5
           content: |
              Hello good morning. How are you. Creating Ansible files.

       - name: Copy file to directory
         copy:
           src: filetest-005     # copying the file from Master_node to slave_node
           dest: /root/ansible-test5
  ```
## Deploy the cli in Master node
```
ansible-playbook playbook.yaml
```
<img alt="Image" src="https://github.com/user-attachments/assets/fcec9bec-5b44-4e0d-836b-5bd4c7bf4316" width="1000px">

## Slave node - output
<img alt="Image" src="https://github.com/user-attachments/assets/d626af2d-cd21-42bc-9e03-8d7354c6ce31" width="600px">

