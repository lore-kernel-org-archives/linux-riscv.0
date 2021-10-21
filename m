Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF7CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:53:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2DB60E05
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C2DB60E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpexnGsunTsKDTLQbWjBCvWiZZNTox9gLKJ8liM3j08=; b=YD6XPfVBt5Ilx0
	cAbhdNyA1USjuKrHg8f0EA3wyAV1MYxGv56cBmIbIF2zfZL8VTwehs8wzyOv9CzEZOJ7s4/hby0yv
	DTz5PLVlv8VqbaN+8RcWpSroPdjt6oMUUhhWT2PJH01pMW7//mVB2ictme3uwl3xLmQy36DYc3gql
	S3wLONbj9TWiT60xd67HfD300/LXkVyQaUVvXRBxcAej4CUOZlUgVsUnE3Vn4F6WDKK9lcZHZtQbW
	LYAsgl0Y6LC58F4S63uMQ2Ih2jjs6gKa9XHmT5ISfXzIyE0KsNsNy9go6+1NDCHury1yrOEX+Hoot
	ZbjKdMJv1mLQ9qWI6wdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdYVS-007jbn-Jk; Thu, 21 Oct 2021 13:53:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdYT4-007ijP-MB
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 13:50:52 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s136so377421pgs.4
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qytey+udWiVdufCAPeWRFbAbyJ7Ufn4LCZ4GQpnBXYw=;
 b=mBRSny8EkO3D6gtauzlwde9EZRNIuHUKBgf6Bsr6Ufm1sdJi/Qy+xBTJgUX/aaQaYM
 MvkQogp0AS981Zno8uEywNGhRDkjctnoOD4cPYT/a7I4nJShBFY0o7mYSMEckE1hr8qF
 zsN2FBLL2lygA2ZND8ndZh83+Wdye8GezReqFot5UxwKSJquwrPwjN8kC2y+RBxL6W6d
 JDxxcMnvXdy0De00DwhH+U4nU+4LCey7G0RQtnM3CmlqXO4Zsm1VMDlaBQ8G29ox5WtG
 s//DvcdC6HoXI7gcpEmIN1NRhque4EQi2pRDFwrqc6t7obOGXVMg8TkM1rD2B17N6ff/
 rhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qytey+udWiVdufCAPeWRFbAbyJ7Ufn4LCZ4GQpnBXYw=;
 b=N5+pRo74xwY9+y3u+RsVDr1EHo+MdWMDJzlb++1L/TyAP84Z9ThfE1aEVgZI4j6UC5
 wRM2igu42HrV+iJ9O9Hvo0gK3yeolSsIRzeKzl3Zv1FvC5xWsA7Z2RfIaLJJG2NiA0Fp
 r+ORbAUvY3tUOo0cdulrnCeoy+OVW0I1pt+IWhqtJv0jwzlEDKllG/7tFaf2RjXpAOdz
 Hmp8EgITZcFKF/29iJFh66q2HoLUYDukJ7oC03uOdhNmMheNHk2Pu22k9+RNuqLJg0cG
 PZWPTdtx1m1G7scL1Z1DjIMy7/vqLFo6KeV8qFQJxviUV168ce5uYBVyKacojnHVtA44
 1r5w==
X-Gm-Message-State: AOAM532w8oJPjmd62snjogIMHrtiaxbKfjwdDpMzCdxB0da7eqqOCYMJ
 StILKbyL+OHRqjT1ozKWOW0=
X-Google-Smtp-Source: ABdhPJz9dWOBj6dkGqRf3m2NMLz6LrJ/qXAuBE8GWTttrU0QU/cWUuyxKh5Uo/WvABgFQqryt+f0dA==
X-Received: by 2002:a63:7a19:: with SMTP id v25mr4497388pgc.402.1634824247142; 
 Thu, 21 Oct 2021 06:50:47 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id fv9sm9846379pjb.26.2021.10.21.06.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:50:46 -0700 (PDT)
Date: Thu, 21 Oct 2021 22:50:44 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <YXFwNJHHBydbZYtM@antec>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
 <YXFnOWTyVoae6h5P@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXFnOWTyVoae6h5P@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_065050_780623_E00ADFCF 
X-CRM114-Status: GOOD (  28.88  )
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

