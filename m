Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC355C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:36:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB7161163
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BB7161163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYLuvKbasBSqTyjAsu2TLNPOuytj+JnN9thxa7uR/b8=; b=e3hOItTeSvokfd
	qzxpmaunlCSd3pJ2HMOyFt+FEhg8RH6oS1kfPmAr+m/B3M/rNbI5XxY0lRn/lA5BcyLFBcA/YEZS8
	OLZ61gkGG6QlGAeplu3JYDToTmLu1ggEeKsXBiDJkMzqT2j8sHWU8HCdu5a1TtqvDkmDhRugnsZoX
	aVNZiPZJm961XCKbiIlvA+I/8BDqf/C08u6xwuPWEtMk+On2yjICtUyYS9MUg85FWhVz8yDX4PMXO
	CMz1DiIGJzCoB6t5mYBCYE99WyTgR9orQKx5XSY14PHe7pISx7BJ1Lcq/hy2djpVhzckvcpNqfcuX
	XFzAhEZUszb+xZm/SqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduiN-00B7bn-Qc; Fri, 22 Oct 2021 13:36:07 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mduhT-00B7Sn-Ab
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:35:13 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso5733707pjm.4
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 06:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gB9nPqjC9kxzaGyB2tMhiS6mHnq6MtGEClgbmCe1njU=;
 b=EtVaWUQbLUZDDFaumit+gu3P3XY6057rgaXLDejqfDQur55Ta4fVwKNhBMv7bOdlae
 C1rzIHKsWyDH/ASofW+UgAMY8I9oouSY40lH/b1SYRKqHO6syIRzrvb0XNhQg3oA3ZdI
 HYQS7lt8Kd4CGE98B/Hsde2DQUfAA1UGUZ//pSyBaqMLV8mnQlMqM2sTCvS37xND19d9
 9GcROkT/7VAOzJcSkK+iyBqgNpkX6iDc1XJCdeLyJKoOdJUzEELcdF8miI9FAFTYmM1C
 bFQKsLTbOMhO9cA4bxJcy34H7NMtia03OVtWYySdbKCgh6pb7WEiyp0ru9ZtzKUU5XAJ
 AP+Q==
X-Gm-Message-State: AOAM531Tl0+dmVoMhC/rx8QNmXxFHdzpIvnOBRMVLrIkTg54Fhw1VpHT
 orfMlL8UdKH/zrjdk+4WOJeyBqmul2aVsFh1EBE=
X-Google-Smtp-Source: ABdhPJzqcT67gDitD+qJ4y7d2w+3rgIO7RJA2uS12QTmtGTpMOXJEAZLRBCBCYbMxbHPzzavLq8IpRdVwEBpC6v5jgY=
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr13460474pjb.185.1634909710011; 
 Fri, 22 Oct 2021 06:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
In-Reply-To: <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 15:34:58 +0200
Message-ID: <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20211022_063511_406205_7E6AA997 
X-CRM114-Status: GOOD (  16.50  )
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

On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > +static const u32 jh7100_reset_asserted[4] = {
>
> > +       BIT(JH7100_RST_U74 % 32) |
> > +       BIT(JH7100_RST_VP6_DRESET % 32) |
> > +       BIT(JH7100_RST_VP6_BRESET % 32),
>
> It's hard to notice that this is only one entry. See also below.

Yeah, so what would be a better way to style it?

> > +       BIT(JH7100_RST_HIFI4_DRESET % 32) |
> > +       BIT(JH7100_RST_HIFI4_BRESET % 32),
> > +
> > +       BIT(JH7100_RST_E24 % 32)
>
> + Comma.
>
> > +};
>
> Why all these ugly % 32 against constants?

Because the JH7100_RST_ values goes higher than 31. There is a
BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
machine.

> ...
>
> > +       if (!assert)
> > +               done ^= mask;
>
> Can you convert this to simple
>
>   if (assert)
>     ret = readl_...
>   else
>     ret = readl_...
>
> below?

I don't see how that would work. We're using the done value in in the
readl_poll_timeout. Maybe you can be a bit more explicit.

The reason is that for most reset lines a 0 in the status register
means it's asserted and a 1 means it's deasserted. For the few reset
lines above this is reversed though.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
