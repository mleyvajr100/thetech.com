(function(){var t=function(t,e){return function(){return t.apply(e,arguments)}},e=function(t,e){function r(){this.constructor=t}for(var i in e)n.call(e,i)&&(t[i]=e[i]);return r.prototype=e.prototype,t.prototype=new r,t.__super__=e.prototype,t},n={}.hasOwnProperty;this.Article=function(n){function r(e){this.handleRankSelect=t(this.handleRankSelect,this),this.handleDelete=t(this.handleDelete,this),this.handleUnpublish=t(this.handleUnpublish,this),this.handlePublish=t(this.handlePublish,this),r.__super__.constructor.call(this,e),this.state={},this.styles={statusCol:{width:"120px",textAlign:"center",padding:"8px 0"},mainCol:{padding:"8px 6px"},actionsCol:{width:"120px",textAlign:"center",paddingBottom:"2px"},label:{marginRight:"4px"},slug:{fontWeight:"bold",marginLeft:"3px",marginRight:"4px"},headline:{marginLeft:"4px"},publishTime:{marginRight:"4px"},authors:{marginLeft:"4px"},secondaryLine:{color:"#888"},rankSelect:{width:"60px"}}}return e(r,n),r.propTypes={article:React.PropTypes.object,authors:React.PropTypes.array,articles:React.PropTypes.array,rankSelect:React.PropTypes.bool},r.prototype.handlePublish=function(t){return this.props.onAction("post",Routes.publish_article_draft_path(this.props.article,this.props.article.pending_draft.id),{},t)},r.prototype.handleUnpublish=function(t){return this.props.onAction("post",Routes.unpublish_article_path(this.props.article),{},t)},r.prototype.handleDelete=function(t){return this.props.onAction("delete",Routes.article_path(this.props.article),{},t)},r.prototype.handleRankSelect=function(t,e){return this.props.onAction("patch",Routes.update_rank_article_path(this.props.article),{article:{rank:t}},e),e()},r.prototype.renderButton=function(t,e,n,r,i){return null==r&&(r=!0),null==i&&(i=null),r?React.createElement(Button,{type:t,text:e,onClick:n,confirm:i}):null},r.prototype.renderLink=function(t,e,n,r,i){var o;return null==r&&(r=!0),null==i&&(i=null),r?(o=function(t){return window.open(n),t()},React.createElement(Button,{type:t,text:e,onClick:o,confirm:i})):null},r.prototype.renderWebStatus=function(){return this.props.article.has_web_published_draft?this.props.article.has_pending_draft?React.createElement(StatusLabel,{type:"info"},"Web: Has Update"):React.createElement(StatusLabel,{type:"success"},"Web: Published"):this.props.article.has_web_ready_draft?React.createElement(StatusLabel,{type:"info"},"Web: Ready"):React.createElement(StatusLabel,{type:"danger"},"Web: Draft")},r.prototype.renderPrintStatus=function(){return this.props.article.has_print_ready_draft?React.createElement(StatusLabel,{type:"success"},"Print: Ready"):React.createElement(StatusLabel,{type:"danger"},"Print: Draft")},r.prototype.renderActions=function(){return React.createElement("td",{style:this.styles.actionsCol},this.renderButton("success","Publish",this.handlePublish,this.props.article.has_pending_draft&&!this.props.article.has_web_published_draft&&this.props.article.can_publish),this.renderButton("success","Publish Update",this.handlePublish,this.props.article.has_pending_draft&&this.props.article.has_web_published_draft&&this.props.article.can_publish),this.renderButton("danger","Delete",this.handleDelete,!this.props.article.has_web_published_draft&&this.props.article.can_destroy,"Are you sure that you want to delete this article? This will delete all drafts. "),this.renderButton("danger","Unpublish",this.handleUnpublish,this.props.article.has_web_published_draft&&this.props.article.can_unpublish,"Are you sure that you want to unpublish this article? The publish time would change if you later publish it again. "),this.renderLink("default","View Drafts",Routes.article_drafts_path(this.props.article,{format:"html"})))},r.prototype.render=function(){return React.createElement("tr",null,React.createElement("td",{style:this.styles.statusCol},this.renderWebStatus(),this.renderPrintStatus(),this.props.rankSelect&&React.createElement(AutoSelect,{style:this.styles.rankSelect,titles:[99].concat(range(1,20)),ids:[99].concat(range(1,20)),initial:this.props.article.rank,onChange:this.handleRankSelect})),React.createElement("td",{style:this.styles.mainCol},React.createElement("p",null,React.createElement("span",{style:this.styles.label,className:"label label-default"},this.props.article.issue.short_name),React.createElement("span",{style:this.styles.label,className:"label label-default"},this.props.article.section.name.toUpperCase()),React.createElement("span",{style:this.styles.label,className:"label label-default"},this.props.article.newest_draft.primary_tag.toUpperCase()),React.createElement("a",{style:this.styles.slug,target:"_blank",href:Routes.article_drafts_path(this.props.article,{format:"html"})},this.props.article.slug),"\u2022",React.createElement("span",{style:this.styles.headline},this.props.article.newest_draft.headline)),React.createElement("p",{style:this.styles.secondaryLine},null!=this.props.article.oldest_web_published_draft&&void 0!=this.props.article.oldest_web_published_draft?React.createElement("span",{style:this.styles.publishTime},"Published online ",$.timeago(Date.parse(this.props.article.oldest_web_published_draft.published_at))):React.createElement("span",{style:this.styles.publishTime},"Not published online yet"),"\u2022",React.createElement("span",{style:this.styles.authors},"Authored by ",this.props.article.newest_draft.authors_string))),this.renderActions())},r}(React.Component)}).call(this);