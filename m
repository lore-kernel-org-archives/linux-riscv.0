Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733D0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQZSTOvuFFkC0vqi9Qb4ugkDUDW4v9HaMmMnxHaNvf0=; b=zYnZ4hzmbekl8r
	/URxeaZYgAnWdeQOlye/Lu0DtOD65q9i2zQe09+Q1v3IWwrCkoHZAT44XHWNIXwP0IN4FVKbUS6xi
	rs8OLY35D00KIv4cm7PsgQsYKEHSlncO2ghV9dNKLcPeIkbo4tWWFlqiR5eqN3z71c6YzK299oGGx
	4RmLGk/PENvyiByOqrrZs5acN/Vb8ArpkWGlLvWBvXBACHCQlMtydIFbeOUj9mz4LrYgmwgGHMQKC
	hW0x1ZdEQSDd7g7URRWOCbcVR2Afn2aQj5aWHKNH+UwXyBlRFr/0n67pM6AdnGp1A1/4pdEEm2QP4
	1N6Q+CT1wN2/gqYyOzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4A3-005HC6-9z; Fri, 18 Nov 2022 16:24:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow48b-005GId-OZ
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 16:22:50 +0000
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 22BD53F12E
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668788549;
	bh=UIuXrM1nrVnpPWLQTVj4KoTkLg8yi2TmNazv9H3mek8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=c0H5iJqe+bqddbfgQ+pF+wvCRCClczFCq6WPn2n71ZWUiEUzl9OJv2csRCiI05nM9
	 IvKsXb4YCEjDP67IsFNADDKYeXUAMGSrfVT/KuVrd6vh0QHNqL4cWDpZ9gLW7x+oou
	 mL5MunJrcyKqmy4blyrqFCx9Emq4LCCDIsPf26PKX7kN+zQY6CjWz8uHEb5whBlqKd
	 a7lkBu8MYOi1CaCSU47GQ3n/M86hxX0YHKihf/tok6JSYjIbzXMeifCaITOh62KT4m
	 lRu/pww5Uab8Gs3QRpscFXE6Z3XhRng0RMLXgt2LvFGB44wy6OzqlKMxp6FTyC+QYh
	 mHCwg+/esSrow==
Received: by mail-yb1-f200.google.com with SMTP id e198-20020a2537cf000000b006e699f20c51so4829488yba.7
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 08:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIuXrM1nrVnpPWLQTVj4KoTkLg8yi2TmNazv9H3mek8=;
        b=4dddOLFGzAe0gnkDq4OVb02r+zlRXcwhLqjJP22nD/JHhflH2jXh8rQaz8l99HUNb8
         VXXV+Q8B45rr1ckDPp2tQsBwKyhD9Vml66bebMNP6oF/8aBmGl/mNV6jiMGNnIhk2CMG
         9GeXyHcd5f1LGOFiqXx9gyh9ymWaTcgCfMU16JseLQm9heZifpmjJQrGQkiZAXcs8NGJ
         CdDmuZ4ald4doMuy26+RMd48XeyoRNYdECi2Nk/8PgIFvL2uh8Kk0NkwJJ4JhHdvuaGz
         gdm2rbPLeiDLc2WvGzkpEyQ/I3m5j9Px8fvkGrSdZ8d8D/aVtrJOhu6HEnQ4nC3MftdF
         VOhw==
X-Gm-Message-State: ANoB5pl0P61PhqF43LXw2aL38kIqh7fxuDL1byvsPM9scCvjluOCIhWa
	Hk9JLBMbSbYvENhy8QF2fLTPFCzFe4NDCMVOQnHcytA6tsbD9cAHr2mqT5J8JapteI2btGLlVR9
	pyTPSwzLQs0yvkg+3tfTLPvDPLWHFq8OkHNuj1uGXnQkD6YH36B8NMo/iwIXODg==
X-Received: by 2002:a25:abe4:0:b0:6e7:cbc4:1ac3 with SMTP id v91-20020a25abe4000000b006e7cbc41ac3mr5814655ybi.559.1668788547248;
        Fri, 18 Nov 2022 08:22:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Z+nWiESsyhyw2ii4v0Xj3hmukMVm82cnfkoBX45XLT0igqXvEGGvMxcYfTrtWigVZvs/Bu94g2NFIVfZaPHE=
