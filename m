Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DECC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxLGmkDO9I4Pu5+3f8j5ayzqOPzJfc1PkK0MxlUOq54=; b=QRzI20y/k52Q9K
	XfEwCNf4Buawap9zy06E+Lrt4mUrEEf2AMhYg7MvcafSJkoht3GjfixccHBVAjDnKFbuDLwpkcG8I
	Mnwf93xf4WRG1DJlCFzqDIaMvrF7aSSGZIlmKczjlMfDBYBhsFxP7D6/JVkeYSfsifAJoyw3+pILu
	cKsWn9qpMRpcuYiHnAtXj4eAp4dwVFE5uKaywNQsKNZEBbf62yzm6OevgTSZDRNRISxJPSnr1NTIE
	405Yzg6K0xvVMSbo/W/cy+zNRRLUNOm62euPaoZgxxe5j/aK+0bP+JFnssp8nuGdzWGSWA+BFgyGS
	fX6U6p370JqA/Dlbgf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ug2-00BCxp-MX; Thu, 15 Dec 2022 20:17:58 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ufy-00BCx6-Ll
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 20:17:56 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3b56782b3f6so4926177b3.13
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 12:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFcVrVAqulMBWI2FmRENAbk4zXBaJf2e4v4n13B3Zg0=;
        b=hXD+kaCT7rPVVaCJ64vwPUXp0Tia0pVR8DDPyXnZjHHH/T2Z47eu6kva/RL6IhDUZP
         uzASPYh4iEzpAFA7pVcC7km9upX947c952jCRzq+GqGL3xToLmhFZnFofG5wVQL4aJkg
         Pbt+FMSBOJgvcYOPX9gCQq95RzRE7TxHtWA0etgLUgYncPK4uj4cudWMg2hwQjnwP0nf
         F6v1zo0ut3fgNH9/uoyZ2+B3cBidufydrTAF5+DAeGlV4ZzlWqMJ9YcLBQ0+9worxCKw
         bOTM5JMheyoo8z8VBXFMjdLsyUOn1mtx5fD8CHS/L3iU2ficT00LJs2YJJoy2NlQ1VJ6
         nCgg==
X-Gm-Message-State: ANoB5pli+GspN1861+p44V0tbaoL/51zXtjK9ckg9UNK3VRTWTaBCSsi
	75cCiusw/BqMOS+9EV3pUxFc2Y5nIu1TYA==
X-Google-Smtp-Source: AA0mqf6z5w0yj5g4bgZ47tBcAMJ5dgjzVt6KWMwXDfRWUly6OTOLZ0UuULMcnwdjlsBcuAASLrEtmg==
X-Received: by 2002:a05:7500:3748:b0:ea:ad51:1494 with SMTP id gx8-20020a057500374800b000eaad511494mr3711635gab.24.1671135471206;
        Thu, 15 Dec 2022 12:17:51 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id v5-20020a05620a440500b006f474e6a715sm12883470qkp.131.2022.12.15.12.17.49
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 12:17:50 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-40b40ff39f1so5096217b3.10
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 12:17:49 -0800 (PST)
X-Received: by 2002:a81:4e09:0:b0:370:202b:f085 with SMTP id
 c9-20020a814e09000000b00370202bf085mr27077203ywb.502.1671135469671; Thu, 15
 Dec 2022 12:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com>
 <CA+V-a8vD=SOb6gPOwdPUE=kHeqa+oo2L-rbaW8zGjvw7YyQsqg@mail.gmail.com>
 <CAMuHMdWX4Yd52=Jv8kABtn+1B1V=dC2iXVZ81gNZBWNu4hb_3w@mail.gmail.com>
 <CA+V-a8t3+zzQ4yPftsAa51rkMGHr45NhMO4_2WmZ9BGg0wuQvw@mail.gmail.com> <Y5t7a2oZ64McjSSn@dizzy>
In-Reply-To: <Y5t7a2oZ64McjSSn@dizzy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2022 21:17:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUO7iFvh73u+m=EXYyxyePXHahJ=OVwQHdt0ap4vWDG4A@mail.gmail.com>
Message-ID: <CAMuHMdUO7iFvh73u+m=EXYyxyePXHahJ=OVwQHdt0ap4vWDG4A@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, palmer@dabbelt.com, 
	Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_121754_738064_A61631EB 
X-CRM114-Status: GOOD (  48.75  )
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

Hi Conor,

