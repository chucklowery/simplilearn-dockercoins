
          set -x
          
          for service in hasher rng webui worker
            do
              docker build --tag chucklowery/simplilearn-dockercoins:latest-${service}-testing ${service}
            done
            
          for service in hasher redis rng
            do
              docker network create ${service}
            done
          
          # --volumes XXX:/data will connect /data inside the container with the following folder outside the container: /var/lib/docker/volumes/XXX
          docker run --detach --name redis --network redis --volume redis:/data redis
          
          for service in hasher rng
            do
              docker run --detach --name ${service} --network ${service} chucklowery/simplilearn-dockercoins:latest-${service}-testing
            done
            
          docker run --detach --name worker --network redis chucklowery/simplilearn-dockercoins:latest-worker-testing
          for service in hasher rng
            do
              docker network connect ${service} worker
            done
          
          docker run --detach --name webui --network redis chucklowery/simplilearn-dockercoins:latest-webui-testing --publish 80:8080
