<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <#if isAdmin>
        <a class="btn btn-dark" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            Додати новину
        </a>

        <div class="collapse <#if new??>show</#if>" id="collapseExample">
            <div class="form-group">
                <form method="post" action="/news/add" enctype="multipart/form-data">
                    <div class="form-group mt-3">
                        <label>
                            <input type="text" class="form-control ${(titleError??)?string('is-invalid','')}"
                                   name="title" value="<#if new??>${new.title}</#if>"
                                   placeholder="Заголовок">
                        </label>
                        <#if titleError??>
                            <div class="invalid-feedback">
                                ${titleError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label>
                            <input type="text" class="form-control ${(subTitleError??)?string('is-invalid','')}"
                                   name="subTitle"
                                   value="<#if new??>${new.subTitle}</#if>" placeholder="Підзаголовок">
                        </label>
                        <#if subTitleError??>
                            <div class="invalid-feedback">
                                ${subtitleError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label>
                            <input type="text" class="form-control ${(textError??)?string('is-invalid','')}"
                                   name="text"
                                   value="<#if new??>${new.text}</#if>" placeholder="Текст">
                        </label>
                        <#if textError??>
                            <div class="invalid-feedback">
                                ${textError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile" name="multipartFile">
                            <label class="custom-file-label" for="customFile">Виберіть фото</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div class="form-group">
                        <button class="btn btn-dark" type="submit">Створити новину</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="d-block p-2 bg-dark text-white mb-3 mt-3">Список новин</div>
        <div class="card-columns">
            <#list news as new>
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="/file/${new.file.id}" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">${new.title}</h5>
                        <p class="card-text">${new.subTitle}</p>
                    </div>
                    <div class="card-body">
                        <form action="news/delete/${new.id}" class="form-inline">
                            <button class="btn btn-dark ml-1" type="submit">Видалити новину</button>
                        </form>
                    </div>
                </div>
            <#else>
                Список новин порожній !
            </#list>
        </div>
    </#if>
</@c.page>