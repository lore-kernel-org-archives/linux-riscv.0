Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45544C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 21:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=asYP7P/0aWUtC3QOUEEGLu+Xdl7s6wcY0CaWXMFJtz8=; b=LzzEBtcuqmN1K+jJzStUMhmbIF
	BgaOnbTt82I/COcOCKXvgR5Ff48uaP0Eac6kRvV+DLhFGUuSOUctMh/HDki/WVe2vxDfy+Ayby5v5
	fEqen0HSRInjdrVbcGy07jwP92y+5cOuxP345oR+toqe3bj53G+LuT7Wymk3Edi9WUNc45Pq68+ld
	TvadsG0EN+OLaitXFK8yFinlSDDt95mJZNyLpafIu2zW11ei0ZlowPhRdzzmzhibW9i9b17WGQdXZ
	GSkshsB2kuJ5MUzDnXbXr/Ua6me2BIX5gYwaAbTqOFMLy4772y6UqZFwEGj20kyKsieFOZcTR2gyJ
	UmlILYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHVzO-0000000EGWI-1iWz;
	Wed, 12 Jun 2024 21:58:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHVzL-0000000EGVd-24Gb
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 21:58:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-705c0115192so272217b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1718229516; x=1718834316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb1Tdmuo2+DL2sMCGsEjLYo7CfSSy+N0ra/0HS1hBn4=;
        b=EJimj3FqtnqAkfJ6882r0TWTIARpJZk+UrYUUwf+UFsOmBtDC3cmxHWx4/vCAu9yUb
         /Epde/udt+SFoaalcMZ+nNsETgpHjY2CZYeOXSH27PxwcPqEpQuGgI6zX9KzW2+GSBvx
         tGRpH20VHIM/JbJ0CTJQ9y5T2G7HucWaN5/j9I3etUcHkJWCNXzlk2Fb7r0fWL7zcj3/
         rsFsF4jAxjeBLJzA49MioRkyhnvzUMwxrmSecQRbjXcDcl2uTRu+hYxgaOBl+gsezFBS
         xy0u1Q6vWvDYy9y74q0SoTy9lfe4uN9rx2p+rOSVIfe6JSkLXZ+bSxQMlAFq3gXuY38a
         eF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718229516; x=1718834316;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb1Tdmuo2+DL2sMCGsEjLYo7CfSSy+N0ra/0HS1hBn4=;
        b=AyYR2g6bEd6dHwmS8SNzjWgrAIyIigQn2dm983svNa3WkXOcH4SBSFLrz6JhHG4kdJ
         Pohhou38aY7qkNegrSn620E11RrBj+xq2dXSoJVOAG7JCYEZwljSZS6NmAH1i5HRrJ6h
         S03B8IikOBlST6CLhtmGlB84flfG+sPc+1mRsYlTFpatPt6GvJy+PFnqaNFpZibWktc4
         Br3za8vhnpnhaJjV1gcPQ+NGHrZPm/Cab5Xa8iNiEuiyACjXbTzu4J31+e6UOi13qsn5
         jjffWCNGUGo17umU3OK4w/Zw7hVHTuSfQQkxiFKyvG39PwomsCidxh9oVBB0mXLdtD+m
         mgfg==
X-Forwarded-Encrypted: i=1; AJvYcCVxW2ikTh4srGnJBj/K9FDIxfVLljT3lKY7TOJjPHUWpLwqTnNyqNuy6wqUu5cWxIjt0B0mG3lHQoHbsShbRybeJgLbGGIm1KSCfzU7XUi1
X-Gm-Message-State: AOJu0YzwJi9nUWyY2T8YU5fRGoknqRPv5susTTMCgCUiV+RiDtpqQJwx
	nH4jFyDP4Fm/9+PjG3+jG3FdD6QeErLNWbhudWJLaQhrSpyR9G0uo+uzay+srzE=
X-Google-Smtp-Source: AGHT+IEJhUslG+KXH+FRzbl+rnNWPz4a9aFQN8ML87y8Vr+1JNHaUcsU3bWw/7YAi/1ijZiJFiXyTQ==
X-Received: by 2002:a05:6a00:1704:b0:705:9abf:a41d with SMTP id d2e1a72fcca58-705bce0a2cbmr3903937b3a.10.1718229515532;
        Wed, 12 Jun 2024 14:58:35 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3cdacsm27295b3a.132.2024.06.12.14.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 14:58:35 -0700 (PDT)
