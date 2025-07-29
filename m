Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E07C87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEu+ovN0uUEAOk/8u3FhSJWur5ElV+PK4fZry3uhkn0=; b=ZSw+BQE44kq4+g
	d4sWDjWaRU672YU+o0grCmBq8YDQAaZqRFrLmcJJL9e27iSwc2XvbNvuYodXugxWSdHbcWM6uJOsP
	gFXAh5wMvCgp8GoBlz7VuLjisc6tzm2HvVNdTD2dRRU3ENAuW5R8nU6iU3+JhkYJPSjoKk6FaFupX
	QRDeWsowRV/3hn4MwYCsg1WbTjr3PKO1fqNpPWKC36O1/zVnDVA0w9ijJ5JsTLivD4/Tv+1SCa4/W
	rbxoy3/rz42v44m6pCaA94Q0+rXWE6ZpgVXxTBPTPGuIe4aBjRAgJv9qTIfrJQ2MIh2xbJFqn4IUy
	NW3OrmQZt4QpIf3VohvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSd-0000000GDcW-0cBB;
	Tue, 29 Jul 2025 08:13:23 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSX-0000000GDXh-3MhH
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 08:13:20 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-754f57d3259so8660528b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753776796; x=1754381596; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yGmakvlGT634aR11Csz05fa+gmD+2vIJ9rH8M6yTyo=;
        b=c+nMSOXnVNn4FvPs+DYj+iveL0iuruXBQpaV1h69I93MJN167Yupscc3PGU7bL4MHG
         JKheFiuSExNuFkbEhZ+38D79lDmN/jN9ly7bkYcELaGiIDsTRB7mhbo0II6uD6oCLQtQ
         miu4R7H81XdFaUjIRiw811QuJkYX5GDQKDvZRmrOBUEahFywYxtDNxRo1WCgEvsCCbpt
         nJWon8oyWbT493TbFUteRCuxR1VidnvD4YmVGEmvsmj5EZfMRhSnKe0blmBiMl86B7SA
         ILS2abOz+aAZE4MlJlBgRIv9m2kGYVt6jsR783zF9fmvKyDQsCizU71JoyAj0/yJBFW7
         AbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753776796; x=1754381596;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yGmakvlGT634aR11Csz05fa+gmD+2vIJ9rH8M6yTyo=;
        b=G1iLvfNcl+Q7zrfZOUcN0AgJJrxPV6+6vJLWYtbEsP78kRNXSS/3TeA1pLhkNftRoA
         d5RJzunfnqyq3/I9xV8JO8qa5VbaaQ3DDShv9+BCMfK1UxTBWHhSe6ivurbbKwGJEJR+
         phWcPweAS9gBHwtogAJAzUqWYl9NiDtWUAtPfptUs7lHQmkRPAfbPVRpFkpp+veIwAY0
         oFIRBhPkJUZ4oH1Rmkt6VmUXNASmOu64r+xRRTCd0+K5+FBLXDO7tepgkBa2X9F7NArY
         I8bh0xrVVS8sTkIG77Yx7ZARxuyk5yOOR0Khen49DnmpnAf8DdaKsbfI1WKxq8yyScUv
         G1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa0flEH8kmI7ywUkREeUS18fqbcLkvaOgOkuMtKAV/3FL27r5klpVXfLzSC99Z+l1zh3Cridh6PqkRlw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbob+c86rZAa41F3H6guqgP4M8WiA1JZEKJxfMfoF3Qxa/Qn1d
	9c3pK7t+dlmYDx96vdrc8yZF5MHF1BE9NivZHjBppaYPY1E5kQHc4jQfF/x7JAed7/i3oL4UyMc
	N6YshTQ==
X-Google-Smtp-Source: AGHT+IFNuMReO/chIStJlUvvk+LkUMhF7qnFNrzRzITSnP2mlhqW0sOsowPwW0OTBaOmH6EkTjLF3fwLlmk=
X-Received: from pfmm16.prod.google.com ([2002:a05:6a00:2490:b0:746:3185:144e])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c96:b0:749:464a:a77b
 with SMTP id d2e1a72fcca58-763349b95e7mr20176257b3a.18.1753776796333; Tue, 29
 Jul 2025 01:13:16 -0700 (PDT)
Date: Tue, 29 Jul 2025 01:12:54 -0700
In-Reply-To: <20250729081256.3433892-1-yuzhuo@google.com>
Mime-Version: 1.0
References: <20250729081256.3433892-1-yuzhuo@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729081256.3433892-2-yuzhuo@google.com>
Subject: [PATCH v1 1/3] tools: Import atomic_fetch_{and,add,sub}
From: Yuzhuo Jing <yuzhuo@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yuzhuo Jing <yzj@umich.edu>, Yuzhuo Jing <yuzhuo@google.com>, 
	Guo Ren <guoren@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_011319_763098_372EE9C5 
X-CRM114-Status: GOOD (  13.20  )
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

Import necessary function (atomic_fetch_add) for ticket spinlock
Implementation.  In addition, also import those that pair with the
imported ones (atomic_fetch_sub, atomic_fetch_and).

Signed-off-by: Yuzhuo Jing <yuzhuo@google.com>
---
 tools/arch/x86/include/asm/atomic.h    | 17 +++++++++
 tools/arch/x86/include/asm/cmpxchg.h   | 11 ++++++
 tools/include/asm-generic/atomic-gcc.h | 51 ++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/tools/arch/x86/include/asm/atomic.h b/tools/arch/x86/include/asm/atomic.h
