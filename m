Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88394C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+UemD9lHSydD4ftJclcbEtRrLokhU5kPZjDR44ppCnI=; b=TL/Zf3Ws+9dYchp/eojszYzvGH
	rOCG+j+r2yEx6mLRPBbgOoqymBOYo8zgbNa2AWDI+XPrTXnWRnHUZwwxTaQIn06BmBoETwhD9FxQo
	yugRcz/Z70e/wKuInm7RplRaGNdQvFprox8NKd6KMicw74n3JSygshyP273P22Ol+YxaXP/CqEA05
	65uWV/lU+VYRkFEdmCq7JigHZynMubr6UMuDjSQCiwkBd52AoO8zYrj0IyvMMowdnecOmBfqUnZmV
	SrT1C/2jLaa3AMP0QKs8OJboxjRH7vU2VcM/YfickvuiDli+IPF2T9K+AiGmXimFa8NdaETyYw8KP
	zJ2QlPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2CWN-0000000A5ew-49SO;
	Wed, 01 May 2024 16:09:27 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2CWK-0000000A5dV-2ds7
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 16:09:27 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso686712b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1714579763; x=1715184563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hs8AEy6uwBw23GBhL/y4wzU+oAIIpJLenHoelU6juSY=;
        b=iJEKHMY7w3GtbsNysCFfrnNcIoULNUfQsM07bAzIks4d+Ht3V+t3SSEV0wwCzclj89
         qNqAWgxn44CcJvGLmxR8Qn1oMU3Wna9JZBiEULeO6EKm1Kz8H1SSkjwnFLif1GY+LQXO
         kylmo47yKheQWSSBpl+dPUQIt0OT3zFozE4ZFK8Xxg3y3PWZJdo0MFhptRWdcRm52ZeS
         RkMvj2WFn0frUeyQJrI25IgoO5/6M7SiSGgpCKXLDoQNnoTyUlqQT/xpGG6diqLQJi0b
         tSCYm+A44YUbV0YEMvtYg1mOriz+Tmaxwu8m2tJIZQg/koVBg/Rb/ub01ZPWxKVkex8R
         EZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714579763; x=1715184563;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs8AEy6uwBw23GBhL/y4wzU+oAIIpJLenHoelU6juSY=;
        b=BX5Ohz8uPJX950URRCRtuFY/xnCjHE6Nkf3tE9YlBbE7jeES7PtBTOelmGTESvVfId
         neTd25/n4hcrRZTNXsCwX9cAc0FOk2zQ0UFLL+sjXCSWeKWcf3C/um2d5ZwEnUQ9SGqb
         V05+rvj3tdYiCmvZy35xHvW+uf95+ftG6w7q223LkyAzXEvE/Weh5ltbKenJPmmBYsOz
         ysn5ayrP/333+0M1cu/7qOL1SeFxBWmmB4xDE1wpDcxo/jZYLjvGZOdJvrUWNo6CEa09
         SsUh4DDFFIYEykZ++yzAf5q7aPoVKI4yEPZbgnM6M6URP9kzO9bLqIB+3JlJ5z37hPwG
         hvxg==
X-Forwarded-Encrypted: i=1; AJvYcCWBXBc6A6LcIfdfS+gtjA8taKrm3h9jPSsUluNj35EgZvcmqWeRt5+sGcZPt8qkISF5Qxi7XxScYL4dxzhwH78p9i/tPC+foY/apgp99J+f
X-Gm-Message-State: AOJu0YxsG4AmPsMpa7MydJxMlGQx85VGiaIsG2GNrUGjX6vwW6ceK4pq
	aKEYJfD8lcUJ+BCv7jLM+GFqqLajjzdsdNety2ZD9hz+dt8D4goo5W6MY7vdRxw=
