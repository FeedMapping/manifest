{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- include data.rb -%}
{%- if my_slug -%}{%- include {{ my_feed.path | remove_first: "_" | replace: my_feed.ext, ".html" }} -%}
{%- elsif my_feed.category == 'section' %}{%- include {{ my_feed.path | remove_first: "_" | replace: my_feed.ext, ".html" }} -%}
{%- else -%}{%- include {{ data.js }} -%}{%- endif -%}
