Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EC1C4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 19:08:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B27611C1
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 19:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B27611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ap38vd6zIyAAFUpgo6YmCp3ZiySQ2xjhatw7vLGumAk=; b=atU9/mMCs3eD29
	e1gNtnVG2rd+7Q7X53NOihO6HLNG0LkJuQ2x/0vncdR9pjVulLNS0ozTG3Kdo6VteSDvZgJl8mS56
	LBuCMQdGaYWRKDPU/20qtaWeX4ALu0LR+lgnohlpxE79IMqlcFryD2HPz9EsUJdMlLE5YJ63Qu+Qe
	qC2y/2SiULtlSVZFj17u6Z+SGRt5a9z46Zxo3PrwkmHcHXBgBfHqqmCLgAjZo0vJA29tNbORGL69D
	BAIIZY8S8eioxvrFZyCkzDJJrkSfQJJ02YXwExPIhrn17L3IcqPN9EqwwkWsjCRp1o+ZEbbvBnElb
	hpD03UTEVp6EducVkllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw8EK-00Bkzf-VP; Wed, 23 Jun 2021 19:08:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw8EH-00Bkz6-DL
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 19:08:07 +0000
Received: by mail-pg1-x536.google.com with SMTP id y14so2555055pgs.12
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=txv0mg8hNV4LnPNcH/0dMBSXo2LJjKpiSwWFkWZWzM0=;
 b=jppkvK1NGriJQkiOs1sxqUdmIiL7xjASHl9uqvN1uR7Fw3J9VRfiGHYuSjx16ObWT6
 yL/vqSelXdmKUyDAoSe2wSAv4edNcfph+vLza2uux/BS0rhLnum1mB5Hk+7lyouTAUfH
 PB9Oi3EqxN8cLCYPljM45znx2zmgGI6u1MVp0Q9KNfb55NSv2Q4wScEClFuGzngmcuJv
 /j152bNOLV7K/w2muvDs5F5QBhWkg2UpR+vRbb7z1jx5ytTeD1t+O4qCHc9wbtye1DLC
 Xy9npBik3M0/sSL6xtqNnt4qQOsaJnZETXFTd9ypZVcxbhDCMfjQXqEsuOUb0NwQoKvi
 pNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=txv0mg8hNV4LnPNcH/0dMBSXo2LJjKpiSwWFkWZWzM0=;
 b=AsEjFvh0pcVcxTvw4siiP2EYf3KFXHcd3w9dUrvtHmdQGnsO+leuxnLqhF9YJ4bx7U
 awzGSVQln93tKUzJQ7n4uZLGikjmWXY6bnW3yDXbcZ2C0yQPuPiEq47/8xy/s0I3bGeH
 4EiS12NY3sDExYpVzHV6dGIZhgp0rp0cmihdC3USZlgFCGpzI/E5/FRVN0xJib3nWCwc
 PcEGzUJZ4EYARUGNX+xZV74m74/Dm7jmKvXkdfFMYh708FdkT8YuDq49SNmoZBItduYU
 fIvJuYz/rti2UvUMY0LfjoDFhZb2Xt8SCNMedq1LFwCPysQYeLk1dbVlejWxozrFb//a
 /EMQ==
X-Gm-Message-State: AOAM533k1pHyUhduB7BvdiGKqK2dI9YbxokNLG70UWZiTNRtYgn6+bBw
 DkLGOmKsQqjcykH1RcuXQODIkw==
X-Google-Smtp-Source: ABdhPJxJxcXqTvZMK6ST7HFpAiLBiDRa3Sh/XPUVK9nqUKm55SHUY7/KuvA3x5J2mDmH4lV9tpucTQ==
X-Received: by 2002:a65:4242:: with SMTP id d2mr862669pgq.243.1624475284079;
 Wed, 23 Jun 2021 12:08:04 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id o7sm611165pgs.45.2021.06.23.12.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:08:03 -0700 (PDT)
Date: Wed, 23 Jun 2021 12:08:01 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] config: Enable jh7100 SoC
Message-ID: <20210623190801.GB493015@x1>
References: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
 <82328d90-2769-6bd0-a28e-b501fba63d76@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82328d90-2769-6bd0-a28e-b501fba63d76@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_120805_498920_1EADD262 
X-CRM114-Status: GOOD (  20.18  )
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

On Wed, Jun 23, 2021 at 09:46:54PM +0900, Akira Tsukamoto wrote:
> 
> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
> ---
>  arch/riscv/configs/defconfig | 105 +++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig

Thanks for submitting this so we can review and discuss.

> index 1f2be234b11c..e07d26d2743c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -138,3 +138,108 @@ CONFIG_DEBUG_BLOCK_EXT_DEVT=y
>  CONFIG_MEMTEST=y
>  # CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_EFI=y
> +CONFIG_FB_STARFIVE=y
> +CONFIG_FB_STARFIVE_HDMI_ADV7513=y
> +CONFIG_FB_STARFIVE_HDMI_TDA998X=y
> +CONFIG_FB_STARFIVE_SEEED5INCH=y
> +CONFIG_FB_STARFIVE_VIDEO=y

These should be dropped as they are vendor drivers that will never be
upstream as fbdev is deprecated [1]. StarFive is working on DRM driver
but that is a couple months away from being ready.

> +CONFIG_HW_RANDOM_STARFIVE_VIC=y
> +CONFIG_SOC_STARFIVE_VIC7100=y

Before this gets merged upstream, we need to switch over to using JH7100
instead of VIC.

For those not familiar, VIC was the StarFive internal project name but
the product is named JH7100 [2].

