Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5D4CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLBKv7nzSWEK08E4e+szGQwf30J9udOnD+Bc6IkXQAg=; b=kmTpp+zWnaIjep
	02+SAk6gbc897UJoYomlrLBGKEO6yLBtL5VOCwJb0g+4U8Dp+1IFLAzoGM1usmF2UtMf4zB0U83kQ
	94xNxo1fdht0YCid+axuEup+21kGLkDkSJP9jimL0ZXA57m1osqO9l3OYyCmSPz3F72O1mEoHFvdH
	AyV0N7iOPUXHPbFf8cZWcexeR7C8+hhyH44FrZkhBH3JUWe8Xn+HwvRqJnxHs4587FOE07Oq/+F/9
	I72D0Sg14J6cscTjMQSV2N7WkKvSizP3Ox1m1m8vCGVG0RVNapt0rUeOsHbTUAuBkI4K5zr60D8Qn
	AvqbXWAIUYcUK/2tZFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgDa-00000004aTm-0Ooa;
	Wed, 20 May 2026 12:40:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgDW-00000004aSN-48Fs
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 12:40:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso4070177f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779280805; x=1779885605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vz7ySB1n7hiRbxQUx3+c5jByhWmQvmCG7QHugS1JFY=;
        b=OQNo3SszCmiqaKVSzqh6PoERC7tuq8gE7xvaVMcXHvYbjgkgX/LQd/LIsvpuOxiZXl
         kgTNVDc/NNOkD0mRGgRrGwWW9v2lAzFo1P5cJbos6LHEBVFe7x3Z9Ev5wJIJkQo33D5R
         TQ10GgwMK2T7qDJpItT/y1ZMAIxCJjXEeI+D2HMleO8A/6wIQqKv9c2yj4Rx9EXbQRtx
         ErZqaOspdFA4xFkwHc7NqTAiZLZbPilBYHfD+co4i5eTgj5i37xvKzS+6EfZezDpE1/C
         roG3C3cDH1micOWuyD3EkEpZWm5AJcc9wEQ+lKc1y31cnPiVqbkaQhY2QIeKLi6JfOSK
         4lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280805; x=1779885605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0vz7ySB1n7hiRbxQUx3+c5jByhWmQvmCG7QHugS1JFY=;
        b=ExVZKszec4Hqpw3H8AVYznutNQ9R5WXvX+N/030xOb6HjCIRyEafj6tAEZ1jt4jWyJ
         w26DfPwX8wuXOVrilUhNYYvipDCFsT9nQQVkbRd6NkacMWxcmKPfokBPUSbSbl1IDLC4
         ccf3hG6f12edcjLcJYCNqnO4bbnHZwp5KgSaBulYNxidelu8WQt6p+i5yf/jE8/OAG71
         3d5RJeMAj1d8HUFemR/zDvT2UKNxww4Rz1adyf4n7SIgL6mdsXyIq6C3WpTj0zrq4QRc
         4SoyLpR0d5ivmYOiz6hJPV6JmjNAAk2N8MMBKcrxyKaCE5jHAVGp0TirU79ZEoRuq2oT
         M1tA==
X-Forwarded-Encrypted: i=1; AFNElJ8kmFRbQuaZQW4Ve5j8SsMWDbyAMnTmC7HOY84qMDaF0cEbpp1/mcPAwDh5t4OAh4f2uQXkzRMIzZxzMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSlnwlVnL8X2KdHlhF056L4tHAi0MtsjwSGD2giwl1FF/7k5om
	BNfS2z/YTggLzxSck8M6+KSA/DCeufsXE4gC7N5jKNytnBqxti0qDJO2
