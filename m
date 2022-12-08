Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6FBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioacRUvnt8oR0Ia4tFZUqSZGnd6KCtuagD782RN1APk=; b=e7NISN31qqk2mE
	FfC3fA16X/P2g11Goic1lI81UQALPfxWDnxVyPRXu04S0/Wpr4sgT3TCSf2NasrDsmhnRYQ0eNqi9
	hLeqLdZ8P7orK+sCn0uS48j9kWfRcgRpRZPz8MZcG75/FyDJ93f4PLiiCzxdoav61/5zBypM3oPls
	XY2/FyAZBzko4IkUiF/arX1X7FOBsMPJZPK8Jb/fNXaXogY3S9wFQMxD6NHXDfDRN9PKqRnLJSZPV
	kyPXNvpnZbNVCCMqnqobegnYHKjxEwTRd+czSEGE9zbPLqb1G7bPQDfh7k0f4huo5ux2CgHmA2q+u
	UK0wCxNOn0RCtz9zY/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3D50-00Alzw-5S; Thu, 08 Dec 2022 09:20:34 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CoO-00AY4V-2t; Thu, 08 Dec 2022 09:03:25 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 119C83200302;
	Thu,  8 Dec 2022 04:03:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 08 Dec 2022 04:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670490201; x=1670576601; bh=Hx
	mTpro2phtZSaydkjHtpCZ4my/FEsnWm06xGZCy3s8=; b=1gpAMzQADMm7ibEMS+
	xH9BXE/IaxJpQMb6j9cwNPO0yK8i5IcaJpKlPHztrlXhFvY5GFTRAVh8Lusbz2xj
	5uDuOFLMMVfdCepIl+h8UTbx2RMF3CZjbaTioAbgFr3lZ+DQZRoRtyTRRK3D7+h7
	3BDTTJIh+nPWZ4Vc4HVSv3VM6nBEThfN4zcfsrEVi0xhkVHg1GAGvn0/2tbKAJEC
	sp1AtJytYtWjI5eac6rgME1wd6Onf1Jno1swFTjq7TWwA5uXgyAlF3XgkvUQF+nZ
	ReiPZKs0CTQU7EMLgbasPX0JfEuPMcTorTjH8pGp21qJEHwxeX4S489WbgqXXbJ0
	EvXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670490201; x=1670576601; bh=HxmTpro2phtZS
	aydkjHtpCZ4my/FEsnWm06xGZCy3s8=; b=mPUKCRRaRLSQHGhd6pqlRdD7OXkBS
	mzMHIZsFMVZiRD3h39RWuWTgxmvkzJiwsJJcnmLushWDOlcixMXdHsXjAcnxsgCt
	PILpad3AhSe+zGOhKhiXioghcELgVJLfSop2A6VWPPgG03Ib6oypMQPb75TiMm8X
	PcMafpMDpB1cHSl4rZa/muEVB8v3h6qyjzyHzBAJ/d0tSRECZ+i2sFO9Da69ytf2
	goyFXRpBQzZ5fbYZuBz1elDenu6xp6lG9IFCAJbFzeuxVLFACwtvlEJkui1x9+Sk
	SQlLHIT+a77lXaNW7xSODRAaUGHUcsV71v73LECN54AfDW6Gd0ItLmWpg==
X-ME-Sender: <xms:WaiRYy1OA4xgPVtt9H7xhNtfSMej-Ex6x_I9cO6TQnUEXnLjLWvp9g>
    <xme:WaiRY1HTFvVPxo8BPsWggHzuLMpxPWh69l9UImz77_XiAEGnQ7rBSF1AJ6Qx7Auo5
    7ehLqEA40TNgZYXCg>
X-ME-Received: <xmr:WaiRY64Xn-Bpf86ao_Z_0T1B2n8mm6mSTMCmQv7hOMFCN9katFu5CZu-Ef3TfJr4AMHXzKMvzpYDGuvFZiRyTLW-rMD0UAWJLQTvxmaqv8tEpGyOIRzCgXcOKg6F59Jfw0fsTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WaiRYz3VTpD5h__uUcOBWcwwKjDDaNFyz2wLnr3tJSAJ2Qm2fGRQ7g>
    <xmx:WaiRY1Fdpft2B-Pgv5L7mGM9GynITWhnOrtzwsT7sHJuoiisLrS7YA>
    <xmx:WaiRY88d0nxn2a4ng2NuUDGdys7C5720xpuEaL88b6d88XUPXDEikw>
    <xmx:WaiRY3GslTkMi6whUTVIejNRzjyGRqjnmmas_R6WKdCsDNL6caA9aA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:03:20 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 12/12] riscv: defconfig: Enable the Allwinner D1 platform and drivers
Date: Thu,  8 Dec 2022 03:02:37 -0600
Message-Id: <20221208090237.20572-13-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221208090237.20572-1-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010324_214311_F809F6C2 
X-CRM114-Status: UNSURE (   8.45  )
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

Now that several D1-based boards are supported, enable the platform in
our defconfig. Build in the drivers which are necessary to boot, such as
the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flash),
and watchdog (which may be left enabled by the bootloader). Other common
onboard peripherals are enabled as modules.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 arch/riscv/configs/defconfig | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ed7037314f..368175560da9 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -25,6 +25,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
+CONFIG_ARCH_SUNXI=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
@@ -119,8 +120,10 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
+CONFIG_STMMAC_ETH=m
 CONFIG_MICROSEMI_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
@@ -128,14 +131,20 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
+CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
-CONFIG_GPIOLIB=y
 CONFIG_GPIO_SIFIVE=y
+CONFIG_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
@@ -148,19 +157,30 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_USB_MUSB_HDRC=m
+CONFIG_USB_MUSB_SUNXI=m
+CONFIG_NOP_USB_XCEIV=m
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
+CONFIG_MMC_SUNXI=y
 CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUN6I=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_SUN6I=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_SUN8I_DE2_CCU=m
+CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
+CONFIG_PHY_SUN4I_USB=m
+CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
