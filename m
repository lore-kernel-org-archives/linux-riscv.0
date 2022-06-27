Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5753C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX23IkVGnaTft1lkByxK33O7zYpv1zwjzFuD+HDGcWg=; b=Ut9nBo+6OHqoA+
	OXpeZEqOiAu5k6oV6hBgXsbgBk5jV3YKVbVm8EM5W/2MRBZGlTmL79xeQBbYo+KWtjPflfhy/kq4I
	v+VkLDXOk9+53rNRpzPbBdG9HzNfeNGSFgiSFYV93QLUSYUEOgXJvf+uDDYQ+vVLnx3MEgPfXsn7R
	Ie3nf0owoEiy+Fn727iGzEbKOHVw7rGkDC+vQCViruZoQ8FWYyo0s0qzPgAv/EoxM3jx3UqPn7N/g
	mcUjJbORYJp/tspYYV2aAL0RKtpx5M+4SayqmNAdYuzhtLwK6B530+bo5CEeXybp3XBS7on3WqSiO
	R3+eKUdNVVAhT91iuV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pkW-001QF7-LV; Mon, 27 Jun 2022 14:30:00 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pkU-001QE8-5O
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 14:29:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id cw10so19600601ejb.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0RQuo68FMs3Ewydqyi9IiONXYW4rMeUPNWTwYPpOosc=;
        b=MzdoIB26iFVkILG/Mt1s4LYfQHztPMX/C175dvEV/uVJscpVucKtWQ97vnpCaAWfSU
         CpwChSeVLUhGL2n/eTsAriuJAwzs7oBqz24JQCXnw2p/Bnbr7ZZCpxnPM2GrK+74+NSN
         KewxQkzDoIgCIVL85Wk9C2SjShc6hPsL5iCNBCxgua3NId6txqObxC8rq1qWhRiOIFl8
         N0hnSamEe3u5/VIoR6JKFFEj8+xjXYdRw9Zsn2+M+jipeb7NlFK2V8HV+swBFEwdRkUs
         ftWitiLffThm52kMhgYnxog0xp2seWLjSpwIQ7bxCftk7UMtiId2MMuHS/1LYDgsNUqD
         Uxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0RQuo68FMs3Ewydqyi9IiONXYW4rMeUPNWTwYPpOosc=;
        b=4O8g7unFpmjB1mujHP+BBKiXJ38a/PQyMAfYarErE/hLL2CH/5WpO1cl1dN+3OMFJu
         yKNApIF1kbbwgEhFgCVi7hsSg6Bd3zsGiP5uYYCKHksfX7jd8j79aFNJiCfS6MZg7bf5
         F8IKAt3+W4uEBnR+v6/3zTInEzRbUdw8n4jtbZvF4Mo0/LZykoduT4/IQLHed+joEI9I
         sD9ZQeCgDSJRB9MKfEdpaaNR39mfFM/PRTccgnVdgmyz/0ROMhopdaZLe9ZiZjPGHzDY
         n2Xu7l7GP/sLnWU1EZkMwCfSzsYsv18CQSnMpOZP9pS8FaHhYw7IHv/jrqXJ4ysJN56c
         cKSA==
X-Gm-Message-State: AJIora84LT3o1A5SN2r/25R9wJmj5+vg6OPLKb6nw9gHnfyivNPkgkyH
	UIwLu6m6Pdud47Xr27QLJROEDlsgxdGY7pfNQ2Y=
X-Google-Smtp-Source: AGRyM1v6HvBJpI2zjqwnkNHhBqV1cK4hlM/aYv8C+uEiiVwmn1Os3FAYlv54APEOIV/+t60608gsPU0byrK9p/yBglY=
X-Received: by 2002:a17:907:72c4:b0:726:9406:f760 with SMTP id
 du4-20020a17090772c400b007269406f760mr9624040ejc.247.1656340193621; Mon, 27
 Jun 2022 07:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87tu87eh5h.wl-maz@kernel.org> <CA+V-a8sihw9=Ychakh6tV+1+MpRayr=1VSnhSYZNp0F+f4Hdnw@mail.gmail.com>
 <1eb7b6525a98b330894b6ce2f9167dc2@kernel.org>
In-Reply-To: <1eb7b6525a98b330894b6ce2f9167dc2@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jun 2022 15:29:27 +0100
Message-ID: <CA+V-a8upv16o86RFCcPVRjucM3WJUOwOejF_TzPwLibjq1_SXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
To: Marc Zyngier <maz@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_072958_241232_00E24209 
X-CRM114-Status: GOOD (  30.75  )
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

Hi Marc,

On Mon, Jun 27, 2022 at 3:22 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-06-27 13:27, Lad, Prabhakar wrote:
> > Hi Marc,
> >
> > Thank you for the review.
> >
> > On Sun, Jun 26, 2022 at 1:35 PM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On Sun, 26 Jun 2022 01:43:25 +0100,
> >> Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >> >
> >> > Document Renesas RZ/Five (R9A07G043) SoC.
> >> >
> >> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> > ---
> >> > v1->v2:
> >> > * Fixed binding doc
> >> > * Fixed review comments pointed by Krzysztof.
> >> >
> >> > RFC->v1:
> >> > * Fixed Review comments pointed by Geert and Rob
> >> > ---
> >> >  .../sifive,plic-1.0.0.yaml                    | 44 +++++++++++++++++--
> >> >  1 file changed, 41 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> >> > index 27092c6a86c4..59df367d1e44 100644
> >> > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> >> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> >> > @@ -28,7 +28,10 @@ description:
> >> >
> >> >    While the PLIC supports both edge-triggered and level-triggered interrupts,
> >> >    interrupt handlers are oblivious to this distinction and therefore it is not
> >> > -  specified in the PLIC device-tree binding.
> >> > +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
> >> > +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
> >> > +  to specify the interrupt type as the flow for EDGE interrupts is different
> >> > +  compared to LEVEL interrupts.
> >> >
> >> >    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> >> >    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> >> > @@ -57,6 +60,7 @@ properties:
> >> >            - enum:
> >> >                - allwinner,sun20i-d1-plic
> >> >            - const: thead,c900-plic
> >> > +      - const: renesas,r9a07g043-plic
> >>
> >> Since it is the NCEPLIC100 that is broken, shouldn't the compatible
> >> string actually reflect that? I'd rather see 'andes,nceplic100' once
> >> and for all instead of starting with Renesas, quickly followed by all
> >> the other licensees that will inevitably integrate the same IP (which
> >> isn't even specific to the AX45MP).
> >>
> >> This IP also comes with all sort of added (mis-)features, which may or
> >> may not be used in the future, and it would make sense to identify it
> >> specifically.
> >>
> > Agreed, I'll update it as above.
>
> Please synchronise with Samuel to have a common series that fixes
> both the Renesas and Thead platforms.
>
Yes Ive dropped an email to Samuel.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