index a55ffd4eb5f1..1fb7711ebbd7 100644
--- a/tools/arch/x86/include/asm/atomic.h
+++ b/tools/arch/x86/include/asm/atomic.h
@@ -66,6 +66,14 @@ static inline int atomic_dec_and_test(atomic_t *v)
 	GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
 }
 
+static __always_inline int atomic_fetch_add(int i, atomic_t *v)
+{
+	return xadd(&v->counter, i);
+}
+#define atomic_fetch_add atomic_fetch_add
+
+#define atomic_fetch_sub(i, v) atomic_fetch_add(-(i), v)
+
 static __always_inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 {
 	return cmpxchg(&v->counter, old, new);
@@ -85,6 +93,15 @@ static __always_inline int atomic_fetch_or(int i, atomic_t *v)
 	return val;
 }
 
+static __always_inline int atomic_fetch_and(int i, atomic_t *v)
+{
+	int val = atomic_read(v);
+
+	do { } while (!atomic_try_cmpxchg(v, &val, val & i));
+
+	return val;
+}
+
 static inline int test_and_set_bit(long nr, unsigned long *addr)
 {
 	GEN_BINARY_RMWcc(LOCK_PREFIX __ASM_SIZE(bts), *addr, "Ir", nr, "%0", "c");
diff --git a/tools/arch/x86/include/asm/cmpxchg.h b/tools/arch/x86/include/asm/cmpxchg.h
index 5372da8b27fc..2d89f150badf 100644
--- a/tools/arch/x86/include/asm/cmpxchg.h
+++ b/tools/arch/x86/include/asm/cmpxchg.h
@@ -12,6 +12,8 @@ extern void __xchg_wrong_size(void)
 	__compiletime_error("Bad argument size for xchg");
 extern void __cmpxchg_wrong_size(void)
 	__compiletime_error("Bad argument size for cmpxchg");
+extern void __xadd_wrong_size(void)
+	__compiletime_error("Bad argument size for xadd");
 
 /*
  * Constants for operation sizes. On 32-bit, the 64-bit size it set to
@@ -200,4 +202,13 @@ extern void __cmpxchg_wrong_size(void)
 #define try_cmpxchg(ptr, pold, new) 				\
 	__try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
 
+/*
+ * xadd() adds "inc" to "*ptr" and atomically returns the previous
+ * value of "*ptr".
+ *
+ * xadd() is locked when multiple CPUs are online
+ */
+#define __xadd(ptr, inc, lock)	__xchg_op((ptr), (inc), xadd, lock)
+#define xadd(ptr, inc)		__xadd((ptr), (inc), LOCK_PREFIX)
+
 #endif	/* TOOLS_ASM_X86_CMPXCHG_H */
diff --git a/tools/include/asm-generic/atomic-gcc.h b/tools/include/asm-generic/atomic-gcc.h
index 08b7b3b36873..cc146b82bb34 100644
--- a/tools/include/asm-generic/atomic-gcc.h
+++ b/tools/include/asm-generic/atomic-gcc.h
@@ -100,6 +100,23 @@ atomic_try_cmpxchg(atomic_t *v, int *old, int new)
 	return likely(r == o);
 }
 
+/**
+ * atomic_fetch_and() - atomic bitwise AND with full ordering
+ * @i: int value
+ * @v: pointer to atomic_t
+ *
+ * Atomically updates @v to (@v & @i) with full ordering.
+ *
+ * Unsafe to use in noinstr code; use raw_atomic_fetch_and() there.
+ *
+ * Return: The original value of @v.
+ */
+static __always_inline int
+atomic_fetch_and(int i, atomic_t *v)
+{
+	return __sync_fetch_and_and(&v->counter, i);
+}
+
 /**
  * atomic_fetch_or() - atomic bitwise OR with full ordering
  * @i: int value
@@ -117,6 +134,40 @@ atomic_fetch_or(int i, atomic_t *v)
 	return __sync_fetch_and_or(&v->counter, i);
 }
 
+/**
+ * atomic_fetch_add() - atomic add with full ordering
+ * @i: int value to add
+ * @v: pointer to atomic_t
+ *
+ * Atomically updates @v to (@v + @i) with full ordering.
+ *
+ * Unsafe to use in noinstr code; use raw_atomic_fetch_add() there.
+ *
+ * Return: The original value of @v.
+ */
+static __always_inline int
+atomic_fetch_add(int i, atomic_t *v)
+{
+	return __sync_fetch_and_add(&v->counter, i);
+}
+
+/**
+ * atomic_fetch_sub() - atomic subtract with full ordering
+ * @i: int value to subtract
+ * @v: pointer to atomic_t
+ *
+ * Atomically updates @v to (@v - @i) with full ordering.
+ *
+ * Unsafe to use in noinstr code; use raw_atomic_fetch_sub() there.
+ *
+ * Return: The original value of @v.
+ */
+static __always_inline int
+atomic_fetch_sub(int i, atomic_t *v)
+{
+	return __sync_fetch_and_sub(&v->counter, i);
+}
+
 static inline int test_and_set_bit(long nr, unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
-- 
2.50.1.487.gc89ff58d15-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
