Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813E4C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQQjV7cfkDPDUeBvlZX9r46SvQe0pzIsIZqgfXgQKVY=; b=iOvqElwWYMJtzQ
	q2LWNxikpCSdR9AQQO3m+VK/bvIMkuRrHNmz8cDLTJefILrZszIi/WvuxbYwCRRxw+PEs2V6KqdrP
	am1fOZsmk0Uc8opvP/QSf5z9nJOiSPOyyWM7Jk/1Q9PtSlirnI9OESE1hrBCwzl4KsqQz0EiNO1Kk
	ZmCyTzPXhpbzmnpk5RCZ1nreuRN+N6bR9fZitTbkddB2v0uUaE5rhrmDmVB+Au66ynPj6wtEFHmv/
	OVUcMXO61E+/blzVtjO2J5SiFkXCoWbLg/r+QYzTTFtq5S+6A7LREHY+p3TVHXOLAR4jDV9uVtwcN
	0oN6Mx8nV/2SlQbb8bwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5sKB-00AfIm-QR; Thu, 15 Dec 2022 17:47:15 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5sK8-00AfEm-7Z
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:47:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id x22so275648ejs.11
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JGmgZEJwFGxq+tUJYcXII0yBmtBtW32bwyy/70MdbiY=;
        b=YOKNh+N1K5reV2/yMC6/eEnoXA9e6b9OgVDEXlpOrSbPbyepO1oL6L/45xFN+iNcOQ
         TTi0gzamLrcbQqkbJnrNUXD+kRoEtCiJKIu8ggiMfz9J2dNjSTBjtSDuB6hPUpng/CEZ
         F7xAld01tAikhNvW3MuNYhf9DrVEOOoJpGQ61tvqryod7tg3DDYEOni2a+EajvIAqTx/
         Pwx5kE6SOP3s3VZ1f2EMBUhx5BU3EbfaCxnPUhsh/ofoG1eQK4hiSCk9nbQV2YbspWNX
         DBSRTagf8xzNGNC3IuaKbncnc35lIjcUrwmVFz8qFA0ok2ius5Jv36EHAIOk8zIwfnMw
         jeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGmgZEJwFGxq+tUJYcXII0yBmtBtW32bwyy/70MdbiY=;
        b=c7gjgPKcfZ9kGaezBI74sQMCVz5uUOgzrjHOdeZmFMg8nPkyhgG4XeOT7MyCgVa1PJ
         vqqt/tRO3E8p5w7IanmyONoZR1b7XTO6cjn1b5uQ1KduajHRdhJCnhPKtpx2d0rowoQH
         LX+rZ8opyuCw8gbonF2fV99P8jD54OdMXvFsWNEZK87Wt5ehuoVJIKNIbzCR638MIOBh
         9iqJT2L1TxKka0Kd7bWohY++RFt4Z/lqcvGe8ooySUDH6vmK1dDOAudqUZV8YCcKol/m
         dOY0zLfLwkls9VPWmmKKgS7H7aJZ387a6E7DazIZKIFgLvjukPZlFrbvRUUOsGwPkAj8
         gkEg==
X-Gm-Message-State: ANoB5pnyDOIoBm7GU2nwGOEkl4HocdPP7Muu5G7IJbhequGpkKM6hfV3
	lHnjbo5XyW+Yc83zu7LJj7DBcYAWTTWJckOsVsw=
X-Google-Smtp-Source: AA0mqf7zOOrpIm6ljuWR+UTfR7djRoUjzyIcU1ELgsZnq2JH4S9ddusWL3TvOqNxvdRw1SO4g2Txe60hnnWLZ30C1jg=
X-Received: by 2002:a17:906:9615:b0:7c0:f459:a0e4 with SMTP id
 s21-20020a170906961500b007c0f459a0e4mr15336359ejx.155.1671126428687; Thu, 15
 Dec 2022 09:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com>
 <CA+V-a8vD=SOb6gPOwdPUE=kHeqa+oo2L-rbaW8zGjvw7YyQsqg@mail.gmail.com> <CAMuHMdWX4Yd52=Jv8kABtn+1B1V=dC2iXVZ81gNZBWNu4hb_3w@mail.gmail.com>
In-Reply-To: <CAMuHMdWX4Yd52=Jv8kABtn+1B1V=dC2iXVZ81gNZBWNu4hb_3w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Dec 2022 17:46:42 +0000
Message-ID: <CA+V-a8t3+zzQ4yPftsAa51rkMGHr45NhMO4_2WmZ9BGg0wuQvw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
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
X-CRM114-CacheID: sfid-20221215_094712_338020_2DC856FD 
X-CRM114-Status: GOOD (  29.11  )
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

On Thu, Dec 15, 2022 at 11:10 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Dec 15, 2022 at 12:06 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Dec 15, 2022 at 10:36 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Dec 12, 2022 at 12:58 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > > > external non-caching masters, such as DMA controllers. The accesses
> > > > from IOCP are coherent with D-Caches and L2 Cache.
> > > >
> > > > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > > > SoC due to this reason IP blocks using DMA will fail.
> > > >
> > > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > > It contains a configurable amount of PMA entries implemented as CSR
> > > > registers to control the attributes of memory locations in interest.
> > > > Below are the memory attributes supported:
> > > > * Device, Non-bufferable
> > > > * Device, bufferable
> > > > * Memory, Non-cacheable, Non-bufferable
> > > > * Memory, Non-cacheable, Bufferable
> > > > * Memory, Write-back, No-allocate
> > > > * Memory, Write-back, Read-allocate
> > > > * Memory, Write-back, Write-allocate
> > > > * Memory, Write-back, Read and Write-allocate
> > > >
> > > > More info about PMA (section 10.3):
> > > > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > > >
> > > > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > > > software. Firstly OpenSBI configures the memory region as
> > > > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > > > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > > > allocations happen from this region and synchronization callbacks are
> > > > implemented to synchronize when doing DMA transactions.
> > > >
> > > > Example PMA region passes as a DT node from OpenSBI:
> > > >     reserved-memory {
> > > >         #address-cells = <2>;
> > > >         #size-cells = <2>;
> > > >         ranges;
> > > >
> > > >         pma_resv0@58000000 {
> > > >             compatible = "shared-dma-pool";
> > > >             reg = <0x0 0x58000000 0x0 0x08000000>;
> > > >             no-map;
> > > >             linux,dma-default;
> > > >         };
> > > >     };
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > >  arch/riscv/include/asm/cacheflush.h       |   8 +
> > > >  arch/riscv/include/asm/errata_list.h      |  28 ++-
> > > >  drivers/soc/renesas/Kconfig               |   6 +
> > > >  drivers/soc/renesas/Makefile              |   2 +
> > > >  drivers/soc/renesas/rzfive/Kconfig        |   6 +
> > > >  drivers/soc/renesas/rzfive/Makefile       |   3 +
> > > >  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++
> > >
> > > Given this touches arch/riscv/include/asm/, I don't think the
> > > code belongs under drivers/soc/renesas/.
> > >
> > Ok. Do you have any suggestions on where you want me to put this code?
>
> As it plugs into core riscv functionality, I think it should be under
> arch/riscv/.
> if the RISC-V maintainers object to that, another option is
> drivers/soc/andestech/ or (new) drivers/cache/
>
RISC-V maintainers had already made it clear to not to include vendor
specific stuff in the arch/riscv folder, so I'll consider putting this
into drivers/cache/ folder to sync with the bindings.

Conor/Palmer - do you have any objections/suggestions?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
