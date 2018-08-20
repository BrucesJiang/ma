<%--
  Created by IntelliJ IDEA.
  User: Bruce Jiang
  Date: 2018/8/20
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Required Stylesheets -->
    <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/fonts/ptsans/stylesheet.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/fluid.css" media="screen" />

    <link rel="stylesheet" type="text/css" href="css/mws.style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/icons/icons.css" media="screen" />

    <!-- Demo and Plugin Stylesheets -->
    <link rel="stylesheet" type="text/css" href="css/demo.css" media="screen" />

    <link rel="stylesheet" type="text/css" href="plugins/colorpicker/colorpicker.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="plugins/jimgareaselect/css/imgareaselect-default.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="plugins/fullcalendar/fullcalendar.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="plugins/fullcalendar/fullcalendar.print.css" media="print" />
    <link rel="stylesheet" type="text/css" href="plugins/tipsy/tipsy.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="plugins/sourcerer/Sourcerer-1.2.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="plugins/jgrowl/jquery.jgrowl.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="plugins/spinner/spinner.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/jui/jquery.ui.css" media="screen" />

    <!-- Theme Stylesheet -->
    <link rel="stylesheet" type="text/css" href="css/mws.theme.css" media="screen" />

    <!-- JavaScript Plugins -->

    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

    <script type="text/javascript" src="plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
    <script type="text/javascript" src="plugins/jquery.dualListBox-1.3.min.js"></script>
    <script type="text/javascript" src="plugins/jgrowl/jquery.jgrowl.js"></script>
    <script type="text/javascript" src="plugins/jquery.filestyle.js"></script>
    <script type="text/javascript" src="plugins/fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript" src="plugins/jquery.dataTables.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="plugins/flot/jquery.flot.pie.min.js"></script>
    <script type="text/javascript" src="plugins/flot/jquery.flot.stack.min.js"></script>
    <script type="text/javascript" src="plugins/flot/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="plugins/colorpicker/colorpicker.js"></script>
    <script type="text/javascript" src="plugins/tipsy/jquery.tipsy.js"></script>
    <script type="text/javascript" src="plugins/sourcerer/Sourcerer-1.2.js"></script>
    <script type="text/javascript" src="plugins/jquery.placeholder.js"></script>
    <script type="text/javascript" src="plugins/jquery.validate.js"></script>
    <script type="text/javascript" src="plugins/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="plugins/spinner/ui.spinner.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>

    <script type="text/javascript" src="js/mws.js"></script>
    <script type="text/javascript" src="js/demo.js"></script>
    <script type="text/javascript" src="js/themer.js"></script>

    <title>MWS Admin - Table</title>
    <script type="text/javascript">
        /*
         * 是否全选
         */
        function selectOrClearAllCheckbox(obj) {
            var checkStatus = $(obj).attr("checked");
            if (checkStatus == "checked") {
                $("input[type='checkbox']").attr("checked", true);
            } else {
                $("input[type='checkbox']").attr("checked", false);
            }
        }


        /** 刷新 **/
        function refresh(){
            $("#submitForm").attr("action", "/all").submit();
        }

        /** 审计 **/
        function batchAudit(){
            if($("input[name='IDCheck']:checked").size()<=0){
                alert("Note:\n  At least one item must be selected");
                return;
            }
            //var check = []; // 定义空数组
            //$("input[name='IDCheck']:checked").each(function (i) { // 把所有被选中的复选框的值存入数组
            //    check[i] = $(this).val();
            //    alert(check[i]);
            //});
            if(confirm("Audit Now？")){
                // 提交form
                $("#submitForm").attr("action", "/audit").submit();
                //$.ajax({
                //    url:"${pageContext.request.contextPath}/audit",
                //    type:"POST",
                //    data:{"check": check},
                //    success:function(result){
                //        console.log(result);//打印服务端返回的数据(调试用)
                //        if (result.resultCode == 200) {
                //            alert("SUCCESS");
                //        };
                //    },
                //    error:function(e){
                //        alert("错误！！");
                //    }
                //});
            }
        }
    </script>
</head>
<body>
<!-- Header Wrapper -->
<div id="mws-header" class="clearfix">

    <!-- Logo Wrapper -->
    <div id="mws-logo-container">
        <div id="mws-logo-wrap">
            <img src="images/mws-logo.png" alt="mws admin" />
        </div>
    </div>

    <!-- User Area Wrapper -->
    <div id="mws-user-tools" class="clearfix">

        <!-- User Notifications -->
        <div id="mws-user-notif" class="mws-dropdown-menu">
            <a href="#" class="mws-i-24 i-alert-2 mws-dropdown-trigger">Notifications</a>
            <span class="mws-dropdown-notif">35</span>
            <div class="mws-dropdown-box">
                <div class="mws-dropdown-content">
                    <ul class="mws-notifications">

                        <!-- Notification Content -->
                        <li class="read">
                            <a href="#">
                                <span class="message">
                                    Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                </span>
                                <span class="time">
                                    January 21, 2012
                                </span>
                            </a>
                        </li>
                        <!-- End Notification Content -->

                    </ul>
                    <div class="mws-dropdown-viewall">
                        <a href="#">View All Notifications</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- User Messages -->
        <div id="mws-user-message" class="mws-dropdown-menu">
            <a href="#" class="mws-i-24 i-message mws-dropdown-trigger">Messages</a>
            <span class="mws-dropdown-notif">35</span>
            <div class="mws-dropdown-box">
                <div class="mws-dropdown-content">
                    <ul class="mws-messages">

                        <!-- Message Content -->
                        <li class="read">
                            <a href="#">
                                <span class="sender">John Doe</span>
                                <span class="message">
                                    Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                </span>
                                <span class="time">
                                    January 21, 2012
                                </span>
                            </a>
                        </li>
                        <!-- End Messages -->

                    </ul>
                    <div class="mws-dropdown-viewall">
                        <a href="#">View All Messages</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- User Functions -->
        <div id="mws-user-info" class="mws-inset">
            <div id="mws-user-photo">
                <img src="example/profile.jpg" alt="User Photo" />
            </div>
            <div id="mws-user-functions">
                <div id="mws-username">
                    Admin
                </div>
                <ul>
                    <li><a href="#">New Key-Pair</a></li>
                    <li><a href="index-2.html">Logout</a></li>
                </ul>
            </div>
        </div>
        <!-- End User Functions -->

    </div>
