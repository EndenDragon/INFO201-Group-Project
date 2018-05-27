# This file scrapes the server members and saves to the data folder

library(httr)
library(jsonlite)
library(dplyr)

source("./scripts/api-keys.R")

guild_id <- "362689877269020684"

discord_members_endpoint <- paste0(
  "https://discordapp.com/api/v6",
  "/guilds/",
  guild_id,
  "/members",
  "?limit=1000"
)

discord_headers <- add_headers(
  "Authorization" = discord_token
)

discord_response <- GET(
  discord_members_endpoint,
  discord_headers
)

discord_data <- fromJSON(content(discord_response, "text"))

discord_data_filtered <- flatten(discord_data)

discord_data_filtered <- discord_data_filtered %>%
  mutate(
    id = user.id,
    username = user.username,
    discriminator = user.discriminator,
    nickname = nick,
    avatar = user.avatar,
    bot = user.bot
  ) %>%
  select(
    id, username, discriminator, nickname, avatar, bot
  )

write.csv(
  discord_data_filtered,
  paste0(
    "data/guild_members.csv"
  ),
  row.names = FALSE
)
