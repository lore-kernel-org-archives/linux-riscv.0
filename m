Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA420C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 20:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R0CbSF+w5F7cpL4irvfEE9iKyk3nci1c9ByLlX8egBY=; b=pCo7D+BWU6O/kR5dTSqfVjM8Ar
	36uxLIJVVoZ0ia+10T/IeGg4YAAbM558vhF2ApmUWrRUtUaz5w9ZCjP5SK7jzm1WAHo/HfeZHE3jn
	UrzALNHjDcSTVkkfo29zYpilL2dMUmqSNJ4UhPXJQbeSAx7KRZNe0ICIByumkPuH5b26U8RRWlanz
	Uq1IK6n7r7oNTyXdoEi+1h/h4ttFfeKTqz54M2vF38ho/wcQC3TBXHYMjRn1SB1gYprhTgAicPrN6
	IVl/pT5RQpvH9pK03W9phn/+xwp1TsBXwJbRQxEezcFXZfK7YRXebuECrzwOx5kTwYqcGF+jGzNfP
	3NiOY7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz8d-0000000AaZi-2IUR;
	Tue, 13 Feb 2024 20:12:19 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz8b-0000000AaYM-0AKe
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 20:12:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60492d6bfc0so63899137b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707855136; x=1708459936; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AFgYISl4Q1z3z0PFToQVU0sOsmnQCVQDgha0DxwrRnA=;
        b=mw/d5Z0XKMHOI9TWMb/opAwg/zK1CDKTrLnRNOcneOWkl43qbFPvmGTWLjqklaWHrn
         gQl9jOsq+IbXuplR32CAp85T8WbppsKPAcCZBqmijEaO5ulCeKdNq4T1XLB8BUTP7Xzp
         5kNNA3eacdGQ3Djf1iwKgri3TXtgLQmdevGF/XAQdQxB9VpE6RONd79WyXTzsonvIyBR
         axNV9y7M3EBR3fdeqv/1WNhZzn+AXKPXtRWIogENNgSvE/+hsKv3w5bd9cjURLQrFVJo
         u3GHAtV29fXmIQ8anKO7xKEd6UJrjl6rq8O9PVgwBIJcCqU9hkDVU0ckei00vyy02cHT
         C0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707855136; x=1708459936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFgYISl4Q1z3z0PFToQVU0sOsmnQCVQDgha0DxwrRnA=;
        b=oHJ/CK4Zz7kjjkLdsaebiI+1UQMEuD8D3idy3gZjPAevtQH0EOjCT0mt0j7jkue8N3
         dZV/Nha+PQrQ+w9fSlzw61uuk7Qw2aJc2MTIZlgujoGIMrhBpEzFQ2EK2lH8gDb5bSe6
         bYIg4eUn6sUPPqyPtZtK7H8GYrkZxBM3J7wXp6BuUnLGcWdqaG7g+AEww+tt9trawaK4
         w7caZWWJ4OCqMNv2fAmBW2E+UM/p9z9b2TLZBW4Lw12xB0yG8GQ/sDTwZPKCBifPa/C5
         pMH2KEwmT7YvjyIeVO//HmDGDZUurlS6Y+xEncf8+HOt783XeTy56lOMkxql39K6MLl7
         9pjQ==
X-Gm-Message-State: AOJu0YwdNS9rHBcFeH55lOlfHgKE7l6avkNImM+8qK4jwNDAjPv0PCYo
	kai4aZ5d9yN2UvDOB7537KbrQwNpUPTV8pND//GILh8xngGyUlV7sIzunOzllMQp2acFaestuMH
	dVfsnxV0CiR8IeobQIw==
X-Google-Smtp-Source: AGHT+IH6MkPF7ngl4VQzeXVPSdHYEQyrluY0n1dW93fSLORUrlZCgRncZdpYZL7kBNBTnstETaYUREEOrmXRjtmJ
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a0d:eac3:0:b0:5ff:b07b:fb83 with SMTP
 id t186-20020a0deac3000000b005ffb07bfb83mr74538ywe.4.1707855135937; Tue, 13
 Feb 2024 12:12:15 -0800 (PST)
Date: Tue, 13 Feb 2024 20:12:10 +0000
In-Reply-To: <20240213200923.2547570-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213200923.2547570-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213201210.2549488-1-ericchancf@google.com>
Subject: [PATCH v4 3/4] riscv/barrier: Consolidate fence definitions
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_121217_161858_21419DA5 
X-CRM114-Status: GOOD (  14.32  )
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

