<html>
<head>
	<title>KKHO test</title>
	<%@ page import="no.test.OpenShiftStuff" %>
	<%@ page import="java.util.*" %>
</head>
<body>
<h1>Builds on kkho world</h1>

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

Projects available:
<ul>
	<%
		List<String> projects = new OpenShiftStuff().getProjects();
		for (String project : projects) {
	%>
	<li>
		<%=project%>
	</li>
	<%
		}
	%>
</ul>
</body>