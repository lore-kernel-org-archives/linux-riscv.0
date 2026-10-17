Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE3BCCF2C7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 14:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyLDsT1iPmJpvweU1dKtOsONQQfhzpx8FtBMA5jrlCE=; b=0m9xAu47/caoDB
	kbN9O8N/beFyrvxlDHZXjeWvCPUEI9YMAEAcntlN1yBIu4s01BdWK6xRzYKz9IhaadIMJB6ZZOtwV
	XsU4k+Y1q4yfNMgNH+8bOabSZvgi/MPKRIrxyTqKAV2tx4seRm1sE8wD0CYdAVJ2YtjjlwjnxwMS3
	Akb7nibOZqHGOSGh/pYV0L6MjXacvTVYpobacr2iOiUPv1ST+Qo8K8ritK4/lvLILZAKWE1i+9cnw
	gQG2c6CutoGf+HA98GJwKiNWlXJIYf0TB30qRZh067PURTVYF4TAEqTDsCGEt2uuP2ryVCemF8v+c
	LosHnVQ8p5B6KSgLLvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5FE-00000004oqx-2cti;
	Sat, 17 Oct 2026 14:18:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5FA-00000004oqH-2j0w
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 14:18:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e00eee27dso383732f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 07:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792246718; x=1792851518; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhpcYsG6cATtQf6GDnXL2jByxJZRscDKQUvf/bDDW4s=;
        b=iUfuffA51xr6qQLmCcVxwKgqeBgF6WnOtN04otStXJo0TjHJMilaECAkLB8ntFEDkj
         Q0BhX/TWhY2J2TOLHsxTFqJmO0PBrIuPcRJMV8UG/fkMcpPE8o1i72g8pz9hYCSjlmqQ
         fkHVPmRmID2Xs7eV98XvHgDGxC5ezXGFxMKcnpeBDL+6dHMOUPxvjJkTw1iHx1Z0EDaL
         K8HpBgc9C/XABoBm67TS/BTzu34JYABNtWiiAvDMhI1FdxC9VXYg8p9SdMQ7DZ4CavIh
         /Y5b2GVRKhOtC3x7KcwbmLAe1dQBQAsI0SZsjM84Glp2yem1QEqoBg2bxDdyELxLGEtu
         TNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246718; x=1792851518;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhpcYsG6cATtQf6GDnXL2jByxJZRscDKQUvf/bDDW4s=;
        b=c/WAevTbTH2Lb/7luXO8hTW4U4O5Bqjdv+D1iiAo41Gp7zFL9HkJn+Yv4UE5NZOXE3
         lEaVHSwhUI3J71Mef0fyqtP3/47Em78MBBV8p0Pc/nsxywAn/jap2m92A9ksaaGr4kfP
         n8TRx/xlTXbl0L1w7CLhUXv97ybmp/dkDMOUKZJVF5sBP/7IAiMqIOOHgAC7qJyhovVJ
         ZHommwmRmXwaXEqqeC+Go6tWjr6YMQLtQxIEuy6AJ/GeIQGEJKBtViWj6qS/sbHasmjH
         fe/XnXMygPx5sZiY7xakBETO9FQ3cxSyiagPIAByWGgU8QVExmiyxq7q62g20PJ8BiH+
         j8gA==
X-Forwarded-Encrypted: i=1; AKwUvByAFjJ2suXSUNJqRd3p1C4aL4QB/zowJvalKS9iDWSKEf1iPDuFeOX7Qb4a62Sz0bHB15WrARN1DW8+2Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLfBD8lY4abYGlSasniuXFeO+qxSXm2FaCGjhkUXtZ7mMOr2NOM
	Hn513xwa0+7inuUwjOzkDcuixmopbHZRwCxsYiiLuclatb8FS1rE9ymKS9/z6BRDMok=
