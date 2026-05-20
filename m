Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DCCD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfxiiKQDbUkSnmcE/WVHPKaiYNn6nCHlnnAxCxxUGkw=; b=OdKwl/dbb4QBR7
	UBxFxKKO2IlpFrxSYe3OpGV6pGqq75eQ8qIfzzFtb8LyL+ey5qzdzrvCjzCu2atCcI7BEn3G/lcix
	GmiHwOzUtZ6pw38SrBBx7/F2mT4Y0jg28uQFvu342yNNm7Ehxgi7oDnLEYyejwKK02w1Je+mtUU6C
	QW3hWcGISWbnsE5dozBQNdLKXIDDKhHAxP6+yh0noWe31cOBoNArs4563eqcAEQHnkAcVx1/YiGg9
	KFw2OxnY39a5ai0tWrFPORCDzGXjjVLioNqo/HRjHbhyCc4puj2BlmuLLM1nbdaxxGN7V9qQQBro5
	8eY2YYIzknY/Zl6l9sWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjHL-000000054zI-0nJI;
	Wed, 20 May 2026 15:56:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjHH-000000054xB-0DVN
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 15:56:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48896199cbaso40135955e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292569; x=1779897369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBpbLd/H5G6gmbkig9FYBk9kTUwsFZEKMdkIA0bLw8E=;
        b=lFrJmI691PCB4JuCA7agI19tx1/9LPziNWXYPnipSpa6yfg0RIfMZ3m5yFUxZCUFJB
         cFLsn7VJClf7gKik/OIcW1wqNohLPvzvOjzqw6pvGof2TJTjvBkmTIbWBqDO4S9g+NRV
         xio0Xbv75RFizy3G0hgbT85YKW6nD+bAWjcI6Es+a2UqUAAu8BwQ6SnJVtkvn8QtgqGW
         hPMGKyoP8snN4T3FUUcT7VCQxMco8aX0UVbSMRsyPX4TBaD3/syIIDF3W6Q4/4SZnKuS
         UeKZ6uiMA2dlgIMrvzds+BjkMWmuUiRMCsLYFUD1b5VGTNFrk0PklS2O6HBRMbRQ70m/
         +jPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292569; x=1779897369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mBpbLd/H5G6gmbkig9FYBk9kTUwsFZEKMdkIA0bLw8E=;
        b=fP9TrRBam2RIY7Lrkej0ZoTkflre49xWMltzYmfSb8F97aV5IfEt97ytOORI1UzeRN
         CeRtAqM2K8vnNWu82dvkbH/OK3tDVDEAk0UKSwKjcvSG1CO8FCaBiQCNJwgwBxzWpc97
         AhkUvovsnoRadoGsO60+9c4Kkz5fpWueztIiEWH0n51kkB7b8vA+41tGRbS4fCSswdvf
         qP2l9ma4UAxsXPCm8zu6jgqTYU+ioWU5sCHzZ2y92KNq5OvSAS5ezrFQou0U94nS2eyZ
         gjEhMeS/gbLLqEsPP20xiAToF10Nm//BdsFU9pLbunrWw+8DA5cWO6bwO+D8RxsRplNk
         opKw==
X-Forwarded-Encrypted: i=1; AFNElJ8xhMVonaTTGmbupq8vBIwuBegu/E9qCnxsHsJ2T3NIddCYtkCsHG4Rkwyq3NZO8eG9nyBuHYw7KgNlew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyChbK6gtDovPTIMz7JRjEw6v46DPXymodC4DmaMhWju2SRyPXJ
	nmUjEYEqJ8W01q1RZrE/wrwEFb+cwskmouTbgj1FC+wQG/2+NqdJedHt
X-Gm-Gg: Acq92OHcFY6FfRkmmt3hohO0UahQ6iMP66rllzklvryJgDdC9QXAtxE0xB1nnDEMGNr
	f5mi+bFZf3JDeRNxE1RvcUKAnb5M5ImDlO/mBhCUaL097ETC1Lq76ypmzcX/gtRXmbRW6oDBLv6
	HpeVNG09OtOLosez9KLIrZwYjYMi/uuq7SZ7035kH5IPU/7pTFKE/eXwB/lbM+QH+bwvUFWc8tB
	/jb7cU9Ef4wg8G4jKPotWpn2wZCMogzpZcicXvlhIemoqLEqM03qSoYKE0kjBkQuNtaet6OvDHw
	xNu1Oq9NG9WrwcrnmANkCH97DPpyaTWfpKkb8uGbylyFNd15MI6d4smGh88UxXFr210+/rl/gYv
	A3cq3QA6KQWCYGD7+jnEtBuJpFU9oLz//WpLBkou/j9tBcfVJMDBnKWhjlwvurpjVe3puQsrAXp
	jQ5i3nakdz+owIVaU6eZp0SFFhwj8kPrmHVfzA/4S51qTmEiALetaI
