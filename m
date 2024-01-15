Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8ACC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XrJBFLSYtlHSVkF5SOc2N7CzfmbVv3mtsOFKq4P40vg=; b=ninC3aq/hxboxBzwFfdh3wh/ck
	e3re28Ir0QM6U+zS12oQMbXmKt0fqSuMTt0w8jSKV2PP871LE0YPlN8oiP9xfqGgFI08MXwVfZhw8
	DAH86Dq4AKPUDTmQ6QF8pcqX8Qv5bqzHuuqY14xH4o25/i9wR6QPpcp5n17J2T/8V1GYvj1zYKW4y
	YeYSDKgYG3H7HTPCNhAN7veeAzPSTRu95ig9onDrIYNt3uYsyf61p3TPE5sVRpb/8tjlyNaMimqLo
	8poVM/stleYWAPho4elUc0h3vFDL51EdPxoqlcGOUMJtut6jWRxwKTr0R6nmxOdK+Tgi2b45+C4fX
	pkXvrPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJdj-008TsL-1i;
	Mon, 15 Jan 2024 09:52:19 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJdf-008Ton-2c
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:52:18 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B50A4103A
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 09:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1705312330;
	bh=jI+5qM0nAtwQLs5qbWPIA0JCeb2TgRx9NNnpwhxsqJI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EEdfps8/yFcDR1DZ4FnrgMgxoABrzMjXGlIyeEK+JKMcaY7xJ60aIZ+PJCR2hv4WR
	 dzvH3SppR2H1tcpfXYR/3VVA1VVnTpTpg1DyhlxmLgAOClFgnSdO9TEj8XpnCU052w
	 M0vvwBTrcyZX2jYgtkoprU5sprQsKqS/wWRXiku37RWIUgrzcVYs+k/AIpgK36oE0j
	 pXtVnR7SJn47SsnECfltA+3sk6BktY5pW99YC5gyt8f1gTETnWSJrvjtGj+SIT5JPK
	 VaTTWYLZlTxiEoNPfPR3EobWUoj21qasRxNK6G2NoMlTVO02oHAiyrd0r5RoIoO/68
	 si6OC3Lbbr6/w==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429aeece273so85467751cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 01:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705312329; x=1705917129;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jI+5qM0nAtwQLs5qbWPIA0JCeb2TgRx9NNnpwhxsqJI=;
        b=L5qZjENOBlZzfrMuVZ9/B5SzXJM1QdYBfhJfEKecYlJvT5sHeIeEAzdzqg2NfSzN4o
         aISdlz6zQFBF6WHPLjwUfqMuf8BRUnwlFK4FQl43TGTZ7Ym1NNKFh22YT7daD8JBwzfu
         y4j8CE3iWrQ4d8w4NS+u6AsYECxncPWgkGcJo8gyhC2NXvWP4xKCu6p3P+uCbfICztXs
         QLnNgYrtBviuKjG+XnJlzAUvYaYlZO+v5q6chaFhvoJJ5kyhlqf8vH4doBUuMX1X+twb
         FaeBnparAFXBDY/+JDmTISQ20IKLY0nDgVoczVKHV718Qwti4QwXlUEntpm1tflkCjP6
         Mmsw==
X-Gm-Message-State: AOJu0YxB2Jk1oSY7dVyOx1AcT96u2U+7jXbG3mbL+T/xz4HOPqZdZ8GN
	byfF3bx6taLscu+L9Vup9ZJgA/P/eESzzpX37a4EkW/zNVTV1reitRayw2AhNxc+J4IjR2ouMjl
	1n20bZQSPpHOxHjBCznE045UmrXGZJ2WRL3y7yA3/zOYRvwl0osSXnb9SNKT2b41a4eqS
X-Received: by 2002:a05:622a:4:b0:429:92b7:cba8 with SMTP id x4-20020a05622a000400b0042992b7cba8mr6911272qtw.126.1705312329282;
        Mon, 15 Jan 2024 01:52:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/AkHGDi3+QdcHLA4pT8OqYSnCIbpWhNwAV/2HQPH18KFSKj5wXqrL4g77KUUN4x7fOWeNOuL3M+tUhwE0B8k=
X-Received: by 2002:a05:622a:4:b0:429:92b7:cba8 with SMTP id
 x4-20020a05622a000400b0042992b7cba8mr6911258qtw.126.1705312328988; Mon, 15
 Jan 2024 01:52:08 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jan 2024 04:52:08 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240110-clk-th1520-v1-3-8b0682567984@tenstorrent.com>
