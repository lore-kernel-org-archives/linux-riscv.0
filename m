Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CB7E7718B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Dec 2024 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OLiPj2W3ZSdYXbc9UngAcBMrN2Lez4jd/XXi67KSdNM=; b=W6nrWjTT800bbF
	IF/od52swq0bNFfPVvcAkKxMyk8VhVV+kGjoiG0e8yVPX5U4A7ePrMCfrZbt4juB5sBbzZ0XuHWvb
	EDhZEvWtlPEYcjsxFCmzet1hK+Nn2tjRwcGN1IYjG6ZOIr+7qXv7nlMKGZMi6ny4lCKgai8Boln8I
	Ay3ieXNd+wU8OSywul0MKRMx5bbIN4NPo7JImFAn1/g/GrSSsJEUIidVwI0i2ke79cX2weOuav1NT
	Gyq5rxlO4Yr/VPNkVlsYxXm3kCJ5lcLPhDsoxM8yZD2RElYAw8zA/nSSqNFDvXs7pNY3iOoVv+Hdw
	To65K2V5nCWvN7UUiZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMjt-0000000DRWm-1SM7;
	Wed, 25 Dec 2024 08:27:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMgm-0000000DRIw-27AO
	for linux-riscv@lists.infradead.org;
	Wed, 25 Dec 2024 08:24:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa692211331so1070814966b.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Dec 2024 00:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735115058; x=1735719858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWMFPl6BBjVV6yqTNgiJ5wMWW3VBFJzmfcK7dXSbSG4=;
        b=S+jypm6ScrYzrHHGyzkTgiOaWFZ5x0nZMmV9FRT/AqlL9ZpuMZh6y1GOc4BTN6w3HU
         psh1fcXlwymkrha4UPzyeKuLTkKhpqJ0g1j2nKLPRJ3OWc1jM7PJFK5dGqUh0FDu0Q49
         8RNGlURcGxpz8QRQdwWuqd6Z3OzuYq4Jmh79ghuRT6kcJax8O9m0p5CYpIHQSPG1wrDE
         dokPFwuKNJgI+OWvX3ntpnap6Qao/njZ3V545gtZcg1Y7aFQbu0IzMTyvgbw1x5uccGt
         w7NRYkyIOSakK6rsscIUObUbygQruju/NXkT/9zs07fr5HF7YWN9Sl2iP+Fey7iINZDJ
         qAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735115058; x=1735719858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWMFPl6BBjVV6yqTNgiJ5wMWW3VBFJzmfcK7dXSbSG4=;
        b=TVxfUr6fFD7+b5UA0/uMafZg2qrqhWe6fJky847Ayt4sCVB7YGBUN5N30kuUU7gKlz
         Hb+YXlpHdZ0LlrEsyFZ/UKKZ/kBoV1nuUyILTQYEe/glyFBAYRxPJgCmS3to8LNw5KK4
         rqal2zUfTMixEoDAYh4J7AzDW35adRJaKHBDAN+sqcBiGPY0BQl76owsBHaR0wkwlwBT
         YigzvPi+bO3j+VCyU/WBTJBmH0Os0ZzFkn0R4mYSwt4Zg7keU3OUVwkFq7r2iVNitn+K
         9M1VPHr/qodZoHaEDjHpDP/jwD13hCh2QWPEFIiMYLK+LTDyLTsRzouHUPICv2CAH91/
         DYhA==
X-Gm-Message-State: AOJu0YwgZ3DRfG22GbygNZaSXtUJ9Fi47jgKB41w8JXMuTErNBmqn31Q
	8+ke6X3DOa/xQAorvQrkgYn09dsDnhIedVNvb6xMmw++r9XWBPQ85+tBdBx2
X-Gm-Gg: ASbGncvWKsU8YtT6+92zPxnbQLmLa45v6aFrCNagNgmeHSTkGq7nDBA2lwaxTU6dboR
	g9LO0Dur1+HPR2bWZwHdyeN2I4UfW5y4rj7GJBOtClxAhMHcbyTz8pCx2hQL1T6ZGeuVSrdFQtr
	JU3vQSCr2QAcMkNFuwZuo4yirgZYPf9ppg9b2fT+SYz8RetGqmzQQr/lWE5BhdthgTg4Y2KSSVA
	N0tMfNCWK/4Ook+2cl8mEvJZyuT29xA6mc21/FqJn6NuyFB0SU6UrFfORuJVg5jdv7EudnsqrZN
	R8lRceIqkZbPEUo=
