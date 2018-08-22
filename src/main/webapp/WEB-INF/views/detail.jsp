<%--
  Created by IntelliJ IDEA.
  User: Bruce Jiang
  Date: 2018/8/22
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Required Stylesheets -->
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/fonts/ptsans/stylesheet.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/fluid.css" media="screen" />

    <link rel="stylesheet" type="text/css" href="/css/mws.style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/icons/icons.css" media="screen" />

    <!-- Demo and Plugin Stylesheets -->
    <link rel="stylesheet" type="text/css" href="/css/demo.css" media="screen" />

    <link rel="stylesheet" type="text/css" href="/plugins/colorpicker/colorpicker.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/plugins/jimgareaselect/css/imgareaselect-default.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/plugins/fullcalendar/fullcalendar.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/plugins/fullcalendar/fullcalendar.print.css" media="print" />
    <link rel="stylesheet" type="text/css" href="/plugins/tipsy/tipsy.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/plugins/sourcerer/Sourcerer-1.2.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/plugins/jgrowl/jquery.jgrowl.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/plugins/spinner/spinner.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/jui/jquery.ui.css" media="screen" />

    <!-- Theme Stylesheet -->
    <link rel="stylesheet" type="text/css" href="/css/mws.theme.css" media="screen" />

    <!-- JavaScript Plugins -->

    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>

    <script type="text/javascript" src="/plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery.dualListBox-1.3.min.js"></script>
    <script type="text/javascript" src="/plugins/jgrowl/jquery.jgrowl.js"></script>
    <script type="text/javascript" src="/plugins/jquery.filestyle.js"></script>
    <script type="text/javascript" src="/plugins/fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery.dataTables.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/plugins/flot/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/plugins/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="/plugins/flot/jquery.flot.pie.min.js"></script>
    <script type="text/javascript" src="/plugins/flot/jquery.flot.stack.min.js"></script>
    <script type="text/javascript" src="/plugins/flot/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="/plugins/colorpicker/colorpicker.js"></script>
    <script type="text/javascript" src="/plugins/tipsy/jquery.tipsy.js"></script>
    <script type="text/javascript" src="/plugins/sourcerer/Sourcerer-1.2.js"></script>
    <script type="text/javascript" src="/plugins/jquery.placeholder.js"></script>
    <script type="text/javascript" src="/plugins/jquery.validate.js"></script>
    <script type="text/javascript" src="/plugins/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/plugins/spinner/ui.spinner.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>

    <script type="text/javascript" src="/plugins/elrte/js/elrte.min.js"></script>
    <script type="text/javascript" src="/plugins/elfinder/js/elfinder.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/plugins/elrte/css/elrte.full.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/plugins/elfinder/css/elfinder.css" media="screen" />

    <script type="text/javascript" src="/js/mws.js"></script>
    <script type="text/javascript" src="/js/demo.js"></script>
    <script type="text/javascript" src="/js/themer.js"></script>

    <script type="text/javascript" src="/js/demo.formelements.js"></script>

    <title>Elements</title>

</head>

