Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69426C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFAVVyou9nckeZHcmWqNjkCzAgq/lgpZkRp9owjnLpg=; b=E/lSHjcHM2OKrJ
	ISfHHUq5KKGoSyJNfVKH7R5KaX/+hWO1gIw6WX/HT/BjKhv3A6DanAaJytbO6tbFRrxwbPhBRzT83
	7fqE5Kt4JDNkoiNK6Gfk/lEfxb20+hKEcR3KVixcC2JhnzODY0kobYRILdxCWGXwfYDS0bHDEGSfQ
	U6tok3mvm9phKzUebR9S2reKPa+GIRWNTdjLc/7czsrgVA0A0Kd+yeoVdCPGb7PcwrrpxfyvjuwnB
	16jnO9rCCeRDlN/rK7qcQdjgwQVqqXEEUUm6Ymm+TXPjRFnAM68BE1h3Zr5OqHVJtDQw5F9rdwBBT
	oq0IBlIOja+VZVbKx2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX9T-00GELU-La; Fri, 25 Nov 2022 11:45:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX9R-00GEJd-8s
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:45:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id i10so9761122ejg.6
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WnWzpuk7Fe04fSZwbn2NzRu+EG7+nGTvMdlTedNh0so=;
        b=McOLIbuYjtbFO9iH9lHO/kmEoDMrqzPqVJEVvJFx4PuARS9AbXt6aq0iSRM0ATX+5r
         Vt4stcYtUUyKLQtjs6M7lTzQzhS0tbGW6fi3m+/kEJlFmhjGTl5krD2tNdN/Ib5gO1Sc
         RCFEs7XGlB7bUck/Yz6rfhTi4CCulEtRv0aS8J6X97r75Jm8QvVrAGLiLw2gRvFnR5ey
         3p68n7bt7DqQ9bT+SIn9m0IG5gX7O2zTzc6NaJ0qm6VtJP9Xq0fVKh7kZQPvzQ2HFHXm
         u83UQe7J91Bo0IcuoxSSRu91MLJR6MZ8wJx2tdy/sh6axSX0stwnZ5gnFp8wtptXbfsu
         YL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnWzpuk7Fe04fSZwbn2NzRu+EG7+nGTvMdlTedNh0so=;
        b=YijZZg62TyT11PxXxz5Avs7c2fvpVc7lqqE/YSuKHCDAdKF6Rtg9YzXBdIu26v+KFS
         ZYtvDYkOaLLn+Ax8oSkZ9kSKdV3UgdZrYqLEVyKmXkA5A9tfgztakFXjZKfg36/7jvu+
         DOdFsJstXvjip7eGheK6oWE6LJkcLC/xEyp2vB9duoyG4ij8RSLCtZHBSy+H4MzFtzcJ
         AcpkhQWNVjM8rmpZN4wJbmgdQl4i6d7AsJUky31lG3ze1512P+izbCgS+d5UojnCfRAG
         cxrvQf+4sbrOMdwMXCZroG9E0PHPhKnoVHhVrSxfT2KtF9qO3WuHhJBloN68+IoZEVJO
         9hyA==
X-Gm-Message-State: ANoB5plKLFKpK+3n4kmPIkg5YTrTzbAkkkXUdcGq75SHvL6rZQjfJlyK
	4n/c2QfWDbaIhAjtBcKyo8D2xK6AYxjKsjuJpjs=
X-Google-Smtp-Source: AA0mqf7IubZa1gVPfYiGD5E7i0Jzn7mDxMJIH5SkqjavpTlcvWOw33JXPhHjOAy06Ubt0XOI8dVwKtbv1bbqWy/TyF0=
X-Received: by 2002:a17:907:7650:b0:781:e568:294f with SMTP id
 kj16-20020a170907765000b00781e568294fmr17649629ejc.447.1669376744514; Fri, 25
 Nov 2022 03:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <70d1bfde-f57f-1741-08d3-23e362793595@linaro.org> <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
 <CAMuHMdXktJWskc8m-hL75gfkkkZnqsiuraAG+wPjWcs2JZpGKA@mail.gmail.com>
In-Reply-To: <CAMuHMdXktJWskc8m-hL75gfkkkZnqsiuraAG+wPjWcs2JZpGKA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 11:45:17 +0000
Message-ID: <CA+V-a8ui9vyLC7_PdwCdeSsOujFPuJ8LU3WeV4uOKpjcphhaWQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034549_333450_94AAA3BA 
X-CRM114-Status: GOOD (  40.82  )
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

