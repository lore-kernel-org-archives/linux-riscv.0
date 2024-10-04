Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8A0CFA745
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 05:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9u4ahqMw9QOfUGvaUGNLF5vSzTEN0szVufoxro10kdc=; b=hx/5gEVc1jVa+G
	Z0o8f1YCdTxo8BZKwk4+0v7ivfB8OmeB9TLRfQWrO98hBpPNAr9BqwNxLgu1h2rr2llxSRlE+PhS0
	AnaP/IPXKwlx2IQru/CLqFZaeZWhdhe/iQv1dWYV20CCc609ZQW9q66gH4Xg6hylSJa/vfOGNcp2S
	gANKnRgfpK/x50MSWHM+vVUUfA+213ZwDup1YEG24R7zh8VuHVj2Fqg47yNX7bWTEmgg1o7SzYUqb
	+87zJcjKi7Hvjii4HeQvadHsH7xZ1gle+3Kp6KgIxQLrbj186DaWft4QEdZdTQPmwEzjEc75tLQlL
	3g3duN31sFQud1aHpOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swadT-0000000B2zp-282g;
	Fri, 04 Oct 2024 05:13:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swadQ-0000000B2zK-1vIz
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 05:13:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e07d85e956so1463347a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728018827; x=1728623627; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vK/IWld7dqP/kgyhCfCo0J0orcE4Di+Uo41suj8vGiw=;
        b=glne4AiG6xveMScVhvsCiTHTsHLcpZdxyGb4fDExD9peqeZC0H+MspJx0LTbbu6eBr
         TIx7P3SSyow25Q7XX8C+D5N/SSJiri8UZXYYAyGhEsg2ROM7r8khNjKGA3IcIz/v0iNl
         g29ICp6ydxYo5ahhkndBXBohBlH+FqDUDeSa7Wo1UjlsUk2Y4qvL+CGnfOqSL42fEWHZ
         qlj2nQ5qIJNZdN4vYHhIpM8RIralCy7ijxbReszui+edF1gNyhkKwSUsh1wdRIiz0F7z
         ypR8tqi7asPfLs7c7gEKZpFm403wUtV4OniWnDwAAY4qSEYXdNVxqx5ap1nobWj1lMDx
         pY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728018827; x=1728623627;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vK/IWld7dqP/kgyhCfCo0J0orcE4Di+Uo41suj8vGiw=;
        b=DfaEZId6ANoV+jg5MrYNd5l5p5d9s4gh8ytEBZib8D8iBIAGX3hhrCWcNSCuefno93
         KDEVa4J2crMphrrzbNKmHDx74fdlEE7EmwFQ9O0Uc/ft6rkJe4uqvmVgUxqVqzftT5g4
         ZG/vi38X2Pd+pO5xQPP5KywwzT9DfcEB2Mdr8EeSsCORL0T9DjDT9hQ/1J4rQ76JptRg
         5budWbA7NMQp0PZQhMaw+zqTEgJya1p5deUfipGZ3+hYcVwBOqe35Lkr39O75s4S/8t8
         fAwMS+hBR95g+uIHWzYCWO4oYPcia7mfktMRT8PgU2+wiROxdaLcFQXkOUKnc5GHyIm1
         nOFg==
X-Forwarded-Encrypted: i=1; AJvYcCXiNFfi4ZTm7gYCE+apVnnDVGyOo/KgjMSUnbeL0QZLO6glrBDYo8+lKkbJ8xyTA4mPKTZGUJeSMzQVoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYxD/HczWL/wgbmiZMa7jwv6TWy6zlQV9d+LpChOalxFT98pfT
	3h6jaBfNCd/QrGlV7zOtd4kwB1nvoqYizGZsT+DMCA8Zws1EHjzKkx5nzbXo
X-Google-Smtp-Source: AGHT+IGD+MHA+RPdnrDEpdj0jtBxmDanwP3eaB8ldtEsMA6NGjjAGkL0rbHq8ryZtaHFBVTTI4b7ZQ==
X-Received: by 2002:a17:90a:4bc6:b0:2d3:ca3f:7f2a with SMTP id 98e67ed59e1d1-2e1e62674damr1525156a91.22.1728018826220;
        Thu, 03 Oct 2024 22:13:46 -0700 (PDT)
