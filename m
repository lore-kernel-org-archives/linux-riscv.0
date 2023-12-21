Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C73C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 04:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPFeWW/Qpin656S2cVavnUiIyOa6qxiwEPlIAwSy0lw=; b=dd6yOrY2StPJrG
	sx71UB6s5AlaXlkR08i9xAP8hkvgpeTxz6B+pawb8uKp8jGzIuiOw8GwESQo59Mknmb4Z0PDrOjb0
	miOoNpYJ/Xv4hnmVh3ZDfWk4HCL8spkj2DgzAcIzgZ2wRU+DWws2cZ1eMP9szhgJ95gNGlNpbdcG7
	dCTaR2z6o/pNgM8O1nzPz16VFpU1SqxDGekaO7R+Z+WhVZeEpionbZbD67ESeXx/Cf3yGkjK8c5H4
	LANUrq9Hcynt3Xl7/UTMSLozKj6fQ4FObvtcFD/Khf5xHNU8UND5h/xq2uXtlOLaU7zFdvj5K6blp
	I+ENIw1bg1l3g/axJGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGB83-001i2P-2z;
	Thu, 21 Dec 2023 04:57:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGB7z-001i1U-2R
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 04:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD6FDCE1E81;
	Thu, 21 Dec 2023 04:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27FCC433C7;
	Thu, 21 Dec 2023 04:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703134664;
	bh=5ewNkhx0O1Kn4acIvDdI9SW1Ae0lDtaZ0I9pGDNdEzU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HtNhSllcyarR3HsRZghH+NMv6nlCZA+k1EuBxSMk0X+iUsccZMGUR45jcCcEEF3Yq
	 2Ut/saN2p225RwJodR2KuciCYch86wQHMpDGs8mSKLrPTXyOISEGUL4So5UAlKV8E/
	 /KwKj2hF7re12WI2XGZ41Nnvz1UyN/7eILC5ZWYlsTvPthuDlnWXgg3F5d7RNkHbkw
	 1/2F6eCIQ4aq2zQWo+fCUzlUb88dYpHPOou6oHoZteu8gRdirWgXvQaJZtBFf3CqkY
	 2Grq9nUkbIyT3L8Kw0V4qS4cTmLMjzKEpkznqyncWFAq/Ue0Q+pz/WcwICL10GhO84
	 ufuNX4u+Ex7wA==
Message-ID: <f33fed32babade4e0ae8ec7e3f840bcc.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953F23CB5204BF4D1A0A924BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495354167CE560FC18E28DC5BB90A@IA1PR20MB4953.namprd20.prod.outlook.com> <IA1PR20MB4953F23CB5204BF4D1A0A924BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
Subject: Re: [PATCH v4 2/4] clk: sophgo: Add CV1800 series clock controller driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 20 Dec 2023 20:57:41 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_205748_172575_846BB0BC 
X-CRM114-Status: GOOD (  22.06  )
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

Quoting Inochi Amaoto (2023-12-17 20:04:04)
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> new file mode 100644
> index 000000000000..e51ffbd35ef2
> --- /dev/null
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -0,0 +1,1565 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>

Need to include linux/clk-provider.h

