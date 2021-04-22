Return-Path: <SRS0=CVeS=JT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6644CC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 11:00:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC611613C9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 11:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC611613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9UbPnWl4RxQGhqqOE1MzKBFpTgVXaz42sL/idHnDwus=; b=HRG1gAwuJ+LK/W0HKMG4p48IX
	CQ19feouX/rLGbQk6BTt0V4NXrfZn4KZcvgMkQtpdu9ddOvDRwdzEu5UDsOx2Pi79bFGDgCSJZ9nb
	JL+ieFUuwTdyCKWgSbUfLqcoP4rSoJ2a6yukc8elWcNQfe6c71dNn4iVH39KkkZ5nl/5P3ULZ5aBm
	9DQ7kJpA6Fl/gRgeAhAPtt58AGjLEzFt84GOlSIzfECBgN0adfGIf60CFygz6+Ge39I7uPqB9suWA
	AbX1KR5RzEnX10hegPQ6Pi/sFnYQlq/8ldezpXJakz2n5ztOsYt5UxKnZwFiFGHfF1jVzm5pDGOdS
	+LZILMfXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZX3u-00GY5K-Qf; Thu, 22 Apr 2021 11:00:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZX3r-00GY51-2u
 for linux-riscv@desiato.infradead.org; Thu, 22 Apr 2021 10:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=az5FWo1I3N+PY1Ff9g7Obmb8SK5nOWAqs4dHbfKOGBs=; b=4eyAXhYwT0U9Jx919sfGVez5BB
 PLBnnOmfzw5CKBkT577neOLdKsHzgObEVC4u0Qo/UY5qRk75vYbJAjUZHI2c4YH5X0IP4fkYfCih7
 E1Tgkmhl0KftPn9UfwtpFqko+Ixo3hIKrN6oroKCJwl1W3ObRqIVoz32v8kjoQfpk9sSQwrASAOyv
 ToCnUxwWnkNWrzbrkYQl8dg18XtkCwIqyZ3GkcIYnVbxQU2ytm3jn6wYyWzeDJ06c/mEyPfXorqo1
 GhftADWvM6Lz5Fl5tDJrx4YMts9/h+Oxx2BbNOVt5aT0w7B97Hpli06r+jISJDYsXDusJAI0hMMmM
 VVFSLTPA==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lZX3n-00Db6U-Jz
 for linux-riscv@lists.infradead.org; Thu, 22 Apr 2021 10:59:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE2311FB;
 Thu, 22 Apr 2021 03:59:49 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.22.241])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D918E3F774;
 Thu, 22 Apr 2021 03:59:47 -0700 (PDT)
