library(httr)
library(jsonlite)
library(dplyr)

source("./scripts/api-keys.R")

channel_messages <- data.frame()

# Channel ID to scrape
# 366123119464939534 - #rules
# 369356771804053515 - #announcements
# 362689877751627777 - #general
# 362691650981724160 - #questions
channel_id <- "362689877751627777"

discord_headers <- add_headers(
  "Authorization" = discord_token
)

last_msg_id <- ""

while(nrow(channel_messages) %% 100 == 0) {

  discord_chanmsg_endpoint <- paste0(
    "https://discordapp.com/api/v6",
    "/channels/",
    channel_id,
    "/messages",
    "?limit=100"
  )
  
  if (last_msg_id != "") {
    discord_chanmsg_endpoint <- paste0(
      discord_chanmsg_endpoint,
      "&before=",
      last_msg_id
    )
  }
  
  discord_response <- GET(
    discord_chanmsg_endpoint,
    discord_headers
  )
  
  discord_data <- fromJSON(content(discord_response, "text"))
  
  last_msg_id <- tail(discord_data, 1)$id
  
  discord_data <- flatten(discord_data)
  
  channel_messages <- bind_rows(channel_messages, discord_data)
}

channel_messages <- flatten(channel_messages)

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

write.csv(
  filtered_df,
  paste0(
    "data/messages_",
    channel_id,
    ".csv"
  ),
  row.names = FALSE
)
