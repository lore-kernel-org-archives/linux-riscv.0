Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09C6C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 00:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si3ZMHwR2BcjbjjCSht3HU7ZLWK57ZDaAINiaYhm60U=; b=yZxpFIeyzymCH3
	uZZT8vhOAA7fJFGMR6oazfNTFbLaKBJd4r7eupj81mF0gqUWZpbg7dYlb4n/emaDxSJ9aCFtu5Mn6
	HVvUaJIb/cc4SoetkPhHQ+15Skl0vL5af6gcEmkluGLyTKZB6n5H/sUykKeigmv5Nfym4Tfj13cIb
	y6dASKTh9SYaZUleH0GbSugSPfDL5QH8es4h/GoQOpAcpltLGeyY4qedavP5QO46tEPduuGA8zLJJ
	kIpmL2oOxTB9Q0aYc+tIEVYwNVv46cTJfANre6R0c7QIjBToOf2tEMXfnqwJ/bFNDMfxiWbuZReSA
	Nvq4mNGKwPgDxspAKnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhSb-00000007ccj-1K88;
	Wed, 19 Mar 2025 00:39:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhSY-00000007caC-2XXZ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 00:39:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2243803b776so7762555ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 17:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742344742; x=1742949542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EpegxGS1nnC+3dyjYJ9+prOjpW0c3vGUZ66tYdH0SQ=;
        b=QAyBI8Jth7idE7duKT3WzdukLAnK+bvcMRcAY+uHJWUWIGZuCnLk4KV6JznUrO5XKO
         8yePxwJT15MNefxWWaff/EZdPsu0CJHbr4UVlE8yFWQrhZXi8YMuLbxKTkwIIB/2XULU
         ye8V7VNMaGLE8UEIjrDfzZXWj9oIM3boQ/M830t6X2JMfdgpyeBA4nV7bFz8Qzk557F+
         sM+HxP+r9699DYe8+y/QygRwsqygWWGXC92DfOT+IC4/eI0/siFjTI9uir3b4B320hpa
         rMzcSTodWSIxdFhXIB6p5fm79kTpGaExSJdx1CrZmIv2N86dsth3eHcbANaHtEUXucYi
         b81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742344742; x=1742949542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EpegxGS1nnC+3dyjYJ9+prOjpW0c3vGUZ66tYdH0SQ=;
        b=ZNJgQJnmGKlrszvTPl8iefCbhhRoSOBo0xDA/XTnHoWBdkeu1Y8sS77yg5h5edol8f
         Kmtfs1ICJw5EkBcgY3vmKO0+3FQwv0C5bD8w8oiu8nGOD1DvQBaRAQFqrn4GUx9g9pCT
         en85xggr808Dgn2+ZeznYRM1p+o2FeULx9d8HdAolQAJSAvgTAw/sijiKoJ+eFUVoJOQ
         VaYOxi2sVECN35hOb/VVT9kOmK67XJlQpj/sbwVK6J65qq24J5yqa17WGEYfYPHFNoMY
         qmkT+EQ5JEUnkdQVCl4zMrUtKmdN2lJxpSVRg/gKNOX7fC2K0D87W1WyNj+EuYDsKaKY
         Hc7g==
X-Gm-Message-State: AOJu0Yw/HnrbakWlmkzbrATuIIF9U3aTJeTQCJZwZjZiXiXjV5l2P13J
	vFqqa/IVc6htuqD3QzHL3JgTM3OVfo3okHEWXZARfCkXkFtqn5uWukRDGXSFAgw=
X-Gm-Gg: ASbGncsgpuZhRqIuD42SOQZnAyVZ1t5i6jta+kxJVPqR2dRyuwkJ8LB8uJgDkUjDVIl
	ow785Af1lQPBTULluep1ngj51EWRe/py0ieWcWhBsRiOdZR6tY3ymTSImk27kSbvtCFfPH/zVAR
	mJ/mKkDBmIhTBcVTNIMZtMm2jDpZ7KMsO2zkN3td/gXhKkQQ6GPxTm3uNxz9U/29EFO4oSf7K9o
	JOq7Rnj5MtKrXf5ARV46rALCqfRgT41pUc99PQISPkrQoDQ0Ux4qa/j6p/ziwxe8M477SXycYVH
	O1dxoU/4o0ExR5bu9eDXPSnScSrLLPINNqW0sJF1GagCNCWRPmSJzgmtp9Pd5+O3edHHKzM=
