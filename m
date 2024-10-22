Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C9ED17157
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wocK7TQzkoi26+gJDFAk5P/7Zsxrr7khGMBEFTOLFds=; b=LdzSpBacIUzyc8
	Nwefrjr4HXkzomIZWaOjcl86wfrgqV5erCuGuP2PH8PSVfs/U7hX6DuhywU7oLWCTJO9s7oQw0qDv
	MwFiowVyBCzbeaIBansCwILrR+BOj7cseIqiiGgcXO1YjbB/AWFqVN1xrj+dDlPxuxb1tiB7Cgbyw
	uQhkMxZnZAT70cjBYNS0vdZYQYZRgxCqjuPVDJY8kkWS5QsXvlRK5qCHebMRVhKq7cDeezMAsPQLR
	MZdafgDCvnxUTXNNx7Jrs9E4Id6GY9azHKMcQoApwPtKX1+kgk/UB7cWHHvYrZmctTGHK5FOGxMUS
	n9QeEIJtLxbbmlsB4flg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34Cr-00000009GTy-1NWT;
	Tue, 22 Oct 2024 02:01:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34B5-00000009Fku-0y4Y
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:20 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso3383999b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562358; x=1730167158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwUiyMUd8hSbAOwVDn06T0GWpMaINHNufJwGBjiF7oM=;
        b=Znmu8H+/F0rgiwfmtG4fUrAiRxvpRior8S4Mh8W0pPeYXFEBgCe0SWa55uFyNLAhw6
         75coeO2Dqem6m+dmxCWovEOghP3dcyRlKI01cV4ycp3AAijVt+z5FUgxQxDHW5r6tJqw
         gKfjncnKAGa0tYzYaiKWFJJABwu4llNnphzMqF6IdTBd2+4YMtDCyOHj3Iq6i6KqTljP
         4g5Zs6eyKvv6vA7pJ/py7VFbudFb450vf+nSYgWwl9zJ7aiUy8qV1pWt7ONebw0VdyKN
         nbPq6+pkLfaoNaX+iIZYrd0/Hn3ejcgc5bVn8/k6bgDNsYWJQVDKvJTLrYsyfkb1W+Dm
         MtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562358; x=1730167158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwUiyMUd8hSbAOwVDn06T0GWpMaINHNufJwGBjiF7oM=;
        b=p+tweCsO1w1PIEnR7VAMl5aLuXoe4/7xcVrCPcSgxpBbhYOHPSMKsOaacK8Tk67rVv
         nhEss1bv+AKzSbQxPtAmpOgmmwkJiuBCsl2XzH7MGa9UIb7nG9c5c5C7lo9c76zR3Fkl
         RF7SgsOIlC78avRLmE1iVIabd7hWTCTTWtI6q/lMr7a+QNMvetZb8e9EFW+V/yjAD8Ef
         1yKtloAebjRSrVCnAtAGRKMZzRCveYu8alYZiMKu6w3qs5Em2KpTOdfLvMhbEEctPHbc
         HmEMPoQLeuJuGJDJjl+pWCWudDUQp2yohKIZUZdXkG0HSRqv6SMl6qQm+Jv9nzCs8U7y
         28Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXS7HntZsyNwKGgLBsoT8o162Z+ThjCOPjOraI6xXfPRU5DwPzssRkWlz0gdjYu0noIiPwsWwnR0sqy0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzea7YyeMGmz5EmffyLFiBny1WB+ZVUICEpYF25IkO1vdHVrW3D
	kf8qAV+8Kz/c6j7HglAp4Waf78V+ggRzTQDgTZikBTt5u7sk6MyHGcDvHE4xICM=
X-Google-Smtp-Source: AGHT+IF/kNxKO+HoCV5OxccF94G79KMrSvpY4AWhKUS70q2xmcQQgKjPTjZVS3p5yxthRrvUotX1BA==
X-Received: by 2002:a05:6a00:3d08:b0:71e:1314:899a with SMTP id d2e1a72fcca58-71ea31e4c76mr18906065b3a.20.1729562358073;
        Mon, 21 Oct 2024 18:59:18 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:17 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
Date: Mon, 21 Oct 2024 18:57:09 -0700
Message-ID: <20241022015913.3524425-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185919_301860_3A53A7F9 
X-CRM114-Status: GOOD (  29.14  )
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

Currently, kasan_mem_to_shadow() uses a logical right shift, which turns
canonical kernel addresses into non-canonical addresses by clearing the
high KASAN_SHADOW_SCALE_SHIFT bits. The value of KASAN_SHADOW_OFFSET is
then chosen so that the addition results in a canonical address for the
shadow memory.

For KASAN_GENERIC, this shift/add combination is ABI with the compiler,
because KASAN_SHADOW_OFFSET is used in compiler-generated inline tag
checks[1], which must only attempt to dereference canonical addresses.

