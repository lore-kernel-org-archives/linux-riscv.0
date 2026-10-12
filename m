Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2029CA9ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xa3tdyhIIj3hIjpr/Sv+ZbbFWzi9PkM82R3xmxUK20Y=; b=tTCeM0S0Hz++q4
	HUDF3De0IW/qswmy/JCczNCBtNV69B8p4d+nIyKEnUKeWjMW0LJntBLWF+uzvjIzo2rVtVjHjlHVD
	tXF9jnjua3Nc0OCjQyJUOiM66Pb/sK8aAvwInLx8J3G+iPdqaSnYMv3aF5YWzRFhSsMMkPYIc/q8v
	hBCy9ohPJqsecn8AdjGAMUZ+rkTd/e9UYUBOC9esd+QMP053gwR3TdGHYo/bm/amWayuXB9BECWp0
	F1rkaCsUHh+ehRICp3hwTWlDV5Lfk2vsvChQm7yWO/XvtWHV3AEEeMCjsjSVbWl9Ipd+ZOzTXm3tl
	FiRSw1GxNDJ+qAx+OQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAf-0000000ADEE-0TUG;
	Mon, 12 Oct 2026 10:22:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAT-0000000ACyf-2s4e
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so13472225e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800524; x=1792405324; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AJYyZEBiOUM7OvSMbISuEMhl5UT5CKz97qPqv6r5uKs=;
        b=D2SYYz1IhPTsM+YvR6kqlZwSjnykb4y5Mv+PFh1ox21mL8sj7j1ykw3T5YheAbZNf8
         X3+zd7ClVg3OQwhtiZHnDVrMb6tAB6quuI39bo3Q/FpF5Bv0kcQWSv1sDs08gXKnI6gy
         HLSA89r4sq6qCEkXgA9mqBlbXgB8Oa8hF+1nrG9Zsh0uft6jC+NBYNn8Nwhog/tD7lFn
         49u7HWmp/BrDwFxA7pFUuFgC6sUEj3dln3nyLSmd4t/JkJc8zldYIVzrVheRwSKV3/t9
         XjG4urjBOdHWfPA/+OlbPzoJwFKCJhTH3C3rRZmIa4iPhWNi6gfl2jzPYBwlCURXX10P
         HCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800524; x=1792405324;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJYyZEBiOUM7OvSMbISuEMhl5UT5CKz97qPqv6r5uKs=;
        b=WH9B7eFD4/Src9nvaWI8xJhjKRL81kgcv2+bL0pkMKuPZFj3r1yCbAdPHTgUor2fUH
         SOWtjOIXb2VdKwnA29TDF8pgeQBMl+a8hIiOrDqdpoxOw//07HYJ21id/n+OHSaTwSkj
         iCV/z01Hs8DQMgn1WcUBABWBzDR89UIqprjf6JoxRgTNIY8pJsFSV7hKcyrYtbE5XrHd
         HJY5Yakum3+YVGM1rBfNv05OXUi5ga/JAfCuSXLQZcvxhnBvRqASiDO+PORf3qg1YxUf
         3vWCxc2VwacCn7IGJbFKtuh+10VoBDhsFLvjH8lwRgzTaazZi1QvnjkWvIV9ajar8T7l
         iYVQ==
X-Forwarded-Encrypted: i=1; AKwUvByr8sn3bhwwRUbG8XxQgxBVRh1vX1fZktIwFOy5eULnXlDduVqjXtnJVPysi8m4ap0jT+H94nc3TDMLJg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLwWFaNOScz5CO56xJ2JSnCBqEmgmFGeB95QyctXC9xr30Tae22
	Y3EQ+lp68myW+7jD+hb2SqS5BhPcb5jCVsRA270uOk0iW754vmh4NCRYl3+muv1CN7w=
