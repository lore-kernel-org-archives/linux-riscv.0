Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AE0C61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c3JItcqHNK30Qm5Aj5F2f1fMkUIDtLPRZBZV7rQ4WdM=; b=04c2w5syN94eE5
	oOg6qikSYVRwb8lh5gkfqwoLsjeL146Tq7P89uMS/L2fYbFZGsOW6T+2tgp1vLik5tDCU21Yvh19g
	qSk88slmJatCY85O9iJ6L/DVUWVQ3KuHFQfO1BfMF54H/qefM+ZpH+56/XBLITJgD8luXhAseQyX3
	Keqr/Hd8BQiYEEM2EwCS3zCpSV6z2qJ/LUcl6bN3Tcjq7H3AFXZQlkJ7xJexoQNWYSrMGITf8jtk5
	6Cr0063OzFkbqDYnabCbOrikIY8yF+Yu7atqitlt1zqj28+PU0GPhJYRKYFzA13xT4WKuJyhgDQZF
	YDwj2WvItlVzI6Qc+bTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZcW-000DSm-0q;
	Tue, 21 Nov 2023 22:53:28 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZcT-000DSF-0J
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 22:53:26 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cbbfdf72ecso1037748b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 14:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700607202; x=1701212002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0tON6NhtrNElMNXfQn/4ERggbp9sDlCFXxxYXR10S0=;
        b=HLXMCC3ddfQLypxyrNO890DiQgTTx/XR9/E+wdLYSQJ0OFVPFcGk4cgALXiIVPBsIv
         hho0/ZJW55se1c7szh0XMxtG0AShvvxDFGK7EiRoCo9SUKkUh3OOL6o3Sii0f6Rtgy7m
         0UQDLJCoK/j8Qo7Qe+RcjNi4uK4KLFe6OVxDynmwSpi+znPTTGJD+Q5eSe3lNr3UxZsk
         de//UDj6CvaPvlUBtFt/P6AG08kpDpOT6Yu+hwZIU4HXcrkYT2gvZFxoi1siHfS/MqnQ
         vD2g19MkjFeKWHNsXF3uhhaQREj7llTInKa5Au2khIifXFnuk5VMNb5bimI6loxRWmAH
         H/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700607202; x=1701212002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0tON6NhtrNElMNXfQn/4ERggbp9sDlCFXxxYXR10S0=;
        b=MH5WizW4BufwhZI6hT847QRSuCLF3cPTvpRFHk4YXIU2Cp496ogLq9OgI5l/sPzTGD
         pGJDD/mX7oHaf4roKxENO0PWDcWvVQymh706+KpOgZDJoOhpIq8GoerO83oRt84j3kjq
         vywayq5hWpubJsoAfoc5FAujsGDeKtjtyb2HOjPk8rMcmpEzGoVoEyoKMayVPfniiS/+
         8qftdmCO36Wl7uAHleNCOqiDc483rluwykTQ0hDb29yhon3UhaVpGkOwdnwvMVmpfdzW
         qD7LsYpqqEMMNdpKqrC+gsx38hNGXo0tYDxuhkvIGfOxnX7htlupV41cMZ0n1PDML+Bd
         wZbA==
X-Gm-Message-State: AOJu0YzCpjBChp47oEjbLpRrbkDqL5wft2fclDNwkrmnzrMMGyqV9QZH
	bXQq9Hjav3mvjNwiuqJQICWrVQ==
X-Google-Smtp-Source: AGHT+IEymVztgaDeCf5f5ir/N8tK8WfALZJaoFISW9RDdWSI1iKazifsGN7ra8fscYR/itU7sJHYeQ==
X-Received: by 2002:a05:6a00:429b:b0:6c6:b5ae:15a4 with SMTP id bx27-20020a056a00429b00b006c6b5ae15a4mr742803pfb.20.1700607202051;
        Tue, 21 Nov 2023 14:53:22 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4217873pfl.215.2023.11.21.14.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 14:53:21 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ian Kent <raven@themaw.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Joachim <svenjoac@gmx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Remove obsolete rv32_defconfig file
Date: Tue, 21 Nov 2023 14:53:18 -0800
Message-ID: <20231121225320.3430550-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_145325_205929_981883D0 
X-CRM114-Status: UNSURE (   7.61  )
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

This file is not used since commit 72f045d19f25 ("riscv: Fixup
difference with defconfig"), where it was replaced by the
32-bit.config fragment. Delete the old file to avoid any confusion.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/configs/rv32_defconfig | 139 ------------------------------
 1 file changed, 139 deletions(-)
 delete mode 100644 arch/riscv/configs/rv32_defconfig

diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
deleted file mode 100644
index 89b601e253a6..000000000000
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
-CONFIG_AUTOFS_FS=y
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