Date: Thu, 22 Apr 2021 11:59:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] asm-generic: atomic64: handle ARCH_ATOMIC builds (was "Re:
 [PATCH v3 1/2] locking/atomics: Fixup GENERIC_ATOMIC64 conflict") with
 atomic-arch-fallback.h
Message-ID: <20210422105945.GB62037@C02TD0UTHF1T.local>
References: <1619009626-93453-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619009626-93453-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_035951_784676_27CD4B99 
X-CRM114-Status: GOOD (  23.58  )
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

Hi Guo,

On Wed, Apr 21, 2021 at 12:53:45PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Current GENERIC_ATOMIC64 in atomic-arch-fallback.h is broken. When a 32-bit
> arch use atomic-arch-fallback.h will cause compile error.
> 
> In file included from include/linux/atomic.h:81,
>                     from include/linux/rcupdate.h:25,
>                     from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from arch/riscv/kernel/asm-offsets.c:10:
>    include/linux/atomic-arch-fallback.h: In function 'arch_atomic64_inc':
> >> include/linux/atomic-arch-fallback.h:1447:2: error: implicit declaration of function 'arch_atomic64_add'; did you mean 'arch_atomic_add'? [-Werror=implicit-function-declaration]
>     1447 |  arch_atomic64_add(1, v);
>          |  ^~~~~~~~~~~~~~~~~
>          |  arch_atomic_add

This is expected; GENERIC_ATOMIC64 doesn't implement arch_atomic64_*(),
and thus violates the expectations of the fallback code.

To make GENERIC_ATOMIC64 compatible with ARCH_ATOMIC, the
GENERIC_ATOMIC64 implementation *must* provide arch_atomic64_*()
functions.

> The atomic-arch-fallback.h & atomic-fallback.h &
> atomic-instrumented.h are generated by gen-atomic-fallback.sh &
> gen-atomic-instrumented.sh, so just take care the bash files.
> 
> Remove the dependency of atomic-*-fallback.h in atomic64.h.

Please don't duplicate the fallbacks; this'll make it harder to move
other over and eventually remove the non-ARCH_ATOMIC implementations.

Does the patch below make things work for you, or have I missed
something?

I've given this a basic build test on an arm config using
GENERIC_ATOMIC64 (but not ARCH_ATOMIC).

Thanks,
Mark.
---->8----
From 7f0389c8a1f41ecb5b2700f6ba38ff2ba093eb33 Mon Sep 17 00:00:00 2001
From: Mark Rutland <mark.rutland@arm.com>
Date: Thu, 22 Apr 2021 11:26:04 +0100
Subject: [PATCH] asm-generic: atomic64: handle ARCH_ATOMIC builds

We'd like all architectures to convert to ARCH_ATOMIC, as this will
enable functionality, and once all architectures are converted it will
be possible to make significant cleanups to the atomic headers.

A number of architectures use GENERIC_ATOMIC64, and it's impractical to
convert them all in one go. To make it possible to convert them
one-by-one, let's make the GENERIC_ATOMIC64 implementation function as
either atomic64_*() or arch_atomic64_*() depending on whether
ARCH_ATOMIC is selected. To do this, the C implementations are prefixed
as generic_atomic64_*(), and the asm-generic/atomic64.h header maps
atomic64_*()/arch_atomic64_*() onto these as appropriate via teh
preprocessor.

Once all users are moved over to ARCH_ATOMIC the ifdeffery in the header
can be simplified and/or removed entirely.

For existing users (none of which select ARCH_ATOMIC), there should be
no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 include/asm-generic/atomic64.h | 74 ++++++++++++++++++++++++++++++++++--------
 lib/atomic64.c                 | 36 ++++++++++----------
 2 files changed, 79 insertions(+), 31 deletions(-)

diff --git a/include/asm-generic/atomic64.h b/include/asm-generic/atomic64.h
index 370f01d4450f..45c7ff8c9477 100644
--- a/include/asm-generic/atomic64.h
+++ b/include/asm-generic/atomic64.h
@@ -15,19 +15,17 @@ typedef struct {
 
 #define ATOMIC64_INIT(i)	{ (i) }
 
-extern s64 atomic64_read(const atomic64_t *v);
-extern void atomic64_set(atomic64_t *v, s64 i);
-
-#define atomic64_set_release(v, i)	atomic64_set((v), (i))
+extern s64 generic_atomic64_read(const atomic64_t *v);
+extern void generic_atomic64_set(atomic64_t *v, s64 i);
 
 #define ATOMIC64_OP(op)							\
-extern void	 atomic64_##op(s64 a, atomic64_t *v);
+extern void generic_atomic64_##op(s64 a, atomic64_t *v);
 
 #define ATOMIC64_OP_RETURN(op)						\
-extern s64 atomic64_##op##_return(s64 a, atomic64_t *v);
+extern s64 generic_atomic64_##op##_return(s64 a, atomic64_t *v);
 
 #define ATOMIC64_FETCH_OP(op)						\
-extern s64 atomic64_fetch_##op(s64 a, atomic64_t *v);
+extern s64 generic_atomic64_fetch_##op(s64 a, atomic64_t *v);
 
 #define ATOMIC64_OPS(op)	ATOMIC64_OP(op) ATOMIC64_OP_RETURN(op) ATOMIC64_FETCH_OP(op)
 
@@ -46,11 +44,61 @@ ATOMIC64_OPS(xor)
 #undef ATOMIC64_OP_RETURN
 #undef ATOMIC64_OP
 
-extern s64 atomic64_dec_if_positive(atomic64_t *v);
-#define atomic64_dec_if_positive atomic64_dec_if_positive
-extern s64 atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n);
-extern s64 atomic64_xchg(atomic64_t *v, s64 new);
-extern s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u);
-#define atomic64_fetch_add_unless atomic64_fetch_add_unless
+extern s64 generic_atomic64_dec_if_positive(atomic64_t *v);
+extern s64 generic_atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n);
+extern s64 generic_atomic64_xchg(atomic64_t *v, s64 new);
+extern s64 generic_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u);
+
+#ifdef ARCH_ATOMIC
+
+#define arch_atomic64_read		generic_atomic64_read
+#define arch_atomic64_set		generic_atomic64_set
+#define arch_atomic64_set_release	generic_atomic64_set
+
+#define	arch_atomic64_add		generic_atomic64_add
+#define	arch_atomic64_add_return	generic_atomic64_add_return
+#define	arch_atomic64_fetch_add		generic_atomic64_fetch_add
+#define	arch_atomic64_sub		generic_atomic64_sub
+#define	arch_atomic64_sub_return	generic_atomic64_sub_return
+#define	arch_atomic64_fetch_sub		generic_atomic64_fetch_sub
+
+#define	arch_atomic64_and		generic_atomic64_and
+#define	arch_atomic64_fetch_and		generic_atomic64_fetch_and
+#define	arch_atomic64_or		generic_atomic64_or
+#define	arch_atomic64_fetch_or		generic_atomic64_fetch_or
+#define	arch_atomic64_xor		generic_atomic64_xor
+#define	arch_atomic64_fetch_xor		generic_atomic64_fetch_xor
+
+#define arch_atomic64_dec_if_positive 	generic_atomic64_dec_if_positive
+#define arch_atomic64_cmpxchg	 	generic_atomic64_cmpxchg
+#define arch_atomic64_xchg	 	generic_atomic64_xchg
+#define arch_atomic64_fetch_add_unless	generic_atomic64_fetch_add_unless
+
+#else /* ARCH_ATOMIC */
+
+#define atomic64_read			generic_atomic64_read
+#define atomic64_set			generic_atomic64_set
+#define atomic64_set_release		generic_atomic64_set
+
+#define	atomic64_add			generic_atomic64_add
+#define	atomic64_add_return		generic_atomic64_add_return
+#define	atomic64_fetch_add		generic_atomic64_fetch_add
+#define	atomic64_sub			generic_atomic64_sub
+#define	atomic64_sub_return		generic_atomic64_sub_return
+#define	atomic64_fetch_sub		generic_atomic64_fetch_sub
+
+#define	atomic64_and			generic_atomic64_and
+#define	atomic64_fetch_and		generic_atomic64_fetch_and
+#define	atomic64_or			generic_atomic64_or
+#define	atomic64_fetch_or		generic_atomic64_fetch_or
+#define	atomic64_xor			generic_atomic64_xor
+#define	atomic64_fetch_xor		generic_atomic64_fetch_xor
+
+#define atomic64_dec_if_positive 	generic_atomic64_dec_if_positive
+#define atomic64_cmpxchg	 	generic_atomic64_cmpxchg
+#define atomic64_xchg	 		generic_atomic64_xchg
+#define atomic64_fetch_add_unless	generic_atomic64_fetch_add_unless
+
+#endif /* ARCH_ATOMIC */
 
 #endif  /*  _ASM_GENERIC_ATOMIC64_H  */