X-Received: by 2002:a05:600c:491e:b0:48e:978f:c45a with SMTP id 5b1f17b1804b1-48fed455991mr235621165e9.19.1779292568861;
        Wed, 20 May 2026 08:56:08 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([89.216.37.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab290e1sm215565025e9.2.2026.05.20.08.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:56:08 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <kees@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Shevchenko <andy@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH 1/2] riscv: lib: add memchr() implementation
Date: Wed, 20 May 2026 17:55:30 +0200
Message-ID: <20260520155532.1139471-2-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520155532.1139471-1-milant2002@gmail.com>
References: <20260520155532.1139471-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085611_121018_18D6A8AF 
X-CRM114-Status: GOOD (  16.13  )
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

This implementation leverages word-at-a-time comparisons and the RISC-V
Zbb extension to accelerate character searching, falling back to a
generic byte-by-byte loop on systems without Zbb support.

Benchmark results (QEMU TCG, rv64):

| len  | zbb    | Wozbb | default | % Wozbb |  % zbb  |
|------|--------|-------|---------|---------|---------|
| 1    | 22.9   | 26    | 22.1    | 17.64 % |  3.62  %|
| 7    | 115.5  | 130.6 | 100.1   | 30.46 % | 15.38  %|
| 8    | 184.3  | 143.3 | 117.2   | 22.26 % | 57.25  %|
| 16   | 322    | 205.1 | 179.7   | 14.13 % | 79.19  %|
| 31   | 361    | 247.4 | 221.7   | 11.59 % | 62.83  %|
| 64   | 880    | 280.6 | 233.2   | 20.32 % | 277.35 %|
| 127  | 961.3  | 307.9 | 271.4   | 13.44 % | 254.20 %|
| 512  | 1812.9 | 325.6 | 294.1   | 10.71 % | 516.42 %|
| 1024 | 1973.2 | 335.4 | 273.8   | 22.49 % | 620.67 %|
| 3173 | 2245.9 | 338.7 | 288.6   | 17.35 % | 678.20 %|
| 4096 | 2327.5 | 345   | 317.5   | 8.661 % | 633.07 %|

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
 arch/riscv/include/asm/string.h |   3 +-
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memchr.S         | 126 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 4 files changed, 133 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/lib/memchr.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 764ffe8f6479..cfcf1193b446 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,7 +18,8 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
-
+#define __HAVE_ARCH_MEMCHR
+extern asmlinkage void *memchr(const void *s, int c, size_t n);
 #if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
 extern asmlinkage int strcmp(const char *cs, const char *ct);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 6f767b2a349d..bbc54dabbb81 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,7 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+lib-y			+= memchr.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
diff --git a/arch/riscv/lib/memchr.S b/arch/riscv/lib/memchr.S
new file mode 100644
index 000000000000..0e971cf51410
--- /dev/null
+++ b/arch/riscv/lib/memchr.S
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+/*  void *memchr(const void *s, int c, size_t n) */
+SYM_FUNC_START(memchr)
+
+	__ALTERNATIVE_CFG("nop", "j memchr_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
+/*
+ *
+ * Parameters
+ *	a0 - Pointer to memory area (s), also return value
+ *	a1 - Character to search for (c)
+ *	a2 - Number of bytes to search (n)
+ *
+ * Returns
+ *	a0 - Pointer to the matched character, or NULL (0) if not found
+ *
+ * Clobbers
+ *	t0, t1
+ */
+	beqz	a2, 3f
+	andi	a1, a1, 0xff
+	add	t1, a0, a2
+
+1:
+	lbu	t0, 0(a0)
+	beq	t0, a1, 4f
+	addi	a0, a0, 1
+	bne	a0, t1, 1b
+
+3:
+	li	a0, 0
+4:
+	ret
+
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+.balign 4
+memchr_zbb:
+.option push
+.option arch, +zbb
+/*
+ * Parameters
+ *	a0 - Pointer to memory area (s), also return value
+ *	a1 - Character to search for (c)
+ *	a2 - Number of bytes to search (n)
+ *
+ * Returns
+ *	a0 - Pointer to the matched character, or NULL (0) if not found
+ *
+ * Clobbers
+ *	t0, t1, t2, t3, t4, t5, t6
+ */
+	beqz	a2, 3b
+	add	t6, a0, a2
+	andi	t3, a1, 0xff
+
+	li	t0, SZREG
+	bltu	a2, t0, 8f
+
+#if __riscv_xlen == 64
+	li	t0, 0x0101010101010101
+#else
+	li	t0, 0x01010101
+#endif
+	mul	a1, t3, t0
+
+	andi	t1, a0, SZREG - 1
+	beqz	t1, 5f
+
+1:
+	lbu	t2, 0(a0)
+	beq	t2, t3, 4b
+	addi	a0, a0, 1
+	andi	t1, a0, SZREG - 1
+	bnez	t1, 1b
+
+5:
+	sub	t5, t6, a0
+	andi	t5, t5, -SZREG
+	add	t5, a0, t5
+
+	li	t4, -1
+
+	beq	a0, t5, 8f
+
+6:
+	REG_L	t0, 0(a0)
+	xor	t1, t0, a1
+	orc.b	t1, t1
+	bne	t1, t4, 7f
+	addi	a0, a0, SZREG
+	bltu	a0, t5, 6b
+
+8:
+	beq	a0, t6, 3b
+
+2:
+	lbu	t0, 0(a0)
+	beq	t0, t3, 4b
+	addi	a0, a0, 1
+	bltu	a0, t6, 2b
+
+	j	3b
+
+7:
+	not	t1, t1
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	ctz	t1, t1
+#else
+	clz	t1, t1
+#endif
+	srli	t1, t1, 3
+	add	a0, a0, t1
+	ret
+
+.option pop
+#endif
+
+SYM_FUNC_END(memchr)
+SYM_FUNC_ALIAS(__pi_memchr, memchr)
+EXPORT_SYMBOL(memchr)
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index b0358a78f11a..42e840fad6df 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o memchr.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 purgatory-y += strcmp.o strlen.o strncmp.o strnlen.o strchr.o strrchr.o
 endif
@@ -17,6 +17,9 @@ $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 $(obj)/memcpy.o: $(srctree)/arch/riscv/lib/memcpy.S FORCE
 	$(call if_changed_rule,as_o_S)
 
+$(obj)/memchr.o: $(srctree)/arch/riscv/lib/memchr.S FORCE
+	$(call if_changed_rule,as_o_S)
+
 $(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
