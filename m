Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07441C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vADmhQHJSbS7tiBMgOBdjZ5FmrF+Iqqne0Xsri4hd6s=; b=OnO1Qk6PrAzHvh
	t+4e7dsXie72qmJv3kDMVtuDyYREKdGNXkIMLlJ9R2Nhxo8klpoyf+AATAdatH+CHCpW2v2z17DBz
	IW888xretPNgpRyEwOfHIFUP0usx9KEkaKCfmYI9rWVX17GNU0B0Vq5DL6g2K0iwOTrI4Kxt+/1B0
	msaIZ1goFyxVNDc/NoyX7w+WKbN5Jmuu4H3mGhw/bKRUTPXdDE26TB/FUgH755koMjCwizyqW6cA0
	cR95x0NMcWkyYfTE48ec6vxxVh8E7M9tzoM66bEdQcVBITAW6pllPYeoTJUZRLD8c7Hy/wwmzrwrh
	GZBSjpBtGxLiMMbfniWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN9ys-00HRLB-Lq; Thu, 24 Feb 2022 09:00:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN9uj-00HOYt-BX; Thu, 24 Feb 2022 08:55:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD8B061B24;
 Thu, 24 Feb 2022 08:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1583EC340EB;
 Thu, 24 Feb 2022 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645692952;
 bh=BMSJuM6mp3gNfGG4OzFVpdae7Wlvs48nLdEAGUhT22s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WmH0Jsml56oxEaNnlQC164M+gJJq3queepPc11VKswmuGu/rs7PNCZWDP8mvrqcIa
 YpbhMjDSzMscYjy5QvcNQxvXrHvKXbkkDoXwcAHdhQw0oqTmHbCdKGBZiHoZ48Bh3H
 8Pqyus5246CzI6Ksb/Z6h3PdmTIeTqq3LdI6ADyRcYoDUUUa5eIk0B2LVibJZUn3Yo
 NKUgSz3BxjuctFbCeQr2aDx+hCgKTYYJ4aeM7a/JicUrFC0WIW6Vq5lk0t4bssVxBL
 ivt4e3yq+kj5DTAo4ZDGivk71eHGubFD+xDdpgYlBUBGrDe9QZJ2N+hTK7Ye7Y+oCm
 OVYtTSR82f+SA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V6 08/20] riscv: Fixup difference with defconfig
Date: Thu, 24 Feb 2022 16:53:58 +0800
Message-Id: <20220224085410.399351-9-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224085410.399351-1-guoren@kernel.org>
References: <20220224085410.399351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_005553_499058_76AC2814 
X-CRM114-Status: GOOD (  11.51  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Let's follow the origin patch's spirit:

The only difference between rv32_defconfig and defconfig is that
rv32_defconfig has  CONFIG_ARCH_RV32I=y.

This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.

Fixes: 1b937e8faa87ccfb ("RISC-V: Add separate defconfig for 32bit systems")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/Makefile               |   4 +
 arch/riscv/configs/rv32_defconfig | 135 ------------------------------
 2 files changed, 4 insertions(+), 135 deletions(-)
 delete mode 100644 arch/riscv/configs/rv32_defconfig

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..c6ca1b9cbf71 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -154,3 +154,7 @@ PHONY += rv64_randconfig
 rv64_randconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
 		-f $(srctree)/Makefile randconfig
+
+PHONY += rv32_defconfig
+rv32_defconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 32-bit.config
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
deleted file mode 100644
index 8b56a7f1eb06..000000000000
--- a/arch/riscv/configs/rv32_defconfig
+++ /dev/null
@@ -1,135 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_BPF_SYSCALL=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_CGROUPS=y
-CONFIG_CGROUP_SCHED=y
-CONFIG_CFS_BANDWIDTH=y
-CONFIG_CGROUP_BPF=y
-CONFIG_NAMESPACES=y
-CONFIG_USER_NS=y
-CONFIG_CHECKPOINT_RESTORE=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_SYSFS_SYSCALL is not set
-CONFIG_SOC_SIFIVE=y
-CONFIG_SOC_VIRT=y
-CONFIG_ARCH_RV32I=y
-CONFIG_SMP=y
-CONFIG_HOTPLUG_CPU=y
-CONFIG_VIRTUALIZATION=y
-CONFIG_KVM=m
-CONFIG_JUMP_LABEL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-CONFIG_NETLINK_DIAG=y
-CONFIG_NET_9P=y
-CONFIG_NET_9P_VIRTIO=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCI_HOST_GENERIC=y
-CONFIG_PCIE_XILINX=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_VIRTIO_BLK=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_SCSI_VIRTIO=y
-CONFIG_ATA=y
-CONFIG_SATA_AHCI=y
-CONFIG_SATA_AHCI_PLATFORM=y
-CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-CONFIG_MACB=y
-CONFIG_E1000E=y
-CONFIG_R8169=y
-CONFIG_MICROSEMI_PHY=y
-CONFIG_INPUT_MOUSEDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
-CONFIG_HVC_RISCV_SBI=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_HW_RANDOM_VIRTIO=y
-CONFIG_SPI=y
-CONFIG_SPI_SIFIVE=y
-# CONFIG_PTP_1588_CLOCK is not set
-CONFIG_DRM=y
-CONFIG_DRM_RADEON=y
-CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_FB=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_USB=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_PLATFORM=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_HCD_PLATFORM=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB_UAS=y
-CONFIG_MMC=y
-CONFIG_MMC_SPI=y
-CONFIG_RTC_CLASS=y
-CONFIG_VIRTIO_PCI=y
-CONFIG_VIRTIO_BALLOON=y
-CONFIG_VIRTIO_INPUT=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_RPMSG_CHAR=y
-CONFIG_RPMSG_VIRTIO=y
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
-CONFIG_NFS_V4_2=y
-CONFIG_ROOT_NFS=y
-CONFIG_9P_FS=y
-CONFIG_CRYPTO_USER_API_HASH=y
-CONFIG_CRYPTO_DEV_VIRTIO=y
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_PAGEALLOC=y
-CONFIG_SCHED_STACK_END_CHECK=y
-CONFIG_DEBUG_VM=y
-CONFIG_DEBUG_VM_PGFLAGS=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_DEBUG_PER_CPU_MAPS=y
-CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_WQ_WATCHDOG=y
-CONFIG_DEBUG_TIMEKEEPING=y
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_DEBUG_RWSEMS=y
-CONFIG_DEBUG_ATOMIC_SLEEP=y
-CONFIG_STACKTRACE=y
-CONFIG_DEBUG_LIST=y
-CONFIG_DEBUG_PLIST=y
-CONFIG_DEBUG_SG=y
-# CONFIG_RCU_TRACE is not set
-CONFIG_RCU_EQS_DEBUG=y
-# CONFIG_FTRACE is not set
-# CONFIG_RUNTIME_TESTING_MENU is not set
-CONFIG_MEMTEST=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
