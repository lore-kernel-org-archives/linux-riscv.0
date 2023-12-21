Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA06C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZe6AD/YWVqXQ/gKrX7aata/mRZ1UQ4iHP0SjhcapQI=; b=IJqPJjlO66bbLM
	r+rKONHDWSd0t2gUodj9ofJhaEI0Rq1qhwA6CGCqzJg8egEleeIgKd4/PrB9Eeu24TKelZ+L2Wsk7
	UGdl1gIVokezeGw0Vblyg5s6CBLDIEPuwY5zotRa0T9UySri1bRlcZrOEPwh/0rL6XJz1UbaMJhEw
	Avx1NhcwYQxGhYLOstE9BNnEqauiHbZpS4mp+NFTysZ5dssj58lsHl3lck4ZNZztZk50RBvPxVE0r
	3M2rdxji/kXXLyvSKcx/+L1pCeLYfqP/wPsq3FKHmqcGid7g6ZAo2nfgeIALXkrJza04K0asZx9jO
	WINtR1pCFVZ8GjkU2hkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLd-0031wH-16;
	Thu, 21 Dec 2023 13:44:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLa-0031s4-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:44:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3dee5f534so13881585ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166258; x=1703771058; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+5y5mXY/GjTuMPoMs/eCuiabcFqtKPrJHseD8GV4oj8=;
        b=ltkdJklRbfg3XTgVnUIqoQQn+MxO68LGPSHZFPUH5nAwJYGIl8qh7Tsg4RGaMFn7VR
         yNRsI6yxDRTbZoVyh9LgywTf0/0EyHowri1g021PmoR6SYu5LLoD7FKpldAwFhm4DvXe
         TFA252/PbP5Nsp7moUaMW7ZS/QkBICnpO6QwtkkfY5HPSb/uZimQh6rVOyQOHrBnsSeM
         SVQz6M0ghEYFXILKrLMOk3hUhgAhhhPDw1r74bdQiJGJCerSJt0QF8pXmnmCSquM6Hfp
         MP3F0UOg6PwR95xKvjy3KaQxtsYQPgiqIHVwnIOM+bZmR9bdsvKArUcq1XcWVC5FLR8h
         aMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166258; x=1703771058;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5y5mXY/GjTuMPoMs/eCuiabcFqtKPrJHseD8GV4oj8=;
        b=DZG2riy4o3Qipif+qVhJE1/WUeW1aVzfZq3y55fGFZHNdvflwxx8HxJt9bQC6GAlDY
         vKUGPG5uLaAtuADmxFus0PCez/StfD2xNjVuGYSd9TYC6AIkVZz+hj2I4Ua6BVPEbn4s
         sMF8NTSgvkRDGY9X0C/fWpqL0ROcEFH6/s7mdQRWqGlEO36e/TgQKz/AF0z7UDj5PQCB
         1kFCzjz6f1fSILmjK4QKFSx1Pf/NmDGJS3klpUBszw/VVSg4Wi0FDmW0uzZnat/6+kBy
         jcu6i42OxjCNntBCRN8Q+7xjYwbkFp3wqWYn5nvvhUPC1PHpN54ldOwdcxIBRud16Oh6
         cwsw==
X-Gm-Message-State: AOJu0YxvwOk9kt1W7wsPSzo1huYadz9DgWN5qPLr2swxoXFvUoSoFD4X
	V2Drnsrus7QGyepmwB8LzmMR6Iq8ZclW3bhveJLTD6rjY+sGjyhWs4XaJfWYN6ErhLVR/m4XW56
	2iQnNESgphuR3XSA/Flat/bkGYC+kjX3IJFBpu0LTSn5ENHXj4mDIqcbmzYUkyRfAiyxdkEG9Gp
	cb3H360NNZpLiY
X-Google-Smtp-Source: AGHT+IGNiZA6N0QSyHhAb79lTcUyla5b2o0CNqobBRMvxiMOC18DjJyk2UFTevHQYb5awhb5BDS+PQ==
X-Received: by 2002:a17:902:d385:b0:1d3:ff24:b3bb with SMTP id e5-20020a170902d38500b001d3ff24b3bbmr860957pld.49.1703166258203;
        Thu, 21 Dec 2023 05:44:18 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:44:17 -0800 (PST)
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
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [v7, 05/10] riscv: lib: vectorize copy_to_user/copy_from_user
Date: Thu, 21 Dec 2023 13:43:12 +0000
Message-Id: <20231221134318.28105-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221134318.28105-1-andy.chiu@sifive.com>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054422_479775_5289ABE6 
X-CRM114-Status: GOOD (  21.65  )
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
