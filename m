Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64107C369D8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Ro8wiVM0kGiI3JW2PenYvBarjq0XUSfhMfwBr2DKOY8=; b=cDjrGCF4W67FAM
	Gse+S9I9QYeZSmmOOTK6tP1nj2y8HcsDaDV8gOWRH9v8VaW0CXFVF0/TfYIgVVwlOwREUhjKmwx+l
	N2VZY5FPGccpGhBxwc8Z1D/4Izq36svQ5r/pKn1BbR2x2nkHK1A3KOOWgjaRRlNca0pmUdFBEVL5e
	2rqzGX7CfAUs7iGavgNKx3J5HqfKzfgY1kwpwpAHwsSwbmALXWPQ3G42ebTB48klAxUhx3l6MHJFl
	NtGGN+S1zNZODUQ32iUbPBsaJa/VdQvsCMeR4AEmMWxI4IEQLXaMUGWZShrS3liRw9v2AiWccvh/Z
	oWeAD3Z8yfzIX/GD5YFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SmS-00000009FR1-220K;
	Wed, 23 Apr 2025 05:36:20 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SmP-00000009FQW-1mpz
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 05:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745386570; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oLMQEbTvzter91y7rik4YXUWAcUzhuxT0DfbOBHaqn2kyQn5sS220L3/aSk4TtzX5R7midvPAxYO2nxaUMM8z4WCc/7fDEpeT82RKmbEbvdJ3GqQno2HGvHzqDMAkO1y+0GRHVj9+5y6dnLHUiDz7rfukUCljRQGaES++RGtFuw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745386570; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xWm9idKxktKuRyOaM251AEIXWCz5M1GMk+daAs2zXwY=; 
	b=jLOCU6mjBCnTVbkBQ3F9tfg8vBTj4YlWpnUOUKCq69S1p2sZKxEjLdMTbokC2pIQuyOrJsFrqn5SbnKWa2nPOwa5ICIx1oGan8m1t1ygNPUHoeYILTEmPmsdp3pwcd2I3LARyQlYhHVN10+4Mz9/irC5b3/VOpyJrPiYWXZaWL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745386570;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xWm9idKxktKuRyOaM251AEIXWCz5M1GMk+daAs2zXwY=;
	b=OKATLw2cnYHHBKcW5NsCPnxOGyyBvCrwu7nBCWqXfFZ9oz3IbaqfiT8u0bs8dAjG
	2HeThX5KDlWADiZEUwgIB3mTYWcYsHGIUFFdMBBw6MF65jtYt/yePT37sUudDttTHiK
	yfnHXuOrGfZF50+Yx37SamSzZ9zP/s/NyXH9VMQg=
Received: by mx.zohomail.com with SMTPS id 1745386567771409.44652875982854;
	Tue, 22 Apr 2025 22:36:07 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Chen Wang" <unicorn_wang@outlook.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>
In-Reply-To: <MA0P287MB226271093B2CC475E80784DFFEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
Message-ID: <1838dbd48ec5bec8.2608aebcdac475bc.43d59215091781cc@Jude-Air.local>
Date: Wed, 23 Apr 2025 05:36:01 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_223617_530954_A91486BD 
X-CRM114-Status: GOOD (  22.17  )
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

Hi Chen,

Thanks for your review.

On 23/04/2025 11:21, Chen Wang wrote:
> Hi, Junhui,
> 
> 
> On 2025/4/20 1:09, Junhui Liu wrote:
>> Add support for the resets on Canaan Kendryte K230 SoC. The driver
>> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
>> clear resets.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>>
>> ---
>> The reset management module in the K230 SoC also provides reset time
>> control registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE,
>> the time period when reset is applyed/removed but the clock is stopped
>> can be set up to 15*0.25 = 3.75 us. For some RST_TYPE_HW_DONE cases, the
>> time period can be set up to 255*0.25 = 63.75 us. For RST_TYPE_FLUSH,
>> the reset bit will automatically cleared by hardware when flush done.
>>
>> Although the current reset driver does not support configuration of
>> reset time registers, delay has been added to the assert, deassert and
>> reset functions to accommodate the longest reset time.
>>
>> Besides, although some reset types have done bits, the reference manual
>> does not explicitly indicate whether the hardware removes reset or the
>> clock stop time period has passed when done bits toggle. Therefore, I
>> think it is a safer way to keep delay for reset types with done bits.
>>
>> link: https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
> Regards these notes, please move it to the beginning of source code, see 
> example: drivers/pwm/pwm-sophgo-sg2042.c
>> ---
>>   drivers/reset/Kconfig      |   9 ++
>>   drivers/reset/Makefile     |   1 +
>>   drivers/reset/reset-k230.c | 355 +++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 365 insertions(+)
>>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1aed7ba2f72819f7a 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -140,6 +140,15 @@ config RESET_K210
>>   	  Say Y if you want to control reset signals provided by this
>>   	  controller.
>>   
>> +config RESET_K230
>> +	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
>> +	depends on ARCH_CANAAN || COMPILE_TEST
>> +	depends on OF
>> +	help
>> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
>> +	  Say Y if you want to control reset signals provided by this
>> +	  controller.
>> +
>>   config RESET_LANTIQ
>>   	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>>   	default SOC_TYPE_XWAY
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804e1321b167815a4b 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>>   obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>>   obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>>   obj-$(CONFIG_RESET_K210) += reset-k210.o
>> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>>   obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
>> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426c8fa9e75aed1791
>> --- /dev/null
>> +++ b/drivers/reset/reset-k230.c
>> @@ -0,0 +1,355 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2016-2017 Linaro Ltd.
> Linaro? Are you sure?

Actually, I kept this from vendor's code.

link: https://github.com/kendryte/k230_sdk/blob/v1.9/src/little/linux/drivers/reset/canaan/reset-k230.c#L19

>> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
>> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/spinlock.h>
>> +
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
>> +	RST_TYPE_CPU0,
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
> 
> Why don't usercdev.dev to store the dev, so we can save a pointer.

Thanks for your reminder, I will store it in rcdev.dev.

> 
>> +	void __iomem			*base;
>> +	spinlock_t			lock;
>> +};
> 
> [......]
> 
> Thanks,
> 
> Chen

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
