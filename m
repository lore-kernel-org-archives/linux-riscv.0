Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7157C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQFwTvDo8qKVTMmW2PWTtxvwc7jEWWn3vGXBIjqU45c=; b=ZnHycp+CH19FrC
	tIKFRUvhgt4GN+kYVzEQOaC6melS9vBBLOwwk4VwPZ43v/NFj/qi3REEngOAZAqQIEudCCKiEFmcY
	2VQIR1U+xhX8exZh7leQ6T8FrjqXqNulqCvCIhcKUr0+A5nLAELoQZbr70jdZU6yR/BAuCKPqHD5d
	oflYZS94kJz9e7P+sMH/RieuZTIzlR6obuD0eCywBCOogU8Ne1WGBBfnWjddBfN+J4Vm4H0uLYZan
	zqWpIrtc00Vcxdz3ZmIWbeYLbOupNS2MwwObNGFkCmfW7p/aHLvx17WniheAxc3OTALCGqQO5V3zp
	2y/steRo97fgUmEse0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi7M-007Zsi-Tr; Tue, 21 Dec 2021 16:36:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7J-007Zrg-Hb
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:35:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A83EB817AF;
 Tue, 21 Dec 2021 16:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85005C36AEC;
 Tue, 21 Dec 2021 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104554;
 bh=37IMHVJWT8iFSW/Zorv/QJp1kD8U97EWQ2fm9ilMpcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VfEInCc2gJ4DYuWbzUYNrwXfVQGQjJAMy91gcX96jrWtFEc29ZVC7UnokxDKgBzSh
 a9x1wEB96ZmjCL7OfQKIgr/f5kSzJe3XqtPnT596EG6n99f8KjhHvHWVBbWQKFbXle
 rfRv98Icm3wXYg/4FvFUlNNQwHRqPuJYRQ7lbiJzPf61nWstQBQOyfNeGPL/T5MeyT
 79zCVZ+79QIGx5KwYAwSQLFvxgIfK7CJSTWEDjLIw3j6RwKKAUNK1QQpvY9dqadVsf
 6uB85ssbwsCR2zticdQLEcnTtdB7XkwxhYSSDO1GfwhJpyShJS+XVjdI172ra2x/kQ
 Lf7h36qQ+L9HA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 02/13] riscv: Fixup difference with defconfig
Date: Wed, 22 Dec 2021 00:35:21 +0800
Message-Id: <20211221163532.2636028-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083557_889197_F192DB3D 
X-CRM114-Status: UNSURE (   9.55  )
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

Let's follow the origin patch's spirit.

The only difference between rv32_defconfig and defconfig is that
rv32_defconfig has  CONFIG_ARCH_RV32I=y.

This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.

Fixes: 1b937e8faa87ccfb ("RISC-V: Add separate defconfig for 32bit systems")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/configs/rv32_defconfig | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 6e9f12ff968a..d858906cff2d 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -1,3 +1,4 @@
+CONFIG_ARCH_RV32I=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
@@ -16,7 +17,7 @@ CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
-CONFIG_ARCH_RV32I=y
+CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_VIRTUALIZATION=y
@@ -41,10 +42,12 @@ CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_XILINX=y
+CONFIG_PCIE_FU740=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_NVME=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_VIRTIO=y
@@ -68,11 +71,14 @@ CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_POWER_RESET=y
-CONFIG_DRM=y
-CONFIG_DRM_RADEON=y
-CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM=m
+CONFIG_DRM_RADEON=m
+CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
@@ -83,6 +89,9 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
@@ -105,6 +114,8 @@ CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=m
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
@@ -133,3 +144,4 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
 # CONFIG_SYSFS_SYSCALL is not set
+CONFIG_EFI=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
