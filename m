Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD5D31A15
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=quibPApe0fknAF69ShlvLCZabmHDztHmmpYz4fIcri8=; b=tjXs6WJ58gH0n1
	R5A3UCx7GbHtNuQrs2olIbBqBCsJFoJXIsh8aEiyBY42dHmWuH3anJwj8sNfUR1dPuec6484Dl43m
	jdyj2I3WShbCNVHn/OoK5hGrxQhYaZ/PivB1AXg+UIHGlcjdJ19357W//6PwMbcfkxymsqHfeb5DX
	hG7mPp0hP4DhKUw0gPfvx18FVsI/+LDpesDp+1DEwtrtxYH9YUAEgVZK+zEl7RrM2Yk3OtvmFybyq
	xLRuKtC1ytc2zgj5GV+XJMluExTmzqRGD+Gab4J9BjtRWuu0gcbMSannSW4QR/57zmstm5gkYJa+Y
	Xsu5D4i51SO4eXDhcVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvGb-00000008BwE-1696;
	Wed, 14 Jan 2026 07:26:09 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvGT-00000008Bv1-1S4u
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 07:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768375559; x=1799911559;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bkMtHSp7j199SkLkgFKQFlfrozxXN125QPSFUEGbH0g=;
  b=YwFfQtsnpSIM26ULqcc8fuQftkoybn93DGatjt17V6uNP2gfTFeEYJU7
   PfZW5tHmpB3C7yEKmBefNMMBqTum8yQUMrguDgfd9d/WNHfAEiM3Hc5I3
   0X46AfTrFfrT7iSi43GYL1kRZTrjOf/9YKLOEgxqkv8+s/IfvklS3TGzV
   NfDkSY2JRwbmYzmBc6z/sLmKQCYYWjeys/RLIYX43Qvs2tks3JO/3rVwU
   uFIPlgEY2zaQHOhtau0mEVc2zfAabbPOVzHC954OwFW4nV0YKQeYlOof9
   1fRqxElHz5+5EmBuq96CySVP/26x3OQPdqhPDjeDAdEW8Q5IFMnHXCWhK
   Q==;
X-CSE-ConnectionGUID: fQFJjdBpQOChTNsn4+KLNA==
X-CSE-MsgGUID: w2JdkN8jQrChEvcvPhVJiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 09:25:55 +0200
X-CSE-ConnectionGUID: t9diBGbhRamI9dY8D+1Kzw==
X-CSE-MsgGUID: 1CXL7whqTTiBUR987YaxFQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 14 Jan 2026 09:27:46 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 09:25:55 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Chao-ying Fu <cfu@mips.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: support CPUs having only "zalrsc" but no "zaamo"
Date: Wed, 14 Jan 2026 09:25:49 +0200
Message-ID: <20260114072552.731974-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232602_051167_E958208F 
X-CRM114-Status: GOOD (  16.15  )
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

riscv have 3 instruction set extensions related to atomic operations:
- "zaamo": atomic instructions like AMOADD
- "zalrsc": LR and SC instructions
- "a" that is "zaamo" + "zalrsc"

Historically, "a" was first, and Linux was relying on "a";
then "zaamo"/"zalrsc" was introduced. It is possible to implement
most atomic operations with either AMO or LR/SC. AMO if more efficient
however more complex flows are possible with LR/SC only.

Platforms supporting only part of atomics starting to appear.
Notable is MIPS P8700 CPU [1] having only "zalrsc".

CPU reports ISA extensions supported in the "riscv,isa-extensions"
property of the CPU OF node. Platform supporting "zalrsc" only should
report "zalrsc" but no "a" in this property.

For the early stages of execution, before alternatives applied,
(ex: head.S) CPUs having no "zaamo" extension rely on firmware
emulating AMO through "invalid instruction" trap to the M-mode.

Speed-up the rest of execution using ALTERNATIVE,
replacing AMO versions with LR/SC ones

Implementation is generic, inspired by the patch [2]
by developers listed below, implementing similar patch as errata
for the MIPS P8700 CPU

[1] https://mips.com/products/hardware/p8700/
[2] https://lore.kernel.org/all/20251014-p8700-zalrsc-v3-1-9d81bd8093e0@htecgroup.com/