X-Gm-Gg: Acq92OGUE/62fpSPO3uJxxE8iUGsg39OwhkOOMu2FQoEhcUioONjQFUluPCqnMFibEG
	ZsXScDVih97xGdJtuyfdRtKFePrfqrLKaOmyqp660mO0dRNHAo0+ph9qgI9885IgqXRtkIBaq2p
	6HChTFbqL3Xy13w/bNQ2YCfha+Xjt6c79Y0PKAaM1jBJgKdEIQ5moFPUWEPOORF0lWabam2PFF7
	Q63lJv2NYraz4i1mJHPCqCRwe1z7L3AinJCq/uUWQyu2OTeQKVjoQr+ln7LWsTwNo890KyR09d6
	digxqGjVNfHvH63D0SlYyz/KsPN65QUKRc8lsf7qK/qvMeKOOMeKUjd9JwL0vfH5SQ4bE04W3dW
	S2ZkrYc6D6lAO2TKGLTWfaHV2bf3gkU2nU9N55ZZwj2dPwJTjU817tYayJkNIUMmxjYbxSRMV8t
	s0YwULYE3eEhsADY7qmdMEglXK4PwFNo2ilWws+P36wQ==
X-Received: by 2002:a05:6000:1a8e:b0:43e:a70d:7622 with SMTP id ffacd0b85a97d-45e5c58d96amr36524506f8f.22.1779280804903;
        Wed, 20 May 2026 05:40:04 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([89.216.37.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3acf7sm54460252f8f.12.2026.05.20.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:40:04 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kees@kernel.org
Cc: alex@ghiti.fr,
	andy@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v6 1/2] riscv: lib: add memcmp() implementation
Date: Wed, 20 May 2026 14:39:53 +0200
Message-ID: <20260520123954.379630-2-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520123954.379630-1-milant2002@gmail.com>
References: <20260520123954.379630-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_054007_065707_6C753DB7 
X-CRM114-Status: GOOD (  17.39  )
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

From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Add an assembly implementation of memcmp() for RISC-V. The implementation
uses word-aligned loads for the generic path and the ZBB extension for
optimized sign resolution, with an assembly fallback for non-ZBB systems.

Benchmark results (QEMU TCG, rv64):

 Len   | Default |NoALIGN | ALIGN  | %NoALIGN | %ALIGN
 ------|---------|--------|--------|----------|--------
 1 B   | 20.3    | 21.5   | 20.9   | +5.9%    | +3.0%
 7 B   | 88.9    | 96.9   | 155.7  | +9.0%    | +75.1%
 8 B   | 89.6    | 110.5  | 176.2  | +23.3%   | +96.7%
 16 B  | 134.4   | 172.8  | 334.8  | +28.6%   | +149.1%
 31 B  | 163.5   | 211.9  | 606.2  | +29.6%   | +270.8%
 64 B  | 203.8   | 240.3  | 968.6  | +17.9%   | +375.3%
 127 B | 224.6   | 269.0  | 1362.8 | +19.8%   | +506.8%
 512 B | 235.7   | 269.9  | 1913.7 | +14.5%   | +711.9%
 1024 B| 256.8   | 283.5  | 2123.6 | +10.4%   | +726.9%
 4096 B| 263.8   | 299.7  | 2290.4 | +13.6%   | +768.2%

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
v6 changes:
    - Fixed build errors kernel test robot noticed. 
    - Link to v5: https://lore.kernel.org/all/20260519140029.1190381-1-milant2002@gmail.com/
    
v5 changes:
    - Optimized generic memcmp path with word-aligned loads.
    - Implemented non-ZBB fallback to byte comparison per review.
    - Link to v4: https://lore.kernel.org/all/20260518131407.1026049-2-milant2002@gmail.com/

v2 changes:
    - Added alignment checks for buffers to avoid expensive misaligned loads.
    - Optimized the loop using end-pointers to reduce per-iteration overhead.
    - Implemented word-aligned tail handling using ZBB shifts.
    - Removed redundant pointer equality (a0 == a1) check.
    - Retained BE support via #ifndef; ZBB rev8 is used for the LE fast-path.
    - Link to v1: https://lore.kernel.org/all/20260512141007.1193033-1-milant2002@gmail.com/

 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 107 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 4 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 764ffe8f6..5c5299678 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,6 +18,8 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
+#define __HAVE_ARCH_MEMCMP
+extern asmlinkage int memcmp(const void *, const void *, size_t);
 
 #if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 6f767b2a3..b529e1be1 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,7 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+lib-y			+= memcmp.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
new file mode 100644
index 000000000..bdb92941d
--- /dev/null
+++ b/arch/riscv/lib/memcmp.S
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+.option push
+.option arch,+zbb
+#endif
+
+/* int memcmp(const void *cs, const void *ct, size_t n) */
+SYM_FUNC_START(memcmp)
+/*
+ * Parameters
+ *	a0 - Pointer to first memory block (cs), also return value
+ *	a1 - Pointer to second memory block (ct)
+ *	a2 - Number of bytes to compare (n), decremented during loop
+ *
+ * Returns
+ *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
+ *
+ * Clobbers
+ *	t0, t1, t2, t3, t4
+ */
+	add	t3, a0, a2
+	or	t0, a0, a1
+	andi	t0, t0, (SZREG - 1)
+	bnez	t0, 5f
+
+	addi	t4, t3, -SZREG
+	bltu	t4, a0, 7f
+
+1:
+	REG_L	t1, 0(a0)
+	REG_L	t2, 0(a1)
+	bne	t1, t2, 2f
+	addi	a0, a0, SZREG
+	addi	a1, a1, SZREG
+	bleu	a0, t4, 1b
+
+7:
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+	__ALTERNATIVE_CFG("j 5f", "nop", 0, RISCV_ISA_EXT_ZBB,
+			  IS_ENABLED(CONFIG_RISCV_ISA_ZBB))
+
+	beq	a0, t3, 4f
+	REG_L	t1, 0(a0)
+	REG_L	t2, 0(a1)
+
+	sub	t0, t3, a0
+	li	t4, SZREG
+	sub	t0, t4, t0
+	slli	t0, t0, 3
+
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t1, t1
+	rev8	t2, t2
+#endif
+	srl	t1, t1, t0
+	srl	t2, t2, t0
+
+	bne	t1, t2, 8f
+	li	a0, 0
+	ret
+#else
+	j	5f
+#endif
+5:
+	beq	a0, t3, 4f
+6:
+	lbu	t1, 0(a0)
+	lbu	t2, 0(a1)
+	bne	t1, t2, 3f
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	bne	a0, t3, 6b
+
+4:	li	a0, 0
+	ret
+2:
+#if !defined(CONFIG_CPU_BIG_ENDIAN) && \
+	defined(CONFIG_TOOLCHAIN_HAS_ZBB) && defined(CONFIG_RISCV_ISA_ZBB)
+	__ALTERNATIVE_CFG("j 5b", "nop", 0, RISCV_ISA_EXT_ZBB, IS_ENABLED(CONFIG_RISCV_ISA_ZBB))
+	rev8	t1, t1
+	rev8	t2, t2
+#elif !defined(CONFIG_CPU_BIG_ENDIAN)
+	j	5b
+#endif
+8:
+	sltu	a0, t2, t1
+	sltu	t0, t1, t2
+	sub	a0, a0, t0
+	ret
+
+3:
+	sub	a0, t1, t2
+	ret
+
+SYM_FUNC_END(memcmp)
+SYM_FUNC_ALIAS(__pi_memcmp, memcmp)
+EXPORT_SYMBOL(memcmp)
+
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+.option pop
+#endif
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index b0358a78f..456929971 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o memcmp.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 purgatory-y += strcmp.o strlen.o strncmp.o strnlen.o strchr.o strrchr.o
 endif
@@ -41,6 +41,9 @@ $(obj)/strchr.o: $(srctree)/arch/riscv/lib/strchr.S FORCE
 $(obj)/strrchr.o: $(srctree)/arch/riscv/lib/strrchr.S FORCE
 	$(call if_changed_rule,as_o_S)
 
+$(obj)/memcmp.o: $(srctree)/arch/riscv/lib/memcmp.S FORCE
+	$(call if_changed_rule,as_o_S)
+
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
 CFLAGS_string.o := -D__DISABLE_EXPORTS
 CFLAGS_ctype.o := -D__DISABLE_EXPORTS
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
