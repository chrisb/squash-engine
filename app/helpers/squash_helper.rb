module SquashHelper

  # Call as part of {#body_content} to generate a full-width
  # (sixteen-column) content area with a white background. Yields to render
  # content.
  def full_width_section(alt=false,&block)
    content_tag :div, class: "content-container#{alt ? '-alt' : ''}" do
      content_tag :div, class: 'container' do
        content_tag :div, class: 'row' do
          content_tag :div, capture(&block), class: 'sixteen columns'
        end
      end
    end
  end

  # Call as part of {#body_content} to generate a full-width
  # (sixteen-column) content area with a shaded background below a tabbed
  # header portion. The `tabs_proc` should render a `<UL>` with your tab
  # headers, and the `content_proc` should render the tab bodies. See
  # tabs.js.coffee for how to organize it.
  def tabbed_section(tabs_proc, content_proc)
    content_tag :div, class: 'tab-header-container' do
      content_tag :div, class: 'container' do
        content_tag :div, class: 'row' do
          content_tag :div, tabs_proc.(), class: 'sixteen columns'
         end
      end
    end
    content_tag :div, class: 'tab-container' do
      content_tag :div, class: 'container' do
        content_tag :div, class: 'row' do
          content_tag :div, content_proc.(), class: 'sixteen columns'
        end
      end
    end
  end

  def tab_header(&block)
    render 'squash/shared/tab_header', tab_header_content: capture(&block)
  end

  def tab_container(&block)
    render 'squash/shared/tab_container', tab_content: capture(&block)
  end

  # Call as part of {#body_content} to generate an inset, shaded
  # twelve-column content area simulating the appearance of a modal. Yields
  # to render content.
  def modal_section(&block)
    content_tag :div, class: 'content-container' do
      content_tag :div, class: 'container modal-container' do
        content_tag :div, class: 'row row-modal' do
          content_tag :div, '&nbsp;'.html_safe, class: 'two columns'
          content_tag :div, capture(&block), class: 'twelve columns'
          content_tag :div, '&nbsp;'.html_safe, class: 'two columns'
        end
      end
    end
  end

  def page_title
    @page_title
  end

  def breadcrumbs
    @breadcrumbs || []
  end

  def breadcrumbs_stats
    @breadcrumbs_stats || []
  end

  # def button_to(name, location, overrides={})
  #   button name, overrides.reverse_merge(href: location)
  # end

  def footer_portion
    footer do
      p { image_tag 'footer.png' }

      p do
        text "Hand-coded in San Francisco by Tim Morgan of "
        a "Square, Inc.", href: 'https://squareup.com'
      end
    end
  end

end
