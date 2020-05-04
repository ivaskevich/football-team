<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
    <a class="navbar-brand mb-0 h1" href="/">Газовик-Хуртовина</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Головна</a>
            </li>
            <li class="nav-item dropdown">
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">Команди</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/players/adults">Дорослі</a>
                        <a class="dropdown-item" href="/players/adolescents">Юнаки</a>
                        <a class="dropdown-item" href="/players/veterans">Ветерани</a>
                    </div>
                </div>
            </li>
            <#if isAdmin>
                <li class="nav-item dropdown">
                    <div class="dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">Адмін меню</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/users">Список користувачів</a>
                            <a class="dropdown-item" href="/news">Новини</a>
                        </div>
                    </div>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/users/profile">Персональні дані</a>
                </li>
            </#if>
        </ul>

        <#if name!="Guest">
            <div class="navbar-text mr-3">
                Здійснено вхід ${name}
            </div>
            <div>
                <@l.logout/>
            </div>
        <#else>
            <div>
                <a class="btn btn-light" href="/login">Вхід</a>
            </div>
            <div>
                <a class="btn btn-light ml-2" href="/registration">Реєстрація</a>
            </div>
        </#if>

    </div>
</nav>