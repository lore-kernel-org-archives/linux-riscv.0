Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703DEC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkDVlLwVxlNCFWxgcvatk2ZJ3hr44xb+Shk7D0M8uNY=; b=umpjG7h4SulA4R
	VA6IKas+yrEvkpuZIRjq1igUehj0juAqM0fByJ6whn2XvWV7JaS5tsX5jrGx4sdm8qdvLtRVMLgmQ
	UeC3L/6NZP3TZu/VhuqAGZesvf0P9+8WPUEEOSss7lHw6WQ5FVD/3s+qsWUeqJW7DQADgweiw5AV/
	V9pcEQzzaLGhtcLseEnzPl5hns8aLVPv6VGDd9sdBfOk90/4O4b2zZ8CWLflEH/r5SK/Fo2ebboMB
	m73a2QSJ1JXIAthJB4HhGN+1anFSW1AqvMusgPI3zV38gHvQxo+XMiPFHO1wHTXVn5whyA41kgRwP
	6fbIELsUA9+iOIzWH5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nK-00Bkc6-1k;
	Sun, 12 Nov 2023 06:18:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nG-00BkYs-2P
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2F16FB80A07;
	Sun, 12 Nov 2023 06:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDC5C433C7;
	Sun, 12 Nov 2023 06:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769880;
	bh=nL7iDuDhY95l52l/CjM7hbY+3m/GNRO3MBYY0dX3WHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DPbNX3VW6Wt4eQeItvPkn01OM6G1EIx3FnWK8VeBrKuI9rgxBaf5VRbXsrchYPGct
	 LSLCVQkzLfG8/4xG035kAhK9C685tNhXpTe0magt/gSOZrI5LWkGvfePLULoH6tSMI
	 Y53CCQfyFMMYdLTYovZ547xGxNYgAMInBnTzn/bNzBvA/aF9KAsmsgJO10b/EOmjfc
	 WU558dZUZSvVwa7pOR3JvsfGhrdVKMmXZIGbGsJu6AW6oFFsaWyHyuM9OXzMUevdyW
	 8I+ZWWe6tBeA3ORoOl3R+QgfFlnrOfOSEORIJqU3IjnHERzrwMiQw6e86KPzhjxeDl
	 vEBZJfJsIx+BQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 25/38] riscv: s64ilp32: Implement cmpxchg_double
Date: Sun, 12 Nov 2023 01:15:01 -0500
Message-Id: <20231112061514.2306187-26-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221803_072201_A3CB37A0 
X-CRM114-Status: GOOD (  11.46  )
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

The s64ilp32 has the ability to exclusively load and store (ld/sd)
a pair of words from an address. Then the SLUB can take advantage
of a cmpxchg_double implementation to avoid taking some locks.

This patch provides an implementation of cmpxchg_double for 64-bit
pairs, and activates the logic required for the SLUB to use these
functions (HAVE_ALIGNED_STRUCT_PAGE and HAVE_CMPXCHG_DOUBLE).

Similar commit: 5284e1b4bc8a ("arm64: xchg: Implement
cmpxchg_double")

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig               |  2 ++
 arch/riscv/include/asm/cmpxchg.h | 53 ++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a45e31ef3b2c..57b98f1990b3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -86,6 +86,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE if SLUB && ARCH_RV64ILP32
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
@@ -105,6 +106,7 @@ config RISCV
 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_DOUBLE if ARCH_RV64ILP32
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2f4726d3cfcc..9f48a1da1c0a 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_CMPXCHG_H
 
 #include <linux/bug.h>
+#include <linux/mmdebug.h>
 
 #include <asm/barrier.h>
 #include <asm/fence.h>
@@ -360,4 +361,56 @@
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
 
+#ifdef CONFIG_ARCH_RV64ILP32
+#define system_has_cmpxchg_double()	1
+
+#define __cmpxchg_double_check(ptr1, ptr2)				\
+({									\
+	if (sizeof(*(ptr1)) != 4)					\
+		BUILD_BUG();						\
+	if (sizeof(*(ptr2)) != 4)					\
+		BUILD_BUG();						\
+	VM_BUG_ON((ulong *)(ptr2) - (ulong *)(ptr1) != 1);		\
+	VM_BUG_ON(((ulong)ptr1 & 0x7) != 0);				\
+})
+
+#define __cmpxchg_double(old1, old2, new1, new2, ptr)			\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	register unsigned int __ret;					\
+	u64 __old;							\
+	u64 __new;							\
+	u64 __tmp;							\
+	switch (sizeof(*(ptr))) {					\
+	case 4:								\
+		__old = ((u64)old2 << 32) | (u64)old1;			\
+		__new = ((u64)new2 << 32) | (u64)new1;			\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__tmp), "=&r" (__ret), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		__ret = (__old == __tmp);				\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	__ret;								\
+})
+
+#define arch_cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)			\
+({									\
+	int __ret;							\
+	__cmpxchg_double_check(ptr1, ptr2);				\
+	__ret = __cmpxchg_double((ulong)(o1), (ulong)(o2),		\
+				 (ulong)(n1), (ulong)(n2),		\
+				  ptr1);				\
+	__ret;								\
+})
+#endif
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
