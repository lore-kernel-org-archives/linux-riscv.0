Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84f/zb/K4RDRB7r6KMW16p2paOUEitg16I0/ctA44Pc=; b=BX/IvuyY6I3lvp
	VlliBKJmp/Y/ibEqptzCI4DGD2RsXsOuy9HlI0+q0u72/t+IZRb4+FobO+YHcfybr95waF3NTmSav
	zVAuochPEMRZU9VycQmF3pMCtaOIufMk5DnllVu5ECDUof3lXA8TmHJ+ufWzO/HjRw1h71SBaXrtw
	zmEYGFJZmkFoLbCqOgzSXW7JfwE6scf7gKSxId0JxtzYG2Fbm1J4a+y6baHLYXEcLssCnrO6XGKwc
	R1QdPx8glzZ/QIrMmKmF2trAl/NQXAGZyNBDPBRxepN99gHNyvhLNQQ4MCFteZ39+L72UoIo4EHIz
	9KotiZiew4DmFnazmeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4Et-00EAXV-H6; Wed, 05 Oct 2022 13:15:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4Eq-00EARq-Ow
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 13:15:06 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DCD503F19B
	for <linux-riscv@lists.infradead.org>; Wed,  5 Oct 2022 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1664975700;
	bh=43tB+oN5u9kqV99UwdxFly8NamC26x6sMRPje8H/VPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=A97f/eO55jo0b6mJfSeZGgEYxvOO3SrvwLyDvSzT22zwRndwFEe+0pLgVexKDNYph
	 CltGFMk6NT6k/tvmUN4YJanae0bAZsVCCqs7HhhIf61W7iQMJ+hj7+S9+AJl3EdTmx
	 GMDSbseS7UQ4xP5xmi1Qi5/0JMPQvBjAl233YGz+NqKPfzULigiHWs6zTpxmkPUlXb
	 JjEcbgkLkr5+v1UMBD4rshEkyYkPJYian1kWXUT4aQsDEZOA6mrF04TziGp1c96YfI
	 BxfJt5aFk/iI5MrTXPfU9ruHUmfWzArIfwup1H4zbtx/EA8/7KejGapvUoNk+6sz0c
	 8hTVZ8Fe0FrGw==
Received: by mail-qk1-f199.google.com with SMTP id bl17-20020a05620a1a9100b006cdf19243acso14104454qkb.4
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 06:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=43tB+oN5u9kqV99UwdxFly8NamC26x6sMRPje8H/VPc=;
        b=6ex+kl2ntcxEGXIg5PZTkwW0NItKrVDigPxMF+LA+jxxyRhApvJKhi1n5d7vSuhA+e
         n8qzSfqN3TrvD+BB2a2g+aQlpwkM25y2uG2d0HFRpsARCIcFbvTAf0C0CQlz1VqydNKQ
         oZgZNl5eBtEgXUbfFaXMT5Wr78NOdCnwSyvirdqXrMGEEviiFrsiCS7zHECox/nzpJcg
         dCd7rP6V/8+j79rFTnZN9pI8eYczRBrtXIPoz1aX8OsHKDri0NdUUTPuXEBwzYhhxiTF
         hYyYqbsRCCdT82k8Odzc51Qy8ZYE1Gi4Zgr4/Ja+jS5HH19Xs+U9z/QjXbkjHAQx8ipl
         oLzg==
X-Gm-Message-State: ACrzQf3sjcO+iqJe5VvEwK/UsMUFEuxuP4vh/O1aSqqc3ZgEo+mRu08v
	vllPYeD76TwtNgwftvLTgww/3kttif2sxZFFx0dR2UDoJVXcAy6om+5xcWeCpVPMbBjMtjLvskp
	1El6s9oboYN/JojPCJ18qbSOnNni+SB9L6aIK6rXZ1UPhUKBs4vMrWHTlWzfwPQ==
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr23582919qvb.5.1664975699966;
        Wed, 05 Oct 2022 06:14:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wt/vXR3jPZ0ZzH+M8vyR7l4+/c8ynGqR4VHfaN5+wFmw2zgoeKxSLqm3HFrEhtrfCmvkn8FDOVAHCdxyUUpg=
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id
 gc1-20020a056214230100b004989f6f028dmr23582896qvb.5.1664975699745; Wed, 05
 Oct 2022 06:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175602.19946-1-hal.feng@linux.starfivetech.com> <20220930214824.A14ACC433D6@smtp.kernel.org>
In-Reply-To: <20220930214824.A14ACC433D6@smtp.kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 5 Oct 2022 15:14:44 +0200
Message-ID: <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com>
Subject: Re: [PATCH v1 15/30] clk: starfive: Use regmap APIs to operate registers
To: Stephen Boyd <sboyd@kernel.org>
Cc: Hal Feng <hal.feng@linux.starfivetech.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_061504_978269_5DC8CF02 
X-CRM114-Status: GOOD (  27.04  )
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

On Fri, 30 Sept 2022 at 23:50, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Hal Feng (2022-09-29 10:56:02)
> > Clock registers address region is shared with reset controller
> > on the new StarFive JH7110 SoC. Change to use regmap framework
> > to allow base address sharing and preparation for JH7110 clock
> > support.
>
> Do the reset and clk parts share actual registers, where we would need
> to lock between rmw? Or is regmap just nice to have because it wraps up
> the register APIs with some extra features?

No, the registers aren't shared, but on the JH7100 clock and reset had
separate ranges, but on the JH7110 there is just one memory range for
each "CRG", clock and reset generator I presume, and the reset
registers are placed after the clock registers in the same range.

> >
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > ---
> [...]
> > diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> > index 014e36f17595..410aa6e06842 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/device.h>
> >  #include <linux/init.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> >
> > @@ -295,11 +296,13 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> >         if (!priv)
> >                 return -ENOMEM;
> >
> > -       spin_lock_init(&priv->rmw_lock);
> >         priv->dev = &pdev->dev;
> > -       priv->base = devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(priv->base))
> > -               return PTR_ERR(priv->base);
> > +       priv->regmap = device_node_to_regmap(priv->dev->of_node);
>
> This is sad. Why do we need to make a syscon? Can we instead use the
> auxiliary bus to make a reset device that either gets a regmap made here
> in this driver or uses a void __iomem * mapped with ioremap
> (priv->base)?

In my original code the clock driver just registers the resets too
similar to other combined clock and reset drivers. I wonder what you
think about that approach:
https://github.com/esmil/linux/commit/36f15e1b827b02d7f493dc5fce31060b21976e68
and
https://github.com/esmil/linux/commit/4ccafadb72968480aa3dd28c227fcccae411c13b#diff-ffec81f902f810cb210012c25e8d88217ea5b4021419a4206d1fd4dd19edfce8R471

> > +       if (IS_ERR(priv->regmap)) {
> > +               dev_err(priv->dev, "failed to get regmap (error %ld)\n",
> > +                       PTR_ERR(priv->regmap));
> > +               return PTR_ERR(priv->regmap);
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
