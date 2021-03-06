//修改节点数据
function updateAreaNode(){
	
	if(!confirm("确认修改?"))return 
	
	if($("#id").val() == null || $("#id").val() == ""){
		alert('资源不存在! 请先增加');
		return ;
	}
	
	var sort = $('#sort').val();
	if(sort == null || sort == "" || !(/^[1-9]\d*$/.test(sort))){
		alert("排序不能为空,且只能为数字");
		return false;
	}
	
	var data={
		"name":$("#name").val(),
		"sort":$("#sort").val(),
		"post":$("#post").val(),
		"code":$("#code").val(),
		"id":$("#id").val()
	};
	
	var url="u_updateAreaNode.sc";
	
	ajaxRequest(url,data,function(result){
		if(!result) return ;
		
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		if(result.length == ""){
			alert("修改失败");
			return ;
			
		}
		var selectNode = $('#resourceTree').tree('getSelected');
		var resultNode = eval("("+result+")");
		selectNode.text= resultNode.text;
	    $("#resourceTree").tree("update",selectNode);
		
		alert("修改成功");
	});
	
	
}

//增加节点
function addAreaNode(){
	
	var node = $('#resourceTree').tree('getSelected');
	if(!node){
		alert('请选择一个节点！');
		return false;
	}
	
	var newNodeText = $('#name').val();
	if(newNodeText == null || newNodeText == ""){
		alert("地区名称不能为空！");
		clearInputValue();
		return false;
	}
	
	if(newNodeText == node.text){
		alert('请输入地区名称 ！');
		clearInputValue();
		return false;
	}
	
	var sort = $('#sort').val();
	if(sort == null || sort == "" || !(/^[1-9]\d*$/.test(sort))){
		alert("排序不能为空,且只能为数字");
		return false;
	}
	
	var url="c_addAreaNode.sc";
	var data={
		"name":$("#name").val(),
		"sort":$("#sort").val(),
		"post":$("#post").val(),
		"code":$("#code").val(),
		"parentid":node.id
	};
	ajaxRequest(url,data,function(result){
		if(!result) return ;
		
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		if(result.length == ""){
			alert("增加失败");
			return ;
		}

		var node = eval("("+result+")");
		if(node.id){
			var nodeData = [{
				id:node.id,
				text:node.text,
				post:node.post
			}];
			
			append(nodeData);
			clearInputValue();
		}
	});
}

function loadNodeData(nodeid){
	var url = "queryAreaById.sc";
	var data={
		"id":nodeid
	};
	
	ajaxRequest(url,data,function(result){
		
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		//如果获取数据为空  则清空数据
		if(result.length == ""){
			clearInputValue();
			return ;
		}
		var node = eval("("+result+")");
		$("#id").attr("value",node.id);
		$("#name").attr("value",node.text);
		$("#sort").attr("value",node.order);
		if(node.post=="null"){$("#post").attr("value","");}else{$("#post").attr("value",node.post);}
		if(node.code=="null"){$("#code").attr("value","");}else{$("#code").attr("value",node.code);}
	});
	
}

function removeAreaNode(){
	
	var node = $('#resourceTree').tree('getSelected');
	if(!node){
		alert('请选择要删除的节点');
		return ;
	}
	
	if(!confirm("确认删除?"))return 
	
	if(node.attributes != null && node.attributes.struc != null && node.attributes.struc == "root"){
		alert("根目录不能删除");
		return false;
	}
	
	var url = "d_removeAreaNode.sc";
	var data={
		"areaid":node.id
	};
	
	ajaxRequest(url,data,function(result){
		if(!result) return ;
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		if(result == "success"){
			clearInputValue();
			remove();
			return ;
		}
	});
}

function clearInputValue(){
	$("#id").attr("value","");
	$("#name").attr("value","");
	$("#sort").attr("value","");
	$("#post").attr("value","");
	$("#code").attr("value","");
}

//发达ajax请求
function ajaxRequest(url,reqParam,callback){
	$.ajax({
		  type: 'POST',
		  url: url,
		  data: reqParam,
		  cache: true,
		  success: callback
	});
}
