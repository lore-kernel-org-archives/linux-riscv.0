Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF312C49EA5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 14:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF61613DA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 14:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FF61613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OsaL3TrKVbMnaYnYNrun6vdx7wnnQW9UJygUTZZ61Uw=; b=Ojvv1j3PWwh3HxzyA1qsSLvH4J
	4KWCXI+Ts+AqHuxzkLVoNcizJfYa3DwbHhinFCEu3va7T0CHoxzpLeXkzSptY1jmHORzbPCreuDAV
	jHBCcMVuFLpTGEgVvIDcaOzKVjTXZ3Ibu8kAV82MWYO0TFiJyqzVDACWntzoFr9io/RECRO1M1pz9
	nfSJGEIE7Zwk2BBEUSNP7FdMXS7JgeEWYZ1zHxMhtjNcC0yfQEYuU/WjuXWo5pOjf04ZeZkyWLK+v
	3hwoTcEIf0Z9Au/PUvzP3PjdHaDH6IobDsdN08qvHb2jRNT42BD8h0ETSiC5p6vfrm1fi+4Mc/5Zk
	FH/6hwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwQfn-00F7QA-3L; Thu, 24 Jun 2021 14:49:43 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwQfj-00F7PB-Ia
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 14:49:41 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso3643831pjp.2
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XnmckKq8dgTGOIdOM2n9ve+pT1O+xT/ae6PiB67Krp4=;
 b=J/46JE4rYBco92WvjIgWNLPt5sDHkTLgO3KgZB7D5WxI0D2I3RpbP76jJTLWJG6G7z
 oZglvt68ONuX7lq+LL6cgQd+Gh4KeXc+Y+PCO311v3/F9lwVJKgaLwHMxSreD7hwUvTR
 6c9jHrubOHxj/Aeb8J6tCM+gPFR2VG3fCWLbIw8I55TU9L75wxSlHc7pxyt/LtMgOvx1
 BDti8ety3D2nzzNn9yy68XyHiIZrWXc38RumKsRv6zl4gJcoGZixg3rfn3dgGhvZlOUx
 QGguV5xnp3QAoMOLgH/pmt+EVR40mK8nUdMPs88SPs0w6ASJ1Ecuefq9NrLoQa+9dCkB
 0/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XnmckKq8dgTGOIdOM2n9ve+pT1O+xT/ae6PiB67Krp4=;
 b=HZKaijVUsEdOFIVtW6Tk5UXbdeuKKx//3Cktai+ugpIne8tWvAYfTedc98gzERJKIH
 DiXZiwb0VgmCZISRhVwMnBaFpxWWicaU2oWW94hHvMHAOSjUdnpr229dHAvwyrdgFDQC
 2jafxItZEHyUl5ankVMpn39RuSBXdMIUkGCxKdVMPIVbAhuwj/Lm8uamu1LDuICjD7n6
 AHxSmjzpSRTSyI0T8guk2Y+0XlHCavG32avATDqLIcxEmKRmlIHSuEtiRNV+dFrnL5LB
 vZ604KhMG62HOSEmPY+C3quqhCJzlX9+VL8m1dgq+7lBXlBtExZvtFyMQULjSbFhUjRX
 so+w==
X-Gm-Message-State: AOAM531o3saijLROolQ6Dy2Cx+b1g+E0NMY+p9UbWWoQD0cgl2aZoOh/
 U/12nxhZeOzZAPr6GAPBw4U=
X-Google-Smtp-Source: ABdhPJxz982h5e4ZJSZq8f5nwVySEDe1bxRB41qoGssApXk372VWg37oK3TF7ih+CYYUkOQEBtLbGg==
X-Received: by 2002:a17:90a:8a13:: with SMTP id
 w19mr5799916pjn.227.1624546178622; 
 Thu, 24 Jun 2021 07:49:38 -0700 (PDT)
Received: from [192.168.1.153] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id y21sm2836572pgc.93.2021.06.24.07.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 07:49:38 -0700 (PDT)
Subject: Re: [PATCH 1/1] config: Enable jh7100 SoC
To: Drew Fustini <drew@beagleboard.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
 <82328d90-2769-6bd0-a28e-b501fba63d76@gmail.com> <20210623190801.GB493015@x1>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <d84539b7-e46d-f767-246b-85c20899ab94@gmail.com>
Date: Thu, 24 Jun 2021 23:49:35 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623190801.GB493015@x1>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_074939_694887_E147D0F7 
X-CRM114-Status: GOOD (  25.22  )
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