X-Gm-Gg: AYBFou1iZj7ICCHepN59WE7E096aDZBr75NpsixiGGCPUKMkOrWgj1YfUB+NkoxQQwP
	NDpyuFuVO+V4xtaTFrFv+ihGz91Dq7XQk6Ky+CTrY9C6LqhjHkLHgJl7320ag94kU7V+elo6QnN
	okabe4HBn2AY6ct6nLTmP3r4P1IA3/uqh/UPYOn8Xjw9RpgeUXSPL1gk43zrGBS2LfATYbSNbCr
	NPahSGqHCOMuEqlP0d5t2wqaw4iCYBpPMqjGIuUGZaOrpx9rKN/T7sjQ0z204j3YQYHDkVbj/A1
	6phLXrewCXd2T8+KwZ0/W1Z/M7y1Zb2DpdNaWw7zHS873xmacM+nupIBxOy1Gybn3osvqAWHiA6
	0evbYwT7PceyBPIrPyFTCVeYHNBje+7huZReVmVz3g2sb5b/Bzv6W8tQMpLfH+LXrAFwLmGxdZo
	yAM6pf1h0m84YeB2JKTlRpS9mD1p8dKkSsAVN7/K1xlPONg4+NzyuZoLqk/tScQWYmtD35S7Nn2
	TrcHp4CdeOyDDw1Vw==
X-Received: by 2002:a05:6000:60b:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48e0797ffddmr5343647f8f.7.1792246716907;
        Sat, 17 Oct 2026 07:18:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm11600796f8f.48.2026.10.17.07.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:18:34 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 10/15] clk: starfive: Add StarFive JHB100
 Peripheral-0 clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ZQ4PR01MB120299579A8998CC303F04ADF29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-11-changhuang.liang@starfivetech.com>
 <179180050742.66744.4988353309640403131.b4-review@b4>
 <ZQ4PR01MB120299579A8998CC303F04ADF29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Sat, 17 Oct 2026 16:18:25 +0200
Message-Id: <179224670585.859276.2044951818293223404.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5393; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3v+6YlSml8t8QtsLAKGyYODzduZT9ur8kesXOOK6Hpw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXmzft1jj56PKKzB/J3oYa8ksvHXOM+vNAufA3iw3HE
 baV2i90OkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjARmaUM/xTeLU5sqzgZ1Zj1
 yr5Df0b9kTZzx4yvTqsrMj2/dfWo/2dkuMRsMMvZ7NG1X+36OsuPhorxmS4yW3bd0lbxVbXua+Z
 8RgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_071841_030086_0840AF8F 
X-CRM114-Status: GOOD (  29.89  )
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

