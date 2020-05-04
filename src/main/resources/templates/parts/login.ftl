<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group">
            <label for="username">Ім'я користувача </label>
            <input id="username" type="text"
                   class="form-control col-sm-5 ${(usernameError??)?string('is-invalid','')}"
                   name="username" placeholder="Username" value="<#if user??>${user.username}</#if>"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label for="email">Електорнна пошта </label>
                <input id="email" type="email"
                       class="form-control col-sm-5 ${(emailError??)?string('is-invalid','')}"
                       name="email" placeholder="Email" value="<#if user??>${user.email}</#if>"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </#if>
        <div class="form-group">
            <label for="password">Пароль </label>
            <input id="password" type="password"
                   class="form-control col-sm-5 ${(passwordError??)?string('is-invalid','')}"
                   name="password" placeholder="Password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label for="passwordConfirm">Повторний пароль</label>
                <input id="passwordConfirm" type="password"
                       class="form-control col-sm-5 ${(passwordConfirmError??)?string('is-invalid','')}"
                       name="passwordConfirm" placeholder="Password confirm"/>
                <#if passwordConfirmError??>
                    <div class="invalid-feedback">
                        ${passwordConfirmError}
                    </div>
                </#if>
            </div>
        </#if>
        <#if isRegisterForm>
            <div class="form-group col-sm-5">
                <div class="g-recaptcha" data-sitekey="6Ldoqq4UAAAAACsXvrRBwKWEJnEP-dW9lGJtg9Nk"></div>
                <#if capthaError??>
                    <div class="alert alert-danger" role="alert">
                        ${capthaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-dark">
            <#if isRegisterForm>Зареєструватись<#else>Увійти</#if>
        </button>
        <#if !isRegisterForm>
            <a class="btn btn-dark ml-1" href="/registration">Реєстрація</a>
        </#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="btn btn-dark" type="submit" value="Вихід"/>
    </form>
</#macro>