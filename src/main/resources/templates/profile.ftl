<#import "parts/common.ftl" as c>

<@c.page>
    <h5>${username}</h5>
    ${message?ifExists}
    <form method="post">
        <div class="form-group">
            <label for="exampleInputPassword1">Password </label>
            <input id="exampleInputPassword1" type="password" class="form-control col-sm-5" name="password"
                   placeholder="Password"/>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Email </label>
            <input id="exampleInputPassword1" type="email" class="form-control col-sm-5" name="email"
                   placeholder="Email" value="${email}"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-dark">
            Save
        </button>
    </form>
</@c.page>
