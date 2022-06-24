Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A5AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 10:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZAre0t0k63IRzE61Zo4VoZFmI+d68tr4ExW2kyKgis=; b=H6MX3gnOWAIFEC
	40KVmbD/Z19XdtxpblSN/HBo9cqOSsVOyWvkKPPUwmb4btqMOCxRvRLdMd+K5NSC6Fp+LaSY+fcne
	/JeZFHoq77+9zrkxE79wNgLSg+/UU4MTC0BcYYH6T8hfDcqomP6HejUV55xxDiZnrADYKlmk9r/+I
	YP0kF9r4BSperjKP9744w1GYpC0HNsIgBrpeksdvqEmdWPwTk5fRSmSMA7f9sHDNsALYnkYQClZ+1
	pGDZ6rYPBjvJ0xIbfb3r7g+YYVdIcX2R0qelQg2khNuQRIejruXj2ui+gwD+nHatZeJNyAAFgAo8V
	W+bObGstGuU+TsPjxrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g8H-001bNb-Nm; Fri, 24 Jun 2022 10:01:45 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g8E-001bJF-6S
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 10:01:43 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-317710edb9dso20262147b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 03:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIvuhv2O2LJCEA/cN0nPJqVqA1J4nPDoUe8QnZLZj2o=;
        b=OanFfdyuKWF/daWLttmMlN7K0lRksfwYbjOsxSKcHo34GCUcbPBriX5mcqX8lLgrog
         8Ptx1jfKsJY0bB7uGBoWlYtGGu4nC1+GVlG/m0Pck2Wvm6Rwyadt01y+fUxnUdxodFD1
         GFPSAjSKnKV0IluZSwSLEwFHrLFsclN6mGg4Aizheu7R29WvVsteR32S86H+xPZQ9IAk
         shfRsHsiL6cGYE+ydspOeHaia/esEdz46UL3kvYHPbc2cwzVlm7kc0sK6Zs7TNbihsNg
         FNr9gvBxhLU8gXS5OjhqS3rggnw91+1tg4pu5g9cYg3fyPGJsyU2DdhcDyD+zbSBn2+4
         Nj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIvuhv2O2LJCEA/cN0nPJqVqA1J4nPDoUe8QnZLZj2o=;
        b=nLmkaCt12WGZsvvH+MHfRqJNogRpJwXkwCVx9FYrZlgQGfPlEdHdVQ+6JOXhDS4ke6
         dHdiBJlFU4ahXT3l7/L6KbrGaf4DVl2JW6vsVLJiGuACjBE0DbJTRRpLHda4sbUZ76EH
         qxSGHypa2gUFatp+zDBczhqiTrWgMMwheCZt5t1kLUagquhCO3MUkP800Sth814P/yuM
         U4ZwsXyM9LXC0ROK2f0jejOeBluZ+KKs7gsLT4QGMMYbK7oNB1Ezq0P3kpnKYO/DucaS
         4mH0r07ccP6vfMgscOPlmejtlhWwWtCa7svP364K8IhFyJ0HFm8N7ywCAt/3QWZtPWLg
         1+dA==
X-Gm-Message-State: AJIora8wFUs1qkjXVhixBYlWNIw4thAeNB1GTgJP/xsqGkTbS3+CGFh7
	GkwZH+BkujG+SchP2i5/5hSKqC8GfIqp+dHsO2A=
X-Google-Smtp-Source: AGRyM1uZqW7BeQR39fipb9XeJooEfmtD6YpdpSLjgsLZ1D0uhV9s/Y+ZgP2nYziC4BGU2b9eW/L214EfjspICcNXG1s=
X-Received: by 2002:a81:600a:0:b0:318:81bc:e928 with SMTP id
 u10-20020a81600a000000b0031881bce928mr6392488ywb.119.1656064898995; Fri, 24
 Jun 2022 03:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVos-hVhGar91oBvZaCOLfjdsNR7vRGnX-KuNt0UX3xWQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVos-hVhGar91oBvZaCOLfjdsNR7vRGnX-KuNt0UX3xWQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Jun 2022 11:01:12 +0100
Message-ID: <CA+V-a8vDF-GwfqgerWFNOrKGukdYk52OrcbprJv-=9J-M4VbUA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_030142_272523_92DF06F1 
X-CRM114-Status: GOOD (  20.27  )
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

Hi Geert,

Thank you for the review.

On Thu, Jun 9, 2022 at 10:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, May 24, 2022 at 7:22 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Document Renesas RZ/Five (R9A07G043) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > @@ -28,7 +28,10 @@ description:
> >
> >    While the PLIC supports both edge-triggered and level-triggered interrupts,
> >    interrupt handlers are oblivious to this distinction and therefore it is not
> > -  specified in the PLIC device-tree binding.
> > +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
> > +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
> > +  to specify the interrupt type as the flow for EDGE interrupts is different
> > +  compared to LEVEL interrupts.
> >
> >    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> >    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> > @@ -57,6 +60,7 @@ properties:
> >            - enum:
> >                - allwinner,sun20i-d1-plic
> >            - const: thead,c900-plic
> > +      - const: renesas-r9a07g043-plic
>
> renesas,r9a07g043-plic
>
Agreed.

> >
> >    reg:
> >      maxItems: 1
> > @@ -64,8 +68,7 @@ properties:
> >    '#address-cells':
> >      const: 0
> >
> > -  '#interrupt-cells':
> > -    const: 1
> > +  '#interrupt-cells': true
> >
> >    interrupt-controller: true
> >
> > @@ -91,6 +94,35 @@ required:
> >    - interrupts-extended
> >    - riscv,ndev
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: renesas-r9a07g043-plic
>
> renesas,r9a07g043-plic
>
ditto.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
