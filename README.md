# Vidgrab

Vidgrab will automatically back up channels/videos on any site supported by [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a fork of youtube-dl)

Optional environment variable 'DOWNLOAD_RATE' will set maximum download rate. See youtube-dl manpage for details.

Optional environment variable 'DOWNLOAD_SUBS' - set to 'yes' (default value) to download and embed any subtitles. Set to 'no' to ignore subtitles.

Optional environment variable 'APPRISE_SERVICE' -if set, the container will send notifications to chosen service via Apprise.

Example docker-compose entry:

```
vidgrab:
  image: digitalcraig/vidgrab
  container_name: vidgrab
  environment:
    - DOWNLOAD_RATE=500K
    - APPRISE_SERVICE=discord://webhook_id/webhook_token
  volumes:
    - /path/to/download/directory:/downloads
  restart: unless-stopped
```

Videos will be downloaded to the /downloads directory. Put all the channels you want to automatically download in a file named channels.txt in the /downloads directory. Use an extension like [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search) to save cookies.txt to acccess videos requiring authentication.

## Use with Plex
Videos can be downloaded and played with Plex by creating a TV Show library and installing the [Extended Personal Media Scanner](https://bitbucket.org/mjarends/plex-scanners). See [scanner documentation](https://bitbucket.org/mjarends/extendedpersonalmedia-agent.bundle/src/master/README.md) for details.


## Credits
Based on [Docker image for yt-dlp](https://github.com/abstrakct/docker-yt-dlp), originally forked from Originally forked from timlinden