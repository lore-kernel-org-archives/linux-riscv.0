Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F88EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 02:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kM6VmDpcjZhe0P48A055unwkxAkA17r4jjuVNNrrkUo=; b=gNngor2kKxDCBY
	rOcS/w8nfByDBmtBVdfaimhoNRYiwEV3at88HgEw/ZePlp7nsheO5Th/p9lYq5XvJSJ2KL9DFtYAa
	0/akiR2W6dXME1tmunDZMh8IjqCVluOcI2o8nq4Zm/jMGYF31+AB9gEMyjwIQlc0mV0XJu0ybcyzd
	hKbQLioDHrGNGoDqhhIAJ3Ligiona1iEPPqpuH42jykl43ACBYFWTLRl5yT72tezX3+BpWWxBohBD
	IyC8DFIFUW/FFhjJauACcqVFA3v7ZqbdZidpcszs7iKY0449QBPVH+D9qHXjpH+NcYTEo1sK2b1QW
	b/ewB5PxpqyOPQGns0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTCD3-001WON-1S;
	Tue, 08 Aug 2023 02:12:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTCD0-001WMK-0S
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 02:12:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E3CF6237A;
	Tue,  8 Aug 2023 02:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A6CC433C9;
	Tue,  8 Aug 2023 02:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691460748;
	bh=VRkYha2WcYiFCfW1jnh2VzYnyzSI0BELp4Vbm5rvuJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIDPQ2tkRoESMxlHw70sgk7jaT2faK4xi7GqlRBnpsnrfAGVWf56MAMy5koAx3fEu
	 rc8orB5Jl57n/+LS4Q+M8wXPJlijTHZ/Mf+BbCq7fRz0uH9WVui1WSDJbW/sdv74h6
	 hpcz6wB9Nf+Kae77HrB87LBryEUzWLuy8NCpFfX9qOy/CmCuFW+WeZJHruny88kTUU
	 g+w7Yzys9y9TwUPJEJ4M+eT+sn+F/H3G+VIWsU/UsSfzSpmjECNB4p90XnDdXv0hcn
	 A0ZPCj9ITwAzmSiKqhaCLUy9pW4lcrGn647Zu7X+t/8052h+2ejyG/w7z2f/x1Cre8
	 vHXMHucz3xXmA==
Date: Mon, 7 Aug 2023 22:12:15 -0400
From: Guo Ren <guoren@kernel.org>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: paul.walmsley@sifive.com, Anup Patel <anup@brainfault.org>,
	peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>, longman@redhat.com,
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org,
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com,
	Conor Dooley <conor.dooley@microchip.com>,
	xiaoguang.xing@sophgo.com,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	alexghiti@rivosinc.com, Kees Cook <keescook@chromium.org>,
	greentime.hu@sifive.com, Andrew Jones <ajones@ventanamicro.com>,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
	guoren@kernel.org
Subject: Re: [PATCH V10 07/19] riscv: qspinlock: errata: Introduce
 ERRATA_THEAD_QSPINLOCK
Message-ID: <ZNGkf88lhPt7fdhH@gmail.com>
References: <20230802164701.192791-1-guoren@kernel.org>
 <20230802164701.192791-8-guoren@kernel.org>
 <ae320af5-6cca-4689-aa66-9d0193713d40@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae320af5-6cca-4689-aa66-9d0193713d40@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_191230_284915_C26D621F 
X-CRM114-Status: GOOD (  42.50  )
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

