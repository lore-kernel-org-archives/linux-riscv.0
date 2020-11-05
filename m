Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6E8C55178
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 07:17:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0403920825
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 07:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fdqDRHtS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NfcCnhu/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0403920825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T4fVoUXYArU6xZV7FoNHcFpLvcJ5HfADUl2NlY6xKfE=; b=fdqDRHtScocsyw5J5iCZyyyIw
	Z5gK8x8MdCl20Yrqi7oyt9PYeRrpRs+W9FVzqzLyAFSVhX2ftwpqT8OByJknOf1kRFW8BKREJK62W
	B7Sbz9zk/CufXRWnZws+ru8afePFRmroRe8r4jXAvnSBmxVrKOcWwI1hwQ4jLk4noxH5jBFZaxBLp
	bQOLADDemYvP1Ahy08gZ2WKbbV4vAFUqoGQ/4lHVS4tgRO0HhNIl/AuamfbBnSZDODhfyNUt7Vq0g
	0Ic6rouVHTVf94jDZFRPdEiO/A+JgyxyNfadhALGQCrB4Hkwt2EgIjIKgPxyxRlXnJ5wGceZTjDDr
	1TW/COYHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaZVp-0001ZM-Ho; Thu, 05 Nov 2020 07:16:49 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaZVm-0001Yo-73
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 07:16:47 +0000
Received: by mail-oi1-x244.google.com with SMTP id 9so709169oir.5
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 23:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZA0tcaelfi4vPXfLKUzyksU37FXQtlbKqMRl+WgX6M8=;
 b=NfcCnhu/w42/uQG2j448HJl/LDzAjFJhLKwWc+j3wswPP76RNSg72jVLGKiqvsHbgG
 d8i/DTYQZzLHPa7efJxIc+OuZKIYAB4S3FWX4vDrC0gEkkNo3ARevcgH+OnUjBAt/lsp
 WMGpT8W1o3k77P6/TBFMJiaTILTeHmPMc7ivZH3LUgkD6+QV/nDKilRA4ZrnnNfQjuZ2
 f3sxEs8IBDlMeDWVdqTw5lPEOdhWxh+LHDoXmtzwQh2Wc/33rQ/fDRGMjUzfu3zxqIES
 bDbS6tZEi2uWqJYZA4WK+S5+MJMHYb6vMggLIuSLatcty0I1YKWhz/Qr6q6HnRknfMAP
 mrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZA0tcaelfi4vPXfLKUzyksU37FXQtlbKqMRl+WgX6M8=;
 b=jj7P3Y2bcF99tBqDLuTS7328trDTB3FNMTTN1ZfZtpHdfrK/XpYM3zhFvBhALcstnM
 nSuDXMKqGsdLsiTZBbRoGawPkFRuz2KhLK0IOJFdx53xTH6wDBWk+8rVfdbpwk2z7Abo
 aA4YADyfbN09ol0n84Loo0bF7y98rj3DUdztvPk278x0yD/qdNYRePjs/kbyzArawM3K
 J0H70gUOPGJVCEC/+HzHK3GK3DUxXRmCIYoz2A5bsR/X/MyjtZVC5fZTd+obce0QuxuZ
 UmsIW6167p5fDXaRSPCo0meRsRaP6SXgBDJxBPwzLadDOPUm1xqTtNvRNh4raaVioNN9
 NqEw==
X-Gm-Message-State: AOAM532hrBuFy7StC1IVMYYJODyBQXycqG+rQdclspxiP9yzw+iH9/er
 VALPK6DfwUpmvOFIHeFtRZ1jxYCwC7zH9PHmBf1cFoeslMk=
X-Google-Smtp-Source: ABdhPJwxMW6GaWS3wgiDY7NBrqT8hQb5Q5TNbpAum2FT4XyQd/urrJKmvqnomOy6I9RhcrdgZReLX+e7Xc2dKQZbaEM=
X-Received: by 2002:aca:4b82:: with SMTP id y124mr741948oia.35.1604560603675; 
 Wed, 04 Nov 2020 23:16:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com>
 <8ad64f9814137c5255d43d4ba670b5fcd15837ab.1602838910.git.zong.li@sifive.com>
 <160454464591.3965362.9361884545184336266@swboyd.mtv.corp.google.com>
