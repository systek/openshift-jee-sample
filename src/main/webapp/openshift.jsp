<html>
<head>
	<title>OpenShift test</title>
	<%@ page import="no.test.OpenShiftStuff" %>
	<%@ page import="java.util.*" %>
</head>
<body>
<h1>Builds</h1>


<%=new OpenShiftStuff().helloVoid() %>
<%=new OpenShiftStuff().getNamespace() %>

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


<hr />

<ul>

<ul>
<%
List<String> builds = new OpenShiftStuff().getPods();
for (String build : builds) {
%>
<li>
<%=build%>
</li>
<%
}
%>
</ul>


</body>
