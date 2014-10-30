#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
class RunningsController < ApplicationController
  def mypage
    @user = current_user

  end
  def index
    @insta_thumb = Array.new
    @insta_link = Array.new
    doc = Array.new
    doc << JSON.parse(open("https://api.instagram.com/v1/tags/giverunners/media/recent?count=5&access_token=265871089.0b74ed2.ea2046cafa45421b9b65426b7bc1b76d").read)["data"]
    doc << JSON.parse(open("https://api.instagram.com/v1/tags/giverunner/media/recent?count=5&access_token=265871089.0b74ed2.ea2046cafa45421b9b65426b7bc1b76d").read)["data"]
    doc << JSON.parse(open("https://api.instagram.com/v1/tags/%EA%B8%B0%EB%B6%80%EB%9F%AC%EB%84%88/media/recent?count=5&access_token=265871089.0b74ed2.ea2046cafa45421b9b65426b7bc1b76d").read)["data"]
    doc << JSON.parse(open("https://api.instagram.com/v1/tags/%EA%B8%B0%EB%B6%80%EB%9F%AC%EB%84%88%EC%A6%88/media/recent?count=5&access_token=265871089.0b74ed2.ea2046cafa45421b9b65426b7bc1b76d").read)["data"]
    doc.each do |docc|
      0.upto(4) do |x|
        doc_now = docc[x]
        if doc_now != nil
         @insta_thumb << doc_now["images"]["low_resolution"]["url"]
         @insta_link << docc[x]["link"]
        end
      end
    end
    @insta_thumb.uniq!
    @insta_link.uniq!

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