> +CONFIG_FPGA_GMAC_FLUSH_DDR=y
> +CONFIG_MMC_DW_FLUSH_DDR=y
> +CONFIG_USB_CDNS3_HOST_FLUSH_DMA=y
> +CONFIG_SOC_STARFIVE_VIC7100_I2C_GPIO=y

This config is being used in as a vendor hack in i2c_dw_configure_gpio()
drivers/i2c/busses/i2c-designware-master.c [3].

It's possible we may be able to eliminate this once I have completed
gpio and pinctrl drivers. Either way, this option will never be used in
an upstream kernel.

> +CONFIG_VIDEO_STARFIVE_VIN=y
> +CONFIG_VIDEO_STARFIVE_VIN_SENSOR_IMX219=y
> +CONFIG_VIDEO_STARFIVE_VIN_SENSOR_OV5640=y
> +CONFIG_VIDEO_STARFIVE_VIN_SENSOR_SC2235=y

These should be dropped as they are vendor drivers that do not use V4L2
and are not upstreamable [4]. StarFive is working on proper V4L2 drivers
but that is a couple months away from being ready.

> +CONFIG_RCU_CPU_STALL_TIMEOUT=60
> +CONFIG_LOG_CPU_MAX_BUF_SHIFT=15
> +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
> +CONFIG_PM=y
> +CONFIG_PM_CLK=y
> +CONFIG_EFI_BOOTLOADER_CONTROL=y
> +CONFIG_BLK_PM=y
> +CONFIG_IOSCHED_BFQ=y
> +CONFIG_KSM=y
> +CONFIG_CMA=y
> +CONFIG_CMA_AREAS=7
> +CONFIG_REGMAP_I2C=y
> +CONFIG_REGMAP_IRQ=y
> +CONFIG_MTD_OF_PARTS=y
> +CONFIG_MTD_BLKDEVS=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_PARTITIONED_MASTER=y
> +CONFIG_MTD_MAP_BANK_WIDTH_1=y
> +CONFIG_MTD_MAP_BANK_WIDTH_2=y
> +CONFIG_MTD_MAP_BANK_WIDTH_4=y
> +CONFIG_MTD_CFI_I1=y
> +CONFIG_MTD_CFI_I2=y
> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
> +CONFIG_BLK_DEV_NBD=y
> +CONFIG_INPUT_LEDS=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_SERIAL_8250_DMA=y
> +CONFIG_SERIAL_8250_DWLIB=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_MUX=y
> +CONFIG_I2C_DESIGNWARE_CORE=y
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> +CONFIG_SPI_MEM=y
> +CONFIG_SPI_CADENCE_QUADSPI=y
> +CONFIG_SPI_DESIGNWARE=y
> +CONFIG_SPI_DW_DMA=y
> +CONFIG_SPI_DW_MMIO=y
> +CONFIG_SPI_SPIDEV=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_STARFIVE_VIC=y

I am working on upstreamable version of the GPIO driver and will submit
RFC soon. This will be called CONFIG_GPIO_STARFIVE_JH7100.

> +CONFIG_GPIO_TPS65086=y
> +CONFIG_POWER_RESET_TPS65086=y
> +CONFIG_MFD_TPS65086=y
> +CONFIG_USB_HID=y
> +CONFIG_USB_CDNS_SUPPORT=y
> +CONFIG_USB_CDNS_HOST=y
> +CONFIG_USB_CDNS3=y
> +CONFIG_USB_CDNS3_HOST=y
> +CONFIG_USB_ROLE_SWITCH=y
> +CONFIG_SDIO_UART=y
> +CONFIG_MMC_DW=y
> +CONFIG_MMC_DW_PLTFM=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> +CONFIG_RTC_DRV_EFI=y
> +CONFIG_DMADEVICES=y
> +CONFIG_DMA_ENGINE=y
> +CONFIG_DMA_VIRTUAL_CHANNELS=y
> +CONFIG_DMA_OF=y
> +CONFIG_DW_AXI_DMAC=y
> +CONFIG_DW_AXI_DMAC_STARFIVE=y
> +CONFIG_COMMON_CLK_SI544=y
> +CONFIG_COMMON_CLK_PWM=y
> +CONFIG_SIFIVE_L2=y
> +CONFIG_SIFIVE_L2_FLUSH=y
> +CONFIG_SIFIVE_L2_FLUSH_START=0x80000000
> +CONFIG_SIFIVE_L2_FLUSH_SIZE=0x800000000
> +CONFIG_SIFIVE_L2_IRQ_DISABLE=y
> +CONFIG_PWM=y
> +CONFIG_PWM_SYSFS=y
> +CONFIG_PWM_SIFIVE_PTC=y
> +CONFIG_RESET_CONTROLLER=y
> +CONFIG_PROC_KCORE=y
> +CONFIG_EFIVAR_FS=y
> +CONFIG_ZLIB_DEFLATE=y
> +CONFIG_DMA_CMA=y
> +CONFIG_CMA_SIZE_MBYTES=640
> +CONFIG_CMA_SIZE_SEL_MBYTES=y
> +CONFIG_CMA_ALIGNMENT=8
> +CONFIG_NET_VENDOR_STMICRO=y
> +CONFIG_STMMAC_ETH=y
> +CONFIG_STMMAC_PLATFORM=y
> +CONFIG_DWMAC_GENERIC=y
> +CONFIG_MICREL_PHY=y
> -- 
> 2.17.1
> 
> 

Thanks,
Drew

[1] https://github.com/starfive-tech/linux/tree/beaglev/drivers/video/fbdev/starfive
[2] https://github.com/starfive-tech/beaglev_doc/
[3] https://github.com/starfive-tech/linux/blob/beaglev/drivers/i2c/busses/i2c-designware-master.c#L170
[4] https://github.com/starfive-tech/linux/tree/beaglev/drivers/media/platform/starfive

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
