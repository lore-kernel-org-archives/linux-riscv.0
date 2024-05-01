Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B5AC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9t5hgJe6gqtjoxeA/smABJ+teBMKDyRElETCoBzpu9g=; b=NSf724LqcPvPfQgVCZvua1VxVv
	in8FeqgeQYRWagLii/Cx1pAkaZX620Xdux48KhWqooPo6z/ShGB9zDFQr8en9KLXWrDJ/TMCm0+eF
	fb4LkIvt3hHahi3BypcA8vo5m9R9t+FArbQhk3OL8myymleZsSc9QkF2X0koQasKvs7KMihR0CdDR
	/AEwGldJrVlW5h4PWPAdhw5zwfSh+0tUUWn2gZ7bULvyENv6osn6jgSzvXbh7cQQ0m0KZ3BJlZvIW
	zFJeFTPZfTzCVPL1SF0aB16YwoXsGv/AR6kfd1qjcrhy2oE5OtzvFy+x8TWosOPCmUSXoWzOGWSzG
	aBnbHpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2CmN-0000000A8qL-0mGS;
	Wed, 01 May 2024 16:25:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2CmJ-0000000A8oP-15h8
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 16:25:57 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9CEE8410B0
	for <linux-riscv@lists.infradead.org>; Wed,  1 May 2024 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714580746;
	bh=wycYCbLMd5yuBOu2HDuqsCYrixIlc2Lb2z75WJVmmSM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PnpKyDUMuJ3B75JCQ4Cs1u5lBnqonIDQ8An83WKMxOEYB5M4W/RYYjKWFMXzl++Q2
	 oe/Kt9297HkQbVvXFy8aeNll7v/OKbbC7tX1NN/jcHu88b8GKTAxxnmU5JWpvK9JzK
	 h5VOADktuBJ9P/6wZGkBzjZwQyWOAuE7T4bB0cSJkvT2Cm3Dt8u2j7C1GIqQOJbZyP
	 ALvowSN65F+WDnxF/OJv5LFUKwJqzzSvzi5KXm/oTgUlFTNcIquxx/5oh6CDuAuhSk
	 ykDD/Iv/WieTvWAsY/rC6VwKE5dbxoZk9JdASjaUjHCDHg1WUqSo4CGydnp4Mb9nSL
	 0AhYBWroGs0vw==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43adb0bee7dso39793091cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 09:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580744; x=1715185544;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wycYCbLMd5yuBOu2HDuqsCYrixIlc2Lb2z75WJVmmSM=;
        b=o8OTtrJVHwO5hVhaaazsdvYBf57QyiJxzNvLQjwgyOHFBed+xjU/hrtkGRAhKhuWIa
         QuxKfsOd6oEe+PK2M1sYp4WuSJcAgm12Cx/nL1A4JGgihfwJLOChYZsdGe6sqOkeYQfR
         bx4FMrg7UVfEGrfthpdL4KNdDvzo/LciqTnGrxvX+antjAXPzA1kqGMyK3QPrTa5VX20
         BIkqVD28yioV4ewDs6b6LMlLfc1eNzuARPrTgKPBZNuQumUtX0SZB0ii2NMWhfFnm0As
         Li2lGD7FWMcJ3IYfE1ECPj76Ew2EYUFRwdcsMDtdzBQ7A7OpxNbWtGpc3ykDJY2WxKos
         +1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUYgBEr6WJ5CSBDUS2HIfWvsJ6dz08dcU1UOKuewe0hCbAfz3S1CeNDVIUGaC2dAzh6TjJDJIDmNq2jyhtjwUmFAcuMN9Y/CGVoeXGyP3rn
X-Gm-Message-State: AOJu0YwJxMm9eH9B7lauuE0rXw9aB+edCUWM8f2z/Wjv8wi7EwPLp0aY
	mrXzq54wauUk1wMRoVrmls/f8mOnhVhngbjm8dbovD1l/uouQWLFp7atYmoSUTuhAwPgrJ8MStg
	GmjdMUtD+Fel6/2hoMFA8X7M7VwZAEid6dLlmLILSJxBtZgA7+acCE5xFOJ+BpKAVK+8oBjB59P
	GhX8kyt2Cza4i92uOH42LyOpgU7kPgiwhCOK5Nc/7DQcvS/+48mu76tupP