diff --git a/lib/atomic64.c b/lib/atomic64.c
index e98c85a99787..3df653994177 100644
--- a/lib/atomic64.c
+++ b/lib/atomic64.c
@@ -42,7 +42,7 @@ static inline raw_spinlock_t *lock_addr(const atomic64_t *v)
 	return &atomic64_lock[addr & (NR_LOCKS - 1)].lock;
 }
 
-s64 atomic64_read(const atomic64_t *v)
+s64 generic_atomic64_read(const atomic64_t *v)
 {
 	unsigned long flags;
 	raw_spinlock_t *lock = lock_addr(v);
@@ -53,9 +53,9 @@ s64 atomic64_read(const atomic64_t *v)
 	raw_spin_unlock_irqrestore(lock, flags);
 	return val;
 }
-EXPORT_SYMBOL(atomic64_read);
+EXPORT_SYMBOL(generic_atomic64_read);
 
-void atomic64_set(atomic64_t *v, s64 i)
+void generic_atomic64_set(atomic64_t *v, s64 i)
 {
 	unsigned long flags;
 	raw_spinlock_t *lock = lock_addr(v);
@@ -64,10 +64,10 @@ void atomic64_set(atomic64_t *v, s64 i)
 	v->counter = i;
 	raw_spin_unlock_irqrestore(lock, flags);
 }
-EXPORT_SYMBOL(atomic64_set);
+EXPORT_SYMBOL(generic_atomic64_set);
 
 #define ATOMIC64_OP(op, c_op)						\
