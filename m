Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E42C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BjZ19wAyhb8/Cd13w4QBcce8tt/Ckg6x9wX7G+F76o=; b=iinQQoS3Zc+1eG
	eHuyhwHfZ5jtj7/sbekM62nTcq0kNK8/4I2SuH7NrSuL+fMgK8fL4ps/5MubBnPzNnK37Nn2TaR9B
	QyNUTT+z/38h5MCH4IH/Sq0T2PuGJ4VjNrK8pBbqbHDxERBmblgX/QfB0Y4h8UJtlTPs/Yo0bn7DO
	c6rlI+P+grHfbF+YhBN/tZTrNJ3ol8Dyzap0jnpFJP2ESwHB+bVHHjXPnjhtreFcKDrDQIt+HRmQ+
	K2eNvAgGRAyD4YrgSt0HZoFSnOzFpNKZ5pAjcsIpQln1o2NmShHVLTdIho4sjTtelXy3dOQHdGDXy
	+2EpsmC1AX3IOvj9dwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuvj-0007VX-05;
	Thu, 11 Jan 2024 13:17:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuvf-0007UW-0h
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 13:17:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6d9bd63ec7fso3168814b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 05:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704979022; x=1705583822; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vbaTI98W0xHwfUJsIhKc7Tspxr6OadoC1OOG5n/NnEc=;
        b=bcHFje9U6P3zLEuvzdnfQE1A5L4lCi7/9NaSF+59SmVKdp85PsrSOpd2HDAp8ZHE0n
         ySNOfNwSI/s5hqOv9aqfLIzt5+z2J3DeFFtl+zB10N1m9HW6Rkhwv7Un/RKy3g+j0SN0
         UefgLjPIDQYQvj4qHl+rT6zbK7d+TxdZq30kPa5Z/eCCtaoiDy0RZnff7ATUadLUs4qG
         finCHM1HxjtvszYhBRBiI84XULu517D1vOA2MOmaNkAHQAzXmtwGg6tDjGSVfzojcLpX
         USbFDkGxhXvI5UUUjT1UK8BInGHturMW8A3oMu6klFUR1I+XgCIwTUfo1d3JZObQUKSo
         AU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704979022; x=1705583822;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbaTI98W0xHwfUJsIhKc7Tspxr6OadoC1OOG5n/NnEc=;
        b=k/1WoWiTPBOIcxlBG5LTiEOZ7lQcjBN//Iu5dQWF5r1LTvKc5Jqrm+JGh5CCNF0Lgv
         rHpMwP/KeN5jxEi9GiRN1+IVcAwQsGxyR74Hs2dC9CSVIxZ12MWE199Vi2rvYPB78Qe8
         e/3M3knoouGoEb77MCMMa3B4ZTFGQkE9gXDKh4Y/RlQ5XJQy9C77zC6DR2499FLseeA4
         wII3GdqeaCjT4INmZVdMxt0KWSN2hqJGAgA6EKvBHiMntMfXnxLV2/rF+1dBNg7Soota
         8VSj4YkrRKn6gkGf0+xjQ3U5i1lrAFPzTTiR+NF/FPSeNJtnvmwBqP03qg+hK6xyHQ+A
         NO0g==
X-Gm-Message-State: AOJu0YzcXUc1m1MWU78RooiZqOW7feGSI++IPawBlOWfqjL194VMBSzL
	+su6H2fyfVamZDm48vzj/YpGMrwwWRYoc8puH0ND1dnYSGSKp6E2Nf8pCstZ4gFBoOPrw7PMaQP
	iCrJmDOW73FSfGxaWOoRgH3jTHToPVBbwc8syzPUy8oirbk8mAD4BqoFvQgjDZRrEMQnQrYRpSG
	Lk7x7P1uyPzOOZ9Ezgs2/Q
X-Google-Smtp-Source: AGHT+IFmu1Hds0FY7VYTTQ0dIQZZmXk7PqYBh9kXsMOLDS/EbArhbTQtk6zyjTbjA57fNaVHPUq4AQ==
X-Received: by 2002:a05:6a00:728:b0:6d9:bea1:9fcf with SMTP id 8-20020a056a00072800b006d9bea19fcfmr995618pfm.18.1704979021903;
        Thu, 11 Jan 2024 05:17:01 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id ei30-20020a056a0080de00b006d9a6a9992dsm1103202pfb.123.2024.01.11.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:17:01 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [v10, 05/10] riscv: lib: vectorize copy_to_user/copy_from_user
