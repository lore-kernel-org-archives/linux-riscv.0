Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11967C3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXjQlwZWaHECWCYVuQTM8nejU/3AV1Sx3wQ+2D5Ms7c=; b=O1v1IyGtQl9hq3
	E7cyyeVWxVgx0KrC8I2IyoZDzS6f7WKJRkLWozml564DFok1IgMDPyAUsFqg6AIBPdO1Mhj3ibZTp
	e1OyZOAmI15qvWVq32cO7RBgUWAMEG2tIJ9I8hr3zpQ9vQpN6oUVlW5wit5U3o0NQHkH+kttg36ZN
	Ip/l3jxONv8pEeRtZvKbQVlA/G31jGxBpWsm1xcedvAnGQos5MynWLIyG/6xidHuabPJAb4sQaQlo
	5domw/rpnSZo6n05/usNGVoKUdVdoemCwlLt6uFEMFY23/IcbQ/58yspiwn3tFs8HWsSyuz8KGPFP
	G1B1k+tEmfW35mzlRteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DDa-00AtGq-UT; Thu, 08 Dec 2022 09:29:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CwM-00Ag2M-Mq; Thu, 08 Dec 2022 09:11:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 16E37B821EE;
	Thu,  8 Dec 2022 09:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AA6C433D6;
	Thu,  8 Dec 2022 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670490695;
	bh=iHuw0OUgQEvUcS8yre/beDpGKlTFd86E0mXrCaCurC0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=fQXRN6ze54K7P1CzZ+rbMoKLJnC+MBmPo7bbo7IjavpNWUA5Y70dhXR+tZFdf0qcK
	 PdsqBFtrkNnGraXcXJLTw0E1MRR/5OkXnuNk6hkJQMNukeVFoo9yVelsIlTF6Mn3yP
	 FvA3U3xJKjjhNUHGCTJKbOd3N98zBI38M4CJA1LWdHHNmBGKSWk1Zf5Q+YjiRz74fi
	 TYP3ltF1BwEDbttJh3K1Ke7XLDMQFC8Cr5IuWa/5zC/aZhO94XqNlK2h9poWyhrE63
	 8DeDsvL0n4xdxYUVoulW5WtTOrPp7GyYByC1ojzzMxu+Raa+cShbRMCsT4Su9JWcbF
	 0OInr/pHAZlGg==
Date: Thu, 08 Dec 2022 10:09:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
CC: Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org,
 Andre Przywara <andre.przywara@arm.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_12/12=5D_riscv=3A_defconfig=3A_En?= =?US-ASCII?Q?able_the_Allwinner_D1_platform_and_drivers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221208090237.20572-13-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org> <20221208090237.20572-13-samuel@sholland.org>
Message-ID: <6D22D85D-EAD2-4778-89EF-86540EDCBD2D@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_011139_102160_5E25C8D4 
X-CRM114-Status: UNSURE (   9.77  )
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



On 8 December 2022 10:02:37 GMT+01:00, Samuel Holland <samuel@sholland.org> wrote:
>Now that several D1-based boards are supported, enable the platform in
>our defconfig. Build in the drivers which are necessary to boot, such as
>the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flash),
>and watchdog (which may be left enabled by the bootloader). Other common
>onboard peripherals are enabled as modules.
>
>Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm more than happy if he's happy ;)

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>Reviewed-by: Guo Ren <guoren@kernel.org>
>Signed-off-by: Samuel Holland <samuel@sholland.org>
>---
>
>(no changes since v1)
>
> arch/riscv/configs/defconfig | 22 +++++++++++++++++++++-
> 1 file changed, 21 insertions(+), 1 deletion(-)
>
>diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>index 74ed7037314f..368175560da9 100644
>--- a/arch/riscv/configs/defconfig
>+++ b/arch/riscv/configs/defconfig
>@@ -25,6 +25,7 @@ CONFIG_BLK_DEV_INITRD=y
> CONFIG_EXPERT=y
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_PROFILING=y
>+CONFIG_ARCH_SUNXI=y
> CONFIG_SOC_MICROCHIP_POLARFIRE=y
> CONFIG_SOC_SIFIVE=y
> CONFIG_SOC_STARFIVE=y
>@@ -119,8 +120,10 @@ CONFIG_VIRTIO_NET=y
> CONFIG_MACB=y
> CONFIG_E1000E=y
> CONFIG_R8169=y
>+CONFIG_STMMAC_ETH=m
> CONFIG_MICROSEMI_PHY=y
> CONFIG_INPUT_MOUSEDEV=y
>+CONFIG_KEYBOARD_SUN4I_LRADC=m
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_DW=y
>@@ -128,14 +131,20 @@ CONFIG_SERIAL_OF_PLATFORM=y
> CONFIG_VIRTIO_CONSOLE=y
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_VIRTIO=y
>+CONFIG_I2C_MV64XXX=m
> CONFIG_SPI=y
> CONFIG_SPI_SIFIVE=y
>+CONFIG_SPI_SUN6I=y
> # CONFIG_PTP_1588_CLOCK is not set
>-CONFIG_GPIOLIB=y
> CONFIG_GPIO_SIFIVE=y
>+CONFIG_WATCHDOG=y
>+CONFIG_SUNXI_WATCHDOG=y
>+CONFIG_REGULATOR=y
>+CONFIG_REGULATOR_FIXED_VOLTAGE=y
> CONFIG_DRM=m
> CONFIG_DRM_RADEON=m
> CONFIG_DRM_NOUVEAU=m
>+CONFIG_DRM_SUN4I=m
> CONFIG_DRM_VIRTIO_GPU=m
> CONFIG_FB=y
> CONFIG_FRAMEBUFFER_CONSOLE=y
>@@ -148,19 +157,30 @@ CONFIG_USB_OHCI_HCD=y
> CONFIG_USB_OHCI_HCD_PLATFORM=y
> CONFIG_USB_STORAGE=y
> CONFIG_USB_UAS=y
>+CONFIG_USB_MUSB_HDRC=m
>+CONFIG_USB_MUSB_SUNXI=m
>+CONFIG_NOP_USB_XCEIV=m
> CONFIG_MMC=y
> CONFIG_MMC_SDHCI=y
> CONFIG_MMC_SDHCI_PLTFM=y
> CONFIG_MMC_SDHCI_CADENCE=y
> CONFIG_MMC_SPI=y
>+CONFIG_MMC_SUNXI=y
> CONFIG_RTC_CLASS=y
>+CONFIG_RTC_DRV_SUN6I=y
>+CONFIG_DMADEVICES=y
>+CONFIG_DMA_SUN6I=m
> CONFIG_VIRTIO_PCI=y
> CONFIG_VIRTIO_BALLOON=y
> CONFIG_VIRTIO_INPUT=y
> CONFIG_VIRTIO_MMIO=y
>+CONFIG_SUN8I_DE2_CCU=m
>+CONFIG_SUN50I_IOMMU=y
> CONFIG_RPMSG_CHAR=y
> CONFIG_RPMSG_CTRL=y
> CONFIG_RPMSG_VIRTIO=y
>+CONFIG_PHY_SUN4I_USB=m
>+CONFIG_NVMEM_SUNXI_SID=y
> CONFIG_EXT4_FS=y
> CONFIG_EXT4_FS_POSIX_ACL=y
> CONFIG_EXT4_FS_SECURITY=y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
