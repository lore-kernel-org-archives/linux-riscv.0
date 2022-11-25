Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A60C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsAsDroLJPScljvyrGSEI4s6N0mIk8yQs5RfXZt67HU=; b=hAkEH300pUAnnT
	L2KItaAtj6dOLHUeHeVL2j54Mp6H0jwtnURKYYi5OZ+0S7DEL5gEn7cxUa0Azcci5wanAM3PgWyUL
	12KdHbt2dIhvPEzU3G+0yY5Jby820k9LEyAsKEibRI29hKNcJRI5NR6YrEy1qrVc8VfV8RG1BhSdi
	+eTMnD0PehxHRYFJ3aosYH3TBQXT249ajivHbVsgTqeBjel1HBN96T6e5rcY3Mchcu9QfkQl/DNer
	JqU3kQUKgTsWNHkoAk4v0Qdsz0heJHnqwGxJyh1FQmdwWownyE33civyN8vPgN7WRasViUfhyad7l
	tCIhkJdnjQp/7l5jjVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWib-00G0bV-1V; Fri, 25 Nov 2022 11:18:05 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWiY-00G0Zb-NR
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:18:04 +0000
Received: by mail-qk1-f177.google.com with SMTP id v8so2427937qkg.12
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Zo8eiAW4zN+rDEorAgGhPKfwHubATfFtXeTA+vPKZw=;
        b=MU1pLv834v9gQdZNFm3M1zBwu/iq/kZ+HewpozwF2o3X7B8KorZraRrkedCtKLdv6Z
         7SFoVgNauKHCGBklFUIJhmp8Tje6wkqqIjbKwkm1Ls+Br0vqWKKOi5SpQAbH0QKdU37L
         9WMie/Sywz0zZBfEPed3ouFaBAzhqkBQCqGlHumrTNnRJnA1Mc7O4uC20EvkpwXERedw
         CGANsotYqRRjCExmr/JC2D15WKDn9W/Rvc6aC/DLOdPZCh2XzH0Zu+diwe+zuklEkpu8
         0VMGBfIiaA0ziHIO2FGsUvTtbXNHv/8OAJUCMCXmrtcBU6bunMM4snfRz8RpLENzy5DQ
         ByGg==
X-Gm-Message-State: ANoB5pkWc2KlQWyCRiguoSMo3/NvTtVm9ax15FcOBqpsTXkvsMOOZgwt
	+E+vAvz4F1tIdNBlxjKbQ4G+vq2rP5kQJQ==
X-Google-Smtp-Source: AA0mqf49rg7OI3BV7/XahXxro5JRQrhg0deWkfcqSxX5D6bV5ZFJzLc4OvvT77glv0B2Z2T6evwcOg==
X-Received: by 2002:a05:620a:cc7:b0:6fb:c25:fd09 with SMTP id b7-20020a05620a0cc700b006fb0c25fd09mr32582058qkj.311.1669375080404;
        Fri, 25 Nov 2022 03:18:00 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id bk17-20020a05620a1a1100b006fa9d101775sm2552148qkb.33.2022.11.25.03.17.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:17:58 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 189so4055600ybe.8
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:17:57 -0800 (PST)
X-Received: by 2002:a25:2343:0:b0:6f3:c535:4e9c with SMTP id
 j64-20020a252343000000b006f3c5354e9cmr86466ybj.380.1669375077609; Fri, 25 Nov
 2022 03:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <70d1bfde-f57f-1741-08d3-23e362793595@linaro.org> <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
In-Reply-To: <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Nov 2022 12:17:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXktJWskc8m-hL75gfkkkZnqsiuraAG+wPjWcs2JZpGKA@mail.gmail.com>
Message-ID: <CAMuHMdXktJWskc8m-hL75gfkkkZnqsiuraAG+wPjWcs2JZpGKA@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
X-CRM114-CacheID: sfid-20221125_031802_782627_CFD37EAF 
X-CRM114-Status: GOOD (  38.68  )
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

, Hi Prabhakar,

On Fri, Nov 25, 2022 at 11:34 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Nov 25, 2022 at 8:16 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 24/11/2022 18:22, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > >
> > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > describes the L2 cache block.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > RFC v3 -> v4
> > > * Dropped l2 cache configuration parameters
> > > * s/larger/large
> > > * Added minItems/maxItems for andestech,pma-regions

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml

> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/cache/andestech,ax45mp-cache.h>
> > > +
> > > +    cache-controller@2010000 {
> > > +        reg = <0x13400000 0x100000>;
> > > +        compatible = "andestech,ax45mp-cache", "cache";
> > > +        interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
> > > +        cache-line-size = <64>;
> > > +        cache-level = <2>;
> > > +        cache-sets = <1024>;
> > > +        cache-size = <262144>;
> > > +        cache-unified;
> > > +        andestech,pma-regions = <0x58000000 0x08000000
> > > +                                 (AX45MP_PMACFG_ETYP_NAPOT | AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
> > > +    };
> > > diff --git a/include/dt-bindings/cache/andestech,ax45mp-cache.h b/include/dt-bindings/cache/andestech,ax45mp-cache.h
> > > new file mode 100644
> > > index 000000000000..aa1cad24075d
> > > --- /dev/null
> > > +++ b/include/dt-bindings/cache/andestech,ax45mp-cache.h
> > > @@ -0,0 +1,38 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +/*
> > > + * This header provides constants for Andes AX45MP PMA configuration
> > > + *
> > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_ANDESTECH_AX45MP_CACHE_H
> > > +#define __DT_BINDINGS_ANDESTECH_AX45MP_CACHE_H
> > > +
> > > +/* OFF: PMA entry is disabled */
> > > +#define AX45MP_PMACFG_ETYP_DISABLED                  0
> > > +/* Naturally aligned power of 2 region */
> > > +#define AX45MP_PMACFG_ETYP_NAPOT                     3
> > > +
> > > +/* Device, Non-bufferable */
> > > +#define AX45MP_PMACFG_MTYP_DEV_NON_BUF                       (0 << 2)
> > > +/* Device, bufferable */
> > > +#define AX45MP_PMACFG_MTYP_DEV_BUF                   (1 << 2)
> > > +/* Memory, Non-cacheable, Non-bufferable */
> > > +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF     (2 << 2)
> > > +/* Memory, Non-cacheable, Bufferable */
> > > +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF         (3 << 2)
> >
> > What are all these? They don't look like flags, because 3 = 1 | 2...
> > they don't look like constants, because we do not use shifts in
> > constants. Are these some register values? I also do not see the header
> > being used in the code, so why having a bindings header if it is not
> > used (DTS is not usage...)?
> >
> These are register bit values for the MTYP[5:2] field. The DTS example
> in the binding doc (above) uses these macros. I haven't included the
> DTS/I patches with this patchset yet do think I should?

I think the main objection from Rob is that these look too much like
raw register values to be written unchanged to registers, which is
frowned upon in DT.

Now, can we make this more generic?

  1. Do you need AX45MP_PMACFG_ETYP_DISABLED, i.e. will it ever be
     specified in DTS, or is this a pure software thing?
  2. Obviously you can let the driver decide if AX45MP_PMACFG_ETYP_NAPOT
     can be set, based on address/size?
  3. If the two above are removed, the shifts can be handled in the
     driver instead,
  4. Are there existing (more generic) definitions that can be used
     instead?

BTW, what's the difference between non-bufferable and non-cacheable?

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
