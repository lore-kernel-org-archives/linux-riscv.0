Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8667FC38A2D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 22:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/gaIcm9zm5mR6tTT9bMZeLi7vdu89JI0p/GVyVlby4=; b=nYY2wKCPj7UKMN
	e4Ye3UBjMCpOKn+G3HxPsljGIkyF/60S8LZ0zXruoqxJV4kxfO2DsHa20HaZMhIuoqL/HTdEQFyqq
	MH1T/8vLehR+Y298NKq1G2Jzw75UAtGz0vxSICb1R5/M1p5flEcz4zebkRjIhaw466Ff52m1owWZY
	u8GXq0U+ZSiH6wPY6QbyTuG54hkZeJB9iGl4+GSMylE5HgFmBcjAHmFimiTNmHVWSJeDk8LeOUadF
	Z3/pFhHghiNkfjdQ4JVym+50jNjg7DDWq7pQctPKmKu9KDdBMj6/MLt0kWrWb5BjZTaEcPYSiBILj
	vzIXYQ9bCLsoEXKu+VGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0Yo-00ADZn-AD; Fri, 21 Oct 2022 22:32:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0Yl-00ADYd-LA
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 22:32:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2CFF61F6A;
	Fri, 21 Oct 2022 22:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22F8C433C1;
	Fri, 21 Oct 2022 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666391528;
	bh=Mgf709eKeuqcdRrSCZHgWGV8BbLp66Y1l9AWxFpPvgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCwSnjMch7C/z9MnbyBUqv4MGDb0CGXLFLUnOzN9zOwyFNSn5xAEHvmtZbugfAD3K
	 MnVoInBcRY0B1MurhdV/8rour87p3xV70bBkQxj1f3ALhtRY4Iv6aJZc3I+DGhuik8
	 w+pkaWYbDK5auKNiGuGvd/6F7XKxy58T153L8tTEag95KKkd+edyTgM/JQimsuaKaH
	 6EzDT+HvtoiywH/BpZOEW3DhWSNgn9pla4zxsGlBof7EIbYEOzE0lOeNizm4zRX4YM
	 MrKWDYLTifYnPMh/UqpEjqSmHEmDvAM/U4hTqCubS3l+1tJR04ZY3wUs0hu867wrfb
	 Ic2EGRuWRrUbA==
Date: Fri, 21 Oct 2022 23:32:01 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
Message-ID: <Y1Md4bMYJHI34HuJ@spud>
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221021020500.GA2157489-robh@kernel.org>
 <CA+V-a8v0jEFj+XKAtyAaTBFmX3bObBZgGd6n1LB3OnTU_W002w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8v0jEFj+XKAtyAaTBFmX3bObBZgGd6n1LB3OnTU_W002w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_153211_796954_9E109E2F 
X-CRM114-Status: GOOD (  42.07  )
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

