# SSH Connection Setup Between Two Ubuntu Servers Using Docker

This project demonstrates setting up a secure SSH connection between two Ubuntu servers using Docker containers. One server acts as the SSH server (`openssh-server`), and the other server acts as the SSH client (`openssh-client`).

## Prerequisites

- Docker installed on your system.
- Basic understanding of Docker and SSH.

## Project Structure

The project includes the following files:

- **dockerfile.server**

  - Dockerfile for setting up the SSH server container (`openssh-server`).
  - Installs OpenSSH server, allows root login, configures password authentication, and sets up an entrypoint script to handle root password setup and SSH service startup.

- **entrypoint.sh**

  - Bash script used by the SSH server container's entrypoint.
  - Creates necessary directories, sets root password from `ROOT_PASSWORD` environment variable, and starts the SSH service in the foreground.

- **dockerfile.client**
  - Dockerfile for setting up the SSH client container (`openssh-client`).
  - Installs OpenSSH client to establish SSH connections.

## Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Build Docker Images:**
   
  - Build the SSH server image:
    
    ```
    docker build -t ssh-server -f Dockerfile.server .
    ```
    
  - Build the SSH client image:
    
    ```
    docker build -t ssh-client -f Dockerfile.client .
    ```

3. Run SSH Server Container:

   ```
   docker run -d --name ssh-server-container -e ROOT_PASSWORD=<your-root-password> -p 2222:22 ssh-server 
  
4. Run SSH Client Container:

   ```
   docker run -it --name ssh-client-container --link ssh-server-container ssh-client
   ```

5. Connect from SSH Client to SSH Server:

   ```
   ssh root@<IPAddress of SSH Server>
   ```

- To get IP Address of SSH Server, Run
    
    ```
    docker inspect <SSH Server name> | grep IPAddress
    ```

**You should now be connected to the SSH server container as root. You can interact with the server as needed.**
