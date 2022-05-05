Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDD3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hA7P3hUQgTAZwj72gOlJ0aIfMY0GW1xEipaCylDr1YQ=; b=DHKpdNH3WwgI/w
	Mlx8n85cGsYaRhYIPKAFzNtnEKlew4UkTvqurJ2SjBt90lkt87yy7v10tHtyiEhrQJvzwVVc/KsP+
	TNyt+3XG2007nKIlPSJo4rD3tuwus3VMS9meDT88qt9/AjEEVuuqDuQIG8Zo51jDoGlp10nhuhztf
	ydnOKrZpgPuol42rJzj90BuFECbIY6ospKrISUBguxByP6vkqUTUt8xlxHaAYFFASzFWDB/YcXnzu
	pwT0cpBsqzvAFP7nF2fCGUe5XKs7YzxRL05H9RaVR7/vEEty5nVFbMl53YulzKfPzPu43KJv1/A8c
	aZai1GrGyFpfWZYrRJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSav-00Dqw9-EF; Thu, 05 May 2022 03:56:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSas-00DqtT-35
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:56:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93990619F4;
 Thu,  5 May 2022 03:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5986C385A4;
 Thu,  5 May 2022 03:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722957;
 bh=0v6ObbrAdmPbTrFO/udpzX7A+GrHtoKSTX5QoRJ+xrA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KzIXWQco6g6JV4dAzlbltsr8V0oE5Qyj1Gc26OCZMCNCGGJ+cFiIeTTGy4/eLO2DE
 lcnuNQ20LKvW7zSZi7AbgLKoaKUebZUyRJrw7kxHGsiltA1VhQPM0E0F7jyp2zQ12z
 OCIq4bJhp3m429WQ2cAncxwSrK3MyqpCBui+UTlGY5ClQ9/3GUS60lbnoWw5vG37SS
 DU3Y1PF8yFehqzGlux2/tk2Qn3aWXbLP747AoY8VZt5YLw1miSgQxc3h2sON9rh0QW
 REewB/mS+qdxDlTPoyyN59gYi/M3sMqCHMgREHQomdhDwYpQ7U3qfP5oIxj6Gr30Ia
 76Tak31K+CMpg==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 4/5] riscv: atomic: Optimize atomic_ops & xchg with .aq/rl
 annotation