X-Received: by 2002:a25:abe4:0:b0:6e7:cbc4:1ac3 with SMTP id
 v91-20020a25abe4000000b006e7cbc41ac3mr5814615ybi.559.1668788546889; Fri, 18
 Nov 2022 08:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-2-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-2-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 17:22:10 +0100
Message-ID: <CAJM55Z8nGNm_TrTsw0HZnAVehWrFU9-MtAj0ngRRx_E8jFapGg@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] clk: starfive: Factor out common JH7100 and
 JH7110 code
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_082246_182263_5647F512 
X-CRM114-Status: GOOD (  29.80  )
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

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> The clock control registers on the StarFive JH7100 and JH7110 work
> identically, so factor out the code then drivers for the two SoCs
> can share it without depending on each other. No functional change.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                |   2 +-
>  drivers/clk/starfive/Kconfig               |   5 +
>  drivers/clk/starfive/Makefile              |   3 +-
>  drivers/clk/starfive/clk-starfive-jh7100.c | 325 --------------------
>  drivers/clk/starfive/clk-starfive-jh7100.h |   2 +
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 333 +++++++++++++++++++++
>  6 files changed, 343 insertions(+), 327 deletions(-)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 256f03904987..d43daa89d5f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19602,7 +19602,7 @@ STARFIVE JH7100 CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
> -F:     drivers/clk/starfive/clk-starfive-jh7100*
> +F:     drivers/clk/starfive/

When this entry cover all the starfive clock drivers the header should
also match. Eg.
STARFIVE CLOCK DRIVERS


