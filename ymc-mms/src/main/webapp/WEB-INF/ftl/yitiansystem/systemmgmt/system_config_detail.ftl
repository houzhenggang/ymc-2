<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/styles/sys-base.css"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/styles/sys-index.css"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/styles/sys-global.css"/>
<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/ytsys-base.css" />
<title>网络营销系统-系统管理-系统配置基本信息</title>
</head>

<body>
<div class="container">
	<div class="toolbar">
		<div class="t-content">
		</div>
	</div>
	<div class="list_content">
		<div class="top clearfix">
			<ul class="tab">
				<li class='curr' ><span>系统配置详细值</span></li>
			</ul>
		</div>
		<div class="modify">
			<font style="color:red;weight:12">说明：&nbsp;&nbsp;多项配置用英文号逗(,)号分隔</font>&nbsp;&nbsp;<img src="${BasePath}/images/yitiansystem/yewlloask.gif" alt="" title="多项配置用英文号逗(,)号分隔" style="cursor: pointer;"/>
	   		<form action="u_update.sc" method="post" target="mbdif"  name="systemConfigForm" id="systemConfigForm" style="margin:0px;padding:0p;">
		    	<input type="hidden" name="id" value="${(config.id)?default('')}" />
		    	<input type="hidden" name="configName" value="${(config.configName)?default('')}" />
		    	<input type="hidden" name="key" value="${(config.key)?default('')}" />
		    	<input type="hidden" name="remark" value="${(config.remark)?default('')}" />
		    	
				<textarea id="value" name="value" style="width:700px;height:300px;"  >${(config.value)?default('')}</textarea>
				
		    	<div>
	         	<label></label><input type="submit" class="btn-save" value="保存" />  
				<input type="button" class="btn-back" value="取消" onclick="javascript:window.top.TB_remove();"/>
				<div>
	       	</form>
		</div>
	</div>
</div>

</body>
<script type="text/javascript" src="${BasePath}/yougou/js/jquery-1.4.2.min.js"></script> 
<script>
	$("#configName").focus();
</script>
</html>
