{config, pkgs, ...}:
{
  imports = 
  [
    #./vfio.nix
    #./acpi_call.nix
  ];

  programs.virt-manager.enable = true;
  virtualisation.libvirtd =
  {
    enable = true; 
    qemu = 
    {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = 
      {
        enable = true;
        packages =
        [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;
  services = {
    spice-autorandr.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };
}