On 6/24/2021 4:08 AM, Drew Fustini wrote:
> On Wed, Jun 23, 2021 at 09:46:54PM +0900, Akira Tsukamoto wrote:
>>
>> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
>> ---
>>  arch/riscv/configs/defconfig | 105 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 105 insertions(+)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> 
> Thanks for submitting this so we can review and discuss.
> 
>> index 1f2be234b11c..e07d26d2743c 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -138,3 +138,108 @@ CONFIG_DEBUG_BLOCK_EXT_DEVT=y
>>  CONFIG_MEMTEST=y
>>  # CONFIG_SYSFS_SYSCALL is not set
>>  CONFIG_EFI=y
>> +CONFIG_FB_STARFIVE=y
>> +CONFIG_FB_STARFIVE_HDMI_ADV7513=y
>> +CONFIG_FB_STARFIVE_HDMI_TDA998X=y
>> +CONFIG_FB_STARFIVE_SEEED5INCH=y
>> +CONFIG_FB_STARFIVE_VIDEO=y
> 
> These should be dropped as they are vendor drivers that will never be
> upstream as fbdev is deprecated [1]. StarFive is working on DRM driver
> but that is a couple months away from being ready.

I will remove fbdev. And enable DRM driver only when them become ready.

> 
>> +CONFIG_HW_RANDOM_STARFIVE_VIC=y
>> +CONFIG_SOC_STARFIVE_VIC7100=y
> 
> Before this gets merged upstream, we need to switch over to using JH7100
> instead of VIC.
> 
> For those not familiar, VIC was the StarFive internal project name but
> the product is named JH7100 [2].

I will wait to enable the configs above until the patches rename them
and become upstream ready.

> 
>> +CONFIG_FPGA_GMAC_FLUSH_DDR=y
>> +CONFIG_MMC_DW_FLUSH_DDR=y
>> +CONFIG_USB_CDNS3_HOST_FLUSH_DMA=y
>> +CONFIG_SOC_STARFIVE_VIC7100_I2C_GPIO=y
> 
> This config is being used in as a vendor hack in i2c_dw_configure_gpio()
> drivers/i2c/busses/i2c-designware-master.c [3].
> 
> It's possible we may be able to eliminate this once I have completed
> gpio and pinctrl drivers. Either way, this option will never be used in
> an upstream kernel.

Sure, I will remove them and try it since I think your drivers were
in the Esmil branch.

> 
>> +CONFIG_VIDEO_STARFIVE_VIN=y
>> +CONFIG_VIDEO_STARFIVE_VIN_SENSOR_IMX219=y
>> +CONFIG_VIDEO_STARFIVE_VIN_SENSOR_OV5640=y
>> +CONFIG_VIDEO_STARFIVE_VIN_SENSOR_SC2235=y
> 
> These should be dropped as they are vendor drivers that do not use V4L2
> and are not upstreamable [4]. StarFive is working on proper V4L2 drivers
> but that is a couple months away from being ready.

Thanks, I will also wait for the v4l2 being ready.

Akira

