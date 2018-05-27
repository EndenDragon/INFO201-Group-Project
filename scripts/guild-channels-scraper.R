# This file scrapes the server channels and saves to the data folder

library(httr)
library(jsonlite)
library(dplyr)

source("./scripts/api-keys.R")

guild_id <- "362689877269020684"

discord_channels_endpoint <- paste0(
  "https://discordapp.com/api/v6",
  "/guilds/",
  guild_id,
  "/channels"
)

discord_headers <- add_headers(
  "Authorization" = discord_token
)

discord_response <- GET(
  discord_channels_endpoint,
  discord_headers
)

discord_data <- fromJSON(content(discord_response, "text"))

discord_data_filtered <- flatten(discord_data)

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

write.csv(
  discord_data_filtered,
  paste0(
    "data/guild_channels.csv"
  ),
  row.names = FALSE
)
