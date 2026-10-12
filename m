Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02217CA9EDF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPyE2ZIjNh2DygFPC08k7YjnAgo2cR8X9oFgw8+l9BY=; b=ncto278n6/0btr
	zkq4d62l/iHWJYJwClu8emxbl8emOGe7mzeJhxhFVIUE/hBlr7Wu4xBVrUh+g1ZC9R35u37SjPncX
	+DAlUDZ0u2nb48qchdTU/ld3HzdJiV4F7xKiykld3AJykOpHT1P5zOEU20AePrCzAtFPhtYCpM/Vp
	9GkQB8uVWvmxXZwtJPqiPElcULmi3m84GF8/oWC6HhPfD4jLWffKnsvx+DWvzfU7cMPpRtMNrABj0
	yWyY9aVUCG8HWul/QZXM5v3HMQK0OS1NMgQ87BLIjMVJHuvNJGXtOPUhcKDp4qK0LF48wm2PeUsAX
	EX0dh1uWKp9FBb4mkklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAW-0000000AD2Z-00dK;
	Mon, 12 Oct 2026 10:22:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAO-0000000ACtH-07rA
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49ff680331aso13152135e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800518; x=1792405318; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fmOWbwJ0T2o334M14HILyz5Wz3Aty+XrLvb7Rkh/Kco=;
        b=FoD+pNdNYAICmbQBqnNw2PwKjkumF7G11J1ssSprkalTJ6O8d/cc8rq646jnleyNzM
         pq5hmg08twop5qT1OHVqjSGlvhzDRIJ2xUUx5CgR/I6FowdxAE6qKcxob3JzDObx8yuZ
         KUdY/ez1h0LQ73cAne4jdjl3h1GK4ZoCVYNd0bhajG8925u5M1gywARIUE5BjRgWOqgB
         U3H7qBLA6xuhMn3R5gUQTxfBLdWxcAgPXl3xPHU968wt3DiI41azqPmkfmm0F6cLnbli
         PTc5zwI2MKl4Tr0OD9VqfQBu8RXmJo+2iD8kNmgG4To7xHONIGvy8g4YewWkxNOeWyOO
         ARSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800518; x=1792405318;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmOWbwJ0T2o334M14HILyz5Wz3Aty+XrLvb7Rkh/Kco=;
        b=oBTAdi94Wy1E6LQh5KcN+kChkn2We5LJ6kQ9avA6hUCuZsj0abf7UbENpmZNjhZwLi
         sDTmk9T6wdqLd1crLQ0892PVR52x1E/M3f4riBFmiGJFtnJeHjLw7usYglxc72GtGH5M
         SwMpJ2DNuYWZJQTsp8x5nEhTwPbjaBRA2twDlRvRTqqikYRZUotzwhlSu7dbXICBtwHw
         phbr/vaup5fqttUGHT+OC8BmE66D7gqINVp9AdaDiYnqkSQYRH8QoLnQKR+7FZVDF3FZ
         ntxX46/gEpBw8NtQON5vHl//YJ6WvOMYoTcYTiFUgwtTYoEhgVSrpFfHVSTkGgtp2D4f
         YwGw==
X-Forwarded-Encrypted: i=1; AKwUvBwsn3HEUyp5Mpm7DiXGDkqWeVYXL0VZSd1BQTTipsWm5znovZU5c8r6Ow2oNTC7Mea8x4C+1DR+SgqNXA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJwXoLXZ5d4CwRWlYnhFHrHaA+YjczX5JJP7710MMUyI2KMJdXx
	LQL/tgNsZJzcu87mRFfubzDz/HWbzfM0deN+Ed3EAslh0CMYzDGRA5I6YU95+N9WOP7+qzm3l/X
	d/1CfbJE=
