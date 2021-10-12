Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB68C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E036460E53
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E036460E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nj3nATiFUklg5qeYL4VsyxT6GxOsEzH/hOMV3Eftj6k=; b=NS9mzpOw8fS6il
	zflQdwj2rjaClnJXWbxuC86OR7PvCRe0orqk0jCKokYc02ZKGiFh7vnAAXSvsg8DKAabqe3+nb+Q8
	FemKC1P7nj1g1tvNgjmmA2sSj5WoiGjEfb0C1AVNKO8a3bzoOB0sn3MrgWvremxU7olABgClmPF/o
	rHt3/lDLJjS8liOE0m8DunIYWJaY9QHiNZMtUtcf98yydJjd8LDcoYKIxv6kNGpAaHmuP6HO5Pm8o
	JGSqW1NZ0MGW8BGbi06K/MC92sETMrGeZhwO89ynYhBQwE+HKEbZcv/JcmLk11wozd03C8NwibhZI
	Myi6bZsOPcCkwq7zDKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJv7-00DNt3-A4; Tue, 12 Oct 2021 15:42:25 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJtg-00DNEM-8t
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 15:40:57 +0000
Received: by mail-ed1-x531.google.com with SMTP id t16so1129642eds.9
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5vws6sMTfuIUpw/tvRD3yV733Vt/oKMHzkN1nuZ1vds=;
 b=W3xuWRdAGjqLW7kMpsg6EzCDJGX+u7T8LbQwJnFITwMyQKXIV+thrIH5pReBwQgCq7
 ZH3X6jKa7UFFPcWtOPWMdXDrEIQfxZbduQGtKW/O1ZeJXRM+F0wPKEXurRE8B+iQzPhu
 yG9dxc1aY8Y2KeK8Okq0cbZ1o81PJjEN7HDbJRnKeDcsH196twyl9vgszt3TrTvBMllb
 6sfbgEGN5xJG5zuEGjWoUvBhLhPLnXRI/u/l+xQb4n4my06ipQuykRARukvF814i8gjs
 0xfxNnpUv/thnQA1nh0ufzM6D/6UMWw46n3n/Zl2y6XXLnqA5DE958HXKXJgKufKp87P
 am8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5vws6sMTfuIUpw/tvRD3yV733Vt/oKMHzkN1nuZ1vds=;
 b=iYmAh4jA3g2564Jgw4ZPHjd6Hpqunp/3Avvv7BKCuhS+K3PgZewUeKZHI59mF8+p5H
 ZphFx9cDZOOzAtnwbMAYX/fXktW2f+U50PZMl/rksj67jAj3h0R6RL+x9hxMmsqBtUK7
 QLCn1yead4uUrlcYj7ywOuRAmKBRZNUV7n2KPQpueVN3/QI3t5TfmIgH7kHkqYSSpnZ2
 Nd3P7Qnxv5q96hqtm8+LctCKWL49dCJ/9T1ERgxMhGLrZKYKYISo7CrZesqwq9tN95RG
 7MSYNPr7bqRs157zZ7RC6/PXj8Cna0SI+qBKSClBalgvM30dwmYWlgaVaFxqETtRO9KN
 GXJQ==
X-Gm-Message-State: AOAM530+HmfbGg3JiIyxFSfl3JECvynb0L7ve23wjQFlyVYDAUUEA4bo
 8rf9JLfHphJ6quE5rhTBBmUL5DukL5GC2Qxql+Q=
X-Google-Smtp-Source: ABdhPJw6b5/cDVnUDUOYGlubY3IK7TXocmkqeO4rQjOPiQyeiygR8kyVW5V7QbJJvYNkBUvVfw6qvUxO0QlwIkcVXcQ=
X-Received: by 2002:a50:e00b:: with SMTP id e11mr651595edl.359.1634053252589; 
 Tue, 12 Oct 2021 08:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-7-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-7-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Oct 2021 21:40:05 +0300
Message-ID: <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH7100 clock generator driver
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
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_084056_372277_B998A18C 
X-CRM114-Status: GOOD (  21.77  )
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

On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Add a driver for the StarFive JH7100 clock generator.

...

> +config CLK_STARFIVE_JH7100
> +       bool "StarFive JH7100 clock support"
> +       depends on SOC_STARFIVE || COMPILE_TEST

> +       depends on OF

Why? I haven't found a compile dependency, so you reduce the test
scope (when COMPILE_TEST=y).

...

You are using
bits.h
mod_devicetable.h
which are not here

> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>

...

> +       value |= readl_relaxed(reg) & ~mask;

value is not masked, is it okay?

Usual pattern for this kind of operations is

value = (current & ~mask) | (value & mask);

> +       writel_relaxed(value, reg);

...

> +       if (div > max)
> +               div = max;
> +
> +       return div;

return min(div, max); ?

...

> +       rate = parent / div;
> +       if (rate < req->min_rate && div > 1) {
> +               div -= 1;
> +               rate = parent / div;
> +       }

Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
decreasing div by 1 will satisfy the conditional again?

...

> +#ifdef CONFIG_DEBUG_FS

Perhaps __maybe_unused?

> +#else
> +#define jh7100_clk_debug_init NULL
> +#endif

...

> +       if (idx >= JH7100_CLK_END) {

> +               dev_err(priv->dev, "%s: invalid index %u\n", __func__, idx);

__func__ means that the message has no value on its own. Make it
unique without using __func__, or drop completely.

> +               return ERR_PTR(-EINVAL);
> +       }

...

> +       for (idx = 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
> +               struct clk_init_data init = {
> +                       .name = jh7100_clk_data[idx].name,
> +                       .ops = jh7100_clk_data[idx].ops,

> +                       .num_parents = ((jh7100_clk_data[idx].max & JH7100_CLK_MUX_MASK)
> +                                       >> JH7100_CLK_MUX_SHIFT) + 1,

With temporary variable this can be better written, or consider
something like this

                       .num_parents =
                               ((jh7100_clk_data[idx].max &
JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT) + 1,

> +                       .flags = jh7100_clk_data[idx].flags,
> +               };
> +               struct jh7100_clk *clk = &priv->reg[idx];

...

> +       while (idx > 0)
> +               clk_hw_unregister(&priv->reg[--idx].hw);

The

       while (idx--)
               clk_hw_unregister(&priv->reg[idx].hw);

is slightly better to read.

> +       return ret;
> +}

...

> +static int __init clk_starfive_jh7100_init(void)
> +{
> +       return platform_driver_probe(&clk_starfive_jh7100_driver,
> +                                    clk_starfive_jh7100_probe);
> +}

> +

No need to have this blank line.
> +subsys_initcall(clk_starfive_jh7100_init);

Any  explanation why subsys_initcall() is in use?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