Date: Thu, 11 Jan 2024 13:15:53 +0000
Message-Id: <20240111131558.31211-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111131558.31211-1-andy.chiu@sifive.com>
References: <20240111131558.31211-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_051703_254169_C6C97826 
X-CRM114-Status: GOOD (  22.98  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch utilizes Vector to perform copy_to_user/copy_from_user. If
Vector is available and the size of copy is large enough for Vector to
perform better than scalar, then direct the kernel to do Vector copies
for userspace. Though the best programming practice for users is to
reduce the copy, this provides a faster variant when copies are
inevitable.

The optimal size for using Vector, copy_to_user_thres, is only a
heuristic for now. We can add DT parsing if people feel the need of
customizing it.

The exception fixup code of the __asm_vector_usercopy must fallback to
the scalar one because accessing user pages might fault, and must be
sleepable. Current kernel-mode Vector does not allow tasks to be
preemptible, so we must disactivate Vector and perform a scalar fallback
in such case.

The original implementation of Vector operations comes from
https://github.com/sifive/sifive-libc, which we agree to contribute to
Linux kernel.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v10:
 - remove duplicated code (Charlie)
Changelog v8:
 - fix no-mmu build
Changelog v6:
 - Add a kconfig entry to configure threshold values (Charlie)
 - Refine assembly code (Charlie)
Changelog v4:
 - new patch since v4
---
 arch/riscv/Kconfig                      |  8 +++++
 arch/riscv/include/asm/asm-prototypes.h |  4 +++
 arch/riscv/lib/Makefile                 |  6 +++-
 arch/riscv/lib/riscv_v_helpers.c        | 44 +++++++++++++++++++++++++
 arch/riscv/lib/uaccess.S                | 10 ++++++
 arch/riscv/lib/uaccess_vector.S         | 44 +++++++++++++++++++++++++
 6 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5e12582f66d4..1793329ce893 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -526,6 +526,14 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_V_UCOPY_THRESHOLD
+	int "Threshold size for vectorized user copies"
+	depends on RISCV_ISA_V
+	default 768
+	help
+	  Prefer using vectorized copy_to_user()/copy_from_user() when the
+	  workload size exceeds this value.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 6db1a9bbff4c..be438932f321 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -11,6 +11,10 @@ long long __ashlti3(long long a, int b);
 
 #ifdef CONFIG_RISCV_ISA_V
 
+#ifdef CONFIG_MMU
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n);
+#endif /* CONFIG_MMU  */
+
 void xor_regs_2_(unsigned long bytes, unsigned long *__restrict p1,
 		 const unsigned long *__restrict p2);
 void xor_regs_3_(unsigned long bytes, unsigned long *__restrict p1,
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 494f9cd1a00c..c8a6787d5827 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -6,9 +6,13 @@ lib-y			+= memmove.o
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
 lib-y			+= strncmp.o
-lib-$(CONFIG_MMU)	+= uaccess.o
+ifeq ($(CONFIG_MMU), y)
+lib-y				+= uaccess.o
+lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
+endif
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
+lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
new file mode 100644
index 000000000000..6cac8f4e69e9
--- /dev/null
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+#include <asm/vector.h>
+#include <asm/simd.h>
+
+#ifdef CONFIG_MMU
+#include <asm/asm-prototypes.h>
+#endif
+
+#ifdef CONFIG_MMU
+size_t riscv_v_usercopy_threshold = CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD;
+int __asm_vector_usercopy(void *dst, void *src, size_t n);
+int fallback_scalar_usercopy(void *dst, void *src, size_t n);
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
+{
+	size_t remain, copied;
+
+	/* skip has_vector() check because it has been done by the asm  */
+	if (!may_use_simd())
+		goto fallback;
+
+	kernel_vector_begin();
+	remain = __asm_vector_usercopy(dst, src, n);
+	kernel_vector_end();
+
+	if (remain) {
+		copied = n - remain;
+		dst += copied;
+		src += copied;
+		goto fallback;
+	}
+
+	return remain;
+
+fallback:
+	return fallback_scalar_usercopy(dst, src, n);
+}
+#endif
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 3ab438f30d13..a1e4a3c42925 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -3,6 +3,8 @@
 #include <asm/asm.h>
 #include <asm/asm-extable.h>
 #include <asm/csr.h>
+#include <asm/hwcap.h>
+#include <asm/alternative-macros.h>
 
 	.macro fixup op reg addr lbl
 100:
@@ -11,6 +13,13 @@
 	.endm
 
 SYM_FUNC_START(__asm_copy_to_user)
+#ifdef CONFIG_RISCV_ISA_V
+	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	REG_L	t0, riscv_v_usercopy_threshold
+	bltu	a2, t0, fallback_scalar_usercopy
+	tail enter_vector_usercopy
+#endif
+SYM_FUNC_START(fallback_scalar_usercopy)
 
 	/* Enable access to user memory */
 	li t6, SR_SUM
@@ -181,6 +190,7 @@ SYM_FUNC_START(__asm_copy_to_user)
 	sub a0, t5, a0
 	ret
 SYM_FUNC_END(__asm_copy_to_user)
+SYM_FUNC_END(fallback_scalar_usercopy)
 EXPORT_SYMBOL(__asm_copy_to_user)
 SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
 EXPORT_SYMBOL(__asm_copy_from_user)
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
new file mode 100644
index 000000000000..566739f6331a
--- /dev/null
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm-generic/export.h>
+#include <asm/asm.h>
+#include <asm/asm-extable.h>
+#include <asm/csr.h>
+
+#define pDst a0
+#define pSrc a1
+#define iNum a2
+
+#define iVL a3
+
+#define ELEM_LMUL_SETTING m8
+#define vData v0
+
+	.macro fixup op reg addr lbl
+100:
+	\op \reg, \addr
+	_asm_extable	100b, \lbl
+	.endm
+
+SYM_FUNC_START(__asm_vector_usercopy)
+	/* Enable access to user memory */
+	li t6, SR_SUM
+	csrs CSR_STATUS, t6
+
+loop:
+	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+	fixup vle8.v vData, (pSrc), 10f
+	fixup vse8.v vData, (pDst), 10f
+	sub iNum, iNum, iVL
+	add pSrc, pSrc, iVL
+	add pDst, pDst, iVL
+	bnez iNum, loop
+
+	/* Exception fixup code. It's the same as normal exit */
+10:
+	/* Disable access to user memory */
+	csrc	CSR_STATUS, t6
+	mv	a0, iNum
+	ret
+SYM_FUNC_END(__asm_vector_usercopy)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
