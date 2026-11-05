Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E21606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URj4fe/G;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=ID2kExw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1UqPGnB4T+9ChAkMZ3EETj4MGGm2Jkg8OZD0PtXOWmA=; b=URj4fe/GA8sh96zbbpk6igUjaU
	Iz+VaO1DLd8+kZ9hf4Pvj4FmLyPBK2AQgPH9JLhCHJ1Ys5ac+LC+WomCakZXIQlxwvuHREgDbskqj
	T4sqCMolz+o00FK/z3UUSerolXkdna/vESe+HfNth82TcULumUOL6RXQ6NP5gEjJiaJsVdgQC8rzE
	mTopMEGZ92AITSAUWGKtOdZ+pzQoSXTMhMzsHZiufQNGAzZFul49/xyrC15imslzef9yZOqj44Y7n
	AKZfA1AVPXV6VirV3qtV3o4zDC/wnwtIEh5ebbbjOpQ18Jvl4AT7cLHUOt8UDMMhdhfHSyELIu8s/
	MZ7Xdy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0U8-00000009fFd-2muI;
	Thu, 05 Nov 2026 16:38:45 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Ti-00000009f9A-1E45
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793896705; x=1825432705;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6lUsD4ql430ZzV7s7SDoAsd9A0KvKd+GTXfXrL2y3sk=;
  b=ID2kExw7F036wpx6DNL71JZN2d+T/vp8xoFidv3M+vWSdvbuqpDyzO/h
   kClcujQNsKthtu/77l4eFGGPADBqRcQouyatf+2FyGz/Xuqw/Mk85eIFf
   S6twg+wiY2D0pU2zrgEdMFWBQCxNeKzuaYpCSQofkkTWID1/7hPWdeG/o
   BLtly5cWyEzMlw5Y+WWqp1h7ReTjBCdQbkfzrhQ6lrvML1U3wNH19dq4p
   S8Z8+zvh3FIw8HMyfDZr7LeTibvENNlp9aPMtfDa7iorohDpYgXY5aKCi
   eso4CnnK0I97Px+U8HhshO9aUHNxt5r4V5+iQXGlqQidqIUOuaKL4FFo6
   g==;
