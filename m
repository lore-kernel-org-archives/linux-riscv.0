Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E62DD46605
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2PM1ocICjEIm8WvwLE7F3ep07OP34xF3cKY0mV7VYE=; b=QjJAy5dJilCVsu
	Db23jzFuUPspDcJ09SqfjAEW40vOH5eu4r76MNdvi8LKorccs9WaJT4QaizpBF3mC4fKXBrVpA/5G
	rx+dYBcQTkfS3dZkaqLTVGrMusJ/fCiY0IhcYGnvYVhHwx7LC+H2Vybo1SVTXSLwrzD8vyRcXgGqq
	oTSp5umtngOAWSCN/a16sZM9OE/6BTyjDe44nLQ9vrs7CEoC2KRLrQh+3/9etAHyPbT/RFaX1eTHp
	tBO+BA1AckML7cFh6JUKgK3O5j7cg6SGlpOVfHCXAtYeyXdGjETPLJSsI77q+OaxScPr+vYAMn6Jb
	iawsaTHIoZHJM0vSfsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR8D-0000000Cqt7-3Nnm;
	Thu, 15 Jan 2026 17:27:37 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR8B-0000000CqsE-0I9a
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 17:27:36 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8c6a508a595so37906385a.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 09:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768498054; x=1769102854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lJbb1/AuICIQQxSKfoL5lcNlR+6CdahEmuyJyksrzs=;
        b=tCqPKOctAWbLXQTbt5LVXJl/At9iHwb2bNytNoJD9Znx2wptD0zHeV3k43NmYkGaYm
         EGqe+skZ0a5hYUrJT/9LxLMJhoJZmbwwMax7LGk94PWFcm6qspYPaF9Dw4FY54u1Q3jF
         QHyxkfSlF0LWiPmruaBZalacyKyKuoq3GS09zj9OLIl5q4TEH9UiMi2NIDzIsk7G3XPv
         z9e6nC9qmqfCf0bmJcAFrif/cu8zUPTHaBzrDB262HwKqsJY6zJqO6IlQvugmv7PdAkL
         P0QM8ANMsIJ02r9tGTHe03qVTzk0VNyJ6qKFHaL8QOeT27bM79X0PTkUQxfIxE6+CDbN
         YU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498054; x=1769102854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lJbb1/AuICIQQxSKfoL5lcNlR+6CdahEmuyJyksrzs=;
        b=qA0wyOSiOGSzXIKDROEXOzSrqRIXWevwqq2LeGDDJSzgQ4qyidyjeQQo8u2peM9Efa
         8qSmdN7nODI3mcXF2yETGKbm9nphb2DiG4P/AChLnqCcggPFhQ+mwDnIPH78EsjMXFc5
         g756mtycDy5wIaFLZZywsxEMRQmaw3Ny5/fT5m2Mmp+9UnEhtWIlWUuWn7Z55iMWN/3A
         fLzdk0hPhugclJHGvm78FrxY07WdUq4sNJoTAqRqdNShmggCXsEWsVMrsaTn7i+cuccA
         DcNYhsDQPr2kapMZg7LFNWdnZDm/PddJvM3GpdLdkxphZ9S9VopyHcwhPPDpcjB2iNYF
         E+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3TPQmMtSaKJxYeEIGQO1DI4S0qG8p65yr3fHY8Zm/qD0W1LshRG6RkxFiXDLmvH8yGr8h4NiPo1bvgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6LbgINFgcyoIV/AqfWeEd9UyLqXEsfs5SD4Md7Esv0hSQs/K
	OPELez+0wD9ZRt5xHDyzc5ZMt+odHem2DpmoE32sOYVQU+no9hNYK/BNK7EPho21JDw=
X-Gm-Gg: AY/fxX7vNAxRJScRldO/ZdOLXZt4D/oogEpexyl1oulUmMWU0uHDmz1xQBMoxSgq09f
	tUgHGydDW7+QiEy96PGQ+N6K4NmhJ0ng7IcF29nelSZ1NZG+w0TKp8r80kVP0PhgMvAYql51Ghc
	4TiVXRoErqeq3Bcjr4Usk79CRgfdkJyQbSendeJUWVFuL8VGODciDC7e3CfdvEPJ2XAzhzzOrYj
	ny59nZhY53Kma9YJKFqvOX3FjAvz+gi4G3o+/+sfiRMjNDBJmCby0eKBWUq1SsdIKfIw5GO5SF2
	GJJz9yoSfJGN6xG0l+h+nyIEMszXJ6CNbrkt7EmFIyovRTypHB5XNp8gW9qCKgsPoz967H4dXcG
	AAphHfXGX/a9tNvS8jkEicShj7veQskmqhGJHfMlx2D97JErtd7CAJ5DGeJ+GNBN1hhNh7HE0lj
	Y0yrCz4qD2l9R6TqqHwMBOWkGgYyYWppvdsSPUmLqNCEdjrWxE0Lf5
