# This file scrapes the server members and saves to the data folder

library(httr)
library(jsonlite)
library(dplyr)

source("./scripts/api-keys.R")

# Server id to scrape members
guild_id <- "362689877269020684"

# Build url endpoint
discord_members_endpoint <- paste0(
  "https://discordapp.com/api/v6",
  "/guilds/",
  guild_id,
  "/members",
  "?limit=1000"
)
# Add authentication token to headers
discord_headers <- add_headers(
  "Authorization" = discord_token
)
# Fetch for the response
discord_response <- GET(
  discord_members_endpoint,
  discord_headers
)
# Parse the response as JSON
discord_data <- fromJSON(content(discord_response, "text"))
# Flatten the dataframe
discord_data_filtered <- flatten(discord_data)
# Get the columns we may need
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
# Save results on disk
write.csv(
  discord_data_filtered,
  paste0(
    "data/guild_members.csv"
  ),
  row.names = FALSE
)