Date: Wed, 12 Jun 2024 14:58:35 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jun 2024 14:58:32 PDT (-0700)
Subject: Re: [PATCH v3] riscv: defconfig: Enable StarFive JH7110 drivers
In-Reply-To: <20240605071701.13737-1-hal.feng@starfivetech.com>
CC: Conor Dooley <conor.dooley@microchip.com>, emil.renner.berthing@canonical.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, hal.feng@starfivetech.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hal.feng@starfivetech.com
Message-ID: <mhng-e2ae02b6-ac36-40cf-aa44-79ab8a625885@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_145839_688726_7087F96F 
X-CRM114-Status: GOOD (  19.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 05 Jun 2024 00:17:01 PDT (-0700), hal.feng@starfivetech.com wrote:
> Add support for StarFive JH7110 SoC and VisionFive 2 board.
> - Cache
> - Temperature sensor
> - PMIC (AXP15060)
> - Ethernet PHY (YT8531)
> - Restart GPIO
> - RNG
> - I2C
> - SPI
> - Quad SPI
> - PCIe
> - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> - Audio (I2S / TDM / PWM-DAC)
> - MIPI-CSI2 RX & D-PHY RX
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>
> As more drivers of StarFive JH7110 VisionFive 2 board are upstream,
> add support for them in riscv defconfig.
>
> Changes since v2:
> - As the JH7110 PCIe driver was accepted, add CONFIG_PCIE_STARFIVE_HOST=m.
> - Add CONFIG_MOTORCOMM_PHY=m, which supports the ethernet phy chips
>   on the board.
> - Rebase on the -next branch.
>
> Changes since v1:
> - Drop CONFIG_STAGING=y, CONFIG_STAGING_MEDIA=y,
>   CONFIG_V4L_PLATFORM_DRIVERS=y, CONFIG_VIDEO_STARFIVE_CAMSS=m.
> - Change CONFIG_SENSORS_SFCTEMP as a module.
> - Drop CONFIG_CLK_STARFIVE_JH7110_*=y, because they are not critical to boot.
> - Update the commit message.
>
> History:
> v2: https://lore.kernel.org/all/20240506034627.66765-1-hal.feng@starfivetech.com/
> v1: https://lore.kernel.org/all/20240403060902.42834-1-hal.feng@starfivetech.com/
>
> ---
>  arch/riscv/configs/defconfig | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 12dc8c73a8ac..6e10039c5c42 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -110,8 +110,10 @@ CONFIG_PCIEPORTBUS=y
>  CONFIG_PCI_HOST_GENERIC=y
>  CONFIG_PCIE_XILINX=y
>  CONFIG_PCIE_FU740=y
> +CONFIG_PCIE_STARFIVE_HOST=m
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_SIFIVE_CCACHE=y
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> @@ -143,6 +145,7 @@ CONFIG_RAVB=y
>  CONFIG_STMMAC_ETH=m
>  CONFIG_MICREL_PHY=y
>  CONFIG_MICROSEMI_PHY=y
> +CONFIG_MOTORCOMM_PHY=m
>  CONFIG_CAN_RCAR_CANFD=m
>  CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_KEYBOARD_SUN4I_LRADC=m
> @@ -155,24 +158,35 @@ CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_HW_RANDOM_JH7110=m
> +CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=m
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_I2C_MV64XXX=m
>  CONFIG_I2C_RIIC=y
>  CONFIG_SPI=y
> +CONFIG_SPI_CADENCE_QUADSPI=m
> +CONFIG_SPI_PL022=m
>  CONFIG_SPI_RSPI=m
>  CONFIG_SPI_SIFIVE=y
>  CONFIG_SPI_SUN6I=y
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_GPIO_SIFIVE=y
> +CONFIG_POWER_RESET_GPIO_RESTART=y
> +CONFIG_SENSORS_SFCTEMP=m
>  CONFIG_CPU_THERMAL=y
>  CONFIG_DEVFREQ_THERMAL=y
>  CONFIG_RZG2L_THERMAL=y
>  CONFIG_WATCHDOG=y
>  CONFIG_SUNXI_WATCHDOG=y
>  CONFIG_RENESAS_RZG2LWDT=y
> +CONFIG_MFD_AXP20X_I2C=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_REGULATOR_AXP20X=y
>  CONFIG_REGULATOR_GPIO=y
> +CONFIG_MEDIA_SUPPORT=m
> +CONFIG_VIDEO_CADENCE_CSI2RX=m
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_NOUVEAU=m
> @@ -184,6 +198,10 @@ CONFIG_SOUND=y
>  CONFIG_SND=y
>  CONFIG_SND_SOC=y
>  CONFIG_SND_SOC_RZ=m
> +CONFIG_SND_DESIGNWARE_I2S=m
> +CONFIG_SND_SOC_STARFIVE=m
> +CONFIG_SND_SOC_JH7110_PWMDAC=m
> +CONFIG_SND_SOC_JH7110_TDM=m
>  CONFIG_SND_SOC_WM8978=m
>  CONFIG_SND_SIMPLE_CARD=m
>  CONFIG_USB=y
> @@ -197,6 +215,11 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_RENESAS_USBHS=m
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_USB_CDNS_SUPPORT=m
> +CONFIG_USB_CDNS3=m
> +CONFIG_USB_CDNS3_GADGET=y
> +CONFIG_USB_CDNS3_HOST=y
> +CONFIG_USB_CDNS3_STARFIVE=m
>  CONFIG_USB_MUSB_HDRC=m
>  CONFIG_USB_MUSB_SUNXI=m
>  CONFIG_NOP_USB_XCEIV=m
> @@ -246,6 +269,9 @@ CONFIG_RZG2L_ADC=m
>  CONFIG_RESET_RZG2L_USBPHY_CTRL=y
>  CONFIG_PHY_SUN4I_USB=m
>  CONFIG_PHY_RCAR_GEN3_USB2=y
> +CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
> +CONFIG_PHY_STARFIVE_JH7110_PCIE=m
> +CONFIG_PHY_STARFIVE_JH7110_USB=m
>  CONFIG_LIBNVDIMM=y
>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_EXT4_FS=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
