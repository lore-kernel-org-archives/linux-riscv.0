Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E17AC0218A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 21:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IACHXbwIAUUGeIThfPcSwVLxtiy2faKw87WXdJEpqno=; b=leWHvJDb1Iqy5b
	kgxpvIyHSsFZHOrNcTaq4zUHjMJQzPTpGFePHcNwd2AlIqDUDCy+rer5gGazRIU8ORRdei2cH2a/4
	VxBa+kTRgwTQNc/lTZKIXpJKlRwCTT/hppb5ntSS7JwySAWLQAiKMRWSQlt4Lc5d1iEHQ40G6w0Eo
	yPDuTC3LN3uuHq1naFAI2DCsjdLjy8l6bvkdQSMfwLKUc3nzSn5oxBj0smOvGYfJfcpNEzI2YAB8G
	PbdgLnXtY0/0+AXxASDDdJtPQ832mN23aTFTzWR95PTwXSCyQAk67lVIs/enwnVTmr+3O7Lz95rNv
	h5BJ95BHs7/Q960acojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tct0x-00000005qT3-1xVD;
	Tue, 28 Jan 2025 21:20:55 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrqx-00000005mPS-20TH
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 20:06:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso41344a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 12:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738094790; x=1738699590; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDyVQTBA7PUUvWjbd4Ge36IvAZ5YSvfp1xVWyK0ZYTw=;
        b=lhH75afg3nHg0a+ZOHG/P0POFm+NvDFxS+rOMAWJ52fTYJt3dojZDOjH8wPtwL+iTM
         VBeZx15T05MKP6PzG0fho0C8O8dpiCX88j7bAokBckqaimfqnLGKKWzUzUptnTr1RkeQ
         XYOQyomIIgedE0+lgYFYdDGE19aNYDlp0IfR16bf183ThtoYXcg0NV5h+ywtHkD1pVn8
         rCa6FPhGSDCYOk1+mdFdy/BuYWgMtsWQhtFbmfhwvleU8vLCTCVYQu3U7aebB/y34h5D
         J/3X6IPXHxp0R9VrlkHO1X7fUNfi3ksSkKbakyCktUQ6ejH12ggns64kGoRS1VlWMk13
         BAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738094790; x=1738699590;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDyVQTBA7PUUvWjbd4Ge36IvAZ5YSvfp1xVWyK0ZYTw=;
        b=O+NA/ejbkhmrJbHNyBzOaB1pTlTsbqCPSyKxXWh+2BvdPv3oiSWTr8phn0t5YBn5E7
         e8y5hkNS93qz+O0Y0uEForfIrJz5vADZYQGm6NTmtKSBQo0WMDkCPXruaHE4SJd2Ia96
         44UxSbE6TzMUEHFGJvvWN2Z+F2j+uXGAK41sV1X6/SFi3zXi1FiOdZXfjo7p42ba9+Zw
         ZRJv8MVRyobTzHfe9p36JDbGGvMpUCJtoZv4XpYQPS6OJ9nmu8s9NBfrU81MDguR5TdS
         oBoSstsEKvF33YChJyw4C/MX+GUHbXT6UFXTrPmQUgtpJF1ieSF9/B+mFqCPcGRxxl6v
         TD3Q==
X-Gm-Message-State: AOJu0YyXygS8kDcmZrrmz9wQ9MkNJINgxIxgJdeYdeldCwv+e3fzSBFF
	knJnUlsKebhMmQrUenePbjUmRvDOHDbRG2BpA/Yswd0my4S+Fi4KwqugefwSfGo=
X-Gm-Gg: ASbGnctZbJxO/BPvM2TPX77KsStj8+BjrVYoPUjhyRYSRc7zeHWesfEJS8Uv0JlWnNv
	7yhAGQoqxPOxVOK1CtSx1xXSxSBmeFhjAArMMn/xkNRKh7gmE/U0SPVLi/Sj37NHqYobSAWNo/j
	80N8PuQxnicicgqmjYgShC8/rypz1d1dQBgmfvPkwG5KJcXEjgcMCQhKE2aatV/ED0G55klhZlQ
	QBZBlInFklAKnYTEfE2c2PuOcX0nBZGMqo/7fMIoYF0e/EJHqII1NnPvXVcRmey7QLSIvCLXqlu
	38Vu3A5/l5xAPszAOHdzukVfNzk9u/4=
X-Google-Smtp-Source: AGHT+IGfiwM1GiaWLFVTL0UIxryEtvd5zmHJnKcWdmv6nkOF5WgHkws+kt9CR76TSVgPA0My70uS/g==
X-Received: by 2002:a17:90b:3d43:b0:2f5:63a:44f8 with SMTP id 98e67ed59e1d1-2f82bff716emr7570879a91.8.1738094790475;
        Tue, 28 Jan 2025 12:06:30 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa8318asm9775224a91.47.2025.01.28.12.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:06:29 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 28 Jan 2025 12:06:08 -0800
Subject: [PATCH v3] riscv: Add runtime constant support
MIME-Version: 1.0
Message-Id: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAK84mWcC/43NTQ7CIBCG4as0rMXwI1JceQ9jGkqndhYFA5Vom
 t5d2sSNceHy/ZJ5ZiYJIkIip2omETImDL6E3FXEDdbfgGJXmggmFONC0vjwE47QuODT1ERMLtO
 j62p1ABA116Rc3iP0+NzUy7X0gGkK8bU9yXxdP57+6WVOOdVGtUxIsIK154g5JPRu78JIVjKLP
 xhRGKMsaNcbbaX5YpZleQO0cuACAAEAAA==
