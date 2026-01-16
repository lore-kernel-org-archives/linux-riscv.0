Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B0D4A5E2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 02:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CwpJj+NSjUlfvtv1SH8aPQproMhdbHltdsazwGuCyQ=; b=2HSV7WgAuuLfdC
	NTRATiljrk/Mp3dUDM7Pk9sbb9e9DCYAWhPGoonNiLDYJr+Jdz9RudGpRubQ47JnTQxomgYJLV0tr
	7eAor9CX6sspx5YA/bj1uVUO5LHdCLbAd0IzXt5RQ0YkVoEXeSKBsCpWLzD7uH52hyQCOHqfkIC8d
	GFnzadu2EMipsC3sbmS51RjcOcBVihAJV1OHkA+FMm9Bay/mPzawBU6cWew6vMBx2FwgqcKHPPytP
	rfPDKioF/ltDA/SORIzB24eB6aIg/HlgePgCghloNQ8reQv6HbxTTFxDvjHD7CihkKcc32F+xogNi
	gPPdepIC4lQYauiJPpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZDf-0000000DRg9-28YY;
	Fri, 16 Jan 2026 02:05:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZDc-0000000DRfb-1Mj7
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 02:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768529142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gG1D0fzVJ1vGqbm/rZq2UIHNeWOawXntGG6W46KCvjs=;
	b=g/Plv7a7Js2SDQ4nhkM/TFiYoqvA6zAzJxguBC3bpwGqx0lcULT9sHQb3PyrGWa90sB09L
	u/ks0+GqE8NVrTx5vMpPnF9ZYPMzWq/B8cn2TlDm5S4PJl1XA7MrJ3ek1pLG+NOeibQxjp
	cfOPeZJUM5O1tT66q4Ws5OiftcQM+SA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-DdBc97bENEaEoO4qFoqnHg-1; Thu, 15 Jan 2026 21:05:41 -0500
X-MC-Unique: DdBc97bENEaEoO4qFoqnHg-1
X-Mimecast-MFC-AGG-ID: DdBc97bENEaEoO4qFoqnHg_1768529140
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5311864d9so350237085a.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 18:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768529140; x=1769133940;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gG1D0fzVJ1vGqbm/rZq2UIHNeWOawXntGG6W46KCvjs=;
        b=jOxNqHtPi1IJA9YL6bqZOwaybohHuzdONdj1KWFVB9NN+gQAWeRdjwzvAoda6vW9J4
         H//B/MHIZH2N0AL3hEg6FDFUH0D3Tu55RCh5MMBRDB+8UsZvt7Gw77mHGT3ERzUKdoEX
         lPT71RP1DbDh3D5K9E4Nfg1Msda4vzApcc/e9tDXMYW9bBLsHRo/v7dki7H+wu8TD17M
         OvsyMUsKUGhyHq4nJFV7bUbtGXc3IPSbRcRlZcmGyrV2LpygLw2ooquWBzoXLIShrT0N
         g4dQNxXFdO5nnxCjb3V27WFF7riXZ0iuVvH5y4mEDUnk/0f0+ELqO4K5S203naAr77kZ
         3Z2w==
X-Forwarded-Encrypted: i=1; AJvYcCVxI02cMdfgqxZ462KbfbYUukGPAnMFbGHhdTGaTv8rQankF4N38wrWBMvzSmCyM1lMSAFpH88D161yAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIIC+oI6abovJQJplnXkY+pGrac81fAop44FGcCgYAX7h0kGsh
	XZKxgtSfsmi5OP9XqD2O4tVp65SAkcIJHIVbDezGR3XifKBRnr5oBjwddPM1UAG+SzGP0WgQPE+
	WHlBE/Dh7YWtnJszSvNN4u4GM4LA7ElBlTDh8hpTMh6bTYB03aE8gABYenPc2aw2fB2vD/A==
