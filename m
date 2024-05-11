Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BEDC04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 14:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1pn1xh17fHklxRmDBj4/b05GkkQIpOhLDO4cg5T/+0=; b=zpC+3PeTVQ1kG+
	ZZ+aSzLCbMBctz/riWdIsZaRbbvDdfMIcerlUdWwXbXN8NdsPVj1YcRnlVAXZGvM3b4Q2wh5cPQ0C
	/uXVJn6D5+3b1CT/fgNmTifVOG+aIvj3Q9Xqs5DEBAhpxrGXpYDe0R3d+Nzek5jBEqR5jdZ+bkPJM
	IKy2P6+Aizdljii0f0W6NEpGIW2+QHCli1dlPYt6seGqi4aMh23CnorDrKw5ZfSry3mq/gaM297jg
	ZRYmAwNNmMRh3OC2q/Aq01sOWQRVKB10ZHo/gxgASCJrctmVazzfq+N7PewOonp0S+jwrfq/WnKEk
	Mo4d8VIpZ8p+ZCflAUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5o7V-000000087TG-0YEg;
	Sat, 11 May 2024 14:54:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5o7R-000000087SJ-2giQ
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 14:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15A0A612F5;
	Sat, 11 May 2024 14:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B401FC2BBFC;
	Sat, 11 May 2024 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715439274;
	bh=rubNTKa3Iwun2UymZEiP0WYCh3XNAOyMB5tCLTlUEFI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZurLr3OXzHvnrGXTC0m0EjbLQcWxLY8Sd8TfY83aiW61ZZyjC3/e9a5GbfnLII4JF
	 FCKllJgagsqPk15iOK2VWkzCZmj3LgADqytPr/xUK+PLOmy9LWyWiyayqjsBShNIDb
	 Bzr9KMT/T7u/hKYD03UhBobomiFLb/cS2nIyumnYQR0lT6LPBSNdhirExo+dph3oWh
	 M6O9zEvCuCx9S6AheT3VDcXuNBBgIH6TcV8sB8q/tgagCXjwE1OEuGEzS9XzekDbK0
	 t+AlY31dWNadimMISPDEx95SGQMPUqcx+KhON7uRXBSvxH9WuCqy3pg8rK5Rc91JB0
	 WbQxFumacovNg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 595AECE0F8E; Sat, 11 May 2024 07:54:34 -0700 (PDT)
Date: Sat, 11 May 2024 07:54:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, andi.shyti@linux.intel.com,
	andrzej.hajda@intel.com, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: Re: [PATCH RFC cmpxchg 8/8] riscv: Emulate one-byte and two-byte
 cmpxchg
Message-ID: <9a84b94c-34ff-4c3a-ab2b-2741a5755db9@paulmck-laptop>
References: <20240401213950.3910531-8-paulmck@kernel.org>
 <mhng-d6a8a972-5054-4c48-a903-5a53a31da9ad@palmer-ri-x1c9a>
 <Zj8VJZmQC7hRzDdz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zj8VJZmQC7hRzDdz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_075437_865950_21B68C25 
X-CRM114-Status: GOOD (  33.17  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, May 11, 2024 at 02:50:13AM -0400, Guo Ren wrote:
> On Thu, Apr 04, 2024 at 07:15:40AM -0700, Palmer Dabbelt wrote:
> > On Mon, 01 Apr 2024 14:39:50 PDT (-0700), paulmck@kernel.org wrote:
> > > Use the new cmpxchg_emu_u8() and cmpxchg_emu_u16() to emulate one-byte
> > > and two-byte cmpxchg() on riscv.
> > > 
> > > [ paulmck: Apply kernel test robot feedback. ]
> > 
> > I'm not entirely following the thread, but sounds like there's going to be
> > generic kernel users of this now?  Before we'd said "no" to the byte/half
> > atomic emulation routines beacuse they weren't used, but if it's a generic
> > thing then I'm find adding them.
> > 
> > There's a patch set over here
> > <https://lore.kernel.org/all/20240103163203.72768-2-leobras@redhat.com/>
> > that implements these more directly using LR/SC.  I was sort of on the fence
> > about just taking it even with no direct users right now, as the byte/half
> > atomic extension is working its way through the spec process so we'll have
> > them for real soon.  I stopped right there for the last merge window,
> > though, as I figured it was too late to be messing with the atomics...
> > 
> > So
> > 
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> F.Y.I Leonardo Bras <leobras@redhat.com>

I am carrying this in -rcu, but only for testing purposes, not for
inclusion into mainline.  Not that I know of anyone testing -rcu on
RISC-V, but still, I wouldn't want to do anything do discourage such
testing.

The reason that this patch is no longer intended for inclusion is that it
has been obsoleted by a patch that provides native support for one-byte
and two-byte cmpxchg() operations.  Which is even better!  ;-)

							Thanx, Paul

