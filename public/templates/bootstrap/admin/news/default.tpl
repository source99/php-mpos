<script src="{$PATH}/js/cleditor/jquery.cleditor.min.js"></script>
<link rel="stylesheet" href="{$PATH}/js/cleditor/jquery.cleditor.css">
<script type="text/javascript">
  $(document).ready(function () { $(".cleditor").cleditor(); });
</script>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-edit fa-fw"></i> News Posts 
        <br>
        <font size="1px">News posts support the Markdown syntax</font>
      </div>
      <div class="panel-body">
        <div class="row">
          <div class="col-lg-12">
            <form method="POST" action="{$smarty.server.SCRIPT_NAME}" role="form">
              <input type="hidden" name="page" value="{$smarty.request.page|escape}">
              <input type="hidden" name="action" value="{$smarty.request.action|escape}">
              <input type="hidden" name="do" value="add">
              <div class="form-group">
                <label>Header</label>
                <input class="form-control" size="30" type="text" name="data[header]" required />
              </div>
              <div class="form-group">
                <label>Content</label>
                <textarea class="form-control cleditor" name="data[content]" rows="5" required></textarea>
              </div>
              <input type="submit" value="Add" class="btn btn-outline btn-success btn-lg btn-block">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-edit fa-fw"></i> News Posts
      </div>
      <div class="panel-body">
        <div class="row">
{nocache}
{section name=news loop=$NEWS}
          <div class="col-lg-12">
            <div class="panel panel-info">
              <div class="panel-heading">
                <i class="fa fa-info fa-fw"></i> {$NEWS[news].header}</a>
                <br />
                <font size="1px">posted {$NEWS[news].time|date_format:"%b %e, %Y at %H:%M"}{if $HIDEAUTHOR|default:"0" == 0} by <b>{$NEWS[news].author}</b>{/if}</font>
              </div>
  
              <div class="panel-body">
                {$NEWS[news].content nofilter}
              </div>
              <div class="panel-footer">
                <div  style="text-align:right">
                  <a href='{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page|escape}&action=news_edit&id={$NEWS[news].id}'><i class="fa fa-wrench fa-fw"></i></a>&nbsp;
                  <a href='{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$NEWS[news].id}'><i class="fw fa-trash-o fa-fw"></i></a>
                </div>
              </div>
            </div>
          </div>
{/section}
{/nocache}

      </div>
    </div>
  </div>
</div>