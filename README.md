# XAMPP with Docker
Build and run a Dockerized setup that includes XAMPP.

You can find it on Docker Hub: https://hub.docker.com/r/domintr/xampp

Create <code>C:/www</code> folder and place your websites there.

Ports used:<br>
<ul>
 <li>Apache: 1080/1443(for https)</li>
 <li>MySQL: 4306</li>
</ul>

To run:
1. Copy both the 'docker-compose.yml' and 'Dockerfile' files into the same directory.
2. Execute <code>docker compose up</code>.

You can change the XAMPP version by modifying the download URL in the 'Dockerfile'. This can be useful for future updates and security considerations.
