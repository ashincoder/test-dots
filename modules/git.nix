{ config, pkgs, libs, ... }: {
  programs.git = {
    enable = true;
    userName = "Ashin Antony";
    userEmail = "ashinant15@gmail.com";
  };
}
