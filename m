From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 02 Oct 2018 11:43:00 -0700 (PDT)
Subject: VirtIO GPU in QEMU
Message-ID: <mhng-e8ffbf9d-9789-4256-b808-6b6bc1a17647@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Alistair recently (maybe 6 weeks ago) posted some patches to the QEMU mailing 
list to enable support for VirtIO GPU devices on the RISC-V virt machine in 
QEMU.  I've been excited to try these out for a while and finally got around to 
in this morning.  I'm using QEMU master with his patches applied

    * 3db98f2e2f8d - (HEAD -> vga) hw/riscv/virt: Connect a VirtIO net PCIe device (2 hours ago) <Alistair Francis>
    * 2542422da056 - hw/riscv/sifive_u: Connect the Xilinx PCIe (2 hours ago) <Alistair Francis>
    * 8bf2bc25d2ec - riscv: Enable VGA and PCIE_VGA (2 hours ago) <Alistair Francis>
    * 7e872529c291 - hw/riscv/virt: Connect the gpex PCIe (2 hours ago) <Alistair Francis>
    * ac38103d897b - hw/riscv/virt: Increase the number of interrupts (2 hours ago) <Alistair Francis>
    *   3892f1f1a963 - (origin/master, origin/HEAD, master) Merge remote-tracking branch 'remotes/dgibson/tags/libfdt-20181002' into staging (10 hours ago) <Peter Maydell>
    |\
    | * 0b001b3094bc - Update dtc/libfdt submodule to v1.4.7 (15 hours ago) <David Gibson>
    * |   8f09da690f84 - Merge remote-tracking branch 'remotes/xtensa/tags/20181001-xtensa' into staging (11 hours ago) <Peter Maydell>

and on the kernel side I'm using 4.19-rc5.  After twiddling some QEMU 
command-line options, I've ended up with

    ./riscv64-softmmu/qemu-system-riscv64 -machine virt -smp 2 -m 2G -kernel /home/palmer/work/riscv/riscv-pk/build/bbl -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0 -append "console=ttyS0 ro root=/dev/vda" -device virtio-blk-device,drive=hd0 -drive file=stage4-disk.img,format=raw,id=hd0 -device virtio-net-device,netdev=usernet -netdev user,id=usernet,hostfwd=tcp::10000-:22 -device virtio-gpu

and the following diff from 4.19-rc5's kernel defconfig (which appears to be 
mostly noise)

    $ diff -u defconfig arch/riscv/configs/defconfig 
    --- defconfig	2018-10-02 11:39:47.831328320 -0700
    +++ arch/riscv/configs/defconfig	2018-09-28 16:29:21.682511931 -0700
    @@ -1,3 +1,6 @@
    +CONFIG_SMP=y
    +CONFIG_PCI=y
    +CONFIG_PCIE_XILINX=y
     CONFIG_SYSVIPC=y
     CONFIG_POSIX_MQUEUE=y
     CONFIG_IKCONFIG=y
    @@ -8,17 +11,10 @@
     CONFIG_CGROUP_BPF=y
     CONFIG_NAMESPACES=y
     CONFIG_USER_NS=y
    -CONFIG_CHECKPOINT_RESTORE=y
     CONFIG_BLK_DEV_INITRD=y
     CONFIG_EXPERT=y
    +CONFIG_CHECKPOINT_RESTORE=y
     CONFIG_BPF_SYSCALL=y
    -CONFIG_SMP=y
    -CONFIG_PCI=y
    -CONFIG_PCIEPORTBUS=y
    -CONFIG_PCI_HOST_GENERIC=y
    -CONFIG_PCIE_XILINX=y
    -CONFIG_MODULES=y
    -CONFIG_MODULE_UNLOAD=y
     CONFIG_NET=y
     CONFIG_PACKET=y
     CONFIG_UNIX=y
    @@ -52,8 +48,6 @@
     # CONFIG_PTP_1588_CLOCK is not set
     CONFIG_DRM=y
     CONFIG_DRM_RADEON=y
    -CONFIG_DRM_VGEM=y
    -CONFIG_DRM_VIRTIO_GPU=y
     CONFIG_FRAMEBUFFER_CONSOLE=y
     CONFIG_USB=y
     CONFIG_USB_XHCI_HCD=y
    @@ -64,11 +58,8 @@
     CONFIG_USB_OHCI_HCD_PLATFORM=y
     CONFIG_USB_STORAGE=y
     CONFIG_USB_UAS=y
    -CONFIG_VIRTIO_PCI=y
    -CONFIG_VIRTIO_BALLOON=y
    -CONFIG_VIRTIO_INPUT=y
     CONFIG_VIRTIO_MMIO=y
    -CONFIG_SIFIVE_PLIC=y
    +CONFIG_RAS=y
     CONFIG_EXT4_FS=y
     CONFIG_EXT4_FS_POSIX_ACL=y
     CONFIG_AUTOFS4_FS=y
    @@ -81,5 +72,8 @@
     CONFIG_NFS_V4_1=y
     CONFIG_NFS_V4_2=y
     CONFIG_ROOT_NFS=y
    -CONFIG_CRYPTO_USER_API_HASH=y
     # CONFIG_RCU_TRACE is not set
    +CONFIG_CRYPTO_USER_API_HASH=y
    +CONFIG_MODULES=y
    +CONFIG_MODULE_UNLOAD=y
    +CONFIG_SIFIVE_PLIC=y

I can finally get to the point where I see "*ERROR Failed setting up TTM BO 
subsystem", which cascades into an error probing the virtio_gpu device.

I was wondering if anyone else has tried these patches?

Time permitting I'll take a look, but no promises...
