Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7447CF34A2
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+M8T/L/1sWm9y1U9d4Q4046X+6C/GmW4OTNp5hhPfek=; b=Uwg28eklV19cvz
	dxTD7X163ZMzmw183UInn5s12WMcZkrfCUc+TdDTa2rLPUG4bHHQ17jYke00l5lToZkfyF/Rt2uqE
	D/l/Rh1gzI3yxJ4bO2zHGuhhbIH7OaTc4pvulbI3BtAJ1IDCeywpFamXucVQLi/RE9/cVYrMEq0UT
	/qQJA3LU2xit5lcpZ1MAHgjtGAEgOdOMUzPGIl9Bn3ow74+YpyZ8zb1G4H26Rb6x4kaKqiY6UxhNh
	PhnNCLfXJ5fCsh3L0AHqtoy31QtBUmegHaxrW1kGazQk/lZerjow5tWh5Lm/6l/2UVt0ScTaDJ98L
	nvutM4H96PCia13BYUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swL3q-00000009202-0yyK;
	Thu, 03 Oct 2024 12:36:02 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swL3m-000000091yY-08Ca
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 12:36:00 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by albert.telenet-ops.be with cmsmtp
	id Kobp2D00K5K8SYz06obp1J; Thu, 03 Oct 2024 14:35:51 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swL3U-001C1y-Tc;
	Thu, 03 Oct 2024 14:35:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swL3d-006ZmV-32;
	Thu, 03 Oct 2024 14:35:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
Date: Thu,  3 Oct 2024 14:35:47 +0200
Message-Id: <0923c114886cbbb322a9802543177c29cedbdbc1.1727958898.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_053558_233436_3E35B04C 
X-CRM114-Status: GOOD (  14.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RZ/Five cannot be supported by the standard RISC-V defconfig due to its
dependency on NONPORTABLE.  Hence add a separate defconfig for Renesas
RZ/Five boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream integration.
To be applied to my topic/renesas-defconfig branch, which already has
arch/arm64/configs/renesas_defconfig.

Tested with OpenEmbedded nodistro.0 smarc-rzfive (eMMC and nfsroot).

Any other options that should be enabled/disabled?
Thanks for your comments!
---
 MAINTAINERS                         |   3 +
 arch/riscv/configs/rzfive_defconfig | 224 ++++++++++++++++++++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 arch/riscv/configs/rzfive_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a2aa2a1be720821..bf313685817e5228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2924,6 +2924,7 @@ F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
 F:	arch/arm64/configs/renesas_defconfig
 F:	arch/riscv/boot/dts/renesas/
+F:	arch/riscv/configs/rzfive_defconfig
 F:	drivers/pmdomain/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
@@ -19880,6 +19881,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+X:	arch/riscv/configs/rzfive_defconfig
 N:	riscv
 K:	riscv
 
@@ -25752,3 +25754,4 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 F:	*
 F:	*/
 X:	arch/arm64/configs/renesas_defconfig
+X:	arch/riscv/configs/rzfive_defconfig
diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
new file mode 100644
index 0000000000000000..31483a1d520cb124
--- /dev/null
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -0,0 +1,224 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_HUGETLB=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_EXPERT=y
+# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PROFILING=y
+CONFIG_ARCH_RENESAS=y
+CONFIG_ERRATA_SIFIVE=y
+CONFIG_NONPORTABLE=y
+# CONFIG_RISCV_ISA_ZICBOM is not set
+# CONFIG_EFI is not set
+CONFIG_PM_AUTOSLEEP=y
+CONFIG_CPU_IDLE=y
+CONFIG_RISCV_SBI_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_JUMP_LABEL=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NETFILTER=y
+CONFIG_NET_SCHED=y
+CONFIG_NETLINK_DIAG=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CAN=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_PAGE_POOL_STATS=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCIE_XILINX=y
+CONFIG_PCIE_MICROCHIP_HOST=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+# CONFIG_MTD_OF_PARTS is not set
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_SATA_MOBILE_LPM_POLICY=0
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_MD=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_R8169=y
+CONFIG_RAVB=y
+CONFIG_MICREL_PHY=y
+CONFIG_MICROSEMI_PHY=y
+CONFIG_VITESSE_PHY=y
+CONFIG_CAN_RCAR_CANFD=y
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_MOUSE_PS2 is not set
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_DA9063_ONKEY=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_SERIAL_SH_SCI=y
+CONFIG_HVC_RISCV_SBI=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_RIIC=y
+CONFIG_SPI=y
+CONFIG_SPI_RPCIF=y
+CONFIG_SPI_RSPI=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL_DA9062=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_THERMAL=y
+CONFIG_THERMAL_DEBUGFS=y
+CONFIG_CPU_THERMAL=y
+CONFIG_DA9062_THERMAL=y
+CONFIG_RZG2L_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_DA9062_WATCHDOG=y
+CONFIG_RENESAS_RZG2LWDT=y
+CONFIG_MFD_DA9062=y
+CONFIG_RZ_MTU3=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_PCM_TIMER is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_PROC_FS is not set
+# CONFIG_SND_CTL_FAST_LOOKUP is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_PCI is not set
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_RZ=y
+CONFIG_SND_SOC_WM8978=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_RENESAS_USBHS=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_RENESAS_USBHS_UDC=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHI=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_DA9063=y
+CONFIG_DMADEVICES=y
+CONFIG_RZ_DMAC=y
+CONFIG_SYNC_FILE=y
+CONFIG_COMMON_CLK_VC3=y
+CONFIG_RENESAS_OSTM=y
+CONFIG_MAILBOX=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_ARCH_R9A07G043=y
+CONFIG_EXTCON=y
+CONFIG_MEMORY=y
+CONFIG_RENESAS_RPCIF=y
+CONFIG_IIO=y
+CONFIG_RZG2L_ADC=y
+CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_RESET_SIMPLE=y
+CONFIG_PHY_RCAR_GEN3_USB2=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_AUTOFS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V2=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+# CONFIG_NFS_V4_2_READ_PLUS is not set
+CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_APPARMOR=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_CRYPTO_SHA1=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_PRINTK_TIME=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_PAGEALLOC=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_WQ_WATCHDOG=y
+CONFIG_WQ_CPU_INTENSIVE_REPORT=y
+CONFIG_DEBUG_TIMEKEEPING=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_RWSEMS=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DEBUG_LIST=y
+CONFIG_DEBUG_PLIST=y
+CONFIG_DEBUG_SG=y
+CONFIG_RCU_EQS_DEBUG=y
+# CONFIG_FTRACE is not set
+CONFIG_MEMTEST=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
