Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F21ECA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fIBbkaMjiYoa4VXMckDFWMTn3iNLVrWLWBhk68l5Q0=; b=0snG8G+wPuADjV
	EJtCS5nd9KwcUVOd6ZjFeBawueIlUsFEHPWuasK62y0ROdb62NsnPcCRjfQy7TdrR0VEbGxmERsFA
	9vafhYjsFLKqRQBbNEf9w9mrmBuPq265A97JF1VK1X5Iiw2L6YDj5stCOfERo++BiFaU3N5l6ASMd
	Vlrn6/F1d3XgYO2CsN85LVdZvS9rheTtBgCx4guVtpTLpS1Ru94XJXqvY5zlmsseGZ2FXP8cNrUEH
	FTRVFROABn0VDNhKR0o+WP9jKK2s8DKy64kduOMzk8fS+zPC5MXLF0etguOTV1xiC8Z/xufrg5qfh
	N19cxzfKbSfryVj/hVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAe-0000000ADD7-1OsW;
	Mon, 12 Oct 2026 10:22:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAR-0000000ACwI-2T68
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1626962f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800522; x=1792405322; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DuaQjF779FLWW5Q7e9PrJle5aNrB9tweNNuseFSzYZk=;
        b=Cx2cAnO1PxV2e7rQuTHQbIj1NUlX7V+KYYoI7kpKAYYVTwutVjyqdixPm5Fz0SuxJj
         aICOlN4Gi21jUaOK/Csq67GJJcCB43Ay2vuKUMZ5psKDcQf5pOESAbPKBwrZe6y0Pyoq
         JfSY/ZCbzjCuYHMXk55cNH8h4l/uq7O5/QAZobO8ZId0HQT1d+2OjCn0UFke/Onk3cww
         hisyNOJdYCm8kb7N+LbYMxBFJ4PVOyfHs+n1IJTe0xbX8fBsiyXN6UgNYpVkq036Tn6L
         NK/vLrhKniKGiv6IDvm7v3og68dQCLpEYflrhiC0Eo+SoeAA0MEvPqixfJBDDKD0A0Mb
         Wt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800522; x=1792405322;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuaQjF779FLWW5Q7e9PrJle5aNrB9tweNNuseFSzYZk=;
        b=NdMwBSaUWL5udMJjfibyIPdOPEhxs62102qz4opTOPcTEQ2jFFWNnHRf+HaN3+amrS
         3LaPqQE33szNUTEFsTT9chDXIAIzXPraMA9hIKsViEhvhRQYo5b1LqzldpqKu5BHlW7e
         hsO2xVTja0kh3w6ObSpy6JLpi3KQxofE6yh5zJNGzxih39G2JuTImf0oIjH2u6QJIM7M
         gP26v722Coum/YT4gRFlVaJh4Di4gvSL6lMinc2l5fqXMR3Jv/YzENbtYgtGleal49q1
         4zpmxidrqVX41ZG5v/gTAfBdZKkaC4Rm4S9VjcPsifwerdV4vWGuu2qqQk3UKr5uLKIh
         V70A==
X-Forwarded-Encrypted: i=1; AKwUvByf7+SjeIGeaFetg8D+YmZ8uvPImXqQbrv5rqpb481BLfBBuNecnPVcNpJE7+PSk1FA2Fo/WnoIu8YJ8w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIayzkhg11C7wSxgG4QlofDZqhKSBoUzpcH/s0dOMjUbieewotK
	sAmoHbj8/WTBc79bG+N0Fs2Wkb973icY3ZzfA7m/Ekyjq/WLbKcg+pUJ3XOg5B7mXe4=
X-Gm-Gg: AYBFou1AnZsKwGm2czDRSgmhRKwLPHIxO9whpaQObh7Mgp9OL03IXlVaaHfB3a9N9sL
	LUifQw3QtVArTD+t2gekgle0kCiZ64o5jmNvQzALcvdWMFQ41tbNB4zjWnOw9Vjil5+fDtcEDNv
	ApQn9gqy2okvrSGMO8USC6HuOAkA1c0d9V0jxCgpIX2xtNRMy1F+6cQfodvBEyAd47G7UelK8Kp
	Bx7xShBQqBQyFSMPgfIqjfFPUWLOX3hegD3tOV5NZXwxor7FOBk2k9va8Kk2TQtr6KlLwLtjxOJ
	Y4z6t02amN9sQGMlOwTJbdLKaclQcXj9xa/iqmCibGzW1ToLmtpLQDTW7YciqQuCO273sa/edHe
	TvT72DKZpHm8nIIwFt7NSpdWL/M+F3uYelSh8ttb+fE6MVW3AFkR641dw+A14FSMn5iLTdrU/Yn
	k5PLnrbLM6O//UKpTnF79hlF4aBV6SziWpETB+h26lQa0QjroGN5WKyBbY8lxkBnYLF+RtLM24/
	FBPiI7j5kCmQ5mxew==
