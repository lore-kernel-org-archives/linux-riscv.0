Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD4D609D8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/W57wUmRDACHLXC5PGilcUu0RSePcsVINEOZXSDI/Pk=; b=WhHp+/UncJhDFD
	x/LJu8AzRs6v1kPVnqIYcGvYyhSY7qfzeshJv5Tj5O/iY5DpZtyCuLS+9VuBg567XLC9SpSfUyxr/
	6Q+oSqiBNZQkTdNUHCuU+GxqSbYcpZ7UdmQ8Qb4sxznxor3RQhUmAfgsk61LgekNf6/Dyaig6jmr1
	82Zzv1P+LjOwonu3LC0L9ohibU+dldgx5XEmCiFjoXQKu0f4zGPwxz8GnBB/bubLgwOB8mKJfah8j
	LrqLgNI5DTmvJuZs+0hTMicO+xeIZvEKIF7s/05g08dX6gSRbA+Sagn3EBQ6+O4kZ7sDK7AazcVjy
	3MPGcomuRuNCDUcZNg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGBA-0000000D0YY-2H23;
	Wed, 27 Nov 2024 11:25:56 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG68-0000000CzOT-2QJ2
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 11:20:45 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id B17C6122FE1E;
	Wed, 27 Nov 2024 03:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732706443; bh=B0b/SczncKfIemD3WJSLcY13opu1LSyTlwkMqYKopVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bY/QmVpCdSi1lf9mWhYRtgVasvZw33k8D/Nhe+L+dN4rdICPcbSDKZb5V4fQ2xsf+
	 C3kPP7ZGppYHRTVHguGeLik+kO5LhDBpr9lyIyvx4aGOVVvxM+Xsa+HCSnj4YugO+h
	 JOyumDLsM+8mrZMIH59tMPpiIZD8la8aU4BuahYj0vp+o/xW0jrHuIPWNB7E6v5vfU
	 McAvV4Q1R9zSbrshA9cv/KnZyFLh5KYVT2JS8dLEdIyJLYM9wM2r+bmH+BQu7+jvwx
	 mE8UFf2eXq20xddhV8BcY7+BQBsm5HL6IdIsw+IKWj898VYqwXA92hwjO0I0C8vpQq
	 FjMUaf6+uRQng==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UB087nrReY7J; Wed, 27 Nov 2024 03:20:40 -0800 (PST)
