<#import "parts/common.ftl" as c>

<@c.page>
    <#if (news??)>
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <#list news as new>
                    <div class="carousel-item <#if new?is_first>active</#if>">
                        <img src="/file/${new.file.id}" class="d-block w-100" alt="">
                        <a href="/news/${new.id}">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>${new.title}</h5>
                                <p>${new.subTitle}</p>
                            </div>
                        </a>
                    </div>
                </#list>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </#if>
    <hr class="featurette-divider">
    <div>
        <table class="table">
            <#list tableResult as row>
            <#if row?is_first>
            <thead class="thead-dark">
            <tr>
                <#list row as col>
                    <th>
                        ${col}
                    </th>
                </#list>
            </tr>
            </thead>
            <tbody>
            <#else>
                <tr>
                    <#list row as col>
                        <th>
                            ${col}
                        </th>
                    </#list>
                </tr>
            </#if>
            </#list>
            </tbody>
        </table>
    </div>
</@c.page>
