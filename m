Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6052F606A31D
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kpPDRr0V;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AX3h+Vsj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0O+9ebM0XKtz3e679e/zXT7a8qswE0OiQo16GTtStS8=; b=kpPDRr0V6Hd7KWv5ZhzMOViIUa
	38gSmVIJJhqdDkT/4DuAchZVNCIbs6ZvBvFNl4Pizh2JbzI2ogyijVwJJmBOPitE/+5bpsBWp03X4
	TiWooS1v6yHvhaVdvz6P7RqsjRl93/s3cj8Vw9uPXRAHUfUxFBk8Q8u1Hm/4wzK4Q4OnrzRnuFQ0f
	1HZ3wYAIzEhmGwTZ1DWNeHBB4yfdQWaYPL5M/U9QuiCNYXo46cCXsycvPEndGyAoAHQ7DI60NN7H5
	L47YRtPjSNOcvlD4J4iDFkKij6Y0jIdCZxb0+1JER8eIgTrlOYEOGcV01EkGEYXwMem+viWQB+0k9
	0fMQgtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb47-000000001qR-2enM;
	Sun, 15 Nov 2026 14:18:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb43-000000001od-1l6v
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 14:18:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1272514f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 06:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752317; x=1795357117; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eRXocFNPHTDFcDxqvK37Nsoc4c3iJpE3zFJQsev+8wc=;
        b=AX3h+Vsjj9mwwXeqUaQF7qv2GRMKXFnSfcic2CZFnq4P8cKWZ22iKziEj/j9e6cJvT
         fC7KepzB9s+A1eFWWs0KU47VapxAjgeg3t9THDTlj/UsFQerNXiy8UKVEKikXslE7h/A
         LnatdcM7XN9nkFUW8qplNFonVyAV/opUlORbdPDUYQdml5NvR4C6EKjZG6HgBrnij12c
         uj5LnvkJwVyms1c2ku0+8pCC2FWF0E8P4jYvh8GaLzwAjwfCBof9w4bEqE5mZSKYKsVv
         TSlfOaSgLEfNVHuLKPV89W9HOqnp/bYQ4TLY+TxytXOx3R9KTE0x2hPhkC2qd2T7tcy5
         dYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752317; x=1795357117;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRXocFNPHTDFcDxqvK37Nsoc4c3iJpE3zFJQsev+8wc=;
        b=0W/dzqzmBQ+JYFcvCBt21bjhhC250CllRQQfLM3U01o+J+xs+v1Zw0IVmAoAVYFDVi
         7BhQgIRFgeLp2lj7xCuBsBZO3fIiAt7tY3Wpk5LBCYWcrFqrOe4iakqyWYYHV6S12hHC
         8Q/XmSJXa/mRITKpvpg3bq1xHgvjvxH0aYY0dhBBJgrZaE/0IhZCBkCR8Tt+jAVuyY7X
         Zg8V2xlHXAKCpzB18vtA10gQc7fL5a0yvTLZw/TkZetiQposEUn8wKWlY5rIAugUMFgm
         ZDM3IiZwI2Q9CuvDP78STjyefXfN551AA20KW/lQksnvhoP5R3WJp5/oRZTMHfc3GlNf
         4PbQ==
X-Forwarded-Encrypted: i=1; AL+hErHImJXkQiAdqKUW8/V3yhTroiLOq+Z2P1GjclDGk5dV8VlV3uMcvwxKyHVP2KrgjqvQvodSFmvi42INhQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/sZ4ucn7guy/leexwAxpw/oxpfWC13xPkHnx4AnLdTy6beztgI
	5C4hgqbOO/DtoP7AUY9nc3QakFFkgJlSwb8Pxo/VOCZ1uFQ516JoEVF2mRtFGLWVnJ4=
X-Gm-Gg: AYBFou1eK3QQX881o2PgK3uDCBKJiUSufkryQSiSofsGGlSRm4NMrpbPR7ZjdYsyIR5
	RlvZSlXI97HZd6AWF6KYa6wh/qtWVHiochnGoxqucxavTNC9W6ry5F6JjSAdon4gPBk9fPH0Oa1
	0Wq3Bh6lZUBN2mHFw9VH3FnSwyquHRKb7Nem+4gQajD5BV83ri+xZHJFmK5kai3VNzEiq321npn
	9E6qO30pybJ4BZLXEx5kmPa2VJQeJcuEH91L3FmLJIJrb4NscA09C7gDicYJTjgqocAJb3TMOvS
	axCXon0bKpvtKD8wnf7Gjy36FPeis+8Te2WefgyoDK79HOJE1LigKzVfemQttglHoahM0MSKJRg
	4wcDVWomkPxaxVrq0BVZGDUw2lIX3C68oQ0lqW8BqQDtJEjFHX7Avh+uxWs/OqjA8TgkKFZ4i10
	aGD9OA+9yBDhJGSk/33oPkcKcx4+s+W/Y9d4mFWDxHLbms/CDnFcLdGIFMBSnhvyttPDGwtv7Vr
	kKcwHTzd5yExMrOeaTL//s4sSC3JFGNu1ilkHfoRCkXYE0KdHRr5uGC2Ibaic2PC+T3l+sgSn87
	Z8CZ/tl/+zlZwXlKi//FKnPcT6UWj1ULLWUQOoRCxa30opjK
