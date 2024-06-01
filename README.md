# **🚀 Configuración de Cliente y Servidor 🛠️**

## Descripción

Esta guía proporciona instrucciones detalladas para configurar tanto un cliente como un servidor utilizando scripts y herramientas de automatización. Los scripts están diseñados para instalar y configurar el entorno necesario para la gestión remota y la implementación de aplicaciones, especialmente enfocadas en entornos de juegos y servidores web.

> [!NOTE]
> ## Requisitos
> - **Cliente:** 
>   - Linux (Ubuntu o distribución similar).
>   - Acceso a Internet.
> - **Servidor:**
>   - Linux (Ubuntu o distribución similar).
>   - Acceso a Internet.

## 🛠️ Installation / Configuración de SMAI

1. **Clonar el Repositorio:**
   Clona o descarga el repositorio de GitHub en el cliente.
   ```bash
   https://github.com/hammad2003/Scripts-Playbooks.git

3. **Ejecutar Script de Instalación:**
   Ejecuta el script `run.sh` para configurar el servidor o cliente. Asegúrate de dar permisos de ejecución al script con el comando:
    ```bash
    chmod u+x install_client.sh
    ```
    ```bash
    chmod u+x install_server.sh
    ```
    ```bash
    chmod u+x run.sh && ./run.sh
    ```
    
   Al ejecutar `run.sh`, se te presentará un menú con dos opciones:
   - **Configurar el Cliente:** Instala el TLauncher (Minecraft) en el cliente.
   - **Configurar el Servidor SMAI:** Configura una página para alojar servidores de Minecraft con SMAI.
