<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <div class="card mb-3">
        <img src="/file/${currentNews.file.id}" class="card-img-top" alt="">
        <div class="card-body">
            <h5 class="card-title">${currentNews.title} </h5>
            <p class="card-text">${currentNews.subTitle}</p>
            <p class="card-text"><small class="text-muted">${currentNews.text} </small></p>
        </div>
    </div>
</@c.page>