Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2040C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P0qWZknofMu/5mXWzSZqMKwAKXwPWpaeE9m/7LLHzGI=; b=hjcjTCO23EMkub
	7Y8R2BanEbjS2mzykzpyMgrINunOfefXg4v68lzwcA5htyZdz9G7fFMUPG2lrVLvaQMgmouOtHmar
	rwDUPsutCqo28ajnb5QMYlpMe3TgoKIhJi9E9zwaDo5Q9IekHTHjkFao0LwOvzMP3qR9xQVfCTGzD
	PcyXpQ4hvF/rAo0m3V9hswlNkyWeYkwFHqwMqf/3rIL18hzke7X7KuJZN7jSFhvZEJ07aeJGNEnE7
	Th0qqA1zKTynNPQCet5O6mLgARbGk0xaFajtSlFPvzmWtBFfU6Lal3uv4Rs9KH41QOq3AKg9C0xcT
	+Dyan69RTmpdHej6PM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4j4-0000000DtcH-32CU;
	Wed, 17 Jul 2024 13:29:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4j0-0000000Dta4-2gCu
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 973E2CE17B8;
	Wed, 17 Jul 2024 13:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CA3C32782;
	Wed, 17 Jul 2024 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721222975;
	bh=YQ6l5cI7YXYE0o/kYF2+JwI6tetVX1FjRrXMMaCr4Es=;
	h=From:To:Cc:Subject:Date:From;
	b=W+97cxOmuKI9hdL9xkKNeVX31I3x/EYwg5GZW1Bjm/nrA7+LCA8d4B9GQBajn/gm3
	 LPTDWi2kZdwxeUaa1PdHiiPPD8vlaIm+GfRC183XHbFSUI/d0jhLgInuTGhWiVyEau
	 ph2qNorzT+21ln+XMPl9sD1L8x/FC+i6bScA672ujqVC4t3i6lIsxF9nqKeeqAcrWJ
	 aCOghHARZbKCn2GwlokCWXdQCzPd5sqqnTSNAoWr3O9P0FvTs6K52cge4ljWIaaBoe
	 E4sk9dJJqmPHsv5LMbS6waPYChe1vqkTbBjFdxak0Oy6t+0SUoL4C6nlKJDWAkRuwf
	 cJ059Z6JSmMhw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: run savedefconfig for defconfig
Date: Wed, 17 Jul 2024 14:29:24 +0100
Message-ID: <20240717-shrubs-concise-51600886babf@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3914; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jCFQHxaVV64m1uEzxmaK5W8JzwULgV2ZW1IVTbFyuYA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnTj5v8Fd8WySamaB7wnFPwpdyUTbutPifrT9B/75nx9 4eO5ivBjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkGxMjw8MNa288yNa9Yyd3 84Qk/xThB2VFDHUGaX3PZIX+9b2bOI+RYVakpBDX9kYWTd3Lx3buvRmmlih/ZuqeuiNplZ+yzu2 bwwEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_062943_099285_182B5801 
X-CRM114-Status: UNSURE (   8.47  )
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

From: Conor Dooley <conor.dooley@microchip.com>

It's been a while since this was run, and there's a few things that have
changed. Firstly, almost all of the Renesas stuff vanishes because the
config for the RZ/Five is gated behind NONPORTABLE. Several options
(like CONFIG_PM) are removed as they are the default values.

To retain DEFVFREQ_THERMAL and BLK_DEV_THROTTLING, add PM_DEVFREQ and
BLK_CGROUP respectively.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: linux-renesas-soc@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/configs/defconfig | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3f1f055866af..0d678325444f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -7,6 +7,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
 CONFIG_RT_GROUP_SCHED=y
@@ -35,9 +36,6 @@ CONFIG_ARCH_THEAD=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y
-CONFIG_HOTPLUG_CPU=y
-CONFIG_PM=y
-CONFIG_CPU_IDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=m
@@ -52,13 +50,11 @@ CONFIG_ACPI=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_BLK_DEV_THROTTLING=y
+CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_UNIX=y
 CONFIG_XFRM_USER=m
-CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_PNP=y
@@ -102,9 +98,9 @@ CONFIG_NET_SCHED=y
 CONFIG_NET_CLS_CGROUP=m
 CONFIG_NETLINK_DIAG=y
 CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CAN=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
-CONFIG_CAN=m
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
@@ -153,8 +149,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_SH_SCI=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
@@ -179,7 +175,6 @@ CONFIG_DEVFREQ_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
-CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -193,11 +188,9 @@ CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_SOC_RZ=m
 CONFIG_SND_DESIGNWARE_I2S=m
 CONFIG_SND_SOC_STARFIVE=m
 CONFIG_SND_SOC_JH7110_PWMDAC=m
@@ -239,34 +232,31 @@ CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
+CONFIG_MMC_SDHI=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_STARFIVE=y
-CONFIG_MMC_SDHI=y
 CONFIG_MMC_SUNXI=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
-CONFIG_RZ_DMAC=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
-CONFIG_RENESAS_OSTM=y
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_SUN8I_DE2_CCU=m
+CONFIG_RENESAS_OSTM=y
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
-CONFIG_ARCH_R9A07G043=y
+CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
-CONFIG_RZG2L_ADC=m
-CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
