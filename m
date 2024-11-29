Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8866D6EC13
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BW0/aIgD9pe7I0jpiJsf6/mVx2Ni9GzPq/vLnmPD5Wc=; b=j+p4gjmdFDqMAt
	hQ90YA7Nhq78hwcNjsizZhEDYxKLjqrMBWQILgH/VYJZpgqEQxreUr1Nx7l4botyjm5T7OU37l0qx
	bfbzjHnshtZfsVXQpPuVuMjIr0gxz4IxS5qWjUvF5SwtGhHMKQFkuZnDPvsnWEsWDJft1nZ8KQvmh
	fERcF6gMEN9DbLn4vDoE9Jb/r1fH7TQ/HlUKf33cSg2cUaQP78r2+RaahnR6OvcAOctMut3MD5s9h
	z78iIh1uTikuoDKwDO6Os+KfbIw8/uEfFdM2yxsMJ2G5YAyD8T6dmBBFcen5+pALpr1dn94k3Xsyr
	1BGdL9FJcOkNqunXisJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH2DR-00000000KnD-2N04;
	Fri, 29 Nov 2024 14:43:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH2DP-00000000KmY-06BI
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 14:43:28 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5cfbeed072dso3028961a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Nov 2024 06:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732891404; x=1733496204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PiHlVfiJ60V3G6owms/djjiMKMNOCjBfCEUldGOmp90=;
        b=P9jaO4iR5ReCupKZAjxVsXbZcws0Djrw1Ql/fY2V8t1pRjxR8SGJQQc79ISTCJyJeM
         BWZj0p8g5PCq/nMeZQEkSkpd3llh4gKx/Y9LJ5059nRiLwphAvyEdMyT+ep4o8scppFf
         kdg0mvadT4qT85/4SCr6WrLr16ycf5BdU1/maKXBRxtSMdRbiRhoKBrcPTCAkbkbxRoy
         aUf6kB9+FXQNVKir4hlrWOs+ypK+j2qKo3YsJi4qr4tBrq2Wm6KhZWFHHpr/qrvNGKNf
         oYIrA9S3a1RVVhyu0dz5ItQW4/fbsDg++ncQJsY3QMP/QUZ/MYCURa462K19nCDTtSIo
         edIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891404; x=1733496204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiHlVfiJ60V3G6owms/djjiMKMNOCjBfCEUldGOmp90=;
        b=XcoUMI04oc11OCT4/WNl747M6hA9FsOLP4ObEh6NOxwCWI7MLX7x3zM9wj/NAxI+Nf
         0p4M5C6fsf5Ckr+JfutDW4yVoh3Jzf8nbY1y8Aohh4rT9phx06dpbyxCBQCUmYLsFIqp
         9NS8mOESHYvj74E1mvl+gBa4eMetcVFOURCIHP0JjkAhu2fd0kTCxp4a22DP+wt+/UVk
         8zzY4pXg2+/7Rab7mx0EDejV4uLaTWbhhPhByt6+nwBZkvLP2FFOT1SHGOM4tIvKkuR6
         1R+H5erIl4Ah0COmnPsql0+PkNwCva1uQdrYNIUzIvoEG+Poi8bpTELcNord8jI6920H
         +MxQ==
X-Gm-Message-State: AOJu0YwewAViLHBcTsT/55apSOqv1bihJ5i29BYCZ8EUQPH9viTnE+fl
	GTSZXo3gMMapy1thEF417mpWYkZDcCf0tXe1MtMa6X9AGkzzJjL1aHipQkJa
X-Gm-Gg: ASbGncs9SGw38A2SRSfbNxAlAyhhrq6MryQXWhHrTYRKMq0U883rZvbGAE17Bmg5nq/
	fUivxg5bjazJksGYHkCZnTn/UfUT0ZWxKeX9ITqxsg0IaMXIGL9HLi68a2/ct1LVBOucS8FYeC5
	gH4CxCD+JgqTrccFDalWFv8YyTOiey+cwPC0tDtGuX82XqEEAu91TRfwAQ5zdujOeoFc6knwUeE
	kLzjR4pYPYFSGsVUjLvRkHbKQEShSxVcmdhU5P1eOtKTGX6nMtMhWbZOOEYvA==
X-Google-Smtp-Source: AGHT+IG0rNx1REuD5SvmWmALJN+JnxSGMt6psPHrgEJ3ol+4tvOlR3VOetIu+YlqI+fY6lJvQrPOqQ==
X-Received: by 2002:a17:907:aa5:b0:aa5:4ea6:fcae with SMTP id a640c23a62f3a-aa580f566d2mr1300523666b.28.1732891403773;
        Fri, 29 Nov 2024 06:43:23 -0800 (PST)
Received: from localhost.localdomain ([212.200.182.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6f99sm180703366b.131.2024.11.29.06.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:43:23 -0800 (PST)
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
Subject: [PATCH] riscv: Rewrite AMO instructions via lr and sc.
Date: Fri, 29 Nov 2024 15:43:19 +0100
Message-Id: <20241129144319.74257-1-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_064327_114722_F72FAB85 
X-CRM114-Status: GOOD (  14.53  )
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

Use lr and sc to implement all atomic functions. Some CPUs have
native support for lr and sc, but emulate AMO instructions through
trap handlers that are slow.

Add config RISCV_ISA_ZALRSC_ONLY.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
---
 arch/riscv/Kconfig               | 10 ++++++
 arch/riscv/include/asm/atomic.h  | 52 +++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 45 +++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++
 arch/riscv/include/asm/futex.h   | 46 ++++++++++++++++++++++++++++
 5 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cc63aef41e94..767538c27875 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -715,6 +715,16 @@ config RISCV_ISA_ZACAS
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_ZALRSC_ONLY
+	bool "Zalrsc extension support only"
+	default n
+	help
+	   Use lr and sc to build all atomic functions. Some CPUs have
+	   native support for lr and sc, but emulate amo instructions through
+	   trap handlers that are slow.
+
+	   If you don't know what to do here, say n.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 5b96c2f61adb..f484babecb9e 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
  * have the AQ or RL bits set.  These don't return anything, so there's only
  * one version to worry about.
  */
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
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
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
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
index fae152ea0508..b51cb18f7d9e 100644
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
 
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
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
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
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
index 4cadc56220fe..881082b05110 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -51,6 +51,7 @@
 	}									\
 })
 
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
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
index fc8130f995c1..47297f47ec35 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -19,6 +19,7 @@
 #define __disable_user_access()		do { } while (0)
 #endif
 
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
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
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
 	int oldval = 0, ret = 0;
+#else
+	int oldval = 0, ret = 0, temp = 0;
+#endif
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 
 	switch (op) {
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
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
