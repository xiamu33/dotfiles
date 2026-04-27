if not status is-interactive
    exit
end

# Docker / Docker Compose abbreviations
abbr -a d docker
abbr -a db "docker build"

abbr -a dils "docker image ls"
abbr -a dirm "docker image rm"
abbr -a dip "docker image prune"

abbr -a dcls "docker container ls"
abbr -a dclsa "docker container ls -a"

abbr -a dps "docker ps"
abbr -a dpsa "docker ps -a"
abbr -a drm "docker rm"
abbr -a drmi "docker rmi"
abbr -a drun "docker run --rm -it"
abbr -a dex "docker exec -it"
abbr -a dstart "docker start"
abbr -a dstop "docker stop"
abbr -a drestart "docker restart"
abbr -a dnet "docker network ls"
abbr -a dvol "docker volume ls"
abbr -a dclean "docker system prune -f"

abbr -a dc "docker compose"
abbr -a dcb "docker compose build"
abbr -a dcd "docker compose down"
abbr -a dcl "docker compose logs -f"
abbr -a dcps "docker compose ps"
abbr -a dcpull "docker compose pull"
abbr -a dcup "docker compose up"
abbr -a dcupd "docker compose up -d"
abbr -a dcrestart "docker compose restart"
