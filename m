Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF8C04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 06:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPf5oAv6cyEpT3dv8aSOJsu1cu0wjbEIGkuOagsYrWE=; b=FmM5Kjgbm+a4/a
	n8TEF5ZyvctEL3Q+yRMS9eYwWMPAAzHND7n54qNE/VkdRcjrzbGhdBNbqUPoj+aZqgV66klXeusQN
	KK2hUHOFOAm1NbjSs6zhsdlHm4zmgM7cmSPrnl93xteylqSxou/ZFSzawIFlSgLUwcpvXyYujgODN
	ufw/swzXUwjWfJb6TZaubT7Tg1ssHCvu0MtCVBeEQBraL+28fKD1WCbV5e5s8z3PyuKFO27J+WIAv
	RsGNqOmG7jJh1T6E+bazjFA2yO71TO/qXzbifPW/RBDleTJKoBVV1U6FuEdjwlxVoKipT2AlYi+up
	EuMvayKIFABXmscLqKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5gYt-00000007PkG-0b83;
	Sat, 11 May 2024 06:50:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5gYo-00000007PjV-42RQ
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 06:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D7788CE1B20;
	Sat, 11 May 2024 06:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270FEC2BD10;
	Sat, 11 May 2024 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715410219;
	bh=lblVBvZuddzuH51cR8bOvxbCQSkyGJaGFeuYszSiyVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGkVoDnUyxFEG56w7+HuB2jpgmBVaJMMe6Fv4rXtMdyTjoVePK7lwdsQN6/yRI4zC
	 fF4GtCGRoWEI/y6eom0/Wx6eUsQj02VA/s2biezFods6BpGUs3nhJn8hghTDmbwNyx
	 LI5kuaTCMtvLNluAbzC/eXJQ+BZlLiN2xA6BN0NeHkJWQZuJEwlDqqVELHU0Yo84nR
	 mH0ezWfY9CbT7B88ziN7GTsrLuyIc3kZSBaAfKUvy9oJKWFJvxcae0sh+qXNshrPJB
	 3sZ7Q/YFs+qD2RCS0xMjl2sTQMbMj+7st0WeeiDdKyGVu+CElQu48tpS9lXWUY4ioY
	 gMMhUwb5yMsSQ==
Date: Sat, 11 May 2024 02:50:13 -0400
From: Guo Ren <guoren@kernel.org>
To: Leonardo Bras <leobras@redhat.com>
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: Re: [PATCH RFC cmpxchg 8/8] riscv: Emulate one-byte and two-byte
 cmpxchg
Message-ID: <Zj8VJZmQC7hRzDdz@gmail.com>
References: <20240401213950.3910531-8-paulmck@kernel.org>
 <mhng-d6a8a972-5054-4c48-a903-5a53a31da9ad@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-d6a8a972-5054-4c48-a903-5a53a31da9ad@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_235023_391114_3BE272C2 
X-CRM114-Status: GOOD (  26.28  )
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
> 
> There's a patch set over here
> <https://lore.kernel.org/all/20240103163203.72768-2-leobras@redhat.com/>
> that implements these more directly using LR/SC.  I was sort of on the fence
> about just taking it even with no direct users right now, as the byte/half
> atomic extension is working its way through the spec process so we'll have
> them for real soon.  I stopped right there for the last merge window,
> though, as I figured it was too late to be messing with the atomics...
> 
> So
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
F.Y.I Leonardo Bras <leobras@redhat.com>

> 
> if you guys want to take some sort of tree-wide change to make the byte/half
> stuff be required everywhere.  We'll eventually end up with arch routines
> for the extension, so at that point we might as well also have the more
> direct LR/SC flavors.
> 
> If you want I can go review/merge that RISC-V patch set and then it'll have
> time to bake for a shared tag you can pick up for all this stuff?  No rush
> on my end, just LMK.
> 
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
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