X-Change-ID: 20250123-runtime_const_riscv-6cd854ee2817
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8001; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=OlyyFFGJKKb9rmkiPSLFyPA1bfvLaKaSmOAiI/T1Czo=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/pMi/0bmH/VL/vocLqh5eee87Nt1fdtfcbxrExQ7aWPZ
 NxXaSHxjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbyag8jw/fCaXXGbPt+bt5w
 5fKSxJON7t1K7DEXzF9uinHqCzrMIcjwP1Xx+N5THBvvSZ1lm+r8333Wt0fqSud5ZZ4Zbm1nPpT
 zlQ8A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_120631_731384_7020FBFC 
X-CRM114-Status: GOOD (  19.31  )
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
Ard brought this to my attention in this patch [1].

[1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
---
Changes in v3:
- Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
  by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
- Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com

Changes in v2:
- Treat instructions as __le32 and do proper conversions (Ben)
- Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
---
 arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 2 files changed, 197 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
new file mode 100644
index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
--- /dev/null
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_RUNTIME_CONST_H
+#define _ASM_RISCV_RUNTIME_CONST_H
+
+#include <asm/alternative.h>
+#include <asm/cacheflush.h>
+#include <asm/text-patching.h>
+#include <linux/uaccess.h>
+
+#ifdef CONFIG_32BIT
+#define runtime_const_ptr(sym)					\
+({								\
+	typeof(sym) __ret, __tmp;				\
+	asm_inline("1:\t"					\
+		".option push"					\
+		".option norvc"					\
+		"lui	%[__ret],0x89abd\n\t"			\
+		"addi	%[__ret],-0x211\n\t"			\
+		".option pop"					\
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
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret, __tmp;					\
+	asm_inline("1:\t"						\
+		".option push\n\t"					\
+		".option norvc\n\t"					\
+		"lui	%[__ret],0x89abd\n\t"				\
+		"lui	%[__tmp],0x1234\n\t"				\
+		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
+		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
+		ALTERNATIVE_2(						\
+			"slli	%[__tmp],%[__tmp],32\n\t"		\
+			"slli	%[__ret],%[__ret],32\n\t"		\
+			"srli	%[__ret],%[__ret],32\n\t"		\
+			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
+			".option push\n\t"				\
+			".option arch,+zba\n\t"				\
+			"slli	%[__tmp],%[__tmp],32\n\t"		\
+			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
+			"nop\n\t"					\
+			"nop\n\t"					\
+			".option pop\n\t",				\
+			0, RISCV_ISA_EXT_ZBA, 1,			\
+			".option push\n\t"				\
+			".option arch,+zbkb\n\t"			\
+			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
+			"nop\n\t"					\
+			"nop\n\t"					\
+			"nop\n\t"					\
+			".option pop\n\t",				\
+			0, RISCV_ISA_EXT_ZBKB, 1			\
+		)							\
+		".option pop\n\t"					\
+		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
+		".long 1b - .\n\t"					\
+		".popsection"						\
+		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
+	__ret;								\
+})
+#endif
+
+#ifdef CONFIG_32BIT
+#define SRLI "srli "
+#else
+#define SRLI "srliw "
+#endif
+
+#define runtime_const_shift_right_32(val, sym)			\
+({								\
+	u32 __ret;						\
+	asm_inline("1:\t"					\
+		".option push\n\t"				\
+		".option norvc\n\t"				\
+		SRLI "%[__ret],%[__val],12\n\t"			\
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
+	flush_icache_range(va, va + 4*insns);
+}
+
+/*
+ * The 32-bit immediate is stored in a lui+addi pairing.
+ * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
+ * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
+ */
+static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
+{
+	unsigned int lower_immediate, upper_immediate;
+	u32 lui_insn = le32_to_cpu(*lui);
+	u32 addi_insn = le32_to_cpu(*addi);
+	__le32 addi_res, lui_res;
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
+		lui_insn = 0x00000013;
+	}
+
+	if (lower_immediate & 0x00000fff) {
+		/* replace upper 12 bits of addi with lower 12 bits of val */
+		addi_insn &= 0x000fffff;
+		addi_insn |= (lower_immediate & 0x00000fff) << 20;
+	} else {
+		/* replace addi with nop if lower_immediate is empty */
+		addi_insn = 0x00000013;
+	}
+
+	addi_res = cpu_to_le32(addi_insn);
+	lui_res = cpu_to_le32(lui_insn);
+	patch_insn_write(addi, &addi_res, sizeof(addi_res));
+	patch_insn_write(lui, &lui_res, sizeof(lui_res));
+}
+
+static inline void __runtime_fixup_ptr(void *where, unsigned long val)
+{
+	if (IS_ENABLED(CONFIG_32BIT)) {
+		__runtime_fixup_32(where, where + 4, val);
+		__runtime_fixup_caches(where, 2);
+	} else {
+		__runtime_fixup_32(where, where + 8, val);
+		__runtime_fixup_32(where + 4, where + 12, val >> 32);
+		__runtime_fixup_caches(where, 4);
+	}
+}
+
+/*
+ * Replace the least significant 5 bits of the srli/srliw immediate that is
+ * located at bits 20-24
+ */
+static inline void __runtime_fixup_shift(void *where, unsigned long val)
+{
+	u32 insn = le32_to_cpu(*(__le32 *)where);
+	__le32 res;
+
+	insn &= 0xfe0fffff;
+	insn |= (val & 0b11111) << 20;
+
+	res = cpu_to_le32(insn);
+	patch_text_nosync(where, &res, sizeof(insn));
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

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250123-runtime_const_riscv-6cd854ee2817
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
