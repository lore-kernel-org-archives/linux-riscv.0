Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7E9C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gr9zwKXn0t28ptvRN3ONnQHj1HhdOPHNUbb02QxWuis=; b=lJ/14ktHYuchtZ
	WBQkpXcBwSwv8AHl+15z8+k4WE2sIMKeK2ID2KDE7s1CBxpPxLIT62yYyYOEG4fJJ+16lePkSdvyV
	TZGh9R0lEq/GJZG9ceyMpOLYg1nT/RXC+dUWfyRyErybuK+ffv41nwcldAYDRqo2+CjsafBFdHa4o
	2VjYuN9EcbwF4XBSwei67xsSfaPZRzukBH9SeMjQbQOAg9fcQzfT6kK3B2ZxdKD8/+jGJE8G4jqhf
	STFnG/R3AlBd4iuV9fiQapCIoPrFprhFj2oSztBEXdRhKDtr5APsmUr8/dtx5UOy55r0+Szv+JcAh
	69PXdKMZD+8bI86fFV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYoux-0000000FgZX-3LIs;
	Tue, 30 Jul 2024 15:37:39 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYouv-0000000FgZ4-0mcD
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 15:37:38 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by baptiste.telenet-ops.be with bizsmtp
	id trdV2C00H30Ayot01rdV72; Tue, 30 Jul 2024 17:37:31 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYouQ-004BM5-AP;
	Tue, 30 Jul 2024 17:37:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYoun-00EZBM-BX;
	Tue, 30 Jul 2024 17:37:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] riscv: defconfig: Disable RZ/Five peripheral support
Date: Tue, 30 Jul 2024 17:37:26 +0200
Message-Id: <89ad70c7d6e8078208fecfd41dc03f6028531729.1722353710.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_083737_387300_FBE2AECC 
X-CRM114-Status: UNSURE (   9.02  )
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

There is not much point in keeping support for RZ/Five peripherals
enabled, as the RZ/Five platform option (ARCH_R9A07G043) is gated behind
NONPORTABLE.  Hence drop all config options that enable built-in or
modular support for peripherals found on RZ/Five SoCs.

Disable USB_XHCI_RCAR explicitly, as its value defaults to the value of
ARCH_RENESAS, which is still enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  1. Perhaps the intention is to keep all RZ/Five peripheral support
     enabled, so RZ/Five users can start from the defconfig, and
     "just"[1] enable NONPORTABLE and ARCH_R9A07G043?

     [1] Nope, need to disable RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO
	 (and whatever else in the future?), too.

  2. Perhaps CONFIG_ARCH_RENESAS=y should be dropped, too?
     In addition to USB_XHCI_RCAR, that would get rid of SOC_BUS,
     PINCTRL_RENESAS, CLK_RENESAS, and SOC_RENESAS.
---
 arch/riscv/configs/defconfig | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0d678325444fccdc..b51ef6cd1e3986ed 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -137,12 +137,10 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
-CONFIG_RAVB=y
 CONFIG_STMMAC_ETH=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
-CONFIG_CAN_RCAR_CANFD=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -150,7 +148,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
-CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
@@ -159,11 +156,9 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_MV64XXX=m
-CONFIG_I2C_RIIC=y
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
 CONFIG_SPI_PL022=m
-CONFIG_SPI_RSPI=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
@@ -172,7 +167,6 @@ CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
-CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
 CONFIG_MFD_AXP20X_I2C=y
@@ -201,11 +195,11 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
+# CONFIG_USB_XHCI_RCAR is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_USB_CDNS_SUPPORT=m
@@ -217,7 +211,6 @@ CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
-CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_CONFIGFS=m
 CONFIG_USB_CONFIGFS_SERIAL=y
 CONFIG_USB_CONFIGFS_ACM=y
@@ -235,7 +228,6 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_DWCMSHC=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
-CONFIG_MMC_SDHI=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_STARFIVE=y
 CONFIG_MMC_SUNXI=y
@@ -250,7 +242,6 @@ CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_SUN8I_DE2_CCU=m
-CONFIG_RENESAS_OSTM=y
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
@@ -258,7 +249,6 @@ CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
 CONFIG_PHY_SUN4I_USB=m
-CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