On Thu, Dec 15, 2022 at 8:54 PM Conor Dooley <conor@kernel.org> wrote:
> On Thu, Dec 15, 2022 at 05:46:42PM +0000, Lad, Prabhakar wrote:
> > On Thu, Dec 15, 2022 at 11:10 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Thu, Dec 15, 2022 at 12:06 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Thu, Dec 15, 2022 at 10:36 AM Geert Uytterhoeven
> > > > <geert@linux-m68k.org> wrote:
> > > > > On Mon, Dec 12, 2022 at 12:58 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > > > > > external non-caching masters, such as DMA controllers. The accesses
> > > > > > from IOCP are coherent with D-Caches and L2 Cache.
> > > > > >
> > > > > > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > > > > > SoC due to this reason IP blocks using DMA will fail.
> > > > > >
> > > > > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > > > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > > > > It contains a configurable amount of PMA entries implemented as CSR
> > > > > > registers to control the attributes of memory locations in interest.
> > > > > > Below are the memory attributes supported:
> > > > > > * Device, Non-bufferable
> > > > > > * Device, bufferable
> > > > > > * Memory, Non-cacheable, Non-bufferable
> > > > > > * Memory, Non-cacheable, Bufferable
> > > > > > * Memory, Write-back, No-allocate
> > > > > > * Memory, Write-back, Read-allocate
> > > > > > * Memory, Write-back, Write-allocate
> > > > > > * Memory, Write-back, Read and Write-allocate
> > > > > >
> > > > > > More info about PMA (section 10.3):
> > > > > > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > > > > >
> > > > > > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > > > > > software. Firstly OpenSBI configures the memory region as
> > > > > > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > > > > > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > > > > > allocations happen from this region and synchronization callbacks are
> > > > > > implemented to synchronize when doing DMA transactions.
> > > > > >
> > > > > > Example PMA region passes as a DT node from OpenSBI:
> > > > > >     reserved-memory {
> > > > > >         #address-cells = <2>;
> > > > > >         #size-cells = <2>;
> > > > > >         ranges;
> > > > > >
> > > > > >         pma_resv0@58000000 {
> > > > > >             compatible = "shared-dma-pool";
> > > > > >             reg = <0x0 0x58000000 0x0 0x08000000>;
> > > > > >             no-map;
> > > > > >             linux,dma-default;
> > > > > >         };
> > > > > >     };
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > >  arch/riscv/include/asm/cacheflush.h       |   8 +
> > > > > >  arch/riscv/include/asm/errata_list.h      |  28 ++-
> > > > > >  drivers/soc/renesas/Kconfig               |   6 +
> > > > > >  drivers/soc/renesas/Makefile              |   2 +
> > > > > >  drivers/soc/renesas/rzfive/Kconfig        |   6 +
> > > > > >  drivers/soc/renesas/rzfive/Makefile       |   3 +
> > > > > >  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++
> > > > >
> > > > > Given this touches arch/riscv/include/asm/, I don't think the
> > > > > code belongs under drivers/soc/renesas/.
> > > > >
> > > > Ok. Do you have any suggestions on where you want me to put this code?
> > >
> > > As it plugs into core riscv functionality, I think it should be under
> > > arch/riscv/.
> > > if the RISC-V maintainers object to that, another option is
> > > drivers/soc/andestech/ or (new) drivers/cache/
> > >
> > RISC-V maintainers had already made it clear to not to include vendor
> > specific stuff in the arch/riscv folder, so I'll consider putting this
> > into drivers/cache/ folder to sync with the bindings.
> >
> > Conor/Palmer - do you have any objections/suggestions?
>
> I'm not its maintainer so sorta moot what I say, but having drivers in
> arch/riscv makes little sense to me..
> Putting stuff in drivers/cache does sound like a good idea since the
> binding is going there too.
>
> The SiFive ccache driver is in drivers/soc and it was suggested to me
> this week that there's likely going to be a second SiFive cache driver
> at some point in the near future. Plus Microchip are going to have to
> add cache management stuff to the existing SiFive ccache driver.
> Having them be their own thing makes sense in my mind - especially since
> they're not tied to SoCs sold by Andes or SiFive.
>
> I had a quick, and I mean *quick* look through other soc drivers to see
> if there were any other cache controller drivers but nothing stood out
> to me. Maybe someone else has more of a clue there. Ditto for misc, had
> a look but nothing seemed obvious.

Usually they're under arch/:
$ git ls-files -- "arch/*cache*" | wc -l
148
$ git ls-files -- "drivers/*cache*" | wc -l
63

E.g. arch/arm/mm/cache-l2x0.c.

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
