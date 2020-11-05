Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41938C00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D0D620A8B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VpRQx+W/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dCqF1fbk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ye/hPkoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D0D620A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JTbDaAxVicsZzjcp6PhxhKZGnERsOhLtSOi0qVXFczU=; b=VpRQx+W/kKJazYUtkl4JBnbiB
	CeJXF7HNScD3qXHbS9f5Iv8Dojj5GhoJZ4DTxOpXVjKSQYmv/KrA/T9c6aeEb16U/eCirUu720Zy2
	V1XE1UJTM3lzyd19EzXPuUiWDiiTGhBNOX3ijZN72JM/nl0MTPZYS8DYOKmMvXRYubikA+Iz/GqLi
	p6Li/vZ6tIbuKvfaixGt6IGkDgDxVdat/YGaIBpGGT4WTZ3BoyNelCKvcsX4fdtNUMbhcP3rzHwk0
	yOWYdVPUi68ZXXbc+USybxDAI5APyCr/U1Arh6OHk6WNi5ouvR33tr7FfDk9CRBIf/AZLEQlwPLMV
	VIWrC6uYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaW14-0001Ln-PH; Thu, 05 Nov 2020 03:32:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW12-00016k-Sq
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:Date:To:Cc:From:Subject:
 References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=n0GUjnhyLReYXoXZshVpSRAOFPirZJCrGlmGDNfsxzk=; b=dCqF1fbk/BihC9s6shhDSTxNfi
 FsgiGp6OQp0Tt7TEqlUDc5TmEyae/cWuzKsk4DMLt28ucOz5yRkEI2NKTxZ0nZ6N+9Ff4PCKXXUiy
 xRrGD2CReP4Jd7apdFZFgz95aLXA16D8m2vYq6D23KIWoryOtf5PeA0Cv861imYpQOArAZ2oW6isF
 klpv3PDq0MVpiqgRcdsUYScQAo1PnjzSnBsoR8jXrdYYgEkqO5GS4bUp6Fn7mKsjA2ZV9xzJ+TP6N
 F67CrrsMUYMX3nuHJz9wAV6JBxF1u7zUxBRTo0Rt4RYyJ0Cd51BZivdoaLAZjRiVkBfrz0AhWroGb
 ZEqRDvOw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaVMR-0000Kg-PB
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 02:50:54 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75A2920825;
 Thu,  5 Nov 2020 02:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604544647;
 bh=s9TmciBG4hvcsBn5EOIsicR/HDbAaQeCGdnoHYH8AQo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ye/hPkoXGGk/wr9ge36IzFFs9zzVxX8hffZxSf8AZsRvQVdU4v6lPJ3nH6KLfYyJC
 nslmXovseDS1qfsLmcf+OevTS90dt4jr4IFzb/OC0shoji1IbKqnPyykvw/feiNhGn
 u21r4r9PKzObyQZtImbiYvSKaU3WfVjIia2tih6M=
MIME-Version: 1.0
In-Reply-To: <8ad64f9814137c5255d43d4ba670b5fcd15837ab.1602838910.git.zong.li@sifive.com>
References: <cover.1602838910.git.zong.li@sifive.com>
 <8ad64f9814137c5255d43d4ba670b5fcd15837ab.1602838910.git.zong.li@sifive.com>
Subject: Re: [PATCH 4/4] clk: sifive: Refactor __prci_clock array by using
 macro
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, yash.shah@sifive.com
Date: Wed, 04 Nov 2020 18:50:45 -0800
Message-ID: <160454464591.3965362.9361884545184336266@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_025052_319841_73221D48 
X-CRM114-Status: GOOD (  20.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-10-16 02:18:26)
> Refactor code by using DEFINE_PRCI_CLOCK to define each clock
> and reduce duplicate code.

What is duplicate?

> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/clk/sifive/fu540-prci.c  | 38 ++++++----------
>  drivers/clk/sifive/fu540-prci.h  |  2 +-
>  drivers/clk/sifive/fu740-prci.c  | 74 ++++++++++++--------------------
>  drivers/clk/sifive/fu740-prci.h  |  2 +-
>  drivers/clk/sifive/sifive-prci.c |  2 +-
>  drivers/clk/sifive/sifive-prci.h | 10 ++++-
>  6 files changed, 53 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
> index 840b97bfff85..d43b9a9984f6 100644
> --- a/drivers/clk/sifive/fu540-prci.c
> +++ b/drivers/clk/sifive/fu540-prci.c
> @@ -54,29 +54,19 @@ static const struct clk_ops sifive_fu540_prci_tlclksel_clk_ops = {
>         .recalc_rate = sifive_prci_tlclksel_recalc_rate,
>  };
>  
> +DEFINE_PRCI_CLOCK(fu540, corepll, hfclk,
> +                 &sifive_fu540_prci_wrpll_clk_ops, &__prci_corepll_data);
> +DEFINE_PRCI_CLOCK(fu540, ddrpll, hfclk,
> +                 &sifive_fu540_prci_wrpll_ro_clk_ops, &__prci_ddrpll_data);
> +DEFINE_PRCI_CLOCK(fu540, gemgxlpll, hfclk,
> +                 &sifive_fu540_prci_wrpll_clk_ops, &__prci_gemgxlpll_data);
> +DEFINE_PRCI_CLOCK(fu540, tlclk, corepll,
> +                 &sifive_fu540_prci_tlclksel_clk_ops, NULL);

Readability looks to decrease with this change. Why should all us code
reviewers suffer because the code author wants to type a few less
characters? Named initializers are useful so we don't have to hold each
macro argument in our head and map it to the struct member that is being
initialized.

