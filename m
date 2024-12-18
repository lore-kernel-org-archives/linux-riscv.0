Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C1EE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fPAg2/HkUTtC8zYxYpbr7gzDu+L9A4Lpf2JuoxhQ9w=; b=S3A4pdpM4aMBvG
	BAhRVtw3bDdrmnMalymT1QZO1P/utQigEZ+m15bqjGzrXq8WNN2X23K44Se5Ce2qLcD4wiMzMt/B3
	St4V58TGYbE5kfRlfO5fhKnceQUA6dnGlrYuEPcibg4hp7leG7EHguPSP7g8Z8WwRTA+GlaL1X4r+
	qNPXzGXrzU0/bn0bre1hViqiSBegLD7yrfS8EfyeDFSptgujM0uCOHy/iRxeBh1zb3HuK82OFL+pv
	x79bWjlKrrb5guth51qd/gf6UHLeG3tzmC8+wsi/7SyOtdioqkxX02iEArdjxt77taOCe5mAomSt8
	n7Q0bVtxOw92xG7FWMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpxl-0000000G0Jl-097s;
	Wed, 18 Dec 2024 09:03:25 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpxi-0000000G0IL-3cxJ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 09:03:24 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7b15467f383so568932685a.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 01:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734512601; x=1735117401; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRdLdfLHCtTxVWya9q7QwJ93naqGXr0sXIFf7mt5Vkg=;
        b=htNrnd14EVpex1hYOoaMMfqupGc5gMIt1+BA4S5Gp9Teu+eb9G1xkYLa6pjF9YwVVJ
         8OW+HuZnrqpq0drAxlcsMkdJ0xY1vUCX8DMczzHmpc1qWcNYX08Dwy20ukE373ITvq7h
         OPGH7pGftfZz4EJwNsbX0Omu+1Zrt85aJ8t5nspzLFRVFe//LOj/u+5xQGQILBqkqloG
         z/FW/cc6q0WdSE9FIMqoQYvH8dvHvn1XDsXD7Sl4jRw4L4Wl+4qtAp4qJq52ywQLi0p+
         aE/i2I+2qIGaOXz+rvpIpb3jtVrQqja1GiTFwo5NalXFnuocU6C012DcVeHKVHMHP+CF
         NQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734512601; x=1735117401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRdLdfLHCtTxVWya9q7QwJ93naqGXr0sXIFf7mt5Vkg=;
        b=IrBX4IElSVz5vmnFX+88sI2Q9UKzAM83gNDyCrdqc1DXuqQY42nO0clDU/qR04BYGQ
         kDwjxNr3hKpI9hSxm0mujtZJ/8Tc/xWdyIGSGmP5g5JFukd4uwrXuF1ih+CR60dCCzTG
         zQPmKrykR0+7HuCRATy6B/etLaf02k0XZzBno1EJTOfI6TiiS1UTaGy0QIiNQrrZnMXj
         QELZDHS4eF5ybYtzrMahbD3FgoEhIC0pH35PtvTH0VLh8lIBNBHfQxt7dUYVLqHygRkg
         D9BwlObiTcaggx+Bssrzi3s7NA9lmGSq96WruK+NcEd8mMquQRNoqUBKjjTomXsoViky
         YbQw==
X-Forwarded-Encrypted: i=1; AJvYcCWuBX7ZBitNo+aUoWVu7NsKf1P+/5yepNFXFxMq4WYFLT/QsCaQZtFyxX7Q+ARf0lCDb8K5WoEh84JCgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFNJrbhjAroOZ62k21BKqwpQZqvYV1nLGlLAzgNOLHh0hCnqyX
	Bsb/Xaz7iAhxm1PuyFAibNSmNQ7LNMVEMABzjwe2CrtrKk2ULVhB
X-Gm-Gg: ASbGncu8+6lo2QJQh/8qwuJe4EEnj2BcppStb7cTlcn/q+nSi+0cdgzG6KIWGiKC5/k
	nyg/3pFS+3RWYTuLeQTIqVCzj+l0OO6bXSOgNib6U8DSiV1rLkbfDFdAxhUL/tvhK8hPXqNN8Ow
	MgOFpxZz5//d8LLS1vzY2rghatxB5MLcxZTvJ9JrHxYOTNaWaaMZog0LkDQomvfrq9rMm3Nk2RN
	+V5r61Ixt8sMt2aF0PfwCnUAuPBy9xX
