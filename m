Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D5C0218C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xn0OG4BrrnBS0Dfu2hUd9ewbJ/f5QGVArgveeEMrAeY=; b=Z1soIy/g2fJ/3x
	gEf5S6ro3S41DipRXQqoSJvfHL3YXhX4U2O6l9fI7WtgvOrsg1CxSplJj9NDU8Fj+wq1zR5wMqT/s
	ddFWMXDextI9WWP6uHFMPricj9rWiwTY94JGFGCuVmyEMFExArKFpkL2xy7W2NZcBHaUnkktR+taa
	pcfjFSy9p7LHFxTmEF35D2K6qtrGGOg8aFZOaYWjGreY1GUyIPMrw6+yeF2iKaA6oaTPZwJSbTBaX
	DYvoAMk5SQVc4d7sR0ehNwsUnVG/4Vx2i5E6+pCs/aeNDZlVGh7iimNNgQbgpC2ZzN89Bebr2ZCKv
	mfSqXy8+e0rVAZ/A9BjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKKU-00000001scJ-2qPY;
	Mon, 27 Jan 2025 08:18:46 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKKR-00000001sbw-2pfH
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 08:18:45 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so5362710a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737965923; x=1738570723; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZMMHgiSjhML0uxP7HycK/oqbn2Dogj+AqWFPfJxjV8=;
        b=w9StMtDq/7BwmR5mEdy4ciKwuAVe/h0ytDQjpi1MZGEDmyazwRhpeW/1BwQ4p5wyJo
         Hlna7i8x+IxAVQkRB7X1fflArZ9uY1OUXj5Ewdo97acmjo5gf2Ts3AnVQ1sSeFDUzG7L
         hIKi5PIRmcIPRZkNG8i3O1ZKkRFJupGUMps4hulzisjuy07HBwoOJhoUEHsT+RM+KmeA
         OAtxx7LY0DXpHyPLQsfZkVlExHyFduEQ/WNOWxRbWIUSGw8l+Dp1yXcL9K5Y3mFsaon8
         an6zhapH4QPF+ko9lxGM/1o1p7xTVjdea/jikOuMYT72M7t/sfDF7VMuXSIcl24q3nek
         fAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737965923; x=1738570723;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZMMHgiSjhML0uxP7HycK/oqbn2Dogj+AqWFPfJxjV8=;
        b=qRIaJF9HqBROHXoqdr5uWsPdciKyRhhcJs9nbTZ5f3VQiD6ojeeNTvNgSNSVGsGZd7
         NsjdZsLaMeTDtA+Wo/wSON0SSzQgnRYdekBc+hJed/oup1nSb1GFVScDB0vn+Q92fGnC
         EGOEeCP7Dr5uCmjYQOsvJtGi8ZrdUkRUVZO/G5TdqqG3RMLEl7iNBzmHZ4IEESfUcrSd
         gPlwixc66apB+kXSwfdDhoSP6+MZdyHBwJNl5eY55njhurjpF87mF6U1pJa8JjofL/5V
         y8RK9eWwRlhSnuY+RKB/IJPFRrnOdPFHsEa0RbNZRrfwKfsKRUdQgvERNTdIbmfzY2vy
         E2nw==
X-Gm-Message-State: AOJu0YxVOY0jXFLu5kFdsBKjUW4EnUMRwF+kAYmXWQiiPaOqVKZkrEnq
	ufBzBRFKCdlmPKqYJ9bLeBxJPShiB7HfbeClb1fXvyEQLozi2XQMn6SiRJ3eOc82HNJrNDn9uyW
	M
X-Gm-Gg: ASbGncuHAl5waSN6iEca9+m6jc6HJfUZMe7gd5F8i61zVaUZ8vBZyibcWjGAe4BRJED
	wa/NyUAd6nptaJgZwVQaOXFfDcwdTx7nLoRjit0l/ZONrucky4RYr9BC2NYOsN/FUkrSxVqmBiS
	GboNhcV0/kT6Nl0IPoHPbZkLOekJfF0L7IrDq/JtTMLt23UW6MVOKf8uxx5s3YKQZ0pyuf7pwZr
	PWROy9sm6XgqqPbiWKvEZcQESXS8tkKiyuoUUr2AI3XzegBdgkQvIbKGoaQ6rotHwjP5oYkzIdH
	uz2Im8E1RYhMSNaR2s6L
X-Google-Smtp-Source: AGHT+IHdGOf465tNO+IbIAjaBhA8R20FG3JyqNkV+Tw8vkmwD+/dL+0PVKcwyX8jU2CWcY02/+vbOw==
X-Received: by 2002:a17:90b:6c6:b0:2ee:889b:b11e with SMTP id 98e67ed59e1d1-2f782d972eamr56145257a91.30.1737965922809;
        Mon, 27 Jan 2025 00:18:42 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa56648sm6418499a91.13.2025.01.27.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:18:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 00:18:05 -0800
Subject: [PATCH] riscv: Add runtime constant support
MIME-Version: 1.0
Message-Id: <20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADxBl2cC/x3MQQ5AMBBA0avIrDVpSxFXERGpwSyUzJRIxN01l
 m/x/wOCTCjQZg8wXiS0hwSTZ+DXMSyoaEoGq63TxhaKzxBpw8HvQeLAJP5SlZ8aVyLaxtSQyoN
 xpvu/dv37fkjCbbJlAAAA
X-Change-ID: 20250123-runtime_const_riscv-6cd854ee2817
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6849; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/UVF12pJpymBBn4SpOOJ60r04U1Kkf8Y3g1WXeLFw6U=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/p0x0jntNtHFshO/aR3xTrDv1xrq2iL0mSnn3fe3lp4U
 shAK8Kvo5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlsfM7wz273eaY1U768PHxA
 rSw/9SdzR4btgrkqqSYRZ6ZYfzV4Y8rwz1DrqVPa8v/HZhz4afxLKXBSz56TpkdZ15xY5z5955R
 fGhwA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_001843_988548_A66F2749 
X-CRM114-Status: GOOD (  18.56  )
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
 arch/riscv/include/asm/runtime-const.h | 174 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 2 files changed, 177 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
new file mode 100644
index 0000000000000000000000000000000000000000..a551ff596d904a7a2ad2627c0cfaa0fff3a2280a
--- /dev/null
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -0,0 +1,174 @@
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
+	u32 lui_insn = *(u32 *)lui;
+	u32 addi_insn = *(u32 *)addi;
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
+	patch_insn_write(lui, &lui_insn, sizeof(lui_insn));
+	patch_insn_write(addi, &addi_insn, sizeof(addi_insn));
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
+	u32 insn = *(u32 *)where;
+
+	insn &= 0xfe0fffff;
+	insn |= (val & 0b11111) << 20;
+
+	patch_text_nosync(where, &insn, sizeof(insn));
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