X-CSE-ConnectionGUID: /k5VEdz7QDWmamotzytxHA==
X-CSE-MsgGUID: 0mwAUd/sReGc/Hy28K3kvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 18:38:22 +0200
X-CSE-ConnectionGUID: 7gusZTxvQzWEYBzlj9BYNA==
X-CSE-MsgGUID: +RUProG/RLiGn9Ebp4KneQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 05 Nov 2026 18:46:12 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 18:38:13 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 05 Nov 2026 18:37:36 +0200
Subject: [PATCH v5 1/3] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-lrsc-only-v5-1-f0648f57b2e1@mobileye.com>
References: <20261105-lrsc-only-v5-0-f0648f57b2e1@mobileye.com>
In-Reply-To: <20261105-lrsc-only-v5-0-f0648f57b2e1@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Chao-ying Fu <chao-ying.fu@globalfoundries.com>, 
 torvalds@linux-foundation.org, olof@lixom.net, 
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_083827_172939_DEF2F4C5 
X-CRM114-Status: GOOD (  27.21  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The A extension is Zaamo plus Zalrsc. On some CPUs Zaamo is present
only formally. MIPS P8700 traps every AMO instruction into M-mode and
emulates it there, so the extension is supported but very slow. A
typical uncontended atomic increment costs:

  native AMO                                     2..5 cycles
  LR/SC, private L1 reservation monitor         6..12 cycles
  LR/SC, PoC (L2) reservation monitor       about 40 cycles
  AMO emulated by an M-mode trap           about 600 cycles

The last two were measured on the eyeq7h hardware. On such a CPU the
kernel must use LR/SC for every atomic.

Add RISCV_ISA_ZAAMO, default y. The default keeps "a" in -march and
the generated code unchanged. When it is disabled, -march carries
_zalrsc instead of "a", and atomic_*, bitops, xchg, futex and the
early boot code use LR/SC loops. The sequence is chosen with the
preprocessor, on CONFIG_RISCV_ISA_ZAAMO like the other ISA options in
the headers, because the assembler rejects AMO mnemonics once -march
lacks Zaamo. A kernel built this way runs on any hart that implements A; it just
does not use AMO. It is therefore a plain option, not a NONPORTABLE
one, and the hart keeps advertising "a" to userspace, which is true.

The choice is made at compile time rather than with alternatives.
Nearly every CPU has a native A extension, and an alternative would
inflate all those kernels with the nops needed to pad one AMO to the
size of an LR/SC loop, at every atomic site, for the benefit of a few.

Turning Zaamo off needs a compiler that accepts _zaamo and _zalrsc in
-march. GCC 15.1 is the first release that does.
TOOLCHAIN_HAS_ZALRSC_ZAAMO checks for it; with an older compiler the
option stays at y.

Add RISCV_ISA_ZALRSC as well, always y, because cmpxchg and the
conditional atomics are LR/SC sequences that Zaamo cannot replace. It
exists as the Kconfig counterpart of RISCV_ISA_EXT_ZALRSC in hwcap.h,
added by commit 35173b666a16 ("riscv: add parsing for Zaamo and Zalrsc
extensions"). The two sets are used together, for instance by
rv_ext_enabled() in the BPF JIT, so an extension the kernel can be
built for has both. RISCV_ISA_A, the counterpart of RISCV_ISA_EXT_A,
follows the same rule and puts "a" in -march.

Three sets of extensions provide every atomic Linux needs. "a" is what
the kernel supports today. Zalrsc plus Ziccrse is what this patch adds:
every atomic is a constrained LR/SC loop, and Ziccrse is the
forward-progress guarantee for such loops. Zaamo plus Zacas would do as
well, with CAS loops in place of LR/SC as on x86. This patch leaves
that option open: RISCV_ISA_ZALRSC is where it would go, by allowing
"n" there and making amocas the base implementation.

Suggested-by: Chao-ying Fu <chao-ying.fu@globalfoundries.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/Kconfig               | 53 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile              | 16 +++++++++---
 arch/riscv/include/asm/atomic.h  | 52 ++++++++++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 47 +++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++++
 arch/riscv/include/asm/futex.h   | 45 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/entry.S        |  7 ++++++
 arch/riscv/kernel/head.S         | 12 +++++++++
 8 files changed, 243 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..07d15a0bb379 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -730,6 +730,59 @@ config RISCV_ISA_ZACAS
 
 	  If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZALRSC_ZAAMO
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64im_zaamo_zalrsc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32im_zaamo_zalrsc)
+
+config RISCV_ISA_ZAAMO
+	bool "Zaamo extension support for AMO atomics" if TOOLCHAIN_HAS_ZALRSC_ZAAMO
+	default y
+	help
+	  Use AMO instructions for kernel atomic memory operations. When
+	  disabled, those operations are built from LR/SC and the kernel
+	  is compiled with zalrsc instead of the A extension.
+
+	  Disable this for a CPU where AMO is much slower than LR/SC. That
+	  is the case when AMO instructions are emulated by a trap into
+	  M-mode, as on the MIPS P8700: an emulated atomic costs hundreds
+	  of cycles where LR/SC costs tens. Such a CPU still advertises
+	  the A extension, and userspace still sees it.
+
+	  A kernel built without Zaamo runs on any CPU that implements the
+	  A extension; it only does not use AMO.
+
+	  The compiler must accept _zaamo and _zalrsc in -march to make
+	  this choice. GCC 15.1 is the first release that does. With an
+	  older compiler the option stays enabled and -march keeps the A
+	  extension.
+
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_ZALRSC
+	def_bool y
+	help
+	  Zalrsc provides LR/SC. cmpxchg and the conditional atomics are
+	  LR/SC sequences, so this is always enabled.
+
+	  It exists because asm/hwcap.h already has RISCV_ISA_EXT_ZALRSC
+	  next to RISCV_ISA_EXT_ZAAMO, and the kernel pairs each
+	  RISCV_ISA_EXT_<ext> it can be built for with a
+	  CONFIG_RISCV_ISA_<ext>; rv_ext_enabled() in the BPF JIT, for
+	  example, tests both.
+
+	  Zaamo plus Zacas could provide every atomic as well, with CAS
+	  loops in place of LR/SC. This option is where that would go,
+	  by allowing it to be disabled.
+
+config RISCV_ISA_A
+	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
+	help
+	  The A extension is Zaamo plus Zalrsc. This is the Kconfig
+	  counterpart of RISCV_ISA_EXT_A, for the same reason as
+	  RISCV_ISA_ZALRSC above, and puts "a" in -march.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 44f5a439741a..5cdc9cc017bb 100644
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
@@ -75,9 +76,16 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
-KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima?|rv64ima?)fd([^v_]*)v?/\1\2/')
 export KBUILD_BASE_ISA
 
