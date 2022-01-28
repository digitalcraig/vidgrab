# Vidgrab

Vidgrab will automatically back up channels/videos on any site supported by [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a fork of youtube-dl):

Environment variables:
   - DOWNLOAD_RATE - set maximum download rate.
   - DOWNLOAD_SUBS - set to 'yes' (default value) to download and embed any subtitles. Set to 'no' to ignore subtitles.
   - APPRISE_SERVICE - if set, the container will send notifications to chosen service via Apprise. See [Apprise documentation](https://pypi.org/project/apprise/) for details.
   - SLEEP_INTERVAL - default to 1d (1 day) to sleep before restarting after downloads complete.
   - EXTRA_ARGS - pass any additional arguments to [yt-dlp](https://github.com/yt-dlp/yt-dlp).

Files and directories in volume mounted at /downloads:
   - cookies.txt (created if missing) - Use an extension like [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search) to save cookies.txt to acccess videos requiring authentication.
   - channels.txt (created if missing) - URLs, one per line, of individual videos, playlists, or channels to be downloaded.
   - archive.txt (created if missing) - Saves ID of downloaded videos so they will not be downloaded again.
   - Videos will be downloaded:
     - uploader/uploader - upload_date - title.ext
  
## Docker Compose
Example docker-compose.yaml:

```
vidgrab:
  image: digitalcraig/vidgrab
  container_name: vidgrab
  environment:
    - DOWNLOAD_RATE=500K
    - APPRISE_SERVICE=discord://webhook_id/webhook_token
    - SLEEP_INTERVAL=1d
  volumes:
    - /path/to/download/directory:/downloads
  restart: unless-stopped
```

Example docker-compose.yaml which only downloads videos from the past week from a playlist:

```
vidgrab:
  image: digitalcraig/vidgrab
  container_name: vidgrab
  environment:
    - DOWNLOAD_RATE=500K
    - APPRISE_SERVICE=discord://webhook_id/webhook_token
    - SLEEP_INTERVAL=1d
    - EXTRA_ARGS="--dateafter now-1week --playlist-reverse"
  volumes:
    - /path/to/download/directory:/downloads
  restart: unless-stopped
```

To execute in background, run docker-compose with -d :

```
$ docker-compose up -d
```

## Use with Plex
Videos can be downloaded and played with Plex by creating a TV Show library and installing the [Extended Personal Media Scanner](https://bitbucket.org/mjarends/plex-scanners). See [scanner documentation](https://bitbucket.org/mjarends/extendedpersonalmedia-agent.bundle/src/master/README.md) for details.


## Credits
Based on [Docker image for yt-dlp](https://github.com/abstrakct/docker-yt-dlp), originally forked from timlinden.