X-Gm-Gg: AYBFou1af8x39Vq5LGXvNwBNcjxJjxr4I4/xK3QOdnhn9LLnaqXsgXLlmo3pXwjCz7Q
	lLbALPuk3Xv1TcfuoTl7a/9Rws/sIC9qYYMShmGM3Egjv0s/YHwfnkQ9Ka/9ZzPWXVJydAr5dvT
	tm1mWtJlzhf0GdDCu/qBksTSEOWsEHqcRqxgfHAm/KjKo+bQMgyN5kOFfr3fyMH+oYdWCAsCl5T
	CMQW47bhB83bqcAXbaVDfqsqOHq+orYUsX8FhxAG16mslCLcof8324hzgDGZUY6gZTm89DzR5Te
	xz2NOx0r8Rnpk4roppcXc5atqfmZdvZweIi+zswT0Css73vprZ7A3Xzwt082MjtupZMS3KDqeMh
	XxnB8dXj4c+LCuNc/NNUiJ/n4N1cp+19f5GAoRDQzSgbCXnSpdhPr1tIg3qJMvivOTJyqxrvDEq
	xfceUb21UOOntQbq6rgvvUW6R8keXLXHM4ueEbV/dF/7NWEXlJ/d6bjABpAZ0V3T6LBeI62fH8B
	6lhtvQipRpZm8B/yg==
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr165296415e9.26.1791800523761;
        Mon, 12 Oct 2026 03:22:03 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm143801505e9.3.2026.10.12.03.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:22:03 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 10/15] clk: starfive: Add StarFive JHB100
 Peripheral-0 clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-11-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-11-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.4988353309640403131.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5017; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tTAZF8a763gW6j5Lx6Y94iC7OKIfcaHRy+T2VFppwEc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuznFX6rbup/o6uqu9d9gqCAanb70c5Ja+t9j3U/n
 5LInFLXUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgIm4v2T4K+gjayPzakqr4lEd
 aSMdb5GHD+Pm7Jh923+T2fu20m37tzP8d/K+9HX1+cdPlaMOSJvuLd6/eeXc7mu2LTKnzorHNUk
 85AMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032207_779777_7ED83DBF 
X-CRM114-Status: GOOD (  25.83  )
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

> Add driver for the StarFive JHB100 Peripheral-0 clock controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-per0.c   | 617 ++++++++++++++++++
>  3 files changed, 628 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per0.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index cfaac934a8e0..b2a05bbb450f 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -73,6 +73,16 @@ config CLK_STARFIVE_JH7110_VOUT
>  	  Say yes here to support the Video-Output clock controller
>  	  on the StarFive JH7110 SoC.
>  
> +config CLK_STARFIVE_JHB100_PER0
> +	bool "StarFive JHB100 peripheral-0 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the peripheral-0 clock controller
> +	  on the StarFive JHB100 SoC.
> +
>  config CLK_STARFIVE_JHB100_SYS0
>  	bool "StarFive JHB100 system-0 clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 29cdef20575e..352717886295 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per0.c b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> new file mode 100644
> index 000000000000..ef6e6906cd2f
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> @@ -0,0 +1,617 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 Peripheral-0 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +#define JHB100_PER0CLK_NUM_CLKS			(JHB100_PER0CLK_MAIN_ICG_EN_TRNG + 1)
> +
> +/* external clocks */
> +#define JHB100_PER0CLK_OSC			(JHB100_PER0CLK_NUM_CLKS + 0)
> +#define JHB100_PER0CLK_PLL6			(JHB100_PER0CLK_NUM_CLKS + 1)
> +#define JHB100_PER0CLK_CFG_400			(JHB100_PER0CLK_NUM_CLKS + 2)
> +#define JHB100_PER0CLK_CFG_800			(JHB100_PER0CLK_NUM_CLKS + 3)
> +#define JHB100_PER0CLK_NCNOC_INIT		(JHB100_PER0CLK_NUM_CLKS + 4)
> +#define JHB100_PER0CLK_NCNOC_TARG		(JHB100_PER0CLK_NUM_CLKS + 5)
> +
> +static const char * const jhb100_per0_ext_clk[] = {
> +	"osc",
> +	"pll6",
> +	"cfg_400",
> +	"cfg_800",
> +	"ncnoc_init",
> +	"ncnoc_targ",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   What is special here is the UART*-related clocks. On the JHB100, the secure
> + *   core may consume one UART, while the AP core consumes another. Different
> + *   core boards may select different UARTs, so we usually want to keep all UART*
> + *   clocks always on to prevent the AP core from turning off the clock for the
> + *   secure core's UART.
> + *   UART0-3 are usually used by the HOST side, and there will be no driver on
> + *   the BMC side to consume these clocks. Therefore, these clocks need to be
> + *   enabled for the host to consume.

So you are forcefully enabling 14 clocks for 1 to 4 clocks that may or may not be used.
This is not how this should work. You just enable clock randomly hoping it will cover
your use case. If you are managing the clock for these secure core, it clearly shows you
need a driver for it.

> + *
> + * Regarding the CLK_IGNORE_UNUSED flag:
> + *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any driver. The flag
> + *   keeps them in their hardware default state (enabled) instead of letting
> + *   the clock framework gate them once it disables unused clocks.  If this
> + *   flag needs to be removed later, it must be ensured that these clocks will
> + *   not be disabled even if they are not consumed.

Why ? you are ignoring all sorts of thing in there like i3c. If the i3c bus is unused,
the clock should be disabled. If it is actively used, why don't you have a driver for it ?

Throwing CLK_IGNORE_UNUSED and CLK_IS_CRITICAL at the majority of your clocks is not OK.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