Suggested-by: Chao-ying Fu <cfu@mips.com>
Suggested-by: Aleksandar Rikalo <arikalo@gmail.com>
Suggested-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/include/asm/atomic.h    |  29 ++-----
 arch/riscv/include/asm/bitops.h    |  38 ++++----
 arch/riscv/include/asm/cmpxchg.h   |  13 +--
 arch/riscv/include/asm/futex.h     |  35 ++++----
 arch/riscv/include/asm/processor.h | 134 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/cpu.c            |  12 ++-
 arch/riscv/kernel/cpufeature.c     |   5 ++
 arch/riscv/kernel/entry.S          |   8 +-
 8 files changed, 198 insertions(+), 76 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 5b96c2f61adb..fadfbc30ac1a 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -54,12 +54,9 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
 static __always_inline							\
 void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
 {									\
-	__asm__ __volatile__ (						\
-		"	amo" #asm_op "." #asm_type " zero, %1, %0"	\
-		: "+A" (v->counter)					\
-		: "r" (I)						\
-		: "memory");						\
-}									\
+	register __maybe_unused c_type ret, temp;			\
+	ALT_ATOMIC_OP(asm_op, I, asm_type, v, ret, temp);		\
+}
 
 #ifdef CONFIG_GENERIC_ATOMIC64
 #define ATOMIC_OPS(op, asm_op, I)					\
@@ -89,24 +86,16 @@ static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
 					     atomic##prefix##_t *v)	\
 {									\
-	register c_type ret;						\
-	__asm__ __volatile__ (						\
-		"	amo" #asm_op "." #asm_type " %1, %2, %0"	\
-		: "+A" (v->counter), "=r" (ret)				\
-		: "r" (I)						\
-		: "memory");						\
+	register __maybe_unused c_type ret, temp;			\
+	ALT_ATOMIC_FETCH_OP_RELAXED(asm_op, I, asm_type, v, ret, temp);	\
 	return ret;							\
 }									\
 static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
-{									\
-	register c_type ret;						\
-	__asm__ __volatile__ (						\
-		"	amo" #asm_op "." #asm_type ".aqrl  %1, %2, %0"	\
-		: "+A" (v->counter), "=r" (ret)				\
-		: "r" (I)						\
-		: "memory");						\
-	return ret;							\
+{										\
+	register __maybe_unused c_type ret, temp;				\
+	ALT_ATOMIC_FETCH_OP(asm_op, I, asm_type, v, ret, temp);			\
+	return ret;								\
 }
 
 #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)	\
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 77880677b06e..926d1fe91f7b 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -187,30 +187,27 @@ static __always_inline int variable_fls(unsigned int x)
 
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
 
-#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
-({								\
-	unsigned long __res, __mask;				\
-	__mask = BIT_MASK(nr);					\
-	__asm__ __volatile__ (					\
-		__AMO(op) #ord " %0, %2, %1"			\
-		: "=r" (__res), "+A" (addr[BIT_WORD(nr)])	\
-		: "r" (mod(__mask))				\
-		: "memory");					\
-	((__res & __mask) != 0);				\
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)				\
+({										\
+	__maybe_unused unsigned long __res, __mask, __temp;			\
+	__mask = BIT_MASK(nr);							\
+	ALT_TEST_AND_OP_BIT_ORD(op, mod, nr, addr, ord, __res, __mask, __temp);	\
+	((__res & __mask) != 0);						\
 })
 
-#define __op_bit_ord(op, mod, nr, addr, ord)			\
-	__asm__ __volatile__ (					\
-		__AMO(op) #ord " zero, %1, %0"			\
-		: "+A" (addr[BIT_WORD(nr)])			\
-		: "r" (mod(BIT_MASK(nr)))			\
-		: "memory");
+#define __op_bit_ord(op, mod, nr, addr, ord)					\
+	__maybe_unused unsigned long __res, __temp;				\
+	ALT_OP_BIT_ORD(op, mod, nr, addr, ord, __res, __temp)
 
 #define __test_and_op_bit(op, mod, nr, addr) 			\
 	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
@@ -354,12 +351,9 @@ static __always_inline void arch___clear_bit_unlock(
 static __always_inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
 		volatile unsigned long *addr)
 {
-	unsigned long res;
-	__asm__ __volatile__ (
-		__AMO(xor) ".rl %0, %2, %1"
-		: "=r" (res), "+A" (*addr)
-		: "r" (__NOP(mask))
-		: "memory");
+	__maybe_unused unsigned long res, temp;
+
+	ALT_ARCH_XOR_UNLOCK(mask, addr, res, temp);
 	return (res & BIT(7)) != 0;
 }
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 122e1485d39a..b231b49bcc66 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -54,15 +54,10 @@
 	}									\
 })
 
