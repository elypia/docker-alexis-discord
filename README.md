# Alexis (Discord) for Docker [![Matrix]][matrix-community] [![Discord]][discord-guild] [![Docker]][docker-image] [![Build]][gitlab] [![Donate]][elypia-donate]
## Docker Images
* [`x.y.z`, `x.y`, `x`, `latest`][dockerfile]

## About Alexis
I'm a Discord chatbot that provides ample functionality for Discord guilds through
utitlities and integrations with third-party services and games.  

This repository puts me in a little container so I can easily be sent around and ran
on any system. If you want to see my chatbot code then you'll want to the [Alexis] repository!

## Getting Started
**It's strongly recommended to specify a version number, don't use `latest`; 
I can get updates frequently can and have breaking changes or new configurations.**

The Discord bot token, represented by the `discord.bot-token` environment variable is
always required in order to run.

I support two databases, [MySQL], and [H2].  
If you're just testing, or after the most simple configuration possible, then you can use
the embedded H2 database which is bundled in the image.

It's **strongly** recommended to specify the following environment variables for 
any production setup in order to configure the image to use MySQL instead of H2.
* `application.persistence.url`
* `application.persistence.username`
* `application.persistence.password`
* `application.persistence.dialect`
* `application.persistence.driver`

### Docker Compose
It's recommended to use Docker Compose if available to have a cleaner configuration
and to make it more expensive, such as if you want to run your MySQL database through 
the `docker-compose.yml` as well.

A bare minimum configuration can be set up like the following.

```yml
version: "3.8"
services:
  alexis:
    image: elypia/alexis-discord:x.y.z
    volumes:
      - "./persistence:/home/alexis/persistence"
    environment:
      discord.bot-token: "YOUR DISCORD BOT TOKEN"
```

### Docker
To use the embedded database, just run me normally and specify a volume where 
the persistent data can get stored.

```bash
docker run -t                                 \
  -e "discord.bot-token={BOT_TOKEN}"          \
  -v "./persistence:/home/alexis/persistence" \
  elypia/alexis-discord:x.y.z
```

## Docker Environment Variables
The Docker image can be configured though environment varaibles, the following will run through all available
environment variables that can influence runtime.

### `discord.bot-token`
This is the only **required** configuration and specifies the Discord bot token to use when
authenticating your bot. If you don't have a bot token, you should visit the Discord Developer Portal
to create and application to generate a bot token you can use.  
You can find out more by reading the [Discord Developer Documentation].

### `application.persistence.url`
This is the URL to connect to a custom MySQL instance, this is not required but is strongly recommended
for a production setup.

### `application.persistence.username`
The username for the user that should connect to the database, this is required if a custom
database connection will be used.

### `application.persistence.password`
The password for the user that should connect to the database, this is required if a
custom database connection will be used.

### `application.persistence.dialect`
The dialect that should be used when connecting to the database. This should typically be one of the following
depending on if you're using MySQL 5.7, or MySQL 8.
* `org.hibernate.dialect.MySQL57Dialect`
* `org.hibernate.dialect.MySQL8Dialect`

### `application.persistence.driver`
This must be set to `com.mysql.cj.jdbc.Driver`, if connecting to a MySQL instance.

### `application.api.steam`
The optional Steam API key which can be obtained from the Steam API. This enables the Steam module
which provides all Steam commands. The module will be disbaled if this is not specified.  
If you don't have one, you can login and find out how to obtain one from the [Steam Web API Documentation] page.

### `application.api.osu`
Your osu! API key to enable the osu! module.  
You can visit the [osu!api wiki] for information on how to get an API key.

### `application.api.cleverbot`
Your Cleverbot API key if you want to enable the Cleverbot module.  
You can get an API key from the official [Cleverbot API] website.

**This is a paid API, there is no way to have this module enabled without spending money.**

### `application.api.twitch.client-id`
Your Twitch client ID to enable the Twitch module. This is required in order to enable the Twitch module
and any Twitch related functionality such as live stream notifications.
You can create an application and get Twitch API credentials from the [Twitch Developers] site.

### `application.api.twitch.client-secret`
Your Twitch client secret, required if the Twitch module is enabled.
If you specify a Twitch client ID, this this is required, otherwise the bot will throw an error
and ask you to address this problem.

### `GOOGLE_APPLICATION_CREDENTIALS`
The path to the file with your Google Cloud Platform service account credentials.
This is optional for the image, but is required to enable the YouTube and Translation modules.

You can visit the [Google Cloud] website for more information on how to register, create an 
application, and register a service account.

**Google Translate is a paid API, it has a free tier which is appropriate for most small use-cases but can incur costs with significant usage, if enabled, keep this in mind.**

### `GOOGLE_CLOUD_LOGGING`
If `GOOGLE_APPLICATION_CREDENTIALS` is specifed, this can be set to `true` to enable logging to 
Google Cloud Logging, this is helping for reviewing the usage of the application and persisting logs.

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
[MySQL]: https://www.mysql.com/ "MySQL Website"
[H2]: http://h2database.com/html/main.html "H2 Website"
[Discord Developer Documentation]: https://discord.com/developers/docs/intro "Discord Developer Documentation"
[osu!api wiki]: https://github.com/ppy/osu-api/wiki "osu!api Wiki" 
[Steam Web API Documentation]: https://steamcommunity.com/dev "Steam Web API Documentation"
[Cleverbot API]: https://www.cleverbot.com/api/ "Cleverbot API"
[Twitch Developers]: https://dev.twitch.tv/ "Twitch Developers"
[Google Cloud]: https://cloud.google.com/ "Google Cloud"
[Apache 2.0]: https://www.apache.org/licenses/LICENSE-2.0 "Apache 2.0 License"
[TL;DR]: https://tldrlegal.com/license/apache-license-2.0-(apache-2.0) "TL;DR of Apache 2.0"

[Matrix]: https://img.shields.io/matrix/elypia:matrix.org?logo=matrix "Matrix Shield"
[Discord]: https://discordapp.com/api/guilds/184657525990359041/widget.png "Discord Shield"
[Docker]: https://img.shields.io/docker/pulls/elypia/alexis-discord?logo=docker "Docker Shield"
[Build]: https://gitlab.com/Elypia/docker-alexis-discord/badges/master/pipeline.svg "GitLab Build Shield"
[Donate]: https://img.shields.io/badge/elypia-donate-blueviolet "Donate Shield"
