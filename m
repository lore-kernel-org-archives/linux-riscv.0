Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2E5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRuzXL+X35qnO023kD0cknKbSut/09SU75VF1jDdBIw=; b=YLsVr6jJMonRad
	DLZOQxCx0MuW6+EIgvyPK/N1giLYCLAt3mvshyEr+7OEdEFX/6q0ssCni+C6g7kv1Qs2MDjQvWYur
	wLneBZVDvKRGpy1s2W/mySecD2ml6PS8vX1DMrQxMsJB6EaG/jr9wjch/OoB7gfLvGRfQlX3dBJoC
	ujZ+787xmjYsJq7X6fmHWB0o96unoXx6RLLkpfmqS573HT2zB+4CNogprLvF9tbOfZ8XDLVFJgFo3
	FvAyN6GZCL240RWOkYdxpLkt7/8hZ0sCvLDyEvK0iZ0xBDGr+4lWSzvZisq5qBUVafmoy04fTWi6c
	t6EV6X5LtnZmN1P1bnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXJu-009hqS-2f; Fri, 26 Nov 2021 09:15:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXJr-009hpb-UG
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:15:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id p18so7521137wmq.5
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0RIa0tC4q8Mnplv7In8ruGkJCIcDpzXyFfkRNTnI/gU=;
 b=htVKZXcK7jnZggEM+44KEeJ5RS4R61e6LoW/7Ovf4aKoMyh0D2rehHg/92Myo0LSfT
 oGaBJ98mXkJxqsu1B32J4FzHHC+djXhtbqnFx9rcq123+aMwxgk6LjVjGd4FdwQa+tFs
 wdYhW+I7+9jSBkVBmXnMytE6zvCHWd4x2g286RkS6xWQ0qo2A1qzwIIoM7lGNrb5N4TQ
 o+o/uoPrM8xEnLf7Vw+bcES5+aSi5RAjXaDTAqRFIj8Kn6ta63UmcD+oj7WiMA7Tky0x
 MeAQxygYR/HTtB9pt7w4rQeJnJGCo3UUK7Bq5fX3bNkktp9xI+uTD3cqQn6SLxVBuNSE
 pXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0RIa0tC4q8Mnplv7In8ruGkJCIcDpzXyFfkRNTnI/gU=;
 b=6jrqfj7L4LA173smvMbM9TbX6a5+L81HwsaXBxJ7ERbIUptEJr4qu/sNGK8ceBOB/3
 ZaZ/KhswHZa0wJd4C4shmoIzFTHoORkVgQpS3QX9jIQjz+2TrccYPJjs+LfvuMPavaWg
 awOpm+0wXDnRg8iJ0eaDpSaSFmSqYkXwoKEcpB2mv6dpE5lgIXl4EcTX29hsfKe7N1su
 A9MOGdr3E3orsTwqzR2ErBt5MZWpgwXRn07KI0dCn6LvFzgj7NvKcrWYOp1cRiNlRrXU
 9PxNXBXYWznxERbbondEvXtF93LQXDk69kSHcpZH/ELNr4IEtnbU9GhYfWbnLjNgpkrx
 RoHw==
X-Gm-Message-State: AOAM533XwSoQJAQ1qUn1bLD6a4EdSH0SLYZP6Hbuotp3/r58r6besCEo
 gu0LoJ7x2GREiFjGCmjezePg/d/P7W2Hn3CXltf86w==
X-Google-Smtp-Source: ABdhPJwC+do93NOFr9ub+o9kEAa0iBiw1ZnHGEoh33mkwVEbddlO34ojqOj2q4LxPp++TXTkSBu7/PkyFknSPRJbZ/c=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr14095206wmc.176.1637918098323; 
 Fri, 26 Nov 2021 01:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20211125152317.162958-1-geert@linux-m68k.org>
 <CAMuHMdVg-r3P_SPqDK7K4rYLzLP+=Wy9KatiNrpK7ebKJSx-Tg@mail.gmail.com>
In-Reply-To: <CAMuHMdVg-r3P_SPqDK7K4rYLzLP+=Wy9KatiNrpK7ebKJSx-Tg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 26 Nov 2021 14:44:47 +0530
Message-ID: <CAAhSdy2WEAkVBh9Za-w4nzpEiVT17RNFOAKJEHFce+rsYiaCQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_011500_002299_E71E96F0 
X-CRM114-Status: GOOD (  29.83  )
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

On Fri, Nov 26, 2021 at 2:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Thu, Nov 25, 2021 at 4:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > To improve human readability and enable automatic validation, the tuples
> > in "interrupts-extended" properties should be grouped using angle
> > brackets.  As the DT bindings lack an upper bound on the number of
> > interrupts, thus assuming one, proper grouping is currently flagged as
> > an error.
> >
> > Fix this by adding the missing "maxItems", limiting it to 10 interrupts
> > (two interrupts for a system management core, and two interrupts per
> > core for other cores), which should be sufficient for now.
> >
> > Group the tuples in the example.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > index a35952f487426988..55bec2d059807c48 100644
> > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -43,6 +43,7 @@ properties:
> >
> >    interrupts-extended:
> >      minItems: 1
> > +    maxItems: 10
>
> Cfr. Jessica's comment on my PLIC patch:
>
> The maximum supported by the CLINT memory map is 8192.
> Device-specific limits would be 4 for k210 and jh7100, and 10 for
> fu540.

As-per CLINT chapter of SiFive FU740 manual:
1) Offset 0x0000 to 0x3fff is MSIPx registers (up to 4096 registers)
2) Offset 0x4000 to 0xbff7 is MTIMECMPx registers (up to 4095 registers)
3) Offset 0xbff8 to 0xc000 is MTIME register
(Refer, https://sifive.cdn.prismic.io/sifive/28560457-c5a4-4f88-866c-8098d02afea1_FU740-C000-Manual-v1p0.pdf)

The "maxItems" for SiFive CLINT should be 4095.

Regards,
Anup

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
