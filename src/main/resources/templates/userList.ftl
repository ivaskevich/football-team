<#import "parts/common.ftl" as c>

<@c.page>
    User list
    <table class="table table-striped">
        <thead>
        <th>Name</th>
        <th>Role</th>
        <th>Edit</th>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>
                    ${user.username}
                </td>
                <td>
                    <#list user.roles as role>
                        ${role.name}<#sep>,
                    </#list>
                </td>
                <td>
                    <a class="btn btn-dark" href="/users/${user.id}">Edit</a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>