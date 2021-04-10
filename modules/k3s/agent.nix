{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];

  services.k3s.role = "agent";
  # copied from server from martha:/var/lib/rancher/k3s/server/node-token
  services.k3s.tokenFile = "/etc/nixos/secrets/k3s-server-token";
  services.k3s.serverAddr = "https://martha.thalheim.io:6443";
  services.k3s.extraFlags = "--container-runtime-endpoint unix:///run/containerd/containerd.sock";
}
