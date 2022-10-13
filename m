Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CD5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zeob+F1OXC1jvC9WrFGXQsQEuV4R3BpD5n+Lmqeo3VI=; b=k1bzv+XLuhzMOB
	jAjPjMMdjUZbKzythlsj44DKXyOB/pXgXxpYJ7V2ry2ZF5BiyZXswFqpJwY82Rla4EZKSHP3OTl7G
	moctDIreeZHBDDjqTwwx0F6h9UbXDF9ZdgIha+hv7+aMW0uuXmOeBxULuOKTcumO1q+aNEUhaHYzL
	dbJ4q1OyumCCyzPwYFPbB30z8JooaBFekUx0+3r4WnlQ05Gc96N3/ulukaC4fZyBTloDFUb5PZuJ6
	kjgeGd4wv4dBb+sBjHBlG2lfqQi+KIyrEq2Oy9FO4T17u3hVxFjcMNFf/djy+0xgXW7U4AqeXfRDJ
	Ar/zu3J92TJ28xULITOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4th-00CvhO-D7; Thu, 13 Oct 2022 20:33:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4te-00CvgB-20
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 20:33:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 765A7B82079;
	Thu, 13 Oct 2022 20:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF408C433D6;
	Thu, 13 Oct 2022 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665693215;
	bh=cSSJTqzgPesRuaxrVBjmPJJmSoU2tk6WXgmwyLF4KUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxKhUWkosvn02pMtaowGkfeHCAuBxrc16nys1xE/ClyoOqh4QnFvMBZcMUhbxBXb1
	 My04/JtbibN8rD9dv3woDfvxUAs9zJRS/WKh9tr+q0YLsFZZ09o0KmnOF6kpCdOmw0
	 QHHfPsYTdvPIhHqmbkB23mctoQHuoC6+epLvFGtAh3luGTSbJizyONbsc8Zmn6u03U
	 vfwUz99GnU/deRe3OK0kIneTrysBhxb1p4J8YbZuvba0Iw8qqOBscdSNFGdfuEXZNR
	 KyrTfHdcLlLsFtqJeo5y824B6JDuXMk5bb/ZoXGmDABtFwS0e6GHkaQ6Px93MVsW/O
	 2paKIVQlKAWhA==
Date: Thu, 13 Oct 2022 21:33:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] riscv: fix detection of toolchain Zicbom support
Message-ID: <Y0h2GVhYwj8UEJV2@spud>
References: <20221006173520.1785507-1-conor@kernel.org>
 <20221006173520.1785507-2-conor@kernel.org>
 <Y0hzl75d11uWC+f3@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0hzl75d11uWC+f3@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_133338_419027_D9A8EC23 
X-CRM114-Status: GOOD (  30.85  )
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

On Thu, Oct 13, 2022 at 01:22:47PM -0700, Nathan Chancellor wrote:
> On Thu, Oct 06, 2022 at 06:35:20PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > It is not sufficient to check if a toolchain supports a particular
> > extension without checking if the linker supports that extension too.
> > For example, Clang 15 supports Zicbom but GNU bintutils 2.35.2 does
> > not, leading build errors like so:
> > 
> > riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zicbom1p0_zihintpause2p0: Invalid or unknown z ISA extension: 'zicbom'
> > 
> > Convert CC_HAS_ZICBOM to TOOLCHAIN_HAS_ZICBOM & check if the linker
> > also supports Zicbom.
> > 
> > Reported-by: Kevin Hilman <khilman@baylibre.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1714
> > Link: https://storage.kernelci.org/next/master/next-20220920/riscv/defconfig+CONFIG_EFI=n/clang-16/logs/kernel.log
> > Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> The versions look correct to me. I see the LLVM zicbom commit [1] in
> llvmorg-15.0.0 and I see the binutils zicbom commit [2] in
> binutils-2_39.
> 
> FWIW, if we are adding explicit tool versions to the Kconfig, could you
> not also drop the cc-option checks? Typically, cc-option is only used
> when dynamically checking for a feature, in lieu of statically checking
> a version. No strong opinion though.

Ehh, the explicit version checks are for linker support, but it could be
that your linker supports it but other things do not. The compilers
support can still be checked with cc-option, no?

This error here happens when the compiler does support it, so the string
containing zicbom is emitted in the object files. That can't be checked
dynamically. For the opposite situation, dynamic checking is possible so
I tried retained them. If it's convention to do one or the other, I can
easily switch.

I'm out of my comfort zone when it comes to kbuild plumbing so please,
please lmk if I'm missing something...

> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> [1]: https://github.com/llvm/llvm-project/commit/4f40ca53cefb725aca6564585d0ec4836a79e21a
> [2]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=41d6ac5da655a2e78109848f2db47e53552fd61a
> 
> > ---
> >  arch/riscv/Kconfig  | 10 ++++++----
> >  arch/riscv/Makefile |  3 +--
> >  2 files changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d557cc50295d..6da36553158b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -401,14 +401,16 @@ config RISCV_ISA_SVPBMT
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > -config CC_HAS_ZICBOM
> > +config TOOLCHAIN_HAS_ZICBOM
> >  	bool
> > -	default y if 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
> > -	default y if 32BIT && $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
> > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> >  
> >  config RISCV_ISA_ZICBOM
> >  	bool "Zicbom extension support for non-coherent DMA operation"
> > -	depends on CC_HAS_ZICBOM
> > +	depends on TOOLCHAIN_HAS_ZICBOM
> >  	depends on !XIP_KERNEL && MMU
> >  	select RISCV_DMA_NONCOHERENT
> >  	select RISCV_ALTERNATIVE
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 3fa8ef336822..3607d38edb4f 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -57,8 +57,7 @@ toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zi
> >  riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> >  
> >  # Check if the toolchain supports Zicbom extension
> > -toolchain-supports-zicbom := $(call cc-option-yn, -march=$(riscv-march-y)_zicbom)
> > -riscv-march-$(toolchain-supports-zicbom) := $(riscv-march-y)_zicbom
> > +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
> >  
> >  # Check if the toolchain supports Zihintpause extension
> >  toolchain-supports-zihintpause := $(call cc-option-yn, -march=$(riscv-march-y)_zihintpause)
> > -- 
> > 2.37.3
> > 
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
