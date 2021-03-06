<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优购商家中心-修改密码</title>
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/css/base.css?${style_v}"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/css/mold.css?${style_v}"/>
<script type="text/javascript">
	var flag = 0;
	var basePath = "${BasePath}";
</script>
</head>
<body>
<div class="main_container">
<div class="normal_box">
		<p class="title site">当前位置：商家中心 &gt; 账户管理 &gt; 绑定邮箱</p>
                    <h1 class="modify-title">绑定邮箱</h1>
                    <ul class="step-list clearfix">
                        <li class="curr">1 <p>验证身份</p></li>
                        <li class="">2 <p>邮箱验证</p></li>
                        <li class="complete"><img src="${BasePath}/yougou/images/modity-step-ok.png" alt="" /><p>完成</p></li>
                    </ul>
                    <div class="form-box">
                        <dl class="form-warp clearfix">
                            <dt class="form-title"><em class="cred">*</em>手机号码：</dt>
                            <dd class="form-text"><p class="prompt-tip">${mobilePhone!'' }</p></dd>
                            <dd></dd>
                        </dl>
                        <dl class="form-warp clearfix">
                            <dt class="form-title"><em class="cred">*</em>短信验证码：</dt>
                            <dd class="form-text"><input type="text" class="sms-text" maxlength="6" name="verifyCode" id="verifyCode"/></dd>
                            <dd><a class="btn-sms" href="javascript:void(0);">获取短信验证码</a></dd>
                        </dl>
                        <div class="code-tip hide">验证码已发出，请注意查收短信，如果没有收到，你可以在60秒后要求系统重新发送</div>
                        <div class="btn-box"><a href="javascript:void(0);" onclick="nextUpdate('${BasePath}/merchants/security/updateEmailPre.sc','${BasePath}/merchants/security/updateEmailNext.sc');" class="btn-blue-1 medium">下一步</a></div>
                    </div>
                    <input name="mobileCode" type="hidden" id="mobileCode" value="${mobilePhone!'' }"/>
                    <input name="temp" id="tempVar" type="hidden"/>
    </div>
	 </div>
	 <script src="${BasePath}/yougou/js/modifty.js?${style_v}"></script>
</body>
</html>