Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028DAC38A2D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzhyWeXAGJ0SXy/tDblpyIdMoxhCQnA27ns6RlDqMh4=; b=UMhVvmaYPX/F9O
	h1CSHmo8mnqj3CIYJJ3oQ9DyhQkS/ZnL0boWwomOfDqxMLXo4oEjkMtKnIzQqsw6i10ERr0W/RR0N
	tsqrLz6DG+LzrSVNqZ27Pd0BRVCfEtPbTUKnThF96HjDz3imB2TRSzBA4w5avmFZ3RON4Hbb6JO3G
	j0nVCJ+UzXv+VpBZnvmI5r3lKtB1MCUNAmufit+ZT+n+dtUN/PGcrgckWm1lG05qr1iFrdYS5lU17
	BfCC1a+WsVbpdbQbyBldPl7g71mH2uGutiJd8TMlHUsL0VEU8Gx1klOaIV43wlJd7EURe3dk7DLpI
	hXU0rFfA3hloUhg5mGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongww-009bEi-SY; Wed, 26 Oct 2022 14:00:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongwt-009bCq-5R
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 14:00:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2F8161F09;
	Wed, 26 Oct 2022 14:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00F3C433C1;
	Wed, 26 Oct 2022 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666792801;
	bh=CQ5XwNeIC2anV6fPo2gAtCLHsIe2Wciqrl3G+05uEzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dthX121DlbMqr5yWbTQ1GOLDLybM+64JY3xeZF51q2aANlkYRl1i9I4x5jSebYqNl
	 WACT42G3WHPllcIMTDELYf1z+DYZPulkc0Pknz3CCQMQKJEgdiDsE4XSs02SNqFHrm
	 J5GtzoUb8rRUcUbqwsIbkberx0xTmlpo60vPXLt9XGy2uRnQDYrqD3R/AkAXmNIgbA
	 NR5HoUKCxlcldHD3xDoiYbQ5gNTl8GP+HD9fcoQt/xydSrplGknFvdzI+iQ00X7u7d
	 REaeGHTn1AsL3vaiusMg5YsECMl8tsI6+0gYZxHyH10GVO2M0hXE/teiA0I+PCfE5p
	 psLbyT32CMWkA==
Date: Wed, 26 Oct 2022 14:59:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	conor.dooley@microchip.com, daolu@rivosinc.com, heiko@sntech.de,
	guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support
 detection
Message-ID: <Y1k9W6+EXgiL60uq@spud>
References: <20221006173520.1785507-1-conor@kernel.org>
 <mhng-eb49b867-c5d3-45f9-904c-1726b1ce6158@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-eb49b867-c5d3-45f9-904c-1726b1ce6158@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_070003_316656_7B2AABCD 
X-CRM114-Status: GOOD (  48.37  )
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

On Wed, Oct 26, 2022 at 06:48:32AM -0700, Palmer Dabbelt wrote:
> On Thu, 06 Oct 2022 10:35:19 PDT (-0700), Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Hey,
> > This came up due to a report from Kevin @ kernel-ci, who had been
> > running a mixed configuration of GNU binutils and clang. Their compiler
> > was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.
> > 
> > Our current checks for extension support only cover the compiler, but it
> > appears to me that we need to check both the compiler & linker support
> > in case of "pot-luck" configurations that mix different versions of
> > LD,AS,CC etc.
> > 
> > Linker support does not seem possible to actually check, since the ISA
> > string is emitted into the object files - so I put in version checks for
> > that. The checks have gotten a bit ugly since 32 & 64 bit support need
> > to be checked independently but ahh well.
> > 
> > As I was going, I fell into the trap of there being duplicated checks
> > for CC support in both the Makefile and Kconfig, so as part of renaming
> > the Kconfig symbol to TOOLCHAIN_HAS_FOO, I dropped the extra checks in
> > the Makefile. This has the added advantage of the TOOLCHAIN_HAS_FOO
> > symbol for Zihintpause appearing in .config.
> > 
> > I pushed out a version of this that specificly checked for assember
> > support for LKP to test & it looked /okay/ - but I did some more testing
> > today and realised that this is redudant & have since dropped the as
> > check.
> > 
> > I tested locally with a fair few different combinations, to try and
> > cover each of AS, LD, CC missing support for the extension.
> > 
> > The one that I am left wondering about is Zicsr/Zifencei. Our Makefile
> > has:
> > 
> > > # Newer binutils versions default to ISA spec version 20191213 which moves some
> > > # instructions from the I extension to the Zicsr and Zifencei extensions.
> > > toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> > > riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> > 
> > I'd like to also move that one to Kconfig rather than the Makefile so
> > that, again, it shows up in .config etc. But as Zicsr/Zifencei do not
> > appear to be emitted into the object files it's not a fix and can be a
> > follow-on patch if my approach here is not entirely off-the-wall.
> 
> This is actually a different case: for Zicbom and Zihintpause the
> instructions were added to the toolchain at the same time the extensions
> were, for Zifencei and Zicsr the toolchain had the instructions before the
> extension was defined (as they were in previous base ISAs).  So the
> assembler always supports "fence.i", it's just a question of whether it also
> needs another extension in march.

Yeah, that one isn't going to break the build. If the extra bit isn't
emitted then the old linker doesn't care. Was more for whether we wanted
it to be consistent with a symbol for everything that we can check
easily after the fact.

> I'm not opposed to adding a Kconfig for it, but it's a slightly different
> thing and I'm not sure the Kconfig really helps any because none of the
> kernel sources need to understand the "the assembler doesn't support the
> 'fence.i' instruction" case.

tbh beyond the OCD thing about being consistent I don't really care :)

> > I am not 100% on the LD/LLD versions that I picked, I went off of a
> > `git branch -a --contains` of the first commits I found that with
> > mention of the extension. Please scream if I got it wrong, I'm not
> > overly familar with where to find this sort of info for the toolchains.
> 
> This LD version check is for the ISA string mismatches between objects?
> IIRC we stopped failing on those in 2.38, from that point on we just guess
> at a mix and allow linking anyway (largely because of that fence.i stuff).

idk, I wouldn't say "mismatches between objects". The
_zicbom_zihintpause ends up in the object files and the linker doesnt
understand that and aborts. The version checks are so that we don't
emitt that string into object files where our linker doesn't support
them. It only really matters for people that've got some sort of heavily
mixed setup of things - which includes some CIs like Kernel CI.

> > Conor Dooley (2):
> >   riscv: fix detection of toolchain Zicbom support
> >   riscv: fix detection of toolchain Zihintpause support
> > 
> >  arch/riscv/Kconfig                      | 17 +++++++++++++----
> >  arch/riscv/Makefile                     |  6 ++----
> >  arch/riscv/include/asm/vdso/processor.h |  2 +-
> >  3 files changed, 16 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
