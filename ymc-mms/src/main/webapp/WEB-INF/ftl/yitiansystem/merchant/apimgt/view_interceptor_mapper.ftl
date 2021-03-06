<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${BasePath}/css/ordermgmt/css/css.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/styles/sys-base.css"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/styles/sys-global.css"/>

<script type="text/javascript" src="${BasePath}/js/yitiansystem/ordermgmt/js/jquery-1.3.2.min.js"></script>
<script type="text/ecmascript" src="${BasePath}/js/yitiansystem/ordermgmt/js/artDialog/artDialog.js"></script>
<script type="text/javascript" src="${BasePath}/js/yitiansystem/ordermgmt/js/js.js"></script>
<script type="text/javascript" src="${BasePath}/js/yitiansystem/ordermgmt/js/order.js"></script>
<title>优购商城--商家后台</title>
<!-- 日期控件 -->
<script src="${BasePath}/js/common/form/datepicker/WdatePicker.js" type="text/javascript"></script>
</head>
<script type="text/javascript">

</script>
<body>
<div class="container">
	<div class="list_content">
		<div class="top clearfix">
			<ul class="tab">
				<li class="curr">
				  <span><a href="#" class="btn-onselc">业务请求拦截器</a></span>
				</li>
			</ul>
		</div>
 		<div class="modify">
 			<#if interceptorMapper?? && interceptorMapper.api??>
 			<form action="${BasePath}/openapimgt/interceptor/mapper/saveorupdate.sc" name="createForm" id="createForm" method="post">
 			<input type="hidden" name="api.id" id="apiId" value="${interceptorMapper.api.id?default('')}"/>
 			<#elseif interceptorMapper?? && interceptorMapper.apiVersion??>
 			<form action="${BasePath}/openapimgt/version/interceptor/mapper/saveorupdate.sc" name="createForm" id="createForm" method="post">
 			<input type="hidden" name="apiVersion.id" id="apiVersionId" value="${interceptorMapper.apiVersion.id?default('')}"/>
 			</#if>
      		<input type="hidden" name="id" id="id" <#if interceptorMapper??>value="${interceptorMapper.id?default('')}"</#if>/>
                <table cellpadding="0" cellspacing="0" class="list_table">
					<tr>
						<td style="text-align:right;"><label> <span style="color:red;">&nbsp;*</span>拦截器：</label>
						</td>
						<td>
							<select name="apiInterceptor.interceptorClass" id="apiInterceptorClass">
								<option value="">请选择</option>
								<#list classes as item >
								<option value="${item.name}" <#if interceptorMapper?? && interceptorMapper.apiInterceptor?? && item.name == interceptorMapper.apiInterceptor.interceptorClass?default('')>selected="selected"</#if>>${item.name}</option>
								</#list>
							</select>
						</td>
					</tr>
					<tr>
						<td style="text-align:right;"><label> <span style="color:red;">&nbsp;&nbsp;</span>排序号：</label>
						</td>
						<td>
							<select name="orderNo" id="orderNo">
								<option value="">请选择</option>
								<#list usableOrderNoList as item >
								<option value="${item}" <#if interceptorMapper?? && item == interceptorMapper.orderNo?default(0)>selected="selected"</#if>>${item}</option>
								</#list>
							</select>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
					 		<input id="btn" type="button" value="保存" class="yt-seach-btn" onclick="fireCreate();">
						</td>
					</tr>
                </table>
       	</form>
    </div>
 <div class="blank20"></div>
</div>
</body>
</html>
</script>
<script type="text/javascript" src="${BasePath}/yougou/js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="${BasePath}/yougou/js/common.min.js"></script> 
<script type="text/javascript" src="${BasePath}/yougou/js/calendar/lhgcalendar.min.js"></script> 
<script type="text/javascript" src="${BasePath}/yougou/js/ygdialog/lhgdialog.min.js?s=chrome"></script>  
<script type="text/javascript" src="${BasePath}/yougou/js/validator/formValidator-4.1.1.js"></script> 
<script type="text/javascript" src="${BasePath}/yougou/js/validator/formValidatorRegex.js"></script>
<script type="text/javascript">
function fireCreate() {
	if ($.trim($('#apiInterceptorClass').val()) == '') {
		alert('拦截器不能空选!');
		return false;
	}
	if ($.trim($('#orderNo').val()) == '') {
		alert('排序号不能空选!');
		return false;
	}
	
	$.ajax({ type : 'post', url: $('#createForm').attr('action'), dataType: 'text', data: $('#createForm').serialize(),
		beforeSend: function(XMLHttpRequest) {
			$('.yt-seach-btn').attr('disabled', true);
		},
		success: function(data, textStatus) {
			if ((typeof(data) == 'boolean' && data) || $.trim(data) == 'true') {
				alert('保存成功!');
				refreshpage();
				closewindow();
			} else {
				alert(data);
				$('.yt-seach-btn').attr('disabled', false);
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			$('.yt-seach-btn').attr('disabled', false);
			alert(textStatus.toUpperCase() + ' : ' + XMLHttpRequest.responseText);
		}
	});
}
</script>