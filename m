Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ED2C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnlCFUybcjS5Q3c4KAOJGbVRVUihd9A1wuekKdnpel4=; b=iPlvKvkcgYrfeV
	MLEMjT/erVIdPXPt8a1r6xhhkbzUTNQ+Yan4ivoW89g9GI04e+bRLvL+uqILRgtshO/+tQowgAxaY
	Bji/wdUSkN387VXYiOZJRYcZfK4H4Ec5xZvMvdPrbmMQpxVnU0zHHqD4sg79Iy1R5cOcNrSDcZu+1
	Ag5BPzA3KBCHOL6qF/Ul8vTN3BNiDIWGdjjr0KYPlmzKjx2VfDBn18RF++2S4MqtuCKgEU7Ydk80D
	SGRGfhTLrwGK2ns3IHtGkvCyuq/PFARfrSlvfzwfFDqGlQQh4aG/UfusqK0cp2lIvx1illkTfl61D
	aAO0aVOh2dYXBeIrrHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfitL-004k1r-2g;
	Fri, 24 Mar 2023 14:59:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfitI-004k0k-0e;
	Fri, 24 Mar 2023 14:59:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A0622B82219;
	Fri, 24 Mar 2023 14:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE63C433EF;
	Fri, 24 Mar 2023 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679669977;
	bh=aexf8QVQjdHKISgbnuUhwIekCSwlym0VJvtrs/KGRe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmYaye+CACf4OUVvRpKgvl35z0ZQb07hfSSTQ9ooEi98ZvxSwIv8rTO3y43Xyq6xe
	 iEDDUOCMKx5CaoPK+s7AhNx+8v7G3JLA3gtBuMxwI9klDe/9lai+y27HELU4yMA9JS
	 dSpbfAIMknlKwnzU32da5+8vRyLkbCF+enN9V9boJxFg1LVGhSuAywK5XXql8E2oR5
	 2Ht6a6CGUuxpEIK6W6uzf4iBVwYYERtfcNfgaVGWtfIlwpCLLvDkgRQduqoRtbXae9
	 OR/MErSFUwl+dcZZrgiYUB+bvtBqsUGf1VQmE8S12flt0WpoqQlCZ42dtRsjtpk64H
	 QchEMU7ECve9Q==
Date: Fri, 24 Mar 2023 07:59:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v16 19/20] riscv: detect assembler support for
 .option arch
Message-ID: <20230324145934.GB428955@dev-arch.thelio-3990X>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
 <20230323145924.4194-20-andy.chiu@sifive.com>
 <04cc3420-26a7-4263-b120-677c758eabea@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04cc3420-26a7-4263-b120-677c758eabea@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_075940_510616_E9039DE6 
X-CRM114-Status: GOOD (  28.66  )
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

On Thu, Mar 23, 2023 at 03:26:14PM +0000, Conor Dooley wrote:
> On Thu, Mar 23, 2023 at 02:59:23PM +0000, Andy Chiu wrote:
> > Some extensions use .option arch directive to selectively enable certain
> > extensions in parts of its assembly code. For example, Zbb uses it to
> > inform assmebler to emit bit manipulation instructions. However,
> > supporting of this directive only exist on GNU assembler and has not
> > landed on clang at the moment, making TOOLCHAIN_HAS_ZBB depend on
> > AS_IS_GNU.
> > 
> > While it is still under review at https://reviews.llvm.org/D123515, the
> > upcoming Vector patch also requires this feature in assembler. Thus,
> > provide Kconfig AS_HAS_OPTION_ARCH to detect such feature. Then
> > TOOLCHAIN_HAS_XXX will be turned on automatically when the feature land.
> > 
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > ---
> >  arch/riscv/Kconfig | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 36a5b6fed0d3..4f8fd4002f1d 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -244,6 +244,12 @@ config RISCV_DMA_NONCOHERENT
> >  config AS_HAS_INSN
> >  	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
> >  
> > +config AS_HAS_OPTION_ARCH
> > +	# https://reviews.llvm.org/D123515
> > +	def_bool y
> > +	depends on $(as-instr, .option arch$(comma) +m)
> > +	depends on !$(as-instr, .option arch$(comma) -i)
> 
> Oh cool, I didn't expect this to work given what Nathan said in his
> mail, but I gave it a whirl and it does seem to.

The second line is the clever part of this option that I had not
considered, as it checks for something that should error in addition to
something that shouldn't::

$ echo '.option arch, -i' | riscv64-linux-gcc -c -o /dev/null -x assembler -
{standard input}: Assembler messages:
{standard input}:1: Error: cannot + or - base extension `i' in .option arch `-i'

Looking at D123515, I see this same option test is present and appears
to error in the same manner so this should work when that change is
merged.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> I suppose:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> I'd rather it be this way so that it is "hands off", as opposed to the
> version check that would need updating in the future. And I guess it
> means that support for V & IAS will automatically turn on for stable
> kernels too once the LLVM change lands, which is nice ;)

Very much agreed!

> Thanks Andy!
> 
> > +
> >  source "arch/riscv/Kconfig.socs"
> >  source "arch/riscv/Kconfig.errata"
> >  
> > @@ -442,7 +448,7 @@ config TOOLCHAIN_HAS_ZBB
> >  	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> >  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> >  	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > -	depends on AS_IS_GNU
> > +	depends on AS_HAS_OPTION_ARCH
> >  
> >  config RISCV_ISA_ZBB
> >  	bool "Zbb extension support for bit manipulation instructions"
> > -- 
> > 2.17.1
> > 
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