> +
> +#include "clk-cv1800.h"
> +
> +#include "clk-cv18xx-common.h"
> +#include "clk-cv18xx-ip.h"
> +#include "clk-cv18xx-pll.h"
> +
> +struct cv1800_clk_ctrl;
> +
> +struct cv1800_clk_desc {
> +       struct clk_hw_onecell_data      *clks_data;
> +
> +       int (*pre_init)(struct device *dev, void __iomem *base,
> +                       struct cv1800_clk_ctrl *ctrl,
> +                       const struct cv1800_clk_desc *desc);
> +};
> +
> +struct cv1800_clk_ctrl {
> +       const struct cv1800_clk_desc    *desc;
> +       spinlock_t                      lock;
> +};
> +
> +#define CV1800_DIV_FLAG        \
> +       (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
> +static const struct clk_parent_data osc_parents[] = {
> +       { .index = 0 },
> +};
[...]
> +// UART
> +static CV1800_GATE(clk_uart0, clk_uart_parents,
> +                  REG_CLK_EN_1, 14,
> +                  CLK_IS_CRITICAL);
> +static CV1800_GATE(clk_apb_uart0, clk_axi4_bus_parents,
> +                  REG_CLK_EN_1, 15,
> +                  CLK_IS_CRITICAL);
> +static CV1800_GATE(clk_uart1, clk_uart_parents,
> +                  REG_CLK_EN_1, 16,
> +                  CLK_IS_CRITICAL);
> +static CV1800_GATE(clk_apb_uart1, clk_axi4_bus_parents,
> +                  REG_CLK_EN_1, 17,
> +                  CLK_IS_CRITICAL);

It seems that everything is critical? Why? I suspect you want
clk_ignore_unused to be the default?

> +static CV1800_GATE(clk_uart2, clk_uart_parents,
> +                  REG_CLK_EN_1, 18,
> +                  CLK_IS_CRITICAL);
> +static CV1800_GATE(clk_apb_uart2, clk_axi4_bus_parents,
> +                  REG_CLK_EN_1, 19,
> +                  CLK_IS_CRITICAL);
> +static CV1800_GATE(clk_uart3, clk_uart_parents,
> +                  REG_CLK_EN_1, 20,
> +                  CLK_IS_CRITICAL);
> +static CV1800_GATE(clk_apb_uart3, clk_axi4_bus_parents,
> +                  REG_CLK_EN_1, 21,
> +                  CLK_IS_CRITICAL);
> +static CV1800_GATE(clk_uart4, clk_uart_parents,
> +                  REG_CLK_EN_1, 22,
> +                  CLK_IS_CRITICAL);
[...]
> +
> +static CV1800_MMUX(clk_a53, clk_a53_parents,
> +                  REG_CLK_EN_0, 0,
> +                  REG_DIV_CLK_A53_0, 16, 4, 1, CV1800_DIV_FLAG,
> +                  REG_DIV_CLK_A53_1, 16, 4, 2, CV1800_DIV_FLAG,
> +                  REG_DIV_CLK_A53_0, 8, 2,
> +                  REG_DIV_CLK_A53_1, 8, 2,
> +                  REG_CLK_BYP_0, 0,
> +                  REG_CLK_SEL_0, 0,
> +                  clk_a53_parent2sel,
> +                  clk_a53_sel2parent[0], clk_a53_sel2parent[1],
> +                  CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);

Please add a comment why it is critical. I guess this is clocking the
CPU?

> +
[...]
> +}
> +
> +static int cv1800_pre_init(struct device *dev, void __iomem *base,
> +                          struct cv1800_clk_ctrl *ctrl,
> +                          const struct cv1800_clk_desc *desc)
> +{
> +       u32 val = readl(base + REG_CLK_EN_2);
> +
> +       // disable unsupported clk_disp_src_vip

/* No C++ style comments please */

> +       val &= ~BIT(7);
> +
> +       writel(val, base + REG_CLK_EN_2);
> +
> +       cv18xx_clk_disable_a53(base);
> +       cv18xx_clk_disable_auto_pd(base);
> +
[...]
> +                                    desc->clks_data);
> +       if (ret)
> +               goto fail_hw_provider;
> +
> +       return 0;
> +
> +fail_hw_provider:
> +       of_clk_del_provider(node);
> +fail_hw:
> +       while (--i >= 0) {
> +               struct clk_hw *hw = desc->clks_data->hws[i];
> +
> +               if (!hw)
> +                       continue;
> +               clk_hw_unregister(hw);

Use devm_clk_hw_register?

> +       }
> +       return ret;
> +}
> +
> +static int cv1800_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       void __iomem *reg;
> +       int ret;
> +       const struct cv1800_clk_desc *desc;
> +       struct cv1800_clk_ctrl *ctrl;
> +
> +       reg = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(reg))
> +               return PTR_ERR(reg);
> +
> +       desc = of_device_get_match_data(dev);