-void atomic64_##op(s64 a, atomic64_t *v)				\
+void generic_atomic64_##op(s64 a, atomic64_t *v)			\
 {									\
 	unsigned long flags;						\
 	raw_spinlock_t *lock = lock_addr(v);				\
@@ -76,10 +76,10 @@ void atomic64_##op(s64 a, atomic64_t *v)				\
 	v->counter c_op a;						\
 	raw_spin_unlock_irqrestore(lock, flags);			\
 }									\
-EXPORT_SYMBOL(atomic64_##op);
+EXPORT_SYMBOL(generic_atomic64_##op);
 
 #define ATOMIC64_OP_RETURN(op, c_op)					\
-s64 atomic64_##op##_return(s64 a, atomic64_t *v)			\
+s64 generic_atomic64_##op##_return(s64 a, atomic64_t *v)		\
 {									\
 	unsigned long flags;						\
 	raw_spinlock_t *lock = lock_addr(v);				\
@@ -90,10 +90,10 @@ s64 atomic64_##op##_return(s64 a, atomic64_t *v)			\
 	raw_spin_unlock_irqrestore(lock, flags);			\
 	return val;							\
 }									\
-EXPORT_SYMBOL(atomic64_##op##_return);
+EXPORT_SYMBOL(generic_atomic64_##op##_return);
 
 #define ATOMIC64_FETCH_OP(op, c_op)					\
-s64 atomic64_fetch_##op(s64 a, atomic64_t *v)				\
+s64 generic_atomic64_fetch_##op(s64 a, atomic64_t *v)			\
 {									\
 	unsigned long flags;						\
 	raw_spinlock_t *lock = lock_addr(v);				\
@@ -105,7 +105,7 @@ s64 atomic64_fetch_##op(s64 a, atomic64_t *v)				\
 	raw_spin_unlock_irqrestore(lock, flags);			\
 	return val;							\
 }									\
-EXPORT_SYMBOL(atomic64_fetch_##op);
+EXPORT_SYMBOL(generic_atomic64_fetch_##op);
 
 #define ATOMIC64_OPS(op, c_op)						\
 	ATOMIC64_OP(op, c_op)						\
@@ -130,7 +130,7 @@ ATOMIC64_OPS(xor, ^=)
 #undef ATOMIC64_OP_RETURN
 #undef ATOMIC64_OP
 
-s64 atomic64_dec_if_positive(atomic64_t *v)
+s64 generic_atomic64_dec_if_positive(atomic64_t *v)
 {
 	unsigned long flags;
 	raw_spinlock_t *lock = lock_addr(v);
@@ -143,9 +143,9 @@ s64 atomic64_dec_if_positive(atomic64_t *v)
 	raw_spin_unlock_irqrestore(lock, flags);
 	return val;
 }
-EXPORT_SYMBOL(atomic64_dec_if_positive);
+EXPORT_SYMBOL(generic_atomic64_dec_if_positive);
 
-s64 atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n)
+s64 generic_atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n)
 {
 	unsigned long flags;
 	raw_spinlock_t *lock = lock_addr(v);
@@ -158,9 +158,9 @@ s64 atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n)
 	raw_spin_unlock_irqrestore(lock, flags);
 	return val;
 }
-EXPORT_SYMBOL(atomic64_cmpxchg);
+EXPORT_SYMBOL(generic_atomic64_cmpxchg);
 
-s64 atomic64_xchg(atomic64_t *v, s64 new)
+s64 generic_atomic64_xchg(atomic64_t *v, s64 new)
 {
 	unsigned long flags;
 	raw_spinlock_t *lock = lock_addr(v);
@@ -172,9 +172,9 @@ s64 atomic64_xchg(atomic64_t *v, s64 new)
 	raw_spin_unlock_irqrestore(lock, flags);
 	return val;
 }
-EXPORT_SYMBOL(atomic64_xchg);
+EXPORT_SYMBOL(generic_atomic64_xchg);
 
-s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
+s64 generic_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
 {
 	unsigned long flags;
 	raw_spinlock_t *lock = lock_addr(v);
@@ -188,4 +188,4 @@ s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
 
 	return val;
 }
-EXPORT_SYMBOL(atomic64_fetch_add_unless);
+EXPORT_SYMBOL(generic_atomic64_fetch_add_unless);
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
