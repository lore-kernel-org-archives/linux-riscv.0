Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7739DCD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELxVSHPWzqHq2PLA5C5CxawoCS8Jpo8+YMKugp7TfOM=; b=IuX7MoFLmmOv9S
	8xbuwMSDtoWD4zafDLFxAa8rvDf+NOuul4X14kbrhWNP8xc/vLMm++gaL+w4WrL/8jy4xh49u+0CW
	c+JKHZEfcdP/kX28OlHf/FfZ+yuAX5UbL+RKIxEq30/5TyiCBUAqjru5UYWMDipT1mQJWUUQqNecr
	uO0+3d5Bj8v+1N1nKxBAP4Ctr47P8Gvu1AUaPamHHANqFwvCdOBtECqDen0G/SS7WjTqw+t8B/7FW
	eWtw1aKhTeLIZwCYtuCceOuLExtwABH0Bu4TYszyxQ3QwEiW3nP//arMEdUFmrD722jFjG+hgBbU+
	Zak/VHBPCJJyXrub0icg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOQ8-000000036P1-3Pkh;
	Thu, 04 Apr 2024 14:50:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOQ5-000000036O0-0IHG
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 14:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BEF58CE3216;
	Thu,  4 Apr 2024 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F9FC433F1;
	Thu,  4 Apr 2024 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712242222;
	bh=VQUx7ZNJr+N98eBw1xzMeVGvFXgo+jkoTRgmOCAwOE4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=n0wFkrhEhxyXwYM/D+yQ+1V5xZlkTepbLy5I+Ab7HFMaEnUMIBSJETCFGdIfbQJV/
	 Zr5axTOD7PR/ub2PXGA1FIIZkcFYNwnDma3+yk+7BVY4cf6lJjh9APzsp11OqwLvBy
	 Tp4SMUi1fCtz4Fpj5NmnoxHE3rfCBt6b1CrE3B43p8Qf49KNNpepP6Q00t/hT90apX
	 V5AVmvF+J8hKrvv+3j9UT2mSSTBlqZtQ1olVwgBNk+oNiHIKGjQwURolDN+28oquh+
	 Oc53UJGxrEFs4t+e0WctgMoPUAjJKB1BktxRMRzylXdbrq7ROovVae1Bsw56LV36Qa
	 ZrRmX2qrXJHIQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9A912CE0D0C; Thu,  4 Apr 2024 07:50:21 -0700 (PDT)
Date: Thu, 4 Apr 2024 07:50:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC cmpxchg 8/8] riscv: Emulate one-byte and two-byte
 cmpxchg
Message-ID: <7bbf09e5-24d5-43fb-8b1f-d2d95c370cc8@paulmck-laptop>
References: <20240401213950.3910531-8-paulmck@kernel.org>
 <mhng-d6a8a972-5054-4c48-a903-5a53a31da9ad@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-d6a8a972-5054-4c48-a903-5a53a31da9ad@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_075025_512818_0E178CEB 
X-CRM114-Status: GOOD (  28.13  )
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

On Thu, Apr 04, 2024 at 07:15:40AM -0700, Palmer Dabbelt wrote:
> On Mon, 01 Apr 2024 14:39:50 PDT (-0700), paulmck@kernel.org wrote:
> > Use the new cmpxchg_emu_u8() and cmpxchg_emu_u16() to emulate one-byte
> > and two-byte cmpxchg() on riscv.
> > 
> > [ paulmck: Apply kernel test robot feedback. ]
> 
> I'm not entirely following the thread, but sounds like there's going to be
> generic kernel users of this now?  Before we'd said "no" to the byte/half
> atomic emulation routines beacuse they weren't used, but if it's a generic
> thing then I'm find adding them.

RCU currently contains an open-coded counterpart of the proposed
cmpxchg_emu_u8() function, so yes.  ;-)

> There's a patch set over here
> <https://lore.kernel.org/all/20240103163203.72768-2-leobras@redhat.com/>
> that implements these more directly using LR/SC.  I was sort of on the fence
> about just taking it even with no direct users right now, as the byte/half
> atomic extension is working its way through the spec process so we'll have
> them for real soon.  I stopped right there for the last merge window,
> though, as I figured it was too late to be messing with the atomics...

I would be extremely happy to drop my riscv patch in favor of an
architecture-specific implementation, especially a more-efficient
implementation.  ;-)

> So
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> if you guys want to take some sort of tree-wide change to make the byte/half
> stuff be required everywhere.  We'll eventually end up with arch routines
> for the extension, so at that point we might as well also have the more
> direct LR/SC flavors.
> 
> If you want I can go review/merge that RISC-V patch set and then it'll have
> time to bake for a shared tag you can pick up for all this stuff?  No rush
> on my end, just LMK.

That sounds very good!  I will apply your ack to my emulatino commit
in the meantime, so your schedule is my schedule.  And a big "thank
you!" for both!!!

							Thanx, Paul

> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: <linux-riscv@lists.infradead.org>
> > ---
> >  arch/riscv/Kconfig               |  1 +
> >  arch/riscv/include/asm/cmpxchg.h | 25 +++++++++++++++++++++++++
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index be09c8836d56b..4eaf40d0a52ec 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -44,6 +44,7 @@ config RISCV
> >  	select ARCH_HAS_UBSAN
> >  	select ARCH_HAS_VDSO_DATA
> >  	select ARCH_KEEP_MEMBLOCK if ACPI
> > +	select ARCH_NEED_CMPXCHG_1_2_EMU
> >  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> >  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> >  	select ARCH_STACKWALK
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index 2fee65cc84432..a5b377481785c 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/bug.h>
> > 
> >  #include <asm/fence.h>
> > +#include <linux/cmpxchg-emu.h>
> > 
> >  #define __xchg_relaxed(ptr, new, size)					\
> >  ({									\
> > @@ -170,6 +171,12 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		break;							\
> > +	case 2:								\
> > +		break;							\
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			"0:	lr.w %0, %2\n"				\
> > @@ -214,6 +221,12 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		break;							\
> > +	case 2:								\
> > +		break;							\
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			"0:	lr.w %0, %2\n"				\
> > @@ -260,6 +273,12 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		break;							\
> > +	case 2:								\
> > +		break;							\
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			RISCV_RELEASE_BARRIER				\
> > @@ -306,6 +325,12 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		break;							\
> > +	case 2:								\
> > +		break;							\
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			"0:	lr.w %0, %2\n"				\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
