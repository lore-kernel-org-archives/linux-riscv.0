Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B02EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6631060EE5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6631060EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSIQnwqgD5zYm/GTKMOZc1QsI1J5sTEPqGenG3EhBlw=; b=ayEMGaTliu+O0f
	vkM0c5M8jbCDUGTqUPyX+NLp7uuEPdYJRqJVan1DJV8OGly6jftaWBty//CooKwt+3EQseJam0jD4
	ncHCJNFtwzuaByvPeyWZ89isKj+U7UL1di8MMiTxc6U/C/vp+ua2mEHQ6Ypm+/GF3QHyoP1B6f3Zu
	rRaa3cg7Uh9jjgkoZ7s/tIjWELGDCYwEDu811m3+AJo7OfaIbxa2gzQr7pfo7of4fzlurnZWYpQLZ
	YrYcxYNmR0eWSXXI7EH5QoOi+lhnAABXvYXGT/BcQKLpKyVM5GcsJY745RZ1GJMFJA8I86w/ulQ3R
	XiTT1klQIyuHg2tftBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXtY-007cVa-KV; Thu, 21 Oct 2021 13:14:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXtX-007cV2-O4
 for linux-riscv@bombadil.infradead.org; Thu, 21 Oct 2021 13:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8oC+9/7d65CDd50X9ejYe0EZ6JvFYMshxTkIPVHIbY0=; b=bxvnNifaB9+92fSCQJL0ZPvnlF
 wGT2hT5DDng9WpFi0vuH6xH7nQ7TnR2GyKSBQTb6GGDD9CooVaLx/khTsdZXEp+T4Fh5OmQMgmUAt
 GJ6OBZH+kLWzDUDK0Zv0eS58cPVdhkNdBUFxpUBlZ8hdrULXWBtgGPSVOUW0w3elHz/8Dp7K7wi4I
 CeeN0jqtIr64QjBJEQGwbYwU/09/KtjbDdOUZ6TrrB0BwhkJOYM10ivNS0kYOfDx5PbxDjV7JIXUT
 wpigHAczK8ggJr6JCgM8i9kimOVTxlVMJGfeJWvVaxwJdF70N9dDpuLcEtOHnajx18AaPtJvevCeG
 myDeok7g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXru-00DHjS-R9; Thu, 21 Oct 2021 13:12:41 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E93FE3002BC;
 Thu, 21 Oct 2021 15:12:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CE0FC2BD29975; Thu, 21 Oct 2021 15:12:25 +0200 (CEST)
Date: Thu, 21 Oct 2021 15:12:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <YXFnOWTyVoae6h5P@hirez.programming.kicks-ass.net>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
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

On Thu, Oct 21, 2021 at 03:05:15PM +0200, Peter Zijlstra wrote:
> 
> There's currently a number of architectures that want/have graduated
> from test-and-set locks and are looking at qspinlock.
> 
> *HOWEVER* qspinlock is very complicated and requires a lot of an
> architecture to actually work correctly. Specifically it requires
> forward progress between a fair number of atomic primitives, including
> an xchg16 operation, which I've seen a fair number of fundamentally
> broken implementations of in the tree (specifically for qspinlock no
> less).
> 
> The benefit of qspinlock over ticket lock is also non-obvious, esp.
> at low contention (the vast majority of cases in the kernel), and it
> takes a fairly large number of CPUs (typically also NUMA) to make
> qspinlock beat ticket locks.
> 
> Esp. things like ARM64's WFE can move the balance a lot in favour of
> simpler locks by reducing the cacheline pressure due to waiters (see
> their smp_cond_load_acquire() implementation for details).
> 
> Unless you've audited qspinlock for your architecture and found it
> sound *and* can show actual benefit, simpler is better.
> 
> Therefore provide ticket locks, which depend on a single atomic
> operation (fetch_add) while still providing fairness.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/asm-generic/qspinlock.h         |   30 +++++++++
>  include/asm-generic/ticket_lock_types.h |   11 +++
>  include/asm-generic/ticket_lock.h       |   97 ++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)

A few notes...

> + * It relies on smp_store_release() + atomic_*_acquire() to be RCsc (or no
> + * weaker than RCtso if you're Power, also see smp_mb__after_unlock_lock()),

This should hold true to RISC-V in its current form, AFAICT
atomic_fetch_add ends up using AMOADD, and therefore the argument made
in the unlock+lock thread [1], gives that this results in RW,RW
ordering.

[1] https://lore.kernel.org/lkml/5412ab37-2979-5717-4951-6a61366df0f2@nvidia.com/


I've compile tested on openrisc/simple_smp_defconfig using the below.

--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -30,7 +30,6 @@ config OPENRISC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select OR1K_PIC
 	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
-	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_RWLOCKS
 	select OMPIC if SMP
 	select ARCH_WANT_FRAME_POINTERS
--- a/arch/openrisc/include/asm/Kbuild
+++ b/arch/openrisc/include/asm/Kbuild
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += extable.h
 generic-y += kvm_para.h
-generic-y += mcs_spinlock.h
-generic-y += qspinlock_types.h
-generic-y += qspinlock.h
+generic-y += ticket_lock_types.h
+generic-y += ticket_lock.h
 generic-y += qrwlock_types.h
 generic-y += qrwlock.h
 generic-y += user.h
--- a/arch/openrisc/include/asm/spinlock.h
+++ b/arch/openrisc/include/asm/spinlock.h
@@ -15,7 +15,7 @@
 #ifndef __ASM_OPENRISC_SPINLOCK_H
 #define __ASM_OPENRISC_SPINLOCK_H
 
-#include <asm/qspinlock.h>
+#include <asm/ticket_lock.h>
 
 #include <asm/qrwlock.h>
 
--- a/arch/openrisc/include/asm/spinlock_types.h
+++ b/arch/openrisc/include/asm/spinlock_types.h
@@ -1,7 +1,7 @@
 #ifndef _ASM_OPENRISC_SPINLOCK_TYPES_H
 #define _ASM_OPENRISC_SPINLOCK_TYPES_H
 
-#include <asm/qspinlock_types.h>
+#include <asm/ticket_lock_types.h>
 #include <asm/qrwlock_types.h>
 
 #endif /* _ASM_OPENRISC_SPINLOCK_TYPES_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