However, for KASAN_SW_TAGS we have some freedom to change the algorithm
without breaking the ABI. Because TBI is enabled for kernel addresses,
the top bits of shadow memory addresses computed during tag checks are
irrelevant, and so likewise are the top bits of KASAN_SHADOW_OFFSET.
This is demonstrated by the fact that LLVM uses a logical right shift
in the tag check fast path[2] but a sbfx (signed bitfield extract)
instruction in the slow path[3] without causing any issues.

Using an arithmetic shift in kasan_mem_to_shadow() provides a number of
benefits:

1) The memory layout is easier to understand. KASAN_SHADOW_OFFSET
becomes a canonical memory address, and the shifted pointer becomes a
negative offset, so KASAN_SHADOW_OFFSET == KASAN_SHADOW_END regardless
of the shift amount or the size of the virtual address space.

2) KASAN_SHADOW_OFFSET becomes a simpler constant, requiring only one
instruction to load instead of two. Since it must be loaded in each
function with a tag check, this decreases kernel text size by 0.5%.

3) This shift and the sign extension from kasan_reset_tag() can be
combined into a single sbfx instruction. When this same algorithm change
is applied to the compiler, it removes an instruction from each inline
tag check, further reducing kernel text size by an additional 4.6%.

These benefits extend to other architectures as well. On RISC-V, where
the baseline ISA does not shifted addition or have an equivalent to the
sbfx instruction, loading KASAN_SHADOW_OFFSET is reduced from 3 to 2
instructions, and kasan_mem_to_shadow(kasan_reset_tag(addr)) similarly
combines two consecutive right shifts.

Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Transforms/Instrumentation/AddressSanitizer.cpp#L1316 [1]
Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Transforms/Instrumentation/HWAddressSanitizer.cpp#L895 [2]
Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Target/AArch64/AArch64AsmPrinter.cpp#L669 [3]
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Improve the explanation for how KASAN_SHADOW_END is derived
 - Update the range check in kasan_non_canonical_hook()

 arch/arm64/Kconfig              | 10 +++++-----
 arch/arm64/include/asm/memory.h | 17 +++++++++++++++--
 arch/arm64/mm/kasan_init.c      |  7 +++++--
 include/linux/kasan.h           | 10 ++++++++--
 mm/kasan/report.c               | 22 ++++++++++++++++++----
 scripts/gdb/linux/mm.py         |  5 +++--
 6 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..6a326908c941 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -418,11 +418,11 @@ config KASAN_SHADOW_OFFSET
 	default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
 	default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
 	default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
-	default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
-	default 0xefffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && KASAN_SW_TAGS
-	default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
-	default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
-	default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
+	default 0xffff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
+	default 0xffffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && KASAN_SW_TAGS
+	default 0xfffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
+	default 0xffffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
+	default 0xfffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
 	default 0xffffffffffffffff
 
 config UNWIND_TABLES
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 0480c61dbb4f..a93fc9dc16f3 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -80,7 +80,8 @@
  * where KASAN_SHADOW_SCALE_SHIFT is the order of the number of bits that map
  * to a single shadow byte and KASAN_SHADOW_OFFSET is a constant that offsets
  * the mapping. Note that KASAN_SHADOW_OFFSET does not point to the start of
- * the shadow memory region.
+ * the shadow memory region, since not all possible addresses have shadow
+ * memory allocated for them.
  *
  * Based on this mapping, we define two constants:
  *
@@ -89,7 +90,15 @@
  *
  * KASAN_SHADOW_END is defined first as the shadow address that corresponds to
  * the upper bound of possible virtual kernel memory addresses UL(1) << 64
