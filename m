Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9764ACCA47C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P46TjJMqfukYc8cCpeRx1ibn7IBlprje3kbH3y0sfGI=; b=aZQ+0olUPriX3n
	da2d3LGMMGebfmNiJ06gmRTZfw3EcYd+mI7fIcj0PNZ++qJiTDpftoBmCqnl/0m6q/fO+1BaOWman
	F3Kgtj5d5iiGHX34a5WouCCTqLCWEkYAzhWQRtzHgmBPQzNKfionJ1SARGO8IVwNsJ/ELVPXdIb98
	+zk0+pj7nRUfP5G6vmzYEHm7G9/DgRUhUG0It+9nacxZtuZii7jNVBhwxiVyDo5/hqPb9JNxGWQCU
	OJ8YTzYQcAz6OyifMwrrWiocqgEVE1vo5STT66gWtCy6lbkFEEnKyPOIFAC1cx3d6otKCUdLss1Ys
	jdh+xKbVrh/7ncFSmYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9E2k-00Cg9z-Cz; Wed, 06 Jul 2022 23:02:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9E2g-00Cg8J-V8
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 23:02:48 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o9E2X-0002uT-8c; Thu, 07 Jul 2022 01:02:37 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, Samuel Holland <samuel@sholland.org>, Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, devicetree <devicetree@vger.kernel.org>, Drew Fustini <drew@beagleboard.org>, Randy Dunlap <rdunlap@infradead.org>, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v6 3/4] riscv: Add support for non-coherent devices using zicbom extension
Date: Thu, 07 Jul 2022 01:02:36 +0200
Message-ID: <3111003.5fSG56mABF@diego>
In-Reply-To: <CAJF2gTT6DzPihaP+BHLM6Wvn=Hba-jb-bhs96U3+ApdSmT593g@mail.gmail.com>
References: <20220705224703.1571895-1-heiko@sntech.de> <20220705224703.1571895-4-heiko@sntech.de> <CAJF2gTT6DzPihaP+BHLM6Wvn=Hba-jb-bhs96U3+ApdSmT593g@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_160247_057928_6DC6D118 
X-CRM114-Status: GOOD (  27.10  )
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

Hi Guo,

Am Mittwoch, 6. Juli 2022, 01:32:12 CEST schrieb Guo Ren:
> On Wed, Jul 6, 2022 at 6:47 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > The Zicbom ISA-extension was ratified in november 2021
> > and introduces instructions for dcache invalidate, clean
> > and flush operations.
> >
> > Implement cache management operations for non-coherent devices
> > based on them.
> >
> > Of course not all cores will support this, so implement an
> > alternative-based mechanism that replaces empty instructions
> > with ones done around Zicbom instructions.
> >
> > As discussed in previous versions, assume the platform
> > being coherent by default so that non-coherent devices need
> > to get marked accordingly by firmware.
> >
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Guo Ren <guoren@kernel.org>
> > Cc: Anup Patel <anup@brainfault.org>
> > ---
> >  arch/riscv/Kconfig                   |  31 ++++++++
> >  arch/riscv/Makefile                  |   4 +
> >  arch/riscv/include/asm/cache.h       |   4 +
> >  arch/riscv/include/asm/cacheflush.h  |  10 +++
> >  arch/riscv/include/asm/errata_list.h |  19 ++++-
> >  arch/riscv/include/asm/hwcap.h       |   1 +
> >  arch/riscv/kernel/cpu.c              |   1 +
> >  arch/riscv/kernel/cpufeature.c       |  24 ++++++
> >  arch/riscv/kernel/setup.c            |   2 +
> >  arch/riscv/mm/Makefile               |   1 +
> >  arch/riscv/mm/dma-noncoherent.c      | 112 +++++++++++++++++++++++++++
> >  11 files changed, 208 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/mm/dma-noncoherent.c
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 32ffef9f6e5b..f7b2b3a4b7f1 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -113,6 +113,7 @@ config RISCV
> >         select MODULES_USE_ELF_RELA if MODULES
> >         select MODULE_SECTIONS if MODULES
> >         select OF
> > +       select OF_DMA_DEFAULT_COHERENT
> >         select OF_EARLY_FLATTREE
> >         select OF_IRQ
> >         select PCI_DOMAINS_GENERIC if PCI
> > @@ -218,6 +219,14 @@ config PGTABLE_LEVELS
> >  config LOCKDEP_SUPPORT
> >         def_bool y
> >
> > +config RISCV_DMA_NONCOHERENT
> > +       bool
> > +       select ARCH_HAS_DMA_PREP_COHERENT
> > +       select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> > +       select ARCH_HAS_SYNC_DMA_FOR_CPU
> > +       select ARCH_HAS_SETUP_DMA_OPS
> > +       select DMA_DIRECT_REMAP
> > +
> >  source "arch/riscv/Kconfig.socs"
> >  source "arch/riscv/Kconfig.erratas"
> >
> > @@ -376,6 +385,28 @@ config RISCV_ISA_SVPBMT
> >
> >            If you don't know what to do here, say Y.
> >
> > +config CC_HAS_ZICBOM
> > +       bool
> > +       default y if 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
> > +       default y if 32BIT && $(cc-option,-mabi=lp64 -march=rv32ima_zicbom)
>
> -mabi=lp64 for rv32?

Thanks for catching that! :-) 

When I converted over to using the real instructions for Zicbom instead of
pre-coded ones, I used a different format first for detecting the Zicbom
existence and I guess when moving over to the above I made a mistake
in the conversion.

In any case, that should of course be ilp32, same as in the Makefile.
With updated opensbi and Qemu I have now re-tested all possible
combinations and am pretty hopefully that this should fit now.

v7 following shortly.

Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
