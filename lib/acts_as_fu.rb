# Acts As a Damn Fu

module ActionView::Helpers::UrlHelper

  KUNG_FU_LESSONS = [
    { :image => 'http://rinsedout.dreamhosters.com/images/ninja.jpg',
      :text => 'Ninja Karate-chop!!' },
    { :image => 'http://rinsedout.dreamhosters.com/images/mrt.jpg',
      :text => 'I pity the fu!' },
    { :image => 'http://rinsedout.dreamhosters.com/images/krfu.jpg',
      :text => 'I know kung-fu.' },
    { :image => 'http://rinsedout.dreamhosters.com/images/warlock.jpg',
      :text => 'Rockstar hAx Attack!' }
  ]

  alias_method(:orig_link_to, :link_to) unless method_defined?(:orig_link_to) 

  def link_to(name, options = {}, html_options = {})
    name = "#{name} (Fu!)"
    
    the_id = nil
    the_id = "fu_id_#{rand(10000)}"
      
    lesson = KUNG_FU_LESSONS[rand(KUNG_FU_LESSONS.size)]
    if html_options[:id].nil?
      the_id = "fu_id_#{rand(10000)}"
      html_options.merge!({ :id => the_id })
    else
      the_id = html_options[:id]
    end
    fu_opts = { :onclick => "var img#{the_id} = document.createElement('img');" + 
        "img#{the_id}.setAttribute('id', 'kung_fu_lesson_#{the_id}');" + 
        "img#{the_id}.setAttribute('src', '#{lesson[:image]}');" + 
        "img#{the_id}.setAttribute('border', '10');" + 
        "document.body.background = '#{lesson[:image]}';" + 
        "var el#{the_id} = document.getElementById('#{the_id}');" + 
        "var parentDiv#{the_id} = el#{the_id}.parentNode;" + 
        "parentDiv#{the_id}.insertBefore(img#{the_id}, el#{the_id});" +
        "alert('#{lesson[:text]}');" }
    html_options.merge! fu_opts
    
    orig_link_to name, options, html_options
  end
end
