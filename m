Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED113C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkAugHmZ614VHDsyWZYNbWYCJUJ95QwyFcoL4KhTQOo=; b=BqcTnTn/oUQop152T1hBY2lWf+
	JwIErGQc30RKdMW5thoLn4Pprn8GkdGQEWmIxr56hxjGYozVkn9euAXwjQ+bgnvU2JfhTgMW3orL6
	QjaVMh3fRGlIiH/tLmYXi0/QK+W/gG3Vj/To04oaFfrg2seB3I2cKmeBVS+R6x7AI7GwURLSHz823
	lZyv4UzK7RIPRO4bQJ29S6m164yZZC98JaA/O3RLgSr2ny6n2qAUoKsAz/HSe0GL3AAwbUbil/8ju
	Gw75dgE6dc3GK3QEp4f+xHUIOYPPut7wYljMO0wk6fnguGlWYNPddEwtA+wDtLHYg7tESB071NjXn
	/goBhUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6YY-0000000BNRU-0yhd;
	Wed, 03 Jul 2024 20:26:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6YU-0000000BNQr-1e5c
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 20:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AED61CE2DCF;
	Wed,  3 Jul 2024 20:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E84C2BD10;
	Wed,  3 Jul 2024 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720038376;
	bh=PuJTsJ5Q9IQPnrr72LDQoTyI9+vaIDnVrcxQJPos7rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBC0X38aRaNf1SA8fi9KIRo//mPaGdsf+T863MJB7hGFVwj4Ots/YoW9Mh9FR2LkJ
	 h81NYeDRa+SmQ2CRL0g2YSw5TPNWd3NyF2aE0zBcIqbLYgRm8fujnyA46C5H3sukhe
	 ZECMzHzGig056SZge7wZioBeAC+QNbDI+sAs+CqBID4Ex3iX8zGK9Ma/Qk73kPw9bU
	 JUgquK7Wecg51e7qCGJBrZUFJM2tv0FWsUbr/lILSAd6KnnreI2ZdeSTNpHll88Gun
	 EEo8wAmnPjvH7TCpxyGAiFQClPhbNQu0SpntzkXrayKV9ZsPgjCvkJ3IcZ9guXHEZq
	 omuK7YCb1mnOQ==
Date: Wed, 3 Jul 2024 21:26:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] riscv: defconfig: enable drivers for Starfive
 VisionFive2 board
Message-ID: <20240703-overdue-lazily-a80b3c11f936@spud>
References: <CGME20240425101017eucas1p10f79f6e47e4c0a8e8083607a075767e0@eucas1p1.samsung.com>
 <20240425101003.1149068-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20240425101003.1149068-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_132618_802435_2E04F96F 
X-CRM114-Status: GOOD (  21.02  )
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
Content-Type: multipart/mixed; boundary="===============5302168462234059579=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5302168462234059579==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B0tQfoD9wq2M8Zxs"
Content-Disposition: inline


--B0tQfoD9wq2M8Zxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 12:10:03PM +0200, Marek Szyprowski wrote:
> Enable all drivers needed for Starfive VisionFive2 board to increase
> build and test coverage. Most drivers can be enabled as modules to avoid
> bloating the main kernel image.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

I know this patch has been sitting around for ages, but would you mind
rebasing it on top of linux-next and resending? I think most of this
covered by:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Driscv-config-for-next&id=3Dd8a7d89abb091fe4c1744241c7a40dbad570fd9e
which I think was in-flight at the same time as your patch, but didn't
get applied for quite a while till I bothered Palmer into letting me
take these config updates. There are some things in here though that are
not in the applied patch (or have different values). And SPIDEV, which I
resent because I don't think these boards have anything that that driver
binds to...


Thanks,
Conor.