X-Received: by 2002:a05:622a:314:b0:43a:cd4f:b227 with SMTP id q20-20020a05622a031400b0043acd4fb227mr2534209qtw.49.1714580744291;
        Wed, 01 May 2024 09:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe2kVLkf6u2qf3YuZKhV8dPFhEQQwlkviXB5GbiMEsirgCec00LON7FXxMJGNO9zItZm8gwljpWd0lxgy15R8=
X-Received: by 2002:a05:622a:314:b0:43a:cd4f:b227 with SMTP id
 q20-20020a05622a031400b0043acd4fb227mr2534177qtw.49.1714580743783; Wed, 01
 May 2024 09:25:43 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 May 2024 09:25:43 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <mhng-3c2a418c-ce79-4287-a890-208a5d026e70@palmer-ri-x1c9a>
References: <20240403060902.42834-1-hal.feng@starfivetech.com> <mhng-3c2a418c-ce79-4287-a890-208a5d026e70@palmer-ri-x1c9a>
Mime-Version: 1.0
Date: Wed, 1 May 2024 09:25:43 -0700
Message-ID: <CAJM55Z810=pxc+tmgw0yS+Nx=K9h=OGFxOhvtJT7nyGGg0d_nA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: defconfig: Enable StarFive JH7110 drivers
To: Palmer Dabbelt <palmer@dabbelt.com>, hal.feng@starfivetech.com
Cc: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, emil.renner.berthing@canonical.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_092555_595255_8710B29E 
X-CRM114-Status: GOOD (  23.40  )
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

Palmer Dabbelt wrote:
> On Tue, 02 Apr 2024 23:09:02 PDT (-0700), hal.feng@starfivetech.com wrote:
> > Add support for StarFive JH7110 SoC and VisionFive 2 board.
> > - Clock & reset
> > - Cache
> > - Temperature sensor
> > - PMIC (AXP15060)
> > - Restart GPIO
> > - RNG
> > - I2C
> > - SPI
> > - Quad SPI
> > - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> > - Audio (I2S / TDM / PWM-DAC)
> > - Camera Subsystem & MIPI-CSI2 RX & D-PHY RX
> >
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >
> > Hi,
> >
> > As more drivers of StarFive JH7110 VisionFive 2 board are upstream,
> > add support for them in riscv defconfig.
> >
> > Best regards,
> > Hal
> >
> > ---
> >  arch/riscv/configs/defconfig | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index fc0ec2ee13bc..a4eb66b30d95 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -111,6 +111,7 @@ CONFIG_PCIE_XILINX=y
> >  CONFIG_PCIE_FU740=y
> >  CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> > +CONFIG_SIFIVE_CCACHE=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_BLOCK=y
> >  CONFIG_MTD_CFI=y
> > @@ -154,24 +155,36 @@ CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> >  CONFIG_VIRTIO_CONSOLE=y
> >  CONFIG_HW_RANDOM=y
> >  CONFIG_HW_RANDOM_VIRTIO=y
> > +CONFIG_HW_RANDOM_JH7110=m
> > +CONFIG_I2C=y
> >  CONFIG_I2C_CHARDEV=m
> > +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> >  CONFIG_I2C_MV64XXX=m
> >  CONFIG_I2C_RIIC=y
> >  CONFIG_SPI=y
> > +CONFIG_SPI_CADENCE_QUADSPI=m
> > +CONFIG_SPI_PL022=m
> >  CONFIG_SPI_RSPI=m
> >  CONFIG_SPI_SIFIVE=y
> >  CONFIG_SPI_SUN6I=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> >  CONFIG_GPIO_SIFIVE=y
> > +CONFIG_POWER_RESET_GPIO_RESTART=y
> > +CONFIG_SENSORS_SFCTEMP=y

If this needs an update anyway this temperature sensor shouldn't be critical to
boot and can be left as a module.

/Emil

