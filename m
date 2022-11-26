Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6879C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4N5jRbIMHyLTEKXj3TWgZa8g/iV9q60Ht9gbLaAWrQ=; b=HZOwC8KC5jYIa+
	HxZs6j7DVOz9uGx8he72ADBpKNTV8sugxDLHCGxC1tkg2Rvwbtx/44k3JphynthSxTXP3viNoYeft
	vpnjbmeYwifPHUH+m/OeayN2AgLRid/hGKcDbMVeKxKQWST71+eIsWR59wTzDA1RLux54skJ2doh0
	ntmim55rSwX7hkw+dPljazw0kVzHI4VrIkZIXChBe41psi5yK7040y+xEjak1+34EaQJ22yWM4n8f
	nOXQfu5TrnectnOhk6i0zmj7UtNGWg9VdFs6rQqdqK50l2dzrLfS8M02X2kM38OSexAd5vftz+v7E
	bXB2ByP5fC9VgeqXlQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyj0d-0039KR-UF; Sat, 26 Nov 2022 00:25:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyj0K-0039A6-GI; Sat, 26 Nov 2022 00:25:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D56D2611A7;
	Sat, 26 Nov 2022 00:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A639CC43148;
	Sat, 26 Nov 2022 00:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669422310;
	bh=P5pT3TtFLH0lDt6mzdr2m03eUnUbkfGX7u+bZdEIkdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S/No/sq5g5U21rTRd9VZ+crXsXb0uu6Tp6FXHsGYz+Vnm1+UBwZYrtJAVtm0osHXV
	 iPihUhGngftFHNELQe2zEy/4boF7NI18Sj7BswSZd00nyC6RZUYhZsGwMSjrTdur7a
	 2AksUVSBlHGTWmAc8q1cQh2vMl6P2IfR4HEmgmjFIAjsRhg+rQURoQ2HdXHK2pcWm7
	 LJdlxCoZXGiii9Q6YUGErnT2/frBmaNX5V57Tw0Pjt1iilyV1EZcekHNnGv2QbG+5E
	 vRH8MU00g7V/f39Xu9REoKUcuHCK6/iMqdZGLjRJJ+kDoNeOMkzmDwpAzSrYAKzQcX
	 X8attMNitmJXw==
Received: by mail-ej1-f52.google.com with SMTP id ud5so13452818ejc.4;
        Fri, 25 Nov 2022 16:25:10 -0800 (PST)
X-Gm-Message-State: ANoB5pmtrepn/wRv5LagFYm1xOwB3XGftFhI8igA4xyY0tC44SsFnjkt
	Oka4qgef0tz3xlGQTkiX5jhQ1GHcCo1Mrcfsy5U=
X-Google-Smtp-Source: AA0mqf57ZVICUuSakfqABFsOHVzvU/nlG5DScTstPOnlNDdtDFBxRhLSv2KYSrkTOKMxU3+7lS1CFsJeyL6q7Tw01UU=
X-Received: by 2002:a17:906:2342:b0:78d:9e77:1f8c with SMTP id
 m2-20020a170906234200b0078d9e771f8cmr26108661eja.236.1669422308914; Fri, 25
 Nov 2022 16:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-13-samuel@sholland.org>
In-Reply-To: <20221125234656.47306-13-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Nov 2022 08:24:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTOKPAqazF5w03NBzxMW7MGpoCn7vvdj=RabGrzp5WVZQ@mail.gmail.com>
Message-ID: <CAJF2gTTOKPAqazF5w03NBzxMW7MGpoCn7vvdj=RabGrzp5WVZQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] riscv: defconfig: Enable the Allwinner D1
 platform and drivers
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Stanislav Jakubek <stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_162512_636784_36AD0EE9 
X-CRM114-Status: GOOD (  19.16  )
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

On Sat, Nov 26, 2022 at 7:47 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Now that several D1-based boards are supported, enable the platform in
> our defconfig. Build in the drivers which are necessary to boot, such as
> the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flash),
> and watchdog (which may be left enabled by the bootloader). Other common
> onboard peripherals are enabled as modules.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> (no changes since v1)
>
>  arch/riscv/configs/defconfig | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 05fd5fcf24f9..8dfe0550c0e6 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -25,6 +25,7 @@ CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_PROFILING=y
> +CONFIG_ARCH_SUNXI=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_STARFIVE=y
> @@ -118,22 +119,31 @@ CONFIG_VIRTIO_NET=y
>  CONFIG_MACB=y
>  CONFIG_E1000E=y
>  CONFIG_R8169=y
> +CONFIG_STMMAC_ETH=m
>  CONFIG_MICROSEMI_PHY=y
>  CONFIG_INPUT_MOUSEDEV=y
> +CONFIG_KEYBOARD_SUN4I_LRADC=m
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_I2C_MV64XXX=m
>  CONFIG_SPI=y
>  CONFIG_SPI_SIFIVE=y
> +CONFIG_SPI_SUN6I=y
>  # CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SIFIVE=y
> +CONFIG_WATCHDOG=y
> +CONFIG_SUNXI_WATCHDOG=y
> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_NOUVEAU=m
> +CONFIG_DRM_SUN4I=m
>  CONFIG_DRM_VIRTIO_GPU=m
>  CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> @@ -146,19 +156,30 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_USB_MUSB_HDRC=m
> +CONFIG_USB_MUSB_SUNXI=m
> +CONFIG_NOP_USB_XCEIV=m
>  CONFIG_MMC=y
>  CONFIG_MMC_SDHCI=y
>  CONFIG_MMC_SDHCI_PLTFM=y
>  CONFIG_MMC_SDHCI_CADENCE=y
>  CONFIG_MMC_SPI=y
> +CONFIG_MMC_SUNXI=y
>  CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_SUN6I=y
> +CONFIG_DMADEVICES=y
> +CONFIG_DMA_SUN6I=m
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
> +CONFIG_SUN8I_DE2_CCU=m
> +CONFIG_SUN50I_IOMMU=y
Do we need IOMMU?

Others:
Reviewed-by: Guo Ren <guoren@kernel.org>

>  CONFIG_RPMSG_CHAR=y
>  CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
> +CONFIG_PHY_SUN4I_USB=m
> +CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
>  CONFIG_EXT4_FS_SECURITY=y
> --
> 2.37.4
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