</div>
<div id="mws-wrapper">
    <!-- Necessary markup, do not remove -->
    <div id="mws-sidebar-stitch"></div>
    <div id="mws-sidebar-bg"></div>

    <!-- Sidebar Wrapper -->
    <div id="mws-sidebar">

        <!-- Search Box -->
        <div id="mws-searchbox" class="mws-inset">
            <form action="#">
                <input type="text" class="mws-search-input" />
                <input type="submit" class="mws-search-submit" />
            </form>
        </div>

        <!-- Main Navigation -->
        <div id="mws-navigation">
            <ul>
                <li class="active"><a href="#" class="mws-i-24 i-home">Dashboard</a></li>
                <li><a href="charts.html" class="mws-i-24 i-chart">Charts</a></li>
                <li><a href="calendar.html" class="mws-i-24 i-day-calendar">Calendar</a></li>
                <li><a href="files.html" class="mws-i-24 i-file-cabinet">File Manager</a></li>
            </ul>
        </div>
        <!-- End Navigation -->

    </div>
    <div id="mws-container" class="clearfix">
        <div class="container">
            <div class="mws-panel grid_8">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-table-1">Data Table with Numbered Pagination</span>
                </div>
                <form id="submitForm" name="submitForm" action="" method="post">
                    <div class="mws-panel-body">
                        <div class="mws-panel-toolbar top clearfix">
                            <ul>
                                <li><a  class="mws-ic-16 ic-accept" onclick="batchAudit();">Audit</a></li>
                                <li><a class="mws-ic-16 ic-arrow-refresh" onclick="refresh();">Refresh</a></li>
                            </ul>
                        </div>
                        <table class="mws-datatable-fn mws-table">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);"/></th>
                                <th>INDEX</th>
                                <th>HVD</th>
                                <th>SALT</th>
                                <th>SIZE</th>
                                <th>LAST AUDIT TIME</th>
                                <th>STATE</th>
                                <th>More Information</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "item" items="${list}">
                                <tr>
                                    <td><input type="checkbox" name="IDCheck" value="${item.index}"/></td>
                                    <td>${item.index}</td>
                                    <td>${item.hvd}</td>
                                    <td>${item.salt}</td>
                                    <td>${item.size}</td>
                                    <td>${item.lastAuditTime}</td>
                                    <td>${item.state}</td>
                                    <td><button class="mws-report-icon" onclick="detail(${item.index});">More</button></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" >
    function detail(index) {
        alert("ahah");
        $.ajax({
            url:"${pageContext.request.contextPath}/detail",
            type:"POST",
            data:{"index": index},
            success:function(result){
                alert("hahah" + result);
                $("#detailInfo").modal({
                    backdrop: false, // 相当于data-backdrop
                    keyboard: false, // 相当于data-keyboard
                    show: true, // 相当于data-show
                    remote: "" // 相当于a标签作为触发器的href
                });
            },
            error:function(e){
                alert("错误！！");
            }
        });
    }
</script>
<div class="modal fade" tabindex="-1" role="dialog" id="detailInfo">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="index" class="col-sm-2 control-label">INDEX</label>
                        <div class="col-sm-10" id="index">
                            ${item.index}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="hvd" class="col-sm-2 control-label">HVD</label>
                        <div class="col-sm-10" id="hvd">
                            ${item.hvd}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="salt" class="col-sm-2 control-label">SALT</label>
                        <div class="col-sm-10" id="salt">
                            ${item.salt}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="size" class="col-sm-2 control-label">SIZE</label>
                        <div class="col-sm-10" id="size">
                            ${item.size}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastAuditTime" class="col-sm-2 control-label">LastAuditTime</label>
                        <div class="col-sm-10" id="lastAuditTime">
                            ${item.lastAuditTime}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="state" class="col-sm-2 control-label">STATE</label>
                        <div class="col-sm-10" id="state">
                            ${item.state}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="belongTo" class="col-sm-2 control-label">BelongTo</label>
                        <div class="col-sm-10" id="belongTo">
                            ${item.belongTo}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="remoteAddr" class="col-sm-2 control-label">RemoteAddr</label>
                        <div class="col-sm-10" id="remoteAddr">
                            ${item.remoteAddr}
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