Use device_get_match_data()

> +       if (!desc) {
> +               pr_err("no match data for platform\n");
> +               return -EINVAL;
> +       }
> +
> +       ctrl = devres_alloc(devm_cv1800_clk_ctrl_release,

Preferably you use devm clk registration and provider registration
instead of making your own wrapper.

> +                           sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       if (desc->pre_init) {
> +               ret = desc->pre_init(dev, reg, ctrl, desc);
> +               if (ret)
> +                       goto failed;
> +       }
> diff --git a/drivers/clk/sophgo/clk-cv18xx-common.c b/drivers/clk/sophgo/clk-cv18xx-common.c
> new file mode 100644
> index 000000000000..2ff4c20bb5ba
> --- /dev/null
> +++ b/drivers/clk/sophgo/clk-cv18xx-common.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/iopoll.h>

spinlock include?
include for WARN_ON? Please have explicit includes for what you use.

> +
> +#include "clk-cv18xx-common.h"
> +
> +int cv1800_clk_setbit(struct cv1800_clk_common *common,
> +                     struct cv1800_clk_regbit *field)
> +{
> +       u32 mask = BIT(field->shift);
> +       u32 value;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(common->lock, flags);
> +
> +       value = readl(common->base + field->reg);
> +       writel(value | mask, common->base + field->reg);
> +
> +       spin_unlock_irqrestore(common->lock, flags);
> +
> +       return 0;
> +}
> +
> +int cv1800_clk_clearbit(struct cv1800_clk_common *common,
> +                       struct cv1800_clk_regbit *field)
> +{
> +       u32 mask = BIT(field->shift);
> +       u32 value;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(common->lock, flags);
> +
> +       value = readl(common->base + field->reg);
> +       writel(value & ~mask, common->base + field->reg);
> +
> +       spin_unlock_irqrestore(common->lock, flags);
> +
> +       return 0;
> +}
> +
> +int cv1800_clk_checkbit(struct cv1800_clk_common *common,
> +                       struct cv1800_clk_regbit *field)
> +{
> +       return readl(common->base + field->reg) & BIT(field->shift);
> +}
> +
> +#define PLL_LOCK_TIMEOUT_US    (200 * 1000)
> +
> +void cv1800_clk_wait_for_lock(struct cv1800_clk_common *common,
> +                             u32 reg, u32 lock)
> +{
> +       void __iomem *addr = common->base + reg;
> +       u32 regval;
> +
> +       if (!lock)
> +               return;
> +
> +       WARN_ON(readl_relaxed_poll_timeout(addr, regval, regval & lock,
> +                                          100, PLL_LOCK_TIMEOUT_US));
> +}
> +
> +bool cv1800_clk_is_better_rate(struct cv1800_clk_common *common,
> +                              unsigned long target, unsigned long now,
> +                              unsigned long best)
> +{
> +       if (common->features & CLK_DIVIDER_ROUND_CLOSEST)
> +               return abs(target - now) < abs(target - best);

Use abs_diff()

> +
> +       return now <= target && now > best;
> +}
> +
> diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-cv18xx-ip.c
> new file mode 100644
> index 000000000000..148ce0ee2a96
> --- /dev/null
> +++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
> @@ -0,0 +1,893 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/gcd.h>

Need to include clk-provider.h

> +
> +#include "clk-cv18xx-ip.h"
> +
> +/* GATE */
> +static inline struct cv1800_clk_gate *hw_to_cv1800_clk_gate(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_common *common = hw_to_cv1800_clk_common(hw);
> +
> +       return container_of(common, struct cv1800_clk_gate, common);
> +}
> +
> +static int gate_enable(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_gate *gate = hw_to_cv1800_clk_gate(hw);
> +
> +       return cv1800_clk_setbit(&gate->common, &gate->gate);
> +}
> +
> +static void gate_disable(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_gate *gate = hw_to_cv1800_clk_gate(hw);
> +
> +       cv1800_clk_clearbit(&gate->common, &gate->gate);
> +}
> +
> +static int gate_is_enabled(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_gate *gate = hw_to_cv1800_clk_gate(hw);
> +
> +       return cv1800_clk_checkbit(&gate->common, &gate->gate);
> +}
> +
> +static unsigned long gate_recalc_rate(struct clk_hw *hw,
> +                                     unsigned long parent_rate)
> +{
> +       return parent_rate;
> +}
> +
> +static long gate_round_rate(struct clk_hw *hw, unsigned long rate,
> +                           unsigned long *parent_rate)
> +{
> +       return *parent_rate;
> +}
> +
> +static int gate_set_rate(struct clk_hw *hw, unsigned long rate,
> +                        unsigned long parent_rate)
> +{
> +       return 0;
> +}
> +
> +const struct clk_ops cv1800_clk_gate_ops = {
> +       .disable = gate_disable,
> +       .enable = gate_enable,
> +       .is_enabled = gate_is_enabled,
> +
> +       .recalc_rate = gate_recalc_rate,
> +       .round_rate = gate_round_rate,
> +       .set_rate = gate_set_rate,
> +};
> +
> +/* DIV */
> +#define _DIV_EN_CLK_DIV_FACTOR_FIELD           BIT(3)
> +
> +#define DIV_GET_EN_CLK_DIV_FACTOR(_reg) \
> +       FIELD_GET(_DIV_EN_CLK_DIV_FACTOR_FIELD, _reg)
> +
> +#define DIV_SET_EN_DIV_FACTOR(_reg) \
> +       _CV1800_SET_FIELD(_reg, 1, _DIV_EN_CLK_DIV_FACTOR_FIELD)
> +
> +static inline struct cv1800_clk_div *hw_to_cv1800_clk_div(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_common *common = hw_to_cv1800_clk_common(hw);
> +
> +       return container_of(common, struct cv1800_clk_div, common);
> +}
> +
> +static int div_enable(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_div *div = hw_to_cv1800_clk_div(hw);
> +
> +       return cv1800_clk_setbit(&div->common, &div->gate);
> +}
> +
> +static void div_disable(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_div *div = hw_to_cv1800_clk_div(hw);
> +
> +       cv1800_clk_clearbit(&div->common, &div->gate);
> +}
> +
> +static int div_is_enabled(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_div *div = hw_to_cv1800_clk_div(hw);
> +
> +       return cv1800_clk_checkbit(&div->common, &div->gate);
> +}
> +
> +static int div_helper_set_rate(struct cv1800_clk_common *common,
> +                              struct cv1800_clk_regfield *div,
> +                              unsigned long val)
> +{
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (div->width == 0)
> +               return 0;
> +
> +       spin_lock_irqsave(common->lock, flags);
> +
> +       reg = readl(common->base + div->reg);
> +       reg = cv1800_clk_regfield_set(reg, val, div);
> +       if (div->initval > 0)
> +               reg = DIV_SET_EN_DIV_FACTOR(reg);
> +
> +       writel(reg, common->base + div->reg);
> +
> +       spin_unlock_irqrestore(common->lock, flags);
> +
> +       return 0;
> +}
> +
> +static u32 div_helper_get_clockdiv(struct cv1800_clk_common *common,
> +                                  struct cv1800_clk_regfield *div)
> +{
> +       u32 clockdiv = 1;
> +       u32 reg;
> +
> +       if (!div || div->initval < 0 || (div->width == 0 && div->initval <= 0))
> +               return 1;
> +
> +       if (div->width == 0 && div->initval > 0)
> +               return div->initval;
> +
> +       reg = readl(common->base + div->reg);
> +
> +       if (div->initval == 0 || DIV_GET_EN_CLK_DIV_FACTOR(reg))
> +               clockdiv = cv1800_clk_regfield_get(reg, div);
> +       else if (div->initval > 0)
> +               clockdiv = div->initval;
> +
> +       return clockdiv;
> +}
> +
> +static u32 div_helper_round_rate(struct cv1800_clk_regfield *div,
> +                                struct clk_hw *hw, struct clk_hw *parent,
> +                                unsigned long rate, unsigned long *prate)
> +{
> +       if (div->width == 0) {
> +               if (div->initval <= 0)
> +                       return DIV_ROUND_UP_ULL(*prate, 1);
> +               else
> +                       return DIV_ROUND_UP_ULL(*prate, div->initval);
> +       }
> +
> +       return divider_round_rate_parent(hw, parent, rate, prate, NULL,
> +                                        div->width, div->flags);
> +}
> +
> +static long div_round_rate(struct clk_hw *parent, unsigned long *parent_rate,
> +                          unsigned long rate, int id, void *data)
> +{
> +       struct cv1800_clk_div *div = data;
> +
> +       return div_helper_round_rate(&div->div, &div->common.hw, parent,
> +                                    rate, parent_rate);
> +}
> +
> +static int div_helper_determine_rate(struct cv1800_clk_common *common,
> +                                    struct clk_rate_request *req,
> +                                    long (*round)(struct clk_hw *,
> +                                                  unsigned long *,
> +                                                  unsigned long,
> +                                                  int,
> +                                                  void *),
> +                                    void *data)
> +{
> +       unsigned long best_parent_rate = 0, best_rate = 0;
> +       struct clk_hw *best_parent, *hw = &common->hw;
> +       unsigned int i;
> +
> +       if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
> +               unsigned long adj_parent_rate;
> +
> +               best_parent = clk_hw_get_parent(hw);
> +               best_parent_rate = clk_hw_get_rate(best_parent);
> +
> +               best_rate = round(best_parent, &adj_parent_rate,
> +                                 req->rate, -1, data);
> +
> +               goto find;
> +       }
> +
> +       for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
> +               unsigned long tmp_rate, parent_rate;
> +               struct clk_hw *parent;
> +
> +               parent = clk_hw_get_parent_by_index(hw, i);
> +               if (!parent)
> +                       continue;
> +
> +               parent_rate = clk_hw_get_rate(parent);
> +
> +               tmp_rate = round(parent, &parent_rate, req->rate, i, data);
> +
> +               if (tmp_rate == req->rate) {
> +                       best_parent = parent;
> +                       best_parent_rate = parent_rate;
> +                       best_rate = tmp_rate;
> +                       goto find;
> +               }
> +
> +               if (cv1800_clk_is_better_rate(common, req->rate,
> +                                          tmp_rate, best_rate)) {
> +                       best_parent = parent;
> +                       best_parent_rate = parent_rate;
> +                       best_rate = tmp_rate;
> +               }
> +       }
> +
> +       if (best_rate == 0)
> +               return -EINVAL;
> +
> +find:
> +       req->best_parent_hw = best_parent;
> +       req->best_parent_rate = best_parent_rate;
> +       req->rate = best_rate;
> +       return 0;
> +}
> +
> +static int div_determine_rate(struct clk_hw *hw,
> +                             struct clk_rate_request *req)
> +{
> +       struct cv1800_clk_div *div = hw_to_cv1800_clk_div(hw);
> +
> +       return div_helper_determine_rate(&div->common, req,
> +                                        div_round_rate, div);
> +}

