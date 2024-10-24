AutoGen Docker®
========================
Copyright (C) Rolustech. All rights reserved.

# Supported stacks
- Python 3.11

## Details of stacks are in the table below:

| Stack             | Description                                                                          |
|-------------------|--------------------------------------------------------------------------------------|
| Python 3.11       | Autogen, ollama                                                                      |


## Branches

 * master/main will have the latest release branch

# Steps to Setup the Deveolpment Environment

### **Prerequisites:** 
- You need to have Docker and Composer installed on your machine before proceeding with the setup.
- User should be in the docker group.
    - To check if the user is in the docker group or not, run the command ```groups $USER```, if not, then run ```usermod -aG docker $USER```. If docker is not in the listed groups, then run ```groupadd docker``` and add user now using above-mentioned commands.
- Following directories must be there
    - volumes/app/
    - volumes/ollama_models/
<br>

* **Step 1:** Run commands 
    ```sh
    git clone https://github.com/RT-AI-LAB/autogen.git
    cd autogen
    git checkout master
    docker compose up -d
    ```

* **Step 2:** once dockers are up and running run 
    ```sh
    docker exec -it ollama ollama run llama3
    ```
    If the mentioned model i.e. llama3 is not in volumes/ollama_models then it will take time to download

* **Step 3:** Once the docker images are fetched, you should see containers up and running on your system. You can verify which containers are running via ***docker ps*** command

    ```sh
    docker ps
    ```
    Containers and their port numbers are listed below for reference. They can be different depending on your configuration. You can see which host ports are mapped to container ports in the docker-compose.yml files.

    | Container Name           | Description                                                          | Host Ports    |
    |--------------------------|----------------------------------------------------------------------|---------------|
    | autogen                  | Python base image and have the autogen installed with some examples  | 8000          |
    | ollama                   | ollama container to run ollama models                                | 11435         |
    
* **Step 4:** After you've verified that all the containers are up and running, Hit 
    ```sh
    docker exec -it autogen bash
    /usr/src/app/env/bin/python example1.py
    ```

`Important: Following folders are important and must be there if you deleted them then please add.`

    | Folder                | Mapped to                                                 |
    |-----------------------|-----------------------------------------------------------|
    | volumes/app           | /app   in autogen container                               |
    | volumes/ollama_models | It has the data models                                    |
