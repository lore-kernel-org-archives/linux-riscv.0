Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85924C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 23:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNrXOikSC+UkCxB0K9eRu4PSSha3hyW7QhC77ae6ogY=; b=ovOM/1QUhMUbYO
	LmXNo/oWbamij9bonl8g58s5Jv8QiCO6KsoCWZJL5OpppcUGbXLtQlH8Q+wEb70rcmx2Ec2LnVfRZ
	0bIIrQE6LXbLSYgvWKywS1UbmB7WlkvKZVorDNVWQ7TRMo3ZsnUXDFXg+U352gXO/WOppazEsafo0
	VyAe3wRonVZwdyxnljpvbV/k/7377N15zrxfKHEh736bAE88AxPdq+C45isMzgH9ITndfbmfR+bru
	UO9x8uc3YpVgN1WvMTQIDl6bnHVPPaqq6dP8p75CrPcdxhH8cWY9jFQVV3JlaZqemKWs3VabJ8kOr
	/W5bAILZVX2S2CHiK8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRgYq-0000000C3TG-1FUz;
	Wed, 10 Jul 2024 23:17:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRgYn-0000000C3SE-37PX
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 23:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8ABDCE17E3;
	Wed, 10 Jul 2024 23:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB6C4AF07;
	Wed, 10 Jul 2024 23:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720653435;
	bh=Jd3wkWpGIxjVE8bZuw1tGBEUQpwx9hG4gsdHuzurtTM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=t2haqyCcJw9sr2yZK5l1zj+YhLnEb/FRj6I69HzdAMOqFUg0ApMQesfJ95wG4i6N2
	 pzDekhpOYN6r9sbty0qVx9g1Jvx+Y/8jCTEw/iL6sXgDvJn88FkIrR4croxZMHbl10
	 /j4QO0CQWqxaSbmE2cZCtCT2nkwcuKFildztLjt3FSpqhyAEFVG+rFlsPpSlTGoPY2
	 kKCZxDLLPKKkmaQ8mN4IgCNuSNq8d986tEHFVUvTszT9ipKROy0yGZbtXTe01fp0Ii
	 jko+aFhjpzgeBBc3agNERAjpSmj6Qo7rP6ghntuTvWG1I59tup4bkc18Sq7acJ1ih3
	 EqJtmZ46F9miw==
Message-ID: <d36ff27b56b3e9c8ef490bfd9d24761d.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240623-th1520-clk-v2-2-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com> <20240623-th1520-clk-v2-2-ad8d6432d9fb@tenstorrent.com>
Subject: Re: [PATCH v2 2/7] clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Yangtao Li <frank.li@vivo.com>
Date: Wed, 10 Jul 2024 16:17:12 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_161718_162766_355D4D1F 
X-CRM114-Status: GOOD (  17.77  )
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

Quoting Drew Fustini (2024-06-23 19:12:32)
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> new file mode 100644
> index 000000000000..982d4d40f783
> --- /dev/null
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -0,0 +1,1086 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
> + *  Authors: Yangtao Li <frank.li@vivo.com>
> + */
> +
> +#include <dt-bindings/clock/thead,th1520-clk-ap.h>

Preferably include dt-bindings after linux includes.

> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define TH1520_PLL_POSTDIV2    GENMASK(26, 24)
> +#define TH1520_PLL_POSTDIV1    GENMASK(22, 20)
> +#define TH1520_PLL_FBDIV       GENMASK(19, 8)
> +#define TH1520_PLL_REFDIV      GENMASK(5, 0)
> +#define TH1520_PLL_BYPASS      BIT(30)
> +#define TH1520_PLL_DSMPD       BIT(24)
> +#define TH1520_PLL_FRAC                GENMASK(23, 0)
> +#define TH1520_PLL_FRAC_BITS    24
[...]
> +
> +static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct ccu_pll *pll = hw_to_ccu_pll(hw);
> +       unsigned long div, mul, frac, rate = parent_rate;
> +       unsigned int cfg0, cfg1;
> +
> +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> +
> +       mul = FIELD_GET(TH1520_PLL_FBDIV, cfg0);
> +       div = FIELD_GET(TH1520_PLL_REFDIV, cfg0);
> +       if (!(cfg1 & TH1520_PLL_DSMPD)) {
> +               mul <<= TH1520_PLL_FRAC_BITS;
> +               frac = FIELD_GET(TH1520_PLL_FRAC, cfg1);
> +               mul += frac;
> +               div <<= TH1520_PLL_FRAC_BITS;
> +       }
> +       rate = parent_rate * mul;
> +       do_div(rate, div);

'rate' is only unsigned long, so do_div() isn't needed here. Perhaps if
'parent_rate * mul' can overflow 32-bits then 'rate' should be
u64.

> +       return rate;
> +}
> +
> +static unsigned long th1520_pll_postdiv_recalc_rate(struct clk_hw *hw,
> +                                                   unsigned long parent_rate)
> +{
> +       struct ccu_pll *pll = hw_to_ccu_pll(hw);
> +       unsigned long rate = parent_rate;
> +       unsigned int cfg0, cfg1;
> +
> +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> +
> +       if (cfg1 & TH1520_PLL_BYPASS)
> +               return rate;
> +
> +       do_div(rate, FIELD_GET(TH1520_PLL_POSTDIV1, cfg0) *

Same, 'rate' is unsigned long. Did you get some compilation error
without this? How big is the divisor going to be? The fields are only
3-bits wide, so the multiplication would fit into a u32 just fine. Given
that 'rate' is unsigned long though I think you can just put the
multiplication result into a local variable that's also unsigned long
and then just write the divide with unsigned longs

	div = FIELD_GET(...) * FIELD_GET(...);

	return rate / div;

> +                    FIELD_GET(TH1520_PLL_POSTDIV2, cfg0));
> +
> +       return rate;
> +}
> +
> +static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> +                                        unsigned long parent_rate)
> +{
> +       unsigned long rate = parent_rate;
> +
> +       rate = th1520_pll_vco_recalc_rate(hw, rate);
> +       rate = th1520_pll_postdiv_recalc_rate(hw, rate);
> +
> +       return rate;
> +}

Please fold this in

----8<---
diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 982d4d40f783..0c3821d50765 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -411,7 +411,7 @@ static const struct clk_parent_data c910_i0_parents[] = {
 	{ .index = 0 }
 };
 
-struct ccu_mux c910_i0_clk = {
+static struct ccu_mux c910_i0_clk = {
 	.mux	= TH_CCU_ARG(1, 1),
 	.common	= {
 		.clkid		= CLK_C910_I0,
@@ -428,7 +428,7 @@ static const struct clk_parent_data c910_parents[] = {
 	{ .hw = &cpu_pll1_clk.common.hw }
 };
 
-struct ccu_mux c910_clk = {
+static struct ccu_mux c910_clk = {
 	.mux	= TH_CCU_ARG(0, 1),
 	.common	= {
 		.clkid		= CLK_C910,
@@ -845,7 +845,7 @@ static const struct clk_parent_data uart_sclk_parents[] = {
 	{ .index = 0 },
 };
 
-struct ccu_mux uart_sclk = {
+static struct ccu_mux uart_sclk = {
 	.mux	= TH_CCU_ARG(0, 1),
 	.common	= {
 		.clkid          = CLK_UART_SCLK,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