Date: Thu,  5 May 2022 11:55:25 +0800
Message-Id: <20220505035526.2974382-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505035526.2974382-1-guoren@kernel.org>
References: <20220505035526.2974382-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_205558_279932_37AB2870 
X-CRM114-Status: GOOD (  13.09  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Current atomic_ops' acquire & release implementations are using
fence instruction which causes another extra bad "fence r/fence
,w" performance effect. They are too heavy for Linux atomic
acquire & release semantic requirements. RISC-V AMO instructions
could embed aquire and release into AMO instructions. Here is the
related description from RISC-V ISA spec:

To help implement multiprocessor synchronization, the AMOs
optionally provide release consistency semantics.
 - .aq:   If the aq bit is set, then no later memory operations
          in this RISC-V hart can be observed to take place
          before the AMO.
 - .rl:   If the rl bit is set, then other RISC-V harts will not
          observe the AMO before memory accesses preceding the
          AMO in this RISC-V hart.
 - .aqrl: Setting both the aq and the rl bit on an AMO makes the
          sequence sequentially consistent, meaning that it cannot
          be reordered with earlier or later memory operations
          from the same hart.

Let's use the above to optimize riscv atomic performance, just
like arm64/include/asm/atomic_lse.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrea Parri <parri.andrea@gmail.com>
Cc: Dan Lustig <dlustig@nvidia.com>
---
 arch/riscv/include/asm/atomic.h  | 64 ++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 12 ++----
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 0dfe9d857a76..34f757dfc8f2 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -99,6 +99,30 @@ c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
 	return ret;							\
 }									\
 static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_acquire(c_type i,		\
+					     atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type ".aq %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_release(c_type i,		\
+					     atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type ".rl %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
 {									\
 	register c_type ret;						\
@@ -118,6 +142,18 @@ c_type arch_atomic##prefix##_##op##_return_relaxed(c_type i,		\
         return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;	\
 }									\
 static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_acquire(c_type i,		\
+					      atomic##prefix##_t *v)	\
+{									\
+        return arch_atomic##prefix##_fetch_##op##_acquire(i, v) c_op I;	\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_release(c_type i,		\
+					      atomic##prefix##_t *v)	\
+{									\
+        return arch_atomic##prefix##_fetch_##op##_release(i, v) c_op I;	\
+}									\
+static __always_inline							\
 c_type arch_atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)	\
 {									\
         return arch_atomic##prefix##_fetch_##op(i, v) c_op I;		\
@@ -140,22 +176,38 @@ ATOMIC_OPS(sub, add, +, -i)
 
 #define arch_atomic_add_return_relaxed	arch_atomic_add_return_relaxed
 #define arch_atomic_sub_return_relaxed	arch_atomic_sub_return_relaxed
+#define arch_atomic_add_return_acquire	arch_atomic_add_return_acquire
+#define arch_atomic_sub_return_acquire	arch_atomic_sub_return_acquire
+#define arch_atomic_add_return_release	arch_atomic_add_return_release
+#define arch_atomic_sub_return_release	arch_atomic_sub_return_release
 #define arch_atomic_add_return		arch_atomic_add_return
 #define arch_atomic_sub_return		arch_atomic_sub_return
 
 #define arch_atomic_fetch_add_relaxed	arch_atomic_fetch_add_relaxed
 #define arch_atomic_fetch_sub_relaxed	arch_atomic_fetch_sub_relaxed
+#define arch_atomic_fetch_add_acquire	arch_atomic_fetch_add_acquire
+#define arch_atomic_fetch_sub_acquire	arch_atomic_fetch_sub_acquire
+#define arch_atomic_fetch_add_release	arch_atomic_fetch_add_release
+#define arch_atomic_fetch_sub_release	arch_atomic_fetch_sub_release
 #define arch_atomic_fetch_add		arch_atomic_fetch_add
 #define arch_atomic_fetch_sub		arch_atomic_fetch_sub
 
 #ifndef CONFIG_GENERIC_ATOMIC64
 #define arch_atomic64_add_return_relaxed	arch_atomic64_add_return_relaxed
 #define arch_atomic64_sub_return_relaxed	arch_atomic64_sub_return_relaxed
+#define arch_atomic64_add_return_acquire	arch_atomic64_add_return_acquire
+#define arch_atomic64_sub_return_acquire	arch_atomic64_sub_return_acquire
+#define arch_atomic64_add_return_release	arch_atomic64_add_return_release
+#define arch_atomic64_sub_return_release	arch_atomic64_sub_return_release
 #define arch_atomic64_add_return		arch_atomic64_add_return
 #define arch_atomic64_sub_return		arch_atomic64_sub_return
 
 #define arch_atomic64_fetch_add_relaxed	arch_atomic64_fetch_add_relaxed
 #define arch_atomic64_fetch_sub_relaxed	arch_atomic64_fetch_sub_relaxed
+#define arch_atomic64_fetch_add_acquire	arch_atomic64_fetch_add_acquire
+#define arch_atomic64_fetch_sub_acquire	arch_atomic64_fetch_sub_acquire
+#define arch_atomic64_fetch_add_release	arch_atomic64_fetch_add_release
+#define arch_atomic64_fetch_sub_release	arch_atomic64_fetch_sub_release
 #define arch_atomic64_fetch_add		arch_atomic64_fetch_add
 #define arch_atomic64_fetch_sub		arch_atomic64_fetch_sub
 #endif
@@ -178,6 +230,12 @@ ATOMIC_OPS(xor, xor, i)
 #define arch_atomic_fetch_and_relaxed	arch_atomic_fetch_and_relaxed
 #define arch_atomic_fetch_or_relaxed	arch_atomic_fetch_or_relaxed
 #define arch_atomic_fetch_xor_relaxed	arch_atomic_fetch_xor_relaxed
+#define arch_atomic_fetch_and_acquire	arch_atomic_fetch_and_acquire
+#define arch_atomic_fetch_or_acquire	arch_atomic_fetch_or_acquire
+#define arch_atomic_fetch_xor_acquire	arch_atomic_fetch_xor_acquire
+#define arch_atomic_fetch_and_release	arch_atomic_fetch_and_release
+#define arch_atomic_fetch_or_release	arch_atomic_fetch_or_release
+#define arch_atomic_fetch_xor_release	arch_atomic_fetch_xor_release
 #define arch_atomic_fetch_and		arch_atomic_fetch_and
 #define arch_atomic_fetch_or		arch_atomic_fetch_or
 #define arch_atomic_fetch_xor		arch_atomic_fetch_xor
@@ -186,6 +244,12 @@ ATOMIC_OPS(xor, xor, i)
 #define arch_atomic64_fetch_and_relaxed	arch_atomic64_fetch_and_relaxed
 #define arch_atomic64_fetch_or_relaxed	arch_atomic64_fetch_or_relaxed
 #define arch_atomic64_fetch_xor_relaxed	arch_atomic64_fetch_xor_relaxed
+#define arch_atomic64_fetch_and_acquire	arch_atomic64_fetch_and_acquire
+#define arch_atomic64_fetch_or_acquire	arch_atomic64_fetch_or_acquire
+#define arch_atomic64_fetch_xor_acquire	arch_atomic64_fetch_xor_acquire
+#define arch_atomic64_fetch_and_release	arch_atomic64_fetch_and_release
+#define arch_atomic64_fetch_or_release	arch_atomic64_fetch_or_release
+#define arch_atomic64_fetch_xor_release	arch_atomic64_fetch_xor_release
 #define arch_atomic64_fetch_and		arch_atomic64_fetch_and
 #define arch_atomic64_fetch_or		arch_atomic64_fetch_or
 #define arch_atomic64_fetch_xor		arch_atomic64_fetch_xor
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e5..1af8db92250b 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -52,16 +52,14 @@
 	switch (size) {							\
 	case 4:								\
 		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
+			"	amoswap.w.aq %0, %2, %1\n"		\
 			: "=r" (__ret), "+A" (*__ptr)			\
 			: "r" (__new)					\
 			: "memory");					\
 		break;							\
 	case 8:								\
 		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
+			"	amoswap.d.aq %0, %2, %1\n"		\
 			: "=r" (__ret), "+A" (*__ptr)			\
 			: "r" (__new)					\
 			: "memory");					\
@@ -87,16 +85,14 @@
 	switch (size) {							\
 	case 4:								\
 		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.w %0, %2, %1\n"			\
+			"	amoswap.w.rl %0, %2, %1\n"		\
 			: "=r" (__ret), "+A" (*__ptr)			\
 			: "r" (__new)					\
 			: "memory");					\
 		break;							\
 	case 8:								\
 		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.d %0, %2, %1\n"			\
+			"	amoswap.d.rl %0, %2, %1\n"		\
 			: "=r" (__ret), "+A" (*__ptr)			\
 			: "r" (__new)					\
 			: "memory");					\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
