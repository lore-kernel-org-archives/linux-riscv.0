Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5672DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBn5MlI38V0Ovk2hkRs610mtwIKAaOf0HS8RYON0bPs=; b=NoXb+VK4Td6+Q5
	TIjaAziEY0L/DorQb5S6sfXgnxIa0tcB9tHKTa26oCw7QUSfkRGgSK4wRB7Sp6VXil1YKYqcjLnvn
	yHkYXyUhI9PwiJF3SXF4Qo/FYSPAazJmzZYGTtGK9Yu7ux1VAesb6OtK5MPUa1c/gNPR/zTC7+WY8
	MezEyKQVBg4Kv5Hf2N/1lyjmt//Sc6wdph/qAD+O8VdPUCYsmFW0fI0mtHNnBEGdFhJGO/r+2xB+y
	UVExlK9xV07X9qElS/4ImqTFyO3oPgTZ3zhb9tP2CeNn0WVgQRNf2Fmy6GWYEGFSGSYzatAbC6p6e
	CGiU7gvfPzBov3ZclECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nqu-000rle-3w; Mon, 27 Jun 2022 12:28:28 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nqi-000rgE-ED
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 12:28:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id cw10so18838116ejb.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 05:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Elsn1kdcp1T0aFss4s1Yn5n0Fewq2VGTa3vav17sj6c=;
        b=T++L9c9Wrp7TLX3Coa2qMb2pFJ7wXTapRDHRv6uk6BV75+qlhlNOoLuXpRecpu4W4v
         y6AUq2ckXD8LCT52aOCtqHxHtjwSGNIgpUr+S6cbXtL5gxkxOtxwlUMrRxvw8MQ5ZgCm
         onofVTt+wbq4XQ58cUuY1hq520R6YjogzN+E6pzeS2uipAb1LxfCWhJf5g4Xx5frrrwj
         jC0PrEkBRYG8d528lrEHQIwhV0XOgFVjYJoHnNGKsGTaJoiQ/LoDcClnXLG6bPNfPxie
         oSaikNWNcscK4cjfAAphFn9wqbZkEMmNC5Y0ngxLXZBZp2H95SKOvvaWskvvQ4BlDyRe
         vvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Elsn1kdcp1T0aFss4s1Yn5n0Fewq2VGTa3vav17sj6c=;
        b=QnCZuMeweHD/JXnY5AYl/p7RvqWpEFtkp/oJaifu9hJEquU25mjA66KgvCtd/q2uvK
         Ub05m+W5+L4CkLcu089O7+2FRUS1wcHfP8TnwFu7Cc8YxGXse5xgHTiN/i44SQeQOGVD
         ZKTLzMnTZ9mkRUXuHwWFJpwT+xs8/kG0uxmO4GjK1ZmVuNqmz6q+YPSyz7564VCFYb5m
         HeOWzd4GR8WkX1DOJQFsD3VWBbOlBrsNPKqIerbLY+CSdEFEFf3d1BkgrPVnNUnIJRtw
         huAQlifBq8PX5W3tmmFNfKbfzVckZ2vyl/AKkYS9WNnh967YNvZfmybrZrSWLSZvh9fT
         z9lg==
X-Gm-Message-State: AJIora+Hp622b35XZmIcw+wAm9hUUYT8n8VY+Lgbn1EYG5Au8UOeMqh+
	jQeh99joaxzurvloJRvi/13nleYADTjEoQGzLp8=
X-Google-Smtp-Source: AGRyM1sVp1iVWM23LPMLvWA8ATPnDg1VhspCYWfwAdDmgWn2gEDaIH/aDkyrg7GJPh57jqsKQn+pRxKUCbei30tyBbY=
X-Received: by 2002:a17:907:72c4:b0:726:9406:f760 with SMTP id
 du4-20020a17090772c400b007269406f760mr9104598ejc.247.1656332892065; Mon, 27
 Jun 2022 05:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <87tu87eh5h.wl-maz@kernel.org>
In-Reply-To: <87tu87eh5h.wl-maz@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jun 2022 13:27:45 +0100
Message-ID: <CA+V-a8sihw9=Ychakh6tV+1+MpRayr=1VSnhSYZNp0F+f4Hdnw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220627_052816_560252_C7E28F85 
X-CRM114-Status: GOOD (  27.93  )
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

Thank you for the review.

On Sun, Jun 26, 2022 at 1:35 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 26 Jun 2022 01:43:25 +0100,
> Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Document Renesas RZ/Five (R9A07G043) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > * Fixed binding doc
> > * Fixed review comments pointed by Krzysztof.
> >
> > RFC->v1:
> > * Fixed Review comments pointed by Geert and Rob
> > ---
> >  .../sifive,plic-1.0.0.yaml                    | 44 +++++++++++++++++--
> >  1 file changed, 41 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > index 27092c6a86c4..59df367d1e44 100644
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
> > +      - const: renesas,r9a07g043-plic
>
> Since it is the NCEPLIC100 that is broken, shouldn't the compatible
> string actually reflect that? I'd rather see 'andes,nceplic100' once
> and for all instead of starting with Renesas, quickly followed by all
> the other licensees that will inevitably integrate the same IP (which
> isn't even specific to the AX45MP).
>
> This IP also comes with all sort of added (mis-)features, which may or
> may not be used in the future, and it would make sense to identify it
> specifically.
>
Agreed, I'll update it as above.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
