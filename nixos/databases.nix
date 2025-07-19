# Database services: PostgreSQL, MySQL, and Redis
{pkgs, config, ...}: {
  services = {
    # PostgreSQL
    postgresql = {
      enable = true;
      package = pkgs.postgresql_15;
      ensureDatabases = [ "${config.var.username}" ];
      ensureUsers = [
        {
          name = "${config.var.username}";
          ensureDBOwnership = true;
        }
      ];
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all 127.0.0.1/32 trust
        host all all ::1/128 trust
      '';
    };

    # MySQL
    mysql = {
      enable = true;
      package = pkgs.mysql80;
      ensureDatabases = [ "${config.var.username}" ];
      ensureUsers = [
        {
          name = "${config.var.username}";
          ensurePermissions = {
            "${config.var.username}.*" = "ALL PRIVILEGES";
          };
        }
      ];
    };

    # Redis
    redis.servers."" = {
      enable = true;
      port = 6379;
    };
  };

  # Ajouter votre utilisateur aux groupes des bases de données
  users.users."${config.var.username}".extraGroups = [ "mysql" "redis" ];
}