- * according to the mapping formula.
+ * according to the mapping formula. For Generic KASAN, the address in the
+ * mapping formula is treated as unsigned (part of the compiler's ABI), so the
+ * end of the shadow memory region is at a large positive offset from
+ * KASAN_SHADOW_OFFSET. For Software Tag-Based KASAN, the address in the
+ * formula is treated as signed. Since all kernel addresses are negative, they
+ * map to shadow memory below KASAN_SHADOW_OFFSET, making KASAN_SHADOW_OFFSET
+ * itself the end of the shadow memory region. (User pointers are positive and
+ * would map to shadow memory above KASAN_SHADOW_OFFSET, but shadow memory is
+ * not allocated for them.)
  *
  * KASAN_SHADOW_START is defined second based on KASAN_SHADOW_END. The shadow
  * memory start must map to the lowest possible kernel virtual memory address
@@ -100,7 +109,11 @@
  */
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+#ifdef CONFIG_KASAN_GENERIC
 #define KASAN_SHADOW_END	((UL(1) << (64 - KASAN_SHADOW_SCALE_SHIFT)) + KASAN_SHADOW_OFFSET)
+#else
+#define KASAN_SHADOW_END	KASAN_SHADOW_OFFSET
+#endif
 #define _KASAN_SHADOW_START(va)	(KASAN_SHADOW_END - (UL(1) << ((va) - KASAN_SHADOW_SCALE_SHIFT)))
 #define KASAN_SHADOW_START	_KASAN_SHADOW_START(vabits_actual)
 #define PAGE_END		KASAN_SHADOW_START
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index b65a29440a0c..6836e571555c 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -198,8 +198,11 @@ static bool __init root_level_aligned(u64 addr)
 /* The early shadow maps everything to a single page of zeroes */
 asmlinkage void __init kasan_early_init(void)
 {
-	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
-		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC))
+		BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
+			KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+	else
+		BUILD_BUG_ON(KASAN_SHADOW_OFFSET != KASAN_SHADOW_END);
 	BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS), SHADOW_ALIGN));
 	BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS_MIN), SHADOW_ALIGN));
 	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, SHADOW_ALIGN));
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 00a3bf7c0d8f..03b440658817 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -58,8 +58,14 @@ int kasan_populate_early_shadow(const void *shadow_start,
 #ifndef kasan_mem_to_shadow
 static inline void *kasan_mem_to_shadow(const void *addr)
 {
-	return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
-		+ KASAN_SHADOW_OFFSET;
+	void *scaled;
+
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC))
+		scaled = (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT);
+	else
+		scaled = (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
+
+	return KASAN_SHADOW_OFFSET + scaled;
 }
 #endif
 
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index b48c768acc84..c08097715686 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -644,15 +644,29 @@ void kasan_report_async(void)
  */
 void kasan_non_canonical_hook(unsigned long addr)
 {
+	unsigned long max_shadow_size = BIT(BITS_PER_LONG - KASAN_SHADOW_SCALE_SHIFT);
 	unsigned long orig_addr;
 	const char *bug_type;
 
 	/*
-	 * All addresses that came as a result of the memory-to-shadow mapping
-	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
+	 * With the default kasan_mem_to_shadow() algorithm, all addresses
+	 * returned by the memory-to-shadow mapping (even for bogus pointers)
+	 * must be within a certain displacement from KASAN_SHADOW_OFFSET.
+	 *
+	 * For Generic KASAN, the displacement is unsigned, so
+	 * KASAN_SHADOW_OFFSET is the smallest possible shadow address. For
+	 * Software Tag-Based KASAN, the displacement is signed, so
+	 * KASAN_SHADOW_OFFSET is the center of the range.
 	 */
-	if (addr < KASAN_SHADOW_OFFSET)
-		return;
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+		if (addr < KASAN_SHADOW_OFFSET ||
+		    addr >= KASAN_SHADOW_OFFSET + max_shadow_size)
+			return;
+	} else {
+		if (addr < KASAN_SHADOW_OFFSET - max_shadow_size / 2 ||
+		    addr >= KASAN_SHADOW_OFFSET + max_shadow_size / 2)
+			return;
+	}
 
 	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
 
diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
index 7571aebbe650..2e63f3dedd53 100644
--- a/scripts/gdb/linux/mm.py
+++ b/scripts/gdb/linux/mm.py
@@ -110,12 +110,13 @@ class aarch64_page_ops():
         self.KERNEL_END = gdb.parse_and_eval("_end")
 
         if constants.LX_CONFIG_KASAN_GENERIC or constants.LX_CONFIG_KASAN_SW_TAGS:
+            self.KASAN_SHADOW_OFFSET = constants.LX_CONFIG_KASAN_SHADOW_OFFSET
             if constants.LX_CONFIG_KASAN_GENERIC:
                 self.KASAN_SHADOW_SCALE_SHIFT = 3
+                self.KASAN_SHADOW_END = (1 << (64 - self.KASAN_SHADOW_SCALE_SHIFT)) + self.KASAN_SHADOW_OFFSET
             else:
                 self.KASAN_SHADOW_SCALE_SHIFT = 4
-            self.KASAN_SHADOW_OFFSET = constants.LX_CONFIG_KASAN_SHADOW_OFFSET
-            self.KASAN_SHADOW_END = (1 << (64 - self.KASAN_SHADOW_SCALE_SHIFT)) + self.KASAN_SHADOW_OFFSET
+                self.KASAN_SHADOW_END = self.KASAN_SHADOW_OFFSET
             self.PAGE_END = self.KASAN_SHADOW_END - (1 << (self.vabits_actual - self.KASAN_SHADOW_SCALE_SHIFT))
         else:
             self.PAGE_END = self._PAGE_END(self.VA_BITS_MIN)
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
