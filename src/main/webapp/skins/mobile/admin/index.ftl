<#include "macro-admin.ftl">
<@admin "index">
<div class="content">
    <div>
        ${onlineVisitorCountLabel} ${onlineVisitorCnt?c}
    </div>
    <div>
        ${currentVersionLabel} <span id="version">${version}</span>${commaLabel}
        <span id="upgrade">${checkVersionLabel}</span>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        $.ajax({
            url: "https://rhythm.b3log.org/version/symphony/latest",
            type: "GET",
            dataType: "jsonp",
            jsonp: "callback",
            success: function (data, textStatus) {
                console.log($("#version").text());
                if ($("#version").text() === data.symphonyVersion) {
                    $("#upgrade").text('${upToDateLabel}');
                } else {
                    $("#upgrade").html('${newVersionAvailableLabel}' + '${colonLabel}'
                            + "<a href='" + data.symphonyDownload
                            + "' target='_blank'>" + data.symphonyVersion + "</a>");
                }
            }
        });
    });

</script>

</@admin>

