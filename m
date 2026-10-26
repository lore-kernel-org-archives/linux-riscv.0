Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F69606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BjWhKsMs;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=MW+FXFsF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a4dcewPSHBeMEu0s7RPXhEe47OsBrBunN2mws6T1IFg=; b=BjWhKsMs48944hykubhxcqKYFL
	LKsdTje8moFEekjK8Kr2hs00+jq7eoSNuc55mDnFiG924I8ciKInzI5sU8+oDBWzPIb4wdB71U6Zn
	gIYCLVVoT9ly8jvy3Iy6fCQWOUfhgq8RPiiIywIfoVQnnVlp2F6wFWKhiyS84PPvAKxjedKt8S4sA
	4s9rIDRbFCFd3oGtOgXjtBSSUjbPj+fulgXLemMmJBUJLi3GzDQSlUJh9Ng649EklYiAA172KrKnO
	qaDB+bdp6z0RTtwj8atunMVPz2P1TTnyqnqqq45muAUx/0+wU9MswwQN5EShNEjQjGGqvFIImlRRk
	5N+2CMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGsa-000000021zY-3Hf4;
	Mon, 26 Oct 2026 09:20:32 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGsW-000000021yP-0c1v
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 09:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793006428; x=1824542428;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tmdjYqls5S3ILiAVJbzQUHItr+ZknqpbkT1QCRnEeYk=;
  b=MW+FXFsF8YwDEEe1XF0+SYjssT8Sdkk6MwDzg+9s55++rA1OSohobsuP
   UNzI72SHCtQ+EqJzvvt8mm2Lj8HitW5CBzn6tZrT4M6OuJr1xR98lKcgA
   1IizK/sZRjuLaF28znmH0vkaklIsqBwAN2zlhKUqO+MfHx6EE5Tyi/sOs
   Vyiltxw1OsqxLoNJZppu+te2BdY3SGKUk3xw/CiSz0m6oGvWs+c+r3bYX
   WitjvvRLVyTM+TemBw32YVr9JDMN9OHEcFkjaEfAlU1Yo9SFLp7T+35yb
   4Y0vjt4ACUXmvWoarTzMfarV1S56nSK8YBAH/ItH+ixpk7YkEljH8TnVF
   w==;
X-CSE-ConnectionGUID: 2TKWzQ1YSHSHH7JVJ6W+JA==
X-CSE-MsgGUID: JhSHh3uxQwWCp5VcY/eUMg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:20:23 +0200
X-CSE-ConnectionGUID: 5DCYTuXtTLiDl8mTo8xqIQ==
X-CSE-MsgGUID: 99XWzBgNRvWikHEbujDcsA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 26 Oct 2026 11:28:06 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 26 Oct 2026 11:20:22 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 26 Oct 2026 11:20:02 +0200
Subject: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
In-Reply-To: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com, 
 torvalds@linux-foundation.org, olof@lixom.net, 
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_022028_607902_649C5DF8 
X-CRM114-Status: GOOD (  20.16  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The A extension is Zaamo plus Zalrsc. MIPS P8700 implements only
Zalrsc, and its AMO instructions trap to SBI. A typical atomic is
about 40 cycles with LR/SC and about 600 cycles with an emulated AMO,
so keep the existing AMO sequences when the toolchain defines
__riscv_zaamo or __riscv_atomic, and use an LR/SC loop otherwise.

Add RISCV_ISA_ZAAMO and RISCV_ISA_ZALRSC. Both default on, and that
selection still passes "a" in -march. Zaamo can be turned off only
with CONFIG_NONPORTABLE; Zalrsc remains required because cmpxchg and
the conditional atomics are LR/SC sequences. An LR/SC-only build
passes _zalrsc instead of "a".

Suggested-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/Kconfig               | 23 +++++++++++++++++
 arch/riscv/Makefile              | 15 ++++++++---
 arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
 arch/riscv/include/asm/futex.h   | 53 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/entry.S        |  9 +++++++
 arch/riscv/kernel/head.S         | 14 ++++++++++
 8 files changed, 234 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..1403445482b9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -730,6 +730,29 @@ config RISCV_ISA_ZACAS
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_ZAAMO
+	bool "Zaamo extension support for AMO atomics" if NONPORTABLE
+	default y
+	help
+	  Use AMO instructions for kernel atomic memory operations. When
+	  disabled, those operations are built from LR/SC and the kernel
+	  is compiled with zalrsc instead of the A extension.
+
+	  Disable this only for a hart that implements Zalrsc but not
+	  Zaamo, such as the MIPS P8700. The resulting kernel cannot run
+	  on a hart without LR/SC.
+
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_ZALRSC
+	def_bool y
+	help
+	  Zalrsc provides LR/SC. cmpxchg and the conditional atomics
+	  require it, so it is always enabled.
+
+config RISCV_ISA_A
+	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 44f5a439741a..23ecf68a761d 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,8 +58,9 @@ ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
 endif
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
+riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32im
+riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64im
+riscv-march-$(CONFIG_RISCV_ISA_A)	:= $(riscv-march-y)a
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
@@ -75,9 +76,15 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
-KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima?|rv64ima?)fd([^v_]*)v?/\1\2/')
 export KBUILD_BASE_ISA
 
+# if "A" not supported, toolchain shall support zaamo/zalrsc
+ifneq ($(CONFIG_RISCV_ISA_A),y)
+riscv-march-$(CONFIG_RISCV_ISA_ZAAMO) := $(riscv-march-y)_zaamo
+riscv-march-$(CONFIG_RISCV_ISA_ZALRSC) := $(riscv-march-y)_zalrsc
+endif
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
@@ -85,7 +92,7 @@ KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 # For C code built with floating-point support, exclude V but keep F and D.
-CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima?|rv64ima?)([^v_]*)v?/\1\2/')
 
 KBUILD_CFLAGS += -mno-save-restore
 
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 616b8b332ac5..dc6a8c95c975 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
  * have the AQ or RL bits set.  These don't return anything, so there's only
  * one version to worry about.
  */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
 static __always_inline							\
 void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
