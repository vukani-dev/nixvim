{ pkgs, ... }: {
  # Default config just imports base config and adds any general-purpose settings
  imports = [ ./base ];
  
}