On Fri, Nov 25, 2022 at 11:18 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> , Hi Prabhakar,
>
> On Fri, Nov 25, 2022 at 11:34 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Nov 25, 2022 at 8:16 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > > On 24/11/2022 18:22, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > > >
> > > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > > describes the L2 cache block.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > RFC v3 -> v4
> > > > * Dropped l2 cache configuration parameters
> > > > * s/larger/large
> > > > * Added minItems/maxItems for andestech,pma-regions
>
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
>
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +    #include <dt-bindings/cache/andestech,ax45mp-cache.h>
> > > > +
> > > > +    cache-controller@2010000 {
> > > > +        reg = <0x13400000 0x100000>;
> > > > +        compatible = "andestech,ax45mp-cache", "cache";
> > > > +        interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
> > > > +        cache-line-size = <64>;
> > > > +        cache-level = <2>;
> > > > +        cache-sets = <1024>;
> > > > +        cache-size = <262144>;
> > > > +        cache-unified;
> > > > +        andestech,pma-regions = <0x58000000 0x08000000
> > > > +                                 (AX45MP_PMACFG_ETYP_NAPOT | AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
> > > > +    };
> > > > diff --git a/include/dt-bindings/cache/andestech,ax45mp-cache.h b/include/dt-bindings/cache/andestech,ax45mp-cache.h
> > > > new file mode 100644
> > > > index 000000000000..aa1cad24075d
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/cache/andestech,ax45mp-cache.h
> > > > @@ -0,0 +1,38 @@
> > > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > > +/*
> > > > + * This header provides constants for Andes AX45MP PMA configuration
> > > > + *
> > > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > > + */
> > > > +
> > > > +#ifndef __DT_BINDINGS_ANDESTECH_AX45MP_CACHE_H
> > > > +#define __DT_BINDINGS_ANDESTECH_AX45MP_CACHE_H
> > > > +
> > > > +/* OFF: PMA entry is disabled */
> > > > +#define AX45MP_PMACFG_ETYP_DISABLED                  0
> > > > +/* Naturally aligned power of 2 region */
> > > > +#define AX45MP_PMACFG_ETYP_NAPOT                     3
> > > > +
> > > > +/* Device, Non-bufferable */
> > > > +#define AX45MP_PMACFG_MTYP_DEV_NON_BUF                       (0 << 2)
> > > > +/* Device, bufferable */
> > > > +#define AX45MP_PMACFG_MTYP_DEV_BUF                   (1 << 2)
> > > > +/* Memory, Non-cacheable, Non-bufferable */
> > > > +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF     (2 << 2)
> > > > +/* Memory, Non-cacheable, Bufferable */
> > > > +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF         (3 << 2)
> > >
> > > What are all these? They don't look like flags, because 3 = 1 | 2...
> > > they don't look like constants, because we do not use shifts in
> > > constants. Are these some register values? I also do not see the header
> > > being used in the code, so why having a bindings header if it is not
> > > used (DTS is not usage...)?
> > >
> > These are register bit values for the MTYP[5:2] field. The DTS example
> > in the binding doc (above) uses these macros. I haven't included the
> > DTS/I patches with this patchset yet do think I should?
>
> I think the main objection from Rob is that these look too much like
> raw register values to be written unchanged to registers, which is
> frowned upon in DT.
>
> Now, can we make this more generic?
>
>   1. Do you need AX45MP_PMACFG_ETYP_DISABLED, i.e. will it ever be
>      specified in DTS, or is this a pure software thing?
>   2. Obviously you can let the driver decide if AX45MP_PMACFG_ETYP_NAPOT
>      can be set, based on address/size?
>   3. If the two above are removed, the shifts can be handled in the
>      driver instead,
Yes we can get rid of AX45MP_PMACFG_ETYP_DISABLED and
AX45MP_PMACFG_ETYP_NAPOT. If we are setting up the PMA region it
always has to be a power of 2. So AX45MP_PMACFG_ETYP_NAPOT can be
passed either from the driver or in the OpenSBI just OR it while
setting up the PMA.


>   4. Are there existing (more generic) definitions that can be used
>      instead?
>
You mean for the MTYP flags? I haven't come across any in the kernel.

> BTW, what's the difference between non-bufferable and non-cacheable?
>
non-cacheable, from the Andes manual: Accessing to non-cacheable
memory and device will bypass I-Cache, D-Cache and L2-Cache no matter
the data is cached or not. The cache states are not changed by these
accesses.

TBH I dont have a clear answer for non-bufferable nor do we have in
the Andes HW manual. I'll get the details from Andes.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
