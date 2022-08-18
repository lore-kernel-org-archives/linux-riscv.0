Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329B7C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLpDT3La+2F4OI7nbSuHbAXiDVkhhrDmdJpJQ4cbDbc=; b=oOZoR2Cqk5zhBV
	28xbHF6qF7TX6JXZd21lYhM/QBP85PcpRjxtoTZdQnvE8O/KniXUvwcZIlYU0xrly9ExDcoCfoMzN
	AUSi1Ny169aWdZn2W4wDtum/totpz7F2nRH3ia+i4dLmvtfGBBuI5ogrWecMYCii1q5fl5INXOScM
	kHgFYYF7ExBHTBqrQItlCxTQhsdr32tORsPkvqnZ2tstQlrfBBkgY2Orw95+3Cbv75Vcip1OoxFmE
	FYDT1M5dvPWsMZvH2HBgvr2cF+R0lRo4WE/SJZLBhnkPKHOWGtNroCkxIj9J7fv8oLojDeyg1yH5t
	XjUkuyqlXOOUrkAgFc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOh4f-006P39-Re; Thu, 18 Aug 2022 15:04:45 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOh0d-006MfL-V6
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 15:00:37 +0000
Received: by mail-qt1-f172.google.com with SMTP id h21so1291852qta.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 08:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=C69f4QDvaAb9KHdDEuFrDGdZguxo1xk19InMWxRMIz0=;
        b=q+v/rT7MBtKSSjPGCVSAXjrVrt6jsfYLe71yN1+AzL0oB2G1IlGkR2tx8pK5Yal3Z7
         WjM5eiT2hTHbGM58KmH3zQxT3++jh1lVdUvQPzk3y7pXxWA6V/xJgohzdW6NF+4Avnjq
         sImnW9OAjs6qNPYVc9BeO6AniGlZAUkYXbimwFwGRV6XQz2Vmk2G6VowuFfwrKVQ1Hk6
         Xbc54qaWRq7Cu258gSYI1fRqsCUj6M4Ihwme0i7fJ160QCFcZie181UexKWJqITzDVoG
         tageSQ2+9rRJUCSS6nat8tk++vPpt5xDVmQWcYqxqxaLiKOCaev3EjHIZqetNHLFKeHT
         nb0Q==
X-Gm-Message-State: ACgBeo32XkYXiiwLpZG6VkZsxu24/E7DAf840UrDCB3+f7C9sl84u5x6
	r7ZmgmizuGAxwAKQL/NO/v/nRxvDkWqXmw==
X-Google-Smtp-Source: AA6agR7OwxBUe2+BzrGGYL9FI8fO2Y734cWDvQrvVWj0uTKnBtGcCeRc2F+DlQyasM4KtVNLjICYxA==
X-Received: by 2002:a05:622a:1015:b0:343:67ae:993a with SMTP id d21-20020a05622a101500b0034367ae993amr3050552qte.180.1660834833565;
        Thu, 18 Aug 2022 08:00:33 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id h16-20020a05620a401000b006a793bde241sm1744117qko.63.2022.08.18.08.00.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 08:00:32 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-335624d1e26so48250347b3.4
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 08:00:32 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr3267925ywp.383.1660834831754;
 Thu, 18 Aug 2022 08:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 17:00:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaketBpEfoSKeSJ4SuYwOTLoqJ_FCp=G8HmVudhv3zWw@mail.gmail.com>
Message-ID: <CAMuHMdUaketBpEfoSKeSJ4SuYwOTLoqJ_FCp=G8HmVudhv3zWw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <Conor.Dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_080036_068141_F8806382 
X-CRM114-Status: GOOD (  19.61  )
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

On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document Renesas RZ/Five (R9A07G043) SoC.
>
> More info about RZ/Five SoC:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -415,11 +415,12 @@ properties:
>                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
>            - const: renesas,r9a06g032
>
> -      - description: RZ/G2UL (R9A07G043)
> +      - description: RZ/Five and RZ/G2UL (R9A07G043)
>          items:
>            - enum:
>                - renesas,smarc-evk # SMARC EVK
>            - enum:
> +              - renesas,r9a07g043f01 # RZ/Five (RISC-V core)

Should we be consistent, and leave out the "(RISC-V core)" comment,
or add it everywhere?

Note that several of the SoCs listed in this file have SuperH or
RealTime ARM cores, so going for the former means a lot of work.

>                - renesas,r9a07g043u11 # RZ/G2UL Type-1
>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>            - const: renesas,r9a07g043

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