On Fri, Oct 21, 2022 at 11:05:40PM +0100, Lad, Prabhakar wrote:
> Hi Rob,
> 
> Thank you for the review.
> 
> On Fri, Oct 21, 2022 at 3:05 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Oct 19, 2022 at 11:02:42PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > On the AX45MP core, cache coherency is a specification option so it may
> > > not be supported. In this case DMA will fail. As a workaround, firstly we
> > > allocate a global dma coherent pool from which DMA allocations are taken
> > > and marked as non-cacheable + bufferable using the PMA region as specified
> > > in the device tree. Synchronization callbacks are implemented to
> > > synchronize when doing DMA transactions.
> > >
> > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > It contains a configurable amount of PMA entries implemented as CSR
> > > registers to control the attributes of memory locations in interest.
> > >
> > > Below are the memory attributes supported:
> > > * Device, Non-bufferable
> > > * Device, bufferable
> > > * Memory, Non-cacheable, Non-bufferable
> > > * Memory, Non-cacheable, Bufferable
> > > * Memory, Write-back, No-allocate
> > > * Memory, Write-back, Read-allocate
> > > * Memory, Write-back, Write-allocate
> > > * Memory, Write-back, Read and Write-allocate
> > >
> > > This patch adds support to configure the memory attributes of the memory
> > > regions as passed from the l2 cache node and exposes the cache management
> > > ops.
> > >
> > > More info about PMA (section 10.3):
> > > http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > >
> > > This feature is based on the work posted [0] by Vincent Chen
> > > <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
> > >
> > > [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  arch/riscv/include/asm/cacheflush.h    |   8 +
> > >  arch/riscv/include/asm/errata_list.h   |   2 +
> > >  arch/riscv/mm/dma-noncoherent.c        |  20 ++
> > >  drivers/soc/renesas/Kconfig            |   5 +
> > >  drivers/soc/renesas/Makefile           |   4 +
> > >  drivers/soc/renesas/rzf/Kconfig        |   6 +
> > >  drivers/soc/renesas/rzf/Makefile       |   3 +
> > >  drivers/soc/renesas/rzf/ax45mp_cache.c | 431 +++++++++++++++++++++++++
> >
> > How many cache drivers do we have around now? I've seen a few bindings
> > go by. I'm guessing it is time to stop putting the drivers in the
> > drivers/soc/ dumping ground.
> >
> The main reason this driver is not in arch/riscv is that it has vendor
> specific extensions. Due to this reason it was agreed during the LPC
> that vendor specific extension should be maintained by SoC vendors and
> was agreed that this can go into drivers/soc/renesas folder instead.

Does not in drivers/soc mean they need to go into arch/riscv?
The outcome of the chat at the LPC BoF was more that the cache drivers
themselves should not be be routed via the arch maintainers, no?

> 
> > >  drivers/soc/renesas/rzf/ax45mp_sbi.h   |  29 ++
> > >  9 files changed, 508 insertions(+)
> > >  create mode 100644 drivers/soc/renesas/rzf/Kconfig
> > >  create mode 100644 drivers/soc/renesas/rzf/Makefile
> > >  create mode 100644 drivers/soc/renesas/rzf/ax45mp_cache.c
> > >  create mode 100644 drivers/soc/renesas/rzf/ax45mp_sbi.h
> > >
> > > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > > index 8a5c246b0a21..40aa790be9a3 100644
> > > --- a/arch/riscv/include/asm/cacheflush.h
> > > +++ b/arch/riscv/include/asm/cacheflush.h
> > > @@ -65,6 +65,14 @@ static inline void riscv_noncoherent_supported(void) {}
> > >  #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1UL
> > >  #define SYS_RISCV_FLUSH_ICACHE_ALL   (SYS_RISCV_FLUSH_ICACHE_LOCAL)
> > >
> > > +#ifdef CONFIG_AX45MP_L2_CACHE
> > > +void ax45mp_cpu_dma_inval_range(void *vaddr, size_t end);
> > > +void ax45mp_cpu_dma_wb_range(void *vaddr, size_t end);
> > > +
> > > +#define ALT_CMO_OP(_op, _start, _size, _cachesize)   \
> > > +                _op(_start, _size)
> > > +#endif
> > > +
> > >  #include <asm-generic/cacheflush.h>
> > >
> > >  #endif /* _ASM_RISCV_CACHEFLUSH_H */
> > > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > > index 19a771085781..d9cbf60c3b65 100644
> > > --- a/arch/riscv/include/asm/errata_list.h
> > > +++ b/arch/riscv/include/asm/errata_list.h
> > > @@ -89,6 +89,7 @@ asm volatile(ALTERNATIVE(                                           \
> > >  #define ALT_THEAD_PMA(_val)
> > >  #endif
> > >
> > > +#ifdef CONFIG_ERRATA_THEAD_CMO
> > >  /*
> > >   * dcache.ipa rs1 (invalidate, physical address)
> > >   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > > @@ -143,5 +144,6 @@ asm volatile(ALTERNATIVE_2(                                               \
> > >       : "a0")
> > >
> > >  #endif /* __ASSEMBLY__ */
> > > +#endif
> > >
> > >  #endif
> > > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > > index b0add983530a..5270acca6766 100644
> > > --- a/arch/riscv/mm/dma-noncoherent.c
> > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > @@ -24,13 +24,25 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > >
> > >       switch (dir) {
> > >       case DMA_TO_DEVICE:
> > > +#ifdef CONFIG_ERRATA_THEAD_CMO
> > >               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> > > +#elif CONFIG_AX45MP_L2_CACHE
> > > +             ALT_CMO_OP(ax45mp_cpu_dma_wb_range, vaddr, size, 0x0);
> > > +#endif
> >
> > How do you support more than one platform in a build?
> >
> Yes, that's one concern which I have mentioned in the cover letter too
> (At that moment it's just a single platform). Suggestions welcome!

I think I said it on one of the earlier version, but it needs to be
implemented w/ runtime patching via alternatives just like the thead
stuff patches in their functions.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
