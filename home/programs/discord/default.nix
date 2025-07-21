# Discord is a popular chat application.
{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
     enable = true;
     vesktop.enable = false;
     dorion.enable = false;
     quickCss = null;
     config = {
       useQuickCss = false;
       themeLinks = [];
       frameless = false;
       plugins = {};
     };
   };

}
