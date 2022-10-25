Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C97ECDFA1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 22:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NZFEZ02atdvWavHVnX5omGEZ/r3M0sYZ6Op1cnjoA8=; b=oz2WSlnfudBCWE
	+zqQz2UaYzOL/EZTA33knjkSSn+uKeO/aPTzUPfV2hj5N+IU0sS+wMNSgZUZj/J8of0obFqGHzoN9
	ZsmRI+KjIx1nLloGVNRHJJheCqjkkP8dEoo0nPwEum5kIT2DpeDbEmzKoHAYNlWnf76eYejvFiS+w
	BRnpzDjwA5R5wy3eZ5FngGHZl4PmxK/iJzC+xvQFxEuodcXmrgkg13CviEI0eB6ocCzuJXYaH0zJW
	nVuyEM+w5KGHUuWbdA9sjT0RhLydR4qWX6Jj5jNXJ4LCOGeXCiM1hlwBOPYThQGwmmMpD/noL3zIa
	Xu0XMY7wO1QW9ASGAljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onStB-007Tkh-Tg; Tue, 25 Oct 2022 22:59:17 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onSt9-007TkB-Qk
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 22:59:17 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y12so18425683edc.9
        for <linux-riscv@lists.infradead.org>; Tue, 25 Oct 2022 15:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=udy479ObjWYY5CFX9ZP0gGul3ib61HsEaOXglQsZUR8=;
        b=kRiPEyk2E7S0EkCO/J07RPKhy/NhdmvHvaLaff/l5T/RAR1qGg59zpFrXUDOU/m0DR
         BSXuRAzPYAw49Pg4UBKrS50JHKHe2GrUwXFH4LWAa9HhLPtCkatZdMXA0eVwaZujnCNW
         J+Q92e1VnvtpKgkItdw1G1zOcyskidwZccW/lQhhwwFKef35yL6BnWEUm7Q4oLjtxStg
         NKft7Vm8Gedm1bSS72iIRJSaLReOdpt3RGtE4tTBaofRTFTfusTdE5spkdWAJYTy64zy
         eDftWn/qWifn7P5a+uvUuOi/LNqLyH+x0t31WApUmVZxSc7Q6iLJd5o7lbkrKjq9Og2N
         GIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udy479ObjWYY5CFX9ZP0gGul3ib61HsEaOXglQsZUR8=;
        b=sZvy/g6iWFOLdfpZA1V/fe0zSngffuNoKYKJffMwpuEEFlH9amT/MGavCe+hhlXtm8
         lDrpMR7LzRxETEhZXaFwX0TdGKx1nr6RnSGum8frXTX7Ha2/3Ri2kgNYq3CZp5ctyybj
         cgKux6r7/hAuVV2kTDleRdNZx4wBIBNZG3xNi7gFCa+JCCp9U0enrkv0BP1rohhe84oR
         vIoPXct/RFgM/HVnl0xxi/PH5NF9MhOHYoi4iLP4e4feYxyQ1oiUlICS9bYBYPXFSsNo
         LjVwUaM3PumMk7+FzOVFhfxHU7XsOboiWFuBPGD8iqoXXoGMMCBPE80wQzXytxXosdUL
         +1dw==
X-Gm-Message-State: ACrzQf2nNCUmUWRnHqrZ4hQCHDRd+fptLVH5ywNOzvV4hwjKaG/tEjpJ
	GIT6+gWHTvyyzao61EUpK3MT7C2b9QJkxu8hsJI=
X-Google-Smtp-Source: AMsMyM6qiQz41DTYKHnjjT5v9wPef/t11I6GH1qwMNjA79NgdVe3Lov+5CqFbMmrBeZBknHbcrg0WSUcZOo9RqPZSNw=
X-Received: by 2002:a05:6402:5485:b0:459:147a:d902 with SMTP id
 fg5-20020a056402548500b00459147ad902mr39292630edb.263.1666738753824; Tue, 25
 Oct 2022 15:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVVzUN1ScY4vh3d8=XvshOjc0C4G2duFRHSPms3S+2yeA@mail.gmail.com>
In-Reply-To: <CAMuHMdVVzUN1ScY4vh3d8=XvshOjc0C4G2duFRHSPms3S+2yeA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 23:58:46 +0100
Message-ID: <CA+V-a8vAf93uyD6o7vEKjb1ghrWh9iY+LDGkgz=e149MdoSZnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: cache: r9a07g043f-l2-cache: Add
 DT binding documentation for L2 cache controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20221025_155915_890321_3467B67B 
X-CRM114-Status: GOOD (  31.75  )
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

On Mon, Oct 24, 2022 at 2:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> >
> > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > describes the L2 cache block.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
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
>
> large
>
OK.

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
>
> This is fixed here, but the driver accepts (and uses) whatever value specified?
>
Right, I'll add a check in the driver.

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
>
> According to Section 8.1.2 ("L2-Cache Prefetch"), this should be
> [ 0, 2, 4, 8 ].
>
I was directly fetching the value, but as you pointed out I'll switch
to the request count and convert the value accordingly in the driver.

> > +  andestech,tag-ram-ctl:
> > +    description: Tag RAM output cycle. First tuple indicates output cycle and the
> > +      second tuple indicates setup cycle.
>
> Nit: to me it sounds more logical to have the setup cycle first.
> See also the order in the comment in the driver code:
>
>      /* tag RAM and data RAM setup and output cycle */
>
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    items:
> > +      - minimum: 0
> > +        maximum: 2
> > +      - minimum: 0
> > +        maximum: 2
> > +
> > +  andestech,data-ram-ctl:
> > +    description: Data RAM output cycle. First tuple indicates output cycle and the
> > +      second tuple indicates setup cycle.
>
> Likewise.
>
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    items:
> > +      - minimum: 0
> > +        maximum: 2
> > +      - minimum: 0
> > +        maximum: 2
>
> Do we really need these andestech-specific properties?
> If yes, how much (if any) of this do we want to be handled by the boot
> loader, and how much (if any) by Linux?
> If Linux is responsible, we might have to boot with L2 disabled, right?
>
> For ARM Cortex A15/A7, we also have arm,{data,tag}-latency properties
> defined, but no DTS specifies them (my patches to add them on R-Car
> Gen2 were rejected).  Note that this is different for e.g. older PL310.
>
OK, I think we can get rid of the below properties completely from
here and have them configured earlier (ie in u-boot).

       -   andestech,inst-prefetch
       -   andestech,data-prefetch
       -   andestech,tag-ram-ctl
       -   andestech,data-ram-ctl

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