References: <20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com> <20240110-clk-th1520-v1-3-8b0682567984@tenstorrent.com>
Mime-Version: 1.0
Date: Mon, 15 Jan 2024 04:52:08 -0500
Message-ID: <CAJM55Z8_nTu__iSvSTbo719SPvtGcd6jKrK=UJ6YwLj1jCk2_w@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] clk: thead: add support for T-HEAD TH1520 AP clocks
To: Drew Fustini <dfustini@tenstorrent.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Han Gao <gaohan@iscas.ac.cn>, 
	Xi Ruoyao <xry111@xry111.site>, Robert Nelson <robertcnelson@beagleboard.org>, 
	Jason Kridner <jkridner@beagleboard.org>, Drew Fustini <drew@tenstorrent.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_015216_277777_DE8512E5 
X-CRM114-Status: GOOD (  24.39  )
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

Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Add support for the AP sub system clock controller in the T-HEAD TH1520.
> This include CPU, DPU, GMAC and TEE PLLs.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> Co-developed-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [rebased on linux-next-20240110]
> [fixed checkpatch warnings]
> [corrected npu_clk enable bit and c910_i0_clk reg]
> [revised commit description]
> Signed-off-by: Drew Fustini <drew@tenstorrent.org>
> ---
>  MAINTAINERS                       |    1 +
>  drivers/clk/Kconfig               |    1 +
>  drivers/clk/Makefile              |    1 +
>  drivers/clk/thead/Kconfig         |   12 +
>  drivers/clk/thead/Makefile        |    2 +
>  drivers/clk/thead/clk-th1520-ap.c | 1018 +++++++++++++++++++++++++++++++++++++
>  6 files changed, 1035 insertions(+)
>
...
> --- /dev/null
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -0,0 +1,1018 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
> + *  Authors: Yangtao Li <frank.li@vivo.com>
> + */
> +
> +#include <dt-bindings/clock/thead,th1520-clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct ccu_internal {
> +	u8	shift;
> +	u8	width;
> +};
> +
> +struct ccu_div_internal {
> +	u8	shift;
> +	u8	width;
> +	u32	flags;
> +};
> +
> +struct ccu_common {
> +	struct regmap	*map;
> +	u16		reg;
> +	struct clk_hw	hw;
> +};
> +
> +struct ccu_mux {
> +	struct ccu_internal	mux;
> +	struct ccu_common	common;
> +};
> +
> +struct ccu_gate {
> +	u32			enable;
> +	struct ccu_common	common;
> +};
> +
> +struct ccu_div {
> +	u32			enable;
> +	struct ccu_div_internal	div;
> +	struct ccu_internal	mux;
> +	struct ccu_common	common;
> +};
> +
> +/*
> + * struct ccu_mdiv - Definition of an M-D-I-V clock
> + *
> + * Clocks based on the formula (parent * M) / (D * I * V)
> + */
> +struct ccu_mdiv {
> +	struct ccu_internal	m;
> +	struct ccu_internal	d;
> +	struct ccu_internal	i;
> +	struct ccu_internal	v;
> +	struct ccu_common	common;
> +};
> [...]
> +static unsigned long ccu_mdiv_recalc_rate(struct clk_hw *hw,
> +					  unsigned long parent_rate)
> +{
> +	struct ccu_mdiv *mdiv = hw_to_ccu_mdiv(hw);
> +	unsigned long div, rate = parent_rate;
> +	unsigned int m, d, i, v, val;
> +
> +	regmap_read(mdiv->common.map, mdiv->common.reg, &val);
> +
> +	m = val >> mdiv->m.shift;
> +	m &= GENMASK(mdiv->m.width - 1, 0);
> +
> +	d = val >> mdiv->d.shift;
> +	d &= GENMASK(mdiv->d.width - 1, 0);
> +
> +	i = val >> mdiv->i.shift;
> +	i &= GENMASK(mdiv->i.width - 1, 0);
> +
> +	v = val >> mdiv->v.shift;
> +	v &= GENMASK(mdiv->v.width - 1, 0);
> +
> +	rate = parent_rate * m;
> +	div = d * i * v;
> +	do_div(rate, div);
> +
> +	return rate;
> +}

Hi Drew,

