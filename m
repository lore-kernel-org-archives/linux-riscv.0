Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F718CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6avVPYdEaxKydkB3rBnDRi3C+lIiXAwqlnhIKvabuo=; b=A1U+00c2wc/8sd
	Blj4HdZlUVQX4V1wrls3VTSI9PCigSjp5WAc9JL7AXDNgB6BsfOO1I4S1gfBEusT0JVBX3v1n7pTE
	JA/yH2hlColjsx9JGkJwU0GtcgggQN31a0Hmtq5b5Lqbyw3KlDmWIZodFQ2sUcXY6ykW2XzQ9a3xN
	IUCUw9lrZ+d0Q4VPvwyEvqL1/UeWtOxJTTf6XFiZejh+0xOq+h3wZbC0HkvJIpirTzLPC7F3wF1Rk
	lVtOJvWaU+ghtN9crE7MeiwMQIiLl4ngUXN+Usrr/lHzCnfFnbeGTke2Iij7y9dGOhLz60hjGftBP
	NFPdXhVxHuiVFABtHB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbg-0000000C5sA-1QBc;
	Fri, 02 Oct 2026 16:59:36 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbd-0000000C5r2-3Xf9
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:59:35 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so1962346a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960373; x=1791565173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwgXqw+/KPKoTG01IpAwkiOh262ZlS4PFU+UVMlRK44=;
        b=VYwWNF1N3HJ/9LO6OZeqNe5V1G9fMnKmg3RVA+MHMva9KeS3o0lQeSpD+2hgZZtW68
         nGJydHopR8eGPreDW5nkl0EuvGsNqf03ww/bex5aCmYDgxL52Dwqqn2jbbuJ43qkCpfe
         KirkdVFB07RRqnqgeJO86H8XFnNrVS9gykur8QmCY9RAQLsUgDF05BylvT26dsbQnfjd
         u3aE3E7eY0mKCxj/WcFvDgHneTCz7FluD86tmyKeJ80jjRjghiB/xWs8ezTZ6aBrCAs7
         VF0gtgqATvsp1X0kc6FiMnApJE/987wA6Cj3AnKO6H1N6jFHfvJk1I1yd36re9Ln5Lmj
         SbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960373; x=1791565173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwgXqw+/KPKoTG01IpAwkiOh262ZlS4PFU+UVMlRK44=;
        b=2Ou2jXrhIAqSLzM3rjJueOswhuWW5F9g7rVbovqh5MSCUJtfhrWDlpyfJUFGevxzC5
         NqSgQCBu2RQoZZw1TRIQF2taPa/g+y5Qqn++wrcDPoPgtNc6/zDBPm7346DK+tzu1ogk
         +8a2mBanoeU9NSVdmglcnULqy4vi80c1BZ6KFyPbCfiU6ja/97Jhq6ho8iUTJgTPACn0
         aeW6gNJhGtNvoNRxUN/R/hFydPfBm+94GdVkwyZWUGDMn7E5xBH85gaspZZEdVyQVpj8
         ElLBVfKUwX8xNbpy7WzAe882F6T28Z0iO8rN6y0HJ4CnNKlk7bbJ+IRe3GtAeAqKpj5f
         O8wA==
X-Gm-Message-State: AFq9FYK1oymb4i4zyVVFol/E9PGAbpizCQSh2HDNi5WhmksC2gQWB+nb
	mYXQPIuFpacsn/cH4FGAhWl/V957QgJ1gsxjDyU/UqX/7fwiE9qflQViBpY0M+F3TS9ZFupiUjE
	9xxvg9u2M5w==
