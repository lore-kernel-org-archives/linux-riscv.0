Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFD1C47DA2
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLeVK/4uFHP8gtCAbJiPXzwAo93z9UnWw6Bcs0rNUO0=; b=w8Q/RdQXxYYxYI
	kQZq2pYLDwkIFtIYGqKOsxByw3FIOzqEd4NcAGfi+J+0C4kgZc5U0JcCapKYb+/4HzQN2MoQShxON
	XDVhfRXsUjyqmXPipzduPb/9KCcNDlXY6f5GIT957UgCyItrMtHGcrutr08NZBcuQyS08MuA803/O
	UJBM52JU7aWpAg6TYkEh/DEAG/VKEfRkkX4RvHC4WInyGiA3VE07X+dPkTqXw+9CpAEDacQP2P4SR
	1mnKZxNSDJgUVCfeQGMHDX0Mdyqc5SJee858BQhsp84RRgXnzgtS93QnTXRVIFFL4tTxZ4vAQC8Re
	LbifD1O0oEMUGopliZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHBl-0083D0-2a;
	Mon, 15 Jan 2024 07:15:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1W-007qQb-2K
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Jan 2024 06:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=me9oOiGn5mHkoxh/0N14oRpKAMxeZVEEihh11oDsIlM=; b=EJ30F0B/2YvgwExu2n5xhHdnCb
	xE0lhiHV7NqbzNzQGaMfzocvvCXQKNfRxybBBlORuu6x6PYoQTs+Kuaj5sQW1iyt/xdfgs1X7ZymA
	EI2h5PEC1HW/OxlhbKf0LvCAyFMGrqVJknJSK2Ru6no2xgij8I9cJvG9l/+Ihf5p41mD+OFK0bfP0
	KS9R2ISRMDuOnC/ZeAVg+lDIZa6Gl99xZ7SoXGEKXl1iCJ92oLBkQ9p1VZhWs+DFQWOSqVSYLpcLt
	6reQDdUNN7HFp5VyvA1edNPFpjo81IJBWEdBqJNyi1ts/jZguEc8e1gq5c+XD2DOb2nOY7Dy2XnPz
	yqAxZBmw==;
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1S-00D1eA-1W
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 06:00:37 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3606f3f2f37so47248485ab.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 22:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705298431; x=1705903231; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=me9oOiGn5mHkoxh/0N14oRpKAMxeZVEEihh11oDsIlM=;
        b=b7hlXfogac3PszZH5PdV/nNyYeStR5ocE+cGs+LhDOXrVeLJn60Tcols/+TaladE1E
         tXoqXO9m+yauDu3xbpePJBvFhD4jwpAUJFYqv8iTH6/f9Wz8+ngGgcCn/U+t7BsZUmWw
         hyI5P/K92bM54Ah5u34DPkKGbEKFvPk6/oIwKycz5r8sctBDmZxt7rCIrhqWHAHrHQ/Q
         ZoSUSIII+O6IUhO1/l0X87066L6xgjE6n42A6Mj0Xfd3NXpsddPIcsS1bRVgHHWhseyc
         9Zvvn8HXiDW/GR5RExHSFLe7LPrLYnjU96icuUhhXUN7ZKg/R8GoEgPUor1se3KJL49l
         KNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705298431; x=1705903231;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=me9oOiGn5mHkoxh/0N14oRpKAMxeZVEEihh11oDsIlM=;
        b=NLB0aiPj3vaQAI0tJVLPcxqJNYkrNe7UXkMCvFYxpmj+OjQp9n653evgjAxP2uLuAl
         kNUdxC+o1LdHK+vjKq40YBb51d5OwPUP4I09jjwOEY/ncKHU6RCapEoYPtHueUH6G+Bb
         gZGiK2m2Pegufengsya6thtg5LCKUx1lAq4j5lF3WFus4zE8pFIe0FYKFjshLWU2ojeR
         iZaAMxxGCFAh3wVLPvriwTXU1EWotoyQlS39J73B0JKrpGQhtw6T5uWB/XLYCTN86+7S
         Uuqn1OgLpBiNWAhy2p1qGLxOijkNVpEvXlDipkdoJ3+Pq/UQCk/z49Tbcp5ndz3zW5yZ
         Vm8Q==
