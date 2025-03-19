Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B4FC35FFF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3snYU9cYcmL76IlC9Ss4UNDLRRmXrq7868cZ/4bk8E=; b=AFqUihcjsv7YtY
	VxJwFUADTXUmTOnaRQ0UcbpZbhwyV0eJcH+d7QjwwOs0vjbdnqLHuDSP6qMCOr6/0nITyufCN7qBu
	m08BjD9YUzM/+MYQma8Y29Ukl83RxOk5YcKrn832r8aQQgUBwT8HU+RLLNyL9sggvoUPVQlYVfGgV
	r0ES4yim3WjpQCW5FxjTAC1NcbXS8qULrvCsNUvCbeVhttJuxWho0PLK/7IsVPKRqKN1tq7s9EOps
	W9a99pNzYaUUeMmYqT/EWtc3USPlupZDNrs4w48SHBWx35zgmO40TNjYxpmbOminy1YsRxFvBPSLZ
	x6oAvy2r3NxQFGX41HzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyGO-00000009qi1-30FC;
	Wed, 19 Mar 2025 18:35:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyGM-00000009qgw-34zt
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 18:35:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-225e3002dffso86728445ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742409334; x=1743014134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=la5qHyryzXsEWAgnraL41q7vvu0SZEHfO3JYEM8IBZk=;
        b=kaOxlcDm5eb7uZ2UGLdo/1ynXGSYcCwolGQEdQE2j+bzrM2swoabHcWVT5lAmFTCwC
         ysEEFojCp3kkXPFiuBH4tGnpFTl5nFspWQGFhw0RR1RSi1ZNMyMSnHQkuxnzy+dHbJI9
         79UwBtTwm+DlPeKO6ivdNRJ8V926tq+tOtXTHbmHC5P5poD4M5SqePaFvGC2E90Gukyo
         QSV4iZWyEq2ggSrJ96esApEcqS8yCuH0QDai0w0hXXaUKp8BANguEiwBAY8nile51MMD
         O+ISqxjI8IQqS7WOUpYGTSQD6nUBQPFdGqZKee08QznuSyy5EvntI+asjRuiJvbtZO/v
         3KOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409334; x=1743014134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la5qHyryzXsEWAgnraL41q7vvu0SZEHfO3JYEM8IBZk=;
        b=DW6e4aKZaVf5ihC/dV9r3/v7dAeJGcj5jQS8oD4VhbunHIOnlnJciRmCu2lGV6EOee
         2GM7u5vNeP1V3KyZJNMgIj5dSiSatetql3V37KXhrQt0o+ehv6/sUeMSoxq75aAScP3j
         SRfBDutLztEniqAmGJ0nFVfA7W7Vjk0WswcWTtduOoCxCMlNVrYeGkuH4OXkKGKMv00P
         IM1TQTdbI50ign/IOobZM9bSCEXiFYzWohoCKd7GYSkKVc3HqB9rEfyRH8M1aSZVjW9+
         HU16j3624bwW2aYVfFo2FR5MZdfxMPoCuFVKsNctTscPqeQ4R9yn5Bo2twamy+1hlCdY
         Ae1Q==
X-Gm-Message-State: AOJu0YwMzucFHcKeLwArAIg+scri0fnbBIOeu76d4klU8l7JgIQQu1aL
	vZ0IAUCnCSsTuippoC7cw90RofgZ4zZyOln4bqQFxAqZ4+01F8nbr7d1b/WLW7c=
X-Gm-Gg: ASbGncvOsxNHhNxRQcttO8Zk9POn/W0lQjxBim3dzczLO0zXg6Fw1F+Zlcfp94M6HUt
	5cdnXdF4zCTcpr73ERyNiycxDrmT+Sjt9Icl0yMlb5VaWky3D1PqV4GKmbtdb7kbMmHjK85Uo8z
	BcjsWYWll95vApt89YQGAa2uUNt+aFWQrPe0yj8yUGqJWO9M+th8WyJcrSUVbQJTRrYyv+fcKPI
	6a49yb7mE9Sb6kH5+9OstdCcAAoM/BTyFbCLZKuP/qJid/uCHdoNq+/NdtwRJ8miG1Q0hbsHiNL
	aXtrupqfph7KYuEzk08JnLB2xvdEY3B8lFyQA08shccAZLhFlgsvuZ/ha+1/bIkOFKaOuCs=
X-Google-Smtp-Source: AGHT+IHCOA+9CrSaw86lUNtvagoFCsKrSr9rd6nDGuzkvUete4IY2k60ro+RPGhImED2JD0D5kTgjw==
X-Received: by 2002:a05:6a20:1587:b0:1f5:535c:82df with SMTP id adf61e73a8af0-1fbed3131e6mr6855293637.27.1742409333790;
        Wed, 19 Mar 2025 11:35:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167e109sm11993844b3a.115.2025.03.19.11.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:35:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Mar 2025 11:35:20 -0700
Subject: [PATCH v10 2/2] riscv: Add runtime constant support
MIME-Version: 1.0
Message-Id: <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
In-Reply-To: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11510; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=63cSUUnxwjEBh6V2AkklarmCWoJh2az/xIh3a/F6s+Y=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/ptvvwDu532G04T10wuihS9sDzx6t6iZSrr9zKZB3xnz
 S37XlfRUcrCIMbFICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwESc/jP8FY5eeeDCYZFmM9F6
 Po9DDWFHwq3f/rpSt7OB4Rj393j5F4wMrz84bD7N1cP4OsPPuvxnoMfD2aaPPk4xt/L5tE1M9Uk
 gOwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_113534_784734_825D4BBB 
X-CRM114-Status: GOOD (  23.25  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
