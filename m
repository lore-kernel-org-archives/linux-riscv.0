Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6482E77187
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUjwP6pZzjGD8FrdTV/dIVHaaoueDUyt94Az+mGC+0Q=; b=asdwdVVVXqXTEJ
	13/2RTssjCGtAduH7UzrvSUf8YJlJQIe7o7TIHzElp1cH0GVq6Sw/Rmule+RrkhJ2NMlB4yE/KgqW
	5rx0Nu1XE5jL9cvk1+WltGZPb7/sfP2VXqYkyVTgmo/4r5Csmsa4maVKtM2bAqjC4uyj6kBssb/Vj
	D1soLX3CNLRy039plLJ6vcmZcsQ2+49rwghDTPajEXy9FbghLccmnjv1+rrcSj27AQnYD6ld02c9K
	NZjtCEGrjYhLKuvhj1WaUhZZWWmOhKgqG8utC4GQn9bIu6tlbhK8jDboVFpAst8OCL66o7Og5jjCT
	8tMX6mszm0Min5k8j/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdxZ-0000000EiLV-1tQt;
	Tue, 17 Dec 2024 20:14:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdxW-0000000EiKW-3m9k
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 20:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95CD45C3B5C;
	Tue, 17 Dec 2024 20:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDA8C4CED3;
	Tue, 17 Dec 2024 20:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734466461;
	bh=MweSusvmpSasGV/UseE/q3hX9fVZz7NnDIapwx8PGXc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kco14Pmfa6vWvgkxbZcbU1u3shLfYzA13pbAwu+cKxLQ24IY40pWZ9ZQRgFh/nnD9
	 LFC919v8oh0bePLkVLz4PF55Q5DDOyS09wil4lsIbyvNphXLONToXtpdiiASQ5dy9R
	 lxGiNnUps8Z7Or1YjJgu4aVAsR9OV+iTJBbHEUK9VEVMn6Nh6ZZ7mpxk03x4sdl8NL
	 gTNkQkiC7F6OHT+Zbp5WSKOLjpkEAvDruI16tabuiq2OZNHt5BQhfBXLyhIlMSAaxf
	 jROnQj0iGsA7FApxoZ7gBUfWGi0ebWETj8flVwy9mW6cYcsOQAxpOcxmfnyiH1MOyZ
	 s/ar6zEFg7E/Q==
Message-ID: <37d32701e01df3ee457627cf971566dd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241216084817.373131-9-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com> <20241216084817.373131-9-apatel@ventanamicro.com>
Subject: Re: [RFC PATCH 8/8] clk: Add clock driver for the RISC-V RPMI clock service group
From: Stephen Boyd <sboyd@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Tue, 17 Dec 2024 12:14:19 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121423_035676_5A854D32 
X-CRM114-Status: GOOD (  22.60  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Anup Patel (2024-12-16 00:48:17)
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bf4bd45adc3a..95ef59e439bf 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -107,6 +107,7 @@ obj-$(CONFIG_COMMON_CLK_VC5)                += clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_VC7)           += clk-versaclock7.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)                += clk-wm831x.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)         += clk-xgene.o
> +obj-$(CONFIG_COMMON_CLK_RPMI)          += clk-rpmi.o

Keep this sorted by filename.

>  
>  # please keep this section sorted lexicographically by directory path name
>  obj-y                                  += actions/
> diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c
> new file mode 100644
> index 000000000000..ed8e32527d3d
> --- /dev/null
> +++ b/drivers/clk/clk-rpmi.c
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V MPXY Based Clock Driver
> + *
> + * Copyright (C) 2024 Ventana Micro Systems Ltd.
> + */
> +
> +#include <linux/io.h>

Is this include used?

> +#include <linux/mm.h>

Is this include used?

> +#include <linux/of.h>

Is this include used?

> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>

Did you mean mod_devicetable.h?

> +#include <linux/clk-provider.h>

Please sort includes alphabetically.

> +
> +#define RPMI_CLK_MAX_NUM_RATES         16
> +#define RPMI_CLK_NAME_LEN              16
> +
> +#define GET_RATE_LO_U32(rate_u64)      ((u32)rate_u64)
> +#define GET_RATE_HI_U32(rate_u64)      ((u32)((u64)(rate_u64) >> 32))

Use upper_32_bits() and lower_32_bits() instead.

> +#define GET_RATE_U64(hi_u32, lo_u32)   ((u64)(hi_u32) << 32 | (lo_u32))