X-Gm-Gg: AYBFou0LB51OlPv8+4AH0AyCxNAoTU7E28079arjgHhFx33vIuM3rH+LrkJjPtX/lVp
	Lq00/+9EV5i6/ixuRlkMUSzz26COmmZhi3gct3DoQdKcLUEju4KMpPUBleEj+Q8SKjPtW2vN2jb
	dyQDwJmGw30d3UPsjj2SSslUi9GkBW+K77Jindm2S79yxvL5PpO216FnYId2UlyldNyYfQU0Wc4
	IGp5B6NjdwHHyKm2s4EpHShcy4BI4z1jOSMPy+EE9M+l0ZxXQ9eDwCCc+pFooy4cJMPJE3pvcAs
	Xkr2MxL7v19j9x/OelbDcSp0JSZHF5Jy569xu/XFe45Y9ToPTgkRj5HgVjj1+pOZ+ew48crwd8v
	fANuPCO+wqbA7wMiCj+5NJOopJRBcDr7qv+S1K2tKnALWy8h2RkMKTzzh0L345g6rv53qydGMYR
	tl5W2wuqUHt0obbtwn9pT3p+2izHx/PTR9usG9Mgir8an98Fd4o9EIAkooAp8qvPIT4zOdijIYk
	JtlFvE+02MMljashA==
X-Received: by 2002:a17:90b:134c:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a6ce97cf78mr1833682a91.13.1790960372758;
        Fri, 02 Oct 2026 09:59:32 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:32 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v5 2/5] riscv: Apply Zalasr to smp_load_acquire/smp_store_release
Date: Sat,  3 Oct 2026 00:59:07 +0800
Message-Id: <20261002165910.3818940-3-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
References: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_095933_892150_8ABBE4FF 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

From: Xu Lu <luxu.kernel@bytedance.com>

Replace fence instructions with Zalasr instructions during
smp_load_acquire() and smp_store_release() operations.

|----------------------------------|
|    |     __smp_store_release     |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| rl |-----------------------------|
|    | s{b|h|w|d}.rl | fence rw, w |
|    |               | s{b|h|w|d}  |
|----------------------------------|
|    |    __smp_load_acquire       |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| aq |-----------------------------|
|    | l{b|h|w|d}.aq | l{b|h|w|d}  |
|    |               | fence r, rw |
|----------------------------------|

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 78 ++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 51a73712b6a12..d2200e826ec00 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLER__
 #include <asm/cmpxchg.h>
 #include <asm/fence.h>
+#include <asm/insn-def.h>
 
 /* These barriers need to enforce ordering on both devices or memory. */
 #define __mb()		RISCV_FENCE(iorw, iorw)
@@ -53,21 +54,80 @@
 
 #define __smp_store_release(p, v)					\
 do {									\
+	typeof(p) __p = (p);						\
+	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u =	\
+		{ .__val = (__force __unqual_scalar_typeof(*p)) (v) };	\
 	compiletime_assert_atomic_type(*p);				\
-	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
-		RISCV_FENCE_ASM(rw, w), RISCV_FENCE_ASM(rw, rw))	\
-		::: "memory");						\
-	WRITE_ONCE(*p, v);						\
+	kasan_check_write(__p, sizeof(*p));				\
+	switch (sizeof(*p)) {						\
+	case 1:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sb %0, 0(%1)\n",	\
+			SB_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u8 *)__u.__c), "r" (__p)		\
+			: "memory");					\
+		break;							\
+	case 2:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sh %0, 0(%1)\n",	\
+			SH_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u16 *)__u.__c), "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 4:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sw %0, 0(%1)\n",	\
+			SW_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u32 *)__u.__c), "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sd %0, 0(%1)\n",	\
+			SD_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u64 *)__u.__c), "r" (__p)	\
+			: "memory");					\
+		break;							\
+	}								\
 } while (0)
 
 #define __smp_load_acquire(p)						\
 ({									\
-	typeof(*p) ___p1 = READ_ONCE(*p);				\
+	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u;	\
+	typeof(p) __p = (p);						\
 	compiletime_assert_atomic_type(*p);				\
-	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
-		RISCV_FENCE_ASM(r, rw), RISCV_FENCE_ASM(rw, rw))	\
-		::: "memory");						\
-	___p1;								\
+	kasan_check_read(__p, sizeof(*p));				\
+	switch (sizeof(*p)) {						\
+	case 1:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"lb %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LB_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u8 *)__u.__c) : "r" (__p)		\
+			: "memory");					\
+		break;							\
+	case 2:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"lh %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LH_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u16 *)__u.__c) : "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 4:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"lw %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LW_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u32 *)__u.__c) : "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"ld %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LD_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u64 *)__u.__c) : "r" (__p)	\
+			: "memory");					\
+		break;							\
+	}								\
+	(typeof(*p))__u.__val;						\
 })
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
