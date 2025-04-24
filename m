Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF96C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=k2sQwDMveg2msHYx6Cigsu+dlsbuJquRZeJ9VVWivzA=; b=N16jvhUQ5ZUf1z
	7zaYdvBZVpLuRgdCFMQbvQg2GHuuN8QiWNufRBVM5z0l370TRaG29EN1r+pG8sQ4JMf7VxgVS37rm
	6ig22Hw+y2jsEJCMVSFuxbWKTve21zVvqH9cCH4AXN9rmlFgpIbUi9WonkyC3JcF6uKkpMPsK+HZw
	I/sVEAUYOg0c2pwCzgemZ1BL73Ow8stb3yWd3j4/cMBLkVR0xiw19ZnQ1JDQtALJQf78vxJnCHMxv
	htBM3ERw8YmUAlsKOOJPNAvKrya/MQxaN3jnhs0u6ezX7nKrJr0KUwSTFffxWGM7D6h7OQM1Xs4m8
	LUJq1l105ETrLWPEUA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r3V-0000000DBvs-315C;
	Thu, 24 Apr 2025 07:31:33 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r3R-0000000DBug-0ZTu
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745479885; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jZyy1raYIyF1sGVOWem4Ypw0O8wudRiDEIO5mGHCnZa2Ou8c3KcagcH1PPOfpcs6ViHttfp3YDPY3TEKEsV+re/2M9riJvcSvtGeC1N5hCcmV6CryogqX2BLRr/4+jhgZmK9vvePu3aNWIC+55mCanea+gT8dgq6DJAR3aurQUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745479885; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IIDcYhJRNcl5NI8G2yy9QcT7CkmD17UGLCVGjxUrnYc=; 
	b=SnTEKyUe67r9XoLYu93FLmMF5kwILktt5wn1ePGM/SqnUIDpcK6X6Oft7qKitwCWJl11y3mEfTzC2nToHsd1XwRuYtSha1H2bJrUa3CPWtzes8VEXK4Rg2crgbsUFcKS/w+eZ6Q7ChART+oIKkG5pFWl3uLPclXQQodHXChw4r0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745479885;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IIDcYhJRNcl5NI8G2yy9QcT7CkmD17UGLCVGjxUrnYc=;
	b=SJXyWtffopsEaMabrckT+QOY8TDEzmK6c+ROZ54THTEiksrAnSzsbQSgyNnh0T53
	orALIhvwVr1NtwGOo3qMYJI/Bv3EDPE79CEgTgApTBNNFH+3UJQkyLVJY4hGXmHsk3U
	+hJnX61bdomhX5RT2yZCrmF2RUvuHFc/QIFqShSs=
Received: by mx.zohomail.com with SMTPS id 1745479882130426.9563902759496;
	Thu, 24 Apr 2025 00:31:22 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>
In-Reply-To: <15c2be97e1b58e7be182299d27e17996b47e8414.camel@pengutronix.de>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
Message-ID: <183930b36feb1b40.9b4fd51a8b5c6c1d.5a72bde348d1c9e9@Jude-Air.local>
Date: Thu, 24 Apr 2025 07:31:17 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_003129_556690_79A7ED0D 
X-CRM114-Status: GOOD (  25.19  )
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

Hi Philipp,

Thanks for your review.

On 23/04/2025 11:43, Philipp Zabel wrote:
> On So, 2025-04-20 at 01:09 +0800, Junhui Liu wrote:
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
>> ---
>>  drivers/reset/Kconfig      |   9 ++
>>  drivers/reset/Makefile     |   1 +
>>  drivers/reset/reset-k230.c | 355 +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 365 insertions(+)
>> 
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1aed7ba2f72819f7a 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -140,6 +140,15 @@ config RESET_K210
>>  	  Say Y if you want to control reset signals provided by this
>>  	  controller.
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
>>  config RESET_LANTIQ
>>  	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>>  	default SOC_TYPE_XWAY
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804e1321b167815a4b 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>>  obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>>  obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>>  obj-$(CONFIG_RESET_K210) += reset-k210.o
>> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>>  obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>>  obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
>> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426c8fa9e75aed1791
>> --- /dev/null
>> +++ b/drivers/reset/reset-k230.c
>> @@ -0,0 +1,355 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2016-2017 Linaro Ltd.
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
>> +	void __iomem			*base;
>> +	spinlock_t			lock;
> 
> Add a comment, this locks register read-modify-write.
> 
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
> 
> The TRM calls these HISYS. Is this shortened to HS on purpose?
> 

I kept it with vendor's code, but you're right, HISYS is easier to
understand. I will update this and LS.

> [...]
> 
>> +static int k230_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	struct k230_rst *rstc = to_k230_rst(rcdev);
>> +	const struct k230_rst_map *rmap = &k230_resets[id];
>> +	u32 reg;
>> +	int ret = 0;
>> +
>> +	switch (rmap->type) {
>> +	case RST_TYPE_CPU0:
>> +		k230_rst_clear_done(rstc, id, true);
>> +		k230_rst_update(rstc, id, true, true, false);
>> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);
>> +
>> +		/*
>> +		 * The time period when reset is applied and removed but the
>> +		 * clock is stopped for RST_TYPE_CPU0 can be set up to 7.5us.
>> +		 * Delay 10us to ensure proper reset timing.
>> +		 */
>> +		udelay(10);
>> +
>> +		break;
>> +	case RST_TYPE_FLUSH:
>> +		k230_rst_update(rstc, id, true, true, false);
>> +
>> +		/* Wait flush request bit auto cleared by hardware */
>> +		ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
>> +					!(reg & rmap->reset), 10, 1000);
>> +		if (ret)
>> +			dev_err(rstc->dev, "Wait for flush done timeout\n");
>> +
>> +		break;
>> +	case RST_TYPE_HW_DONE:
>> +		k230_rst_clear_done(rstc, id, false);
>> +		k230_rst_update(rstc, id, true, false, false);
>> +		ret = k230_rst_wait_and_clear_done(rstc, id, false);
>> +
>> +		/*
>> +		 * The time period when reset is applied and removed but the
>> +		 * clock is stopped for RST_TYPE_HW_DONE can be set up to
>> +		 * 127.5us. Delay 200us to ensure proper reset timing.
>> +		 */
>> +		udelay(200);
> 
> Consider using usleep_range(), or fsleep().
> 
> regards
> Philipp

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