<body>
<div id="mws-themer">
    <div id="mws-themer-hide"></div>
    <div id="mws-themer-content">
        <div class="mws-themer-section">
            <label for="mws-theme-presets">Presets</label> <select id="mws-theme-presets"></select>
        </div>
        <div class="mws-themer-separator"></div>
        <div class="mws-themer-section">
            <ul>
                <li><span>Base Color</span> <div id="mws-base-cp" class="mws-cp-trigger"></div></li>
                <li><span>Text Color</span> <div id="mws-text-cp" class="mws-cp-trigger"></div></li>
                <li><span>Text Glow Color</span> <div id="mws-textglow-cp" class="mws-cp-trigger"></div></li>
            </ul>
        </div>
        <div class="mws-themer-separator"></div>
        <div class="mws-themer-section">
            <ul>
                <li><span>Text Glow Opacity</span> <div id="mws-textglow-op"></div></li>
            </ul>
        </div>
        <div class="mws-themer-separator"></div>
        <div class="mws-themer-section">
            <button class="mws-button red small" id="mws-themer-getcss">Get CSS</button>
        </div>
    </div>
    <div id="mws-themer-css-dialog">
        <div class="mws-form">
            <div class="mws-form-row" style="padding:0;">
                <div class="mws-form-item">
                    <textarea cols="auto" rows="auto" readonly="readonly"></textarea>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mws-header" class="clearfix">
    <div id="mws-logo-container">
        <div id="mws-logo-wrap">
            <img src="/images/mws-logo.png" alt="mws admin" />
        </div>
    </div>

    <div id="mws-user-tools" class="clearfix">
        <div id="mws-user-notif" class="mws-dropdown-menu">
            <a href="#" class="mws-i-24 i-alert-2 mws-dropdown-trigger">Notifications</a>
            <span class="mws-dropdown-notif">35</span>
            <div class="mws-dropdown-box">
                <div class="mws-dropdown-content">
                    <ul class="mws-notifications">
                    </ul>
                    <div class="mws-dropdown-viewall">
                        <a href="#">View All Notifications</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="mws-user-message" class="mws-dropdown-menu">
            <a href="#" class="mws-i-24 i-message mws-dropdown-trigger">Messages</a>
            <span class="mws-dropdown-notif">35</span>
            <div class="mws-dropdown-box">
                <div class="mws-dropdown-content">
                    <ul class="mws-messages">
                    </ul>
                    <div class="mws-dropdown-viewall">
                        <a href="#">View All Messages</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="mws-user-info" class="mws-inset">
            <div id="mws-user-photo">
                <img src="/example/profile.jpg" alt="User Photo" />
            </div>
            <div id="mws-user-functions">
                <div id="mws-username">
                    Admin
                </div>
                <ul>
                    <li><a href="#">New Key-Pair</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id="mws-wrapper">
    <div id="mws-sidebar-stitch"></div>
    <div id="mws-sidebar-bg"></div>
    <div id="mws-sidebar">
        <div id="mws-searchbox" class="mws-inset">
            <form action="#">
                <input type="text" class="mws-search-input" />
                <input type="submit" class="mws-search-submit" />
            </form>
        </div>
        <div id="mws-navigation">
            <ul>
                <li><a href="/index" class="mws-i-24 i-home">Dashboard</a></li>
                <li><a href="/charts" class="mws-i-24 i-chart">Charts</a></li>
                <li><a href="/calendar" class="mws-i-24 i-day-calendar">Calendar</a></li>
                <li><a href="/file" class="mws-i-24 i-file-cabinet">File Manager</a></li>
            </ul>
        </div>
    </div>

    <div id="mws-container" class="clearfix">
        <div class="container">
            <div class="mws-panel grid_4">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-pencil">Text Inputs</span>
                </div>
                <div class="mws-panel-body">
                    <form class="mws-form">
                        <div class="mws-form-inline">
                            <div class="mws-form-row">
                                <label>INDEX</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.index}" readonly="readonly" />
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>HVD</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.hvd}" readonly="readonly" />
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>SALT</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.salt}" readonly="readonly" />
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>SIZE</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.size}" readonly="readonly" />
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>BelongTo</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.belongTo}" readonly="readonly" />
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>RemoteAddress</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.remoteAddr}" readonly="readonly" />
                                </div>
                            </div>

                            <div class="mws-form-row">
                                <label>LastAuditTime</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.lastAuditTime}" readonly="readonly" />
                                </div>
                            </div>

                            <div class="mws-form-row">
                                <label>State</label>
                                <div class="mws-form-item large">
                                    <input type="text" class="mws-textinput" value="${item.state}" readonly="readonly" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div id="mws-footer">
                Copyright &copy; Bruce Jiang <a href="#" target="_blank" title="Bruce Jiang">Bruce Jiang</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>