Disparate fence implementations are consolidated into fence.h.
Also introduce RISCV_FENCE_ASM to make fence macro more reusable.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
v3 -> v4: fix the form that can pass the checking of checkpatch.pl.
 arch/riscv/include/asm/atomic.h  |  8 ++------
 arch/riscv/include/asm/barrier.h |  3 +--
 arch/riscv/include/asm/cmpxchg.h |  1 -
 arch/riscv/include/asm/fence.h   | 10 +++++++---
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 31e6e2e7cc18..19050d13b6c1 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -17,13 +17,9 @@
 #endif

 #include <asm/cmpxchg.h>
-#include <asm/barrier.h>

-#define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
-
-#define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+#define __atomic_acquire_fence()	RISCV_FENCE(r, rw)
+#define __atomic_release_fence()	RISCV_FENCE(rw, r)

 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 4c49a8ff2c68..4f4743d7440d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -11,13 +11,12 @@
 #define _ASM_RISCV_BARRIER_H

 #ifndef __ASSEMBLY__
+#include <asm/fence.h>

 #define nop()		__asm__ __volatile__ ("nop")
 #define __nops(n)	".rept	" #n "\nnop\n.endr\n"
 #define nops(n)		__asm__ __volatile__ (__nops(n))

-#define RISCV_FENCE(p, s) \
-	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

 /* These barriers need to enforce ordering on both devices or memory. */
 #define __mb()		RISCV_FENCE(iorw,iorw)
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index a608e4d1a0a4..2fee65cc8443 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -8,7 +8,6 @@

 #include <linux/bug.h>

-#include <asm/barrier.h>
 #include <asm/fence.h>

 #define __xchg_relaxed(ptr, new, size)					\
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 6c26c44dfcd6..5b46f96a3ec8 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -1,10 +1,14 @@
 #ifndef _ASM_RISCV_FENCE_H
 #define _ASM_RISCV_FENCE_H

+#define RISCV_FENCE_ASM(p, s)		"\tfence " #p "," #s "\n"
+#define RISCV_FENCE(p, s) \
+	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
+
 #ifdef CONFIG_SMP
-#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
-#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
-#define RISCV_FULL_BARRIER		"\tfence rw, rw\n"
+#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r, rw)
+#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, r)
+#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw, rw)
 #else
 #define RISCV_ACQUIRE_BARRIER
 #define RISCV_RELEASE_BARRIER
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 42497d487a17..1c5c641075d2 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -47,10 +47,10 @@
  * sufficient to ensure this works sanely on controllers that support I/O
  * writes.
  */
-#define __io_pbr()	__asm__ __volatile__ ("fence io,i"  : : : "memory");
-#define __io_par(v)	__asm__ __volatile__ ("fence i,ior" : : : "memory");
-#define __io_pbw()	__asm__ __volatile__ ("fence iow,o" : : : "memory");
-#define __io_paw()	__asm__ __volatile__ ("fence o,io"  : : : "memory");
+#define __io_pbr()	RISCV_FENCE(io, i)
+#define __io_par(v)	RISCV_FENCE(i, ior)
+#define __io_pbw()	RISCV_FENCE(iow, o)
+#define __io_paw()	RISCV_FENCE(o, io)

 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 4c58ee7f95ec..06cadfd7a237 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -12,6 +12,7 @@
 #define _ASM_RISCV_MMIO_H

 #include <linux/types.h>
+#include <asm/fence.h>
 #include <asm/mmiowb.h>

 /* Generic IO read/write.  These perform native-endian accesses. */
@@ -131,8 +132,8 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
  * doesn't define any ordering between the memory space and the I/O space.
  */
 #define __io_br()	do {} while (0)
-#define __io_ar(v)	({ __asm__ __volatile__ ("fence i,ir" : : : "memory"); })
-#define __io_bw()	({ __asm__ __volatile__ ("fence w,o" : : : "memory"); })
+#define __io_ar(v)	RISCV_FENCE(i, ir)
+#define __io_bw()	RISCV_FENCE(w, o)
 #define __io_aw()	mmiowb_set_pending()

 #define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
diff --git a/arch/riscv/include/asm/mmiowb.h b/arch/riscv/include/asm/mmiowb.h
index 0b2333e71fdc..52ce4a399d9b 100644
--- a/arch/riscv/include/asm/mmiowb.h
+++ b/arch/riscv/include/asm/mmiowb.h
@@ -7,7 +7,7 @@
  * "o,w" is sufficient to ensure that all writes to the device have completed
  * before the write to the spinlock is allowed to commit.
  */
-#define mmiowb()	__asm__ __volatile__ ("fence o,w" : : : "memory");
+#define mmiowb()	RISCV_FENCE(o, w)

 #include <linux/smp.h>
 #include <asm-generic/mmiowb.h>
--
2.43.0.687.g38aa6559b0-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