In-Reply-To: <160454464591.3965362.9361884545184336266@swboyd.mtv.corp.google.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Nov 2020 15:16:30 +0800
Message-ID: <CANXhq0rbkRc3kKAPsbR=Tg5uqvazOqSZwzEEOp7std_Tf5LhHA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: sifive: Refactor __prci_clock array by using
 macro
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_021646_448419_1397F99D 
X-CRM114-Status: GOOD (  24.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 5, 2020 at 10:50 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2020-10-16 02:18:26)
> > Refactor code by using DEFINE_PRCI_CLOCK to define each clock
> > and reduce duplicate code.
>
> What is duplicate?

Sorry for unclear description, actually, I want to say that we can
remove the repeating code about initializing the data member of
structure.

>
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/clk/sifive/fu540-prci.c  | 38 ++++++----------
> >  drivers/clk/sifive/fu540-prci.h  |  2 +-
> >  drivers/clk/sifive/fu740-prci.c  | 74 ++++++++++++--------------------
> >  drivers/clk/sifive/fu740-prci.h  |  2 +-
> >  drivers/clk/sifive/sifive-prci.c |  2 +-
> >  drivers/clk/sifive/sifive-prci.h | 10 ++++-
> >  6 files changed, 53 insertions(+), 75 deletions(-)
> >
> > diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
> > index 840b97bfff85..d43b9a9984f6 100644
> > --- a/drivers/clk/sifive/fu540-prci.c
> > +++ b/drivers/clk/sifive/fu540-prci.c
> > @@ -54,29 +54,19 @@ static const struct clk_ops sifive_fu540_prci_tlclksel_clk_ops = {
> >         .recalc_rate = sifive_prci_tlclksel_recalc_rate,
> >  };
> >
> > +DEFINE_PRCI_CLOCK(fu540, corepll, hfclk,
> > +                 &sifive_fu540_prci_wrpll_clk_ops, &__prci_corepll_data);
> > +DEFINE_PRCI_CLOCK(fu540, ddrpll, hfclk,
> > +                 &sifive_fu540_prci_wrpll_ro_clk_ops, &__prci_ddrpll_data);
> > +DEFINE_PRCI_CLOCK(fu540, gemgxlpll, hfclk,
> > +                 &sifive_fu540_prci_wrpll_clk_ops, &__prci_gemgxlpll_data);
> > +DEFINE_PRCI_CLOCK(fu540, tlclk, corepll,
> > +                 &sifive_fu540_prci_tlclksel_clk_ops, NULL);
>
> Readability looks to decrease with this change. Why should all us code
> reviewers suffer because the code author wants to type a few less
> characters? Named initializers are useful so we don't have to hold each
> macro argument in our head and map it to the struct member that is being
> initialized.

Ok, as you mentioned, macro reduce the readability, let me remove this
change in the next version.