+# Without "a", name the sub-extensions. Zaamo can be off only when the
+# compiler accepts _zaamo and _zalrsc in -march.
+ifneq ($(CONFIG_RISCV_ISA_A),y)
+riscv-march-$(CONFIG_RISCV_ISA_ZAAMO) := $(riscv-march-y)_zaamo
+riscv-march-$(CONFIG_RISCV_ISA_ZALRSC) := $(riscv-march-y)_zalrsc
+endif
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
@@ -85,7 +93,7 @@ KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 # For C code built with floating-point support, exclude V but keep F and D.
-CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima?|rv64ima?)([^v_]*)v?/\1\2/')
 
 KBUILD_CFLAGS += -mno-save-restore
 
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 616b8b332ac5..3b189bea1d08 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
  * have the AQ or RL bits set.  These don't return anything, so there's only
  * one version to worry about.
  */
+#ifdef CONFIG_RISCV_ISA_ZAAMO
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
  * There's two flavors of these: the arithmetic ops have both fetch and return
  * versions, while the logical ops only have fetch versions.
  */
+#ifdef CONFIG_RISCV_ISA_ZAAMO
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
index 3c1a15be54d8..ab3ffc3bfcfc 100644
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
 
+#ifdef CONFIG_RISCV_ISA_ZAAMO
 #define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
 ({								\
 	unsigned long __res, __mask;				\
@@ -194,6 +199,35 @@ static __always_inline int variable_fls(unsigned int x)
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
+#endif
 
 #define __test_and_op_bit(op, mod, nr, addr) 			\
 	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
@@ -337,12 +371,25 @@ static __always_inline void arch___clear_bit_unlock(
 static __always_inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
 		volatile unsigned long *addr)
 {
+#ifdef CONFIG_RISCV_ISA_ZAAMO
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
index 662e160b0522..883dc4aa1dc3 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -57,6 +57,7 @@
 	}									\
 })
 
+#ifdef CONFIG_RISCV_ISA_ZAAMO
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
 ({									\
 	__asm__ __volatile__ (						\
@@ -67,6 +68,21 @@
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
index 6f3bc9bdb85e..58f12bf2af68 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -19,6 +19,7 @@
 #define __disable_user_access()		do { } while (0)
 #endif
 
+#ifdef CONFIG_RISCV_ISA_ZAAMO
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
 {								\
 	__enable_user_access();					\
@@ -32,6 +33,27 @@
 	: "memory");						\
 	__disable_user_access();				\
 }
+#else
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
+{								\
+	int temp;						\
+								\
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
+#endif
 
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
@@ -43,6 +65,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 	uaddr = untagged_addr(uaddr);
 
 	switch (op) {
+#ifdef CONFIG_RISCV_ISA_ZAAMO
 	case FUTEX_OP_SET:
 		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
 				  ret, oldval, uaddr, oparg);
@@ -63,6 +86,28 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
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
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..ba2db6804a6c 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -73,7 +73,14 @@
 	beq	a2, zero, .Lnew_valid_map_cpus_restore_context
 
 	/* Atomically reset the current cpu bit in new_valid_map_cpus */
+#ifdef CONFIG_RISCV_ISA_ZAAMO
 	amoxor.d	a0, a1, (a0)
+#else
+1:	lr.d	a2, (a0)
+	xor	a2, a1, a2
+	sc.d	a2, a2, (a0)
+	bnez	a2, 1b
+#endif
 
 	/*
 	 * A sfence.vma is required here. Even if we had Svvptc, there's no
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f6a8ca49e627..dc3862ed29c4 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -265,7 +265,19 @@ SYM_CODE_START(_start_kernel)
 	/* Pick one hart to run the main boot sequence */
 	la a3, hart_lottery
 	li a2, 1
+#ifdef CONFIG_RISCV_ISA_ZAAMO
 	amoadd.w a3, a2, (a3)
+#else
+	/*
+	 * hart_lottery is a small 32-bit counter. add is valid on RV32
+	 * and RV64; sc.w stores the low 32 bits.
+	 */
+1:	lr.w t0, (a3)
+	add t1, t0, a2
+	sc.w t1, t1, (a3)
+	bnez t1, 1b
+	mv a3, t0
+#endif
 	bnez a3, .Lsecondary_start
 #endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
