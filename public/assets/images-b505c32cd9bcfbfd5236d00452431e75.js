(function(){var e;e=function(){var e,t,n,i,o,a,r,d,s;if($("body#images_new,body#images_create").length>0&&(n=function(){var e,t,n;return t=$("select[name=piece_id]"),n=t.val(),console.log(t),e=$("#pieces_embedded_fields"),n?e.hide():e.show()},n(),$("select[name=piece_id]").change(n)),$("body#images_new,body#images_edit").length>0)for(t=new Bloodhound({datumTokenizer:Bloodhound.tokenizers.obj.whitespace("name"),queryTokenizer:Bloodhound.tokenizers.whitespace,local:gon.authors}),t.initialize(),a=$("input[name=image\\[author_id\\]]"),a.tagsinput({itemValue:"id",itemText:"name",typeaheadjs:{name:"authors",displayKey:"name",source:t.ttAdapter()},maxTags:1}),s=gon.prefilled_authors,r=0,d=s.length;d>r;r++)e=s[r],a.tagsinput("add",e);return $("#articles_index").length>0&&$("#keywords").keyup(function(){return window.delay("keywords_search",function(){return $("#keywords").parents("form").submit()},300)}),$("body#images_show").length>0?(o=function(e){return $("#pictures > div").hide(),$("#"+e).show()},i=function(){var e;return e=$(this).data("picture-id"),o(e)},o("picture_0"),$("#pictures_toggle button").click(i),$("#images_field").change(function(){return $(this).parents("form").submit()})):void 0},$(document).ready(e),$(document).on("page:load",e)}).call(this);