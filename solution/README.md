# Solution for CSV Server Task

## Steps Executed:

1. Run the container image `infracloudio/csvserver:latest` in the background:
    
    docker run -d --name csvserver infracloudio/csvserver:latest
    

2. Check if the container is running:
    
    docker ps -a
    docker logs csvserver


3. Write the bash script `gencsv.sh`:
    
    vi  gencsv.sh
    chmod +x gencsv.sh
    

4. Generate the `inputFile`:
    
    ./gencsv.sh 2 8
    

5. Run the container again with `inputFile` mounted:
    
    docker run -d --name csvserver -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
    

6. Get shell access to the container and find the port:
    
    docker exec -it csvserver /bin/sh
    netstat -tuln | grep LISTEN
    

7. Stop and delete the running container:
    
    docker stop csvserver
    docker rm csvserver


8. Run the container with environment variable `CSVSERVER_BORDER` and expose the port 9393:

    docker run -d --name csvserver -v $(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
    

9. Verify the application is running:
    - Visit `http://54.91.252.89:9393/:9393`.