X-Gm-Gg: AY/fxX7QhpXDHXyJb0aSRHkhCJaDxCMgpEE2tRXcF9kyh/ANFpIM7aDBlpevQDp2YFg
	CgUU/nkLoBizVzjuu6vRPSZxOuDOr21P/iOA9KDyUb1GcwPjM1qoengaVSO+1C8XzEn+uQDKAD6
	w0KzXulEdV58SQUhknFf+EkqC03d6NNw+njnbNPxXiHOfxbZtzAZPAXXeW2fbiXguOAYCeJt0uF
	6suEJuSMJISMeNr72/vujsfQQlB7u/izI+WH9/wf2YEuCKIF5qb4/Hto737tZRLeDQ9ViFalFUi
	05EYFYNyaqnWigAQNgS+NdLs7TbWf75qEbiyaZhLmqDj6IA2BHgIXPVL8oNZgRMZE8YAgVBidF8
	IeByyOaAuo+r+iZgPpqzNWvLVPU1SRoaXHGiQJwbCmG4h
X-Received: by 2002:a05:620a:710c:b0:89e:b0bd:ced9 with SMTP id af79cd13be357-8c6a6770539mr238137985a.43.1768529140446;
        Thu, 15 Jan 2026 18:05:40 -0800 (PST)
X-Received: by 2002:a05:620a:710c:b0:89e:b0bd:ced9 with SMTP id af79cd13be357-8c6a6770539mr238134985a.43.1768529139939;
        Thu, 15 Jan 2026 18:05:39 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c06e5sm106501685a.16.2026.01.15.18.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:05:39 -0800 (PST)
Date: Thu, 15 Jan 2026 21:05:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aWmc73irBAM8DZwF@redhat.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eEfSL9X_UvioVmjRmEFIeHkXbInA0oDG2d4uLWA9eyk_1768529140
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_180544_473338_B617C236 
X-CRM114-Status: GOOD (  25.59  )
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

Hi Anirudh,

Thanks for the patch!

On Thu, Jan 15, 2026 at 05:42:02PM -0600, Anirudh Srinivasan wrote:
> Add driver for syscon block in Tenstorrent Atlantis SoC. This version of
> the driver coves clocks from RCPU syscon.
> 
> 5 types of clocks generated by this controller: PLLs (PLLs
> with bypass functionality and an additional Gate clk at output), Shared
> Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> Dividers and Gates. All clocks are derived from a 24 Mhz oscillator.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
> diff --git a/drivers/clk/tenstorrent/atlantis-ccu.c b/drivers/clk/tenstorrent/atlantis-ccu.c
> new file mode 100644
> index 000000000000..f3a2ea49a82e
> --- /dev/null
> +++ b/drivers/clk/tenstorrent/atlantis-ccu.c
> @@ -0,0 +1,932 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Tenstorrent
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/idr.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tenstorrent/atlantis-syscon.h>
> +
> +#include <dt-bindings/clock/tenstorrent,atlantis-syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/clk-provider.h>
> +#include <linux/math.h>
> +#include <linux/bitfield.h>

Please sort the headers. clk-provider.h is listed twice. Remove the
unnecessary newlines.

> +static void atlantis_ccu_lock(void *_lock)
> +{
> +	spinlock_t *lock = _lock;
> +
> +	spin_lock(lock);
> +}
> +
> +static void atlantis_ccu_unlock(void *_lock)
> +{
> +	spinlock_t *lock = _lock;
> +
> +	spin_unlock(lock);
> +}

Are these abstractions really needed? Why not just call spin_lock/unlock
directly?