X-Received: by 2002:a05:6000:18ac:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-49c70ed9222mr16798800f8f.16.1794752317494;
        Sun, 15 Nov 2026 06:18:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6934sm16286752f8f.48.2026.11.15.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock
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
In-Reply-To: <20261013102707.9207-5-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-5-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.8310507156583636155.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8368; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TxbedSC4eUXLevyLtulFrGyDmY5zaUcSjNZDAxD2f5s=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95uXva9fbZTEol5vsL2et+fTt40MLvvvLzzdOSt/E
 7N6gahhRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbiJ83wh9tgx62r1x/0HPul
 KDrNh9M+8s1b1ulZF2e5dFxZ0PgiaAojw70re5WL5PYwvuHQ0zxU9OYyp0IoGwO7RMukZ60vayv
 rOQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061839_514012_FBD7FDEF 
X-CRM114-Status: GOOD (  18.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   2 +
>  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 148 ++++++++++++++++++
>  4 files changed, 167 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..f66998e8eb64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26837,6 +26837,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
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
> index 51716655554f..cb246ae12c08 100644
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
> +	imply RESET_STARFIVE_JHB100
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
> index 000000000000..dd4d65f4e682
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> @@ -0,0 +1,148 @@
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
> +/* external clocks */
> +#define JHB100_SYS0CLK_OSC			JH71X0_EXT_CLK(0)
> +#define JHB100_SYS0CLK_PLL0			JH71X0_EXT_CLK(1)
> +#define JHB100_SYS0CLK_PLL1			JH71X0_EXT_CLK(2)
> +#define JHB100_SYS0CLK_PLL2			JH71X0_EXT_CLK(3)
> +
> +static const char * const jhb100_sys0_ext_clk[] = {
> +	"osc",
> +	"pll0",
> +	"pll1",
> +	"pll2",
> +};

These are the hackish part I was referring to.

> +
> +static const struct jh71x0_clk_data jhb100_sys0crg_clk_data[] = {
> +	/* bmcpcierp */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN, "bmcpcierp_ncnoc_main", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG, "bmcpcierp_ncnoc_cfg", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_DATA_INIT, "bmcpcierp_ncnoc_data_init",
> +		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),

I think the v6 that came before this had a bunch of critical clocks. None of those were critical after all ?
You did test without passing clk_ignore_unused in the boot arguments ?

> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG_INIT, "bmcpcierp_ncnoc_cfg_init",
> +		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_TARG, "bmcpcierp_ncnoc_targ",
> +		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_PCU, "bmcpcierp_pcu", 0, JHB100_SYS0CLK_OSC),
> +	/* hostss0 */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_CFG, "hostss0_ncnoc_cfg", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_DATA, "hostss0_ncnoc_data", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_PHY_SCAN_400, "hostss0_phy_scan_400", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_GPIO_ESPI0_EXT, "gpio_espi0_ext", 14,
> +		    JHB100_SYS0CLK_PLL2),
> +	/* bmcusb */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_INIT, "bmcusb_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_TARG, "bmcusb_ncnoc_targ", 6,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_SCANCLK, "bmcusb_scanclk", 5,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCUSB_480M_SCANCLK, "bmcusb_480m_scanclk",
> +		    0, JHB100_SYS0CLK_BMCUSB_SCANCLK),
> +	/* vce */
> +	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_INIT, "vce_ncnoc_init", 10,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_TARG, "vce_ncnoc_targ", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	/* bmcperiph2 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_INIT, "bmcper2_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_TARG, "bmcper2_ncnoc_targ", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_400, "bmcper2_cfg_400", 8,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_125, "bmcper2_cfg_125", 10,
> +		    JHB100_SYS0CLK_PLL1),
> +	/* hostss1 */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_NCNOC_DATA, "hostss1_ncnoc_data", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400, "hostss1_phy_scan_400", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0_GATE(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400_ICG_BUF,
> +		    "hostss1_phy_scan_400_icg_buf", 0,
> +		    JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400),
> +	/* npu */
> +	JH71X0__DIV(JHB100_SYS0CLK_NPU_NCNOC_INIT, "npu_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* vout */
> +	JH71X0__DIV(JHB100_SYS0CLK_VOUT_NCNOC_INIT, "vout_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_VOUT_AUX, "vout_aux", 150,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* bmcperiph3 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER3_NCNOC_INIT, "bmcper3_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* hostusb */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSB_NCNOC_INIT, "hostusb_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* hostusbcmn */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSBCMN_CFG_480, "hostusbcmn_cfg_480", 5,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* bmcperiph1 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_NCNOC_INIT, "bmcper1_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_CFG_800, "bmcper1_cfg_800", 4,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* bmcperiph0 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_NCNOC_INIT, "bmcper0_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_400, "bmcper0_cfg_400", 8,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_800, "bmcper0_cfg_800", 8,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* gpu0 */
> +	JH71X0__DIV(JHB100_SYS0CLK_GPU0_NCNOC_INIT, "gpu0_ncnoc_init", 10,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* gpu1 */
> +	JH71X0__DIV(JHB100_SYS0CLK_GPU1_NCNOC_INIT, "gpu1_ncnoc_init", 10,
> +		    JHB100_SYS0CLK_PLL0),
> +};
> +
> +static_assert(ARRAY_SIZE(jhb100_sys0crg_clk_data) <= JH71X0_EXT_CLK_FLAG);

This could go away too with the rework I have suggested.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
