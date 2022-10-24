Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0269FA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nERcoat92ZBJRkch7CM4sVMJu7d6SpLtJ1gv+qL/zM=; b=2yb/sa7/zV70IJ
	A6vu52MqxQfhlZT1RZ4Mx2t3H0f2wqqRVLqVGS1RNKgn/MLvvtiXN2KINquv4Rx9f0nUIdXWy7QFz
	57jkEQs0CNvekLs1VT+3DFpR8n6ObJR3GfZiP9O8GUMb5G9XKLRFj/I76CUz8FEB1X3eiObaXYjkB
	r0z2MlgKyV/Kx1mc2Jn1xpNhTsXhRHyplejkzz+QBh/fbvbBxxLS2/0iQaOapL47dCrL/Zvr5r7yo
	uSO7oJPkDD+ffKGQjPZ6ysudQnLLvBOqzqPnLQrN4B7RWldVrBm0iOyQt2F4cMFSeFRXUlnWTE2aX
	5M2knvj+0nUUstnp5atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxv0-001mnm-4J; Mon, 24 Oct 2022 13:55:06 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxuy-001mmx-0p
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 13:55:05 +0000
Received: by mail-qt1-f176.google.com with SMTP id l28so5623606qtv.4
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 06:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOUr8vKGqEWk39crx6gBwH6ieHL8arm1vSqANMxY3zA=;
        b=VH618pnBjdvcVJhF9Tn73MDO3sgkt+y4hJ5Bw1uv/sZ3kEGCpro2gP2NVdZI4d69Aq
         kVEzZkHghZhyFNHCZsN4/98vOV2KPdHPGHMjo4yvtCnLmQxELuMAPJjhGsofddr5elUW
         NNn+HxfYU/K9/uwbL7JnU0mq6BrUtdO6Swgrqa1oC60xbJ7PkVuIficXx93HrHciSMV2
         1ehi3pHoGn08Cc3FjLpybzBvJ3Tq6VAR/wh/mjudIUKmenh0jKXNsGh6a0GINlQWDyXT
         5JcEqkwaxx8U2BCHDbfFaSDEkek4x4G+bDQdxfalesrUBHfqzlOAsvN3MuqVwg/LPDDK
         csyw==
X-Gm-Message-State: ACrzQf2oXCa5rTHo18VTHUBfbjI8qcy27XZncOe97SbtSAIPwG99goJ5
	5gjBEDXJkl+9ev1fmp+q8RkIgMVuIbLkDg==
X-Google-Smtp-Source: AMsMyM4nc8YOKoqi/nLvz0J42heAvreoZZh0Ebi9ZyMBbtt9XwiY6CxBg18y4iTWjpV9Ip005QNrFw==
X-Received: by 2002:a05:622a:4cf:b0:39c:f920:c8f8 with SMTP id q15-20020a05622a04cf00b0039cf920c8f8mr25907263qtx.1.1666619701757;
        Mon, 24 Oct 2022 06:55:01 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id cc11-20020a05622a410b00b003434d3b5938sm15184qtb.2.2022.10.24.06.55.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:55:01 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-369c2f83697so78766317b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 06:55:01 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr28384338ywe.283.1666619233755; Mon, 24
 Oct 2022 06:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221019220242.4746-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221019220242.4746-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Oct 2022 15:47:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVzUN1ScY4vh3d8=XvshOjc0C4G2duFRHSPms3S+2yeA@mail.gmail.com>
Message-ID: <CAMuHMdVVzUN1ScY4vh3d8=XvshOjc0C4G2duFRHSPms3S+2yeA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: cache: r9a07g043f-l2-cache: Add
 DT binding documentation for L2 cache controller
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.co>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_065504_088446_0CB154CE 
X-CRM114-Status: GOOD (  28.72  )
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

On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
>
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> describes the L2 cache block.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2022 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andestech AX45MP L2 Cache Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  A level-2 cache (L2C) is used to improve the system performance by providing
> +  a larger amount of cache line entries and reasonable access delays. The L2C

large

> +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - andestech,ax45mp-cache
> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: andestech,ax45mp-cache
> +      - const: cache
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cache-line-size:
> +    const: 64

This is fixed here, but the driver accepts (and uses) whatever value specified?

> +
> +  cache-level:
> +    const: 2
> +
> +  cache-sets:
> +    const: 1024
> +
> +  cache-size:
> +    enum: [131072, 262144, 524288, 1048576, 2097152]
> +
> +  cache-unified: true
> +
> +  next-level-cache: true
> +
> +  andestech,pma-regions:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 1
> +    maxItems: 16
> +    description: Optional array of memory regions to be set as non-cacheable
> +                 bufferable regions which will be setup in the PMA.
> +
> +  andestech,inst-prefetch:
> +    description: Instruction prefetch depth
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3 ]
> +
> +  andestech,data-prefetch:
> +    description: Data prefetch depth
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3 ]

According to Section 8.1.2 ("L2-Cache Prefetch"), this should be
[ 0, 2, 4, 8 ].

> +  andestech,tag-ram-ctl:
> +    description: Tag RAM output cycle. First tuple indicates output cycle and the
> +      second tuple indicates setup cycle.

Nit: to me it sounds more logical to have the setup cycle first.
See also the order in the comment in the driver code:

     /* tag RAM and data RAM setup and output cycle */

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    items:
> +      - minimum: 0
> +        maximum: 2
> +      - minimum: 0
> +        maximum: 2
> +
> +  andestech,data-ram-ctl:
> +    description: Data RAM output cycle. First tuple indicates output cycle and the
> +      second tuple indicates setup cycle.

Likewise.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    items:
> +      - minimum: 0
> +        maximum: 2
> +      - minimum: 0
> +        maximum: 2

Do we really need these andestech-specific properties?
If yes, how much (if any) of this do we want to be handled by the boot
loader, and how much (if any) by Linux?
If Linux is responsible, we might have to boot with L2 disabled, right?

For ARM Cortex A15/A7, we also have arm,{data,tag}-latency properties
defined, but no DTS specifies them (my patches to add them on R-Car
Gen2 were rejected).  Note that this is different for e.g. older PL310.

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