It's unfortunate that all this code needs to be written vs. using the
divider helpers. Why can't those be used?

> +
> +static unsigned long div_recalc_rate(struct clk_hw *hw,
> +                                    unsigned long parent_rate)
> +{
> +       struct cv1800_clk_div *div = hw_to_cv1800_clk_div(hw);
> +       unsigned long val;
> +
> +       val = div_helper_get_clockdiv(&div->common, &div->div);
> +       if (val == 0)
> +               return 0;
> +
> +       return divider_recalc_rate(hw, parent_rate, val, NULL,
> +                                  div->div.flags, div->div.width);
> +}
> +
> +static int div_set_rate(struct clk_hw *hw, unsigned long rate,
[..]
> +}
> +
> +static int aclk_is_enabled(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_audio *aclk = hw_to_cv1800_clk_audio(hw);
> +
> +       return cv1800_clk_checkbit(&aclk->common, &aclk->output_en);
> +}
> +
> +static int aclk_determine_rate(struct clk_hw *hw,
> +                              struct clk_rate_request *req)
> +{
> +       struct cv1800_clk_audio *aclk = hw_to_cv1800_clk_audio(hw);
> +
> +       req->rate = aclk->target_rate;
> +
> +       return 0;
> +}
> +
> +static unsigned long aclk_recalc_rate(struct clk_hw *hw,
> +                                     unsigned long parent_rate)
> +{
> +       struct cv1800_clk_audio *aclk = hw_to_cv1800_clk_audio(hw);
> +       u64 rate = parent_rate;
> +       u64 factor = 2;
> +       u32 regval;
> +
> +       if (!cv1800_clk_checkbit(&aclk->common, &aclk->div_en))
> +               return 0;
> +
> +       regval = readl(aclk->common.base + aclk->m.reg);
> +       factor *= cv1800_clk_regfield_get(regval, &aclk->m);
> +
> +       regval = readl(aclk->common.base + aclk->n.reg);
> +       rate *= cv1800_clk_regfield_get(regval, &aclk->n);
> +
> +       return DIV_ROUND_UP(rate, factor);

DIV64_U64_ROUND_UP

> +}
> +
> +static void aclk_determine_mn(unsigned long parent_rate, unsigned long rate,
> +                             u32 *m, u32 *n)
> +{
> +       u32 tm = parent_rate / 2;
> +       u32 tn = rate;
> +       u32 tcommon = gcd(tm, tn);
> +       *m = tm / tcommon;
> +       *n = tn / tcommon;
> +}
> +
> +
> diff --git a/drivers/clk/sophgo/clk-cv18xx-pll.c b/drivers/clk/sophgo/clk-cv18xx-pll.c
> new file mode 100644
> index 000000000000..8bf936f1312d
> --- /dev/null
> +++ b/drivers/clk/sophgo/clk-cv18xx-pll.c
> @@ -0,0 +1,464 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +
> +#include "clk-cv18xx-pll.h"
> +
> +#define _PLL_PRE_DIV_SEL_FIELD         GENMASK(6, 0)
> +#define _PLL_POST_DIV_SEL_FIELD                GENMASK(14, 8)
> +#define _PLL_SEL_MODE_FIELD            GENMASK(16, 15)
> +#define _PLL_DIV_SEL_FIELD             GENMASK(23, 17)
> +#define _PLL_ICTRL_FIELD               GENMASK(26, 24)
> +
> +#define _PLL_ALL_FIELD_MASK \
> +       (_PLL_PRE_DIV_SEL_FIELD | \
> +        _PLL_POST_DIV_SEL_FIELD | \
> +        _PLL_SEL_MODE_FIELD | \
> +        _PLL_DIV_SEL_FIELD | \
> +        _PLL_ICTRL_FIELD)
> +
> +#define PLL_COPY_REG(_dest, _src) \
> +       (((_dest) & (~_PLL_ALL_FIELD_MASK)) | ((_src) & _PLL_ALL_FIELD_MASK))
> +
> +#define PLL_GET_PRE_DIV_SEL(_reg) \
> +       FIELD_GET(_PLL_PRE_DIV_SEL_FIELD, (_reg))
> +#define PLL_GET_POST_DIV_SEL(_reg) \
> +       FIELD_GET(_PLL_POST_DIV_SEL_FIELD, (_reg))
> +#define PLL_GET_SEL_MODE(_reg) \
> +       FIELD_GET(_PLL_SEL_MODE_FIELD, (_reg))
> +#define PLL_GET_DIV_SEL(_reg) \
> +       FIELD_GET(_PLL_DIV_SEL_FIELD, (_reg))
> +#define PLL_GET_ICTRL(_reg) \
> +       FIELD_GET(_PLL_ICTRL_FIELD, (_reg))
> +
> +#define PLL_SET_PRE_DIV_SEL(_reg, _val) \
> +       _CV1800_SET_FIELD((_reg), (_val), _PLL_PRE_DIV_SEL_FIELD)
> +#define PLL_SET_POST_DIV_SEL(_reg, _val) \
> +       _CV1800_SET_FIELD((_reg), (_val), _PLL_POST_DIV_SEL_FIELD)
> +#define PLL_SET_SEL_MODE(_reg, _val) \
> +       _CV1800_SET_FIELD((_reg), (_val), _PLL_SEL_MODE_FIELD)
> +#define PLL_SET_DIV_SEL(_reg, _val) \
> +       _CV1800_SET_FIELD((_reg), (_val), _PLL_DIV_SEL_FIELD)
> +#define PLL_SET_ICTRL(_reg, _val) \
> +       _CV1800_SET_FIELD((_reg), (_val), _PLL_ICTRL_FIELD)
> +
> +#define for_each_pll_limit_range(_var, _restrict) \
> +       for (_var = (_restrict)->min; _var <= (_restrict)->max; _var++)

