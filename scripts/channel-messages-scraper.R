# This file scrapes the channel messages and saves it to the data folder

library(httr)
library(jsonlite)
library(dplyr)

source("./scripts/api-keys.R")

# All the messages fetched
channel_messages <- data.frame()

# Channel ID to scrape
# 366123119464939534 - #rules
# 369356771804053515 - #announcements
# 362689877751627777 - #general
# 362691650981724160 - #questions
channel_id <- "362689877751627777"

# Discord requires a header that contains the token/password
discord_headers <- add_headers(
  "Authorization" = discord_token
)

# Stores the last message id, used in the while loop
# to know which messages to get before the msg id
last_msg_id <- ""

# While there are messages to fetch
while (nrow(channel_messages) %% 100 == 0) {
  # Creates the endpoint to discord api
  discord_chanmsg_endpoint <- paste0(
    "https://discordapp.com/api/v6",
    "/channels/",
    channel_id,
    "/messages",
    "?limit=100"
  )
  # If last message id is not none, append
  # a "before" query parameter
  if (last_msg_id != "") {
    discord_chanmsg_endpoint <- paste0(
      discord_chanmsg_endpoint,
      "&before=",
      last_msg_id
    )
  }
  # Send it out the door
  discord_response <- GET(
    discord_chanmsg_endpoint,
    discord_headers
  )
  # Parse the response as json
  discord_data <- fromJSON(content(discord_response, "text"))
  # Save the last message id
  last_msg_id <- tail(discord_data, 1)$id
  # Flatten the json df
  discord_data <- flatten(discord_data)
  # Merge the global channel messages with the newly got data
  channel_messages <- bind_rows(channel_messages, discord_data)
}
# Flatten it again for good measures
channel_messages <- flatten(channel_messages)
# Get the rows we need
filtered_df <- channel_messages %>%
  mutate(
    id = id,
    timestamp = timestamp,
    edited_timestamp = edited_timestamp,
    author_id = author.id,
    content = content
  ) %>%
  select(
    id, timestamp, edited_timestamp, author_id, content
  )
# Write that on disk
write.csv(
  filtered_df,
  paste0(
    "data/messages_",
    channel_id,
    ".csv"
  ),
  row.names = FALSE
)