X-Google-Smtp-Source: AGHT+IHIh+isE6oKIPishyr/XKqQDlHJnnTXjbRPJxsMVMeZi6BTkAZUEnn6VdDa/2khagRhtmmCIQ==
X-Received: by 2002:a05:620a:1915:b0:7b6:da92:fcd0 with SMTP id af79cd13be357-7b8636e88bdmr234217885a.8.1734512600956;
        Wed, 18 Dec 2024 01:03:20 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048bd90dsm404115785a.87.2024.12.18.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:03:20 -0800 (PST)
Date: Wed, 18 Dec 2024 17:03:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <3fhnjybnrrixse5h6epfp2aj7pk3uo6fk34gvsqkku6sofir6r@t3ofcy5xure6>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <20241126143125.9980-7-heylenay@4d2.org>
 <xswwcu4htkls4rdaoccrlyotup4rxjma332wewyqkmctezouxl@oplcxg5nglty>
 <20241218072727-GYA3467167@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218072727-GYA3467167@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010322_929993_AAE3A219 
X-CRM114-Status: GOOD (  37.15  )
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

On Wed, Dec 18, 2024 at 03:27:27PM +0800, Yixun Lan wrote:
> On 14:47 Sun 08 Dec     , Inochi Amaoto wrote:
> > On Tue, Nov 26, 2024 at 02:31:28PM +0000, Haylen Chu wrote:
> > > The clock tree of K1 SoC contains three main types of clock hardware
> > > (PLL/DDN/MIX) and is managed by several independent controllers in
> > > different SoC parts (APBC, APBS and etc.), thus different compatible
> > > strings are added to distinguish them.
> > > 
> > > Some controllers may share IO region with reset controller and other low
> > > speed peripherals like watchdog, so all register operations are done
> > > through regmap to avoid competition.
> > > 
> > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > ---
> > >  drivers/clk/Kconfig               |    1 +
> > >  drivers/clk/Makefile              |    1 +
> > >  drivers/clk/spacemit/Kconfig      |   20 +
> > >  drivers/clk/spacemit/Makefile     |    5 +
> > >  drivers/clk/spacemit/ccu-k1.c     | 1747 +++++++++++++++++++++++++++++
> > >  drivers/clk/spacemit/ccu_common.h |   62 +
> > >  drivers/clk/spacemit/ccu_ddn.c    |  146 +++
> > >  drivers/clk/spacemit/ccu_ddn.h    |   85 ++
> > >  drivers/clk/spacemit/ccu_mix.c    |  296 +++++
> > >  drivers/clk/spacemit/ccu_mix.h    |  336 ++++++
> > >  drivers/clk/spacemit/ccu_pll.c    |  198 ++++
> > >  drivers/clk/spacemit/ccu_pll.h    |   80 ++
> ....snip
> > > diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> > > new file mode 100644
> > > index 000000000000..de343405fcc7
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/ccu_mix.c
> > > @@ -0,0 +1,296 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Spacemit clock type mix(div/mux/gate/factor)
> > > + *
> > > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +
> > > +#include "ccu_mix.h"
> > > +
> > > +#define MIX_TIMEOUT	10000
> > > +
> > > +#define mix_hwparam_in_sel(c) \
> > > +	((c)->reg_type == CLK_DIV_TYPE_2REG_NOFC_V3 || \
> > > +	 (c)->reg_type == CLK_DIV_TYPE_2REG_FC_V4)
> > > +
> > 
> > > +static void ccu_mix_disable(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_gate_config *gate = mix->gate;
> > > +
> > > +	if (!gate)
> > > +		return;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, gate->gate_mask, gate->val_disable);
> > > +	else
> > > +		ccu_update(ctrl, common, gate->gate_mask, gate->val_disable);
> > > +}
> > > +
> > > +static int ccu_mix_enable(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_gate_config *gate = mix->gate;
> > > +	u32 val_enable, mask;
> > > +	u32 tmp;
> > > +
> > > +	if (!gate)
> > > +		return 0;
> > > +
> > > +	val_enable	= gate->val_enable;
> > > +	mask		= gate->gate_mask;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, mask, val_enable);
> > > +	else
> > > +		ccu_update(ctrl, common, mask, val_enable);
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_2REG_NOFC_V3 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4)
> > > +		return ccu_poll(sel, common, tmp, (tmp & mask) == val_enable,
> > > +				10, MIX_TIMEOUT);
> > > +	else
> > > +		return ccu_poll(ctrl, common, tmp, (tmp & mask) == val_enable,
> > > +				10, MIX_TIMEOUT);
> > > +}
> > > +
> > > +static int ccu_mix_is_enabled(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_gate_config *gate = mix->gate;
> > > +	u32 tmp;
> > > +
> > > +	if (!gate)
> > > +		return 1;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &tmp);
> > > +	else
> > > +		ccu_read(ctrl, common, &tmp);
> > > +
> > > +	return (tmp & gate->gate_mask) == gate->val_enable;
> > > +}
> > > +
> > > +static unsigned long ccu_mix_recalc_rate(struct clk_hw *hw,
> > > +					unsigned long parent_rate)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_div_config *div = mix->div;
> > > +	unsigned long val;
> > > +	u32 reg;
> > > +
> > > +	if (!div) {
> > > +		if (mix->factor)
> > > +			return parent_rate * mix->factor->mul / mix->factor->div;
> > > +
> > > +		return parent_rate;
> > > +	}
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &reg);
> > > +	else
> > > +		ccu_read(ctrl, common, &reg);
> > > +
> > > +	val = reg >> div->shift;
> > > +	val &= (1 << div->width) - 1;
> > > +
> > > +	val = divider_recalc_rate(hw, parent_rate, val, div->table,
> > > +				  div->flags, div->width);
> > > +
> > > +	return val;
> > > +}
> > 
> > I think you should distinguish these muxs, it is not good to
> > use mix_hwparam_in_sel everywhere. There are two types of mux.
> > 
> > > +
> > > +
> > 
> > Double empty line here, you should run checkpatch.
> > 
> > > +static int ccu_mix_trigger_fc(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	unsigned int val = 0;
> > > +	int ret = 0;
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_DIV_V5 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_MUX_V6) {
> > > +		ccu_update(ctrl, common, common->fc, common->fc);
> > > +
> > > +		ret = ccu_poll(ctrl, common, val, !(val & common->fc),
> > > +			       5, MIX_TIMEOUT);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int ccu_mix_determine_rate(struct clk_hw *hw,
> > > +				  struct clk_rate_request *req)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > 
> > Why a empty determine_rate function?
> > 
> > > +static unsigned long
> > > +ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate, u32 *mux_val,
> > > +		       u32 *div_val)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_div_config *div = mix->div ? mix->div : NULL;
> > > +	struct clk_hw *parent;
> > > +	unsigned long parent_rate = 0, best_rate = 0;
> > > +	u32 i, j, div_max;
> > > +
> > > +	for (i = 0; i < common->num_parents; i++) {
> > > +		parent = clk_hw_get_parent_by_index(hw, i);
> > > +		if (!parent)
> > > +			continue;
> > > +
> > > +		parent_rate = clk_hw_get_rate(parent);
> > > +
> > > +		if (div)
> > > +			div_max = 1 << div->width;
> > > +		else
> > > +			div_max = 1;
> > > +
> > > +		for (j = 1; j <= div_max; j++) {
> > > +			if (abs(parent_rate/j - rate) < abs(best_rate - rate)) {
> > > +				best_rate = DIV_ROUND_UP_ULL(parent_rate, j);
> > > +				*mux_val = i;
> > > +				*div_val = j - 1;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	return best_rate;
> > > +}
> > > +
> > > +static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +			   unsigned long parent_rate)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_div_config *div = mix->div;
> > > +	struct ccu_mux_config *mux = mix->mux;
> > > +	u32 cur_mux, cur_div, mux_val = 0, div_val = 0;
> > > +	unsigned long best_rate = 0;
> > > +	int ret = 0, tmp = 0;
> > > +
> > > +	if (!div && !mux)
> > > +		return 0;
> > > +
> > > +	best_rate = ccu_mix_calc_best_rate(hw, rate, &mux_val, &div_val);
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &tmp);
> > > +	else
> > > +		ccu_read(ctrl, common, &tmp);
> > > +
> > > +	if (mux) {
> > > +		cur_mux = tmp >> mux->shift;
> > > +		cur_mux &= (1 << mux->width) - 1;
> > > +
> > > +		if (cur_mux != mux_val)
> > > +			clk_hw_set_parent(hw, clk_hw_get_parent_by_index(hw, mux_val));
> > > +	}
> > > +
> > > +	if (div) {
> > > +		cur_div = tmp >> div->shift;
> > > +		cur_div &= (1 << div->width) - 1;
> > > +
> > > +		if (cur_div == div_val)
> > > +			return 0;
> > > +	} else {
> > > +		return 0;
> > > +	}
> > > +
> > > +	tmp = GENMASK(div->width + div->shift - 1, div->shift);
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, tmp, div_val << div->shift);
> > > +	else
> > > +		ccu_update(ctrl, common, tmp, div_val << div->shift);
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_DIV_V5)
> > > +		ret = ccu_mix_trigger_fc(hw);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static u8 ccu_mix_get_parent(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_mux_config *mux = mix->mux;
> > > +	u32 reg;
> > > +	u8 parent;
> > > +
> > > +	if (!mux)
> > > +		return 0;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &reg);
> > > +	else
> > > +		ccu_read(ctrl, common, &reg);
> > > +
> > > +	parent = reg >> mux->shift;
> > > +	parent &= (1 << mux->width) - 1;
> > > +
> > > +	if (mux->table) {
> > > +		int num_parents = clk_hw_get_num_parents(&common->hw);
> > > +		int i;
> > > +
> > > +		for (i = 0; i < num_parents; i++)
> > > +			if (mux->table[i] == parent)
> > > +				return i;
> > > +	}
> > > +
> > > +	return parent;
> > > +}
> > > +
> > > +static int ccu_mix_set_parent(struct clk_hw *hw, u8 index)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_mux_config *mux = mix->mux;
> > > +	int ret = 0;
> > > +	u32 mask;
> > > +
> > > +	if (!mux)
> > > +		return 0;
> > > +
> > > +	if (mux->table)
> > > +		index = mux->table[index];
> > > +
> > > +	mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, mask, index << mux->shift);
> > > +	else
> > > +		ccu_update(ctrl, common, mask, index << mux->shift);
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_MUX_V6)
> > > +		ret = ccu_mix_trigger_fc(hw);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +const struct clk_ops spacemit_ccu_mix_ops = {
> > > +	.disable	 = ccu_mix_disable,
> > > +	.enable		 = ccu_mix_enable,
> > > +	.is_enabled	 = ccu_mix_is_enabled,
> > > +	.get_parent	 = ccu_mix_get_parent,
> > > +	.set_parent	 = ccu_mix_set_parent,
> > > +	.determine_rate  = ccu_mix_determine_rate,
> > > +	.recalc_rate	 = ccu_mix_recalc_rate,
> > > +	.set_rate	 = ccu_mix_set_rate,
> > > +};
> > 
> > I think you should separate the clock into different type and
> > use pre-defined function to simplify, but not use a unified,
> > complex and hard to read structure to represent all kinds of
> > clocks.
> > 
> agree
> 
> I'd not object to use composite clock, it simplify the implementation,
> but, in this version, there is lots of "if" conditions which make it
> hard to review and maintain..
> 
> would it possibile to use more basic clk prototype? or just the composite
> model[1] or something similar as owl-composite.c [2] which has more fine
> composite prototype (instead of bundling all in one)
> 
> drivers/clk/clk-composite.c [1]
> drivers/clk/actions/owl-composite.c [2]
> 

This depends on what you clock is. I guest this mix has a all in one
register to perform mix/div/gate. If so, it is better to provide multiple
clk_ops to adopt the real one. Otherwise, it will be better to use
different clk type to represent the real clock.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