X-Google-Smtp-Source: AGHT+IEUvxRI41Vqedig7jcxV57lOBqo0tPtLsvO/mSofwkkDHvbsY/WaSCcBxQjgK/6iuQThoWdlw==
X-Received: by 2002:a17:906:36ce:b0:aae:bb48:211e with SMTP id a640c23a62f3a-aaebb482becmr962797366b.27.1735115057817;
        Wed, 25 Dec 2024 00:24:17 -0800 (PST)
Received: from localhost.localdomain ([109.245.38.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06629esm769283766b.189.2024.12.25.00.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 00:24:15 -0800 (PST)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrea Parri <parri.andrea@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Eric Chan <ericchancf@google.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: [PATCH v2] riscv: Use Zalrsc extension to implement atomic functions
Date: Wed, 25 Dec 2024 09:24:12 +0100
Message-Id: <20241225082412.36727-1-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_002420_556680_42015FDE 
X-CRM114-Status: GOOD (  15.11  )
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

From: Chao-ying Fu <cfu@mips.com>

Use only LR/SC instructions to implement atomic functions.

Add config RISCV_AMO_USE_ZALRSC.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
---
 arch/riscv/Kconfig               | 11 +++++++
 arch/riscv/include/asm/atomic.h  | 52 +++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 45 +++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++
 arch/riscv/include/asm/futex.h   | 46 ++++++++++++++++++++++++++++
 5 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cc63aef41e94..9fb020b49408 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -715,6 +715,17 @@ config RISCV_ISA_ZACAS
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_AMO_USE_ZALRSC
+	bool "Use Zalrsc extension to implement atomic functions"
+	help
+	   Kernel uses only LR/SC instructions to implement atomic functions.
+
+	   It makes sense to enable this option if your platform only
+	   implements the Zalrsc extension (a subset of the A extension),
+	   and not the complete A extension.
+
+	   If you don't know what to do here, say N.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 5b96c2f61adb..88f62e33a545 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
  * have the AQ or RL bits set.  These don't return anything, so there's only
  * one version to worry about.
  */
+#ifndef RISCV_AMO_USE_ZALRSC
 #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
 static __always_inline							\
 void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
@@ -59,7 +60,23 @@ void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
 		: "+A" (v->counter)					\
 		: "r" (I)						\
 		: "memory");						\
-}									\
+}
+#else
+#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
+static __always_inline							\
+void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
+{									\
+	register c_type ret, temp;					\
+	__asm__ __volatile__ (						\
+		"1:	lr." #asm_type " %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type " %2, %2, %0\n"			\
+		"	bnez %2, 1b\n"					\
+		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
+		: "r" (I)						\
+		: "memory");						\
+}
+#endif
 
 #ifdef CONFIG_GENERIC_ATOMIC64
 #define ATOMIC_OPS(op, asm_op, I)					\
@@ -84,6 +101,7 @@ ATOMIC_OPS(xor, xor,  i)
  * There's two flavors of these: the arithmatic ops have both fetch and return
  * versions, while the logical ops only have fetch versions.
  */
+#ifndef RISCV_AMO_USE_ZALRSC
 #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
 static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
@@ -108,6 +126,38 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
 		: "memory");						\
 	return ret;							\
 }