-#define __arch_xchg(sfx, prepend, append, r, p, n)			\
-({									\
-	__asm__ __volatile__ (						\
-		prepend							\
-		"	amoswap" sfx " %0, %2, %1\n"			\
-		append							\
-		: "=r" (r), "+A" (*(p))					\
-		: "r" (n)						\
-		: "memory");						\
+#define __arch_xchg(sfx, prepend, append, r, p, n)		\
+({								\
+	__typeof__(*(__ptr)) __maybe_unused temp;		\
+	ALT_ARCH_XCHG(sfx, prepend, append, r, p, n, temp);	\
 })
 
 #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 90c86b115e00..d4b8660bc345 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -19,48 +19,43 @@
 #define __disable_user_access()		do { } while (0)
 #endif
 
-#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg, temp)	\
+{									\
+	__enable_user_access();						\
+	ALT_FUTEX_ATOMIC_OP(insn, ret, oldval, uaddr, oparg, temp);	\
+	__disable_user_access();					\
+}
+
+#define __futex_atomic_swap(ret, oldval, uaddr, oparg, temp)	\
 {								\
 	__enable_user_access();					\
-	__asm__ __volatile__ (					\
-	"1:	" insn "				\n"	\
-	"2:						\n"	\
-	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r])			\
-	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
-	  [u] "+m" (*uaddr)					\
-	: [op] "Jr" (oparg)					\
-	: "memory");						\
+	ALT_FUTEX_ATOMIC_SWAP(ret, oldval, uaddr, oparg, temp);	\
 	__disable_user_access();				\
 }
 
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 {
-	int oldval = 0, ret = 0;
+	int __maybe_unused oldval = 0, ret = 0, temp = 0;
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 
 	switch (op) {
 	case FUTEX_OP_SET:
-		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
-				  ret, oldval, uaddr, oparg);
+		__futex_atomic_swap(ret, oldval, uaddr, oparg, temp);
 		break;
 	case FUTEX_OP_ADD:
-		__futex_atomic_op("amoadd.w.aqrl %[ov],%z[op],%[u]",
-				  ret, oldval, uaddr, oparg);
+		__futex_atomic_op(add, ret, oldval, uaddr, oparg, temp);
 		break;
 	case FUTEX_OP_OR:
-		__futex_atomic_op("amoor.w.aqrl %[ov],%z[op],%[u]",
-				  ret, oldval, uaddr, oparg);
+		__futex_atomic_op(or, ret, oldval, uaddr, oparg, temp);
 		break;
 	case FUTEX_OP_ANDN:
-		__futex_atomic_op("amoand.w.aqrl %[ov],%z[op],%[u]",
-				  ret, oldval, uaddr, ~oparg);
+		__futex_atomic_op(and, ret, oldval, uaddr, oparg, temp);
 		break;
 	case FUTEX_OP_XOR:
-		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
-				  ret, oldval, uaddr, oparg);
+		__futex_atomic_op(xor, ret, oldval, uaddr, oparg, temp);
 		break;
 	default:
 		ret = -ENOSYS;
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index da5426122d28..74a7650a25e9 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -151,7 +151,139 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 #define PREFETCHW_ASM(x)						\
 	ALTERNATIVE(__nops(1), PREFETCH_W(x, 0), 0,			\
 		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
-
+/* atomics - begin */
+#define ALT_ATOMIC_OP(asm_op, I, asm_type, v, ret, temp)		\
+asm(ALTERNATIVE(							\
+		"	amo" #asm_op "." #asm_type " zero, %3, %0\n"	\
+		__nops(3),						\
+		"1:	lr." #asm_type " %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type " %2, %2, %0\n"			\
+		"	bnez %2, 1b\n",					\
+		0, RISCV_ISA_EXT_ZALRSC, 1)				\
+	: "+A" ((v)->counter), "=&r" (ret), "=&r" (temp)		\
+	: "r" (I)							\
+	: "memory")
+
+#define ALT_ATOMIC_FETCH_OP_RELAXED(asm_op, I, asm_type, v, ret, temp)	\
+asm(ALTERNATIVE(							\
+		"	amo" #asm_op "." #asm_type " %1, %3, %0\n"	\
+		__nops(3),						\
+		"1:	lr." #asm_type " %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type " %2, %2, %0\n"			\
+		"	bnez %2, 1b\n",					\
+		0, RISCV_ISA_EXT_ZALRSC, 1)				\
+	: "+A" ((v)->counter), "=&r" (ret), "=&r" (temp)		\
+	: "r" (I)							\
+	: "memory")
+
+#define ALT_ATOMIC_FETCH_OP(asm_op, I, asm_type, v, ret, temp)		\
+asm(ALTERNATIVE(							\
+		"	amo" #asm_op "." #asm_type ".aqrl  %1, %3, %0\n"\
+		__nops(3),						\
+		"1:	lr." #asm_type ".aqrl %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type ".aqrl %2, %2, %0\n"		\
+		"	bnez %2, 1b\n",					\
+		0, RISCV_ISA_EXT_ZALRSC, 1)				\
+	: "+A" ((v)->counter), "=&r" (ret), "=&r" (temp)		\
+	: "r" (I)							\
+	: "memory")
+/* BITOPS.h */
+#define ALT_TEST_AND_OP_BIT_ORD(op, mod, nr, addr, ord, __res, __mask, __temp)	\
+asm(ALTERNATIVE(								\
+		__AMO(op) #ord " zero, %3, %1\n"				\
+		__nops(3),							\
+		"1:	" __LR #ord " %0, %1\n"					\
+			#op " %2, %0, %3\n"					\
+			__SC #ord " %2, %2, %1\n"				\
+			"bnez %2, 1b\n",					\
+		0, RISCV_ISA_EXT_ZALRSC, 1)					\
+	: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)		\
+	: "r" (mod(__mask))							\
+	: "memory")
+
+#define ALT_OP_BIT_ORD(op, mod, nr, addr, ord, __res, __temp)		\
+asm(ALTERNATIVE(							\
+		__AMO(op) #ord " zero, %3, %1\n"			\
+		__nops(3),						\
+		"1:	" __LR #ord " %0, %1\n"				\
+			#op " %2, %0, %3\n"				\
+			__SC #ord " %2, %2, %1\n"			\
+			"bnez %2, 1b\n",				\
+		0, RISCV_ISA_EXT_ZALRSC, 1)				\
+	: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
+	: "r" (mod(BIT_MASK(nr)))					\
+	: "memory")
+
+#define ALT_ARCH_XOR_UNLOCK(mask, addr, __res, __temp)	\
+asm(ALTERNATIVE(					\
+		__AMO(xor) ".rl %0, %3, %1\n"		\
+		__nops(3),				\
+		"1:	" __LR ".rl %0, %1\n"		\
+			"xor %2, %0, %3\n"		\
+			__SC ".rl %2, %2, %1\n"		\
+			"bnez %2, 1b\n",		\
+		0, RISCV_ISA_EXT_ZALRSC, 1)		\
+	: "=&r" (__res), "+A" (*(addr)), "=&r" (__temp)	\
+	: "r" (__NOP(mask))				\
+	: "memory")
+
+#define ALT_ARCH_XCHG(sfx, prepend, append, r, p, n, temp)	\
+asm(ALTERNATIVE(						\
+		prepend						\
+		"	amoswap" sfx " %0, %3, %1\n"		\
+		__nops(2)					\
+		append,						\
+		prepend						\
+		"1:	lr" sfx " %0, %1\n"			\
+		"	sc" sfx " %2, %3, %1\n"			\
+		"	bnez %2, 1b\n"				\
+		append,						\
+		0, RISCV_ISA_EXT_ZALRSC, 1)			\
+	: "=&r" (r), "+A" (*(p)), "=&r" (temp)			\
+	: "r" (n)						\
+	: "memory")
+
+/* FUTEX.H */
+#define ALT_FUTEX_ATOMIC_OP(insn, ret, oldval, uaddr, oparg, temp)	\
+asm(ALTERNATIVE(							\
+		"1: amo" #insn ".w.aqrl %[ov],%z[op],%[u]\n"		\
+		__nops(3)						\
+		"2:\n"							\
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r]),			\
+		"1:	lr.w.aqrl %[ov], %[u]\n"			\
+		"	" #insn " %[t], %[ov], %z[op]\n"		\
+		"	sc.w.aqrl %[t], %[t], %[u]\n"			\
+		"	bnez %[t], 1b\n"				\
+		"2:\n"							\
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r]),			\
+		0, RISCV_ISA_EXT_ZALRSC, 1)				\
+	: [r] "+r" (ret), [ov] "=&r" (oldval),				\
+	  [t] "=&r" (temp), [u] "+m" (*(uaddr))				\
+	: [op] "Jr" (oparg)						\
+	: "memory")
+
+#define ALT_FUTEX_ATOMIC_SWAP(ret, oldval, uaddr, oparg, temp)	\
+asm(ALTERNATIVE(						\
+		"1: amoswap.w.aqrl %[ov],%z[op],%[u]\n"		\
+		__nops(3)					\
+		"2:\n"						\
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r]),		\
+		"1:	lr.w.aqrl %[ov], %[u]\n"		\
+		"	mv %[t], %z[op]\n"			\
+		"	sc.w.aqrl %[t], %[t], %[u]\n"		\
+		"	bnez %[t], 1b\n"			\
+		"2:\n"						\
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r]),		\
+		0, RISCV_ISA_EXT_ZALRSC, 1)			\
+	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
+	  [t] "=&r" (temp), [u] "+m" (*(uaddr))			\
+	: [op] "Jr" (oparg)					\
+	: "memory")
+
+/* atomics - end */
 #ifdef CONFIG_RISCV_ISA_ZICBOP
 #define ARCH_HAS_PREFETCH
 static inline void prefetch(const void *x)
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..b1db42e50891 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -82,9 +82,15 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
 		return -ENODEV;
 
 	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
