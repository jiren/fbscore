module DummyFbData

  def stub_viki_info_request
    data = {"about"=>"Watch FREE global TV: K-dramas, K-pop, J-dramas, Taiwanese dramas, Telenovelas, Anime & more -- all subtitled in your language by fans just like you!", "awards"=>"WSJ Asian Innovation Awards, TechCrunch Best International Startup, SXSW, Paley Center", "category"=>"Entertainment website", "description"=>"Viki is a global TV site, where millions of people watch their favorite shows, movies and more -- translated into 150+ languages by a community of avid fans. Together, we’re breaking down barriers that stand between great entertainment and its fans, no matter where they are!", "founded"=>"2008", "is_published"=>true, "talking_about_count"=>47682, "username"=>"viki", "website"=>"www.viki.com, www.twitter.com/viki, http://pinterest.com/vikicom/", "were_here_count"=>0, "id"=>"159824760741181", "name"=>"Viki", "link"=>"http://www.facebook.com/viki", "likes"=>5160125, "cover"=>{"cover_id"=>605827732807546, "source"=>"http://m.ak.fbcdn.net/sphotos-b.ak/hphotos-ak-ash4/s720x720/1390638_605827732807546_277989311_n.jpg", "offset_y"=>0, "offset_x"=>0}}

    WebMock.disable_net_connect!
    stub_request(:any, 'https://graph.facebook.com/viki').with(:body => data)
  end

end
