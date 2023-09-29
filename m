Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBB4E743D4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kO5hNOmnGMFDfXH9/m+lddyNKJoZUgx5+MnY9m8kG7s=; b=43c77Ckwqsoa+P
	2cwjvzoqkr3QaR3efIhreFaHxOwMZXY//ugOqjQYdUdR0yAzQFqGR0BjhrvqwIDM+1oMNDd2yvh0m
	/R1FW2OG5GBdPkbKuogdsNPmtylkGKaesrvbuM5jtRKUArpIZiKEzo4P7oyptworX8ZiNBamfxzjr
	8IpvlBxn7khxW8x2+KCbMSBPFjM44Xv0vi6KRWzWs8sCGBd8gCF/HXFU9A7Gi5ykzxunw1yYOwtpG
	KmxISnuyxeDDHRAjjwZOpKx6djql/50zlxAueIy9usSHhKhdhtWONVL2OD91tta6FujguNSBmh3Gj
	RQnj1ZV42qxR0X1SDC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12t-006tqv-2H;
	Fri, 29 Sep 2023 00:07:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12n-006tmQ-0w
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:07:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4064014bca5so53355205e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695946064; x=1696550864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5OD6QfO8UFj6rBKfs0pqCOiEIzLk/acverJtq6us9U=;
        b=hk8C6H12gugspcJoOCeHEVgMP1Yd1M7GLSU+zzK5foqHIBETkIyyL52Bau6RSBR1OL
         EveImgiD8TKmXYOhztdqPEVwOJmJAqkxC1IR+tDdUVvVjkEpmyRaNbc+r3FIY4w0PPSh
         gUyr8qHtxKhXJdBoLY75c0nmnaLhgHJ8VpNUQXASYZOCbZsKfxFP41Kk3DDDxadBEvW+
         j2RsmqbNtdHMuS9xCYNXYlTa9CcGb4TifT8c8KC0BI9DECJFqxgJAm4RMNN9EIOwak7X
         Yk32IwxOZzZReAgCRlygjgS+1duqarYxn2g83FwERFk1w3iNpxFuNbDArLN4vOaKk5nd
         wiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946064; x=1696550864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5OD6QfO8UFj6rBKfs0pqCOiEIzLk/acverJtq6us9U=;
        b=hUULmezszYgpJiVMfHJOJNoYXOOf6qw67YTyLPEgW1XL4UN4GE7J5s2vcuXdnQBRzs
         u48VsYQQgypLgnLIPAGPaKFblH0P0iCwU70KAJA1b7JynqCWsWh6nkkD2B/pJMS/ji/J
         /bmTCKtW3qRxN06bcqw6xvXs76wR5ob+bTRRN6u0iP7NvY95JA31xChEfOq/viUnIcAd
         WiXiVlTFbVKpcggXJ238nUuQIrX2zHb5POHj1d6Kx+wKqYW43QULPBuWVn+CDFMOoQtk
         tYQYjQSWuG8m4CVed1TRWcKFjRqpftcDJEYvk+8wq3fcquXJVLDXMONpeVWl3KxET4wN
         SlmQ==
X-Gm-Message-State: AOJu0YyxfqfKTbBd+AHuSTrV9caQyOZB/tN49uUA3to7t1Br20EvsYLR
	iUtc7t9pVfP7vn0e0YVwOjc=
X-Google-Smtp-Source: AGHT+IEZsec19x4Dyp5Qyd9/dFnOI7gl2COruqQpH5xdgflyCZasqF1DinDundjYp1jJ68yPiLXLMQ==
X-Received: by 2002:a7b:cb8d:0:b0:406:177e:5df7 with SMTP id m13-20020a7bcb8d000000b00406177e5df7mr2657926wmi.29.1695946063658;
        Thu, 28 Sep 2023 17:07:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fe98:5e2c:1821:4cb6])
        by smtp.gmail.com with ESMTPSA id y20-20020a7bcd94000000b004030e8ff964sm245667wmj.34.2023.09.28.17.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:07:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] riscv: configs: defconfig: Enable configs required for RZ/Five SoC
Date: Fri, 29 Sep 2023 01:07:04 +0100
Message-Id: <20230929000704.53217-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_170745_352391_1BD39256 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the configs required by the below IP blocks which are
present on RZ/Five SoC:
* ADC
* CANFD
* DMAC
* eMMC/SDHI
* OSTM
* RAVB (+ Micrel PHY)
* RIIC
* RSPI
* SSI (Sound+WM8978 codec)
* Thermal
* USB (PHY/RESET/OTG)

Along with the above some core configs are enabled too,
-> CPU frequency scaling as RZ/Five does support this.
-> MTD is enabled as RSPI can be connected to flash chips
-> Enabled I2C chardev so that it enables userspace to read/write
   i2c devices (similar to arm64)
-> Thermal configs as RZ/Five SoC does have thermal unit
-> GPIO regulator as we might have IP blocks for which voltage
   levels are controlled by GPIOs
-> OTG configs as RZ/Five USB can support host/function
-> Gadget configs so that we can test USB function (as done in arm64
   all the gadget configs are enabled)

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/configs/defconfig | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..1e81c865a271 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -36,6 +36,13 @@ CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=m
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
+CONFIG_CPUFREQ_DT=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
@@ -94,6 +101,7 @@ CONFIG_NETLINK_DIAG=y
 CONFIG_CGROUP_NET_PRIO=y
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
+CONFIG_CAN=m
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
@@ -101,6 +109,11 @@ CONFIG_PCIE_XILINX=y
 CONFIG_PCIE_FU740=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
@@ -123,8 +136,11 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
+CONFIG_RAVB=y
 CONFIG_STMMAC_ETH=m
+CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
+CONFIG_CAN_RCAR_CANFD=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -135,16 +151,24 @@ CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_MV64XXX=m
+CONFIG_I2C_RIIC=y
 CONFIG_SPI=y
+CONFIG_SPI_RSPI=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_GPIO_SIFIVE=y
+CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
+CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
+CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_GPIO=y
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
@@ -152,39 +176,67 @@ CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_RZ=m
+CONFIG_SND_SOC_WM8978=m
+CONFIG_SND_SIMPLE_CARD=m
 CONFIG_USB=y
+CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
 CONFIG_NOP_USB_XCEIV=m
+CONFIG_USB_GADGET=y
+CONFIG_USB_RENESAS_USBHS_UDC=m
+CONFIG_USB_CONFIGFS=m
+CONFIG_USB_CONFIGFS_SERIAL=y
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_OBEX=y
+CONFIG_USB_CONFIGFS_NCM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_ECM_SUBSET=y
+CONFIG_USB_CONFIGFS_RNDIS=y
+CONFIG_USB_CONFIGFS_EEM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
+CONFIG_MMC_SDHI=y
 CONFIG_MMC_SUNXI=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
+CONFIG_RZ_DMAC=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_RENESAS_OSTM=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_ARCH_R9A07G043=y
+CONFIG_IIO=y
+CONFIG_RZG2L_ADC=m
+CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_SUN4I_USB=m
+CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_LIBNVDIMM=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