> >  CONFIG_CPU_THERMAL=y
> >  CONFIG_DEVFREQ_THERMAL=y
> >  CONFIG_RZG2L_THERMAL=y
> >  CONFIG_WATCHDOG=y
> >  CONFIG_SUNXI_WATCHDOG=y
> >  CONFIG_RENESAS_RZG2LWDT=y
> > +CONFIG_MFD_AXP20X_I2C=y
> >  CONFIG_REGULATOR=y
> >  CONFIG_REGULATOR_FIXED_VOLTAGE=y
> > +CONFIG_REGULATOR_AXP20X=y
> >  CONFIG_REGULATOR_GPIO=y
> > +CONFIG_MEDIA_SUPPORT=m
> > +CONFIG_V4L_PLATFORM_DRIVERS=y
> > +CONFIG_VIDEO_CADENCE_CSI2RX=m
> >  CONFIG_DRM=m
> >  CONFIG_DRM_RADEON=m
> >  CONFIG_DRM_NOUVEAU=m
> > @@ -183,6 +196,10 @@ CONFIG_SOUND=y
> >  CONFIG_SND=y
> >  CONFIG_SND_SOC=y
> >  CONFIG_SND_SOC_RZ=m
> > +CONFIG_SND_DESIGNWARE_I2S=m
> > +CONFIG_SND_SOC_STARFIVE=m
> > +CONFIG_SND_SOC_JH7110_PWMDAC=m
> > +CONFIG_SND_SOC_JH7110_TDM=m
> >  CONFIG_SND_SOC_WM8978=m
> >  CONFIG_SND_SIMPLE_CARD=m
> >  CONFIG_USB=y
> > @@ -196,6 +213,11 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
> >  CONFIG_USB_RENESAS_USBHS=m
> >  CONFIG_USB_STORAGE=y
> >  CONFIG_USB_UAS=y
> > +CONFIG_USB_CDNS_SUPPORT=m
> > +CONFIG_USB_CDNS3=m
> > +CONFIG_USB_CDNS3_GADGET=y
> > +CONFIG_USB_CDNS3_HOST=y
> > +CONFIG_USB_CDNS3_STARFIVE=m
> >  CONFIG_USB_MUSB_HDRC=m
> >  CONFIG_USB_MUSB_SUNXI=m
> >  CONFIG_NOP_USB_XCEIV=m
> > @@ -233,6 +255,13 @@ CONFIG_VIRTIO_BALLOON=y
> >  CONFIG_VIRTIO_INPUT=y
> >  CONFIG_VIRTIO_MMIO=y
> >  CONFIG_RENESAS_OSTM=y
> > +CONFIG_STAGING=y
> > +CONFIG_STAGING_MEDIA=y
> g
> I don't think we want staging on in defconfig.
>
> > +CONFIG_VIDEO_STARFIVE_CAMSS=m
>
> Is it just for this?  I think we can just exclude that from defconfig
> until it gets out of staging, we should be able to boot without it.
> According to the TODO userspace isn't there yet, so I think it should be
> pretty safe.
>
> > +CONFIG_CLK_STARFIVE_JH7110_AON=y
> > +CONFIG_CLK_STARFIVE_JH7110_STG=y
> > +CONFIG_CLK_STARFIVE_JH7110_ISP=y
> > +CONFIG_CLK_STARFIVE_JH7110_VOUT=y
> >  CONFIG_SUN8I_DE2_CCU=m
> >  CONFIG_SUN50I_IOMMU=y
> >  CONFIG_RPMSG_CHAR=y
> > @@ -244,6 +273,9 @@ CONFIG_RZG2L_ADC=m
> >  CONFIG_RESET_RZG2L_USBPHY_CTRL=y
> >  CONFIG_PHY_SUN4I_USB=m
> >  CONFIG_PHY_RCAR_GEN3_USB2=y
> > +CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
> > +CONFIG_PHY_STARFIVE_JH7110_PCIE=m
> > +CONFIG_PHY_STARFIVE_JH7110_USB=m
> >  CONFIG_LIBNVDIMM=y
> >  CONFIG_NVMEM_SUNXI_SID=y
> >  CONFIG_EXT4_FS=y
> >
> > base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
