Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E958C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZe6AD/YWVqXQ/gKrX7aata/mRZ1UQ4iHP0SjhcapQI=; b=2tFQo+pBfyD6eq
	UrEOLVbAcid74o8XNLKDhEEKBw99iUrRdWPn5N0SLANZp9s5uEGiRcyuuQR9mUjjkm86YPWLvljRI
	4U65uQhYIVYY35xXba9M9Bcuy95aZh0WlxHIMXJp6ihXhrvyM0ih4pAQwSo1Z5NjeKwpr3Y7cHtEr
	9sqEIszp5wK8U9jIpqOaYTbOi/A3c3sOnK2HX8kYEQw7+2ubbQgIO3Xt91CHpLV4OAzJmJn7pRy2+
	l9BjoMVr6omSaMJqgScZS27mC7EUXQSVqdFABqpMmeGrjBkudW8CoRhlpS/xrjIVTd7kVU8tJto33
	ef9tqPGqAMigUsrj70Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrSt-00GUfK-1C;
	Wed, 20 Dec 2023 07:58:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrSp-00GUbO-1h
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:58:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso7380705ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703059076; x=1703663876; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+5y5mXY/GjTuMPoMs/eCuiabcFqtKPrJHseD8GV4oj8=;
        b=XCnEZhi5uNjVzldJGOtylmc+meQb2HTbbROVgKUeBfdQTDI9AqknhBdW5LjSgvqglo
         bGEahksjDgrYE+3qi3vLGLWXQ9LUwvXdLAlZ7jJlLzhHOKmYbvKI1DjN0oF9eoN5GCe0
         Xp7gY1LQCiSuqieL6Nz+8iT/P247+0jcUSCtls0yDFAr8NrPgM27zhnMgGi9SxGT87Ba
         XMh2p6+T0VIh6kuX79yvZw8IpTLuo+LazEs7O7Ge+qsSKf0UiVec7h4HpwAJVCHjHCYE
         UUc5wwcCsqkAAgbjqH1ZPuu/N5z1OBPDAujxYqvJLsGFoLt4IEDPLQ2zuQLkkphKQRtc
         /8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059076; x=1703663876;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5y5mXY/GjTuMPoMs/eCuiabcFqtKPrJHseD8GV4oj8=;
        b=Uhad1UR5NXGz5q31uLuAvLamiOCDQ1oKsveVuzTjVisTLVt0nnxblCVhcwCi5LMXtb
         25t5fPMrGoWAY5klKWIgIQ53A/6IdgqLQbAPWlvtjkpMgj4Ixf0sIIPWpIQUV0smFOLk
         fSq9GQT/3DZ5vyl5AeiA77kcwMt3LPZV3cMiAuTzKpSziln6rOSgNuS/2aC4A+CFpUBh
         tjp640SrZ5OjCcrKkF+7oWVN/7dBVgNpAT59VbNDpbKoxQnkqr1J1uai8eiqRAME6ezY
         3o6Nb7rNrhIUvYTyBzRCiudruCkbC7OCGkdHTYQTLUIfFgqb+pZMvZXnHhf4lX6HUvlT
         1T2g==
X-Gm-Message-State: AOJu0Ywee/SDSM6yYR2XpTECn63cwQkviVvdUcesdoqITOnVuQxZuLV+
	JN6Rzmru3pjW6WnlqG2ZNY/pJ5lzXF/YRDIGamk8+w0xPlCH3DQrmai/+9W2HPEwBts1cN/MyxX
	KBEsZxI7dbEGcbccJhaOmOGhUKhLIS8k+oMCbqpaJ3h8WdfomYmdX4SyAkkw2Oxhc3YuXCHRIcE
	husqKQEmJWapZC
X-Google-Smtp-Source: AGHT+IGiciNCrz7IJZBh89xO3JgJdIWf8ReQ7b0YXHaKA7drz6+cfTNsAWzv27t793xAMJkwcEkfhQ==
X-Received: by 2002:a17:902:e885:b0:1ca:7f91:aa5d with SMTP id w5-20020a170902e88500b001ca7f91aa5dmr22870702plg.16.1703059076008;
        Tue, 19 Dec 2023 23:57:56 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902789400b001cf8546335fsm3441453pll.5.2023.12.19.23.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:57:54 -0800 (PST)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bo YU <tsu.yubo@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [v6, 05/10] riscv: lib: vectorize copy_to_user/copy_from_user
Date: Wed, 20 Dec 2023 07:54:07 +0000
Message-Id: <20231220075412.24084-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220075412.24084-1-andy.chiu@sifive.com>
References: <20231220075412.24084-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_235759_569735_49D2FB38 
X-CRM114-Status: GOOD (  21.95  )
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
Changelog v6:
 - Add a kconfig entry to configure threshold values (Charlie)
 - Refine assembly code (Charlie)
Changelog v4:
 - new patch since v4
---
 arch/riscv/Kconfig               |  8 +++++
 arch/riscv/lib/Makefile          |  2 ++
 arch/riscv/lib/riscv_v_helpers.c | 38 ++++++++++++++++++++++++
 arch/riscv/lib/uaccess.S         | 10 +++++++
 arch/riscv/lib/uaccess_vector.S  | 50 ++++++++++++++++++++++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..3c5ba05e8a2d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -525,6 +525,14 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
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
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 494f9cd1a00c..1fe8d797e0f2 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -12,3 +12,5 @@ lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
+lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
+lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
new file mode 100644
index 000000000000..139e5de1b793
--- /dev/null
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -0,0 +1,38 @@
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
index 000000000000..7bd96cee39e4
--- /dev/null
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -0,0 +1,50 @@
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
+.Lout_copy_user:
+	/* Disable access to user memory */
+	csrc CSR_STATUS, t6
+	li	a0, 0
+	ret
+
+	/* Exception fixup code */
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