I couldn't find a macro for this one which is kinda surprising.

> +
> +enum rpmi_clk_config {
> +       RPMI_CLK_DISABLE = 0,
> +       RPMI_CLK_ENABLE = 1,
> +};
> +
> +enum rpmi_clk_type {
> +       RPMI_CLK_DISCRETE = 0,
> +       RPMI_CLK_LINEAR = 1,
> +       RPMI_CLK_TYPE_MAX_IDX,
> +};
> +
> +struct rpmi_clk_context {
> +       struct device *dev;
> +       struct mbox_chan *chan;
> +       struct mbox_client client;
> +};
> +
> +union rpmi_clk_rate {
> +       struct {
> +               u32 lo;
> +               u32 hi;
> +       } discrete[RPMI_CLK_MAX_NUM_RATES];
> +       struct {
> +               u32 min_lo;
> +               u32 min_hi;
> +               u32 max_lo;
> +               u32 max_hi;
> +               u32 step_lo;
> +               u32 step_hi;
> +       } linear;
> +};
> +
> +union rpmi_clk_rates {
> +       u64 discrete[RPMI_CLK_MAX_NUM_RATES];
> +       struct {
> +               u64 min;
> +               u64 max;
> +               u64 step;
> +       } linear;
> +};
> +
> +struct rpmi_clk {
> +       struct rpmi_clk_context *context;
> +       u32 id;
> +       u32 num_rates;
> +       u32 transition_latency;
> +       enum rpmi_clk_type type;
> +       union rpmi_clk_rates *rates;
> +       char name[RPMI_CLK_NAME_LEN];
> +       struct clk_hw hw;
> +};
> +
> +#define to_rpmi_clk(clk)       container_of(clk, struct rpmi_clk, hw)
> +
> +struct rpmi_get_num_clocks_rx {
> +       s32 status;
> +       u32 num_clocks;
> +};
> +
> +struct rpmi_get_attrs_tx {
> +       u32 clkid;

Maybe just 'id', unless the spec calls this 'clkid'?

> +};
> +
> +struct rpmi_get_attrs_rx {
> +       s32 status;
> +       u32 flags;
> +       u32 num_rates;
> +       u32 transition_latency;
> +       char name[RPMI_CLK_NAME_LEN];
> +};
> +
> +struct rpmi_get_supp_rates_tx {
> +       u32 clkid;
> +       u32 clk_rate_idx;
> +};
> +
> +struct rpmi_get_supp_rates_rx {
> +       u32 status;
> +       u32 flags;
> +       u32 remaining;
> +       u32 returned;
> +       union rpmi_clk_rate rates;
> +};
> +
> +struct rpmi_get_rate_tx {
> +       u32 clkid;
> +};
> +
> +struct rpmi_get_rate_rx {
> +       u32 status;
> +       u32 lo;
> +       u32 hi;
> +};
> +
> +struct rpmi_set_rate_tx {
> +       u32 clkid;
> +       u32 flags;
> +       u32 lo;
> +       u32 hi;
> +};
> +
> +struct rpmi_set_rate_rx {
> +       u32 status;
> +};
> +
> +struct rpmi_set_config_tx {
> +       u32 clkid;
> +       u32 config;
> +};
> +
> +struct rpmi_set_config_rx {
> +       u32 status;
> +};
> +
> +static int rpmi_clk_get_num_clocks(struct rpmi_clk_context *context)
> +{
> +       struct rpmi_get_num_clocks_rx rx;
> +       struct rpmi_mbox_message msg;
> +       int ret;
> +
> +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_NUM_CLOCKS,
> +                                         NULL, 0, &rx, sizeof(rx));
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret)
> +               return ret;
> +       if (rx.status)
> +               return rpmi_to_linux_error(rx.status);
> +
> +       return rx.num_clocks;
> +}
> +
> +/**

This isn't kernel-doc so either remove the extra '*' or write
kernel-doc.

> + * Get the RPMI Clock Attributes.
> + * These attributes belong to a particular clock(clkid)
> + * which are different from the MPXY channel attributes.
> + */
> +static int rpmi_clk_get_attrs(u32 clkid, struct rpmi_clk *rpmi_clk)
> +{
> +       struct rpmi_clk_context *context = rpmi_clk->context;
> +       struct rpmi_mbox_message msg;
> +       struct rpmi_get_attrs_tx tx;
> +       struct rpmi_get_attrs_rx rx;
> +       u8 format;
> +       int ret;
> +
> +       tx.clkid = cpu_to_le32(clkid);

Run sparse and fix errors please. I assume that the mailbox interactions
need to have __le32 marked structs.

> +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_ATTRIBUTES,
> +                                         &tx, sizeof(tx), &rx, sizeof(rx));
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret)
> +               return ret;
> +       if (rx.status)
> +               return rpmi_to_linux_error(rx.status);
> +
> +       rpmi_clk->id = clkid;
> +       rpmi_clk->num_rates = rx.num_rates;
> +       rpmi_clk->transition_latency = rx.transition_latency;
> +       strscpy(rpmi_clk->name, rx.name, RPMI_CLK_NAME_LEN);
> +
> +       format = rx.flags & 1U;
> +       if (format >= RPMI_CLK_TYPE_MAX_IDX)