Can you put this macro near the struct that it's supposed to operate on?

> +
> +static inline struct cv1800_clk_pll *hw_to_cv1800_clk_pll(struct clk_hw *hw)
> +{
> +       struct cv1800_clk_common *common = hw_to_cv1800_clk_common(hw);
> +
> +       return container_of(common, struct cv1800_clk_pll, common);
> +}
> +
> +static unsigned long ipll_calc_rate(unsigned long parent_rate,
> +                                   unsigned long pre_div_sel,
> +                                   unsigned long div_sel,
> +                                   unsigned long post_div_sel)
> +{
> +       unsigned long rate = parent_rate;
> +
> +       rate *= div_sel;
> +       do_div(rate, pre_div_sel * post_div_sel);
> +
> +       return rate;
> +}
> +
> +static unsigned long ipll_recalc_rate(struct clk_hw *hw,
> +                                     unsigned long parent_rate)
> +{
> +       struct cv1800_clk_pll *pll = hw_to_cv1800_clk_pll(hw);
> +       u32 value;
> +
> +       value = readl(pll->common.base + pll->pll_reg);
> +
> +       return ipll_calc_rate(parent_rate,
> +                             PLL_GET_PRE_DIV_SEL(value),
> +                             PLL_GET_DIV_SEL(value),
[...]
> +
> +static bool fpll_is_factional_mode(struct cv1800_clk_pll *pll)
> +{
> +       return cv1800_clk_checkbit(&pll->common, &pll->pll_syn->en);
> +}
> +
> +static unsigned long fpll_calc_rate(unsigned long parent_rate,
> +                                   unsigned long pre_div_sel,
> +                                   unsigned long div_sel,
> +                                   unsigned long post_div_sel,
> +                                   unsigned long ssc_syn_set,
> +                                   bool is_full_parent)
> +{
> +       u64 dividend = parent_rate * div_sel;
> +       u64 factor = ssc_syn_set * pre_div_sel * post_div_sel;
> +       unsigned long rate;
> +
> +       dividend <<= PLL_SYN_FACTOR_DOT_POS - 1;
> +       rate = dividend / factor;
> +       dividend %= factor;
> +
> +       if (is_full_parent) {
> +               dividend <<= 1;
> +               rate <<= 1;
> +       }
> +
> +       rate += DIV_ROUND_CLOSEST(dividend, factor);

DIV64_U64_ROUND_CLOSEST

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
