Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498FEFA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDEsvZWRN29UQgWbF9mG2AyAyJiaE5DY2i1R0h1/ic0=; b=lPWE55nWv8vOul
	81vjHKXBcLGRNqgvXLPtpnLfXABaLHnziuMsuuOd+4NFxBItedOYr6UgUEg1bW2K8DCJDvgrI6k6V
	G6UBhcpQUFn0oCeX06vXxwhPd6IOzJul203qgJBxlk2U53J27eUVHD1MRlVvqYW43tnh0QgG+zibG
	azJe/2w8/Qtom5Jn+8uGKI2F8WHcIsoJHCtgCRLg5A3iyNISIKrvAHTOK4Wf6CWaPeAfuZSM/13QE
	JC2LaT4/I1/N61nEgpbq/Hz4PY3kNqFBvCfU0IxnuRxe1VDWr9AXvJteDQ9eixZEcpquJJEIJ1gj2
	5ts/E2qOElNTxxzXmr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZ3g-00DXf3-Rv; Mon, 31 Oct 2022 17:58:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZ3e-00DXdl-Fi
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 17:58:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2678C612B9;
	Mon, 31 Oct 2022 17:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42533C433D6;
	Mon, 31 Oct 2022 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667239124;
	bh=6k2VQy1WA5DlnNEe5C6X3CH+VCbSwygDOtxVDwcHUxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TG3DxQsxTlcQfXVv7G4OFe4KJMjGMhM0EI8q77eUAjnNDZPO3drtH5yiToccym/Ba
	 MGUyKb0gPaJC5nmCymcOKRi4vmVrZsr9fvhxwV+HQptia9Jq3DToqW5xW2FXxxi+ma
	 Jlt/XrBdfjs3zzz+4OFy3ZRqnbNzMjYLP5d9z7Lx1jwwzVMzClc0h5KTkg58RjnIQj
	 dJO/i8/n6Mz8rQZqdMwS04c65w/rv83/xpRmtX/xDEsGeahktfvGEwO/4iICiUGaru
	 0fXQwHH67hG4RWHhMspJxFALhErCWudYh2GKeOoQ70SYboE1TPhVyz/Qb5TTa21gNM
	 ZsWLHtcqSAccA==
Date: Tue, 1 Nov 2022 01:49:01 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <Y2AKjYEcIpvwxe7h@xhacker>
References: <20221008145437.491-1-jszhang@kernel.org>
 <Y0bA8HUL9eC3Dp8C@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0bA8HUL9eC3Dp8C@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_105846_643868_1B45955D 
X-CRM114-Status: GOOD (  28.04  )
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

On Wed, Oct 12, 2022 at 02:28:16PM +0100, Conor Dooley wrote:
> Hey Jisheng,

Hi Conor,

> LKP reported an error that seems to only have gone to myself & Samuel,
> but the branch it's complaining about is your v1:
> https://lore.kernel.org/lkml/202210122123.Cc4FPShJ-lkp@intel.com/
> 
> Any idea what the story is here?

I tried the config in the link, I can reproduce the build error w/
and w/o the my patch. So I think the root cause of the build error
is a different story. I have a fix in local repo, will send it out
soon.

Thanks

> 
> Thanks,
> Conor.
> 
> On Sat, Oct 08, 2022 at 10:54:37PM +0800, Jisheng Zhang wrote:
> > Samuel reported that the static branch usage in cpu_relax() breaks
> > building with CONFIG_CC_OPTIMIZE_FOR_SIZE:
> > 
> > In file included from <command-line>:
> > ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> > ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
> > probably does not match constraints
> >   285 | #define asm_volatile_goto(x...) asm goto(x)
> >       |                                 ^~~
> > ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> > 'asm_volatile_goto'
> >    41 |         asm_volatile_goto(
> >       |         ^~~~~~~~~~~~~~~~~
> > ././include/linux/compiler_types.h:285:33: error: impossible constraint
> > in 'asm'
> >   285 | #define asm_volatile_goto(x...) asm goto(x)
> >       |                                 ^~~
> > ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> > 'asm_volatile_goto'
> >    41 |         asm_volatile_goto(
> >       |         ^~~~~~~~~~~~~~~~~
> > make[1]: *** [scripts/Makefile.build:249:
> > arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> > make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> > 
> > Maybe "-Os" prevents GCC from detecting that the key/branch arguments
> > can be treated as constants and used as immediate operands. Inspired
> > by x86's commit 864b435514b2("x86/jump_label: Mark arguments as const to
> > satisfy asm constraints"), and as pointed out by Steven: "The "i"
> > constraint needs to be a constant.", let's do similar modifications to
> > riscv.
> > 
> > Tested by CC_OPTIMIZE_FOR_SIZE + gcc and CC_OPTIMIZE_FOR_SIZE + clang.
> > 
> > Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> > Link: https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
> > Fixes: 8eb060e10185 ("arch/riscv: add Zihintpause support")
> > Reported-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> > 
> > since v1:
> >  - add Reported-by, Reviewed-by, Fixes and Link tag
> > 
> >  arch/riscv/include/asm/jump_label.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> > index 38af2ec7b9bf..6d58bbb5da46 100644
> > --- a/arch/riscv/include/asm/jump_label.h
> > +++ b/arch/riscv/include/asm/jump_label.h
> > @@ -14,8 +14,8 @@
> >  
> >  #define JUMP_LABEL_NOP_SIZE 4
> >  
> > -static __always_inline bool arch_static_branch(struct static_key *key,
> > -					       bool branch)
> > +static __always_inline bool arch_static_branch(struct static_key * const key,
> > +					       const bool branch)
> >  {
> >  	asm_volatile_goto(
> >  		"	.option push				\n\t"
> > @@ -35,8 +35,8 @@ static __always_inline bool arch_static_branch(struct static_key *key,
> >  	return true;
> >  }
> >  
> > -static __always_inline bool arch_static_branch_jump(struct static_key *key,
> > -						    bool branch)
> > +static __always_inline bool arch_static_branch_jump(struct static_key * const key,
> > +						    const bool branch)
> >  {
> >  	asm_volatile_goto(
> >  		"	.option push				\n\t"
> > -- 
> > 2.37.2
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