How is this possible?

> +               return -EINVAL;
> +
> +       rpmi_clk->type = format;
> +
> +       return 0;
> +}
> +
> +static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk *rpmi_clk)
> +{
> +       struct rpmi_clk_context *context = rpmi_clk->context;
> +       struct rpmi_get_supp_rates_tx tx;
> +       struct rpmi_get_supp_rates_rx rx;
> +       struct rpmi_mbox_message msg;
> +       size_t clk_rate_idx = 0;
> +       int ret, rateidx, j;
> +
> +       tx.clkid = cpu_to_le32(clkid);
> +       tx.clk_rate_idx = 0;
> +
> +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> +                                         &tx, sizeof(tx), &rx, sizeof(rx));
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret)
> +               return ret;
> +       if (rx.status)
> +               return rpmi_to_linux_error(rx.status);
> +       if (!rx.returned)
> +               return -EINVAL;
> +
> +       if (rpmi_clk->type == RPMI_CLK_DISCRETE) {
> +               for (rateidx = 0; rateidx < rx.returned; rateidx++) {
> +                       rpmi_clk->rates->discrete[rateidx] =
> +                                       GET_RATE_U64(rx.rates.discrete[rateidx].hi,
> +                                                    rx.rates.discrete[rateidx].lo);
> +               }
> +
> +               while (rx.remaining) {
> +                       clk_rate_idx += rx.returned;
> +                       tx.clk_rate_idx = clk_rate_idx;
> +
> +                       rpmi_mbox_init_send_with_response(&msg,
> +                                                         RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> +                                                         &tx, sizeof(tx), &rx, sizeof(rx));
> +                       ret = rpmi_mbox_send_message(context->chan, &msg);
> +                       if (ret)
> +                               return ret;
> +
> +                       for (j = 0; j < rx.returned; j++) {
> +                               if (rateidx >= (clk_rate_idx + rx.returned))
> +                                       break;
> +                               rpmi_clk->rates->discrete[rateidx++] =
> +                                       GET_RATE_U64(rx.rates.discrete[j].hi,
> +                                                    rx.rates.discrete[j].lo);
> +                       }
> +               }
> +       } else if (rpmi_clk->type == RPMI_CLK_LINEAR) {
> +               rpmi_clk->rates->linear.min =
> +                               GET_RATE_U64(rx.rates.linear.min_hi,
> +                                            rx.rates.linear.min_lo);
> +               rpmi_clk->rates->linear.max =
> +                               GET_RATE_U64(rx.rates.linear.max_hi,
> +                                            rx.rates.linear.max_lo);
> +               rpmi_clk->rates->linear.step =
> +                               GET_RATE_U64(rx.rates.linear.step_hi,
> +                                            rx.rates.linear.step_lo);
> +       }
> +
> +       return 0;
> +}
> +
> +static unsigned long rpmi_clk_recalc_rate(struct clk_hw *hw,
> +                                         unsigned long parent_rate)
> +{
> +       struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
> +       struct rpmi_clk_context *context = rpmi_clk->context;
> +       struct rpmi_mbox_message msg;
> +       struct rpmi_get_rate_tx tx;
> +       struct rpmi_get_rate_rx rx;
> +       int ret;
> +
> +       tx.clkid = cpu_to_le32(rpmi_clk->id);
> +
> +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_RATE,
> +                                         &tx, sizeof(tx), &rx, sizeof(rx));
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret)
> +               return ret;
> +       if (rx.status)
> +               return rx.status;
> +
> +       return GET_RATE_U64(rx.hi, rx.lo);
> +}
> +
> +static long rpmi_clk_round_rate(struct clk_hw *hw,
> +                               unsigned long rate,
> +                               unsigned long *parent_rate)
> +{
> +       struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
> +       u64 fmin, fmax, ftmp;
> +
> +       if (rpmi_clk->type == RPMI_CLK_DISCRETE)
> +               return rate;
> +
> +       fmin = rpmi_clk->rates->linear.min;
> +       fmax = rpmi_clk->rates->linear.max;
> +
> +       if (rate <= fmin)
> +               return fmin;
> +       else if (rate >=  fmax)
> +               return fmax;
> +
> +       ftmp = rate - fmin;
> +       ftmp += rpmi_clk->rates->linear.step - 1;
> +       do_div(ftmp, rpmi_clk->rates->linear.step);
> +
> +       return ftmp * rpmi_clk->rates->linear.step + fmin;
> +}
> +
> +static int rpmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +                            unsigned long parent_rate)
> +{
> +       struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
> +       struct rpmi_clk_context *context = rpmi_clk->context;
> +       struct rpmi_mbox_message msg;
> +       struct rpmi_set_rate_tx tx;
> +       struct rpmi_set_rate_rx rx;
> +       int ret;
> +
> +       tx.clkid = cpu_to_le32(rpmi_clk->id);
> +       tx.lo = cpu_to_le32(GET_RATE_LO_U32(rate));
> +       tx.hi = cpu_to_le32(GET_RATE_HI_U32(rate));
> +
> +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_RATE,
> +                                         &tx, sizeof(tx), &rx, sizeof(rx));
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret)
> +               return ret;
> +       if (rx.status)
> +               return rpmi_to_linux_error(rx.status);
> +
> +       return 0;
> +}
> +
> +static int rpmi_clk_enable(struct clk_hw *hw)
> +{
> +       struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
> +       struct rpmi_clk_context *context = rpmi_clk->context;
> +       struct rpmi_mbox_message msg;
> +       struct rpmi_set_config_tx tx;
> +       struct rpmi_set_config_rx rx;
> +       int ret;
> +
> +       tx.config = cpu_to_le32(RPMI_CLK_ENABLE);
> +       tx.clkid = cpu_to_le32(rpmi_clk->id);
> +
> +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_CONFIG,
> +                                         &tx, sizeof(tx), &rx, sizeof(rx));
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret)
> +               return ret;
> +       if (rx.status)
> +               return rpmi_to_linux_error(rx.status);
> +
> +       return 0;
> +}
> +
> +static void rpmi_clk_disable(struct clk_hw *hw)
> +{
> +       struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
> +       struct rpmi_clk_context *context = rpmi_clk->context;
> +       struct rpmi_mbox_message msg;
> +       struct rpmi_set_config_tx tx;
> +       struct rpmi_set_config_rx rx;
> +       int ret;
> +
> +       tx.config = cpu_to_le32(RPMI_CLK_DISABLE);
> +       tx.clkid = cpu_to_le32(rpmi_clk->id);
> +
> +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_CONFIG,
> +                                         &tx, sizeof(tx), &rx, sizeof(rx));
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret || rx.status)
> +               pr_err("Failed to disable clk-%u\n", rpmi_clk->id);
> +}
> +
> +static const struct clk_ops rpmi_clk_ops = {
> +       .recalc_rate = rpmi_clk_recalc_rate,
> +       .round_rate = rpmi_clk_round_rate,

Please implement determine_rate instead.

> +       .set_rate = rpmi_clk_set_rate,
> +       .prepare = rpmi_clk_enable,
> +       .unprepare = rpmi_clk_disable,
> +};
> +
> +static struct clk_hw *rpmi_clk_enumerate(struct rpmi_clk_context *context, u32 clkid)
> +{
> +       struct device *dev = context->dev;
> +       unsigned long min_rate, max_rate;
> +       union rpmi_clk_rates *rates;
> +       struct rpmi_clk *rpmi_clk;
> +       struct clk_init_data init;

Use init = { } to initialize everything to zero.

> +       struct clk_hw *clk_hw;
> +       int ret;
> +
> +       rates = devm_kzalloc(dev, sizeof(union rpmi_clk_rates), GFP_KERNEL);
> +       if (!rates)
> +               return ERR_PTR(-ENOMEM);
> +
> +       rpmi_clk = devm_kzalloc(dev, sizeof(struct rpmi_clk), GFP_KERNEL);
> +       if (!rpmi_clk)
> +               return ERR_PTR(-ENOMEM);
> +       rpmi_clk->context = context;
> +       rpmi_clk->rates = rates;
> +
> +       ret = rpmi_clk_get_attrs(clkid, rpmi_clk);
> +       if (ret) {
> +               dev_err(dev, "Failed to get clk-%u attributes\n", clkid);

Please use dev_err_probe() and helpers.

> +               return ERR_PTR(ret);
> +       }
> +
> +       ret = rpmi_clk_get_supported_rates(clkid, rpmi_clk);
> +       if (ret) {
> +               dev_err(dev, "Get supported rates failed for clk-%u, %d\n",
> +                       clkid, ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       init.flags = CLK_GET_RATE_NOCACHE;
> +       init.num_parents = 0;
> +       init.ops = &rpmi_clk_ops;
> +       init.name = rpmi_clk->name;
> +       clk_hw = &rpmi_clk->hw;
> +       clk_hw->init = &init;
> +
> +       ret = devm_clk_hw_register(dev, clk_hw);
> +       if (ret) {
> +               dev_err(dev, "Unable to register clk-%u\n", clkid);
> +               return ERR_PTR(ret);
> +       }
> +
> +       if (rpmi_clk->type == RPMI_CLK_DISCRETE) {
> +               min_rate = rpmi_clk->rates->discrete[0];
> +               max_rate = rpmi_clk->rates->discrete[rpmi_clk->num_rates -  1];
> +       } else {
> +               min_rate = rpmi_clk->rates->linear.min;
> +               max_rate = rpmi_clk->rates->linear.max;
> +       }
> +
> +       clk_hw_set_rate_range(clk_hw, min_rate, max_rate);
> +
> +       return NULL;

Why does it return NULL?

> +}
> +
> +static void rpmi_clk_receive_message(struct mbox_client *cl, void *msg)
> +{
> +       /* Nothing to do here. */
> +}
> +
> +static int rpmi_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct clk_hw_onecell_data *clk_data;
> +       struct rpmi_clk_context *context;
> +       struct rpmi_mbox_message msg;
> +       int ret, num_clocks, i;
> +       struct clk_hw *hw_ptr;
> +
> +       /* Allocate RPMI clock context */
> +       context = devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
> +       if (!context)
> +               return -ENOMEM;
> +       context->dev = dev;
> +       platform_set_drvdata(pdev, context);
> +
> +       /* Setup mailbox client */
> +       context->client.dev             = context->dev;
> +       context->client.rx_callback     = rpmi_clk_receive_message;
> +       context->client.tx_block        = false;
> +       context->client.knows_txdone    = true;
> +       context->client.tx_tout         = 0;
> +
> +       /* Request mailbox channel */
> +       context->chan = mbox_request_channel(&context->client, 0);
> +       if (IS_ERR(context->chan))
> +               return PTR_ERR(context->chan);
> +
> +       /* Validate RPMI specification version */
> +       rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret) {
> +               dev_err(dev, "Failed to get spec version\n");

Use dev_err_probe()

> +               goto fail_free_channel;
> +       }
> +       if (msg.attr.value < RPMI_MKVER(1, 0)) {
> +               dev_err(dev,
> +                       "msg protocol version mismatch, expected 0x%x, found 0x%x\n",
> +                       RPMI_MKVER(1, 0), msg.attr.value);
> +               ret = -EINVAL;
> +               goto fail_free_channel;
> +       }
> +
> +       /* Validate clock service group ID */
> +       rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_ID);
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret) {
> +               dev_err(dev, "Failed to get service group ID\n");
> +               goto fail_free_channel;
> +       }
> +       if (msg.attr.value != RPMI_SRVGRP_CLOCK) {
> +               dev_err(dev,
> +                       "service group match failed, expected 0x%x, found 0x%x\n",
> +                       RPMI_SRVGRP_CLOCK, msg.attr.value);
> +               ret = -EINVAL;
> +               goto fail_free_channel;
> +       }
> +
> +       /* Validate clock service group version */
> +       rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_VERSION);
> +       ret = rpmi_mbox_send_message(context->chan, &msg);
> +       if (ret) {
> +               dev_err(dev, "Failed to get service group version\n");
> +               goto fail_free_channel;
> +       }
> +       if (msg.attr.value < RPMI_MKVER(1, 0)) {
> +               dev_err(dev,
> +                       "service group version failed, expected 0x%x, found 0x%x\n",
> +                       RPMI_MKVER(1, 0), msg.attr.value);
> +               ret = -EINVAL;
> +               goto fail_free_channel;
> +       }
> +
> +       /* Find-out number of clocks */
> +       num_clocks = rpmi_clk_get_num_clocks(context);
> +       if (!num_clocks) {
> +               dev_err(dev, "No clocks found\n");
> +               ret = -ENODEV;
> +               goto fail_free_channel;
> +       }
> +
> +       /* Allocate clock data */
> +       clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, num_clocks),
> +                               GFP_KERNEL);
> +       if (!clk_data) {
> +               ret = -ENOMEM;
> +               goto fail_free_channel;
> +       }
> +       clk_data->num = num_clocks;
> +
> +       /* Setup clock data */
> +       for (i = 0; i < clk_data->num; i++) {
> +               hw_ptr = rpmi_clk_enumerate(context, i);
> +               if (IS_ERR(hw_ptr)) {
> +                       dev_err(dev, "failed to register clk-%d\n", i);
> +                       ret = PTR_ERR(hw_ptr);
> +                       goto fail_free_channel;
> +               }
> +               clk_data->hws[i] = hw_ptr;
> +       }
> +
> +       /* Register clock HW provider */
> +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +       if (ret) {
> +               dev_err(dev, "failed to register clock HW provider\n");
> +               goto fail_free_channel;
> +       }
> +
> +       dev_info(dev, "clk HW provider registered with %d clocks\n",
> +                num_clocks);

