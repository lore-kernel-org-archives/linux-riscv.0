Return-Path: <SRS0=wwcw=L3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411C6C07E97
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jul 2021 08:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEA6613FB
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jul 2021 08:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBEA6613FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c76h8L+zQyaP8GE60Mz/vPXtBMl9PaSnwd1hJcbmkQA=; b=LB9Og88YuqqMfW
	0Jw8todV+OOR/cFR+2KTl4loVPjjiRT0Tl5YfQM+RQjrXpc4zIhMWdZ4SHBmBZFbbSipHus9RYXE8
	Q5cyQKr9zvEXR1WisXXKR8Lq+pluQWKl08ZKYToxSUUs6+AQq/jU6OHBbALmP6LV7tVJc1cXd/2wI
	hyYqnuhqX/p+rPHBPCG/8PIs4J3mEi8MVeGmI/OeSw3M6BFqYKyUA6Ma1ToTQ4ApaNVlvDvSxueWb
	g7whNNw1C3/+pTsDvAshV5Z3Iy3zUtRRXsWFEEhY7cr2Anu+r3ERWDfzoLo3SyHtDhchnEvJQeIZU
	PnVQCtmZFP6dalM87wGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzbLk-004gPk-S0; Sat, 03 Jul 2021 08:50:08 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzbLg-004gPF-Ks
 for linux-riscv@lists.infradead.org; Sat, 03 Jul 2021 08:50:07 +0000
Received: by mail-vs1-f46.google.com with SMTP id h126so4597055vsc.6
 for <linux-riscv@lists.infradead.org>; Sat, 03 Jul 2021 01:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ztvTWAqkHN2mDtjML2AdkD2LHf36o5PEQqo09qwLkPY=;
 b=ikP3tlGiNUuZKKdnD5MLVQutD5xpxM1auSeQw4JpLqAhGkviNIYE5muY73SyndqIJ3
 DK1TEJvM8cM707XP/wfoRSkA1qVpeTRz51TGHmgY88qUcmekINQfrjq5HC+/XBXL/EHz
 +GvDLGF5qnZYD56sV/53CWtVT6UcZZzAhuMA0tC+bWWMMGes3Zhkkpo0yZ3hfqzO82ud
 Fv//XyNIaeBecKPejo1b8agd/KTvgy0SVsPwU2fji4f1RUi572Uwt1twZZVff8GGHzrV
 a2rtUZrotamefJir/mIlCXyCRvPKG8RFXkqXJIgAs+5VWSgrfamOlETcbwtMErC3oCwm
 i2kQ==
X-Gm-Message-State: AOAM5325ESgWowBi/5k5uyGGIZJg3t3+bFg+yv3tHkHSiCd+dWHi1z/G
 shoHqWtLXy0yyCSQFKuqhigb4+bXplrL/fprryY=
X-Google-Smtp-Source: ABdhPJyuUXkzJRe7nyGQY7VgkmHMTPL/ZKX7ox8bFgwnO/Xk8lPPexJD9V2v7FD0qLeUSgwjtNu/9IKshQ+B396Uvoc=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr3311187vsd.42.1625302203003;
 Sat, 03 Jul 2021 01:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
 <20210702205622.GA1035183@x1>
 <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
 <20210703064600.GA1050194@x1>
In-Reply-To: <20210703064600.GA1050194@x1>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 3 Jul 2021 10:49:51 +0200
Message-ID: <CAMuHMdVTj-TLZz=ieW648cqV4fWBHb4nnt59N5EEFw2qZ0jbaA@mail.gmail.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,
 jh7100-gpio bindings
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_015004_742809_D4DB648C 
X-CRM114-Status: GOOD (  30.48  )
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

Hi Drew,

On Sat, Jul 3, 2021 at 8:46 AM Drew Fustini <drew@beagleboard.org> wrote:
> On Fri, Jul 02, 2021 at 11:03:56PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 2, 2021 at 10:56 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> > > > On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > > > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> > > > >
> > > > > [1] https://github.com/starfive-tech/beaglev_doc
> > > > >
> > > > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > > > > @@ -0,0 +1,60 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: StarFive JH7100 GPIO controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Huan Feng <huan.feng@starfivetech.com>
> > > > > +  - Drew Fustini <drew@beagleboard.org>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: starfive,jh7100-gpio
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    description:
> > > > > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > > > > +    minItems: 1
> > > > > +    maxItems: 32
> > > >
> > > > What about clocks and resets?

> > > But I am not sure how reset would work?
> >
> > That should become "resets = <&rstgen JH7100_RSTN_GPIO_APB>",
> > but we don't have the reset controller in Linux yet (we do in barebox).
>
> Do you think I should add reset item like this?
>
>   resets:
>     maxItems: 1
>
> I suppose this is supposed to describe the hardware and it shouldn't
> matter whether or not Linux uses the property, right?

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
