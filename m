Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE50CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbTQzUEzIloucsX4l20z7VgmznpFEx20T81QWfS0GNY=; b=1ST4UZxbUUz2Hz
	wUG/h8IQcTvbBG2PlG/sClWfioEqE6i/lUbkuVtCCqgQYTEygMAhq/QWd5boHI/AS0kb/vdd+41QW
	x1ICF58WvEwU3z3b9eaNrdwhI7V0RiHpIzRgfKsExk042C1yR2HzX6OKoWA4y/SY6ODK6CbhXqpek
	2Pk4NhyX+3AdFsn12wQD6Jv+XnxLFm2KylICFLJzGDTA/0pCe96pg/MVj53xPNRYTZfrJFRwICx9G
	DSNlSbWWNl3Raj6jKtztB4Q08i699orR/vxGAZk0NRxMiV4ZvjC8PbbuGyNmQI1uwCBgnPDCRDFA5
	tEtepolQCkIAF440gBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgc2-0000000C619-4B3y;
	Fri, 02 Oct 2026 16:59:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgc1-0000000C602-1Pq3
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Oct 2026 16:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MBwgWk41bkF2YCkIipKSeNP7+RMwXHpRbHO0AJjABsc=; b=dcGCDoqQiVuSJ0wi+jh+xhg3vs
	g7Y6RYUn/ySDO1gdjtE/y1IHRcxrJdkg5d7nxvSEpcOIMpB5h126JE8m8FhPk4o+eakHI2N2AWU6B
	HBxmIkxHcRHlw/EXUJYYn1GrIsKdUz2+GfSc9II8WGpOKclgMeh86MUHKO5NCIqQhKOwfk55moxmP
	PKlEjgl/T3sHh+GclwfADY2T9d+L3F4wUd7Vpw50vZKjGRwvSr3ecMd72wzBLDtQ9BZ/Ex+GazTno
	9WeRTO1F5PYubmOKItTBqlNTvIzhhwufUHf+ZAGGi0ORGWynKw+CELhaSbD9bCJw3Ez1ImE9b/r7H
	Yq5VAxqg==;
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCgby-000000068tu-1L3Q
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:59:56 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso128119a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960392; x=1791565192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBwgWk41bkF2YCkIipKSeNP7+RMwXHpRbHO0AJjABsc=;
        b=buPtJhkc2d++8uTR+mH32muI1B8AhUm1GJqtdc6z1zyV7Qq83DrXJvTx3UWE8F3ggL
         SEEJc5jJphX484NhGcnl7kSWZLzdoOik2hIv9BMP/1GJn29lp+P0KK3ta299Pkg6mjP7
         8UpqJNmn67HQKoWwTeLnO1+YExZ4L0aIi3En3q+rNKRlUhv3YkhaKIbdAwWmnFZnu2C9
         mZzU5Uu9LQr9UPXglkjFA1oN+fuJqT91IiWEttcbp43hK7ujCUtiB+tUWrdtYp7IxxjL
         ABS394rDtdTVMPR+sy9lr8NE/Yyg7DvUKJWT6TYgz2RBF/jaL3gn9gdjlX+I1KLnNjA7
         WWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960392; x=1791565192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBwgWk41bkF2YCkIipKSeNP7+RMwXHpRbHO0AJjABsc=;
        b=ob9PzfrDpIXm1SzFo8yqSmHAM49XBPJTGzP1XIzvSN9YRUhokO9K/63EL0B8LS5f2c
         F9J5RQoeQFImlrXUu8xPhUdNFO5Pji3Y+7sM9j9e91jXMtZas185dJ4Zksmv0ERqJwXT
         BaVDvK/5HYPOPL2JIJho01+Q4bikdGdtSqD0deLQQDCfgNY5UM1A20Z4GEzOwzCuYMrq
         xuVtpwd+vu14/dtCOiUEkQ6Ua8/PZxgS83/Alik2We7D1DSDNSny9x2NHThj7NC8ZNmv
         QGginoiadLqaJfds39+sFB7gqdwcOh6jt2GnSPHJISMaRKRon8Rc5X0bDtMFTq7yWnv5
         cs5Q==
X-Gm-Message-State: AFq9FYIB93j7kzWcMBCX1lFqQw4K9Dca6kLh9aVnJnmAJqCFgRY/GvW0
	Jw+yvVqRaJD/p1R/Zx4NZGlKGYEe934MrT7eTBfLdEm6rZTLEGqWTrHQ37Dd5+9IeyUQi+e3RXI
	kNJ+qgcA=