X-Received: by 2002:a05:600c:c092:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a19831a9f7mr65008085e9.30.1791800521413;
        Mon, 12 Oct 2026 03:22:01 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm109630595e9.2.2026.10.12.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:22:00 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 07/15] clk: starfive: Add JHB100 System-2 clock
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
In-Reply-To: <20261008123338.11081-8-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-8-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.9435488912757103428.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7093; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tFLGoMHM+YmatgXDpuz/rj3x/WCsWzUXd015rn8gH3o=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuyXffs3XURqndmJ5MfqwdLG4leD326/V2p0vnNFz
 U/5+2qOHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjI3L+MDL+EnipqNVsYPn8V
 7qZeNpP5ndXvK7NK3z7sSLwu1B7u7sLwP/dOaHDAHbXe4MxPv36H1J2eePjMhG+q949LXnThOW/
 lzggA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032204_196184_BDF959E0 
X-CRM114-Status: GOOD (  21.27  )
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

> Add support for JHB100 System-2 clock generator (SYS2CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-sys2.c   | 135 ++++++++++++++++++
>  3 files changed, 146 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys2.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 11da8bcc4046..cfaac934a8e0 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -92,3 +92,13 @@ config CLK_STARFIVE_JHB100_SYS1
>  	help
>  	  Say yes here to support the system-1 clock controller on the
>  	  StarFive JHB100 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS2
> +	bool "StarFive JHB100 system-2 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-2 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 0061550e0f7e..29cdef20575e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys2.c b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> new file mode 100644
> index 000000000000..405f45a3042a
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-2 Clock Driver
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
> +#define JHB100_SYS2CLK_NUM_CLKS			(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1 + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS2CLK_OSC			(JHB100_SYS2CLK_NUM_CLKS + 0)
> +#define JHB100_SYS2CLK_PLL1			(JHB100_SYS2CLK_NUM_CLKS + 1)
> +#define JHB100_SYS2CLK_GPU0_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 2)
> +#define JHB100_SYS2CLK_GPU1_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 3)
> +
> +static const char * const jhb100_sys2_ext_clk[] = {
> +	"osc",
> +	"pll1",
> +	"gpu0_ncnoc_init",
> +	"gpu1_ncnoc_init",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
> + *   or not a consumer holds them, such as the bus interconnect and always-on
> + *   blocks. Gating them hangs the system, so they must never be disabled.
> + */
> +static const struct jh71x0_clk_data jhb100_sys2crg_clk_data[] = {
> +	/* jtag mst*/
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_HCLK, "jtagm0_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_HCLK, "jtagm1_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG, "jtagm0_atpg", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG, "jtagm1_atpg", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG_TCLOCK, "jtagm0_atpg_tclock", 2,
> +		    JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG_TCLOCK, "jtagm1_atpg_tclock", 2,
> +		    JHB100_SYS2CLK_JTAGM1_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_HCLK, "jtag0_mst_wrap_hclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_CLK_JTAG, "jtag0_mst_wrap_clk_jtag",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_APB_PCLK, "jtag0_mst_wrap_apb_pclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_ATPG_TCLOCK, "jtag0_mst_wrap_atpg_tclock",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_HCLK, "jtag1_mst_wrap_hclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_CLK_JTAG, "jtag1_mst_wrap_clk_jtag",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_APB_PCLK, "jtag1_mst_wrap_apb_pclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_ATPG_TCLOCK, "jtag1_mst_wrap_atpg_tclock",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),

It is really wise to leave the JTAG clocks ON by default ?
There should at least be a comment explaining this. Maybe the device on the field should
disable this clock in the bootloader or something.

> +	/* hostusbcmn */
> +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSB_NCNOC_TARG, "hostusb_ncnoc_targ", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSBCMN_CFG_500, "hostusbcmn_cfg_500", 4,
> +		    JHB100_SYS2CLK_PLL1),
> +	/* bmcperiph1 */
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_NCNOC_TARG, "bmcper1_ncnoc_targ", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_250, "bmcper1_cfg_250", 5,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_143_DFT, "bmcper1_cfg_143_dft", 8,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0_GATE(JHB100_SYS2CLK_BMCPER1_CFG_143, "bmcper1_cfg_143", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_BMCPER1_CFG_143_DFT),
> +	/* bmcperiph0 */
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER0_NCNOC_TARG, "bmcper0_ncnoc_targ", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	/* gpu0 */
> +	JH71X0__DIV(JHB100_SYS2CLK_GPU0_NCNOC_TARG, "gpu0_ncnoc_targ", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU0_BUS_CLK, "gpu0_bus_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU0_NCNOC_INIT),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU0_APB_CLK, "gpu0_apb_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU0_NCNOC_TARG),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU0_OSC_CLK, "gpu0_osc_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_OSC),
> +	/* gpu1 */
> +	JH71X0__DIV(JHB100_SYS2CLK_GPU1_NCNOC_TARG, "gpu1_ncnoc_targ", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU1_BUS_CLK, "gpu1_bus_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU1_NCNOC_INIT),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU1_APB_CLK, "gpu1_apb_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU1_NCNOC_TARG),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU1_OSC_CLK, "gpu1_osc_clk", CLK_IS_CRITICAL,

No, I don't think a GPU clock is critical. A GPU usually has a driver.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
