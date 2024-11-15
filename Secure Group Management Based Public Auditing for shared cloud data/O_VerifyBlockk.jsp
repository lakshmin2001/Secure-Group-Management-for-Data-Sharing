<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>

	<%
	String owner=(String)application.getAttribute("doname");
	
  		String file = request.getParameter("file");
		String block = request.getParameter("block");
   		try {
	   	    String mac1,mac2; 
		   	String query1="";
			String query2="";
			if(block.equalsIgnoreCase("Block1"))
			{
			query1="select mac1 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac1 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block2"))
			{
			query1="select mac2 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac2 from cloudserver where fname='"+file+"' and ownername='"+owner+"'";
			}
			if(block.equalsIgnoreCase("Block3"))
			{
			query1="select mac3 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac3 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block4"))
			{
			query1="select mac4 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac4 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query1);
	   if ( rs1.next() )
	      {
		    mac1=rs1.getString(1);
		   
		   
		    Statement st2=connection.createStatement();
		 
            ResultSet rs2=st2.executeQuery(query2);
	   if ( rs2.next() )
	      {
		   mac2=rs2.getString(1);
		   
		   if(mac1.equalsIgnoreCase(mac2))
		   {
		  // String ss="File Is Safe";
		  // application.setAttribute("fname",file);
		  //application.setAttribute("attacker",ss);
		  %>
<h1> File Named---- <%=file%>  ---- Block Named  --- <%=block %> ---  is Safe</h1><a href="O_VerifyBlock.jsp">Back</a></br>

		  <%
		   }
		   else
		   {%>
		   <h1> File Named---<%=file%>  ---- Block Named  --- <%=block %> ---is Not Safe</h1><a href="O_VerifyBlock.jsp">Back</a>Do you Want to recover <a href="recover.jsp?owner=<%=owner%>&block=<%=block%>&file=<%=file%>">Recover</a><%
		 //  String ss="attacker";
		  // application.setAttribute("fname",file);
		  //application.setAttribute("attacker",ss);
		   }
		    
		   
		   }}
		   else
		   {%>
		   <h1> File doesnot exist</h1><a href="O_VerifyBlock.jsp">Back</a><%
		   }
		   
		   
		   
		   
		   
		   
		 
		  
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		//response.sendRedirect("O_VerifyBlock1.jsp");  
	%>
