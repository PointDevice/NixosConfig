let
  # laptop RTX 4060
  gpuIDs = [
    "10de:28e0" # Graphics
    "10de:22be" # Audio
  ];
in { pkgs, lib, config, ... }: {
  #options.vfio.enable = with lib;
  #  mkEnableOption "Configure the machine for VFIO";

  #config = let cfg = config.vfio;
  #in {
    boot = {
      initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
        "kvm-intel"
        #"vfio_virqfd" - suposedly built in to kernel now

        "nvidia"
        "nvidia_modeset"
        "nvidia_uvm"
        "nvidia_drm"
      ];

      kernelParams = [
        # enable IOMMU
        "Intel_iommu=on"
      ]; #++ lib.optional cfg.enable
        # isolate the GPU
        #("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs);
    };

    hardware.opengl.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  #};
}
