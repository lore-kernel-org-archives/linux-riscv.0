Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9A7C0218A
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 01:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s0oDJSrNrtELQl41cOFcaIzq5rNsDnWZSzjoBN77Bao=; b=dedcGZ/JrdltcO
	U+KjUDiELj8pQxq4C8/a6z89mOG00EDI7YncRHsifR5U7aKKm9TTLkpRwtv1uyO6gg5DxQf7mdrmu
	WiJeaJtaYDnV3HFYwiMTilrYoqsmP8aF2Esh+cslM5rTlqjE4ZVqM6I9pzw4chaHKi22XDqUVIEDr
	/H/CIhGaHqAEHjxf6gP8XZCsYnHgWH6CXB/VRTREoaLUzyne7wk7ruq5svOt5PIksa05vWGzeNkvU
	kG66w5gzD4FGZkydGjhYghYtt4KQQpDWDY7BFUvwauWgqlRDfUsLWip0CWFJ34yqEKcJpmSfqEPRe
	EUTGdWGrQpc7XaIU3KPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfnf-00000009tbY-3DwV;
	Fri, 31 Jan 2025 01:26:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfnc-00000009tbB-3UF2
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 01:26:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-215770613dbso19029945ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 17:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738286783; x=1738891583; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLYtIb60QdaMvEs8DbLr0Aj2euKQnIRNBWio1GOgif0=;
        b=StmopiY8yPPWjbUvh7kiSC8y8WMQmXtthB42Oia3SsS/MZAZS+VDH4l04EHi9c8n4n
         1/SOVig4ql2UyQHh4b+1cHIykF3JNmbI0ZS6JZc8vmeWaoPDr9Tz01xOqeE3f2fC6LGL
         stfYb41pftu91f/t9M9/vi6Zb0Mior80j2zYDBK62tv4h0cJfMED7ksfctfTgtXDar8l
         +Ky4czVLNFLyj71z67OFVQ9tPRSiRGgDyKXH9qyOdSDmzhaBdTpM+cTGHv8uF51mWj2+
         HX4oSsTdRQVO4OBpNZUussjgvcQ/Qr62pOt6Kd4jUzuk/Nb+by5k0BBRTOwSDPGbHAkL
         KmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738286783; x=1738891583;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLYtIb60QdaMvEs8DbLr0Aj2euKQnIRNBWio1GOgif0=;
        b=gA7FFvAMDpyhx+q2CWTMmwGaLFG+iOc6MBrElTudUKuc6dY7nLpMZHvUUWP4xOYdVW
         PgHHO2+k6+CXhgA51MZ0x7vd/m9i2Y+NELqyBLJuaH3X/xSM7qQzaG3A1Z61hfLFw9E3
         Cjzj493qf18+qf3a8hj3HvTXpm2sqmUQdvBLfkjTID0/72rKgR+wMIVOQbTUGdXUE7Rc
         Sd+YQXbCVcOHqCWavX0qSEtfZxA+acMD1uG8t35bJlv6VqiZd+TCONpa6C5a81y/4uCC
         ipzZ+J4ym3W08HiyjiBed3MfGwEAjxi3CvDT8I8it0QeRFfxKEqwGyA7iN5TNF0CBAFO
         7Lbw==
X-Gm-Message-State: AOJu0YyBCXjLBLVhr7Em7Hclc54omEb1VespfzvVtQIAR+xQeMQjn1lq
	qCYYQqSfmQ3crvrfjfgyaF/iGjhlfv55db1XpVGiOpwM+nlJmcPf/h6/BEs/syCZao/faE47K9n
	B
X-Gm-Gg: ASbGncuOvYylksU1afwGx3TR9huDZoDz7UBcMPPRpEreTtpeqybb94GZSDK+QECRP66
	WCTkOhze53d1QzmRIXZlPoXNtCosvg/BDqhmfN6LKOk1C4XMXFYJjYbG3lVjkdBKkk3jQAbdpb3
	DhrWTNVemq+KEsYGD1bqLm9DXUcHjL9uBV+JLhj9ct0eABmam97tnleG4GpmasssxpSKhgeHTvP
	8atBEOqfUdrS+Z/k39sOj2xjLAe9G/O3btPxgtrrSt4S/dIdMAEz0bCLVs+lKn4iyRHysnci9ud
	lpE33nnBGKOasrYurEM10iLO9rPdA1g=
X-Google-Smtp-Source: AGHT+IE4KUqZgOkFqHAqvI1hCePx1T8BeG59+fid4eN9OkWCvv36BMGJR7Kh2xvq5j+RseaNnjquDg==
X-Received: by 2002:a17:903:124a:b0:215:44fe:163e with SMTP id d9443c01a7336-21dd7c4c144mr149019855ad.1.1738286783332;
        Thu, 30 Jan 2025 17:26:23 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf95b44sm4691047a91.37.2025.01.30.17.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:26:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 30 Jan 2025 17:26:12 -0800
Subject: [PATCH v4] riscv: Add runtime constant support
MIME-Version: 1.0
Message-Id: <20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIALMmnGcC/43N0QqCMBTG8VeRXbdwZ9pcV71HhOg85rloi81GI
 b57UwgivOjy/8H5nYkF9ISBHbOJeYwUyNkUxS5jZmjsFTl1qRnkUOYCJPcPO9INa+NsGGtPwUR
 +MF1VFohQCcXS5d1jT89VPV9SDxRG51/rkyiW9eOpTS8KLrjSZZuDxAby9uQpukDW7I27sYWM8
 AcDidFlg8r0WjVSbzDym6m2GZkYITSArjRCJ3+YeZ7fW9YFsUcBAAA=
X-Change-ID: 20250123-runtime_const_riscv-6cd854ee2817
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8307; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=fRVAyJRZWPS7vdG0um+ImMkb5g/yW1KIBkWdtJLFg14=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/octR2nHlY2LpQ+5HrsF9vUTPG+j3KGc7NubukM+vTo1
 Pri6VYMHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAExkvQnD/0Kdg7vF/m+WaKze
 4bhNiuuLkuOGCZ/qP3rIHnyieDhWy5KRYfkKiWSxYxudD53rXhDdpsP+qmPnn/Rrpb/KPxW8Ki/
 dxQ4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_172624_883258_78976696 
X-CRM114-Status: GOOD (  19.06  )
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
Changes in v4:
- Add newlines after riscv32 assembler directives
- Align instructions along 32-bit boundary (Emil)
- Link to v3: https://lore.kernel.org/r/20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com

Changes in v3:
- Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
  by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
- Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com

Changes in v2:
- Treat instructions as __le32 and do proper conversions (Ben)
- Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
---
 arch/riscv/include/asm/runtime-const.h | 197 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 2 files changed, 200 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
new file mode 100644
index 0000000000000000000000000000000000000000..8ae288c4bfaf9b7e9c3c82b37ef820cebf8af07d
--- /dev/null
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -0,0 +1,197 @@
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
+	asm_inline(".align 4\n\t"				\
+		".option push\n\t"				\
+		".option norvc\n\t"				\
+		"1:\t"						\
+		"lui	%[__ret],0x89abd\n\t"			\
+		"addi	%[__ret],-0x211\n\t"			\
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
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret, __tmp;					\
+	asm_inline(".align 4\n\t"					\
+		".option push\n\t"					\
+		".option norvc\n\t"					\
+		"1:\t"							\
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
+	asm_inline(".align 4\n\t"				\
+		".option push\n\t"				\
+		".option norvc\n\t"				\
+		"1:\t"						\
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