> +static int atlantis_ccu_clocks_register(struct device *dev,
> +					struct atlantis_ccu *ccu,
> +					const struct atlantis_ccu_data *data)
> +{
> +	struct regmap *regmap = ccu->regmap;
> +	struct clk_hw_onecell_data *clk_data;
> +	int i, ret;
> +	size_t num_clks = data->num;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	ccu->clk_data = clk_data;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = data->hws[i];
> +		const char *name = hw->init->name;
> +		struct atlantis_clk_common *common =
> +			hw_to_atlantis_clk_common(hw);
> +		common->regmap = regmap;
> +
> +		/* Fixup missing handle to parent for gates/muxes/dividers */
> +		if (hw->init->parent_hws && hw->init->num_parents == 1) {
> +			const struct atlantis_clk_common *parent =
> +				hw_to_atlantis_clk_common(
> +					hw->init->parent_hws[0]);
> +			hw->init->parent_hws[0] = clk_data->hws[parent->clkid];
> +		}
> +
> +		switch (common->clk_type) {
> +		case ATLANTIS_CLK_MUX:
> +			struct atlantis_clk_mux *mux =
> +				hw_to_atlantis_clk_mux(hw);
> +
> +			hw = devm_clk_hw_register_mux_parent_data_table(
> +				ccu->dev, name, hw->init->parent_data,
> +				hw->init->num_parents, hw->init->flags,
> +				ccu->base + mux->config.reg_offset,
> +				mux->config.shift, mux->config.width, 0, NULL,
> +				&lock);
> +
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;

return PTR_ERR(hw);

> +			}
> +
> +			if (data == &atlantis_ccu_rcpu_data) {
> +				switch (common->clkid) {
> +				case CLK_RCPU_ROOT:
> +					ret = clk_hw_set_parent(
> +						hw,
> +						clk_data->hws[CLK_RCPU_PLL]);

Should the parent be defined in device tree instead of statically in the
driver? devm_of_clk_add_hw_provider() is called below, and it calls
of_clk_set_defaults(), which will allow the use of the
assigned-clock-parents and assigned-clocks properties.

> +					if (ret)
> +						dev_err(ccu->dev,
> +							"Failed to set RCPU ROOT MUX parent: %d\n",
> +							ret);
> +					break;
> +				case CLK_NOCC_CLK:
> +					ret = clk_hw_set_parent(
> +						hw, clk_data->hws[CLK_NOC_PLL]);
> +					if (ret)
> +						dev_err(ccu->dev,
> +							"Failed to set NOCC Mux parent: %d\n",
> +							ret);
> +					break;
> +				}
> +			}
> +			break;
> +		case ATLANTIS_CLK_DIVIDER:
> +			struct atlantis_clk_divider *div =
> +				hw_to_atlantis_clk_divider(hw);
> +
> +			hw = devm_clk_hw_register_divider_parent_hw(
> +				ccu->dev, name, common->hw.init->parent_hws[0],
> +				div->common.hw.init->flags,
> +				ccu->base + div->config.reg_offset,
> +				div->config.shift, div->config.width,
> +				div->config.flags, &lock);
> +
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;
> +			}
> +
> +			break;
> +		case ATLANTIS_CLK_GATE:
> +			struct atlantis_clk_gate *gate =
> +				hw_to_atlantis_clk_gate(hw);
> +
> +			hw = devm_clk_hw_register_gate_parent_hw(
> +				ccu->dev, name, common->hw.init->parent_hws[0],
> +				hw->init->flags,
> +				ccu->base + gate->config.reg_offset,
> +				ffs(gate->config.enable) - 1, 0, &lock);
> +
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;

return PTR_ERR(hw);

> +			}
> +
> +			break;
> +		case ATLANTIS_CLK_FIXED_FACTOR:
> +			struct atlantis_clk_fixed_factor *factor =
> +				hw_to_atlantis_clk_fixed_factor(hw);
> +
> +			if (hw->init->parent_data) {
> +				hw = devm_clk_hw_register_fixed_factor_index(
> +					dev, name,
> +					hw->init->parent_data[0].index,
> +					hw->init->flags, factor->config.mult,
> +					factor->config.div);
> +			} else {
> +				hw = devm_clk_hw_register_fixed_factor_parent_hw(
> +					dev, name, hw->init->parent_hws[0],
> +					hw->init->flags, factor->config.mult,
> +					factor->config.div);
> +			}
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;

return PTR_ERR(hw);

> +			}
> +			break;
> +		case ATLANTIS_CLK_GATE_SHARED:
> +			struct atlantis_clk_gate_shared *gate_shared =
> +				hw_to_atlantis_clk_gate_shared(hw);
> +			gate_shared->config.refcount_lock = &refcount_lock;
> +
> +			ret = devm_clk_hw_register(dev, hw);
> +

Unnecessary newline

> +			if (ret) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;
> +			}
> +
> +			break;
> +		default:
> +
> +			ret = devm_clk_hw_register(dev, hw);
> +

Unnecessary newline

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