Remove this info print please.

> +       return 0;
> +
> +fail_free_channel:
> +       mbox_free_channel(context->chan);
> +       return ret;
> +}
> +
> +static void rpmi_clk_remove(struct platform_device *pdev)
> +{
> +       struct rpmi_clk_context *context = platform_get_drvdata(pdev);
> +
> +       mbox_free_channel(context->chan);
> +}
> +
> +static const struct of_device_id rpmi_clk_of_match[] = {
> +       { .compatible = "riscv,rpmi-clock" },
> +       { },

Nitpick: Drop comma so nothing can come after.

> +};
> +

Nitpick: Drop extra newline.

> +MODULE_DEVICE_TABLE(of, rpmi_clk_of_match);
> +
> +static struct platform_driver rpmi_clk_driver = {
> +       .driver = {
> +               .name = "riscv-rpmi-clock",
> +               .of_match_table = rpmi_clk_of_match,
> +       },
> +       .probe = rpmi_clk_probe,
> +       .remove = rpmi_clk_remove,
> +};
> +module_platform_driver(rpmi_clk_driver);
> +
> +MODULE_AUTHOR("Rahul Pathak <rpathak@ventanamicro.com>");
> +MODULE_DESCRIPTION("Clock Driver based on RPMI message protocol");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
> index 8f4b3a0edbce..4e9478c4c0a3 100644
> --- a/include/linux/mailbox/riscv-rpmi-message.h
> +++ b/include/linux/mailbox/riscv-rpmi-message.h
> @@ -89,6 +89,22 @@ static inline int rpmi_to_linux_error(int rpmi_error)
>         }
>  }
>  
> +/** RPMI service group IDs */
> +#define RPMI_SRVGRP_CLOCK              0x00007
> +
> +/** RPMI clock service IDs */
> +enum rpmi_clock_service_id {
> +       RPMI_CLK_SRV_ENABLE_NOTIFICATION = 0x01,
> +       RPMI_CLK_SRV_GET_NUM_CLOCKS = 0x02,
> +       RPMI_CLK_SRV_GET_ATTRIBUTES = 0x03,
> +       RPMI_CLK_SRV_GET_SUPPORTED_RATES = 0x04,
> +       RPMI_CLK_SRV_SET_CONFIG = 0x05,
> +       RPMI_CLK_SRV_GET_CONFIG = 0x06,
> +       RPMI_CLK_SRV_SET_RATE = 0x07,
> +       RPMI_CLK_SRV_GET_RATE = 0x08,
> +       RPMI_CLK_SRV_ID_MAX_COUNT,
> +};
> +

What is the benefit of the enum vs. just having a #define?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