X-Received: by 2002:a05:620a:29d3:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6a670434fmr25679585a.24.1768498053683;
        Thu, 15 Jan 2026 09:27:33 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9e5d1sm452354985a.18.2026.01.15.09.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:27:33 -0800 (PST)
Message-ID: <577008ed-0a9f-4870-8326-5660c9b2b579@riscstar.com>
Date: Thu, 15 Jan 2026 11:27:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] reset: spacemit: Add SpacemiT K3 reset driver
To: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Haylen Chu <heylenay@4d2.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-4-457df235efe9@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-4-457df235efe9@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_092735_190477_8A9D633F 
X-CRM114-Status: GOOD (  20.54  )
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

On 1/8/26 8:22 AM, Guodong Xu wrote:
> Add support for the SpacemiT K3 SoC reset controller. The K3 reset
> driver reuses the common reset controller code and provides K3-specific
> reset data for devices managed by the following units:
> 
>   - MPMU (Main Power Management Unit)
>   - APBC (APB clock unit)
>   - APMU (Application Subsystem Power Management Unit)
>   - DCIU (DMA Control and Interface Unit)
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

This basically does the same thing for K3 as is now
done for K1.  Although the documentation defining
them might be available, I did not review the list
of resets you define (which I might sometimes do).
So I'll just give you an "ack".  However this does
look good to me.

Acked-by: Alex Elder <elder@riscstar.com>