On 2026-10-14 02:13 +0000, Changhuang Liang wrote:
> Hi, Jerome
> 
> > > Add driver for the StarFive JHB100 Peripheral-0 clock controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/Kconfig                  |  10 +
> > >  drivers/clk/starfive/Makefile                 |   1 +
> > >  .../clk/starfive/clk-starfive-jhb100-per0.c   | 617 ++++++++++++++++++
> > >  3 files changed, 628 insertions(+)
> > >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > >
> > > diff --git a/drivers/clk/starfive/Kconfig
> > > b/drivers/clk/starfive/Kconfig index cfaac934a8e0..b2a05bbb450f 100644
> > > --- a/drivers/clk/starfive/Kconfig
> > > +++ b/drivers/clk/starfive/Kconfig
> > > @@ -73,6 +73,16 @@ config CLK_STARFIVE_JH7110_VOUT
> > >  	  Say yes here to support the Video-Output clock controller
> > >  	  on the StarFive JH7110 SoC.
> > >
> > > +config CLK_STARFIVE_JHB100_PER0
> > > +	bool "StarFive JHB100 peripheral-0 clock support"
> > > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > > +	select CLK_STARFIVE_JH71X0
> > > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> > > +	default ARCH_STARFIVE
> > > +	help
> > > +	  Say yes here to support the peripheral-0 clock controller
> > > +	  on the StarFive JHB100 SoC.
> > > +
> > >  config CLK_STARFIVE_JHB100_SYS0
> > >  	bool "StarFive JHB100 system-0 clock support"
> > >  	depends on ARCH_STARFIVE || COMPILE_TEST diff --git
> > > a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile index
> > > 29cdef20575e..352717886295 100644
> > > --- a/drivers/clk/starfive/Makefile
> > > +++ b/drivers/clk/starfive/Makefile
> > > @@ -11,6 +11,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+=
> > clk-starfive-jh7110-stg.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
> > clk-starfive-jh7110-vout.o
> > >
> > > +obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+=
> > clk-starfive-jhb100-per0.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> > clk-starfive-jhb100-sys0.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=
> > clk-starfive-jhb100-sys1.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=
> > clk-starfive-jhb100-sys2.o
> > > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > > b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > > new file mode 100644
> > > index 000000000000..ef6e6906cd2f
> > > --- /dev/null
> > > +++ b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > > @@ -0,0 +1,617 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * StarFive JHB100 Peripheral-0 Clock Driver
> > > + *
> > > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > > + *
> > > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > + *
> > > + */
> > > +
> > > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "clk-starfive-jh71x0.h"
> > > +
> > > +#define JHB100_PER0CLK_NUM_CLKS
> > 	(JHB100_PER0CLK_MAIN_ICG_EN_TRNG + 1)
> > > +
> > > +/* external clocks */
> > > +#define JHB100_PER0CLK_OSC
> > 	(JHB100_PER0CLK_NUM_CLKS + 0)
> > > +#define JHB100_PER0CLK_PLL6
> > 	(JHB100_PER0CLK_NUM_CLKS + 1)
> > > +#define JHB100_PER0CLK_CFG_400
> > 	(JHB100_PER0CLK_NUM_CLKS + 2)
> > > +#define JHB100_PER0CLK_CFG_800
> > 	(JHB100_PER0CLK_NUM_CLKS + 3)
> > > +#define JHB100_PER0CLK_NCNOC_INIT
> > 	(JHB100_PER0CLK_NUM_CLKS + 4)
> > > +#define JHB100_PER0CLK_NCNOC_TARG
> > 	(JHB100_PER0CLK_NUM_CLKS + 5)
> > > +
> > > +static const char * const jhb100_per0_ext_clk[] = {
> > > +	"osc",
> > > +	"pll6",
> > > +	"cfg_400",
> > > +	"cfg_800",
> > > +	"ncnoc_init",
> > > +	"ncnoc_targ",
> > > +};
> > > +
> > > +/*
> > > + * Regarding the CLK_IS_CRITICAL flag:
> > > + *   What is special here is the UART*-related clocks. On the JHB100, the
> > secure
> > > + *   core may consume one UART, while the AP core consumes another.
> > Different
> > > + *   core boards may select different UARTs, so we usually want to keep
> > all UART*
> > > + *   clocks always on to prevent the AP core from turning off the clock for
> > the
> > > + *   secure core's UART.
> > > + *   UART0-3 are usually used by the HOST side, and there will be no
> > driver on
> > > + *   the BMC side to consume these clocks. Therefore, these clocks need
> > to be
> > > + *   enabled for the host to consume.
> > 
> > So you are forcefully enabling 14 clocks for 1 to 4 clocks that may or may not
> > be used.
> > This is not how this should work. You just enable clock randomly hoping it will
> > cover your use case. If you are managing the clock for these secure core, it
> > clearly shows you need a driver for it.
> 
> Can I keep the clocks for uart0-3 as CLK_IS_CRITICAL here? On the JHB100 BMC SoC, 
> uart0-3 are provided for the host to read and write registers via eSPI. On our BMC 
> side, we need to ensure the clocks are always on to provide host access.
>

It would be less problematic, but still I do not understand why a uart end up being
critical.

If you are letting the host map the uart memory region and implement some
'userspace' driver, you already know what you are doing is bad. So it is
hardly a good reason.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