Received: from [127.0.0.1] ([154.19.47.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85c13eesm531560a91.11.2024.10.03.22.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 22:13:45 -0700 (PDT)
Message-ID: <d9036e26-0e08-4838-b57f-fde6f743a4d1@gmail.com>
Date: Fri, 4 Oct 2024 13:12:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Junhui Liu <liujh2818@gmail.com>
Subject: Re: [PATCH 2/2] reset: canaan: Add reset driver for Kendryte K230
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhui Liu <liujh2818@outlook.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com>
 <20240924-k230-reset-v1-2-d0cdc11989eb@outlook.com>
 <e0a8da323575ec46dff2df5f804513ea64f11ca8.camel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <e0a8da323575ec46dff2df5f804513ea64f11ca8.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_221348_551350_E941576D 
X-CRM114-Status: GOOD (  24.01  )
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

Hi, Philipp:
Thanks for your review!

On 2024/9/24 17:17, Philipp Zabel wrote:
> On Di, 2024-09-24 at 14:00 +0800, Junhui Liu wrote:
>> From: Junhui Liu<liujh2818@outlook.com>
>>
>> Add support for the resets on Canaan Kendryte K230 SoC.
>>
>> Signed-off-by: Junhui Liu<liujh2818@outlook.com>
>> ---
>>   drivers/reset/Kconfig      |   8 ++
>>   drivers/reset/Makefile     |   1 +
>>   drivers/reset/reset-k230.c | 321 +++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 330 insertions(+)
>>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 5484a65f66b95374e25bac31f539a2dd92ae007e..716c676e9b934dd3d2b1ee28f2c43ef38daf7dba 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -133,6 +133,14 @@ config RESET_K210
>>   	  Say Y if you want to control reset signals provided by this
>>   	  controller.
>>   
>> +config RESET_K230
>> +	bool "Reset controller driver for Canaan Kendryte K230 SoC"
>> +	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
>> +	help
>> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
>> +	  Say Y if you want to control reset signals provided by this
>> +	  controller.
>> +
>>   config RESET_LANTIQ
>>   	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>>   	default SOC_TYPE_XWAY
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 4411a2a124d7de29808fcf36d0829393fc79af72..f02c35607ba88947e868d33ead70e9ec91a85636 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -18,6 +18,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>>   obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>>   obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>>   obj-$(CONFIG_RESET_K210) += reset-k210.o
>> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>>   obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
>> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..9c693e1cee35dd725bebb6916002f846e8b4003b
>> --- /dev/null
>> +++ b/drivers/reset/reset-k230.c
>> @@ -0,0 +1,321 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2016-2017 Linaro Ltd.
>> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
>> + * Copyright (C) 2024 Junhui Liu<liujh2818@outlook.com>
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/delay.h>
>> +#include <dt-bindings/reset/canaan,k230-rst.h>
>> +
>> +/**
>> + * enum k230_rst_type - K230 reset types
>> + * @RST_TYPE_CPU0: Reset type for CPU0
>> + *	Automatically clears, has write enable and done bit, active high
>> + * @RST_TYPE_CPU1: Reset type for CPU1
>> + *	Manually clears, has write enable and done bit, active high
>> + * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
>> + *	Automatically clears, has write enable, no done bit, active high
>> + * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
>> + *	Automatically clears, no write enable, has done bit, active high
>> + * @RST_TYPE_SW_DONE: Reset type for software manual clear
>> + *	Manually clears, no write enable and done bit,
>> + *	active high if ID is RST_SPI2AXI, otherwise active low
>> + */
>> +enum k230_rst_type {
>> +	RST_TYPE_CPU0 = 0,
>> +	RST_TYPE_CPU1,
>> +	RST_TYPE_FLUSH,
>> +	RST_TYPE_HW_DONE,
>> +	RST_TYPE_SW_DONE,
>> +};
>> +
>> +struct k230_rst_map {
>> +	u32			offset;
>> +	enum k230_rst_type	type;
>> +	u32			done;
>> +	u32			reset;
>> +};
>> +
>> +struct k230_rst {
>> +	struct reset_controller_dev	rcdev;
>> +	struct device			*dev;
>> +	void __iomem			*base;
>> +	spinlock_t			lock;
>> +};
>> +
>> +static const struct k230_rst_map k230_resets[] = {
>> +	[RST_CPU0]		= { 0x4,  RST_TYPE_CPU0,    BIT(12), BIT(0) },
>> +	[RST_CPU1]		= { 0xc,  RST_TYPE_CPU1,    BIT(12), BIT(0) },
>> +	[RST_CPU0_FLUSH]	= { 0x4,  RST_TYPE_FLUSH,   0,       BIT(4) },
>> +	[RST_CPU1_FLUSH]	= { 0xc,  RST_TYPE_FLUSH,   0,       BIT(4) },
>> +	[RST_AI]		= { 0x14, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_VPU]		= { 0x1c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_HS]		= { 0x2c, RST_TYPE_HW_DONE, BIT(4),  BIT(0) },
>> +	[RST_HS_AHB]		= { 0x2c, RST_TYPE_HW_DONE, BIT(5),  BIT(1) },
>> +	[RST_SDIO0]		= { 0x34, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
>> +	[RST_SDIO1]		= { 0x34, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
>> +	[RST_SDIO_AXI]		= { 0x34, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
>> +	[RST_USB0]		= { 0x3c, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
>> +	[RST_USB1]		= { 0x3c, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
>> +	[RST_USB0_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(30), BIT(0) },
>> +	[RST_USB1_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(31), BIT(1) },
>> +	[RST_SPI0]		= { 0x44, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
>> +	[RST_SPI1]		= { 0x44, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
>> +	[RST_SPI2]		= { 0x44, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
>> +	[RST_SEC]		= { 0x4c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_PDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
>> +	[RST_SDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
>> +	[RST_DECOMPRESS]	= { 0x5c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_SRAM]		= { 0x64, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
>> +	[RST_SHRM_AXIM]		= { 0x64, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
>> +	[RST_SHRM_AXIS]		= { 0x64, RST_TYPE_HW_DONE, BIT(31), BIT(3) },
>> +	[RST_NONAI2D]		= { 0x6c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_MCTL]		= { 0x74, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_ISP]		= { 0x80, RST_TYPE_HW_DONE, BIT(29), BIT(6) },
>> +	[RST_ISP_DW]		= { 0x80, RST_TYPE_HW_DONE, BIT(28), BIT(5) },
>> +	[RST_DPU]		= { 0x88, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_DISP]		= { 0x90, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_GPU]		= { 0x98, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_AUDIO]		= { 0xa4, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
>> +	[RST_TIMER0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(0) },
>> +	[RST_TIMER1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(1) },
>> +	[RST_TIMER2]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(2) },
>> +	[RST_TIMER3]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(3) },
>> +	[RST_TIMER4]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(4) },
>> +	[RST_TIMER5]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(5) },
>> +	[RST_TIMER_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(6) },
>> +	[RST_HDI]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(7) },
>> +	[RST_WDT0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(12) },
>> +	[RST_WDT1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(13) },
>> +	[RST_WDT0_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(14) },
>> +	[RST_WDT1_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(15) },
>> +	[RST_TS_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(16) },
>> +	[RST_MAILBOX]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(17) },
>> +	[RST_STC]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(18) },
>> +	[RST_PMU]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(19) },
>> +	[RST_LS_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(0) },
>> +	[RST_UART0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(1) },
>> +	[RST_UART1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(2) },
>> +	[RST_UART2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(3) },
>> +	[RST_UART3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(4) },
>> +	[RST_UART4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(5) },
>> +	[RST_I2C0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(6) },
>> +	[RST_I2C1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(7) },
>> +	[RST_I2C2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(8) },
>> +	[RST_I2C3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(9) },
>> +	[RST_I2C4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(10) },
>> +	[RST_JAMLINK0_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(11) },
>> +	[RST_JAMLINK1_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(12) },
>> +	[RST_JAMLINK2_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(13) },
>> +	[RST_JAMLINK3_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(14) },
>> +	[RST_CODEC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(17) },
>> +	[RST_GPIO_DB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(18) },
>> +	[RST_GPIO_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(19) },
>> +	[RST_ADC]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(20) },
>> +	[RST_ADC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(21) },
>> +	[RST_PWM_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(22) },
>> +	[RST_SHRM_APB]		= { 0x64, RST_TYPE_SW_DONE, 0,       BIT(1) },
>> +	[RST_CSI0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(0) },
>> +	[RST_CSI1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(1) },
>> +	[RST_CSI2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(2) },
>> +	[RST_CSI_DPHY]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(3) },
>> +	[RST_ISP_AHB]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(4) },
>> +	[RST_M0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(7) },
>> +	[RST_M1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(8) },
>> +	[RST_M2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(9) },
>> +	[RST_SPI2AXI]		= { 0xa8, RST_TYPE_SW_DONE, 0,       BIT(0) }
>> +};
>> +
>> +#define to_k230_rst(p) container_of((p), struct k230_rst, rcdev)
> Consider turning this into an inline function.
>
>> +static void k230_rst_clear_done(struct k230_rst *rstc, unsigned long id,
>> +				bool write_en)
>> +{
>> +	const struct k230_rst_map *rmap = &k230_resets[id];
>> +	unsigned long flags;
>> +	u32 reg;
>> +
>> +	spin_lock_irqsave(&rstc->lock, flags);
> You could use guard(spinlock_irqsave)(&rstc->lock) to save a few lines.

Thanks for letting me know about this method, I will try to add it.

>> +	reg = readl(rstc->base + rmap->offset);
>> +
>> +	/* write 1 to clear */
>> +	reg |= rmap->done;
>> +	if (write_en)
>> +		reg |= rmap->done << 16;
>> +
>> +	writel(reg, rstc->base + rmap->offset);
>> +
>> +	spin_unlock_irqrestore(&rstc->lock, flags);
>> +}
>> +
>> +static int k230_rst_wait_and_clear_done(struct k230_rst *rstc, unsigned long id,
>> +					bool write_en)
>> +{
>> +	const struct k230_rst_map *rmap = &k230_resets[id];
>> +	u32 reg;
>> +	int ret;
>> +
>> +	ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
>> +				 reg & rmap->done, 10, 1000);
>> +	if (ret) {
>> +		dev_err(rstc->dev, "Wait for reset done timeout\n");
>> +		return ret;
>> +	}
>> +
>> +	k230_rst_clear_done(rstc, id, write_en);
>> +
>> +	return 0;
>> +}
>> +
>> +static void k230_rst_update(struct k230_rst *rstc, unsigned long id,
>> +			    bool assert, bool write_en, bool active_low)
>> +{
>> +	const struct k230_rst_map *rmap = &k230_resets[id];
>> +	unsigned long flags;
>> +	u32 reg;
>> +
>> +	spin_lock_irqsave(&rstc->lock, flags);
> Same as above, maybe use guard(spinlock_irqsave)(&rstc->lock).
>
>> +
>> +	reg = readl(rstc->base + rmap->offset);
>> +
>> +	if (assert ^ active_low)
>> +		reg |= rmap->reset;
>> +	else
>> +		reg &= ~rmap->reset;
>> +
>> +	if (write_en)
>> +		reg |= rmap->reset << 16;
>> +
>> +	writel(reg, rstc->base + rmap->offset);
>> +
>> +	spin_unlock_irqrestore(&rstc->lock, flags);
>> +}
>> +
>> +static int k230_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	struct k230_rst *rstc = to_k230_rst(rcdev);
>> +	const struct k230_rst_map *rmap = &k230_resets[id];
>> +	int ret;
>> +
>> +	switch (rmap->type) {
>> +	case RST_TYPE_CPU0:
> I'd expect this and the other self-clearing resets to return -ENOTSUPP,
> as reset_control_assert() most likely won't return with the reset line
> still asserted.
>
>

Okay, I will move the self-clearing resets into k230_rst_reset(), and
let them return -ENOTSUPP in assert() and deassert().

>> +		k230_rst_clear_done(rstc, id, true);
>> +		k230_rst_update(rstc, id, true, true, false);
>> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);
>> +		break;
> This should be implemented in k230_rst_reset().
>
>> +	case RST_TYPE_CPU1:
>> +	case RST_TYPE_FLUSH:
>> +		k230_rst_update(rstc, id, true, true, false);
>> +		break;
>> +	case RST_TYPE_HW_DONE:
>> +		k230_rst_clear_done(rstc, id, false);
>> +		k230_rst_update(rstc, id, true, false, false);
>> +		ret = k230_rst_wait_and_clear_done(rstc, id, false);
> Same for RST_TYPE_FLUSH and RST_TYPE_HW_DONE.
>
>> +		break;
>> +	case RST_TYPE_SW_DONE:
>> +		k230_rst_update(rstc, id, true, false,
>> +				id == RST_SPI2AXI ? false : true);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int k230_rst_deassert(struct reset_controller_dev *rcdev,
>> +			     unsigned long id)
>> +{
>> +	struct k230_rst *rstc = to_k230_rst(rcdev);
>> +	int ret;
> Here ret should be initialized to 0.
>
>> +
>> +	switch (k230_resets[id].type) {
>> +	case RST_TYPE_CPU0:
>> +		break;
>> +	case RST_TYPE_CPU1:
>> +		k230_rst_update(rstc, id, false, true, false);
>> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);
> This looks odd, but maybe that's how the hardware works. To be sure,
> you are waiting for the done bit *after* manually deasserting the
> reset, on purpose?


Even though this is a manual clear reset, it also has the done bit to
indicate the completion of the reset process (in this case for the
deassert operation). If it's odd here, I will move it to k230_rst_reset().

>> +		break;
>> +	case RST_TYPE_FLUSH:
>> +	case RST_TYPE_HW_DONE:
>> +		break;
>> +	case RST_TYPE_SW_DONE:
>> +		k230_rst_update(rstc, id, false, false,
>> +				id == RST_SPI2AXI ? false : true);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return ret;
> Currently this returns an uninitialized value for the self-clearing
> resets (RST_TYPE_CPU0, RST_TYPE_FLUSH, and RST_TYPE_HW_DONE).
>
>> +}
>> +
>> +static int k230_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	int ret;
>> +
>> +	ret = k230_rst_assert(rcdev, id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	udelay(10);
> Is this delay enough for all consumers?

Thanks for your reminder. I am still confirming this issue
with the vendor and I will update it in the next version.

> Is this delay needed for the resets that wait for the done bit after
> assertion (RST_TYPE_CPU0 and RST_TYPE_HW_DONE)?
>
I will remove the delay for self-clearing reset.

>> +
>> +	return k230_rst_deassert(rcdev, id);
>> +}
>> +
>> +static const struct reset_control_ops k230_rst_ops = {
>> +	.reset		= k230_rst_reset,
>> +	.assert		= k230_rst_assert,
>> +	.deassert	= k230_rst_deassert,
>> +};
>> +
>> +static int k230_rst_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct k230_rst *rstc;
>> +
>> +	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
>> +	if (!rstc)
>> +		return -ENOMEM;
>> +
>> +	rstc->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(rstc->base))
>> +		return PTR_ERR(rstc->base);
>> +
>> +	spin_lock_init(&rstc->lock);
>> +
>> +	rstc->dev		= dev;
>> +	rstc->rcdev.owner	= THIS_MODULE;
>> +	rstc->rcdev.ops		= &k230_rst_ops;
>> +	rstc->rcdev.nr_resets	= ARRAY_SIZE(k230_resets);
>> +	rstc->rcdev.of_node	= dev->of_node;
>> +
>> +	return devm_reset_controller_register(dev, &rstc->rcdev);
>> +}
>> +
>> +static const struct of_device_id k230_rst_match[] = {
>> +	{ .compatible = "canaan,k230-rst", },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, k230_rst_match);
>> +
>> +static struct platform_driver k230_rst_driver = {
>> +	.probe = k230_rst_probe,
>> +	.driver = {
>> +		.name = "k230-rst",
>> +		.of_match_table = k230_rst_match,
>> +	}
>> +};
>> +module_platform_driver(k230_rst_driver);
>> +
>> +MODULE_AUTHOR("Junhui Liu<liujh2818@outlook.com>");
>> +MODULE_DESCRIPTION("Canaan K230 reset driver");
>> +MODULE_LICENSE("GPL v2");
> regards
> Philipp

BR,
Junhui


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