> ---
> v2: No change.
> ---
>   drivers/reset/spacemit/Kconfig             |  11 ++
>   drivers/reset/spacemit/Makefile            |   1 +
>   drivers/reset/spacemit/reset-spacemit-k3.c | 233 +++++++++++++++++++++++++++++
>   3 files changed, 245 insertions(+)
> 
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> index 56a4858b30e136296e1f9c85b7b13ccee91fe7b4..545d6b41c6cafe00bb25120bd0936e6cf83713e9 100644
> --- a/drivers/reset/spacemit/Kconfig
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -22,4 +22,15 @@ config RESET_SPACEMIT_K1
>   	  unit (CCU) driver to provide reset control functionality
>   	  for various peripherals and subsystems in the SoC.
>   
> +config RESET_SPACEMIT_K3
> +	tristate "Support for SpacemiT K3 SoC"
> +	depends on SPACEMIT_K3_CCU
> +	select RESET_SPACEMIT_COMMON
> +	default SPACEMIT_K3_CCU
> +	help
> +	  Support for reset controller in SpacemiT K3 SoC.
> +	  This driver works with the SpacemiT K3 clock controller
> +	  unit (CCU) driver to provide reset control functionality
> +	  for various peripherals and subsystems in the SoC.
> +
>   endmenu
> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> index fecda9f211b24a54707b3f425b9325be1f2f7738..be2daa18315279943051c7368611344fdf16726b 100644
> --- a/drivers/reset/spacemit/Makefile
> +++ b/drivers/reset/spacemit/Makefile
> @@ -2,4 +2,5 @@
>   obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
>   
>   obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
> +obj-$(CONFIG_RESET_SPACEMIT_K3)		+= reset-spacemit-k3.o
>   
> diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e9e32e4c1ba562dd72ccfdd5a529f7f1e20222c5
> --- /dev/null
> +++ b/drivers/reset/spacemit/reset-spacemit-k3.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* SpacemiT K3 reset controller driver */
> +
> +#include <linux/module.h>
> +
> +#include <dt-bindings/reset/spacemit,k3-resets.h>
> +#include <soc/spacemit/k3-syscon.h>
> +
> +#include "reset-spacemit-common.h"
> +
> +static const struct ccu_reset_data k3_mpmu_resets[] = {
> +	[RESET_MPMU_WDT]	= RESET_DATA(MPMU_WDTPCR,	BIT(2), 0),
> +	[RESET_MPMU_RIPC]	= RESET_DATA(MPMU_RIPCCR,	BIT(2), 0),
> +};
> +
> +static const struct ccu_reset_controller_data k3_mpmu_reset_data = {
> +	.reset_data	= k3_mpmu_resets,
> +	.count		= ARRAY_SIZE(k3_mpmu_resets),
> +};
> +
> +static const struct ccu_reset_data k3_apbc_resets[] = {
> +	[RESET_APBC_UART0]	= RESET_DATA(APBC_UART0_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_UART10]	= RESET_DATA(APBC_UART10_CLK_RST,	BIT(2),	0),
> +	[RESET_APBC_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_SPI0]	= RESET_DATA(APBC_SSP0_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_SPI1]	= RESET_DATA(APBC_SSP1_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_SPI3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS0]	= RESET_DATA(APBC_TIMERS0_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS3]	= RESET_DATA(APBC_TIMERS3_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS4]	= RESET_DATA(APBC_TIMERS4_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS5]	= RESET_DATA(APBC_TIMERS5_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS6]	= RESET_DATA(APBC_TIMERS6_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_TIMERS7]	= RESET_DATA(APBC_TIMERS7_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_I2S0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_I2S1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_I2S2]	= RESET_DATA(APBC_SSPA2_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_I2S3]	= RESET_DATA(APBC_SSPA3_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_I2S4]	= RESET_DATA(APBC_SSPA4_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_I2S5]	= RESET_DATA(APBC_SSPA5_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_IR0]	= RESET_DATA(APBC_IR0_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_IR1]	= RESET_DATA(APBC_IR1_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
> +	[RESET_IPC_AP2AUD]	= RESET_DATA(APBC_IPC_AP2AUD_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_CAN1]	= RESET_DATA(APBC_CAN1_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_CAN2]	= RESET_DATA(APBC_CAN2_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_CAN3]	= RESET_DATA(APBC_CAN3_CLK_RST,		BIT(2), 0),
> +	[RESET_APBC_CAN4]	= RESET_DATA(APBC_CAN4_CLK_RST,		BIT(2), 0),
> +};
> +
> +static const struct ccu_reset_controller_data k3_apbc_reset_data = {
> +	.reset_data	= k3_apbc_resets,
> +	.count		= ARRAY_SIZE(k3_apbc_resets),
> +};
> +
> +static const struct ccu_reset_data k3_apmu_resets[] = {
> +	[RESET_APMU_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_CCIC2PHY]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
> +	[RESET_APMU_CCIC3PHY]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
> +	[RESET_APMU_ISP_CIBUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,		0, BIT(16)),
> +	[RESET_APMU_DSI_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
> +	[RESET_APMU_LCD]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
> +	[RESET_APMU_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
> +	[RESET_APMU_LCD_MCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
> +	[RESET_APMU_LCD_DSCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(15)),
> +	[RESET_APMU_SC2_HCLK]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_CCIC1_PHY]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
> +	[RESET_APMU_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_USB2]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> +				BIT(1)|BIT(2)|BIT(3)),
> +	[RESET_APMU_USB3_PORTA]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> +				BIT(5)|BIT(6)|BIT(7)),
> +	[RESET_APMU_USB3_PORTB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> +				BIT(9)|BIT(10)|BIT(11)),
> +	[RESET_APMU_USB3_PORTC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> +				BIT(13)|BIT(14)|BIT(15)),
> +	[RESET_APMU_USB3_PORTD]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> +				BIT(17)|BIT(18)|BIT(19)),
> +	[RESET_APMU_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_QSPI_BUS]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_AES_WTM]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
> +	[RESET_APMU_MCB_DCLK]	= RESET_DATA(APMU_MCB_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_MCB_ACLK]	= RESET_DATA(APMU_MCB_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_DTC]	= RESET_DATA(APMU_DTC_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_MC]		= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
> +	[RESET_APMU_CPU0_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(0), 0),
> +	[RESET_APMU_CPU0_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(1), 0),
> +	[RESET_APMU_CPU1_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(3), 0),
> +	[RESET_APMU_CPU1_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(4), 0),
> +	[RESET_APMU_CPU2_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(6), 0),
> +	[RESET_APMU_CPU2_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(7), 0),
> +	[RESET_APMU_CPU3_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(9), 0),
> +	[RESET_APMU_CPU3_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(10), 0),
> +	[RESET_APMU_C0_MPSUB_SW]	= RESET_DATA(APMU_PMU_CC2_AP,	BIT(12), 0),
> +	[RESET_APMU_CPU4_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(16), 0),
> +	[RESET_APMU_CPU4_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(17), 0),
> +	[RESET_APMU_CPU5_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(19), 0),
> +	[RESET_APMU_CPU5_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(20), 0),
> +	[RESET_APMU_CPU6_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(22), 0),
> +	[RESET_APMU_CPU6_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(23), 0),
> +	[RESET_APMU_CPU7_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(25), 0),
> +	[RESET_APMU_CPU7_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(26), 0),
> +	[RESET_APMU_C1_MPSUB_SW]	= RESET_DATA(APMU_PMU_CC2_AP,	BIT(28), 0),
> +	[RESET_APMU_MPSUB_DBG]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(29), 0),
> +	[RESET_APMU_UCIE]	= RESET_DATA(APMU_UCIE_CTRL,
> +				BIT(1) | BIT(2) | BIT(3), 0),
> +	[RESET_APMU_RCPU]	= RESET_DATA(APMU_RCPU_CLK_RES_CTRL,	0,
> +				BIT(3) | BIT(2) | BIT(0)),
> +	[RESET_APMU_DSI4LN2_ESCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(3)),
> +	[RESET_APMU_DSI4LN2_LCD_SW]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(4)),
> +	[RESET_APMU_DSI4LN2_LCD_MCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL4,	0, BIT(9)),
> +	[RESET_APMU_DSI4LN2_LCD_DSCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL4,	0, BIT(15)),
> +	[RESET_APMU_DSI4LN2_DPU_ACLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL5,	0, BIT(0)),
> +	[RESET_APMU_DPU_ACLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL5,	0, BIT(15)),
> +	[RESET_APMU_UFS_ACLK]	= RESET_DATA(APMU_UFS_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_EDP0]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(0)),
> +	[RESET_APMU_EDP1]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(16)),
> +	[RESET_APMU_PCIE_PORTA]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0,
> +				BIT(5) | BIT(4) | BIT(3)),
> +	[RESET_APMU_PCIE_PORTB]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0,
> +				BIT(5) | BIT(4) | BIT(3)),
> +	[RESET_APMU_PCIE_PORTC]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0,
> +				BIT(5) | BIT(4) | BIT(3)),
> +	[RESET_APMU_PCIE_PORTD]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0,
> +				BIT(5) | BIT(4) | BIT(3)),
> +	[RESET_APMU_PCIE_PORTE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0,
> +				BIT(5) | BIT(4) | BIT(3)),
> +	[RESET_APMU_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_EMAC2]	= RESET_DATA(APMU_EMAC2_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_ESPI_MCLK]	= RESET_DATA(APMU_ESPI_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_APMU_ESPI_SCLK]	= RESET_DATA(APMU_ESPI_CLK_RES_CTRL,	0, BIT(2)),
> +};
> +
> +static const struct ccu_reset_controller_data k3_apmu_reset_data = {
> +	.reset_data	= k3_apmu_resets,
> +	.count		= ARRAY_SIZE(k3_apmu_resets),
> +};
> +
> +static const struct ccu_reset_data k3_dciu_resets[] = {
> +	[RESET_DCIU_HDMA]	= RESET_DATA(DCIU_DMASYS_RSTN,		0, BIT(0)),
> +	[RESET_DCIU_DMA350]	= RESET_DATA(DCIU_DMASYS_SDMA_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_DMA350_0]	= RESET_DATA(DCIU_DMASYS_S0_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_DMA350_1]	= RESET_DATA(DCIU_DMASYS_S1_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA0]	= RESET_DATA(DCIU_DMASYS_A0_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA1]	= RESET_DATA(DCIU_DMASYS_A1_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA2]	= RESET_DATA(DCIU_DMASYS_A2_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA3]	= RESET_DATA(DCIU_DMASYS_A3_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA4]	= RESET_DATA(DCIU_DMASYS_A4_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA5]	= RESET_DATA(DCIU_DMASYS_A5_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA6]	= RESET_DATA(DCIU_DMASYS_A6_RSTN,	0, BIT(0)),
> +	[RESET_DCIU_AXIDMA7]	= RESET_DATA(DCIU_DMASYS_A7_RSTN,	0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data k3_dciu_reset_data = {
> +	.reset_data	= k3_dciu_resets,
> +	.count		= ARRAY_SIZE(k3_dciu_resets),
> +};
> +
> +#define K3_AUX_DEV_ID(_unit) \
> +	{ \
> +		.name = "spacemit_ccu.k3-" #_unit "-reset", \
> +		.driver_data = (kernel_ulong_t)&k3_ ## _unit ## _reset_data, \
> +	}
> +
> +static const struct auxiliary_device_id spacemit_k3_reset_ids[] = {
> +	K3_AUX_DEV_ID(mpmu),
> +	K3_AUX_DEV_ID(apbc),
> +	K3_AUX_DEV_ID(apmu),
> +	K3_AUX_DEV_ID(dciu),
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, spacemit_k3_reset_ids);
> +
> +static struct auxiliary_driver spacemit_k3_reset_driver = {
> +	.probe          = spacemit_reset_probe,
> +	.id_table       = spacemit_k3_reset_ids,
> +};
> +module_auxiliary_driver(spacemit_k3_reset_driver);
> +
> +MODULE_IMPORT_NS("RESET_SPACEMIT");
> +MODULE_AUTHOR("Guodong Xu <guodong@riscstar.com>");
> +MODULE_DESCRIPTION("SpacemiT K3 reset controller driver");
> +MODULE_LICENSE("GPL");
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