X-Gm-Gg: AYBFou113r6BoJH8zSLFOQYtNz2pVgzR7vo1FectVfAiVEE7Vf27Lw3ZwRTfhjcOAp4
	q7Aoa+POPuMBpVg5q7lgag0AnrL9w0r9tBn6UwAtNjDIq5KMsUhBHZdbU6o9eqE1uVqc/DzTzi3
	jh7GcUw1RjurcMCYywHjM6fvpUCDjRsV3JZyRONEWZXtKg+7raFvuHX546iHn88yJoSGsUmL/dy
	5bG13E4M7kMFCI67KEx11YPMLJyAiIlo3nJLY+9xcWiuPjJuDBXCT1ZcexBacjEAauSaPQK1a1O
	YoyRqiIPpuddVGklzAdHnkYXgW1edNMlTSCAAJpYxkaBXFT8prXgPe0PiO1AB0qxTaG8ewCvgq7
	+iGIFL1o+31txsiu7YZkfRIPUyXKKDZSZqEhJ00vRfZ4TNcCjyK3RP3wHgDLu92obGeF2hn+8+q
	eVEf6Ggk15gNtw393vPJdt//b7M5K0OxXuIUSUeUrVh8ZC4QsR7y2M/rv50pSzzcuh+MvlZ5uAM
	g5dT8+BKtcQt2g/RAIM05PytYDx
X-Received: by 2002:a17:90b:4b0d:b0:3a2:b0a1:456b with SMTP id 98e67ed59e1d1-3a6cecb1b3bmr1963511a91.47.1790960391800;
        Fri, 02 Oct 2026 09:59:51 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:51 -0700 (PDT)
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
Subject: [PATCH v5 5/5] riscv: Use Zalasr for atomic acquire and release operations
Date: Sat,  3 Oct 2026 00:59:10 +0800
Message-Id: <20261002165910.3818940-6-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
References: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_175954_564441_860B0092 
X-CRM114-Status: GOOD (  12.30  )
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

The generic atomic helpers implement acquire and release operations by
combining a relaxed AMO with a fence. Systems with Zalasr can encode
the required ordering directly in the AMO with the aq or rl annotation.

Provide explicit acquire and release variants for the arithmetic and
logical atomic operations. On SMP systems without Zalasr, retain the
relaxed AMO plus directional fence sequence. On SMP systems with
Zalasr, select an annotated AMO plus a nop. Keep the existing plain-AMO
lowering for uniprocessor builds.

This optimizes both 32-bit and native 64-bit atomics. Relaxed operations
remain plain AMOs, while fully ordered operations continue to use aqrl.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/atomic.h | 76 ++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 03d477a65dc6e..9f28e98fcd6bf 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -102,6 +102,38 @@ c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
 	return ret;							\
 }									\
 static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_acquire(c_type i,		\
+						  atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		RISCV_ZALASR_SMP_ALTERNATIVE(				\
+			"	amo" #asm_op "." #asm_type " %1, %2, %0\n", \
+			"	amo" #asm_op "." #asm_type ".aq %1, %2, %0\n") \
+		: "+A" (v->counter), "=r" (ret)			\
+		: "r" (I)						\
+		: "memory");						\
+	__asm__ __volatile__ (RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_ACQUIRE_BARRIER, __nops(1)) ::: "memory");	\
+	return ret;							\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_release(c_type i,		\
+						  atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_RELEASE_BARRIER, __nops(1)) ::: "memory");	\
+	__asm__ __volatile__ (						\
+		RISCV_ZALASR_SMP_ALTERNATIVE(				\
+			"	amo" #asm_op "." #asm_type " %1, %2, %0\n", \
+			"	amo" #asm_op "." #asm_type ".rl %1, %2, %0\n") \
+		: "+A" (v->counter), "=r" (ret)			\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
 {									\
 	register c_type ret;						\
@@ -118,12 +150,24 @@ static __always_inline							\
 c_type arch_atomic##prefix##_##op##_return_relaxed(c_type i,		\
 					      atomic##prefix##_t *v)	\
 {									\
-        return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;	\
+	return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_acquire(c_type i,		\
+						   atomic##prefix##_t *v) \
+{									\
+	return arch_atomic##prefix##_fetch_##op##_acquire(i, v) c_op I; \
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_release(c_type i,		\
+						   atomic##prefix##_t *v) \
+{									\
+	return arch_atomic##prefix##_fetch_##op##_release(i, v) c_op I; \
 }									\
 static __always_inline							\
 c_type arch_atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)	\
 {									\
-        return arch_atomic##prefix##_fetch_##op(i, v) c_op I;		\
+	return arch_atomic##prefix##_fetch_##op(i, v) c_op I;		\
 }
 
 #ifdef CONFIG_GENERIC_ATOMIC64
@@ -143,22 +187,38 @@ ATOMIC_OPS(sub, add, +, -i)
 
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
@@ -181,6 +241,12 @@ ATOMIC_OPS(xor, xor, i)
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
@@ -189,6 +255,12 @@ ATOMIC_OPS(xor, xor, i)
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
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
