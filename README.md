# Alexis (Discord) for Docker [![Matrix]][matrix-community] [![Discord]][discord-guild] [![Docker]][docker-image] [![Build]][gitlab] [![Donate]][elypia-donate]
## Docker Images
* [`x.y.z`, `x.y`, `x`, `latest`][dockerfile]

## About Alexis
I'm a Discord chatbot that provides ample functionality for Discord guilds through
utitlities and integrations with third-party services and games.  

This repository puts me in a little container so I can easily be sent around and ran
on any system. If you want to see my chatbot code then you'll want to the [Alexis] repository!

## Getting Started
You should start out by using our official image in a docker-compose file since that'll be easier
to maintain.  

**It's strongly recommended to specify a version number, don't use `latest`; 
I can get updates frequently and have breaking changes or new configurations.**

```yml
version: "3.8"
services:
  alexis:
    image: elypia/alexis-discord:x.y.z
    restart: "unless-stopped"
    environment:
      discord.bot-token: "Required: Discord"

      application.persistence.url: "Required: Database"
      application.persistence.username: "Required: Database"
      application.persistence.password: "Required: Password"

      application.api.osu: "Optional: osu!"
      application.api.steam: "Optional: Steam"
      application.api.cleverbot: "Optional: Cleverbot"
      application.api.twitch.client: "Optional: Twitch"
      application.api.twitch.client-secret: "Optional: Twitch"
      GOOGLE_APPLICATION_CREDENTIALS: "Optional: Google Translate / YouTube"
```

## Open-Source
This project is open-source under the [Apache 2.0]!  
While not legal advice, you can find a [TL;DR] that sums up what
you're allowed and not allowed to do along with any requirements if you
want to use or derive work from this source code!  

[dockerfile]: https://gitlab.com/Elypia/docker-alexis-discord/blob/master/Dockerfile "Dockerfile for Alexis Build"

[matrix-community]: https://matrix.to/#/+elypia:matrix.org "Matrix Invite"
[discord-guild]: https://discordapp.com/invite/hprGMaM "Discord Invite"
[docker-image]: https://hub.docker.com/r/elypia/alexis-discord "Project on Docker"
[gitlab]: https://gitlab.com/Elypia/docker-alexis-discord/commits/master "Repository on GitLab"
[elypia-donate]: https://elypia.org/donate "Donate to Elypia"
[Alexis]: https://gitlab.com/Elypia/alexis "Alexis on GitLab"
[Apache 2.0]: https://www.apache.org/licenses/LICENSE-2.0 "Apache 2.0 License"
[TL;DR]: https://tldrlegal.com/license/apache-license-2.0-(apache-2.0) "TL;DR of Apache 2.0"

[Matrix]: https://img.shields.io/matrix/elypia-general:matrix.org?logo=matrix "Matrix Shield"
[Discord]: https://discordapp.com/api/guilds/184657525990359041/widget.png "Discord Shield"
[Docker]: https://img.shields.io/docker/pulls/elypia/alexis-discord?logo=docker "Docker Shield"
[Build]: https://gitlab.com/Elypia/docker-alexis-discord/badges/master/pipeline.svg "GitLab Build Shield"
[Donate]: https://img.shields.io/badge/elypia-donate-blueviolet "Donate Shield"
