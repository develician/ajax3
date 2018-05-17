<%--
  Created by IntelliJ IDEA.
  user: paul
  Date: 2017. 10. 20.
  Time: PM 6:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <title>Index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <script>
        var searchRequest = new XMLHttpRequest();
        var registerRequest = new XMLHttpRequest();

        function searchFunction() {
            searchRequest.open("POST", "/userSearchServlet?userName=" + encodeURIComponent(document.getElementById("userName").value), true);
            searchRequest.onreadystatechange = searchProcess;
            searchRequest.send(null);


        }

        function searchProcess() {
            var table = document.getElementById("ajaxTable");
            table.innerHTML = "";
            if (searchRequest.readyState == 4 && searchRequest.status == 200) {
                var object = eval('(' + searchRequest.responseText + ')');
                var result = object.result;
                for (var i = 0; i < result.length; i++) {
                    var row = table.insertRow(0);
                    for (var j = 0; j < result[i].length; j++) {
                        var cell = row.insertCell(j);
                        cell.innerHTML = result[i][j].value;
                    }
                }
            }
        }

        function registerFunction(){
            registerRequest.open("POST", "/userRegisterServlet?userName=" + encodeURIComponent(document.getElementById("registerName").value) +
                "&userAge=" + encodeURIComponent(document.getElementById("registerAge").value) +
                "&userGender=" + encodeURIComponent($('input[name=registerGender]:checked').val()) +
                "&userEmail=" + encodeURIComponent(document.getElementById("registerEmail").value), true);
            registerRequest.onreadystatechange = registerProcess;
            registerRequest.send(null);
        }

        function registerProcess(){
            if(registerRequest.readyState == 4 && registerRequest.status == 200){
                var result = registerRequest.responseText;
                if(result != 1){
                    alert("등록에 실패 했습니다.");
                }
                else{
                    var userName = document.getElementById("userName");
                    var registerName = document.getElementById("registerName");
                    var registerAge = document.getElementById("registerAge");
                    var registerEmail = document.getElementById("registerEmail");

                    userName.value = "";
                    registerName.value = "";
                    registerAge.value = "";
                    registerEmail.value = "";
                    searchFunction();
                }
            }
        }

        window.onload = function () {
            searchFunction();
        }
    </script>
</head>
<body>
<br>
<div id="number"></div>
<div class="container">

    <div class="form-group row pull-right">
        <div class="col-xs-8">
            <input class="form-control" id="userName" type="text" size="20" onkeyup="searchFunction();">
        </div>
        <div class="col-xs-2">
            <button class="btn btn-primary" type="button" onclick="searchFunction();">검색</button>
        </div>
    </div>
    <table class="table" style="text-align: center;border:1px solid #dddddd">
        <thead>
        <tr>
            <th style="background-color: #fafafa;text-align: center">이름</th>
            <th style="background-color: #fafafa;text-align: center">나이</th>
            <th style="background-color: #fafafa;text-align: center">성별</th>
            <th style="background-color: #fafafa;text-align: center">이메일</th>
        </tr>
        </thead>
        <tbody id="ajaxTable">

        </tbody>
    </table>

</div>
<div class="container">
    <table class="table" style="text-align: center;border:1px solid #dddddd">
        <thead>
        <tr>
            <th colspan="2" style="background-color: #fafafa;text-align: center">회원 등록 양식</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td style="background-color: #fafafa;text-align: center"><h5>이름</h5></td>
            <td style="background-color: #fafafa;text-align: center">
                <input type="text" class="form-control" id="registerName" size="20">
            </td>
        </tr>
        <tr>
            <td style="background-color: #fafafa;text-align: center"><h5>나이</h5></td>
            <td style="background-color: #fafafa;text-align: center">
                <input type="text" class="form-control" id="registerAge" size="20">
            </td>
        </tr>
        <tr>
            <td style="background-color: #fafafa;text-align: center"><h5>성별</h5></td>
            <td style="background-color: #fafafa;text-align: center">
                <div class="form-group" style="text-align: center;margin : 0 auto">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-primary active">
                            <input type="radio" name="registerGender" autocomplete="off" value="Man" checked>남자
                        </label>
                        <label class="btn btn-primary">
                            <input type="radio" name="registerGender" autocomplete="off" value="Woman">여자
                        </label>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="background-color: #fafafa;text-align: center"><h5>이메일</h5></td>
            <td style="background-color: #fafafa;text-align: center">
                <input type="text" name="registerEmail" class="form-control" id="registerEmail" size="20">
            </td>
        </tr>
        <tr>
            <td colspan="2"><button type="button" class="btn btn-primary pull-right" onclick="registerFunction()">등록</button></td>
        </tr>
        </tbody>

    </table>
</div>
</body>
</html>
