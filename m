Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B129C00145
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AD1EXMN32mPd/nRcnDr7uvsAnpndmlMednsk0c/wHXQ=; b=cK1zR0lWOyG66o
	r8hhdEc9Rb44H77fK9J2xmxrBr1ZFSpP5GfEAsR7NTQE4iIvsus7zkoSDvyu+IrdXKmLPT0qE1ZPM
	2puMhlyLwOsI+aZzcTXfrVbmRZcuwXAqB9GWn4d27+d06rAU6WIwtjda3E67ND+/T/KvjlqlDYVyO
	x8ZH9iN+GGFlCtuX7ULkuo1zwBngFVdZ2yruOL53RSG1HLCDN/c+tzhSXQEu8j2Ta7kstZ8DLfwgl
	rWfEBotXaQZrCGT3kYKbMOc+ANrnIOP14q5AYUES08I7oi6Wy83QaXTpg3QhanKHUyyPZs2520Ewh
	blTh9ZZ5Fs+celdZwPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5la1-008nRG-Mn; Thu, 15 Dec 2022 10:35:09 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5lZy-008nPo-Dr
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 10:35:08 +0000
Received: by mail-qv1-f51.google.com with SMTP id s14so1620271qvo.11
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 02:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXs1XYWr/pP458PMqmcZ7/vhvq2oQvHQUyPM29QzkCE=;
        b=JBw1fq9qup/qKwUuZsxImXXA7ZXXDlvTeZ7pt4YL8794pY8NnE9ED6ebAoWkq+6jaH
         Oe4GBz/A+zVzOqFT8xneG7CuH5aQykRu6XmU9TR9IkGKHTjugLWBaQRFMP01Z3oz3pyt
         7e8m3sMDguR4dEOTLXSSULtq9ta1MlP+dfyPclS4IjIPe35qK6zlBp6ae9LUD6moBh/R
         Xk+MFKidtJEJ3gz0dbiA/QuBNkOhD/C9zGCnSv0MxH733qBQcAYmvg2YMIRDSGcmxUsc
         4iL4QDKad/CUzKT18EujEg2XUAEKMq/bCQJqJXvhlMg6UM4nTXGVhENAN4Tf/4AhCh8a
         k9kg==
X-Gm-Message-State: ANoB5pn40PpBpaOhAUbU07NFz1NpKFnlup90jcnccTSkIu6KeJkx4AOq
	Sgf9q7FEWVVB8nxk34gJMsyXpdHRD1oWGw==
X-Google-Smtp-Source: AA0mqf5Bbfs7tHOWnYptKgaC3A6vYUxDniFGybb8W6KF6nhOBzlpWFwM8PXPpDB9r4PZlK1qozBA2g==
X-Received: by 2002:a0c:e34f:0:b0:4c7:1a90:2297 with SMTP id a15-20020a0ce34f000000b004c71a902297mr40926706qvm.41.1671100503574;
        Thu, 15 Dec 2022 02:35:03 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id h19-20020a05620a13f300b006fcab4da037sm11487840qkl.39.2022.12.15.02.35.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 02:35:02 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id o127so2972748yba.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 02:35:01 -0800 (PST)
X-Received: by 2002:a25:7104:0:b0:702:90b4:2e24 with SMTP id
 m4-20020a257104000000b0070290b42e24mr13843656ybc.365.1671100501623; Thu, 15
 Dec 2022 02:35:01 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2022 11:34:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com>
Message-ID: <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_023506_491060_B4E2DF4E 
X-CRM114-Status: GOOD (  25.33  )
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

On Mon, Dec 12, 2022 at 12:58 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
>
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC due to this reason IP blocks using DMA will fail.
>
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
>
> More info about PMA (section 10.3):
> Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>
> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> software. Firstly OpenSBI configures the memory region as
> "Memory, Non-cacheable, Bufferable" and passes this region as a global
> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> allocations happen from this region and synchronization callbacks are
> implemented to synchronize when doing DMA transactions.
>
> Example PMA region passes as a DT node from OpenSBI:
>     reserved-memory {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         ranges;
>
>         pma_resv0@58000000 {
>             compatible = "shared-dma-pool";
>             reg = <0x0 0x58000000 0x0 0x08000000>;
>             no-map;
>             linux,dma-default;
>         };
>     };
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

>  arch/riscv/include/asm/cacheflush.h       |   8 +
>  arch/riscv/include/asm/errata_list.h      |  28 ++-
>  drivers/soc/renesas/Kconfig               |   6 +
>  drivers/soc/renesas/Makefile              |   2 +
>  drivers/soc/renesas/rzfive/Kconfig        |   6 +
>  drivers/soc/renesas/rzfive/Makefile       |   3 +
>  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++

Given this touches arch/riscv/include/asm/, I don't think the
code belongs under drivers/soc/renesas/.

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
