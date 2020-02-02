function ValidatePetSelection() {
    var checkboxes = document.getElementsByName("Unit_Choice");
    var numberOfCheckedItems = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked)
            numberOfCheckedItems++;
    }
    if (numberOfCheckedItems > 1) {
        alert("You can't select more than two Types !");
        return false;
    }
}
function UncheckAll() {
    var w = document.getElementsByTagName('input');
    for (var i = 0; i < w.length; i++) {
        if (w[i].type == 'checkbox') {
            w[i].checked = false;
        }
    }
}
function Reset() {
    $("#ProductID").val() = "";
    $("#ProductName").val() = "";
    $("#ProductQty").val() = "";
    $("#ProductSalePrice").val() = "";
    $("#ProductPurchasPrice").val() = "";
    UncheckAll();
    $("select#StorDrop")[0].selectedIndex = 0;

}
var EditFlag = false;
var OldID;
$(document).ready(function () {
   
    $(".packageDiv").style("display", "none");

    //Reset Button Event
    $("#ResetBtn").click(function () {
        Reset();
    });

    $("#SaveBtn").click(function () {

        var _item = {ID: $("#ProductID").val(), Name: $("#ProductName").val(), Qty: $("#ProductQty").val(), SalePrice: $("#ProductSalePrice").val(),
        PurchasePrice: $("#ProductPurchasPrice").val(), StorID: StorDrop.children("option:selected").val(), UnitType: unitType
        };
        var PackageList;
        if ($("Unit_Choice").val() == "Package"){
            $("input:checkbox[name=Packages]:checked").each(function () {
                PackageList.push($(this).val());
});

            }
      
        var stringData;
        var URL;
        var _type;
        if (EditFlag == false) {
            URL = "172.20.10.6/api/GetItem/Inserttem";
            stringData= JSON.stringify({ _item: _item, PackageList: PackageList });
            _type = "POST";
        } else {
            URL = "172.20.10.6/api/GetItem/UpdateItem/"+OldID;
            stringData = JSON.stringify({ _item: _item, PackageList: PackageList });
            _type = "PUT";
        }

        $.ajax({
            type: _type,
            url: URL,    
            data: stringData ,
            contentType: "application/json; charset=utf-8",    
            dataType: "json",    
            success: OnSucces,    
            error: OnError    
        });     
        function OnSucces(response) {    
            if (response == 1) {    
                alert(response.EnglishMessage+"\n"+response.EnglishMessage);    
            }    
            else {    
                alert(response.EnglishMessage+"\n"+response.EnglishMessage);    
            }    
        }    
        function OnError(response) {    
            alert(response.EnglishMessage+"\n"+response.EnglishMessage);    
        }    


    });

    $("#SearchBtn").click(function () {
        EditFlag = true;
        var data = {
            ID: $("#searchTxt").val()
        };
        var stringData = JSON.stringify(data);

        $.ajax({
            type: "Get",
            url: "172.20.10.6/api/GetItem",
            data: stringData,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSucces,
            error: OnError
        });
        function OnSucces(response) {
            if (response == 1) {
                alert(response.EnglishMessage + "\n" + response.EnglishMessage);
                $("#ProductID").val()=response.Body.ID;
                $("#ProductName").val()=response.Body.Name;
                $("#ProductQty").val()=response.Body.Qty;
                $("#ProductSalePrice").val()=response.Body.SalePrice;
                $("#ProductPurchasPrice").val()=response.Body.PurchasePrice;
                StorDrop.children("option:selected").val()=response.Body.StorID;
                $("UnitType").val() = response.Body.UnitType;
            }
            else {
                alert(response.EnglishMessage + "\n" + response.EnglishMessage);
            }
        }
        function OnError(response) {
            alert(response.EnglishMessage + "\n" + response.EnglishMessage);
        }


    });

    $("#DeleteBtn").click(function () {
        if (EditFlag) {
            var data = {
                ID: $("#ProductID").val()
            };
            var stringData = JSON.stringify(data);

            $.ajax({
                type: "Get",
                url: "172.20.10.6/api/DeleteItem",
                data: stringData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSucces,
                error: OnError
            });
            function OnSucces(response) {
                if (response == 1) {
                    alert(response.EnglishMessage + "\n" + response.EnglishMessage);
                    Reset();
                }
                else {
                    alert(response.EnglishMessage + "\n" + response.EnglishMessage);
                }
            }
            function OnError(response) {
                alert(response.EnglishMessage + "\n" + response.EnglishMessage);
            }

        }
    });


});