>  F:     include/dt-bindings/clock/starfive-jh7100*.h
>
>  STARFIVE JH7100 PINCTRL DRIVER
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 003bd2d56ce7..594d516dcb38 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -1,8 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> +config CLK_STARFIVE_JH71X0
> +       bool
> +
>  config CLK_STARFIVE_JH7100
>         bool "StarFive JH7100 clock support"
>         depends on SOC_STARFIVE || COMPILE_TEST
> +       select CLK_STARFIVE_JH71X0
>         default SOC_STARFIVE
>         help
>           Say yes here to support the clock controller on the StarFive JH7100
> @@ -11,6 +15,7 @@ config CLK_STARFIVE_JH7100
>  config CLK_STARFIVE_JH7100_AUDIO
>         tristate "StarFive JH7100 audio clock support"
>         depends on CLK_STARFIVE_JH7100
> +       select CLK_STARFIVE_JH71X0
>         default m if SOC_STARFIVE
>         help
>           Say Y or M here to support the audio clocks on the StarFive JH7100
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 0fa8ecb9ec1c..82edfa9f9cb8 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -# StarFive Clock
> +obj-$(CONFIG_CLK_STARFIVE_JH71X0)      += clk-starfive-jh71x0.o
> +
>  obj-$(CONFIG_CLK_STARFIVE_JH7100)      += clk-starfive-jh7100.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)        += clk-starfive-jh7100-audio.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index 691aeebc7092..eea52f16af0d 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -7,15 +7,10 @@
>   * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>   */
>
> -#include <linux/bits.h>
>  #include <linux/clk-provider.h>
> -#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
> -#include <linux/io.h>
> -#include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
> -#include <linux/module.h>
>  #include <linux/platform_device.h>
>
>  #include <dt-bindings/clock/starfive-jh7100.h>
> @@ -269,326 +264,6 @@ static const struct jh7100_clk_data jh7100_clk_data[] __initconst = {
>         JH7100_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", 0, JH7100_CLK_APB2_BUS),
>  };
>
> -static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
> -{
> -       return container_of(hw, struct jh7100_clk, hw);
> -}
> -
> -static struct jh7100_clk_priv *jh7100_priv_from(struct jh7100_clk *clk)
> -{
> -       return container_of(clk, struct jh7100_clk_priv, reg[clk->idx]);
> -}
> -
> -static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
> -{
> -       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> -       void __iomem *reg = priv->base + 4 * clk->idx;
> -
> -       return readl_relaxed(reg);
> -}
> -
> -static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
> -{
> -       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> -       void __iomem *reg = priv->base + 4 * clk->idx;
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&priv->rmw_lock, flags);
> -       value |= readl_relaxed(reg) & ~mask;
> -       writel_relaxed(value, reg);
> -       spin_unlock_irqrestore(&priv->rmw_lock, flags);
> -}
> -
> -static int jh7100_clk_enable(struct clk_hw *hw)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
> -       return 0;
> -}
> -
> -static void jh7100_clk_disable(struct clk_hw *hw)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
> -}
> -
> -static int jh7100_clk_is_enabled(struct clk_hw *hw)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -
> -       return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
> -}
> -
> -static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
> -                                           unsigned long parent_rate)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 div = jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
> -
> -       return div ? parent_rate / div : 0;
> -}
> -
> -static int jh7100_clk_determine_rate(struct clk_hw *hw,
> -                                    struct clk_rate_request *req)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       unsigned long parent = req->best_parent_rate;
> -       unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
> -       unsigned long div = min_t(unsigned long, DIV_ROUND_UP(parent, rate), clk->max_div);
> -       unsigned long result = parent / div;
> -
> -       /*
> -        * we want the result clamped by min_rate and max_rate if possible:
> -        * case 1: div hits the max divider value, which means it's less than
> -        * parent / rate, so the result is greater than rate and min_rate in
> -        * particular. we can't do anything about result > max_rate because the
> -        * divider doesn't go any further.
> -        * case 2: div = DIV_ROUND_UP(parent, rate) which means the result is
> -        * always lower or equal to rate and max_rate. however the result may
> -        * turn out lower than min_rate, but then the next higher rate is fine:
> -        *   div - 1 = ceil(parent / rate) - 1 < parent / rate
> -        * and thus
> -        *   min_rate <= rate < parent / (div - 1)
> -        */
> -       if (result < req->min_rate && div > 1)
> -               result = parent / (div - 1);
> -
> -       req->rate = result;
> -       return 0;
> -}
> -
> -static int jh7100_clk_set_rate(struct clk_hw *hw,
> -                              unsigned long rate,
> -                              unsigned long parent_rate)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       unsigned long div = clamp(DIV_ROUND_CLOSEST(parent_rate, rate),
> -                                 1UL, (unsigned long)clk->max_div);
> -
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
> -       return 0;
> -}
> -
> -static unsigned long jh7100_clk_frac_recalc_rate(struct clk_hw *hw,
> -                                                unsigned long parent_rate)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 reg = jh7100_clk_reg_get(clk);
> -       unsigned long div100 = 100 * (reg & JH7100_CLK_INT_MASK) +
> -                              ((reg & JH7100_CLK_FRAC_MASK) >> JH7100_CLK_FRAC_SHIFT);
> -
> -       return (div100 >= JH7100_CLK_FRAC_MIN) ? 100 * parent_rate / div100 : 0;
> -}
> -
> -static int jh7100_clk_frac_determine_rate(struct clk_hw *hw,
> -                                         struct clk_rate_request *req)
> -{
> -       unsigned long parent100 = 100 * req->best_parent_rate;
> -       unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
> -       unsigned long div100 = clamp(DIV_ROUND_CLOSEST(parent100, rate),
> -                                    JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
> -       unsigned long result = parent100 / div100;
> -
> -       /* clamp the result as in jh7100_clk_determine_rate() above */
> -       if (result > req->max_rate && div100 < JH7100_CLK_FRAC_MAX)
> -               result = parent100 / (div100 + 1);
> -       if (result < req->min_rate && div100 > JH7100_CLK_FRAC_MIN)
> -               result = parent100 / (div100 - 1);
> -
> -       req->rate = result;
> -       return 0;
> -}
> -
> -static int jh7100_clk_frac_set_rate(struct clk_hw *hw,
> -                                   unsigned long rate,
> -                                   unsigned long parent_rate)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       unsigned long div100 = clamp(DIV_ROUND_CLOSEST(100 * parent_rate, rate),
> -                                    JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
> -       u32 value = ((div100 % 100) << JH7100_CLK_FRAC_SHIFT) | (div100 / 100);
> -
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, value);
> -       return 0;
> -}
> -
> -static u8 jh7100_clk_get_parent(struct clk_hw *hw)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 value = jh7100_clk_reg_get(clk);
> -
> -       return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
> -}
> -
> -static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
> -
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
> -       return 0;
> -}
> -
> -static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
> -                                        struct clk_rate_request *req)
> -{
> -       return clk_mux_determine_rate_flags(hw, req, 0);
> -}
> -
> -static int jh7100_clk_get_phase(struct clk_hw *hw)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 value = jh7100_clk_reg_get(clk);
> -
> -       return (value & JH7100_CLK_INVERT) ? 180 : 0;
> -}
> -
> -static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
> -{
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 value;
> -
> -       if (degrees == 0)
> -               value = 0;
> -       else if (degrees == 180)
> -               value = JH7100_CLK_INVERT;
> -       else
> -               return -EINVAL;
> -
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
> -       return 0;
> -}
> -
> -#ifdef CONFIG_DEBUG_FS
> -static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
> -{
> -       static const struct debugfs_reg32 jh7100_clk_reg = {
> -               .name = "CTRL",
> -               .offset = 0,
> -       };
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> -       struct debugfs_regset32 *regset;
> -
> -       regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
> -       if (!regset)
> -               return;
> -
> -       regset->regs = &jh7100_clk_reg;
> -       regset->nregs = 1;
> -       regset->base = priv->base + 4 * clk->idx;
> -
> -       debugfs_create_regset32("registers", 0400, dentry, regset);
> -}
> -#else
> -#define jh7100_clk_debug_init NULL
> -#endif
> -
> -static const struct clk_ops jh7100_clk_gate_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_div_ops = {
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_fdiv_ops = {
> -       .recalc_rate = jh7100_clk_frac_recalc_rate,
> -       .determine_rate = jh7100_clk_frac_determine_rate,
> -       .set_rate = jh7100_clk_frac_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_gdiv_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_mux_ops = {
> -       .determine_rate = jh7100_clk_mux_determine_rate,
> -       .set_parent = jh7100_clk_set_parent,
> -       .get_parent = jh7100_clk_get_parent,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_gmux_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .determine_rate = jh7100_clk_mux_determine_rate,
> -       .set_parent = jh7100_clk_set_parent,
> -       .get_parent = jh7100_clk_get_parent,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_mdiv_ops = {
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .get_parent = jh7100_clk_get_parent,
> -       .set_parent = jh7100_clk_set_parent,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_gmd_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .get_parent = jh7100_clk_get_parent,
> -       .set_parent = jh7100_clk_set_parent,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -static const struct clk_ops jh7100_clk_inv_ops = {
> -       .get_phase = jh7100_clk_get_phase,
> -       .set_phase = jh7100_clk_set_phase,
> -       .debug_init = jh7100_clk_debug_init,
> -};
> -
> -const struct clk_ops *starfive_jh7100_clk_ops(u32 max)
> -{
> -       if (max & JH7100_CLK_DIV_MASK) {
> -               if (max & JH7100_CLK_MUX_MASK) {
> -                       if (max & JH7100_CLK_ENABLE)
> -                               return &jh7100_clk_gmd_ops;
> -                       return &jh7100_clk_mdiv_ops;
> -               }
> -               if (max & JH7100_CLK_ENABLE)
> -                       return &jh7100_clk_gdiv_ops;
> -               if (max == JH7100_CLK_FRAC_MAX)
> -                       return &jh7100_clk_fdiv_ops;
> -               return &jh7100_clk_div_ops;
> -       }
> -
> -       if (max & JH7100_CLK_MUX_MASK) {
> -               if (max & JH7100_CLK_ENABLE)
> -                       return &jh7100_clk_gmux_ops;
> -               return &jh7100_clk_mux_ops;
> -       }
> -
> -       if (max & JH7100_CLK_ENABLE)
> -               return &jh7100_clk_gate_ops;
> -
> -       return &jh7100_clk_inv_ops;
> -}
> -EXPORT_SYMBOL_GPL(starfive_jh7100_clk_ops);
> -
>  static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data)
>  {
>         struct jh7100_clk_priv *priv = data;
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.h b/drivers/clk/starfive/clk-starfive-jh7100.h
> index f116be5740a5..a8ba6e25b5ce 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.h
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.h
> @@ -4,6 +4,8 @@
>
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/spinlock.h>
>
>  /* register fields */
>  #define JH7100_CLK_ENABLE      BIT(31)
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> new file mode 100644
> index 000000000000..6c07b61b4a32
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7100 Clock Generator Driver
> + *
> + * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +
> +#include "clk-starfive-jh7100.h"
> +
> +static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct jh7100_clk, hw);
> +}
> +
> +static struct jh7100_clk_priv *jh7100_priv_from(struct jh7100_clk *clk)
> +{
> +       return container_of(clk, struct jh7100_clk_priv, reg[clk->idx]);
> +}
> +
> +static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
> +{
> +       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> +       void __iomem *reg = priv->base + 4 * clk->idx;
> +
> +       return readl_relaxed(reg);
> +}
> +
> +static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
> +{
> +       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> +       void __iomem *reg = priv->base + 4 * clk->idx;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->rmw_lock, flags);
> +       value |= readl_relaxed(reg) & ~mask;
> +       writel_relaxed(value, reg);
> +       spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +}
> +
> +static int jh7100_clk_enable(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
> +       return 0;
> +}
> +
> +static void jh7100_clk_disable(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
> +}
> +
> +static int jh7100_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +
> +       return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
> +}
> +
> +static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 div = jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
> +
> +       return div ? parent_rate / div : 0;
> +}
> +
> +static int jh7100_clk_determine_rate(struct clk_hw *hw,
> +                                    struct clk_rate_request *req)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       unsigned long parent = req->best_parent_rate;
> +       unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
> +       unsigned long div = min_t(unsigned long, DIV_ROUND_UP(parent, rate), clk->max_div);
> +       unsigned long result = parent / div;
> +
> +       /*
> +        * we want the result clamped by min_rate and max_rate if possible:
> +        * case 1: div hits the max divider value, which means it's less than
> +        * parent / rate, so the result is greater than rate and min_rate in
> +        * particular. we can't do anything about result > max_rate because the
> +        * divider doesn't go any further.
> +        * case 2: div = DIV_ROUND_UP(parent, rate) which means the result is
> +        * always lower or equal to rate and max_rate. however the result may
> +        * turn out lower than min_rate, but then the next higher rate is fine:
> +        *   div - 1 = ceil(parent / rate) - 1 < parent / rate
> +        * and thus
> +        *   min_rate <= rate < parent / (div - 1)
> +        */
> +       if (result < req->min_rate && div > 1)
> +               result = parent / (div - 1);
> +
> +       req->rate = result;
> +       return 0;
> +}
> +
> +static int jh7100_clk_set_rate(struct clk_hw *hw,
> +                              unsigned long rate,
> +                              unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       unsigned long div = clamp(DIV_ROUND_CLOSEST(parent_rate, rate),
> +                                 1UL, (unsigned long)clk->max_div);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
> +       return 0;
> +}
> +
> +static unsigned long jh7100_clk_frac_recalc_rate(struct clk_hw *hw,
> +                                                unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 reg = jh7100_clk_reg_get(clk);
> +       unsigned long div100 = 100 * (reg & JH7100_CLK_INT_MASK) +
> +                              ((reg & JH7100_CLK_FRAC_MASK) >> JH7100_CLK_FRAC_SHIFT);
> +
> +       return (div100 >= JH7100_CLK_FRAC_MIN) ? 100 * parent_rate / div100 : 0;
> +}
> +
> +static int jh7100_clk_frac_determine_rate(struct clk_hw *hw,
> +                                         struct clk_rate_request *req)
> +{
> +       unsigned long parent100 = 100 * req->best_parent_rate;
> +       unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
> +       unsigned long div100 = clamp(DIV_ROUND_CLOSEST(parent100, rate),
> +                                    JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
> +       unsigned long result = parent100 / div100;
> +
> +       /* clamp the result as in jh7100_clk_determine_rate() above */
> +       if (result > req->max_rate && div100 < JH7100_CLK_FRAC_MAX)
> +               result = parent100 / (div100 + 1);
> +       if (result < req->min_rate && div100 > JH7100_CLK_FRAC_MIN)
> +               result = parent100 / (div100 - 1);
> +
> +       req->rate = result;
> +       return 0;
> +}
> +
> +static int jh7100_clk_frac_set_rate(struct clk_hw *hw,
> +                                   unsigned long rate,
> +                                   unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       unsigned long div100 = clamp(DIV_ROUND_CLOSEST(100 * parent_rate, rate),
> +                                    JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
> +       u32 value = ((div100 % 100) << JH7100_CLK_FRAC_SHIFT) | (div100 / 100);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, value);
> +       return 0;
> +}
> +
> +static u8 jh7100_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value = jh7100_clk_reg_get(clk);
> +
> +       return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
> +}
> +
> +static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
> +       return 0;
> +}
> +
> +static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
> +                                        struct clk_rate_request *req)
> +{
> +       return clk_mux_determine_rate_flags(hw, req, 0);
> +}
> +
> +static int jh7100_clk_get_phase(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value = jh7100_clk_reg_get(clk);
> +
> +       return (value & JH7100_CLK_INVERT) ? 180 : 0;
> +}
> +
> +static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value;
> +
> +       if (degrees == 0)
> +               value = 0;
> +       else if (degrees == 180)
> +               value = JH7100_CLK_INVERT;
> +       else
> +               return -EINVAL;
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
> +       return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
> +{
> +       static const struct debugfs_reg32 jh7100_clk_reg = {
> +               .name = "CTRL",
> +               .offset = 0,
> +       };
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> +       struct debugfs_regset32 *regset;
> +
> +       regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
> +       if (!regset)
> +               return;
> +
> +       regset->regs = &jh7100_clk_reg;
> +       regset->nregs = 1;
> +       regset->base = priv->base + 4 * clk->idx;
> +
> +       debugfs_create_regset32("registers", 0400, dentry, regset);
> +}
> +#else
> +#define jh7100_clk_debug_init NULL
> +#endif
> +
> +static const struct clk_ops jh7100_clk_gate_ops = {
> +       .enable = jh7100_clk_enable,
> +       .disable = jh7100_clk_disable,
> +       .is_enabled = jh7100_clk_is_enabled,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_div_ops = {
> +       .recalc_rate = jh7100_clk_recalc_rate,
> +       .determine_rate = jh7100_clk_determine_rate,
> +       .set_rate = jh7100_clk_set_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_fdiv_ops = {
> +       .recalc_rate = jh7100_clk_frac_recalc_rate,
> +       .determine_rate = jh7100_clk_frac_determine_rate,
> +       .set_rate = jh7100_clk_frac_set_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_gdiv_ops = {
> +       .enable = jh7100_clk_enable,
> +       .disable = jh7100_clk_disable,
> +       .is_enabled = jh7100_clk_is_enabled,
> +       .recalc_rate = jh7100_clk_recalc_rate,
> +       .determine_rate = jh7100_clk_determine_rate,
> +       .set_rate = jh7100_clk_set_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_mux_ops = {
> +       .determine_rate = jh7100_clk_mux_determine_rate,
> +       .set_parent = jh7100_clk_set_parent,
> +       .get_parent = jh7100_clk_get_parent,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_gmux_ops = {
> +       .enable = jh7100_clk_enable,
> +       .disable = jh7100_clk_disable,
> +       .is_enabled = jh7100_clk_is_enabled,
> +       .determine_rate = jh7100_clk_mux_determine_rate,
> +       .set_parent = jh7100_clk_set_parent,
> +       .get_parent = jh7100_clk_get_parent,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_mdiv_ops = {
> +       .recalc_rate = jh7100_clk_recalc_rate,
> +       .determine_rate = jh7100_clk_determine_rate,
> +       .get_parent = jh7100_clk_get_parent,
> +       .set_parent = jh7100_clk_set_parent,
> +       .set_rate = jh7100_clk_set_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_gmd_ops = {
> +       .enable = jh7100_clk_enable,
> +       .disable = jh7100_clk_disable,
> +       .is_enabled = jh7100_clk_is_enabled,
> +       .recalc_rate = jh7100_clk_recalc_rate,
> +       .determine_rate = jh7100_clk_determine_rate,
> +       .get_parent = jh7100_clk_get_parent,
> +       .set_parent = jh7100_clk_set_parent,
> +       .set_rate = jh7100_clk_set_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_inv_ops = {
> +       .get_phase = jh7100_clk_get_phase,
> +       .set_phase = jh7100_clk_set_phase,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +const struct clk_ops *starfive_jh7100_clk_ops(u32 max)
> +{
> +       if (max & JH7100_CLK_DIV_MASK) {
> +               if (max & JH7100_CLK_MUX_MASK) {
> +                       if (max & JH7100_CLK_ENABLE)
> +                               return &jh7100_clk_gmd_ops;
> +                       return &jh7100_clk_mdiv_ops;
> +               }
> +               if (max & JH7100_CLK_ENABLE)
> +                       return &jh7100_clk_gdiv_ops;
> +               if (max == JH7100_CLK_FRAC_MAX)
> +                       return &jh7100_clk_fdiv_ops;
> +               return &jh7100_clk_div_ops;
> +       }
> +
> +       if (max & JH7100_CLK_MUX_MASK) {
> +               if (max & JH7100_CLK_ENABLE)
> +                       return &jh7100_clk_gmux_ops;
> +               return &jh7100_clk_mux_ops;
> +       }
> +
> +       if (max & JH7100_CLK_ENABLE)
> +               return &jh7100_clk_gate_ops;
> +
> +       return &jh7100_clk_inv_ops;
> +}
> +EXPORT_SYMBOL_GPL(starfive_jh7100_clk_ops);
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