>
> > +
> >  /* List of clock controls provided by the PRCI */
> > -struct __prci_clock __prci_init_clocks_fu540[] = {
> > -       [PRCI_CLK_COREPLL] = {
> > -               .name = "corepll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu540_prci_wrpll_clk_ops,
> > -               .pwd = &__prci_corepll_data,
> > -       },
> > -       [PRCI_CLK_DDRPLL] = {
> > -               .name = "ddrpll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu540_prci_wrpll_ro_clk_ops,
> > -               .pwd = &__prci_ddrpll_data,
> > -       },
> > -       [PRCI_CLK_GEMGXLPLL] = {
> > -               .name = "gemgxlpll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu540_prci_wrpll_clk_ops,
> > -               .pwd = &__prci_gemgxlpll_data,
> > -       },
> > -       [PRCI_CLK_TLCLK] = {
> > -               .name = "tlclk",
> > -               .parent_name = "corepll",
> > -               .ops = &sifive_fu540_prci_tlclksel_clk_ops,
> > -       },
> > +struct __prci_clock *__prci_init_clocks_fu540[] = {
> > +       [PRCI_CLK_COREPLL]      = &fu540_corepll,
> > +       [PRCI_CLK_DDRPLL]       = &fu540_ddrpll,
> > +       [PRCI_CLK_GEMGXLPLL]    = &fu540_gemgxlpll,
> > +       [PRCI_CLK_TLCLK]        = &fu540_tlclk,
> >  };
> > diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> > index c8271efa7bdc..281200cd8848 100644
> > --- a/drivers/clk/sifive/fu540-prci.h
> > +++ b/drivers/clk/sifive/fu540-prci.h
> > @@ -11,7 +11,7 @@
> >
> >  #define NUM_CLOCK_FU540        4
> >
> > -extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> > +extern struct __prci_clock *__prci_init_clocks_fu540[NUM_CLOCK_FU540];
> >
> >  static const struct prci_clk_desc prci_clk_fu540 = {
> >         .clks = __prci_init_clocks_fu540,
> > diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
> > index 3b87e273c3eb..676cad2c3886 100644
> > --- a/drivers/clk/sifive/fu740-prci.c
> > +++ b/drivers/clk/sifive/fu740-prci.c
> > @@ -71,52 +71,32 @@ static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
> >         .recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
> >  };
> >
> > +
> > +DEFINE_PRCI_CLOCK(fu740, corepll, hfclk,
> > +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_corepll_data);
> > +DEFINE_PRCI_CLOCK(fu740, ddrpll, hfclk,
> > +                 &sifive_fu740_prci_wrpll_ro_clk_ops, &__prci_ddrpll_data);
> > +DEFINE_PRCI_CLOCK(fu740, gemgxlpll, hfclk,
> > +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_gemgxlpll_data);
> > +DEFINE_PRCI_CLOCK(fu740, dvfscorepll, hfclk,
> > +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_dvfscorepll_data);
> > +DEFINE_PRCI_CLOCK(fu740, hfpclkpll, hfclk,
> > +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_hfpclkpll_data);
> > +DEFINE_PRCI_CLOCK(fu740, cltxpll, hfclk,
> > +                 &sifive_fu740_prci_wrpll_clk_ops, &__prci_cltxpll_data);
> > +DEFINE_PRCI_CLOCK(fu740, tlclk, corepll,
> > +                 &sifive_fu740_prci_tlclksel_clk_ops, NULL);
> > +DEFINE_PRCI_CLOCK(fu740, pclk, hfpclkpll,
> > +                 &sifive_fu740_prci_hfpclkplldiv_clk_ops, NULL);
> > +
> >  /* List of clock controls provided by the PRCI */
> > -struct __prci_clock __prci_init_clocks_fu740[] = {
> > -       [PRCI_CLK_COREPLL] = {
> > -               .name = "corepll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> > -               .pwd = &__prci_corepll_data,
> > -       },
> > -       [PRCI_CLK_DDRPLL] = {
> > -               .name = "ddrpll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu740_prci_wrpll_ro_clk_ops,
> > -               .pwd = &__prci_ddrpll_data,
> > -       },
> > -       [PRCI_CLK_GEMGXLPLL] = {
> > -               .name = "gemgxlpll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> > -               .pwd = &__prci_gemgxlpll_data,
> > -       },
> > -       [PRCI_CLK_DVFSCOREPLL] = {
> > -               .name = "dvfscorepll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> > -               .pwd = &__prci_dvfscorepll_data,
> > -       },
> > -       [PRCI_CLK_HFPCLKPLL] = {
> > -               .name = "hfpclkpll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> > -               .pwd = &__prci_hfpclkpll_data,
> > -       },
> > -       [PRCI_CLK_CLTXPLL] = {
> > -               .name = "cltxpll",
> > -               .parent_name = "hfclk",
> > -               .ops = &sifive_fu740_prci_wrpll_clk_ops,
> > -               .pwd = &__prci_cltxpll_data,
> > -       },
> > -       [PRCI_CLK_TLCLK] = {
> > -               .name = "tlclk",
> > -               .parent_name = "corepll",
> > -               .ops = &sifive_fu740_prci_tlclksel_clk_ops,
> > -       },
> > -       [PRCI_CLK_PCLK] = {
> > -               .name = "pclk",
> > -               .parent_name = "hfpclkpll",
> > -               .ops = &sifive_fu740_prci_hfpclkplldiv_clk_ops,
> > -       },
> > +struct __prci_clock *__prci_init_clocks_fu740[] = {
> > +       [PRCI_CLK_COREPLL]      = &fu740_corepll,
> > +       [PRCI_CLK_DDRPLL]       = &fu740_ddrpll,
> > +       [PRCI_CLK_GEMGXLPLL]    = &fu740_gemgxlpll,
> > +       [PRCI_CLK_DVFSCOREPLL]  = &fu740_dvfscorepll,
> > +       [PRCI_CLK_HFPCLKPLL]    = &fu740_hfpclkpll,
> > +       [PRCI_CLK_CLTXPLL]      = &fu740_cltxpll,
> > +       [PRCI_CLK_TLCLK]        = &fu740_tlclk,
> > +       [PRCI_CLK_PCLK]         = &fu740_pclk,
> >  };
>
> I suppose this is fine and then non-macro structs above this array of
> pointers.
>
> > diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
> > index 13ef971f7764..3f03295f719a 100644
> > --- a/drivers/clk/sifive/fu740-prci.h
> > +++ b/drivers/clk/sifive/fu740-prci.h
> > @@ -11,7 +11,7 @@
> >
> >  #define NUM_CLOCK_FU740        8
> >
> > -extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
> > +extern struct __prci_clock *__prci_init_clocks_fu740[NUM_CLOCK_FU740];
> >
> >  static const struct prci_clk_desc prci_clk_fu740 = {
> >         .clks = __prci_init_clocks_fu740,
> > diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> > index 4098dbc5881a..2ef3f9f91b33 100644
> > --- a/drivers/clk/sifive/sifive-prci.c
> > +++ b/drivers/clk/sifive/sifive-prci.c
> > @@ -431,7 +431,7 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
> >
> >         /* Register PLLs */
> >         for (i = 0; i < desc->num_clks; ++i) {
> > -               pic = &(desc->clks[i]);
> > +               pic = desc->clks[i];
>
> This is related how?
>
> >
> >                 init.name = pic->name;
> >                 init.parent_names = &pic->parent_name;
> > diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
> > index bc0646bc9c3e..e6c9f72e20de 100644
> > --- a/drivers/clk/sifive/sifive-prci.h
> > +++ b/drivers/clk/sifive/sifive-prci.h
> > @@ -253,6 +253,14 @@ struct __prci_clock {
> >         struct __prci_data *pd;
> >  };
> >
> > +#define DEFINE_PRCI_CLOCK(_platform, _name, _parent, _ops, _pwd)       \
> > +       static struct __prci_clock _platform##_##_name = {              \
> > +               .name = #_name,                                         \
> > +               .parent_name = #_parent,                                \
> > +               .ops = _ops,                                            \
> > +               .pwd = _pwd,                                            \
> > +       }                                                               \
> > +
> >  #define clk_hw_to_prci_clock(pwd) container_of(pwd, struct __prci_clock, hw)
> >
> >  /*
> > @@ -261,7 +269,7 @@ struct __prci_clock {
> >   * @num_clks: the number of element of clks
> >   */
> >  struct prci_clk_desc {
> > -       struct __prci_clock *clks;
> > +       struct __prci_clock **clks;
>
> Huh? Nothing in the commit text mentions this.
>

Because I introduce the macro in this patch, so the type of array
__prci_init_clocks_fuXXX are changed to pointer which point to
__prci_clock, the related use need to be changed as well. It would be
recover due to discarding this patch.

> >         size_t num_clks;
> >  };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