@@ -59,7 +60,25 @@ void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
 		: "+A" (v->counter)					\
 		: "r" (I)						\
 		: "memory");						\
-}									\
+}
+#elif defined(__riscv_zalrsc)
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
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #ifdef CONFIG_GENERIC_ATOMIC64
 #define ATOMIC_OPS(op, asm_op, I)					\
@@ -84,6 +103,7 @@ ATOMIC_OPS(xor, xor,  i)
  * There's two flavors of these: the arithmetic ops have both fetch and return
  * versions, while the logical ops only have fetch versions.
  */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
 static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
@@ -108,6 +128,40 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
 		: "memory");						\
 	return ret;							\
 }
+#elif defined(__riscv_zalrsc)
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
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)	\
 static __always_inline							\
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 3c1a15be54d8..311547558ff5 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -170,12 +170,17 @@ static __always_inline int variable_fls(unsigned int x)
 
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
 
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
 ({								\
 	unsigned long __res, __mask;				\
@@ -194,6 +199,37 @@ static __always_inline int variable_fls(unsigned int x)
 		: "+A" (addr[BIT_WORD(nr)])			\
 		: "r" (mod(BIT_MASK(nr)))			\
 		: "memory");
+#elif defined(__riscv_zalrsc)
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
+do {								\
+	unsigned long __res, __temp;				\
+	__asm__ __volatile__ (					\
+		"1: " __LR #ord " %0, %1\n"			\
+		#op " %2, %0, %3\n"				\
+		__SC #ord " %2, %2, %1\n"			\
+		"bnez %2, 1b\n"					\
+		: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
+		: "r" (mod(BIT_MASK(nr)))			\
+		: "memory");					\
+} while (0)
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #define __test_and_op_bit(op, mod, nr, addr) 			\
 	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
@@ -337,12 +373,27 @@ static __always_inline void arch___clear_bit_unlock(
 static __always_inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
 		volatile unsigned long *addr)
 {
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	unsigned long res;
 	__asm__ __volatile__ (
 		__AMO(xor) ".rl %0, %2, %1"
 		: "=r" (res), "+A" (*addr)
 		: "r" (__NOP(mask))
 		: "memory");
+#elif defined(__riscv_zalrsc)
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
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 	return (res & BIT(7)) != 0;
 }
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 662e160b0522..0399c5b4ef35 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -57,6 +57,7 @@
 	}									\
 })
 
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
 ({									\
 	__asm__ __volatile__ (						\
@@ -67,6 +68,23 @@
 		: "r" (n)						\
 		: "memory");						\
 })
+#elif defined(__riscv_zalrsc)
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
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
 		   sc_append, swap_append)				\
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 6f3bc9bdb85e..06fe227197d9 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -19,6 +19,7 @@
 #define __disable_user_access()		do { } while (0)
 #endif
 
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
 {								\
 	__enable_user_access();					\
@@ -32,17 +33,45 @@
 	: "memory");						\
 	__disable_user_access();				\
 }
+#elif defined(__riscv_zalrsc)
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
+{								\
+	__enable_user_access();					\
+	__asm__ __volatile__ (					\
+	"1:	lr.w.aqrl %[ov], %[u]			\n"	\
+	"	" insn "				\n"	\
+	"2:	sc.w.aqrl %[t], %[t], %[u]		\n"	\
+	"	bnez %[t], 1b				\n"	\
+	"3:						\n"	\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])			\
+	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])			\
+	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
+	  [t] "=&r" (temp), [u] "+m" (*(uaddr))			\
+	: [op] "Jr" (oparg)					\
+	: "memory");						\
+	__disable_user_access();				\
+}
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 {
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	int oldval = 0, ret = 0;
+#elif defined(__riscv_zalrsc)
+	int oldval = 0, ret = 0, temp = 0;
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 	uaddr = untagged_addr(uaddr);
 
 	switch (op) {
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	case FUTEX_OP_SET:
 		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
 				  ret, oldval, uaddr, oparg);
@@ -63,6 +92,30 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
 				  ret, oldval, uaddr, oparg);
 		break;
+#elif defined(__riscv_zalrsc)
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
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 	default:
 		ret = -ENOSYS;
 	}
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..1c7bbd7fbff8 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -73,7 +73,16 @@
 	beq	a2, zero, .Lnew_valid_map_cpus_restore_context
 
 	/* Atomically reset the current cpu bit in new_valid_map_cpus */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	amoxor.d	a0, a1, (a0)
+#elif defined(__riscv_zalrsc)
+1:	lr.d	a2, (a0)
+	xor	a2, a1, a2
+	sc.d	a2, a2, (a0)
+	bnez	a2, 1b
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 	/*
 	 * A sfence.vma is required here. Even if we had Svvptc, there's no
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f6a8ca49e627..515669bbbc96 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -265,7 +265,21 @@ SYM_CODE_START(_start_kernel)
 	/* Pick one hart to run the main boot sequence */
 	la a3, hart_lottery
 	li a2, 1
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	amoadd.w a3, a2, (a3)
+#elif defined(__riscv_zalrsc)
+	/*
+	 * hart_lottery is a small 32-bit counter. add is valid on RV32
+	 * and RV64; sc.w stores the low 32 bits.
+	 */
+1:	lr.w t0, (a3)
+	add t1, t0, a2
+	sc.w t1, t1, (a3)
+	bnez t1, 1b
+	mv a3, t0
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 	bnez a3, .Lsecondary_start
 #endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