On Mon, Aug 07, 2023 at 01:23:34AM -0400, Stefan O'Rear wrote:
> On Wed, Aug 2, 2023, at 12:46 PM, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > According to qspinlock requirements, RISC-V gives out a weak LR/SC
> > forward progress guarantee which does not satisfy qspinlock. But
> > many vendors could produce stronger forward guarantee LR/SC to
> > ensure the xchg_tail could be finished in time on any kind of
> > hart. T-HEAD is the vendor which implements strong forward
> > guarantee LR/SC instruction pairs, so enable qspinlock for T-HEAD
> > with errata help.
> >
> > T-HEAD early version of processors has the merge buffer delay
> > problem, so we need ERRATA_WRITEONCE to support qspinlock.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/Kconfig.errata              | 13 +++++++++++++
> >  arch/riscv/errata/thead/errata.c       | 24 ++++++++++++++++++++++++
> >  arch/riscv/include/asm/errata_list.h   | 20 ++++++++++++++++++++
> >  arch/riscv/include/asm/vendorid_list.h |  3 ++-
> >  arch/riscv/kernel/cpufeature.c         |  3 ++-
> >  5 files changed, 61 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index 4745a5c57e7c..eb43677b13cc 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -96,4 +96,17 @@ config ERRATA_THEAD_WRITE_ONCE
> > 
> >  	  If you don't know what to do here, say "Y".
> > 
> > +config ERRATA_THEAD_QSPINLOCK
> > +	bool "Apply T-Head queued spinlock errata"
> > +	depends on ERRATA_THEAD
> > +	default y
> > +	help
> > +	  The T-HEAD C9xx processors implement strong fwd guarantee LR/SC to
> > +	  match the xchg_tail requirement of qspinlock.
> > +
> > +	  This will apply the QSPINLOCK errata to handle the non-standard
> > +	  behavior via using qspinlock instead of ticket_lock.
> > +
> > +	  If you don't know what to do here, say "Y".
> 
> If this is to be applied, I would like to see a detailed explanation somewhere,
> preferably with citations, of:
> 
> (a) The memory model requirements for qspinlock
These were written in commit: a8ad07e5240 ("asm-generic: qspinlock: Indicate the use of
mixed-size atomics"). For riscv, the most controversial point is xchg_tail()
implementation for native queued spinlock.

> (b) Why, with arguments, RISC-V does not architecturally meet (a)
In the spec "Eventual Success of Store-Conditional Instructions":
"By contrast, if other harts or devices continue to write to that reservation set, it is
not guaranteed that any hart will exit its LR/SC loop."

1. The arch_spinlock_t is 32-bit width, and it contains LOCK_PENDING
   part and IDX_TAIL part.
    - LOCK:     lock holder
    - PENDING:  next waiter (Only once per contended situation)
    - IDX:      nested context (normal, hwirq, softirq, nmi)
    - TAIL:     last contended cpu
   The xchg_tail operate on IDX_TAIL part, so there is no guarantee on "NO"
   "other harts or devices continue to write to that reservation set".

2. When you do lock torture test, you may see a long contended ring queue:
                                                                xchg_tail
                                                                    +-----> CPU4 (big core)
                                                                    |
   CPU3 (lock holder) -> CPU1 (mcs queued) -> CPU2 (mcs queued) ----+-----> CPU0 (little core)
    |                                                               |
    |                                                               +-----> CPU5 (big core)
    |                                                               |
    +--locktorture release lock (spin_unlock) and spin_lock again --+-----> CPU3 (big core)

    If CPU0 doesn't have a strong fwd guarantee, xhg_tail is consistently failed.

> (c) Why, with arguments, T-HEAD C9xx meets (a)
> (d) Why at least one other architecture which defines ARCH_USE_QUEUED_SPINLOCKS
>     meets (a)
I can't give the C9xx microarch implementation detail. But many
open-source riscv cores have provided strong forward progress guarantee
LR/SC implementation [1] [2]. But I would say these implementations are
too rude, which makes LR send a cacheline unique interconnect request.
It satisfies xchg_tail but not cmpxchg & cond_load. CPU vendors should
carefully consider your LR/SC fwd guarantee implementation.

[1]: https://github.com/riscv-boom/riscv-boom/blob/v3.0.0/src/main/scala/lsu/dcache.scala#L650
[2]: https://github.com/OpenXiangShan/XiangShan/blob/v1.0/src/main/scala/xiangshan/cache/MainPipe.scala#L470

> 
> As far as I can tell, the RISC-V guarantees concerning constrained LR/SC loops
> (livelock freedom but no starvation freedom) are exactly the same as those in
> Armv8 (as of 0487F.c) for equivalent loops, and xchg_tail compiles to a
> constrained LR/SC loop with guaranteed eventual success (with -O1).  Clearly you
> disagree; I would like to see your perspective.
For Armv8, I would use LSE for the lock-contended scenario. Ref this
commit 0ea366f5e1b6: ("arm64: atomics: prefetch the destination word for
write prior to stxr").

> 
> -s
> 
> > +
> >  endmenu # "CPU errata selection"
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > index 881729746d2e..d560dc45c0e7 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -86,6 +86,27 @@ static bool errata_probe_write_once(unsigned int stage,
> >  	return false;
> >  }
> > 
> > +static bool errata_probe_qspinlock(unsigned int stage,
> > +				   unsigned long arch_id, unsigned long impid)
> > +{
> > +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_QSPINLOCK))
> > +		return false;
> > +
> > +	/*
> > +	 * The queued_spinlock torture would get in livelock without
> > +	 * ERRATA_THEAD_WRITE_ONCE fixup for the early versions of T-HEAD
> > +	 * processors.
> > +	 */
> > +	if (arch_id == 0 && impid == 0 &&
> > +	    !IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> > +		return false;
> > +
> > +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  static u32 thead_errata_probe(unsigned int stage,
> >  			      unsigned long archid, unsigned long impid)
> >  {
> > @@ -103,6 +124,9 @@ static u32 thead_errata_probe(unsigned int stage,
> >  	if (errata_probe_write_once(stage, archid, impid))
> >  		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
> > 
> > +	if (errata_probe_qspinlock(stage, archid, impid))
> > +		cpu_req_errata |= BIT(ERRATA_THEAD_QSPINLOCK);
> > +
> >  	return cpu_req_errata;
> >  }
> > 
> > diff --git a/arch/riscv/include/asm/errata_list.h 
> > b/arch/riscv/include/asm/errata_list.h
> > index fbb2b8d39321..a696d18d1b0d 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -141,6 +141,26 @@ asm volatile(ALTERNATIVE(						\
> >  	: "=r" (__ovl) :						\
> >  	: "memory")
> > 
> > +static __always_inline bool
> > +riscv_has_errata_thead_qspinlock(void)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > +		asm_volatile_goto(
> > +		ALTERNATIVE(
> > +		"j	%l[l_no]", "nop",
> > +		THEAD_VENDOR_ID,
> > +		ERRATA_THEAD_QSPINLOCK,
> > +		CONFIG_ERRATA_THEAD_QSPINLOCK)
> > +		: : : : l_no);
> > +	} else {
> > +		goto l_no;
> > +	}
> > +
> > +	return true;
> > +l_no:
> > +	return false;
> > +}
> > +
> >  #endif /* __ASSEMBLY__ */
> > 
> >  #endif
> > diff --git a/arch/riscv/include/asm/vendorid_list.h 
> > b/arch/riscv/include/asm/vendorid_list.h
> > index 73078cfe4029..1f1d03877f5f 100644
> > --- a/arch/riscv/include/asm/vendorid_list.h
> > +++ b/arch/riscv/include/asm/vendorid_list.h
> > @@ -19,7 +19,8 @@
> >  #define	ERRATA_THEAD_CMO 1
> >  #define	ERRATA_THEAD_PMU 2
> >  #define	ERRATA_THEAD_WRITE_ONCE 3
> > -#define	ERRATA_THEAD_NUMBER 4
> > +#define	ERRATA_THEAD_QSPINLOCK 4
> > +#define	ERRATA_THEAD_NUMBER 5
> >  #endif
> > 
> >  #endif
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index f8dbbe1bbd34..d9694fe40a9a 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -342,7 +342,8 @@ void __init riscv_fill_hwcap(void)
> >  		 * spinlock value, the only way is to change from queued_spinlock to
> >  		 * ticket_spinlock, but can not be vice.
> >  		 */
> > -		if (!force_qspinlock) {
> > +		if (!force_qspinlock &&
> > +		    !riscv_has_errata_thead_qspinlock()) {
> >  			set_bit(RISCV_ISA_EXT_XTICKETLOCK, isainfo->isa);
> >  		}
> >  #endif
> > -- 
> > 2.36.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
