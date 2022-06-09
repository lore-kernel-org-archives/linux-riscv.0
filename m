Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC845C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5p+oi7XEgZaKH5oIMz/fHAXO/5MIIHerB4Dq17d0Xo=; b=eGP2xkRHQFDJic
	SIqcr21UZXLuCLFBLkeVxgzl89xRZjwLYJ9rFTZxcWh16DEwQ1Eka2SZ942I6tx8+kzKbVZ88QlfM
	bEXN8ke76njotxsN0eq01j5xjkCb6zBm6P87r9cW/DYfwlTWztNQsGBrwkhF83OTvnM+MFVXQIRAD
	ruPxKycNkGb2AgI2DaBaAbKNRCKcTOdGRqL+EzsqpFVhQdG+RoG3f9ZsJNXFly2sj+kRPNdCx9cp3
	QaCqQCb63dbh349ou5nHOn2GSXN+4lcvFLAln1JqoU44AsPnndQzP1TJWpbUAVjW2xY/0WdI8RjX4
	o+YC6VtS5X07erYUbGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEgO-000jkQ-AJ; Thu, 09 Jun 2022 09:42:28 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEgL-000jid-DP
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 09:42:27 +0000
Received: by mail-qk1-f172.google.com with SMTP id 68so8886735qkk.9
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 02:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CdScqDIt7cletpD0dszRyDkdpl0EPlQmkhSL9q4U+Ck=;
        b=imLp9m4i3N+Soxo1cImycI5N+nUohPX1Y1kutZ76azL7oR8FS4Jgjhg7HKyt1ym/0+
         5CKsU7IZq+wgunFuiFlrFw0b57+gdTC8Xmc/EHRg69AiWBM18enBx9ZgmIkt8u0Mleqk
         +KorOh9Wgk1BqW66hgCMbGYu2vXFjyCC63QRORFVjH0Is2xcZeRGxQPZwXXw8+2wqW9r
         R8c2pDCRBKx00pka8R2yKbpfIBcLojGKWS1eeXCS8jEtP3gz8H4tq8yc9nJMafOVe1/C
         urPCAGy2PPRpIthhaTtHNJgcpIj6DCP2f8viIP6qENzlidrkQhTRbF3+PF8u1DJUyP1U
         rltA==
X-Gm-Message-State: AOAM5314jQM/UO/+/0JzLSkEw4Mnup0RTl2GfE4QfWKdEnBWJq/WLwRS
	A7kHe6U+vfMlBv/oFenr6LYBt4BtP1bjHg==
X-Google-Smtp-Source: ABdhPJzsEuCAQj6LPZpGnbj58iFaE+fdDfhJzk6GOl/qICYF7aHLxMb8rW4G7JAgdGvYRE8NU9Xgww==
X-Received: by 2002:a05:620a:4495:b0:6a6:dceb:87fe with SMTP id x21-20020a05620a449500b006a6dceb87femr8402618qkp.206.1654767742726;
        Thu, 09 Jun 2022 02:42:22 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id g16-20020ac85810000000b002f906fc8530sm8094378qtg.46.2022.06.09.02.42.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 02:42:22 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-30ec2aa3b6cso234680367b3.11
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 02:42:22 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr43772632ywd.383.1654767742001; Thu, 09
 Jun 2022 02:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jun 2022 11:42:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVos-hVhGar91oBvZaCOLfjdsNR7vRGnX-KuNt0UX3xWQ@mail.gmail.com>
Message-ID: <CAMuHMdVos-hVhGar91oBvZaCOLfjdsNR7vRGnX-KuNt0UX3xWQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_024225_501207_4A2A247E 
X-CRM114-Status: GOOD (  24.04  )
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

Hi Prabhakar,

On Tue, May 24, 2022 at 7:22 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document Renesas RZ/Five (R9A07G043) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -28,7 +28,10 @@ description:
>
>    While the PLIC supports both edge-triggered and level-triggered interrupts,
>    interrupt handlers are oblivious to this distinction and therefore it is not
> -  specified in the PLIC device-tree binding.
> +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
> +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
> +  to specify the interrupt type as the flow for EDGE interrupts is different
> +  compared to LEVEL interrupts.
>
>    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
>    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> @@ -57,6 +60,7 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-plic
>            - const: thead,c900-plic
> +      - const: renesas-r9a07g043-plic

renesas,r9a07g043-plic

>
>    reg:
>      maxItems: 1
> @@ -64,8 +68,7 @@ properties:
>    '#address-cells':
>      const: 0
>
> -  '#interrupt-cells':
> -    const: 1
> +  '#interrupt-cells': true
>
>    interrupt-controller: true
>
> @@ -91,6 +94,35 @@ required:
>    - interrupts-extended
>    - riscv,ndev
>
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: renesas-r9a07g043-plic

renesas,r9a07g043-plic

> +then:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +
> +    resets:
> +      maxItems: 1
> +
> +    power-domains:
> +      maxItems: 1
> +
> +    '#interrupt-cells':
> +      const: 2
> +
> +  required:
> +    - clocks
> +    - resets
> +    - power-domains
> +
> +else:
> +  properties:
> +    '#interrupt-cells':
> +      const: 1
> +
>  additionalProperties: false
>
>  examples:

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