> ---
>  arch/riscv/configs/defconfig | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3cae018f9315..effa22bc2884 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -146,6 +146,8 @@ CONFIG_MICROSEMI_PHY=3Dy
>  CONFIG_CAN_RCAR_CANFD=3Dm
>  CONFIG_INPUT_MOUSEDEV=3Dy
>  CONFIG_KEYBOARD_SUN4I_LRADC=3Dm
> +CONFIG_INPUT_MISC=3Dy
> +CONFIG_INPUT_AXP20X_PEK=3Dm
>  CONFIG_SERIAL_8250=3Dy
>  CONFIG_SERIAL_8250_CONSOLE=3Dy
>  CONFIG_SERIAL_8250_DW=3Dy
> @@ -157,21 +159,31 @@ CONFIG_HW_RANDOM=3Dy
>  CONFIG_HW_RANDOM_VIRTIO=3Dy
>  CONFIG_I2C_CHARDEV=3Dm
>  CONFIG_I2C_MV64XXX=3Dm
> +CONFIG_I2C=3Dy
>  CONFIG_I2C_RIIC=3Dy
> +CONFIG_I2C_CHARDEV=3Dy
> +CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
>  CONFIG_SPI=3Dy
> +CONFIG_SPI_PL022=3Dy
>  CONFIG_SPI_RSPI=3Dm
>  CONFIG_SPI_SIFIVE=3Dy
>  CONFIG_SPI_SUN6I=3Dy
> +CONFIG_SPI_SPIDEV=3Dm
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_GPIO_SIFIVE=3Dy
> +CONFIG_CHARGER_AXP20X=3Dm
> +CONFIG_BATTERY_AXP20X=3Dm
> +CONFIG_AXP20X_POWER=3Dm
>  CONFIG_CPU_THERMAL=3Dy
>  CONFIG_DEVFREQ_THERMAL=3Dy
>  CONFIG_RZG2L_THERMAL=3Dy
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_SUNXI_WATCHDOG=3Dy
> +CONFIG_MFD_AXP20X_I2C=3Dy
>  CONFIG_RENESAS_RZG2LWDT=3Dy
>  CONFIG_REGULATOR=3Dy
>  CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> +CONFIG_REGULATOR_AXP20X=3Dy
>  CONFIG_REGULATOR_GPIO=3Dy
>  CONFIG_DRM=3Dm
>  CONFIG_DRM_RADEON=3Dm
> @@ -185,7 +197,13 @@ CONFIG_SND=3Dy
>  CONFIG_SND_SOC=3Dy
>  CONFIG_SND_SOC_RZ=3Dm
>  CONFIG_SND_SOC_WM8978=3Dm
> +CONFIG_SND_SOC_STARFIVE=3Dm
> +CONFIG_SND_SOC_JH7110_PWMDAC=3Dm
> +CONFIG_SND_SOC_JH7110_TDM=3Dm
>  CONFIG_SND_SIMPLE_CARD=3Dm
> +CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
> +CONFIG_SND_AUDIO_GRAPH_CARD2=3Dm
> +CONFIG_I2C_HID=3Dm
>  CONFIG_USB=3Dy
>  CONFIG_USB_OTG=3Dy
>  CONFIG_USB_XHCI_HCD=3Dy
> @@ -199,10 +217,16 @@ CONFIG_USB_STORAGE=3Dy
>  CONFIG_USB_UAS=3Dy
>  CONFIG_USB_MUSB_HDRC=3Dm
>  CONFIG_USB_MUSB_SUNXI=3Dm
> +CONFIG_USB_CDNS_SUPPORT=3Dm
> +CONFIG_USB_CDNS3=3Dm
> +CONFIG_USB_CDNS3_GADGET=3Dy
> +CONFIG_USB_CDNS3_STARFIVE=3Dm
>  CONFIG_NOP_USB_XCEIV=3Dm
>  CONFIG_USB_GADGET=3Dy
>  CONFIG_USB_RENESAS_USBHS_UDC=3Dm
>  CONFIG_USB_CONFIGFS=3Dm
> +CONFIG_USB_CDNS2_UDC=3Dm
> +CONFIG_USB_ETH=3Dm
>  CONFIG_USB_CONFIGFS_SERIAL=3Dy
>  CONFIG_USB_CONFIGFS_ACM=3Dy
>  CONFIG_USB_CONFIGFS_OBEX=3Dy
> @@ -223,18 +247,24 @@ CONFIG_MMC_DW=3Dy
>  CONFIG_MMC_DW_STARFIVE=3Dy
>  CONFIG_MMC_SDHI=3Dy
>  CONFIG_MMC_SUNXI=3Dy
> +CONFIG_MMC_DW=3Dy
> +CONFIG_MMC_DW_STARFIVE=3Dy
>  CONFIG_RTC_CLASS=3Dy
>  CONFIG_RTC_DRV_SUN6I=3Dy
>  CONFIG_DMADEVICES=3Dy
>  CONFIG_DMA_SUN6I=3Dm
>  CONFIG_DW_AXI_DMAC=3Dy
>  CONFIG_RZ_DMAC=3Dy
> +CONFIG_DW_AXI_DMAC=3Dy
>  CONFIG_VIRTIO_PCI=3Dy
>  CONFIG_VIRTIO_BALLOON=3Dy
>  CONFIG_VIRTIO_INPUT=3Dy
>  CONFIG_VIRTIO_MMIO=3Dy
>  CONFIG_RENESAS_OSTM=3Dy
>  CONFIG_SUN8I_DE2_CCU=3Dm
> +CONFIG_CLK_STARFIVE_JH7100_AUDIO=3Dy
> +CONFIG_CLK_STARFIVE_JH7110_AON=3Dy
> +CONFIG_CLK_STARFIVE_JH7110_STG=3Dy
>  CONFIG_SUN50I_IOMMU=3Dy
>  CONFIG_RPMSG_CHAR=3Dy
>  CONFIG_RPMSG_CTRL=3Dy
> @@ -242,9 +272,13 @@ CONFIG_RPMSG_VIRTIO=3Dy
>  CONFIG_ARCH_R9A07G043=3Dy
>  CONFIG_IIO=3Dy
>  CONFIG_RZG2L_ADC=3Dm
> +CONFIG_AXP20X_ADC=3Dm
>  CONFIG_RESET_RZG2L_USBPHY_CTRL=3Dy
>  CONFIG_PHY_SUN4I_USB=3Dm
>  CONFIG_PHY_RCAR_GEN3_USB2=3Dy
> +CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=3Dm
> +CONFIG_PHY_STARFIVE_JH7110_PCIE=3Dm
> +CONFIG_PHY_STARFIVE_JH7110_USB=3Dm
>  CONFIG_LIBNVDIMM=3Dy
>  CONFIG_NVMEM_SUNXI_SID=3Dy
>  CONFIG_EXT4_FS=3Dy
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--B0tQfoD9wq2M8Zxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoWz5AAKCRB4tDGHoIJi
0rs6AP0Q9WzUNm6WDQh6WVm6hOFXP/UeBzWFI0JdqbcDirGsSQEAiHNWFiihifDJ
FgKH0Px90qgey5KiknZYc6/hYrndJAg=
=NVHk
-----END PGP SIGNATURE-----

--B0tQfoD9wq2M8Zxs--


--===============5302168462234059579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5302168462234059579==--

