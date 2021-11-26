Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5206FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOHDCMkBrvUKr67420gMr+Cy6bC02hmgdJuM/fZYmIA=; b=oJHsr4ZhrWCuO5
	ln9+s4YHNP4Z1Q8c3nYXO+7Dtkz+sser+7BdaI51OzZKKVhZ7Ou0bRpuOkCf7hePDHBWR172r+lYf
	LLbgrm9reAkxRCMNsfvCbtrYedwGIWzrQ0oWZ96RBktpzKSjPkrm2VpXaXIDukmP0+n7QsvpZ/IN3
	T+kiYnKCayDVQzVqJGlH6aTsC7j61/7FgNcrT2feqLE+FrMs7jsVC58R+HxQkKagP4+fIvWcwubxZ
	bWaJ4vxtM/xE3HOd9ie+zdmQkPvHyGbIlNgy5e14a0zaVFPj+uJ7pT6qv8AD9TI4PXrD0WOKZ+JYd
	M7ITLRgF/5M+0+Ti93UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXSb-009iMS-Cr; Fri, 26 Nov 2021 09:24:01 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXSY-009iM8-6r
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:24:00 +0000
Received: by mail-vk1-f169.google.com with SMTP id 70so5542142vkx.7
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SktczEZvO7fymdakFqebWM/pQEoSmTkh1E0WAx6R/E0=;
 b=c2N9ZD5S1uLBgQflzXYcTurgyoV49GoHEz61arafXFagiiP7BjDzkLe60TYwhpnk5m
 agbzOH7d1VwlVmpCRnbK8qq2znj+ntmkXWMhKVtLBsYNTyoalQJc3LqElueEHkxqyQaW
 3PzBjWL5NTIvesAN/2evPqrbrLKGb4GV2GZ3/bcDlFO/EFG1wjwm3WwRrTeOjnvmox1l
 60vDMx+kbHQlex9XcGUG6w3AL0MfwWYHWbcadrEjNBEi6x9YeDMO8UzqHIidPtOQoaLQ
 CLm9290psQoG2FJlpYTT7G2mce+19U676ip1gyhjpcVPmhkigLejTXGxY9Vl1E7QfTvz
 vFxw==
X-Gm-Message-State: AOAM5312h5nld0HKTC5EUKZkhgQZnKCklZJZ+NhR/i9sxs3lVIiEoOrq
 x18HR+uvKKBlDelmtqD6KDaPLoj1bH0jqQ==
X-Google-Smtp-Source: ABdhPJy6f7sGbyU1X0rIACBL6PVxpLVidYUAJkly9wgl3mTrcfFS+OMB45PIMaotDXcyZrSSX/gnfQ==
X-Received: by 2002:a1f:c9c2:: with SMTP id z185mr17994479vkf.26.1637918631643; 
 Fri, 26 Nov 2021 01:23:51 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id j17sm3055230vkp.27.2021.11.26.01.23.50
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:23:51 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id o1so17337218uap.4
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:23:50 -0800 (PST)
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr15892154vsf.38.1637918630521; 
 Fri, 26 Nov 2021 01:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20211125152317.162958-1-geert@linux-m68k.org>
 <CAMuHMdVg-r3P_SPqDK7K4rYLzLP+=Wy9KatiNrpK7ebKJSx-Tg@mail.gmail.com>
 <CAAhSdy2WEAkVBh9Za-w4nzpEiVT17RNFOAKJEHFce+rsYiaCQQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2WEAkVBh9Za-w4nzpEiVT17RNFOAKJEHFce+rsYiaCQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Nov 2021 10:23:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAHW-RF-RrMbH=AsVmSRw=JEsUot0PaMzDdve70JfXQQ@mail.gmail.com>
Message-ID: <CAMuHMdWAHW-RF-RrMbH=AsVmSRw=JEsUot0PaMzDdve70JfXQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
To: Anup Patel <anup@brainfault.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_012358_275270_20ABC97E 
X-CRM114-Status: GOOD (  32.31  )
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

Hi Anup,

On Fri, Nov 26, 2021 at 10:15 AM Anup Patel <anup@brainfault.org> wrote:
> On Fri, Nov 26, 2021 at 2:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Nov 25, 2021 at 4:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > To improve human readability and enable automatic validation, the tuples
> > > in "interrupts-extended" properties should be grouped using angle
> > > brackets.  As the DT bindings lack an upper bound on the number of
> > > interrupts, thus assuming one, proper grouping is currently flagged as
> > > an error.
> > >
> > > Fix this by adding the missing "maxItems", limiting it to 10 interrupts
> > > (two interrupts for a system management core, and two interrupts per
> > > core for other cores), which should be sufficient for now.
> > >
> > > Group the tuples in the example.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > >  .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > index a35952f487426988..55bec2d059807c48 100644
> > > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > @@ -43,6 +43,7 @@ properties:
> > >
> > >    interrupts-extended:
> > >      minItems: 1
> > > +    maxItems: 10
> >
> > Cfr. Jessica's comment on my PLIC patch:
> >
> > The maximum supported by the CLINT memory map is 8192.
> > Device-specific limits would be 4 for k210 and jh7100, and 10 for
> > fu540.
>
> As-per CLINT chapter of SiFive FU740 manual:
> 1) Offset 0x0000 to 0x3fff is MSIPx registers (up to 4096 registers)
> 2) Offset 0x4000 to 0xbff7 is MTIMECMPx registers (up to 4095 registers)

Thanks, I had missed these are 64-bit (and did wonder about the extra
space ;-)

> 3) Offset 0xbff8 to 0xc000 is MTIME register
> (Refer, https://sifive.cdn.prismic.io/sifive/28560457-c5a4-4f88-866c-8098d02afea1_FU740-C000-Manual-v1p0.pdf)
>
> The "maxItems" for SiFive CLINT should be 4095.

OK.

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