> 
>> +CONFIG_RCU_CPU_STALL_TIMEOUT=60
>> +CONFIG_LOG_CPU_MAX_BUF_SHIFT=15
>> +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
>> +CONFIG_PM=y
>> +CONFIG_PM_CLK=y
>> +CONFIG_EFI_BOOTLOADER_CONTROL=y
>> +CONFIG_BLK_PM=y
>> +CONFIG_IOSCHED_BFQ=y
>> +CONFIG_KSM=y
>> +CONFIG_CMA=y
>> +CONFIG_CMA_AREAS=7
>> +CONFIG_REGMAP_I2C=y
>> +CONFIG_REGMAP_IRQ=y
>> +CONFIG_MTD_OF_PARTS=y
>> +CONFIG_MTD_BLKDEVS=y
>> +CONFIG_MTD_BLOCK=y
>> +CONFIG_MTD_PARTITIONED_MASTER=y
>> +CONFIG_MTD_MAP_BANK_WIDTH_1=y
>> +CONFIG_MTD_MAP_BANK_WIDTH_2=y
>> +CONFIG_MTD_MAP_BANK_WIDTH_4=y
>> +CONFIG_MTD_CFI_I1=y
>> +CONFIG_MTD_CFI_I2=y
>> +CONFIG_MTD_SPI_NOR=y
>> +CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
>> +CONFIG_BLK_DEV_NBD=y
>> +CONFIG_INPUT_LEDS=y
>> +CONFIG_INPUT_EVDEV=y
>> +CONFIG_SERIAL_8250_DMA=y
>> +CONFIG_SERIAL_8250_DWLIB=y
>> +CONFIG_SERIAL_8250_DW=y
>> +CONFIG_HW_RANDOM_VIRTIO=y
>> +CONFIG_I2C_CHARDEV=y
>> +CONFIG_I2C_MUX=y
>> +CONFIG_I2C_DESIGNWARE_CORE=y
>> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
>> +CONFIG_SPI_MEM=y
>> +CONFIG_SPI_CADENCE_QUADSPI=y
>> +CONFIG_SPI_DESIGNWARE=y
>> +CONFIG_SPI_DW_DMA=y
>> +CONFIG_SPI_DW_MMIO=y
>> +CONFIG_SPI_SPIDEV=y
>> +CONFIG_GPIO_SYSFS=y
>> +CONFIG_GPIO_STARFIVE_VIC=y
> 
> I am working on upstreamable version of the GPIO driver and will submit
> RFC soon. This will be called CONFIG_GPIO_STARFIVE_JH7100.
> 
>> +CONFIG_GPIO_TPS65086=y
>> +CONFIG_POWER_RESET_TPS65086=y
>> +CONFIG_MFD_TPS65086=y
>> +CONFIG_USB_HID=y
>> +CONFIG_USB_CDNS_SUPPORT=y
>> +CONFIG_USB_CDNS_HOST=y
>> +CONFIG_USB_CDNS3=y
>> +CONFIG_USB_CDNS3_HOST=y
>> +CONFIG_USB_ROLE_SWITCH=y
>> +CONFIG_SDIO_UART=y
>> +CONFIG_MMC_DW=y
>> +CONFIG_MMC_DW_PLTFM=y
>> +CONFIG_NEW_LEDS=y
>> +CONFIG_LEDS_CLASS=y
>> +CONFIG_LEDS_GPIO=y
>> +CONFIG_LEDS_TRIGGERS=y
>> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>> +CONFIG_RTC_DRV_EFI=y
>> +CONFIG_DMADEVICES=y
>> +CONFIG_DMA_ENGINE=y
>> +CONFIG_DMA_VIRTUAL_CHANNELS=y
>> +CONFIG_DMA_OF=y
>> +CONFIG_DW_AXI_DMAC=y
>> +CONFIG_DW_AXI_DMAC_STARFIVE=y
>> +CONFIG_COMMON_CLK_SI544=y
>> +CONFIG_COMMON_CLK_PWM=y
>> +CONFIG_SIFIVE_L2=y
>> +CONFIG_SIFIVE_L2_FLUSH=y
>> +CONFIG_SIFIVE_L2_FLUSH_START=0x80000000
>> +CONFIG_SIFIVE_L2_FLUSH_SIZE=0x800000000
>> +CONFIG_SIFIVE_L2_IRQ_DISABLE=y
>> +CONFIG_PWM=y
>> +CONFIG_PWM_SYSFS=y
>> +CONFIG_PWM_SIFIVE_PTC=y
>> +CONFIG_RESET_CONTROLLER=y
>> +CONFIG_PROC_KCORE=y
>> +CONFIG_EFIVAR_FS=y
>> +CONFIG_ZLIB_DEFLATE=y
>> +CONFIG_DMA_CMA=y
>> +CONFIG_CMA_SIZE_MBYTES=640
>> +CONFIG_CMA_SIZE_SEL_MBYTES=y
>> +CONFIG_CMA_ALIGNMENT=8
>> +CONFIG_NET_VENDOR_STMICRO=y
>> +CONFIG_STMMAC_ETH=y
>> +CONFIG_STMMAC_PLATFORM=y
>> +CONFIG_DWMAC_GENERIC=y
>> +CONFIG_MICREL_PHY=y
>> -- 
>> 2.17.1
>>
>>
> 
> Thanks,
> Drew
> 
> [1] https://github.com/starfive-tech/linux/tree/beaglev/drivers/video/fbdev/starfive
> [2] https://github.com/starfive-tech/beaglev_doc/
> [3] https://github.com/starfive-tech/linux/blob/beaglev/drivers/i2c/busses/i2c-designware-master.c#L170
> [4] https://github.com/starfive-tech/linux/tree/beaglev/drivers/media/platform/starfive
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
