From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 01 Nov 2018 10:54:45 -0700 (PDT)
Subject: [PATCH v2 1/2] RISC-V: refresh defconfig
In-Reply-To: <20181101051033.10089-1-anup@brainfault.org>
Message-ID: <mhng-aa34e7bb-f14c-4fc8-8ff6-cb70ba397746@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 31 Oct 2018 22:10:32 PDT (-0700), anup at brainfault.org wrote:
> This patch updates defconfig using savedefconfig on Linux-4.19.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/configs/defconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 36473d7dbaac..07fa9ea75fea 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -1,6 +1,3 @@
> -CONFIG_SMP=y
> -CONFIG_PCI=y
> -CONFIG_PCIE_XILINX=y
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
>  CONFIG_IKCONFIG=y
> @@ -11,10 +8,15 @@ CONFIG_CFS_BANDWIDTH=y
>  CONFIG_CGROUP_BPF=y
>  CONFIG_NAMESPACES=y
>  CONFIG_USER_NS=y
> +CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> -CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BPF_SYSCALL=y
> +CONFIG_SMP=y
> +CONFIG_PCI=y
> +CONFIG_PCIE_XILINX=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> @@ -59,6 +61,7 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
>  CONFIG_VIRTIO_MMIO=y
> +CONFIG_SIFIVE_PLIC=y
>  CONFIG_RAS=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> @@ -72,8 +75,5 @@ CONFIG_NFS_V4=y
>  CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
> -# CONFIG_RCU_TRACE is not set
>  CONFIG_CRYPTO_USER_API_HASH=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -CONFIG_SIFIVE_PLIC=y
> +# CONFIG_RCU_TRACE is not set

Oh, sorry, I sent my version before seeing yours.  Looks like they're exactly 
the same, which is probably a good sign.  I'll send this one instead.
