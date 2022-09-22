Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266FEC6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqfqHIeIIx4YXk6ukaWGTttpKlB3uqWBhseG8a9W2jU=; b=fvgZCfIpVmYM2H
	I+jnZsGOt83WmbI5peuVZWamzHk+KKClgQuOeNXnJuFqUO18M46Ewa6V2Zw2O/D4OJ7osb3bGnPKV
	svro9WUN5YOnWA9XCz4kTn4CxROR3qZjiR0VEP0FDM8B6c7snQPVPESlv3Ldyj/Eq7EwzQBoHR9n0
	nWvrDfgzNUK3lvs4qewSeXzDh4NxNrJ71fdHlRZfIhlsogeB2QDUDAAt0Ngc2GQTC4XBLiOL/WrfC
	DLRcgfYDWdMI/5vAd1H+bTc/61WEeN3LhqjQ9Su5Qn00NJp7YOOyQ1iBbsFAvBEtUyXZcFMr6DlqO
	Wfe6rwyo3MAySeVaMFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFsl-00DbwJ-IS; Thu, 22 Sep 2022 06:40:23 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFsi-00DbuU-R2; Thu, 22 Sep 2022 06:40:22 +0000
Received: by mail-qt1-f175.google.com with SMTP id f26so5657142qto.11;
        Wed, 21 Sep 2022 23:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=F/e1JPlHkuPobKR8svZ3nWeTTrTnp+M9ecDUY6t2TzI=;
        b=HaH3vLyi8LEPXnmcTtGuYVH4IN01jHSy4+oSLZAkzpKMILuLZwhAnvTBHNJTk6UgfM
         YIPTDdFcmjEzhAaBD6rv1YCszRRw5605+a0V4ebxqm3/h+iRY2ypqD7W3+ImL/GQqJBK
         o8VH/6t1rREOoz9y2jN57jmcEDtFfn4ySCfpVa2ghB1aNOK1E+bvQOW6HgVUteW4HyKP
         XGTDaLVznKv0C75xkzaLMMwvu5mCF6SHB0h5dp7JVE9VZZxJPwy6+fI7PzInCT8cVvKJ
         8xmlkidkKSJ8GWdycXGGLclpHWcGMyrDs0lsoU9yhxR531IDG+EQPLgwzY/WgNqvNyRV
         0F8Q==
X-Gm-Message-State: ACrzQf18eL+wwcW+dlk4a0/9eUvyjD4Wh03/lSwlc1LGxucsE3YWUgff
	+1bOd8IGxt7r4Mik5NFdXu8j1t2x0jFdkD9N
X-Google-Smtp-Source: AMsMyM7xBDbjraiuvMxYv4Ezwh8CI1I880a+FGHd0hVOqzNFqL8V7k3R2OQ1t6nu0wJhUSG4Uq7FHw==
X-Received: by 2002:ac8:5748:0:b0:35b:ac34:ff37 with SMTP id 8-20020ac85748000000b0035bac34ff37mr1574134qtx.630.1663828817343;
        Wed, 21 Sep 2022 23:40:17 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id k8-20020ac86048000000b00338ae1f5421sm2938942qtm.0.2022.09.21.23.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:40:17 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-345528ceb87so88277087b3.11;
        Wed, 21 Sep 2022 23:40:16 -0700 (PDT)
X-Received: by 2002:a0d:dd09:0:b0:344:fca5:9b44 with SMTP id
 g9-20020a0ddd09000000b00344fca59b44mr1713044ywe.358.1663828816340; Wed, 21
 Sep 2022 23:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <45d2e6c2-3b4b-5720-0431-002c74b1f9cc@arm.com> <0603b2a5-6253-4c4b-8b30-aa0253ed0480@www.fastmail.com>
In-Reply-To: <0603b2a5-6253-4c4b-8b30-aa0253ed0480@www.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Sep 2022 08:40:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmzS5prd0Q2ee7NgWSULW_SMiJbG_EqcyN-rNXeFy-Rw@mail.gmail.com>
Message-ID: <CAMuHMdXmzS5prd0Q2ee7NgWSULW_SMiJbG_EqcyN-rNXeFy-Rw@mail.gmail.com>
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
To: Arnd Bergmann <arnd@arndb.de>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_234020_894807_63B64F7A 
X-CRM114-Status: GOOD (  38.72  )
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

Hi Arnd,

On Thu, Sep 22, 2022 at 8:30 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Sep 21, 2022, at 11:20 AM, Robin Murphy wrote:
> > On 2022-09-21 08:46, Geert Uytterhoeven wrote:
> >> This is a topic that came up at the RISC-V BoF at Plumbers, and it was
> >> suggested to bring it up with you.
> >>
> >> The same SoC may be available with either RISC-V or other (e.g. ARM) CPU
> >> cores (an example of this are the Renesas RZ/Five and RZ/G2UL SoCs).
> >> To avoid duplication, we would like to have:
> >>    - <riscv-soc>.dtsi includes <base-soc>.dtsi,
> >>    - <arm-soc>.dtsi includes <base-soc>.dtsi.
> >>
> >> Unfortunately RISC-V and ARM typically use different types of interrupt
> >> controllers, using different bindings (e.g. 2-cell vs. 3-cell), and
> >> possibly using different interrupt numbers.  Hence the interrupt-parent
> >> and interrupts{-extended} properties should be different, too.
> >>
> >> Possible solutions[1]:
> >>    1. interrupt-map
> >>
> >>    2. Use a SOC_PERIPHERAL_IRQ() macro in interrupts properties in
> >>       <base-soc>.dtsi, with
> >>         - #define SOC_PERIPHERAL_IRQ(nr, na) nr          // RISC-V
> >>         - #define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI na  // ARM
> >>       Note that the cpp/dtc combo does not support arithmetic, so even
> >>       the simple case where nr = 32 + na cannot be simplified.
> >>
> >>    3. Wrap inside RISCV() and ARM() macros, e.g.:
> >>
> >>          RISCV(interrupts = <412 IRQ_TYPE_LEVEL_HIGH>;)
> >>          ARM(interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;)
> >>
> >>       Cfr. ARM() and THUMB() in arch/arm/include/asm/unified.h, as used
> >>       to express the same operation using plain ARM or ARM Thumb
> >>       instructions.
> >
> > 4. Put all the "interrupts" properties in the SoC-specific DTSI at the
> > same level as the interrupt controller to which they correspond. Works
> > out of the box with no horrible mystery macros, and is really no more or
> > less error-prone than any other approach. Yes, it means replicating a
> > bit of structure and/or having labels for everything (many of which may
> > be wanted anyway), but that's not necessarily a bad thing for
> > readability anyway. Hierarchical definitions are standard FDT practice
> > and should be well understood, so this is arguably the simplest and
> > least surprising approach :)
>
> FWIW, approaches 1, 2 and 4 all seem reasonable to me, but I don't
> like number 3 if this is only about the IRQ definitions.

We also have to handle interrupt-parent at the /soc level.
And of course you never know what pops up next ;-)

> It sounds like we're already converging on #2, so just one more
> idea from me: we could fold the IRQ type into the macro, and
> make it just take a single argument for extra flexibility:
>
> #define SOC_PERIPHERAL_IRQ_LEVEL_HIGH(nr) \
>         GIC_SPI (nr + offset) IRQ_TYPE_LEVEL_HIGH
>
> If all the irqs on the chip have the same type, the name
> can be shorter of course.

This is usually the case, but not always.
And the numbering may be the same (modulo the offset), but
not it really depends on the on-SoC wiring.

> Either way, some variation of the macro sounds like a good enough
> approach to me.

Thanks!

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
