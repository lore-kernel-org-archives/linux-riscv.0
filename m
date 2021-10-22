Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C34AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C456101C
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52C456101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9sOIbpSOwkTGeK0MkaZMSqpNUlODf+c5x2f5S3q5zs=; b=noUuWDYehin33F
	k4aDPgx3yIttApEC+B9PUq53PMWwzCqJeDmEr94EhDdMWRW43HWWUYiRkWXbjL7aaf41TLsFcYzp7
	Kr/p7NWVDI4kxoD6M8CpCx483gLaH6UfWmMjtZMmMKrVdCWz8oyvm9XWIasY74PDMATQ5pdwOTzP7
	ryOGXDmBFqMrphGRp+0mQmc0OxnL8ARJB+vg3GA05olTeVRFjL9F0aPv71rzbA+XTVZSeNP+lkKJI
	YCGjINPT0n8FpZb2/6pN7YviRN5oAT4jqOpNmJD4rQ5EoroNaV13W+wG2+lysV6Ia89Ei8Jnh3fPH
	3ccc0N4l/N/g4xTkAz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtl5-00At7l-G9; Fri, 22 Oct 2021 12:34:51 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtl2-00At6Y-Nj
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 12:34:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id z20so1687953edc.13
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJaedp+WwFniAnsPOoxdNlKqeKWuyKqfMjHYa+KV7DM=;
 b=psg2ERjBTmguvun4iRACGpDey3AvgvUOnPmxWUCYXNVPU2Lja48yf8k+qfNAZHOwvE
 mdx3NZ0QRraYobiycacjFN6GrT7SLBMgp8n8Kqr/AvOabhepU1KW/RVlwhMr3BwMhdG+
 p/zqmQMKhWN3xPImJkgHjc/eH9wQ5b7oURXn4dazCZpAlvpXKQAc2n4p8pJCc++RwtFl
 k+1IlequuJarwJ4yBYhG+DbtcgFq8+azfLBvpEO0/5QbHqJ1Jv/O6hG34TPMH1wzYs6M
 oEfjywrYcb0XcWD2TlkYM83WX4je/xXED6cfzrUGgUk4MS6heQk4AGP3/k/LW6FFf8sD
 5cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJaedp+WwFniAnsPOoxdNlKqeKWuyKqfMjHYa+KV7DM=;
 b=3NQZvzEbJMfk0Oinx+EVtUfz9DUO8+GSOUtLhgWvpCckX3dO8l4l1HJM6Qagvv6nZR
 YH7hwsM+nqTrJPHmc9NSt837a0spC3hZZkRc+mtxbMR8hbgauTfBiNx29rVdUNh+jwkZ
 SICnRiWtkQhrO8XU15BGsSMSR1uaSwWkxx43Kjq26z4MHC9mWkZO2DA8dTTBL3qw+mgv
 JTs6b0X0ktwdK4V/WRAmTyElAMPWfRmQysjry9IiywCFdAGD5QbAl08AiuqkPXtCiIKv
 7IJC7AzmqLUb7xU8aEs4StMCb2VEPnh4gZ2gZBzHKzUz0zljXOOv9id1UYzMWTw6KMNg
 nxgg==
X-Gm-Message-State: AOAM533EgB3TEYDL2cML04lrCbQTQ/6MwiGuDMYKYfF+UjxmgbgCWCyi
 VVjTeYOfdYMAskNj2mCU2eCWlgVemg/hXvokckg=
X-Google-Smtp-Source: ABdhPJzELMMCdF3V0ssE/+Finv7LByJ4VhsgFR1Ko44YZnSsrQh8x6Ri7/3ky81qJckrRAZEb9X0ta8R9EPXbJ4mi0w=
X-Received: by 2002:aa7:c0d2:: with SMTP id j18mr17043167edp.107.1634906087448; 
 Fri, 22 Oct 2021 05:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-7-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 15:33:50 +0300
Message-ID: <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_053448_799553_D3E38D63 
X-CRM114-Status: GOOD (  13.39  )
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

On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> +static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct clk_starfive_jh7100_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx >= JH7100_CLK_END) {
> +               dev_err(priv->dev, "invalid clock index %u\n", idx);
> +               return ERR_PTR(-EINVAL);

After this
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=7065f92255bb2468dbb9aa0537ff186ef64d5a02
It's okay to use

> +       }

       if (idx >= JH7100_CLK_END)
               return dev_err_probe(priv->dev, -EINVAL, "invalid clock
index %u\n", idx);

Ditto for other similar cases.

> +       if (idx >= JH7100_CLK_PLL0_OUT)
> +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> +
> +       return &priv->reg[idx].hw;
> +}

...

> +       while (idx)
> +               clk_hw_unregister(&priv->reg[--idx].hw);

I still consider that usual pattern, i.e.

       while (idx--)
               clk_hw_unregister(&priv->reg[idx].hw);

but since you are pushing hard for your variant I'll leave it to the
maintainers and author.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
