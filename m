From: anup@brainfault.org (Anup Patel)
Date: Tue, 30 Oct 2018 18:07:20 +0530
Subject: [PATCH] RISC-V: defconfig: Enable printk timestamps
Message-ID: <20181030123720.3273-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The printk timestamps are very useful information to visually see
where kernel is spending time during boot. It also helps us see
the timing of hotplug events at runtime.

This patch enables printk timestamps in RISC-V defconfig so that
we have it enabled by default (similar to other architectures
such as x86_64, arm64, etc).

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/configs/defconfig | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 36473d7dbaac..ef4f15df9adf 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -1,6 +1,3 @@
-CONFIG_SMP=y
-CONFIG_PCI=y
-CONFIG_PCIE_XILINX=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_IKCONFIG=y
@@ -11,10 +8,15 @@ CONFIG_CFS_BANDWIDTH=y
 CONFIG_CGROUP_BPF=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BPF_SYSCALL=y
+CONFIG_SMP=y
+CONFIG_PCI=y
+CONFIG_PCIE_XILINX=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -59,6 +61,7 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_SIFIVE_PLIC=y
 CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
@@ -72,8 +75,6 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RCU_TRACE is not set
 CONFIG_CRYPTO_USER_API_HASH=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_SIFIVE_PLIC=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_RCU_TRACE is not set
-- 
2.17.1