I don't think this is right. There is an input predivider that's not handled
here, and then the PLL multiplies the input frequency and outputs "Foutvco".
Then this is followed by a post divider to produce "Foutpostdiv".
Some clocks derive directly from the "Foutvco" so this should really be
modelled as two different clocks. Also what's called D and I are the
postdivider but V is an optional fractional divider.
All in all I think it should be something like this:

#define TH1520_PLL_CFG0         0x0
#define TH1520_PLL_POSTDIV2     GENMASK(26, 24)
#define TH1520_PLL_POSTDIV1     GENMASK(22, 20)
#define TH1520_PLL_FBDIV        GENMASK(19, 8)
#define TH1520_PLL_REFDIV       GENMASK(5, 0)
#define TH1520_PLL_CFG1         0x4
#define TH1520_PLL_BYPASS       BIT(30)
#define TH1520_PLL_RST          BIT(29)
#define TH1520_PLL_POSTDIVPD    BIT(28)
#define TH1520_PLL_4PHASEPD     BIT(27)
#define TH1520_PLL_DACPD        BIT(25)
#define TH1520_PLL_DSMPD        BIT(24)
#define TH1520_PLL_FRAC         GENMASK(23, 0)
#define TH1520_PLL_FRAC_BITS    24
#define TH1520_PLL_CFG2         0x8
#define TH1520_PLL_CFG3         0xc

static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
                                                unsigned long parent_rate)
{
        struct th1520_pll *pll = th1520_pll_from_vco(hw);
        void __iomem *cfg0reg = pll->base + TH1520_PLL_CFG0;
        void __iomem *cfg1reg = pll->base + TH1520_PLL_CFG1;
        unsigned long rate, mul;
        u32 cfg0, cfg1, div;

        scoped_guard(spinlock_irqsave, pll->lock) {
                cfg0 = readl_relaxed(cfg0reg);
                cfg1 = readl_relaxed(cfg1reg);
        }

        mul = FIELD_GET(TH1520_PLL_FBDIV, cfg0);
        div = FIELD_GET(TH1520_PLL_REFDIV, cfg0);
        if (!(cfg1 & TH1520_PLL_DSMPD)) {
                mul <<= TH1520_PLL_FRAC_BITS;
                mul += FIELD_GET(TH1520_PLL_FRAC, cfg1);
                div <<= TH1520_PLL_FRAC_BITS;
        }
        rate = parent_rate * mul;
        do_div(rate, div);
        return rate;
}

static unsigned long th1520_pll_postdiv_recalc_rate(struct clk_hw *hw,
                                                    unsigned long parent_rate)
{
        struct th1520_pll *pll = th1520_pll_from_postdiv(hw);
        void __iomem *cfg0reg = pll->base + TH1520_PLL_CFG0;
        void __iomem *cfg1reg = pll->base + TH1520_PLL_CFG1;
        unsigned long rate = parent_rate;
        u32 cfg0, cfg1;

        scoped_guard(spinlock_irqsave, pll->lock) {
                cfg0 = readl_relaxed(cfg0reg);
                cfg1 = readl_relaxed(cfg1reg);
        }

        if (cfg1 & TH1520_PLL_BYPASS)
                return rate;

        do_div(rate,
               FIELD_GET(TH1520_PLL_POSTDIV1, cfg0) *
               FIELD_GET(TH1520_PLL_POSTDIV2, cfg0));
        return rate;
}

(Here D = POSTDIV1, I = POSTDIV2 and V = FRAC)

However, have a look at Chen Wang's series at

https://lore.kernel.org/linux-riscv/cdb7aed766aa6411e61ec25a6f1cb22a1aef4a21.1704694903.git.unicorn_wang@outlook.com/

The PLL implementation there is very similar to the TH1520. At first I thought
it was exactly the same, but on closer inspection it seems like the bitfields
are arranged a little different unfortunately.

The rest of the clocks in this driver seem to be generic gate and mux
implementations that should probably be replaced by the versions in Linux
already. Eg. devm_clk_hw_register_gate*() and devm_clk_hw_register_mux*().

Lastly this only implements the clocks in the AP_SUBSYS memory range, but there
are also AON_SUBSYS, DDR_SUBSYS, MISC_SUBSYS, VI_SUBSYS, VO_SUBSYS, VP_SUBSYS,
DSP_SUBSYS and AUDIO_SUBSYS. Upstreaming one of them first in fine, but make
sure to consider how the others should be added.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
