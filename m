Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1818BC636CC
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1OIH0nXN7Bbs8AhBhxSn4boouxlz+e7IDCZnBGoNDQo=; b=l0zFQdy2T02/vd
	H3kCGDOWZo1EaJ+xjKzOUicv5jFHdq3zpfVLQpR2dBkwTchIzozHVfKikAOI3CceEtKvvrrKnrX4P
	x+sWFYIzwXXbvua2di7/W13KpXEk1M+ZIW3w6f2s1IpWgOCwE012H54Wskte7NieAs/drKYStFHbr
	IjYIb8UU/CdW3NIqnywHx1kf1RikTgONSdnBubll6VQmQJ/9/mAuZRQceogjddX8kcDpEDHkEntA/
	S/hR9KGV6o2ErvggpXxPjUVgACZrRuv1QUSQTIbBak2fq4ti8hkN/9BUMSoTZgGTpTmzW1o900+Jn
	XVYIU7rPCkwS9a9x98IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOf9E-006Mdq-7d; Sun, 05 Feb 2023 13:33:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOf9A-006MdA-Go
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 13:33:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F9D6B80B76;
	Sun,  5 Feb 2023 13:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987C1C433D2;
	Sun,  5 Feb 2023 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675604006;
	bh=tQ61PFUR6oRk8EdSJJcibffUsRi86CMd+mljo5z82UQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QcRuP6REKp0L0hsdCeg8pA1S2yg5PONB+dsV33aUAJIQWJB9ITY33laDchqRGjNdi
	 8A33Gil28Zj0veqxEEXEb6TSAPEwN+P1oVGpR24DanZQy3Ge2vpPOZVhvN8Q4qE9A8
	 3U2Hyrhd7TV94unVNPxqmb+ysSvsgnxKpTGTctSDqO/UHRXqBz7esSLHt+iDqc5PUr
	 wVav41jBbSxC0R0xsifQNMJ+Bb7YdFntyH+MZ6n+IasSgJ0C/YqOWqhc30E0hNTSYU
	 hE0N5gPAQi8O6j3x1wZ3UobapgJntqgwALK/h3waVop+n82+3aieM0p60+lu4D5aZt
	 pqwDyk/kwmRSw==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	arnd@arndb.de,
	atishp@rivosinc.com,
	rdunlap@infradead.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: Cleanup rv32_defconfig
Date: Sun,  5 Feb 2023 08:33:07 -0500
Message-Id: <20230205133307.1058814-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_053332_857549_7DCE3C36 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Remove the unused rv32_defconfig file, which has been replaced by
'commit 72f045d19f25 ("riscv: Fixup difference with defconfig")'. Also,
remove CONFIG_32BIT in 32-bit.config, which CONFIG_ARCH_RV32I has
selected.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/configs/32-bit.config  |   2 -
 arch/riscv/configs/rv32_defconfig | 139 ------------------------------
 2 files changed, 141 deletions(-)
 delete mode 100644 arch/riscv/configs/rv32_defconfig

diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
index f6af0f708df4..eb87885c8640 100644
--- a/arch/riscv/configs/32-bit.config
+++ b/arch/riscv/configs/32-bit.config
@@ -1,4 +1,2 @@
 CONFIG_ARCH_RV32I=y
-CONFIG_32BIT=y
-# CONFIG_PORTABLE is not set
 CONFIG_NONPORTABLE=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
deleted file mode 100644
index 38760e4296cf..000000000000
--- a/arch/riscv/configs/rv32_defconfig
+++ /dev/null
@@ -1,139 +0,0 @@
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
-CONFIG_PROFILING=y
-CONFIG_SOC_SIFIVE=y
-CONFIG_SOC_VIRT=y
-CONFIG_NONPORTABLE=y
-CONFIG_ARCH_RV32I=y
-CONFIG_SMP=y
-CONFIG_HOTPLUG_CPU=y
-CONFIG_PM=y
-CONFIG_CPU_IDLE=y
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
-CONFIG_RPMSG_CTRL=y
-CONFIG_RPMSG_VIRTIO=y
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_HUGETLBFS=y
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