X-Gm-Message-State: AOJu0Yx4fDZxcbCV6d9TFF4NSerWMT47AC9eg1rpn8R/rREYUVt0nbiy
	I8JkpnBYtlPiE3jrk6+YoEd/obkas82T832L9iRSO5qjuNX81/e+uP4HeO0J4E21MxqhSPxmNjz
	yZQAyboQ5kofi4OtdsNRUZFEnqJPIJOZZnGBbKnHKLmaZZNKI246l91KxsC/2dgyXm0+rAui+rJ
	tyPS/DkkpiY4DyIMQeTbxw
X-Google-Smtp-Source: AGHT+IEooaOiNLnMKLRRHGCaWDCOnCAgW3Sh4OwaDZPSOlfMFBnwP+KJRS/zmnhxhB49oEBPXDxTIQ==
X-Received: by 2002:a92:c108:0:b0:360:5d99:65b5 with SMTP id p8-20020a92c108000000b003605d9965b5mr4443684ile.21.1705298431173;
        Sun, 14 Jan 2024 22:00:31 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o18-20020a637e52000000b005b9083b81f0sm7392988pgn.36.2024.01.14.22.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 22:00:30 -0800 (PST)
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
	Jerry Shih <jerry.shih@sifive.com>,
	Nick Knight <nick.knight@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [v11, 05/10] riscv: lib: vectorize copy_to_user/copy_from_user
Date: Mon, 15 Jan 2024 05:59:24 +0000
Message-Id: <20240115055929.4736-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_060034_819741_1D43DBA4 
X-CRM114-Status: GOOD (  25.56  )
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

Co-developed-by: Jerry Shih <jerry.shih@sifive.com>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
Co-developed-by: Nick Knight <nick.knight@sifive.com>
Signed-off-by: Nick Knight <nick.knight@sifive.com>
Suggested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v11:
 - pass the proper size when falling back to scalar.
 - Honor the original implementation and authors.
 - Skip bytes which have been processed by the vector store when falling
   back to scalar (Guo)
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
 arch/riscv/Kconfig                      |  8 ++++
 arch/riscv/include/asm/asm-prototypes.h |  4 ++
 arch/riscv/lib/Makefile                 |  6 ++-
 arch/riscv/lib/riscv_v_helpers.c        | 45 +++++++++++++++++++++
 arch/riscv/lib/uaccess.S                | 10 +++++
 arch/riscv/lib/uaccess_vector.S         | 53 +++++++++++++++++++++++++
 6 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d42155c29a55..ff48dc2d0dcc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -527,6 +527,14 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
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
index 000000000000..be38a93cedae
--- /dev/null
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -0,0 +1,45 @@
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
+		n = remain;
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
index a9d356d6c03c..bc22c078aba8 100644
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
index 000000000000..51ab5588e9ff
--- /dev/null
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -0,0 +1,53 @@
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
+	li	t6, SR_SUM
+	csrs	CSR_STATUS, t6
+
+loop:
+	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+	fixup vle8.v vData, (pSrc), 10f
+	sub iNum, iNum, iVL
+	add pSrc, pSrc, iVL
+	fixup vse8.v vData, (pDst), 11f
+	add pDst, pDst, iVL
+	bnez iNum, loop
+
+	/* Exception fixup for vector load is shared with normal exit */
+10:
+	/* Disable access to user memory */
+	csrc	CSR_STATUS, t6
+	mv	a0, iNum
+	ret
+
+	/* Exception fixup code for vector store. */
+11:
+	/* Undo the subtraction after vle8.v */
+	add	iNum, iNum, iVL
+	/* Make sure the scalar fallback skip already processed bytes */
+	csrr	t2, CSR_VSTART
+	sub	iNum, iNum, t2
+	j	10b
+SYM_FUNC_END(__asm_vector_usercopy)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
