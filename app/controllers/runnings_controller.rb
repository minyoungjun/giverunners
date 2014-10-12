#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
class RunningsController < ApplicationController

  def index
    @insta_thumb = Array.new
    @insta_link = Array.new
    doc = JSON.parse(open("https://api.instagram.com/v1/tags/giverunners/media/recent?count=10&access_token=265871089.0b74ed2.ea2046cafa45421b9b65426b7bc1b76d").read)["data"]

    0.upto(9) do |x|
      doc_now = doc[x]
     @insta_thumb << doc_now["images"]["low_resolution"]["url"]
     @insta_link << doc[x]["link"]
    end

    @fb_thumb = Array.new
    @fb_link = Array.new
    @fb_text = Array.new
    @fb_comments = Array.new
    @fb_time = Array.new
    @fb_name = Array.new

    fb_doc = JSON.parse(open("https://graph.facebook.com/v2.1/877256565638278/feed?limit=4&access_token=" + Grouptoken.last.token).read)["data"]
    0.upto(3) do |x|
      fb_doc_now = fb_doc[x]
      @fb_name << fb_doc_now["from"]
      @fb_time << Time.parse(fb_doc_now["created_time"]).to_formatted_s(:short)
      @fb_thumb << fb_doc_now["picture"]
      @fb_link << fb_doc_now["actions"][0]["link"]
      @fb_text << fb_doc_now["message"].gsub("\n","")
      if fb_doc_now["comments"] != nil
        @fb_comments << fb_doc_now["comments"].count
      else
        @fb_comments << 0
      end

    end
  end
end
