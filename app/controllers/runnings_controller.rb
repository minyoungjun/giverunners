#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
class RunningsController < ApplicationController

  def index
    @insta_thumb = Array.new
    @insta_link = Array.new
    doc = JSON.parse(open("https://api.instagram.com/v1/tags/giverunners/media/recent?access_token=265871089.0b74ed2.ea2046cafa45421b9b65426b7bc1b76d").read)["data"]

    0.upto(9) do |x|
      doc_now = doc[x]
     @insta_thumb << doc_now["images"]["low_resolution"]["url"]
     @insta_link << doc[x]["link"]
    end

  end
end