> +
>  /* List of clock controls provided by the PRCI */
> -struct __prci_clock __prci_init_clocks_fu540[] = {
> -       [PRCI_CLK_COREPLL] = {
> -               .name = "corepll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu540_prci_wrpll_clk_ops,
> -               .pwd = &__prci_corepll_data,
> -       },
> -       [PRCI_CLK_DDRPLL] = {
> -               .name = "ddrpll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu540_prci_wrpll_ro_clk_ops,
> -               .pwd = &__prci_ddrpll_data,
> -       },
> -       [PRCI_CLK_GEMGXLPLL] = {
> -               .name = "gemgxlpll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu540_prci_wrpll_clk_ops,
> -               .pwd = &__prci_gemgxlpll_data,
> -       },
> -       [PRCI_CLK_TLCLK] = {
> -               .name = "tlclk",
> -               .parent_name = "corepll",
> -               .ops = &sifive_fu540_prci_tlclksel_clk_ops,
> -       },
> +struct __prci_clock *__prci_init_clocks_fu540[] = {
> +       [PRCI_CLK_COREPLL]      = &fu540_corepll,
> +       [PRCI_CLK_DDRPLL]       = &fu540_ddrpll,
> +       [PRCI_CLK_GEMGXLPLL]    = &fu540_gemgxlpll,
> +       [PRCI_CLK_TLCLK]        = &fu540_tlclk,
>  };
> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> index c8271efa7bdc..281200cd8848 100644
> --- a/drivers/clk/sifive/fu540-prci.h
> +++ b/drivers/clk/sifive/fu540-prci.h
> @@ -11,7 +11,7 @@
>  
>  #define NUM_CLOCK_FU540        4
>  
> -extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> +extern struct __prci_clock *__prci_init_clocks_fu540[NUM_CLOCK_FU540];
>  
>  static const struct prci_clk_desc prci_clk_fu540 = {
>         .clks = __prci_init_clocks_fu540,
> diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
> index 3b87e273c3eb..676cad2c3886 100644
> --- a/drivers/clk/sifive/fu740-prci.c
> +++ b/drivers/clk/sifive/fu740-prci.c
> @@ -71,52 +71,32 @@ static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
>         .recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
>  };
>  
> +
> +DEFINE_PRCI_CLOCK(fu740, corepll, hfclk,
> +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_corepll_data);
> +DEFINE_PRCI_CLOCK(fu740, ddrpll, hfclk,
> +                 &sifive_fu740_prci_wrpll_ro_clk_ops, &__prci_ddrpll_data);
> +DEFINE_PRCI_CLOCK(fu740, gemgxlpll, hfclk,
> +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_gemgxlpll_data);
> +DEFINE_PRCI_CLOCK(fu740, dvfscorepll, hfclk,
> +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_dvfscorepll_data);
> +DEFINE_PRCI_CLOCK(fu740, hfpclkpll, hfclk,
> +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_hfpclkpll_data);
> +DEFINE_PRCI_CLOCK(fu740, cltxpll, hfclk,
> +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_cltxpll_data);
> +DEFINE_PRCI_CLOCK(fu740, tlclk, corepll,
> +                 &sifive_fu740_prci_tlclksel_clk_ops, NULL);
> +DEFINE_PRCI_CLOCK(fu740, pclk, hfpclkpll,
> +                 &sifive_fu740_prci_hfpclkplldiv_clk_ops, NULL);
> +
>  /* List of clock controls provided by the PRCI */
> -struct __prci_clock __prci_init_clocks_fu740[] = {
> -       [PRCI_CLK_COREPLL] = {
> -               .name = "corepll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> -               .pwd = &__prci_corepll_data,
> -       },
> -       [PRCI_CLK_DDRPLL] = {
> -               .name = "ddrpll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu740_prci_wrpll_ro_clk_ops,
> -               .pwd = &__prci_ddrpll_data,
> -       },
> -       [PRCI_CLK_GEMGXLPLL] = {
> -               .name = "gemgxlpll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> -               .pwd = &__prci_gemgxlpll_data,
> -       },
> -       [PRCI_CLK_DVFSCOREPLL] = {
> -               .name = "dvfscorepll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> -               .pwd = &__prci_dvfscorepll_data,
> -       },
> -       [PRCI_CLK_HFPCLKPLL] = {
> -               .name = "hfpclkpll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> -               .pwd = &__prci_hfpclkpll_data,
> -       },
> -       [PRCI_CLK_CLTXPLL] = {
> -               .name = "cltxpll",
> -               .parent_name = "hfclk",
> -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> -               .pwd = &__prci_cltxpll_data,
> -       },
> -       [PRCI_CLK_TLCLK] = {
> -               .name = "tlclk",
> -               .parent_name = "corepll",
> -               .ops = &sifive_fu740_prci_tlclksel_clk_ops,
> -       },
> -       [PRCI_CLK_PCLK] = {
> -               .name = "pclk",
> -               .parent_name = "hfpclkpll",
> -               .ops = &sifive_fu740_prci_hfpclkplldiv_clk_ops,
> -       },
> +struct __prci_clock *__prci_init_clocks_fu740[] = {
> +       [PRCI_CLK_COREPLL]      = &fu740_corepll,
> +       [PRCI_CLK_DDRPLL]       = &fu740_ddrpll,
> +       [PRCI_CLK_GEMGXLPLL]    = &fu740_gemgxlpll,
> +       [PRCI_CLK_DVFSCOREPLL]  = &fu740_dvfscorepll,
> +       [PRCI_CLK_HFPCLKPLL]    = &fu740_hfpclkpll,
> +       [PRCI_CLK_CLTXPLL]      = &fu740_cltxpll,
> +       [PRCI_CLK_TLCLK]        = &fu740_tlclk,
> +       [PRCI_CLK_PCLK]         = &fu740_pclk,
>  };

I suppose this is fine and then non-macro structs above this array of
pointers.

> diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
> index 13ef971f7764..3f03295f719a 100644
> --- a/drivers/clk/sifive/fu740-prci.h
> +++ b/drivers/clk/sifive/fu740-prci.h
> @@ -11,7 +11,7 @@
>  
>  #define NUM_CLOCK_FU740        8
>  
> -extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
> +extern struct __prci_clock *__prci_init_clocks_fu740[NUM_CLOCK_FU740];
>  
>  static const struct prci_clk_desc prci_clk_fu740 = {
>         .clks = __prci_init_clocks_fu740,
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index 4098dbc5881a..2ef3f9f91b33 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -431,7 +431,7 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
>  
>         /* Register PLLs */
>         for (i = 0; i < desc->num_clks; ++i) {
> -               pic = &(desc->clks[i]);
> +               pic = desc->clks[i];

This is related how?

>  
>                 init.name = pic->name;
>                 init.parent_names = &pic->parent_name;
> diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
> index bc0646bc9c3e..e6c9f72e20de 100644
> --- a/drivers/clk/sifive/sifive-prci.h
> +++ b/drivers/clk/sifive/sifive-prci.h
> @@ -253,6 +253,14 @@ struct __prci_clock {
>         struct __prci_data *pd;
>  };
>  
> +#define DEFINE_PRCI_CLOCK(_platform, _name, _parent, _ops, _pwd)       \
> +       static struct __prci_clock _platform##_##_name = {              \
> +               .name = #_name,                                         \
> +               .parent_name = #_parent,                                \
> +               .ops = _ops,                                            \
> +               .pwd = _pwd,                                            \
> +       }                                                               \
> +
>  #define clk_hw_to_prci_clock(pwd) container_of(pwd, struct __prci_clock, hw)
>  
>  /*
> @@ -261,7 +269,7 @@ struct __prci_clock {
>   * @num_clks: the number of element of clks
>   */
>  struct prci_clk_desc {
> -       struct __prci_clock *clks;
> +       struct __prci_clock **clks;

Huh? Nothing in the commit text mentions this.

>         size_t num_clks;
>  };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
