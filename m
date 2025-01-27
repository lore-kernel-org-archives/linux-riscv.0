Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C94CC02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IpwKlKKApz2QYnoVF/tuqcesmQGLsqQgDN/IKikQPxs=; b=mcID1f4Em3+xwg
	wWL+bwU4y+SMpuDcQ6gWy/xfAdeJcwc2tbu6BfRNkATL+B/K0w3HtUsbZ4N4MKmGTsXstJrLqA99F
	b/RCObtl0BJM0Ffx6x0KCqMkyTSnicY408pOg2nC18bwILe6hI34LCzjNRWTTMVdwVxS63P0wIIa1
	oNTYi6cJ8mZCGMMgeQKGfI4nvC/UEGQTbqMsiGcL+k4YCrEBMO3W+rTzPFWgi9p94+xZmTIJ+wSVT
	RfZjXEn11EKDKoeUiZcrE6i0laYSvwzBhb39q1E/RwpyRC1xff1PMKAsWoxkZ4zX8HJcH5z6bNRTW
	dMQNLdbZWO2F8QDvRNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcX58-00000003Lu7-0eF9;
	Mon, 27 Jan 2025 21:55:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcX54-00000003Ltj-2Gsr
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 21:55:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216728b1836so79988505ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738014941; x=1738619741; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6+3mg+IAQYSaipjZmIIeZ1Xht6zOmBERBwmHqIuZhA=;
        b=EjoEiDNXMtfWxrQbsjmfczaS5PJY8uIuK472BCY0EtMW89mxiox9/2RYGfDx28JH0+
         AXXCoj1a8fKTTE43BWmA+VMnEzvjn9rxAxIc+69cTHc/5kovoSZ4YuMDc2BPQY+B2PNa
         OANSvh0PN/eao3Ibtw0pAQxeuzvmVFyFsaSPFp+r7IeRLh+6SkgZugKqvbjXxTfqhA57
         vcnvxrA89nM53TMOMqj6C/1ghUHo/Rx0O4OpwG9E9R46ndv5k+WXeZB1B4eH02voq9CC
         ZzpXvu8m9XRqjdGZOSJnK4PNrkHAxWyLHctfLwlkWAbQYC8puiuFXOREMC2WKCZirJoN
         Yzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738014941; x=1738619741;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6+3mg+IAQYSaipjZmIIeZ1Xht6zOmBERBwmHqIuZhA=;
        b=xTWAqnPf6pOpxSdOanneIK1asqCb/JybkRrusv8kP94jNh73qcjNLs23OrCfyxyK2d
         UNmzAbOA7tUoehUjWq8uLEA8smwFOHFjMlOUGhW6fA6Gsl1qUJFLCs8XBN5ZlxbqoEhd
         7Vr0EXnFNjzyoI9uDgr2kUhbTN1H+ai/QWB98wnuD5GdWwZqRoMfoXqN4UehhhSgKwig
         qy0Sbue7IE72eqI3oQftbAG3dBx9BU9qKNXph3RLg2f/yo+GY2l2dkdPa64QNt406Iij
         1bEHTBenVMnU3HqLRhmuy9QbaGEfq/7hRPOeQMio8NUWmowF5airZWSuw41qmWdPRjm8
         bNNA==
X-Gm-Message-State: AOJu0Yz3FrsiC8Qz3uzrEAYr/SOYcpJpaylvSyJ32UHv53oehtcT9DJD
	rPYoABE4Mj1v56SYJNmUM/sRBOU49qHpSu3nOxqfXx5t6mdVczQy4ER/XfduFP0=
X-Gm-Gg: ASbGncvivfkJ1UoWvW9onDZzt01jwioP+yVwmp7Ku766KCcGs9w9Kl7qI4J7CLgS76E
	EwQnxHcmVaUmDKXbM865BO5UIThjfUUispZfiaw9v4V72A72dbW2kvXg8iDttKXDXwcRm1mapRr
	4ST4XtzH/yubY7HVpa5cSvRjgzUfiPhgx3Q+5tPlgYC8oYnRgWxGtxtSzTHASUkSmw6Mhrcn5Pb
	H6qcrKS+wPW7W8EZgxPcj4uonEk6WKaNX5kpcrawlTc5NxdjFJ2UDPmjO1Ao3H6DLJ1XtaO8nEA
	Ib+4jEhr7Q/GVlJpqk2F
X-Google-Smtp-Source: AGHT+IHljk+TmABLCXCynxeRWH2RAjpOtbJGQHrDJiF5knuiU1QQsAXSJbGJE310Jt53PsPRhXkIzQ==
X-Received: by 2002:a17:902:d50c:b0:21a:8dec:e59f with SMTP id d9443c01a7336-21c355c28f0mr550398165ad.39.1738014941514;
        Mon, 27 Jan 2025 13:55:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424ef1bsm68478225ad.248.2025.01.27.13.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 13:55:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 13:55:31 -0800
Subject: [PATCH v2] riscv: Add runtime constant support
MIME-Version: 1.0
Message-Id: <20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIANIAmGcC/22NQQ6CMBBFr0JmbU07iKAr72EIgTLKLGhNpzYaw
 t2tJO5cvpf89xcQCkwC52KBQImFvcuAuwLs1Ls7KR4zA2qstMFShaeLPFNnvZPYBRab1NGOTXU
 gwsbUkJePQDd+bdVrm3liiT68t5NkvvbXq//2klFG1adq0FhSj3q4BE5e2Nm99TO067p+AHAwz
 nu5AAAA
X-Change-ID: 20250123-runtime_const_riscv-6cd854ee2817
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7204; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=kgHyIQkGRqavcs9ZYY5n8FQZP3WRPCbidd0oGsd0PNg=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oMhqvbIjMWxWeVfgmt7PKLapEQnX49Ku/HlGeTa7fx2
 ka293p1lLIwiHExyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJGXpQz/a349OcMS/ch32u1L
 b/+dEzvaGjM/WyPJ/sshL/vEu3seCzIy/PglPOdOfVBava6Mfa1O+L1nL20mZayXOrCynNX+2Kb
 NLAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_135542_596510_800146A2 
X-CRM114-Status: GOOD (  19.28  )
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
Changes in v2:
- Treat instructions as __le32 and do proper conversions (Ben)
- Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
---
 arch/riscv/include/asm/runtime-const.h | 179 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 2 files changed, 182 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
new file mode 100644
index 0000000000000000000000000000000000000000..415d3e4509094a18a7bac3deaa499d0cb38e9fcf
--- /dev/null
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_RUNTIME_CONST_H
+#define _ASM_RISCV_RUNTIME_CONST_H
+
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
+ * different registers and then combine the results. If the processor supports
+ * the Zbb extension, we can combine the final "slli,srli,add" into one
+ * instruction "add.uw".
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
+		"slli	%[__tmp],%[__tmp],32\n\t"			\
+		ALTERNATIVE(						\
+			"slli	%[__ret],%[__ret],32\n\t"		\
+			"srli	%[__ret],%[__ret],32\n\t"		\
+			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
+			".option push\n\t"				\
+			".option arch,+zba\n\t"				\
+			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"	\
+			"nop\n\t"					\
+			"nop\n\t"					\
+			".option pop\n\t", 0, RISCV_ISA_EXT_ZBA, 1)	\
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
