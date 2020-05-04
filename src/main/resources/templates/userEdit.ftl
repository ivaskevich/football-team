<#import "parts/common.ftl" as c>

<@c.page>
    User edit
    <form action="/users" method="post">
        <div class="form-group">
            <label>
                <input type="text" class="form-control" name="username" value="${user.username}">
            </label>
        </div>
        <div class="form-group">
            <#list roles as role>
                <div>
                    <label>
                        <input type="checkbox"
                               name="${role.name}" ${user.roles?seq_contains(role)?string("checked","")}>
                        ${role.name}
                    </label>
                    </label>
                </div>
            </#list>
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-dark">Save</button>
    </form>
</@c.page>