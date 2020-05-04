insert into footballteam.t_user (id, username, password, active, email, activation_code)
values (1, 'admin', '$2a$08$exZUvUM3wxSBru9sBNV1QO0I7gk2sHcY8/bS6R3AikvwmaJFgJly6', true, 'admin@xmailsme.com', null),
       (2, 'user', '$2a$08$exZUvUM3wxSBru9sBNV1QO0I7gk2sHcY8/bS6R3AikvwmaJFgJly6', true, 'user@xmailsme.com', null);

insert into footballteam.t_role (id, name)
values (1, 'ROLE_USER'),
       (2, 'ROLE_ADMIN');

insert into footballteam.t_user_roles (user_id, roles_id)
values (1, 1),
       (1, 2),
       (2, 1);

