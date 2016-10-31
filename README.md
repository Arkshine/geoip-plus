![](http://i.imgur.com/jcZZ5lK.png)

AMX Mod X Module, backported from dev version to be used with the current stable v1.8.2.

| Linux | Windows |
|:------:|:---------:|
|[![Travis](https://img.shields.io/travis/Arkshine/geoip-plus.svg)](https://travis-ci.org/ikkentim/SampSharp)|[![AppVeyor](https://img.shields.io/appveyor/ci/Arkshine/geoip-plus.svg)](https://ci.appveyor.com/project/Arkshine/geoip-plus/)|

# Description

GeoIP+ module is a modification of the original GeoIP module shipped by default with AMX Mod X.
This adds several new natives in order to exploit others availaible datas like:
- City
- Region Code/Name
- Time Zone
- Continent Code/Name
- Latitude/Longitude/Distance
- Continent Code/Name

This is worth to note that it uses the new MaxMind GeoIP2 database format and some natives (country, city, region and continent) are localized, which means you can output data in others languages than english if available.
For now the following languages are supported: de en es fr ja pt-BR ru zh-CN.

# API

Quick preview of the new natives:
```
native geoip_country_ex(const ip[], result[], len, id = -1);
native geoip_city(const ip[], result[], len, id = -1);
native geoip_region_code(const ip[], result[], len);
native geoip_region_name(const ip[], result[], len, id = -1);
native geoip_timezone(const ip[], result[], len);
native Float:geoip_latitude(const ip[]);
native Float:geoip_longitude(const ip[]);
native Float:geoip_distance(Float:lat1, Float:lon1, Float:lat2, Float:lon2, system = SYSTEM_METRIC);
native Continent:geoip_continent_code(const ip[], result[3]);
native geoip_continent_name(const ip[], result[], len, id = -1);
```
Full documentation can be found in the [include file](https://github.com/Arkshine/geoip-plus/amxmodx/scripting/geoip.inc).

# Command

For debugging reasons, a geoip command is now implemented:
- `geoip version`
This will gives the current GeoIP module version and informations about current loaded database.

- `geoip dump <IP> [file]`
This allows you to dump all informations of a given IP in a JSON-like format. You can optionally provided a file to save dump there.

# General Notes

- You should be aware that it may not be always accurate depending the given ip. Keep in mind this uses the lite and free database version.
- If an IP is not found, the natives will output an empty string.
- The charset of the country/city/region/continent name is set on UTF-8 so you should see specials characters like accents and such in game.

# Installation

1. Download latest [GeoLite2 City MaxMind DB](http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz) (~25 Mio).
2. Retrieve the `GeoLite2-City.mmdb` file and copy it on your server in your `/amxmodx/data` directory.
4. From the [Releases section](https://github.com/Arkshine/geoip-plus/releases/latest), download the provided `geoip-files-x.y.zip` file.
5. Stop your server, unzip and overwrite the content in your `/amxmodx` directory
5. Start your server & enjoy.
6. Optional - Check geoip version and database by typing in server console: `geoip version`
