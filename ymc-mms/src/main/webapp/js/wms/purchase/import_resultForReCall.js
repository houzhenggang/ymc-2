function doConfirm() {
	dg.curWin.document.getElementById("mainId").value = document
			.getElementById("mainId").value;
	dg.curWin.document.getElementById("warehouseId").disabled = true;
	dg.curWin.document.getElementById("supplierId").disabled = true;
	disabeledRadio("type");
	dg.curWin.queryDetail();
	closewindow();
}

$(document).ready(
		function() {
			dg.curWin.document.getElementById("mainId").value = document
					.getElementById("mainId").value;
			dg.curWin.document.getElementById("warehouseId").disabled = true;
			dg.curWin.document.getElementById("supplierId").disabled = true;
			disabeledRadio("type");
			dg.curWin.queryDetail();
		});

function disabeledRadio(name) {
	var radio = dg.curWin.document.getElementsByName(name);
	for ( var i = 0; i < radio.length; i++) {
		radio[i].disabled = true;
	}
}