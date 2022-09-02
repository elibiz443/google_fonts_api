require 'httparty'
require_relative '../config/application'

class TrelloApi
  def board_name
    response = HTTParty.get('https://api.trello.com/1/boards/1XXZ1ZKd/name?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
    response["_value"]
  end

  def lists
    response = HTTParty.get('https://api.trello.com/1/boards/1XXZ1ZKd/lists?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
    response.collect{|data| data["name"]}
  end

  def list_ids
    response = HTTParty.get('https://api.trello.com/1/boards/1XXZ1ZKd/lists?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
    response.collect{|data| data["id"]}
  end

  def cards
    list_ids.each do |list_id|
      card_detail = HTTParty.get('https://api.trello.com/1/lists/' + list_id + '/cards?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
      puts card_detail.collect{|data| data["name"]}
    end
  end
end

output = TrelloApi.new
# puts output.board_name
# puts output.lists
# puts output.list_ids
output.cards