X-Gm-Gg: AYBFou23r4UwomGiAN3L+Hmiy0rL+Dg2V4qY6AGd+dss4pYhdLFBq8itqYISyJngBoX
	YPL/fxuoTA7iCq3HwEmmhF/2vtTOUTEnjIXfLn3X06KSkjB7zj+fnF/RZq24gKqwwzjrPufKNBd
	5kZUErec4tZvgV17ZzgwnpPA5XgG/LV70UqlfGcw4ztFstnjzbi6bOFYUZd0c3A/yX7iWAMgJFd
	S+q0QplCZZOxKAG25ZwqvGE1QIYtVBmXgwI9y6LpG55yzwvgbvXCv7idQ0ILKWxQS4ER6/m3s1F
	h+4KYyMrB+tPb3bUvHBc7VVd6cxgribFbMzh497lAm8IwH/p64+P3U9viHxYWk4rNH3L5kKAXfC
	5gld/Hrngn26x6hNV9ATt6GdLJ/m9xdp3QDC15DASgmYEl5V3Jtox4I0E/e/DZAQ49zzHbxXAai
	gZfTH1NkEiAxS6syHxZuiCF1m3skn/lpdszMxxuT8/1ULoxpVlEbxso9+rlSqqgKRHbucncms6C
	kyi+TCaULYaGKGm44NP3uNIIlbI
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr212480665e9.26.1791800518316;
        Mon, 12 Oct 2026 03:21:58 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm157508575e9.2.2026.10.12.03.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:57 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
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
In-Reply-To: <20261008123338.11081-6-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-6-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.1321848308971146208.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4406; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4tJxa6i6IS+DTFcXWg2M1j4JZuIKSXMzJlCDp/VpPfs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuyPviZQ5cKea5b/7JyEHf8SF/eEXc8+PtboE76j1
 HTPXbK1o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5wcjIsET4haTu03o/Q8+v
 gdL3VrFunBi5s1/+UldX37O7fhUR1xj+p7bum8/rphCjszWqbobG253H/nrMqpiz4IxzSXJzpTg
 nAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032201_512421_A8D4759B 
X-CRM114-Status: GOOD (  21.14  )
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

> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   2 +
>  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 ++++++++++++++++++
>  4 files changed, 175 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66d6c15f1dd2..dff8b819f83e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26217,6 +26217,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>  F:	drivers/phy/starfive/phy-jh7110-pcie.c
>  F:	drivers/phy/starfive/phy-jh7110-usb.c
>  
> +STARFIVE JHB100 CLOCK DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> +F:	drivers/clk/starfive/clk-starfive-jhb1*
> +F:	include/dt-bindings/clock/starfive,jhb1*.h
> +
>  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:	Supported
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 51716655554f..cd5b7754403e 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
>  	help
>  	  Say yes here to support the Video-Output clock controller
>  	  on the StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS0
> +	bool "StarFive JHB100 system-0 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER

just imply RESET_STARFIVE_JHB100 ?

It can be disabled if RESET_CONTROLLER is not set, so it is kind of weak already.

> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-0 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 199ac0f37a2f..d2ba83d7d02c 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> +
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> new file mode 100644
> index 000000000000..edab54f228ad
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-0 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +#define JHB100_SYS0CLK_NUM_CLKS			(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS0CLK_OSC			(JHB100_SYS0CLK_NUM_CLKS + 0)
> +#define JHB100_SYS0CLK_PLL0			(JHB100_SYS0CLK_NUM_CLKS + 1)
> +#define JHB100_SYS0CLK_PLL1			(JHB100_SYS0CLK_NUM_CLKS + 2)
> +#define JHB100_SYS0CLK_PLL2			(JHB100_SYS0CLK_NUM_CLKS + 3)

Does this mean that if the you ever find out you've forgot an internal clock
(which does happen fairly often) the whole external block will shift ?

> +
> +static const char * const jhb100_sys0_ext_clk[] = {
> +	"osc",
> +	"pll0",
> +	"pll1",
> +	"pll2",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
> + *   or not a consumer holds them, such as the bus interconnect and always-on
> + *   blocks. Gating them hangs the system, so they must never be disabled.

PCIE and USB are critical below and do not appear to meant this criteria, yet
they are critical too.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
