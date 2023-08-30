Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF83C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhS7oC2UPx6AfDzUAGG2NejcJhikB9UcwvGFzdHtnbs=; b=YJ2slb9fljutxu
	DwT5eFCHeWvhyqJ+pxbbGt+ITHfn0vU53wCipN956U2YeK8LCEAmMB4YhbpIwgm1WqzPoybgzK4dJ
	q24cnaYPhY8Q6pstgdSr1Tl2KIq8YGwCyE3t9TyvRVvzXn0dmdla+fZaH6uLJPYk2UOYgCO1qe7k0
	2NrjaiPbjOg/CgznV3J8CF1SZpgSq++QL2MvNXHn4qtLM+Jzpt8NaQE41DI2gWaKJFtDmuvCZX3Oh
	sP2gaCcDh483HRXWKtcUm2iqiaD3sAm2JdJ/ZCfjsEOTYm4ojRyMWVQZ0uAiJhaJPM3I31BVE4FTh
	sZBTGvncqKKBzNj/Tl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbNFY-00DmIA-0U;
	Wed, 30 Aug 2023 15:36:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbNFU-00DmHJ-2X
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 15:36:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 87D09B81F6A;
	Wed, 30 Aug 2023 15:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90976C433C9;
	Wed, 30 Aug 2023 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693409809;
	bh=QjDdkcbpkYs5rXMPPX++/gHZ2/NTUOumpBgRZxH8cr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dX6Ck60wTNeElXbArCB7gm4NgWC4aQC5CwHxpcSuvecKp6AW7PlSOTxstnJGh9vos
	 zYTbdcY2gza+vmd88baqiXl4MCh5EzPFUnmD8VIf4bR5RKiWbmV+qccRc/kICGJzNM
	 AWdhLqd+eUaac3uax7ilwVSxxFF/yLzEe2JI5gA2B37aRtVI7uz4uugpzsExv1sYM9
	 yz/xQFoXpk+gg2xvJmb0nECIpQ6/9312+bAHLijVQAwCK82b/hgGSuCa2AOb2nHJCn
	 lE0MN6XyMUvEkW1EhQwIP3lrMp1tUMKja8zE9eVMmpUT6JjnLfAVigz1GrYz7tpa9H
	 zT2tk60RxN5bQ==
Date: Wed, 30 Aug 2023 08:36:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: keescook@chromium.org, akpm@linux-foundation.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Conor Dooley <conor@kernel.org>, ndesaulniers@google.com,
	trix@redhat.com, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, patches@lists.linux.dev, lkp@intel.com
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
Message-ID: <20230830153646.GA954264@dev-arch.thelio-3990X>
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
 <mhng-747958b0-514c-4fc8-ac37-0769562ba385@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-747958b0-514c-4fc8-ac37-0769562ba385@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_083653_141072_AF17DF42 
X-CRM114-Status: GOOD (  27.15  )
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

On Wed, Aug 30, 2023 at 06:22:45AM -0700, Palmer Dabbelt wrote:
> On Wed, 16 Aug 2023 10:35:43 PDT (-0700), nathan@kernel.org wrote:
> > When building for ARCH=riscv using LLVM < 14, there is an error with
> > CONFIG_DEBUG_INFO_SPLIT=y:
> > 
> >   error: A dwo section may not contain relocations
> > 
> > This was worked around in LLVM 15 by disallowing '-gsplit-dwarf' with
> > '-mrelax' (the default), so CONFIG_DEBUG_INFO_SPLIT is not selectable
> > with newer versions of LLVM:
> > 
> >   $ clang --target=riscv64-linux-gnu -gsplit-dwarf -c -o /dev/null -x c /dev/null
> >   clang: error: -gsplit-dwarf is unsupported with RISC-V linker relaxation (-mrelax)
> > 
> > GCC silently had a similar issue that was resolved with GCC 12.x.
> > Restrict CONFIG_DEBUG_INFO_SPLIT for RISC-V when using LLVM or GCC <
> > 12.x to avoid these known issues.
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1914
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/all/202308090204.9yZffBWo-lkp@intel.com/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Since this only impacts RISC-V, it seems reasonable that this would go
> > in via their tree but I have added Andrew in case he wants to take it.
> > ---
> >  lib/Kconfig.debug | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index d6798513a8c2..bd51274f4771 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -355,6 +355,11 @@ endchoice # "Compressed Debug information"
> >  config DEBUG_INFO_SPLIT
> >  	bool "Produce split debuginfo in .dwo files"
> >  	depends on $(cc-option,-gsplit-dwarf)
> > +	# RISC-V linker relaxation + -gsplit-dwarf has issues with LLVM and GCC
> > +	# prior to 12.x:
> > +	# https://github.com/llvm/llvm-project/issues/56642
> > +	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
> > +	depends on !RISCV || GCC_VERSION >= 120000
> >  	help
> >  	  Generate debug info into separate .dwo files. This significantly
> >  	  reduces the build directory size for builds with DEBUG_INFO,
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Not sure who's taking stuff for lib/Kconfig.debug, I can take it via the
> RISC-V tree if folks are OK with it.  Kees and Andrew were the last to touch
> it.

I don't think lib/Kconfig.debug has a formal maintainer. Given that and
the fact that this change only affects RISC-V, I think it is entirely
reasonable for you to take it.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
