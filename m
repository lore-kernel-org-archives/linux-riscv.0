Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7321FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BDC760F0F
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BDC760F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbcRawI5FJRaVClwn3qTbxelrRSOA5nXdJlnnzELXag=; b=etRfwDIkHiY9bp
	EPJUffUSwzrqwxfxMOlnmhuUs1WEV/dJ2z4SZRYYdZFJuo21qAG4oAMexL1ej0+b3LWTQ1mFHA3Hz
	MSvPqa5iKonh//pbEg0J3P/DMx0/cnx7xTqHfxMLsTbYD9JF8rR/lpfPx2T1mzBkXQ6p4e/xX0Zfp
	D3owGZMAhYdek4iUVKChcgUfUfPTRfiJaAxHQEnIXAKwfLeItPogPSA0LiiLydd3gf9Qz+6T4bszw
	91dnlk9iLBxBq8QrDGNQh6kjKB4h3SgRmWE+Zte8c5s5dM1peizAivPxykj0JiEldWux8jhCFKuLD
	yRR6z20Xy+FVlMF8PNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduBQ-00B0Ss-U8; Fri, 22 Oct 2021 13:02:05 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdu5f-00Az2O-NC
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 12:56:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id r4so6516141edi.5
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qOi8f1v4+rJCxOKM/1lFt8oaZPEX6smhRzqey4rSCg=;
 b=YivvG/JsMBUvbb3Fs9tTmqksEjk8+rN0v5A+vUK4z8jS13RgQj58cSSwV7Hs+IWsGB
 adNRyKbM3yrg9wi18C8DLlOUORLq1BF4FYNWg7JzYi9UuIUeEq4Rn/rDkk/y1zhLxtEc
 aOJwG8ueEq8fZmlCGlZRCr1VCFNZmF0LBwCeNKdP2CPqZ8YkdZryhKGqdvn5XSpjL1oP
 4o6i1XlLhy5Ivwsx0XRyu4wrcaRPgu1kTvO9jQ+GdztgGf9HLtxndmPFXuqPLPJ6Ep1B
 hDkRcHpvS7zlSUe5S45XqZYbcF6yhFGCeBVedFGDj8jrOQeCynGBXo9ZCYD+Q7EnHKgo
 5Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qOi8f1v4+rJCxOKM/1lFt8oaZPEX6smhRzqey4rSCg=;
 b=wkbRBR734xmBVOKBTe9H2Xg3yq5pRGK0kXtC7FOfCuJIa44CvfNVkU0E0SgUZEH92g
 p/vEcemyUgTMBykuKedFPPgenvlKW8BJyRRIlI2Q2FgPtbaAYYTpB1kj3sNcOKKQWUh1
 xSE2yTdmPm2I3SDU6e+ohuu9Lti0cFM8GobLwZirm5/eBrFqtfxHica6AIMhDLR12c/O
 7031xjo9SjLsYnIGAgc8WG/q8VcBFCAuHP3HbfVdP26cLunBtwU/PjBxCe8UsFiJtBFJ
 choyXCu4Z5gI43sXTYCt3fRqLhBjLtvuSE6Et5fVIr5wfBcFKkWcreqzO+zvXNIJiB3c
 iGMA==
X-Gm-Message-State: AOAM5333SKOOUUlm6uxzoqSg4tZIB8Z6SfGmaw2n1iKAg2NCfkWXJ8xv
 6/CFm1d8H2LMm4epZWnY1iJ3+msRvtPmQkCG8BUEnC/CRJgJC7M/
X-Google-Smtp-Source: ABdhPJxjmbZn/mKzz2MeCcWBTlXcYFWWJdlvVwlzqH5Cmn9IpfIf34cJh9HoSyv6xIrG1HUL+9nURIo/Rrh/wNmzfU8=
X-Received: by 2002:a17:906:5a47:: with SMTP id
 my7mr14665000ejc.128.1634907366155; 
 Fri, 22 Oct 2021 05:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-10-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 15:55:10 +0300
Message-ID: <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_055607_818010_D5C11330 
X-CRM114-Status: GOOD (  15.27  )
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
>
> Add a driver for the StarFive JH7100 reset controller.

...

> +config RESET_STARFIVE_JH7100
> +       bool "StarFive JH7100 Reset Driver"
> +       depends on SOC_STARFIVE || COMPILE_TEST

> +       depends on OF

No evidence of this dependency. Why to limit test coverage?

> +       default SOC_STARFIVE

...

> +/*
> + * Reset driver for the StarFive JH7100 SoC
> + *
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>

> + *

Redundant empty line.

> + */

...

> +#include <linux/of_device.h>

No evidence of any usage of this header. Perhaps you meant mod_devicetable.h?

...

> +static const u32 jh7100_reset_asserted[4] = {

> +       BIT(JH7100_RST_U74 % 32) |
> +       BIT(JH7100_RST_VP6_DRESET % 32) |
> +       BIT(JH7100_RST_VP6_BRESET % 32),

It's hard to notice that this is only one entry. See also below.

> +       BIT(JH7100_RST_HIFI4_DRESET % 32) |
> +       BIT(JH7100_RST_HIFI4_BRESET % 32),
> +
> +       BIT(JH7100_RST_E24 % 32)

+ Comma.

> +};

Why all these ugly % 32 against constants?

...

> +       if (!assert)
> +               done ^= mask;

Can you convert this to simple

  if (assert)
    ret = readl_...
  else
    ret = readl_...

below?

> +       spin_lock_irqsave(&data->lock, flags);
> +
> +       value = readl(reg_assert);
> +       if (assert)
> +               value |= mask;
> +       else
> +               value &= ~mask;
> +       writel(value, reg_assert);

> +       /* if the associated clock is gated, deasserting might otherwise hang forever */
> +       ret = readl_poll_timeout(reg_status, value, (value & mask) == done, 0, 1000);

You run delays under spin lock. You need to use _atomic variant.

> +       spin_unlock_irqrestore(&data->lock, flags);

...

> +       u32 value = (readl(reg_status) ^ jh7100_reset_asserted[offset]) & mask;

> +       dev_dbg(rcdev->dev, "status(%lu) = %d\n", id, !value);
> +       return !value;

Dup of ! operator. Can it be value = !(...); above?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
