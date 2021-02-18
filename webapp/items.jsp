<%@ page import="java.util.List"%>
<%@ page import="javaweb.Item"%>
<%@ page import="javaweb.ItemsViewModel"%>
<%@ page import="javaweb.ItemSummaryView"%>
<%@ page import="javaweb.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
  function selectCode(selectedCode){
	  document.getElementById("selectedCode").value = selectedCode
	  document.itemSelect.submit();
  }

</script>
<style type="text/css">
   table {
   width : 65%;
   border-collapse : collapse;
   }


   thead tr {
   background-color : #80cfcf;

   }

   td {
   border-bottom : 1px solid #242424;
   line-height : 1.00rem;
   }


   .currency{
     text-align : right;
   }

</style>

<title>取扱商品一覧</title>
</head>
<body>
       <h2>取扱商品一覧</h2>
       <%
       ItemsViewModel vm = new ItemsViewModel();
       List<Item> items = vm.itemList();
       %>

       <form method="post" action="itemDetail" name="itemSelect">
       <table>
         <col width="15%"/>
         <col width="45%"/>
         <col width="25%"/>
         <col width="15%"/>
         <thead>
             <tr>
             <td>商品コード</td>
             <td>商品名</td>
             <td style="text-align : right;">単価</td>
             <td></td>
             </tr>
         </thead>
         <tbody>
              <%
              for(Item item : items){
              %>
               <tr>
               <td><%= item.getProduct_Cd() %></td>
               <td><%= item.getProduct_Nm() %></td>
               <td><%= item.getUnit_Price() %></td>
               <td><button type="button" onclick="selectCode('<%= item.getProduct_Cd() %>')" >詳細</button></td>
               </tr>
              <%
              }
              %>
         </tbody>
       </table>
       <input type="hidden" name="selectedCode" id="selectedCode">
       </form>
</body>
</html>