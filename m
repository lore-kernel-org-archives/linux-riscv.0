Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_75_100,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A615C4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B81E610A0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B81E610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cZwYuqcID+CEDYutkUHc2QcfA5EcMXGxADdpQ6xAh2o=; b=WRDfRtYeiv7boJS+/PP4VHplpS
	3G7JMFAicKLG1Ej+UDKmJ7Ks3zMQxDY9XN0sayS0JBQk658B6ffPbmtMaliGo9D+R3SDx9SPynXGH
	lgOVOzkKSGSu843lmm+6qIk+xcBNU5frrAE2u1fmk0r2/7Eg0ye4pwiZI74+7nmfffFKX2bALPcl5
	QWZHwT5Xzp+vVWuO8CGl7mrOgSXYheOe4wGlQWTnelBPVjfjS/42+N5vSEEKr0hLb1rylsKZi6+ht
	bC+4elKEHWYzApksRGyjG4DZt3FNOrt7DFCcdQu4mD7BX4Q/xIhkB9sdvtOY3GyZsmWqPCpX1ILa3
	0RImX8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw2HV-00AfOK-BD; Wed, 23 Jun 2021 12:47:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw2HS-00AfMt-M9
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 12:47:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id w71so2235856pfd.4
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Hvf40VXXqsCPVGi0brARNsNARbp18VS1fRrQ6xN2glY=;
 b=BdqoiU/72hOIebU4EZ7osgIM+KMpu5bgBqiUf4dBQGku4tkLgIZSm/oLLA2Yv8qZtO
 BINdK3r/T9/n6Q2hHn8UH/nWhWmQPt6Ki26a0ZfMfBgz45dnEIY1D9MGv+m8Q5Bfig5U
 k2hSldqeCb1HYbivoHKNWQDno18AfjKWNlowGxBSKIja7G1hZACDw9prztLppQWy5crR
 xNLhfgdCyqK6hP/zMFV7xwvXIqTPJoXuNX39Yjh3/hk37pCDjivBNuWDcKljtrLxdyNI
 MH8fdOjzRthwzN0c01i8HLYY1duLqqN9pY9aI7W3C+i7DIVPmK1e7WPIIbpg6Hr0Wdwp
 wsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hvf40VXXqsCPVGi0brARNsNARbp18VS1fRrQ6xN2glY=;
 b=ZVWX7LkhZFpqF5czs5/tSz2JZvEPRz3af1JqL/8N3G1eBGTiRAxE5jlHLrhKjSocJn
 qoE+HaAo+nylr8zIXH+9+4gzX2zKCbXJ9zBltl5keb49cJUQx9RYaYNAfOWhdyjtOcdI
 5yqgse5gQbOcqbRbZXo3eumdlNRN7zsJHfDA9fA24fnCVfhumRZxGKwgHmE6/SRgUX8r
 LcVhthDEijTH8BqEKaEfEHYRKA+fgp+4pLefFf7R5186DI2iCK8+1tjx8bKIkaIjoXFn
 GCL79FzLzWSwgaCPRT+wkVrwhCrBErXLmsOMFVNPrzleH8HjhIGe3a9la/QX6TLuL31H
 ktdg==
X-Gm-Message-State: AOAM533ArdzFHW5Jd+aEP6iOFpbSr6O86osm/Rt3HfzlsgsoGhB2yMHe
 f20ILpogyAuhTuvnrAGUt5Q=
X-Google-Smtp-Source: ABdhPJycIdBusQpQLW4EZbTiP8NuwXqRAO7/O0/9QK6C0yeudoQfB8QIWOEnCiP6LV+ZGlFyqP2c4A==
X-Received: by 2002:a63:2cc4:: with SMTP id s187mr3757396pgs.233.1624452417865; 
 Wed, 23 Jun 2021 05:46:57 -0700 (PDT)
Received: from [192.168.1.153] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id h18sm23144634pgl.87.2021.06.23.05.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 05:46:57 -0700 (PDT)
Subject: [PATCH 1/1] config: Enable jh7100 SoC
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <82328d90-2769-6bd0-a28e-b501fba63d76@gmail.com>
Date: Wed, 23 Jun 2021 21:46:54 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_054658_795638_4864190F 
X-CRM114-Status: UNSURE (   7.67  )
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


Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/configs/defconfig | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 1f2be234b11c..e07d26d2743c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -138,3 +138,108 @@ CONFIG_DEBUG_BLOCK_EXT_DEVT=y
 CONFIG_MEMTEST=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_EFI=y
