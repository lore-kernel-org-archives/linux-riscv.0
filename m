Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FD1C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iXZAnt2ZUAEbbQYzaUChTxEQG9iXCpQ4HDBlXWu6vZU=; b=lMgOHWR/qZLEmRMSgwpDcq1d/h
	Tfi8whl2DFt8aN9Q5EGZWd5NsAAbrBfGiklvPp3zwDoUpDEf5UrnH6jp5GrVKDSOJhOmn2fU7VoiR
	KFc0sAfRVKdRO4wn0Z9L2EWCHzi8VZpepD+FVz449HtmgIa+p82PppMyNEnbLvTRDGIhvdgfkdMdf
	a/Yj9EQ/YxFwTbBehXjoWk5VL1HferGlPAICfhiGKJx2BjEKYuUTQYeZQoA5zv1Ct4G1TnPifI0aw
	ETl++J94cK7SXSOCNKpEQ21cs/433sKmNjQOa8QPouZXyLDbkqGocMhjixaK1gV0gAUzjwaw3x0Tr
	upitasOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1RV-0000000B6lj-0u18;
	Tue, 13 Feb 2024 22:39:57 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1RS-0000000B6kN-07qX
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 22:39:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ee22efe5eeso85264957b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 14:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707863993; x=1708468793; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BS7J64xtqNYr0VkPhgpx0WAA/5MaMJzR/9ev/cheMlM=;
        b=3tkwz+ruvAPX0QodCOQQYXSwJ9CATXYMeA+eo83ZcEcCfVn4cpqBqRvOMxJi6N29a0
         VoALjnSI0JPKCRftQxHFWrlN/adAPCqyelwdBdQfvnNGVPmV5ue37wsEpJ+HJ/ScZOcl
         j/OLZVHpcSw7jCj7BkWYEtfAtFbhDACToau5EJVThQd7RraJubvY+GugbM2Ijs73XtZt
         siz1097ai7jeMxg+hj/EsN/zMKyWLdfSWeNRspPafqApkeL742zIdaQLHhYNov/yatr3
         J8leqyagbzLWZswCrrPke1XeomLh84Dq8vNGQHUNlEdYQw+XrYdPDAZkjJvIlrWvc28P
         o+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707863993; x=1708468793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BS7J64xtqNYr0VkPhgpx0WAA/5MaMJzR/9ev/cheMlM=;
        b=fo38Q0/QofTiKx52/bTX0fBrzbRWprfTW3lw8aS9mmqn90EIcmsLWPAxLjYhQs8+Jr
         4nBUPlrBYjz3stfXdvWvPvB5Z7BVN81+y5gwTAaosyU1pGarqdQ5yMQlrQnSje+oyu2s
         s19Crncd96xuDSm1HWUDbKgtgRhqlwm1cv4B4gxRQqRTebuaYO/6X2DMex3VY/PG11DP
         whrW2NfIFI3TkZTdfAvAT25Sd7dH81L5Sx2GqEvIeJF8p4wdsQ3sUNXbRmcu8hTvFaJP
         7C+XgA3LifCjjIu5j2zKnyjjjSFJkhzfHr7n1TPA8POLQWATCvbuedpkKI1swOiH2WWq
         Vkqg==
X-Gm-Message-State: AOJu0Yy1ywX3jw7RhmhBXfNTo4ZzLx+NySZes8poZTCmdC8jjFk700bw
	ihLdS+7lgI79JWzRPWOh5nZN7bXD3BN0Grh+sDkAnqG0LhLaw87LklunT+S5mFmZOkx7JpRky0l
	KSb3IGh7Aty3YyAB6lQ==
X-Google-Smtp-Source: AGHT+IEaXBKOsL4J4xH6upCv6tFAD1V6p0ocFCwjkV0OENmkH/QGXmVGVcJGhEqn5+7K3WrIETAickdSYwYsSZ2d
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a0d:e884:0:b0:5ff:a885:65b with SMTP id
 r126-20020a0de884000000b005ffa885065bmr136409ywe.10.1707863992743; Tue, 13
 Feb 2024 14:39:52 -0800 (PST)
Date: Tue, 13 Feb 2024 22:39:41 +0000
In-Reply-To: <20240213223810.2595804-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213223810.2595804-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213223941.2597526-1-ericchancf@google.com>
Subject: [PATCH v5 3/4] riscv/barrier: Consolidate fence definitions
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_143954_092535_1EEC9B78 
X-CRM114-Status: GOOD (  14.20  )
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
v4 -> v5: keep  __atomic_acquire_fence and __atomic_release_fence
omit-the-fence-on-uniprocessor optimization, and fix the typo of RISCV_RELEASE_BARRIER
when spliting the patch in v3.

 arch/riscv/include/asm/atomic.h  |  1 -
 arch/riscv/include/asm/barrier.h |  3 +--
 arch/riscv/include/asm/cmpxchg.h |  1 -
 arch/riscv/include/asm/fence.h   | 10 +++++++---
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 31e6e2e7cc18..0e0522e588ca 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -17,7 +17,6 @@
 #endif

 #include <asm/cmpxchg.h>
-#include <asm/barrier.h>

 #define __atomic_acquire_fence()					\
 	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
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
index 6c26c44dfcd6..6bcd80325dfc 100644
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
+#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, w)
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
