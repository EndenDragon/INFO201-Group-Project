# This file scrapes the server channels and saves to the data folder

library(httr)
library(jsonlite)
library(dplyr)

source("./scripts/api-keys.R")

# The server id to scrape channels
guild_id <- "362689877269020684"

# Make url endpoint
discord_channels_endpoint <- paste0(
  "https://discordapp.com/api/v6",
  "/guilds/",
  guild_id,
  "/channels"
)

# Discord needs a token inside the header to authorize as me
discord_headers <- add_headers(
  "Authorization" = discord_token
)

# Out the door
discord_response <- GET(
  discord_channels_endpoint,
  discord_headers
)

# Get response and parse it as json
discord_data <- fromJSON(content(discord_response, "text"))
# Flatten the data frame
discord_data_filtered <- flatten(discord_data)

# Get the columns we need
discord_data_filtered <- discord_data_filtered %>%
  mutate(
    id = id,
    guild_id = guild_id,
    type = type,
    topic = topic,
    position = position,
    nsfw = nsfw,
    parent_id = parent_id,
    name = name
  ) %>%
  select(
    id, guild_id, type, topic, position, nsfw, parent_id, name
  )
# Write on disk
write.csv(
  discord_data_filtered,
  paste0(
    "data/guild_channels.csv"
  ),
  row.names = FALSE
)