+CONFIG_FB_STARFIVE=y
+CONFIG_FB_STARFIVE_HDMI_ADV7513=y
+CONFIG_FB_STARFIVE_HDMI_TDA998X=y
+CONFIG_FB_STARFIVE_SEEED5INCH=y
+CONFIG_FB_STARFIVE_VIDEO=y
+CONFIG_HW_RANDOM_STARFIVE_VIC=y
+CONFIG_SOC_STARFIVE_VIC7100=y
+CONFIG_FPGA_GMAC_FLUSH_DDR=y
+CONFIG_MMC_DW_FLUSH_DDR=y
+CONFIG_USB_CDNS3_HOST_FLUSH_DMA=y
+CONFIG_SOC_STARFIVE_VIC7100_I2C_GPIO=y
+CONFIG_VIDEO_STARFIVE_VIN=y
+CONFIG_VIDEO_STARFIVE_VIN_SENSOR_IMX219=y
+CONFIG_VIDEO_STARFIVE_VIN_SENSOR_OV5640=y
+CONFIG_VIDEO_STARFIVE_VIN_SENSOR_SC2235=y
+CONFIG_RCU_CPU_STALL_TIMEOUT=60
+CONFIG_LOG_CPU_MAX_BUF_SHIFT=15
+CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
+CONFIG_PM=y
+CONFIG_PM_CLK=y
+CONFIG_EFI_BOOTLOADER_CONTROL=y
+CONFIG_BLK_PM=y
+CONFIG_IOSCHED_BFQ=y
+CONFIG_KSM=y
+CONFIG_CMA=y
+CONFIG_CMA_AREAS=7
+CONFIG_REGMAP_I2C=y
+CONFIG_REGMAP_IRQ=y
+CONFIG_MTD_OF_PARTS=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_PARTITIONED_MASTER=y
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_INPUT_LEDS=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250_DMA=y
+CONFIG_SERIAL_8250_DWLIB=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_SPI_MEM=y
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_DMA=y
+CONFIG_SPI_DW_MMIO=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_STARFIVE_VIC=y
+CONFIG_GPIO_TPS65086=y
+CONFIG_POWER_RESET_TPS65086=y
+CONFIG_MFD_TPS65086=y
+CONFIG_USB_HID=y
+CONFIG_USB_CDNS_SUPPORT=y
+CONFIG_USB_CDNS_HOST=y
+CONFIG_USB_CDNS3=y
+CONFIG_USB_CDNS3_HOST=y
+CONFIG_USB_ROLE_SWITCH=y
+CONFIG_SDIO_UART=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_PLTFM=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_DRV_EFI=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_ENGINE=y
+CONFIG_DMA_VIRTUAL_CHANNELS=y
+CONFIG_DMA_OF=y
+CONFIG_DW_AXI_DMAC=y
+CONFIG_DW_AXI_DMAC_STARFIVE=y
+CONFIG_COMMON_CLK_SI544=y
+CONFIG_COMMON_CLK_PWM=y
+CONFIG_SIFIVE_L2=y
+CONFIG_SIFIVE_L2_FLUSH=y
+CONFIG_SIFIVE_L2_FLUSH_START=0x80000000
+CONFIG_SIFIVE_L2_FLUSH_SIZE=0x800000000
+CONFIG_SIFIVE_L2_IRQ_DISABLE=y
+CONFIG_PWM=y
+CONFIG_PWM_SYSFS=y
+CONFIG_PWM_SIFIVE_PTC=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_PROC_KCORE=y
+CONFIG_EFIVAR_FS=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=640
+CONFIG_CMA_SIZE_SEL_MBYTES=y
+CONFIG_CMA_ALIGNMENT=8
+CONFIG_NET_VENDOR_STMICRO=y
+CONFIG_STMMAC_ETH=y
+CONFIG_STMMAC_PLATFORM=y
+CONFIG_DWMAC_GENERIC=y
+CONFIG_MICREL_PHY=y
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