+#else
+#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
+					     atomic##prefix##_t *v)	\
+{									\
+	register c_type ret, temp;					\
+	__asm__ __volatile__ (						\
+		"1:	lr." #asm_type " %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type " %2, %2, %0\n"			\
+		"	bnez %2, 1b\n"					\
+		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
+{									\
+	register c_type ret, temp;					\
+	__asm__ __volatile__ (						\
+		"1:	lr." #asm_type ".aqrl %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type ".aqrl %2, %2, %0\n"		\
+		"	bnez %2, 1b\n"					\
+		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}
+#endif
 
 #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)	\
 static __always_inline							\
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index fae152ea0508..0051de1cf471 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -187,12 +187,17 @@ static __always_inline int variable_fls(unsigned int x)
 
 #if (BITS_PER_LONG == 64)
 #define __AMO(op)	"amo" #op ".d"
+#define __LR	"lr.d"
+#define __SC	"sc.d"
 #elif (BITS_PER_LONG == 32)
 #define __AMO(op)	"amo" #op ".w"
+#define __LR	"lr.w"
+#define __SC	"sc.w"
 #else
 #error "Unexpected BITS_PER_LONG"
 #endif
 
+#ifndef RISCV_AMO_USE_ZALRSC
 #define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
 ({								\
 	unsigned long __res, __mask;				\
@@ -211,6 +216,33 @@ static __always_inline int variable_fls(unsigned int x)
 		: "+A" (addr[BIT_WORD(nr)])			\
 		: "r" (mod(BIT_MASK(nr)))			\
 		: "memory");
+#else
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
+({								\
+	unsigned long __res, __mask, __temp;			\
+	__mask = BIT_MASK(nr);					\
+	__asm__ __volatile__ (					\
+		"1: " __LR #ord " %0, %1\n"			\
+		#op " %2, %0, %3\n"				\
+		__SC #ord " %2, %2, %1\n"			\
+		"bnez %2, 1b\n"					\
+		: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
+		: "r" (mod(__mask))				\
+		: "memory");					\
+	((__res & __mask) != 0);				\
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)			\
+	unsigned long __res, __temp;				\
+	__asm__ __volatile__ (					\
+		"1: " __LR #ord " %0, %1\n"			\
+		#op " %2, %0, %3\n"				\
+		__SC #ord " %2, %2, %1\n"			\
+		"bnez %2, 1b\n"					\
+		: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
+		: "r" (mod(BIT_MASK(nr)))			\
+		: "memory")
+#endif
 
 #define __test_and_op_bit(op, mod, nr, addr) 			\
 	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
@@ -354,12 +386,25 @@ static inline void arch___clear_bit_unlock(
 static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
 		volatile unsigned long *addr)
 {
+#ifndef RISCV_AMO_USE_ZALRSC
 	unsigned long res;
 	__asm__ __volatile__ (
 		__AMO(xor) ".rl %0, %2, %1"
 		: "=r" (res), "+A" (*addr)
 		: "r" (__NOP(mask))
 		: "memory");
+#else
+	unsigned long res, temp;
+
+	__asm__ __volatile__ (
+		"1: " __LR ".rl %0, %1\n"
+		"xor %2, %0, %3\n"
+		__SC ".rl %2, %2, %1\n"
+		"bnez %2, 1b\n"
+		: "=&r" (res), "+A" (*addr), "=&r" (temp)
+		: "r" (__NOP(mask))
+		: "memory");
+#endif
 	return (res & BIT(7)) != 0;
 }
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 4cadc56220fe..aba60f427060 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -51,6 +51,7 @@
 	}									\
 })
 
+#ifndef RISCV_AMO_USE_ZALRSC
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
 ({									\
 	__asm__ __volatile__ (						\
@@ -61,6 +62,21 @@
 		: "r" (n)						\
 		: "memory");						\
 })
+#else
+#define __arch_xchg(sfx, prepend, append, r, p, n)			\
+({									\
+	__typeof__(*(__ptr)) temp;					\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"1:	lr" sfx " %0, %1\n"				\
+		"	sc" sfx " %2, %3, %1\n"				\
+		"	bnez %2, 1b\n"					\
+		append							\
+		: "=&r" (r), "+A" (*(p)), "=&r" (temp)			\
+		: "r" (n)						\
+		: "memory");						\
+})
+#endif
 
 #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
 		   sc_append, swap_append)				\
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index fc8130f995c1..dc63065e707e 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -19,6 +19,7 @@
 #define __disable_user_access()		do { } while (0)
 #endif
 
+#ifndef RISCV_AMO_USE_ZALRSC
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
 {								\
 	__enable_user_access();					\
@@ -32,16 +33,39 @@
 	: "memory");						\
 	__disable_user_access();				\
 }
+#else
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
+{								\
+	__enable_user_access();					\
+	__asm__ __volatile__ (					\
+	"1:	lr.w.aqrl %[ov], %[u]\n"			\
+	"	" insn "\n"					\
+	"	sc.w.aqrl %[t], %[t], %[u]\n"			\
+	"	bnez %[t], 1b\n"				\
+	"2:\n"							\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r])			\
+	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
+	  [t] "=&r" (temp), [u] "+m" (*uaddr)			\
+	: [op] "Jr" (oparg)					\
+	: "memory");						\
+	__disable_user_access();				\
+}
+#endif
 
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 {
+#ifndef RISCV_AMO_USE_ZALRSC
 	int oldval = 0, ret = 0;
+#else
+	int oldval = 0, ret = 0, temp = 0;
+#endif
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 
 	switch (op) {
+#ifndef RISCV_AMO_USE_ZALRSC
 	case FUTEX_OP_SET:
 		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
 				  ret, oldval, uaddr, oparg);
@@ -62,6 +86,28 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
 				  ret, oldval, uaddr, oparg);
 		break;
+#else
+	case FUTEX_OP_SET:
+		__futex_atomic_op("mv %[t], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ADD:
+		__futex_atomic_op("add %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_OR:
+		__futex_atomic_op("or %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ANDN:
+		__futex_atomic_op("and %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, ~oparg);
+		break;
+	case FUTEX_OP_XOR:
+		__futex_atomic_op("xor %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+#endif
 	default:
 		ret = -ENOSYS;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