On Thu, Oct 21, 2021 at 03:12:25PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 21, 2021 at 03:05:15PM +0200, Peter Zijlstra wrote:
> > 
> > There's currently a number of architectures that want/have graduated
> > from test-and-set locks and are looking at qspinlock.
> > 
> > *HOWEVER* qspinlock is very complicated and requires a lot of an
> > architecture to actually work correctly. Specifically it requires
> > forward progress between a fair number of atomic primitives, including
> > an xchg16 operation, which I've seen a fair number of fundamentally
> > broken implementations of in the tree (specifically for qspinlock no
> > less).
> > 
> > The benefit of qspinlock over ticket lock is also non-obvious, esp.
> > at low contention (the vast majority of cases in the kernel), and it
> > takes a fairly large number of CPUs (typically also NUMA) to make
> > qspinlock beat ticket locks.
> > 
> > Esp. things like ARM64's WFE can move the balance a lot in favour of
> > simpler locks by reducing the cacheline pressure due to waiters (see
> > their smp_cond_load_acquire() implementation for details).
> > 
> > Unless you've audited qspinlock for your architecture and found it
> > sound *and* can show actual benefit, simpler is better.

For OpenRISC originally we had a custom ticket locking mechanism, but it was
suggested to use qspinlocks as the genric implementation meant less code.

Changed here:

	https://yhbt.net/lore/all/86vaix5fmr.fsf@arm.com/T/

I think moving to qspinlocks was suggested by you.  But now that we have this
generic infrastructure, I am good to switch.

> > Therefore provide ticket locks, which depend on a single atomic
> > operation (fetch_add) while still providing fairness.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  include/asm-generic/qspinlock.h         |   30 +++++++++
> >  include/asm-generic/ticket_lock_types.h |   11 +++
> >  include/asm-generic/ticket_lock.h       |   97 ++++++++++++++++++++++++++++++++
> >  3 files changed, 138 insertions(+)
> 
> A few notes...
> 
> > + * It relies on smp_store_release() + atomic_*_acquire() to be RCsc (or no
> > + * weaker than RCtso if you're Power, also see smp_mb__after_unlock_lock()),
> 
> This should hold true to RISC-V in its current form, AFAICT
> atomic_fetch_add ends up using AMOADD, and therefore the argument made
> in the unlock+lock thread [1], gives that this results in RW,RW
> ordering.
> 
> [1] https://lore.kernel.org/lkml/5412ab37-2979-5717-4951-6a61366df0f2@nvidia.com/
> 
> 
> I've compile tested on openrisc/simple_smp_defconfig using the below.
> 
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -30,7 +30,6 @@ config OPENRISC
>  	select HAVE_DEBUG_STACKOVERFLOW
>  	select OR1K_PIC
>  	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
> -	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select OMPIC if SMP
>  	select ARCH_WANT_FRAME_POINTERS
> --- a/arch/openrisc/include/asm/Kbuild
> +++ b/arch/openrisc/include/asm/Kbuild
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generic-y += extable.h
>  generic-y += kvm_para.h
> -generic-y += mcs_spinlock.h
> -generic-y += qspinlock_types.h
> -generic-y += qspinlock.h
> +generic-y += ticket_lock_types.h
> +generic-y += ticket_lock.h
>  generic-y += qrwlock_types.h
>  generic-y += qrwlock.h
>  generic-y += user.h
> --- a/arch/openrisc/include/asm/spinlock.h
> +++ b/arch/openrisc/include/asm/spinlock.h
> @@ -15,7 +15,7 @@
>  #ifndef __ASM_OPENRISC_SPINLOCK_H
>  #define __ASM_OPENRISC_SPINLOCK_H
>  
> -#include <asm/qspinlock.h>
> +#include <asm/ticket_lock.h>
>  
>  #include <asm/qrwlock.h>
>  
> --- a/arch/openrisc/include/asm/spinlock_types.h
> +++ b/arch/openrisc/include/asm/spinlock_types.h
> @@ -1,7 +1,7 @@
>  #ifndef _ASM_OPENRISC_SPINLOCK_TYPES_H
>  #define _ASM_OPENRISC_SPINLOCK_TYPES_H
>  
> -#include <asm/qspinlock_types.h>
> +#include <asm/ticket_lock_types.h>
>  #include <asm/qrwlock_types.h>
>  
>  #endif /* _ASM_OPENRISC_SPINLOCK_TYPES_H */

This looks good to me.  Do you want to commit along with the
generic ticket lock patch?  Otherwise I can queue it after it is
upstreamed.  Another option is I can help merge the generic ticket
lock code via the OpenRISC branch.

Let me know what works.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
