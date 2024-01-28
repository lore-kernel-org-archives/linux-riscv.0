Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480D7C47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6HJDzERmVFNUJx/KOdquD6aTWMT+hkjl949fVPeBoc=; b=r/LlDMoWtjGIpK
	2dMuTuCdIdu/ko1ovW9cTx+7d2ODC2m3+vq2f2Qb3HxGZe9i3NdcqCvaxR+FkjRkmOjXr6PYQIdmA
	H4os3ysghTqLsCND+6g5dL8TPE05Btt5ohVHf1y9SgmzuF10hoAW0WZKOyp6IKvjNOQEgc0RPq9/I
	gQufq+aB8Nv9REm3nh1dLqXgYmobGffs8nqnlaoAYbKKr8wI/MatGcpQXB4oCV2JiQoMlHDoAen9c
	gaeekpFFzGTzAWCgvCuS5ZyrWMmuMcIOaKwB5ISYrDn0JBSGOmfLKh4i82sNedK/nRhVnysG/VG1y
	h5XZGO0rBPj4VAiebIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3GI-00000009JXA-3fiw;
	Sun, 28 Jan 2024 11:23:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3GF-00000009JVK-23cH
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 11:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE2AD61A2A;
	Sun, 28 Jan 2024 11:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F28C433C7;
	Sun, 28 Jan 2024 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706440988;
	bh=51aqju5D7ZfZtgqtq/RpE3mm4RKMUFkOzrpLBoF/U2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7Fx9I4u43VhttKk0N/v3sTyoEKBYpBz6adEaiBKTBC2kSSAueq5qjAZA8Je3V79J
	 knK7DA7OSuxibwQV4FI70Is4ZLCIp7MU40N6dbgAz93rx9OFZ795DQknOcGCGT3mib
	 cLUpkRyEX5UPLHgwZv1u+Gg8p6HQM22RtuJuwyCNcwP+bIUBxDaeX41o/N27VC8oEb
	 lxB6xMm/lHFLI8Enazh9LmgQjR+AK0hAnYauTWEQOXyGW7sScr18UxED14cQMhwLLG
	 ELuDanpu/23DcPxqbFlQBZa2gSiZAFswntsc5NkB9pWWTA45MhknJehttjJcKNcBQJ
	 jhPXcTovWha1Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matteo Croce <mcroce@microsoft.com>
Subject: [PATCH 3/3] riscv: optimized memset
Date: Sun, 28 Jan 2024 19:10:13 +0800
Message-ID: <20240128111013.2450-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128111013.2450-1-jszhang@kernel.org>
References: <20240128111013.2450-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_032339_661921_471AED31 
X-CRM114-Status: GOOD (  21.14  )
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

From: Matteo Croce <mcroce@microsoft.com>

The generic memset is defined as a byte at time write. This is always
safe, but it's slower than a 4 byte or even 8 byte write.

Write a generic memset which fills the data one byte at time until the
destination is aligned, then fills using the largest size allowed,
and finally fills the remaining data one byte at time.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/string.h |   4 +-
 arch/riscv/kernel/riscv_ksyms.c |   2 -
 arch/riscv/lib/Makefile         |   1 -
 arch/riscv/lib/memset.S         | 113 --------------------------------
 arch/riscv/lib/string.c         |  41 ++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 6 files changed, 44 insertions(+), 122 deletions(-)
 delete mode 100644 arch/riscv/lib/memset.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 17c3b40382e1..3d45d61ddab9 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -10,8 +10,8 @@
 #include <linux/linkage.h>
 
 #define __HAVE_ARCH_MEMSET
-extern asmlinkage void *memset(void *, int, size_t);
-extern asmlinkage void *__memset(void *, int, size_t);
+extern void *memset(void *s, int c, size_t count);
+extern void *__memset(void *s, int c, size_t count);
 
 #define __HAVE_ARCH_MEMCPY
 extern void *memcpy(void *dest, const void *src, size_t count);
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index 76849d0906ef..9a07cbf67095 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -9,8 +9,6 @@
 /*
  * Assembly functions that may be used (directly or indirectly) by modules
  */
-EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(strcmp);
 EXPORT_SYMBOL(strlen);
 EXPORT_SYMBOL(strncmp);
-EXPORT_SYMBOL(__memset);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 5fa88c5a601c..b20cadccff78 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 lib-y			+= delay.o
-lib-y			+= memset.o
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
 lib-y			+= string.o
diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
deleted file mode 100644
index 35f358e70bdb..000000000000
--- a/arch/riscv/lib/memset.S
+++ /dev/null
@@ -1,113 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2013 Regents of the University of California
- */
-
-
-#include <linux/linkage.h>
-#include <asm/asm.h>
-
-/* void *memset(void *, int, size_t) */
-SYM_FUNC_START(__memset)
-	move t0, a0  /* Preserve return value */
-
-	/* Defer to byte-oriented fill for small sizes */
-	sltiu a3, a2, 16
-	bnez a3, 4f
-
-	/*
-	 * Round to nearest XLEN-aligned address
-	 * greater than or equal to start address
-	 */
-	addi a3, t0, SZREG-1
-	andi a3, a3, ~(SZREG-1)
-	beq a3, t0, 2f  /* Skip if already aligned */
-	/* Handle initial misalignment */
-	sub a4, a3, t0
-1:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 1b
-	sub a2, a2, a4  /* Update count */
-
-2: /* Duff's device with 32 XLEN stores per iteration */
-	/* Broadcast value into all bytes */
-	andi a1, a1, 0xff
-	slli a3, a1, 8
-	or a1, a3, a1
-	slli a3, a1, 16
-	or a1, a3, a1
-#ifdef CONFIG_64BIT
-	slli a3, a1, 32
-	or a1, a3, a1
-#endif
-
-	/* Calculate end address */
-	andi a4, a2, ~(SZREG-1)
-	add a3, t0, a4
-
-	andi a4, a4, 31*SZREG  /* Calculate remainder */
-	beqz a4, 3f            /* Shortcut if no remainder */
-	neg a4, a4
-	addi a4, a4, 32*SZREG  /* Calculate initial offset */
-
-	/* Adjust start address with offset */
-	sub t0, t0, a4
-
-	/* Jump into loop body */
-	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
-#ifdef CONFIG_64BIT
-	srli a4, a4, 1
-#endif
-	add a5, a5, a4
-	jr a5
-3:
-	REG_S a1,        0(t0)
-	REG_S a1,    SZREG(t0)
-	REG_S a1,  2*SZREG(t0)
-	REG_S a1,  3*SZREG(t0)
-	REG_S a1,  4*SZREG(t0)
-	REG_S a1,  5*SZREG(t0)
-	REG_S a1,  6*SZREG(t0)
-	REG_S a1,  7*SZREG(t0)
-	REG_S a1,  8*SZREG(t0)
-	REG_S a1,  9*SZREG(t0)
-	REG_S a1, 10*SZREG(t0)
-	REG_S a1, 11*SZREG(t0)
-	REG_S a1, 12*SZREG(t0)
-	REG_S a1, 13*SZREG(t0)
-	REG_S a1, 14*SZREG(t0)
-	REG_S a1, 15*SZREG(t0)
-	REG_S a1, 16*SZREG(t0)
-	REG_S a1, 17*SZREG(t0)
-	REG_S a1, 18*SZREG(t0)
-	REG_S a1, 19*SZREG(t0)
-	REG_S a1, 20*SZREG(t0)
-	REG_S a1, 21*SZREG(t0)
-	REG_S a1, 22*SZREG(t0)
-	REG_S a1, 23*SZREG(t0)
-	REG_S a1, 24*SZREG(t0)
-	REG_S a1, 25*SZREG(t0)
-	REG_S a1, 26*SZREG(t0)
-	REG_S a1, 27*SZREG(t0)
-	REG_S a1, 28*SZREG(t0)
-	REG_S a1, 29*SZREG(t0)
-	REG_S a1, 30*SZREG(t0)
-	REG_S a1, 31*SZREG(t0)
-	addi t0, t0, 32*SZREG
-	bltu t0, a3, 3b
-	andi a2, a2, SZREG-1  /* Update count */
-
-4:
-	/* Handle trailing misalignment */
-	beqz a2, 6f
-	add a3, t0, a2
-5:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 5b
-6:
-	ret
-SYM_FUNC_END(__memset)
-SYM_FUNC_ALIAS_WEAK(memset, __memset)
diff --git a/arch/riscv/lib/string.c b/arch/riscv/lib/string.c
index 20677c8067da..022edda68f1c 100644
--- a/arch/riscv/lib/string.c
+++ b/arch/riscv/lib/string.c
@@ -144,3 +144,44 @@ void *memmove(void *dest, const void *src, size_t count) __weak __alias(__memmov
 EXPORT_SYMBOL(memmove);
 void *__pi_memmove(void *dest, const void *src, size_t count) __alias(__memmove);
 void *__pi___memmove(void *dest, const void *src, size_t count) __alias(__memmove);
+
+void *__memset(void *s, int c, size_t count)
+{
+	union types dest = { .as_u8 = s };
+
+	if (count >= MIN_THRESHOLD) {
+		unsigned long cu = (unsigned long)c;
+
+		/* Compose an ulong with 'c' repeated 4/8 times */
+#ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
+		cu *= 0x0101010101010101UL;
+#else
+		cu |= cu << 8;
+		cu |= cu << 16;
+		/* Suppress warning on 32 bit machines */
+		cu |= (cu << 16) << 16;
+#endif
+		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
+			/*
+			 * Fill the buffer one byte at time until
+			 * the destination is word aligned.
+			 */
+			for (; count && dest.as_uptr & WORD_MASK; count--)
+				*dest.as_u8++ = c;
+		}
+
+		/* Copy using the largest size allowed */
+		for (; count >= BYTES_LONG; count -= BYTES_LONG)
+			*dest.as_ulong++ = cu;
+	}
+
+	/* copy the remainder */
+	while (count--)
+		*dest.as_u8++ = c;
+
+	return s;
+}
+EXPORT_SYMBOL(__memset);
+
+void *memset(void *s, int c, size_t count) __weak __alias(__memset);
+EXPORT_SYMBOL(memset);
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index 8b940ff04895..a31513346951 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD := y
 
-purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memset.o
+purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o
 purgatory-y += strcmp.o strlen.o strncmp.o riscv_string.o
 
 targets += $(purgatory-y)
@@ -16,9 +16,6 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
 $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
-	$(call if_changed_rule,as_o_S)
-
 $(obj)/strcmp.o: $(srctree)/arch/riscv/lib/strcmp.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
