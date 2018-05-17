<%--
  Created by IntelliJ IDEA.
  user: paul
  Date: 2017. 10. 20.
  Time: PM 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>insert</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <div class="jumbotron">
            <h2>INSERT</h2>
            <form action="insertData.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="userName" placeholder="이름"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="userAge" placeholder="나이"/>
                </div>
                <div class="form-group">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-primary active">
                            <input type="radio" name="userGender" autocomplete="off" value="Man" checked>남자
                        </label>
                        <label class="btn btn-primary">
                            <input type="radio" name="userGender" autocomplete="off" value="Woman">여자
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="userEmail" placeholder="이메일"/>
                </div>
                <button type="submit" class="btn btn-primary">가입</button>
            </form>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>