-		pr_warn("CPU with hartid=%lu does not support ima", *hart);
+	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
+		pr_warn("CPU with hartid=%lu does not support im", *hart);
+		return -ENODEV;
+	}
+	/* any atomic supported? */
+	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
+	    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0 &&
+	    of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < 0) {
+		pr_warn("CPU with hartid=%lu does not support any atomics", *hart);
 		return -ENODEV;
 	}
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72ca768f4e91..edfdd91cb1fd 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1164,6 +1164,11 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
 		 * then the alternative cannot be applied.
 		 */
 		return riscv_cboz_block_size <= (1U << value);
+	case RISCV_ISA_EXT_ZALRSC:
+		/*
+		 * Aply ZALRSC alternatives only if ZAAMO not available
+		 */
+		return !__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZAAMO);
 	}
 
 	return false;
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9b9dec6893b8..e54d299bad9d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -73,7 +73,13 @@
 	beq	a2, zero, .Lnew_vmalloc_restore_context
 
 	/* Atomically reset the current cpu bit in new_vmalloc */
-	amoxor.d	a0, a1, (a0)
+	ALTERNATIVE("amoxor.d a0, a1, (a0);	\
+		     .rept 3; nop; .endr;",
+		    "1:	lr.d a2, (a0);		\
+			xor a2, a2, a1;		\
+			sc.d a2, a2, (a0);	\
+			bnez a2, 1b;",
+		     0, RISCV_ISA_EXT_ZALRSC, 1)
 
 	/* Only emit a sfence.vma if the uarch caches invalid entries */
 	ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC, 1)

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
