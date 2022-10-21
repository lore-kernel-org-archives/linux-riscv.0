Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32CCC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQ4aLLaXdH0g3mKvDm2Kvo5tqjs3ZFL3gVaNSK+Flys=; b=pAOGvjno1rC8nQ
	YHUsGcF+qietI29KgvwkjK5COaLbJCviNbmpP6LdBeBH6h3SvznB9+dVKy11lqe5CLZS9PYB1h7FE
	s/mwWovHHEUhAf1it2vCo4jY2kj3qmBan4ufwSQ8I45pqFZNo4n8iV10fygDjKhjclgtJRdojm2kX
	03cek6ifLMqPbmnkxPvVGJ5a4CEa5txPXFY92SdEPE1D/IcH/ngph5jKbXh/5a1gs7tcZ/IVZPduM
	nVVFoHWYjyGs0i03xdSHYk2Sp/hjxiD8iLQuvLj/pa3lNJWIXYqz+61zYcwfeN5tAywETkwO1u6ED
	mRqhiDrAftjIltQ10Xng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0GU-00A9Fw-A4; Fri, 21 Oct 2022 22:13:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0GR-00A9DW-2l
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 22:13:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id m16so10760769edc.4
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hjvmw72+jg+DsIKSh1utr1OBPgBsXbl/oMeJG09/SV0=;
        b=lVVznKdsNy9DoOtyaoNzOXvV+CA4XIHhe12oB2nxluu6+Zn74jmBrt7IhVlAiNOC6r
         THKSgsfUT/c7HU1e2i6Ps5KOPemnDoZ00hIyZfW5cWEgSEV2+Q0+vjDegLFO3iOINYtb
         3JPDos5qggIJQbUu/CLIn3eP079shfr1AyzE16M4S2FkEbDkpnGIJ49NYCcWjO5R5t95
         ydEyWOrKnJwsM6qg7pXcQjWv51K/+it5COoTHb5gLE49isEWGrSd353nXxQr3joHNqIV
         Eb5LWoczMe3HYAbxlzKccxL/72mrvyAZMMEoiflxOVddfHRNicbghk0sITjxvTrrw04Q
         cRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjvmw72+jg+DsIKSh1utr1OBPgBsXbl/oMeJG09/SV0=;
        b=myng0JzKOR+zT5jr5QfkUMGHhVSN7dnNCN2f8XKQMbfusz2jXeyT/PnUqi6QjVslWJ
         F+lk53FedoaFj8FiXGx8Au088F9z6FXcu1n41rcAS4FKImixd2SOM2uF7j6pzUxBjzFN
         8iknBZRgNHxsYwFx816xAXcMvwP4gwoBqZI0e5iOfz3XwZhU5LLVQwcaTdxLzRmMaOrk
         LytIo8azD59BJ1q/oiCXkPDf903gi1i4oH1HfSD6v3Y25QTlx7o/geUzDoZNBteW8+se
         kPTeN/FKFAYoGBBy84wqAFbMYj4mjHCfMI81Rnz9KdmJp/wHZZq68KfpzSqRjdWDl7Ug
         HNWQ==
X-Gm-Message-State: ACrzQf2vsM1wghoZyJl06D0NNynjalQU5+pB5tykHLxd0WOMZ5dq7gbo
	ynWOUEP3mCLefMhxtUZFlBfDoYPM8SBzkmiQl/M=
X-Google-Smtp-Source: AMsMyM7tVViOUvuari02fIONQYzlg8jdd0EECyRiJpb3iJ/LEjcS03V19gkGHtZgK+gVX/2RKWfxEi7jOsdCA9Xs4gM=
X-Received: by 2002:a17:906:5a4b:b0:78d:4e5a:d101 with SMTP id
 my11-20020a1709065a4b00b0078d4e5ad101mr16967374ejc.196.1666390388943; Fri, 21
 Oct 2022 15:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221021021006.GA2171731-robh@kernel.org>
In-Reply-To: <20221021021006.GA2171731-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Oct 2022 23:12:42 +0100
Message-ID: <CA+V-a8uMQrM75qxyFjz_x+V9+Se9JsPE0D=2yrgUkNRA7r2tew@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: cache: r9a07g043f-l2-cache: Add
 DT binding documentation for L2 cache controller
To: Rob Herring <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_151315_164380_9E823A64 
X-CRM114-Status: GOOD (  26.26  )
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

Hi Rob,

Thank you for the review.

On Fri, Oct 21, 2022 at 3:10 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 19, 2022 at 11:02:41PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> >
> > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > describes the L2 cache block.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../cache/andestech,ax45mp-cache.yaml         | 125 ++++++++++++++++++
> >  .../cache/andestech,ax45mp-cache.h            |  38 ++++++
> >  2 files changed, 163 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> >  create mode 100644 include/dt-bindings/cache/andestech,ax45mp-cache.h
> >
> > diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > new file mode 100644
> > index 000000000000..4c86a15bda5f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (C) 2022 Renesas Electronics Corp.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Andestech AX45MP L2 Cache Controller
> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description:
> > +  A level-2 cache (L2C) is used to improve the system performance by providing
> > +  a larger amount of cache line entries and reasonable access delays. The L2C
> > +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - andestech,ax45mp-cache
> > +
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: andestech,ax45mp-cache
> > +      - const: cache
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  cache-line-size:
> > +    const: 64
> > +
> > +  cache-level:
> > +    const: 2
> > +
> > +  cache-sets:
> > +    const: 1024
> > +
> > +  cache-size:
> > +    enum: [131072, 262144, 524288, 1048576, 2097152]
> > +
> > +  cache-unified: true
> > +
> > +  next-level-cache: true
> > +
> > +  andestech,pma-regions:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    minItems: 1
> > +    maxItems: 16
>
> What is the inner dimension of the matrix?
>
> items:
>   minItems: ?
>   maxItems: ?
>
minItems = maxItems = 6

i.e. the first two entries are the address, next two is the size and
last two is the flag.
<0x0 0x58000000 0x0 0x08000000 0x0 (AX45MP_PMACFG_ETYP_NAPOT |
AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
                                                          ^^ This is
dummy and always be 0x0

Is the above OK?

> > +    description: Optional array of memory regions to be set as non-cacheable
> > +                 bufferable regions which will be setup in the PMA.
> > +
> > +  andestech,inst-prefetch:
> > +    description: Instruction prefetch depth
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1, 2, 3 ]
> > +
> > +  andestech,data-prefetch:
> > +    description: Data prefetch depth
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1, 2, 3 ]
> > +
> > +  andestech,tag-ram-ctl:
> > +    description: Tag RAM output cycle. First tuple indicates output cycle and the
> > +      second tuple indicates setup cycle.
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    items:
> > +      - minimum: 0
> > +        maximum: 2
> > +      - minimum: 0
> > +        maximum: 2
>
> maxItems: 2
> items:
>   maximum: 2
>
> 'items' without the '-' applies to all items.
>
> And the minimum is already 0.
>
Thanks for the suggestion, I'll fix it in the next version.

> > +
> > +  andestech,data-ram-ctl:
> > +    description: Data RAM output cycle. First tuple indicates output cycle and the
> > +      second tuple indicates setup cycle.
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    items:
> > +      - minimum: 0
> > +        maximum: 2
> > +      - minimum: 0
> > +        maximum: 2
>
> Same here.
>
Ditto.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
