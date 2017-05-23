<html>
<head>
	<title>OpenShift test</title>
	<%@ page import="no.test.OpenShiftStuff" %>
	<%@ page import="java.util.*" %>
</head>
<body>
<h1>Builds</h1>

<ul>
<%
List<String> builds = new OpenShiftStuff().getRunningPods();
for (String build : builds) {
%>
<li>
<%=build%>
</li>
<%
}
%>
</ul>

<h1>Users</h1>

<ul>
	<%
		List<String> users = new OpenShiftStuff().getUsers();
		for (String user : users) {
	%>
	<li>
		<%=user%>
	</li>
	<%
		}
	%>
</ul>

</body>