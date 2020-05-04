<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <#if isAdmin>
        <a class="btn btn-outline-dark" data-toggle="collapse" href="#collapseExample" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">
            Додати нового гравця
        </a>

        <div class="collapse <#if player??>show</#if>" id="collapseExample">
            <div class="form-group">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group mt-3">
                        <label>
                            <input type="text" class="form-control ${(nameError??)?string('is-invalid','')}"
                                   name="name" value="<#if player??>${player.name}</#if>"
                                   placeholder="Ім'я гравця">
                        </label>
                        <#if nameError??>
                            <div class="invalid-feedback">
                                ${nameError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label>
                            <input type="text" class="form-control ${(surnameError??)?string('is-invalid','')}"
                                   name="surname"
                                   value="<#if player??>${player.surname}</#if>" placeholder="Прізвище гравця">
                        </label>
                        <#if surnameError??>
                            <div class="invalid-feedback">
                                ${surnameError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="ageCategory">Вікова категорія команди</label>
                        <select class="form-control" id="ageCategory" name="ageCategory">
                            <option>adults</option>
                            <option>adolescents</option>
                            <option>veterans</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="position">Основна позиція</label>
                        <select class="form-control" id="position" name="position">
                            <option>gk</option>
                            <option>df</option>
                            <option>mf</option>
                            <option>cf</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>
                            <input type="number" class="form-control" name="shirtNumber" placeholder="Номер футболки">
                        </label>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile" name="multipartFile">
                            <label class="custom-file-label" for="customFile">Виберіть фото</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div class="form-group">
                        <button class="btn btn-dark" type="submit">Створити гравця</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>
    <div class="d-block p-2 bg-dark text-white mb-3 mt-3 text-monospace font-bolder">Список гравців</div>
    <div class="card-columns" style="display: flex;flex-wrap: wrap;justify-content: space-around;">
        <#list players as player>
            <div class="card" style="width: 100%; max-width: 25%">
                <#if player.file??>
                    <img class="card-img-top" src="/file/${player.file.id}" alt="Card image cap">
                </#if>
                <div class="card-body">
                    <h5 class="card-title">${player.name} ${player.surname}</h5>
                    <div class="card-text">
                        Номер футболки
                        <p class="badge badge-dark">${player.shirtNumber}</p>
                    </div>
                    <div class="card-text">
                        Позиція
                        <p class="badge badge-dark">${player.position}</p>
                    </div>
                </div>
                <#if isAdmin>

                    <form action="/delete/${player.id}/${ageCategory}" class="form-inline mb-3 ml-3">
                        <button class="btn btn-dark ml-1" type="submit">Видалити гравця</button>
                    </form>
                </#if>
            </div>
        <#else>
            Список гравців порожній !
        </#list>
    </div>
</@c.page>
