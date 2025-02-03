Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDDDC02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6tKbF4v22uFhQu/ywqxql/qOX8n6ClC6mrURVzYva5k=; b=OBZFzNcdLIThGV
	aQ4KPklottHVRa05KMaYiUP2SBLPwiAdSIPKMAjnvop4XIkOjtKvJp9lU9EkDCxhSsfBeIo9XfR6U
	Gg5k/bFKxaTiv79u20BwIrZhjuhZ8BHumXmDyavkxfJUdnSI6yM+KqmJ6xtC8D5g1jC7G03XVIuOI
	xNxsTy5JLSjAr1imwKW0ddOVNhoVn/172Wcw1vo0MQLDx/UPMCQwWd1DmAEr2lHQZpv3n+vq7NaxN
	tRqGKMRxMG+x+APcUAJPOiZ95o0y1s3dSoPrB1R3m4S9hpQp7VGN46ZBj+1uQjkVmza+g7Wic/xhb
	ScrHAODYiPaWfjxTy4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3hj-0000000GcOo-2J0r;
	Mon, 03 Feb 2025 21:10:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3FU-0000000GYv5-2m5g
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 20:40:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21669fd5c7cso85975415ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738615251; x=1739220051; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8Zy0lPG6xJFXQmA/ow+W2nd6atRP51DXYjGxeq5LAU=;
        b=frqf2o7Fe9BRNmayhY2fa/nrO0fm37Q3SbgPMMaHmTrIsapkUFLPTBlSWCwcHcsaJ7
         AWfRV71tgkxDh/3doebmlhzo26rIN4UuU+QrirR4dRJznQHbUBkX/e8vMrwzj8D8/W8g
         uVobdQDYWWXGm0jgbXf+uwasB6BTsLe59l+6UgQ9hHmpZ/nbjmRw1gkwxPgehud3nJwJ
         MpGnNr6GhYFXTqOl0cD1Crihhf0aasYFQoEN7SBs9e0iKcXTL3zIQGR0BJ0Q8Cg/asP2
         mBvMa/YJyT11OZhm0UgB70f7l+hm/FNHTQxz3f55FGVYpZYiodgpGx8ZY8gfidAdDV/V
         9YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738615251; x=1739220051;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8Zy0lPG6xJFXQmA/ow+W2nd6atRP51DXYjGxeq5LAU=;
        b=HrDGDjY92tH/eXDMqidYJIwy7+WG/NuxUqxOE0kcRU6hpLhFx3k1SD9rxNAOuwBm+R
         L4u8gbu+9vRg3XYU4bMD0QmixcCOrAWD7NsJz+DvqbutmjuITK99kmDTsd9JFnz0pFeI
         QwtUabWIK60HVdsBOpjBLEpsLfy7MMJ8VGv7dtdHqzRjsKRqvfLhbJl8sfKZSmb2NP7Y
         588ljO7Yj3t82zw4ycVVI5e7kpGIg+lm86C38glK9xJcX1t7yNc9ytM9xHK+ez1X9J5V
         aAq/JL0N4uMU8PymQ9c1Hak8D3GqI9W/tIh79EOgtrF/nbmGzqEKdQfg5c00bIcc6qX4
         oaaQ==
X-Gm-Message-State: AOJu0YzAf18vYANYgw6P+S6G8S5HZ/9K0yPUZu3AagW1oKYJfHC5VUt/
	aj/A9ESuQZEk9D5Wqcl7Ts/AqPV0zh4I7QOKIt13aFnc96u8tHxyrK+FZHT3/IpPrGG3O9SJW94
	D
X-Gm-Gg: ASbGncvprIoNsZ0EKDML3VKuhhOQ3Bj7QZrdCQMzGv8FxW0mD0Bq+EFVxWgTnR/i2Kx
	bcE+vstpZPcCVAJLDDmNbHDNdkI4fKHvT1Z2mH+wpCK1/NV9ZoHHTzhwE3rBNUkmWr5KdJo3czv
	uThabwpfMdgWayAgv7PbOvSVk2ZsqMQvCj2YDTu91bI/rf4Zg6Fh/y9WKmtiSw8T4E4UfxHXOYB
	94yrb3Z7gTEOinTB5ghCnIadtOe56/iBRpZDBmYoUMoC5ytJAnksv0QFEkrLW1HvjRpI2ZwpONZ
	GPj/SN5ew0pt6dDFIMkbM7qtID73AUQ=
X-Google-Smtp-Source: AGHT+IGDmQaZbcrvssMiiL60j+TVXJEpN3gw5/WiVLAA4e66OJsLZm6LCawjbeTXAmyvS8VkbmBo+A==
X-Received: by 2002:a17:903:41c3:b0:216:56d5:d87 with SMTP id d9443c01a7336-21dd7db93f5mr371364575ad.34.1738615251439;
        Mon, 03 Feb 2025 12:40:51 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33000e0sm80853465ad.167.2025.02.03.12.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 12:40:50 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 03 Feb 2025 12:40:41 -0800
Subject: [PATCH v5] riscv: Add runtime constant support
MIME-Version: 1.0
Message-Id: <20250203-runtime_const_riscv-v5-1-bc61736a3229@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMgpoWcC/43NwYrCMBDG8VeRnDdLMmlMs6d9DxFpp+M6BxNJa
 lCk724UFkRy8Pgf+H5zE5kSUxY/q5tIVDhzDDXs10rgYQh/JHmqLUCBVRqMTOcw85F2GEOed4k
 zFrnGqbcdEfTaibo8Jdrz5alutrUPnOeYrs8nRT+u/55rekVLLZ23owJDA6jxN3GJmQN+YzyKB
 1ngAwYq4+1ADvfeDcY3GPPK9G3GVEZrD+B7TzCZBtO9MEa1ma4ydb3GTo9u9PjGLMtyB7fVmRO
 OAQAA
X-Change-ID: 20250123-runtime_const_riscv-6cd854ee2817
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8649; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=rXFfU6ED2XfqPewvtEzU67hZBmLdE6NpBeM4mArIHdo=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/pCzTNuP+5yfBE6eWibTVvU3MV/rtUZPuxh7hPQ/sCsc
 IJ3U6JgRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABPR2cTIMGvly0LfO9fNXkzM
 aA/ZU/pX6dXtm7UqZ9VXvpj+4wjDIjNGhva1CyXro5sXWU58s12D4Wpe+yuJ8zWn9ZdfkitRYhT
 W5QQA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_124052_716877_1A563960 
X-CRM114-Status: GOOD (  19.41  )
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
Changes in v5:
- Split instructions into 16-bit parcels to avoid alignment (Emil)
- Link to v4: https://lore.kernel.org/r/20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com

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
 arch/riscv/include/asm/runtime-const.h | 199 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 2 files changed, 202 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
new file mode 100644
index 0000000000000000000000000000000000000000..bbfa8c512c602e49a34f4e1b1174c77c0478ca44
--- /dev/null
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -0,0 +1,199 @@
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
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret, __tmp;					\
+	asm_inline(".option push\n\t"					\
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
+	asm_inline(".option push\n\t"				\
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
+static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
+{
+	unsigned int lower_immediate, upper_immediate;
+	__le32 lui_res, addi_res;
+	u32 lui_insn, addi_insn;
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
+	patch_insn_write(addi_parcel, &addi_res, sizeof(addi_res));
+	patch_insn_write(lui_parcel, &lui_res, sizeof(lui_res));
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
