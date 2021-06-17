Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4461BC49EA2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38C36112D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38C36112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K15zKmaKW4IQ1b0pKm8sJjWl26f0aZQsJXo5Wfi/6Gs=; b=DYBnNCAWGABdF2
	8LLYkfMH8W6pgzhBSLssN9dwM9qKapfgbAppAJjJeM6a1q17Iri6/O7YXMKCZx2rpclqjVeh57kYi
	SQf9QtRMDf1R8RrKtzR53vV10rJwyyDRwHjiWwbi58YNOQyF3DGYwo+GtO6d8NSYF++J9ipYI7rZX
	BYMM2nFqNHddrpiFRTsU7Bkzf+OMzHukm3RV5cx1guTU94Hm9jQSRYHAeTNHXIyEfk0HPGUABxIhE
	Ur5PygyVsWhWqjNfzQhOEYyBGxqgmUTumYH9CHkmeZUSkpWR1elcDlcs4PGz6JmnJP3e/WJWnHoje
	bFYgFIH5f+THTNxGmYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttwV-00AvOw-UN; Thu, 17 Jun 2021 15:28:31 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttwP-00AvLw-Q8
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 15:28:28 +0000
Received: by mail-ed1-f53.google.com with SMTP id b11so4595583edy.4
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 08:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dR71mgWuSrKuBRDcO+pO0oyyX07xDs1ZIGNvdSRJDyk=;
 b=c8FZqngclsLNChmzcZWJtf3L3bQeWXq6oPqLk5aVhtWfRBwhO1Wj/2MKUEZ9g6bGBY
 Q0txPKPdBip1M2wHQ78+ra9N7Idq6DQtWsXLP2WwcP3Lt5eICrBWT24Ri/h+zqPl3HoC
 GuhfSNwyutB6spDjg+zr+iLF/hvf8n6/DL6/5LcyIZ6w1RJabo+xsh4a1SgRxtAhg+wA
 ChGu1RwbjQ0EFGdaQ8Drlbd8tWccd6f8uMx63LVBqu32MjEmhRF/m8gteefFDhhJ0zok
 HRTl0EMcPxgVBEFMA+O/U6roe7/9mPH4DeHj1cTqqtRkkYJAIf9B2sMVKzCc/qq3RZQ0
 9q8Q==
X-Gm-Message-State: AOAM530w3k6O9cBUM/L0zhtFbEwQsWq3/IR5yvS9aUUqbjmQ+7/Yls4e
 n3b62pJ5MHyXf+Nzor7RsWdOzuemNougvg==
X-Google-Smtp-Source: ABdhPJyghzMD4UFbsUqxDry2kTArzJbHDeI7jbuZSaPtMZIbTcaErWBhhij5IvbkjeAL5cuz1NmHVg==
X-Received: by 2002:aa7:c547:: with SMTP id s7mr7137201edr.239.1623943703800; 
 Thu, 17 Jun 2021 08:28:23 -0700 (PDT)
Received: from msft-t490s.teknoraver.net
 (net-37-119-128-179.cust.vodafonedsl.it. [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id g11sm4497850edz.12.2021.06.17.08.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:28:23 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 3/3] riscv: optimized memset
Date: Thu, 17 Jun 2021 17:27:54 +0200
Message-Id: <20210617152754.17960-4-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617152754.17960-1-mcroce@linux.microsoft.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_082825_915201_6149433E 
X-CRM114-Status: GOOD (  20.71  )
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
---
 arch/riscv/include/asm/string.h |  10 +--
 arch/riscv/kernel/Makefile      |   1 -
 arch/riscv/kernel/riscv_ksyms.c |  13 ----
 arch/riscv/lib/Makefile         |   1 -
 arch/riscv/lib/memset.S         | 113 --------------------------------
 arch/riscv/lib/string.c         |  39 +++++++++++
 6 files changed, 42 insertions(+), 135 deletions(-)
 delete mode 100644 arch/riscv/kernel/riscv_ksyms.c
 delete mode 100644 arch/riscv/lib/memset.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 25d9b9078569..90500635035a 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -6,14 +6,10 @@
 #ifndef _ASM_RISCV_STRING_H
 #define _ASM_RISCV_STRING_H
 
-#include <linux/types.h>
-#include <linux/linkage.h>
-
-#define __HAVE_ARCH_MEMSET
-extern asmlinkage void *memset(void *, int, size_t);
-extern asmlinkage void *__memset(void *, int, size_t);
-
 #ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
+#define __HAVE_ARCH_MEMSET
+extern void *memset(void *s, int c, size_t count);
+extern void *__memset(void *s, int c, size_t count);
 #define __HAVE_ARCH_MEMCPY
 extern void *memcpy(void *dest, const void *src, size_t count);
 extern void *__memcpy(void *dest, const void *src, size_t count);
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index d3081e4d9600..e635ce1e5645 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -31,7 +31,6 @@ obj-y	+= syscall_table.o
 obj-y	+= sys_riscv.o
 obj-y	+= time.o
 obj-y	+= traps.o
-obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
deleted file mode 100644
index 361565c4db7e..000000000000
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2017 Zihao Yu
- */
-
-#include <linux/export.h>
-#include <linux/uaccess.h>
-
-/*
- * Assembly functions that may be used (directly or indirectly) by modules
- */
-EXPORT_SYMBOL(memset);
-EXPORT_SYMBOL(__memset);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 484f5ff7b508..e33263cc622a 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 lib-y			+= delay.o
-lib-y			+= memset.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE) += string.o
diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
deleted file mode 100644
index 34c5360c6705..000000000000
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
-ENTRY(__memset)
-WEAK(memset)
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
-END(__memset)
diff --git a/arch/riscv/lib/string.c b/arch/riscv/lib/string.c
index 9c7009d43c39..1fb4de351516 100644
--- a/arch/riscv/lib/string.c
+++ b/arch/riscv/lib/string.c
@@ -112,3 +112,42 @@ EXPORT_SYMBOL(__memmove);
 
 void *memmove(void *dest, const void *src, size_t count) __weak __alias(__memmove);
 EXPORT_SYMBOL(memmove);
+
+void *__memset(void *s, int c, size_t count)
+{
+	union types dest = { .u8 = s };
+
+	if (count >= MIN_THRESHOLD) {
+		const int bytes_long = BITS_PER_LONG / 8;
+		unsigned long cu = (unsigned long)c;
+
+		/* Compose an ulong with 'c' repeated 4/8 times */
+		cu |= cu << 8;
+		cu |= cu << 16;
+#if BITS_PER_LONG == 64
+		cu |= cu << 32;
+#endif
+
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+		/* Fill the buffer one byte at time until the destination
+		 * is aligned on a 32/64 bit boundary.
+		 */
+		for (; count && dest.uptr % bytes_long; count--)
+			*dest.u8++ = c;
+#endif
+
+		/* Copy using the largest size allowed */
+		for (; count >= bytes_long; count -= bytes_long)
+			*dest.ulong++ = cu;
+	}
+
+	/* copy the remainder */
+	while (count--)
+		*dest.u8++ = c;
+
+	return s;
+}
+EXPORT_SYMBOL(__memset);
+
+void *memset(void *s, int c, size_t count) __weak __alias(__memset);
+EXPORT_SYMBOL(memset);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
