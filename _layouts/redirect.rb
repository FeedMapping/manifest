---
layout: default
---
{% comment %}
*
*  This redirects are performed by serving a data file with an HTTP-REFRESH
*  meta tag which configured via variable {{ page.redirect.from }}
*  Ref: https://github.com/jekyll/jekyll-redirect-from
*
*  You may see the running code here:
*  https://chetabahana.github.io/sequence.json
*
*  jekyll debug or print json
*  https://docs.treepl.co/liquid
*  https://stackoverflow.com/q/34048313/4058484
*  https://avada.io/shopify/devdocs/how-to-convert-jekyll-data-to-json.html
*
{% endcomment %}{% include data.rb %}{% if data.items -%}
    {%- assign variable = data.items[0] %}{% assign my_tabs = 2 %}{%- assign my_tab = '    ' -%}
    {%- capture my_tabs %}{% for i in (1..my_tabs) %}{{ my_tab }}{% endfor %}{% endcapture -%}
    {%- capture my_tabn %}
    {{ my_tabs }}{% endcapture -%}{{- my_tabs }}{
    {%- for items in variable -%}
        {%- if items.first -%}
            {%- for item in items -%}
                {%- if item.first -%}
                    {%- for subitem in item -%}
                        {%- if subitem.first -%}
                             {{- my_tabn }}aa{{ subitem | to_json }}
                        {%- else -%}
                             {{- my_tabn }}sa{{ subitem | to_json }}
                        {%- endif -%}
                    {%- endfor -%}
                {%- else -%}

                    {{- my_tabn }}as{{ item | to_json }}

                {%- endif -%}
            {%- endfor -%}
        {%- else -%}
            {{- my_tabn }}{{ items[0] | jsonify }}: {{ items[1] | jsonify }}
        {%- endif %}{% unless forloop.last %},{% endunless -%}
    {%- endfor %}
{{ my_tabs }}}
{%- endif -%}