Received: from ketchup (unknown [119.39.112.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 9F42B122FE1A;
	Wed, 27 Nov 2024 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732706440; bh=B0b/SczncKfIemD3WJSLcY13opu1LSyTlwkMqYKopVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pscF68N5enA3/L1+ynOcONQl3bjnXjjuhhWNxU3Xx1Bx0FNmk3noIRChZfMBvs7rD
	 lGax/MT1rsnrDLuL1Nn9AcXXKisbeU/jZ7F+QFeRs7h+eiOBxO8Tgkj2xXYHH6TY1o
	 vL9+BucW6GpF2K3ankPvbQ9WGCfLJFx/KXHJrzzD6fCkGZl3fRtZfJJlfAbqIALMj5
	 eSvXd7Dy1Gh+PupMXA0JtLSgrvzAHuQLDqfNNorarrkfvakbuk5LP/IzZwMeybHeYs
	 6zBLj6eS6QDus9hBFjZ+N/aeKUL3Y/VkOUFwmEbHJxhlbalw5Bur1bUzZxAu6m78V/
	 wZg1kpMRv7oeg==
Date: Wed, 27 Nov 2024 11:20:28 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z0cAfKdexQugojoJ@ketchup>
References: <SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <a680b539e815f2e38f23126fede76591.sboyd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a680b539e815f2e38f23126fede76591.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_032044_672028_F445A3DD 
X-CRM114-Status: GOOD (  35.45  )
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

Hi Stephen,

Sorry for such a late reply. FYI, I have sent a v3 and applied most of
your recommendation.

On Thu, Sep 19, 2024 at 04:08:32PM -0700, Stephen Boyd wrote:
> Quoting Haylen Chu (2024-09-16 15:23:10)
> > +static const char * const apb_parent_names[] = {
> 
> Please don't use strings for parents. Either use struct clk_parent_data
> or clk_hw pointers directly.
> 
> > +       "pll1_d96_25p6", "pll1_d48_51p2", "pll1_d96_25p6", "pll1_d24_102p4"
> > +};

Thanks for the hint, all parents are described with struct
clk_parent_data in v3.

> > +static int k1_ccu_probe(struct platform_device *pdev)
> > +{
> > +       const struct spacemit_ccu_data *data;
> > +       struct regmap *base_map, *lock_map;
> > +       struct device *dev = &pdev->dev;
> > +       struct spacemit_ccu_priv *priv;
> > +       struct device_node *parent;
> > +       int ret;
> > +
> > +       data = of_device_get_match_data(dev);
> > +       if (WARN_ON(!data))
> > +               return -EINVAL;
> > +
> > +       parent   = of_get_parent(dev->of_node);
> > +       base_map = syscon_node_to_regmap(parent);
> > +       of_node_put(parent);
> > +
> > +       if (IS_ERR(base_map))
> > +               return dev_err_probe(dev, PTR_ERR(base_map),
> > +                                    "failed to get regmap\n");
> > +
> > +       if (data->need_pll_lock) {
> > +               lock_map = syscon_regmap_lookup_by_phandle(dev->of_node,
> > +                                                          "spacemit,mpmu");
> > +               if (IS_ERR(lock_map))
> > +                       return dev_err_probe(dev, PTR_ERR(lock_map),
> > +                                            "failed to get lock regmap\n");
> > +       }
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       priv->data      = data;
> > +       priv->base      = base_map;
> > +       priv->lock_base = lock_map;
> > +       spin_lock_init(&priv->lock);
> > +
> > +       ret = spacemit_ccu_register(dev, priv);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to register clocks");
> 
> Missing newline on printk

Corrected in v3.

> > diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
> > +static void ccu_ddn_disable(struct clk_hw *hw)
> > +{
> > +       struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
> > +       struct ccu_common *common = &ddn->common;
> > +       unsigned long flags;
> > +
> > +       if (!ddn->gate)
> > +               return;
> > +
> > +       spin_lock_irqsave(common->lock, flags);
> 
> The regmap can have a lock. Can you use that?

Thanks for the hint. This extra lock is dropped in v3. Since all
register operations to shared MMIO regions are performed through
regmap_update_bits(), there cannot be a race.

> > diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> > new file mode 100644
> > index 000000000000..750882b6ed93
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_mix.c
> > +const struct clk_ops spacemit_ccu_mix_ops = {
> > +       .disable         = ccu_mix_disable,
> > +       .enable          = ccu_mix_enable,
> > +       .is_enabled      = ccu_mix_is_enabled,
> > +       .get_parent      = ccu_mix_get_parent,
> > +       .set_parent      = ccu_mix_set_parent,
> > +       .determine_rate  = ccu_mix_determine_rate,
> > +       .round_rate      = ccu_mix_round_rate,
> 
> Only implement determine_rate

Okay, duplicated round_rate is deleted in v3.

> 
> > +       .recalc_rate     = ccu_mix_recalc_rate,
> > +       .set_rate        = ccu_mix_set_rate,
> > +};
> > +
> > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> > new file mode 100644
> > index 000000000000..1f0ece6abcac
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_pll.c
> > @@ -0,0 +1,226 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Spacemit clock type pll
> > + *
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "ccu_common.h"
> > +#include "ccu_pll.h"
> > +
> > +#define PLL_MIN_FREQ   600000000
> > +#define PLL_MAX_FREQ   3400000000
> > +#define PLL_DELAY_TIME 3000
> > +
> > +#define pll_read_swcr1(c, v)   ccu_read(ctrl, c, v)
> > +#define pll_read_swcr2(c, v)   ccu_read(sel, c, v)
> > +#define pll_read_swcr3(c, v)   ccu_read(xtc, c, v)
> > +
> > +#define pll_update_swcr1(c, m, v)      ccu_update(ctrl, c, m, v)
> > +#define pll_update_swcr2(c, m, v)      ccu_update(sel, c, m, v)
> > +#define pll_update_swcr3(c, m, v)      ccu_update(xtc, c, m, v)
> 
> Please stop wrapping regmap APIs. Just use them directly.

Thanks, I drop the regmap wrappers for each clock type, but keep
ccu_{read,update} in v3 since they save a lot of keystrokes and make
the code easier to read.

> 
> > +
> > +#define PLL_SWCR1_REG5_OFF     0
> > +#define PLL_SWCR1_REG5_MASK    GENMASK(7, 0)
> > +#define PLL_SWCR1_REG6_OFF     8
> > +#define PLL_SWCR1_REG6_MASK    GENMASK(15, 8)
> > +#define PLL_SWCR1_REG7_OFF     16
> > +#define PLL_SWCR1_REG7_MASK    GENMASK(23, 16)
> > +#define PLL_SWCR1_REG8_OFF     24
> > +#define PLL_SWCR1_REG8_MASK    GENMASK(31, 24)
> > +
> > +#define PLL_SWCR2_DIVn_EN(n)   BIT(n + 1)
> > +#define PLL_SWCR2_ATEST_EN     BIT(12)
> > +#define PLL_SWCR2_CKTEST_EN    BIT(13)
> > +#define PLL_SWCR2_DTEST_EN     BIT(14)
> > +
> > +#define PLL_SWCR3_DIV_FRC_OFF  0
> > +#define PLL_SWCR3_DIV_FRC_MASK GENMASK(23, 0)
> > +#define PLL_SWCR3_DIV_INT_OFF  24
> > +#define PLL_SWCR3_DIV_INT_MASK GENMASK(30, 24)
> > +#define PLL_SWCR3_EN           BIT(31)
> > +
> > +static int ccu_pll_is_enabled(struct clk_hw *hw)
> > +{
> > +       struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +       u32 tmp;
> > +
> > +       pll_read_swcr3(&p->common, &tmp);
> > +
> > +       return tmp & PLL_SWCR3_EN;
> > +}
> > +
> > +/* frequency unit Mhz, return pll vco freq */
> > +static unsigned long __get_vco_freq(struct clk_hw *hw)
> > +{
> > +       unsigned int reg5, reg6, reg7, reg8, size, i;
> > +       unsigned int div_int, div_frc;
> > +       struct ccu_pll_rate_tbl *freq_pll_regs_table;
> > +       struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +       struct ccu_common *common = &p->common;
> > +       u32 tmp;
> > +
> > +       pll_read_swcr1(common, &tmp);
> > +       reg5 = (tmp & PLL_SWCR1_REG5_MASK) >> PLL_SWCR1_REG5_OFF;
> > +       reg6 = (tmp & PLL_SWCR1_REG6_MASK) >> PLL_SWCR1_REG6_OFF;
> > +       reg7 = (tmp & PLL_SWCR1_REG7_MASK) >> PLL_SWCR1_REG7_OFF;
> > +       reg8 = (tmp & PLL_SWCR1_REG8_MASK) >> PLL_SWCR1_REG8_OFF;
> > +
> > +       pll_read_swcr3(common, &tmp);
> > +       div_int = (tmp & PLL_SWCR3_DIV_INT_MASK) >> PLL_SWCR3_DIV_INT_OFF;
> > +       div_frc = (tmp & PLL_SWCR3_DIV_FRC_MASK) >> PLL_SWCR3_DIV_FRC_OFF;
> > +
> > +       freq_pll_regs_table = p->pll.rate_tbl;
> > +       size = p->pll.tbl_size;
> > +
> > +       for (i = 0; i < size; i++)
> > +               if ((freq_pll_regs_table[i].reg5 == reg5) &&
> > +                   (freq_pll_regs_table[i].reg6 == reg6) &&
> > +                   (freq_pll_regs_table[i].reg7 == reg7) &&
> > +                   (freq_pll_regs_table[i].reg8 == reg8) &&
> > +                   (freq_pll_regs_table[i].div_int == div_int) &&
> > +                   (freq_pll_regs_table[i].div_frac == div_frc))
> > +                       return freq_pll_regs_table[i].rate;
> > +
> > +       WARN_ON_ONCE(1);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ccu_pll_enable(struct clk_hw *hw)
> > +{
> > +       struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +       struct ccu_common *common = &p->common;
> > +       unsigned long flags;
> > +       unsigned int tmp;
> > +       int ret;
> > +
> > +       if (ccu_pll_is_enabled(hw))
> > +               return 0;
> > +
> > +       spin_lock_irqsave(common->lock, flags);
> > +
> > +       pll_update_swcr3(common, PLL_SWCR3_EN, PLL_SWCR3_EN);
> > +
> > +       spin_unlock_irqrestore(common->lock, flags);
> > +
> > +       /* check lock status */
> > +       ret = regmap_read_poll_timeout_atomic(common->lock_base,
> > +                                             p->pll.reg_lock,
> > +                                             tmp,
> > +                                             tmp & p->pll.lock_enable_bit,
> > +                                             5, PLL_DELAY_TIME);
> > +
> > +       return ret;
> > +}
> > +
> > +static void ccu_pll_disable(struct clk_hw *hw)
> > +{
> > +       struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +       struct ccu_common *common = &p->common;
> > +       unsigned long flags;
> > +
> > +       spin_lock_irqsave(p->common.lock, flags);
> > +
> > +       pll_update_swcr3(common, PLL_SWCR3_EN, 0);
> > +
> > +       spin_unlock_irqrestore(common->lock, flags);
> > +}
> > +
> > +/*
> > + * pll rate change requires sequence:
> > + * clock off -> change rate setting -> clock on
> > + * This function doesn't really change rate, but cache the config
> > + */
> > +static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                              unsigned long parent_rate)
> > +{
> > +       struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +       struct ccu_common *common = &p->common;
> > +       struct ccu_pll_config *params = &p->pll;
> > +       struct ccu_pll_rate_tbl *entry;
> > +       unsigned long old_rate;
> > +       unsigned long flags;
> > +       bool found = false;
> > +       u32 mask, val;
> > +       int i;
> > +
> > +       if (ccu_pll_is_enabled(hw)) {
> > +               pr_err("%s %s is enabled, ignore the setrate!\n",
> > +                      __func__, __clk_get_name(hw->clk));
> > +               return 0;
> > +       }
> > +
> > +       old_rate = __get_vco_freq(hw);
> > +
> > +       for (i = 0; i < params->tbl_size; i++) {
> > +               if (rate == params->rate_tbl[i].rate) {
> > +                       found = true;
> > +                       entry = &params->rate_tbl[i];
> > +                       break;
> > +               }
> > +       }
> > +       WARN_ON_ONCE(!found);
> > +
> > +       spin_lock_irqsave(common->lock, flags);
> > +
> > +       mask = PLL_SWCR1_REG5_MASK | PLL_SWCR1_REG6_MASK;
> > +       mask |= PLL_SWCR1_REG7_MASK | PLL_SWCR1_REG8_MASK;
> > +       val |= entry->reg5 << PLL_SWCR1_REG5_OFF;
> > +       val |= entry->reg6 << PLL_SWCR1_REG6_OFF;
> > +       val |= entry->reg7 << PLL_SWCR1_REG7_OFF;
> > +       val |= entry->reg8 << PLL_SWCR1_REG8_OFF;
> > +       pll_update_swcr1(common, mask, val);
> > +
> > +       mask = PLL_SWCR3_DIV_INT_MASK | PLL_SWCR3_DIV_FRC_MASK;
> > +       val = entry->div_int << PLL_SWCR3_DIV_INT_OFF;
> > +       val |= entry->div_frac << PLL_SWCR3_DIV_FRC_OFF;
> > +       pll_update_swcr3(common, mask, val);
> > +
> > +       spin_unlock_irqrestore(common->lock, flags);
> > +
> > +       return 0;
> > +}
> > +
> > +static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> > +                                        unsigned long parent_rate)
> > +{
> > +       return __get_vco_freq(hw);
> > +}
> > +
> > +static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > +                              unsigned long *prate)
> > +{
> > +       struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +       struct ccu_pll_config *params = &p->pll;
> > +       unsigned long max_rate = 0;
> > +       unsigned int i;
> > +
> > +       if (rate > PLL_MAX_FREQ || rate < PLL_MIN_FREQ) {
> > +               pr_err("%lu rate out of range!\n", rate);
> 
> We should simply clamp the rate here. It doesn't matter what 'rate' is
> when this function is called. The callback is supposed to determine what
> the clk rate will be if a consumer called clk_set_rate() with 'rate'.
> Don't fail that if the rate is requested to be larger than max, just
> tell clk_round_rate() that if you ask for something larger you'll get
> PLL_MAX_FREQ.

Thanks for explaining the convention. I have adapted ccu_pll_round_rate
to follow this behavior in v3.

> > +               return -EINVAL;
> > +       }
> > +

Thanks again for your review and time.

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