X-Google-Smtp-Source: AGHT+IFTKFeoCSD72Rx4LKMC0TjYuchqyTAQEGQdPeILJxfRC3IMHsrAnpixlSxQOZqvkwa3oYnxWw==
X-Received: by 2002:a17:903:1a23:b0:224:5a8:ba2c with SMTP id d9443c01a7336-22649cacf0fmr8165305ad.52.1742344741731;
        Tue, 18 Mar 2025 17:39:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe890sm100843415ad.188.2025.03.18.17.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 17:39:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 18 Mar 2025 17:38:46 -0700
Subject: [PATCH v9 2/2] riscv: Add runtime constant support
MIME-Version: 1.0
Message-Id: <20250318-runtime_const_riscv-v9-2-ddd3534d3e8e@rivosinc.com>
References: <20250318-runtime_const_riscv-v9-0-ddd3534d3e8e@rivosinc.com>
In-Reply-To: <20250318-runtime_const_riscv-v9-0-ddd3534d3e8e@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11402; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=6NxMsf9l7XhYdvNMjykcrSEZ7mA6J1gQi9sA+71cr8I=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/otIfnQbPkSKdnzn5M0ky5J/rY6sEMoS/bt3taj84smM
 bW8OyjTUcrCIMbFICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERcshj+Well69xZ8eOum+wC
 6aPX7u4uvZYhP+PsJgYWPs7al79UAxgZJqWpvn4kdPWYyKxPDIf+VervYlnm7zXl5frX4kYMOZn
 eLAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_173902_693960_D2A03073 
X-CRM114-Status: GOOD (  23.51  )
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

Implement the runtime constant infrastructure for riscv. Use this
infrastructure to generate constants to be used by the d_hash()
function.

This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
constant' support") and commit e3c92e81711d ("runtime constants: add
x86 architecture support").

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig                     |  22 +++
 arch/riscv/include/asm/asm.h           |   1 +
 arch/riscv/include/asm/runtime-const.h | 265 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 4 files changed, 291 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e35607f1dd4603a596416d3357a71..c123f7c0579c1aca839e3c04bdb662d6856ae765 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -783,6 +783,28 @@ config RISCV_ISA_ZBC
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBKB
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbkb)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBKB
+	bool "Zbkb extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBKB
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBKB
+	   extension (bit manipulation for cryptography) and enable its usage.
+
+	   The Zbkb extension provides instructions to accelerate a number
+	   of common cryptography operations (pack, zip, etc).
+
+	   If you don't know what to do here, say Y.
+
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
 	depends on MMU
diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 776354895b81e7dc332e58265548aaf7365a6037..a8a2af6dfe9d2406625ca8fc94014fe5180e4fec 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -27,6 +27,7 @@
 #define REG_ASM		__REG_SEL(.dword, .word)
 #define SZREG		__REG_SEL(8, 4)
 #define LGREG		__REG_SEL(3, 2)
+#define SRLI		__REG_SEL(srliw, srli)
 
 #if __SIZEOF_POINTER__ == 8
 #ifdef __ASSEMBLY__
diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
new file mode 100644
index 0000000000000000000000000000000000000000..a23a9bd47903b2765608c75cd83f01ae578dffaa
--- /dev/null
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -0,0 +1,265 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_RUNTIME_CONST_H
+#define _ASM_RISCV_RUNTIME_CONST_H
+
+#include <asm/asm.h>
+#include <asm/alternative.h>
+#include <asm/cacheflush.h>
+#include <asm/insn-def.h>
+#include <linux/memory.h>
+#include <asm/text-patching.h>
+
+#include <linux/uaccess.h>
+
+#ifdef CONFIG_32BIT
+#define runtime_const_ptr(sym)					\
+({								\
+	typeof(sym) __ret;					\
+	asm_inline(".option push\n\t"				\
+		".option norvc\n\t"				\
+		"1:\t"						\
+		"lui	%[__ret],0x89abd\n\t"			\
+		"addi	%[__ret],%[__ret],-0x211\n\t"		\
+		".option pop\n\t"				\
+		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		: [__ret] "=r" (__ret));			\
+	__ret;							\
+})
+#else
+/*
+ * Loading 64-bit constants into a register from immediates is a non-trivial
+ * task on riscv64. To get it somewhat performant, load 32 bits into two
+ * different registers and then combine the results.
+ *
+ * If the processor supports the Zbkb extension, we can combine the final
+ * "slli,slli,srli,add" into the single "pack" instruction. If the processor
+ * doesn't support Zbkb but does support the Zbb extension, we can
+ * combine the final "slli,srli,add" into one instruction "add.uw".
+ */
+#define RISCV_RUNTIME_CONST_64_PREAMBLE				\
+	".option push\n\t"					\
+	".option norvc\n\t"					\
+	"1:\t"							\
+	"lui	%[__ret],0x89abd\n\t"				\
+	"lui	%[__tmp],0x1234\n\t"				\
+	"addiw	%[__ret],%[__ret],-0x211\n\t"			\
+	"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
+
+#define RISCV_RUNTIME_CONST_64_BASE				\
+	"slli	%[__tmp],%[__tmp],32\n\t"			\
+	"slli	%[__ret],%[__ret],32\n\t"			\
+	"srli	%[__ret],%[__ret],32\n\t"			\
+	"add	%[__ret],%[__ret],%[__tmp]\n\t"			\
+
+#define RISCV_RUNTIME_CONST_64_ZBA				\
+	".option push\n\t"					\
+	".option arch,+zba\n\t"					\
+	"slli	%[__tmp],%[__tmp],32\n\t"			\
+	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
+	"nop\n\t"						\
+	"nop\n\t"						\
+	".option pop\n\t"					\
+
+#define RISCV_RUNTIME_CONST_64_ZBKB				\
+	".option push\n\t"					\
+	".option arch,+zbkb\n\t"				\
+	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
+	"nop\n\t"						\
+	"nop\n\t"						\
+	"nop\n\t"						\
+	".option pop\n\t"					\
+
+#define RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
+	".option pop\n\t"					\
+	".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
+	".long 1b - .\n\t"					\
+	".popsection"						\
+
+#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret, __tmp;					\
+	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
+		ALTERNATIVE_2(						\
+			RISCV_RUNTIME_CONST_64_BASE,			\
+			RISCV_RUNTIME_CONST_64_ZBA,			\
+			0, RISCV_ISA_EXT_ZBA, 1,			\
+			RISCV_RUNTIME_CONST_64_ZBKB,			\
+			0, RISCV_ISA_EXT_ZBKB, 1			\
+		)							\
+		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
+		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
+	__ret;								\
+})
+#elif defined(CONFIG_RISCV_ISA_ZBA)
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret, __tmp;					\
+	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
+		ALTERNATIVE(						\
+			RISCV_RUNTIME_CONST_64_BASE,			\
+			RISCV_RUNTIME_CONST_64_ZBA,			\
+			0, RISCV_ISA_EXT_ZBA, 1				\
+		)							\
+		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
+		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
+	__ret;								\
+})
+#elif defined(CONFIG_RISCV_ISA_ZBKB)
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret, __tmp;					\
+	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
+		ALTERNATIVE(						\
+			RISCV_RUNTIME_CONST_64_BASE,			\
+			RISCV_RUNTIME_CONST_64_ZBKB,			\
+			0, RISCV_ISA_EXT_ZBKB, 1			\
+		)							\
+		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
+		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
+	__ret;								\
+})
+#else
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret, __tmp;					\
+	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
+		RISCV_RUNTIME_CONST_64_BASE				\
+		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
+		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
+	__ret;								\
+})
+#endif
+#endif
+
+#define runtime_const_shift_right_32(val, sym)			\
+({								\
+	u32 __ret;						\
+	asm_inline(".option push\n\t"				\
+		".option norvc\n\t"				\
+		"1:\t"						\
+		SRLI " %[__ret],%[__val],12\n\t"		\
+		".option pop\n\t"				\
+		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		: [__ret] "=r" (__ret)				\
+		: [__val] "r" (val));				\
+	__ret;							\
+})
+
+#define runtime_const_init(type, sym) do {			\
+	extern s32 __start_runtime_##type##_##sym[];		\
+	extern s32 __stop_runtime_##type##_##sym[];		\
+								\
+	runtime_const_fixup(__runtime_fixup_##type,		\
+			    (unsigned long)(sym),		\
+			    __start_runtime_##type##_##sym,	\
+			    __stop_runtime_##type##_##sym);	\
+} while (0)
+
+static inline void __runtime_fixup_caches(void *where, unsigned int insns)
+{
+	/* On riscv there are currently only cache-wide flushes so va is ignored. */
+	__always_unused uintptr_t va = (uintptr_t)where;
+
+	flush_icache_range(va, va + 4 * insns);
+}
+
+/*
+ * The 32-bit immediate is stored in a lui+addi pairing.
+ * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
+ * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
+ */
+static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
+{
+	unsigned int lower_immediate, upper_immediate;
+	u32 lui_insn, addi_insn, addi_insn_mask;
+	__le32 lui_res, addi_res;
+
+	/* Mask out upper 12 bit of addi */
+	addi_insn_mask = 0x000fffff;
+
+	lui_insn = (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(lui_parcel[1]) << 16;
+	addi_insn = (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu(addi_parcel[1]) << 16;
+
+	lower_immediate = sign_extend32(val, 11);
+	upper_immediate = (val - lower_immediate);
+
+	if (upper_immediate & 0xfffff000) {
+		/* replace upper 20 bits of lui with upper immediate */
+		lui_insn &= 0x00000fff;
+		lui_insn |= upper_immediate & 0xfffff000;
+	} else {
+		/* replace lui with nop if immediate is small enough to fit in addi */
+		lui_insn = RISCV_INSN_NOP4;
+		/* 
+		 * lui is being skipped, so do a load instead of an add. A load
+		 * is performed by adding with the x0 register. Setting rs to
+		 * zero with the following mask will accomplish this goal.
+		 */
+		addi_insn_mask &= 0x07fff;
+	}
+
+	if (lower_immediate & 0x00000fff) {
+		/* replace upper 12 bits of addi with lower 12 bits of val */
+		addi_insn &= addi_insn_mask;
+		addi_insn |= (lower_immediate & 0x00000fff) << 20;
+	} else {
+		/* replace addi with nop if lower_immediate is empty */
+		addi_insn = RISCV_INSN_NOP4;
+	}
+
+	addi_res = cpu_to_le32(addi_insn);
+	lui_res = cpu_to_le32(lui_insn);
+	mutex_lock(&text_mutex);
+	patch_insn_write(addi_parcel, &addi_res, sizeof(addi_res));
+	patch_insn_write(lui_parcel, &lui_res, sizeof(lui_res));
+	mutex_unlock(&text_mutex);
+}
+
+static inline void __runtime_fixup_ptr(void *where, unsigned long val)
+{
+#ifdef CONFIG_32BIT
+		__runtime_fixup_32(where, where + 4, val);
+		__runtime_fixup_caches(where, 2);
+#else
+		__runtime_fixup_32(where, where + 8, val);
+		__runtime_fixup_32(where + 4, where + 12, val >> 32);
+		__runtime_fixup_caches(where, 4);
+#endif
+}
+
+/*
+ * Replace the least significant 5 bits of the srli/srliw immediate that is
+ * located at bits 20-24
+ */
+static inline void __runtime_fixup_shift(void *where, unsigned long val)
+{
+	__le16 *parcel = where;
+	__le32 res;
+	u32 insn;
+
+	insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
+
+	insn &= 0xfe0fffff;
+	insn |= (val & 0b11111) << 20;
+
+	res = cpu_to_le32(insn);
+	mutex_lock(&text_mutex);
+	patch_text_nosync(where, &res, sizeof(insn));
+	mutex_unlock(&text_mutex);
+}
+
+static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
+				       unsigned long val, s32 *start, s32 *end)
+{
+	while (start < end) {
+		fn(*start + (void *)start, val);
+		start++;
+	}
+}
+
+#endif /* _ASM_RISCV_RUNTIME_CONST_H */
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 002ca58dd998cb78b662837b5ebac988fb6c77bb..61bd5ba6680a786bf1db7dc37bf1acda0639b5c7 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -97,6 +97,9 @@ SECTIONS
 	{
 		EXIT_DATA
 	}
+
+	RUNTIME_CONST_VARIABLES
+
 	PERCPU_SECTION(L1_CACHE_BYTES)
 
 	.rel.dyn : {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
