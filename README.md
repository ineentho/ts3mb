## Util scripts

###

### List window ids and names
```bash
for winid in $(xdotool search --name .\*); do echo $winid $(xdotool getwindowname $winid); done<Paste>
```

### Rebuild and run
```bash
docker rm -f ts3mb; docker build -t ts3mb .; docker run -it -e "SERVER=ts3server://voice.teamspeak.com -e "NAME=testnamn" -e "WEBSITE=https://www.youtube.com/watch?v=ueupsBPNkSc" --name ts3mb -p 5900:5900 ts3mb ./debug
```