X-Google-Smtp-Source: AGHT+IHuAOyWlgVt2h3uyi8hnKTZI7/x7V3qqE6MOMe6LFlu4tUIxezgPSdRgqkWAJuomjPaTKM+Xg==
X-Received: by 2002:a05:6a21:3392:b0:1a9:509c:eba6 with SMTP id yy18-20020a056a21339200b001a9509ceba6mr160923pzb.25.1714579760977;
        Wed, 01 May 2024 09:09:20 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id h6-20020a056a00170600b006e6b180d87asm22803891pfc.35.2024.05.01.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:09:20 -0700 (PDT)
Date: Wed, 01 May 2024 09:09:20 -0700 (PDT)
X-Google-Original-Date: Wed, 01 May 2024 09:09:18 PDT (-0700)
Subject: Re: [PATCH v1] riscv: defconfig: Enable StarFive JH7110 drivers
In-Reply-To: <20240403060902.42834-1-hal.feng@starfivetech.com>
CC: Conor Dooley <conor.dooley@microchip.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, hal.feng@starfivetech.com,
  emil.renner.berthing@canonical.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hal.feng@starfivetech.com
Message-ID: <mhng-3c2a418c-ce79-4287-a890-208a5d026e70@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_090924_799817_ED88B95F 
X-CRM114-Status: GOOD (  21.36  )
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

On Tue, 02 Apr 2024 23:09:02 PDT (-0700), hal.feng@starfivetech.com wrote:
> Add support for StarFive JH7110 SoC and VisionFive 2 board.
> - Clock & reset
> - Cache
> - Temperature sensor
> - PMIC (AXP15060)
> - Restart GPIO
> - RNG
> - I2C
> - SPI
> - Quad SPI
> - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> - Audio (I2S / TDM / PWM-DAC)
> - Camera Subsystem & MIPI-CSI2 RX & D-PHY RX
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>
> Hi,
>
> As more drivers of StarFive JH7110 VisionFive 2 board are upstream,
> add support for them in riscv defconfig.
>
> Best regards,
> Hal
>
> ---
>  arch/riscv/configs/defconfig | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index fc0ec2ee13bc..a4eb66b30d95 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -111,6 +111,7 @@ CONFIG_PCIE_XILINX=y
>  CONFIG_PCIE_FU740=y
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_SIFIVE_CCACHE=y
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> @@ -154,24 +155,36 @@ CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
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
> +CONFIG_SENSORS_SFCTEMP=y
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
> +CONFIG_V4L_PLATFORM_DRIVERS=y
> +CONFIG_VIDEO_CADENCE_CSI2RX=m
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_NOUVEAU=m
> @@ -183,6 +196,10 @@ CONFIG_SOUND=y
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
> @@ -196,6 +213,11 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
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
> @@ -233,6 +255,13 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RENESAS_OSTM=y
> +CONFIG_STAGING=y
> +CONFIG_STAGING_MEDIA=y
g
I don't think we want staging on in defconfig.

> +CONFIG_VIDEO_STARFIVE_CAMSS=m

Is it just for this?  I think we can just exclude that from defconfig 
until it gets out of staging, we should be able to boot without it.  
According to the TODO userspace isn't there yet, so I think it should be 
pretty safe.

> +CONFIG_CLK_STARFIVE_JH7110_AON=y
> +CONFIG_CLK_STARFIVE_JH7110_STG=y
> +CONFIG_CLK_STARFIVE_JH7110_ISP=y
> +CONFIG_CLK_STARFIVE_JH7110_VOUT=y
>  CONFIG_SUN8I_DE2_CCU=m
>  CONFIG_SUN50I_IOMMU=y
>  CONFIG_RPMSG_CHAR=y
> @@ -244,6 +273,9 @@ CONFIG_RZG2L_ADC=m
>  CONFIG_RESET_RZG2L_USBPHY_CTRL=y
>  CONFIG_PHY_SUN4I_USB=m
>  CONFIG_PHY_RCAR_GEN3_USB2=y
> +CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
> +CONFIG_PHY_STARFIVE_JH7110_PCIE=m
> +CONFIG_PHY_STARFIVE_JH7110_USB=m
>  CONFIG_LIBNVDIMM=y
>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_EXT4_FS=y
>
> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
