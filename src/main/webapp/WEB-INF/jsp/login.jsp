<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
    <form action="/user/login.do" method="post">
        用户名：<input type="text" name="username" /><br/>
        密码：<input type="text" name="password" /><br/>
        <button>登录</button>
    </form>
</body>
</html>