> > if you guys want to take some sort of tree-wide change to make the byte/half
> > stuff be required everywhere.  We'll eventually end up with arch routines
> > for the extension, so at that point we might as well also have the more
> > direct LR/SC flavors.
> > 
> > If you want I can go review/merge that RISC-V patch set and then it'll have
> > time to bake for a shared tag you can pick up for all this stuff?  No rush
> > on my end, just LMK.
> > 
> > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: <linux-riscv@lists.infradead.org>
> > > ---
> > >  arch/riscv/Kconfig               |  1 +
> > >  arch/riscv/include/asm/cmpxchg.h | 25 +++++++++++++++++++++++++
> > >  2 files changed, 26 insertions(+)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index be09c8836d56b..4eaf40d0a52ec 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -44,6 +44,7 @@ config RISCV
> > >  	select ARCH_HAS_UBSAN
> > >  	select ARCH_HAS_VDSO_DATA
> > >  	select ARCH_KEEP_MEMBLOCK if ACPI
> > > +	select ARCH_NEED_CMPXCHG_1_2_EMU
> > >  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> > >  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> > >  	select ARCH_STACKWALK
> > > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > > index 2fee65cc84432..a5b377481785c 100644
> > > --- a/arch/riscv/include/asm/cmpxchg.h
> > > +++ b/arch/riscv/include/asm/cmpxchg.h
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/bug.h>
> > > 
> > >  #include <asm/fence.h>
> > > +#include <linux/cmpxchg-emu.h>
> > > 
> > >  #define __xchg_relaxed(ptr, new, size)					\
> > >  ({									\
> > > @@ -170,6 +171,12 @@
> > >  	__typeof__(*(ptr)) __ret;					\
> > >  	register unsigned int __rc;					\
> > >  	switch (size) {							\
> > > +	case 1:								\
> > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > +		break;							\
> > > +	case 2:								\
> > > +		break;							\
> > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >  	case 4:								\
> > >  		__asm__ __volatile__ (					\
> > >  			"0:	lr.w %0, %2\n"				\
> > > @@ -214,6 +221,12 @@
> > >  	__typeof__(*(ptr)) __ret;					\
> > >  	register unsigned int __rc;					\
> > >  	switch (size) {							\
> > > +	case 1:								\
> > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > +		break;							\
> > > +	case 2:								\
> > > +		break;							\
> > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >  	case 4:								\
> > >  		__asm__ __volatile__ (					\
> > >  			"0:	lr.w %0, %2\n"				\
> > > @@ -260,6 +273,12 @@
> > >  	__typeof__(*(ptr)) __ret;					\
> > >  	register unsigned int __rc;					\
> > >  	switch (size) {							\
> > > +	case 1:								\
> > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > +		break;							\
> > > +	case 2:								\
> > > +		break;							\
> > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >  	case 4:								\
> > >  		__asm__ __volatile__ (					\
> > >  			RISCV_RELEASE_BARRIER				\
> > > @@ -306,6 +325,12 @@
> > >  	__typeof__(*(ptr)) __ret;					\
> > >  	register unsigned int __rc;					\
> > >  	switch (size) {							\
> > > +	case 1:								\
> > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > +		break;							\
> > > +	case 2:								\
> > > +		break;							\
> > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >  	case 4:								\
> > >  		__asm__ __volatile__ (					\
> > >  			"0:	lr.w %0, %2\n"				\
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
