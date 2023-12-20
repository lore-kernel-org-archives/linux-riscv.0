Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C306FC46CD8
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEk/QqnqhX8ZoFxmGrbRutbbfOwccT8QZsLZma5oEkY=; b=uW9+03P+fVncmD
	zi7bE9pGtR8BNCIL6YJP1KXLYfv72dFxXb5WLrlzVxiBNttHyYO390KIboxXst5D1Le5/EXL3LVjW
	gLvuitbz23CrOnaaUVxa0ZFsGkDCfYzK9FJ6eD25BrvLzGNiQInsO+YnZ/hGDEce96e7HYVn2gpsG
	esyuN66EwT55ZmGbVbHTkfG0baetFQ3g0SHlyEQOcJfpVGiR3ajKdOCSih4SNjIcw9MhWwNSMml4Q
	rocafk14gguq0TLmF34P3eiP5qrrT84+LJXSCbNh3uHv6kuj60Dj+XXS5m5qJcnm3AIduYSkHbz6J
	EACw54N3Oh56TaDSuZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrT3-00GUks-12;
	Wed, 20 Dec 2023 07:58:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrT0-00GUjA-09
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:58:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d3ef33e68dso1964855ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703059088; x=1703663888; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=503CjaG/B7x1b1AikMZQqWs8/BfTT3y9kpJ7D16KU0k=;
        b=FFMjT7MaievqmFb16QWPmcsITgB+yhIG4BRdGSJ6Fb6FqTRgezNlij5fhtaN6ml+mJ
         8CMTBYhwrjoRCWeaFylYKcZ4vMIohNwrcKORuRL9jMFRqvXee2/Rh5Znfhij2/2C7fTq
         qUHY9uYs+W+RqGZsAS950QJ2vWK4XaNay2xBJJ+K/4WSIjjo0EQdyL2zxDkJG5wIVbw1
         ZTabROri75nijhdGfW+RcIxe7geygYaRUSaP0bfuLP7nxiIKV3iLGrB9YoJjnDAwsvc1
         eCmiWdUCUelquWX9EvtxXKQa6YU9jYrv1m8l8bU2myOj9fbv8RY2j6v7AciPu2jYvySc
         1bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059088; x=1703663888;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=503CjaG/B7x1b1AikMZQqWs8/BfTT3y9kpJ7D16KU0k=;
        b=b9yjXAwq/7t74WdanXrwjLOAZwwuP5Pj5wW6gLTZAJ/xdnZAddulY5LZoK52tNvVLC
         oA16AqSdcyZYuT1rJ1tbvq3F1K7dxOhgB6x/zR8Yz9lsEdUprQpQb7IomLox9W0FeVr0
         Bzf3Zdz2wCISJXI7WB/6YjeZZ+6isUPbtdKVrSYFuwsiwSoFElubq6vD59pdHQXKGLAr
         DVWybwLdnHixg1bn/gwIKnpWKuZQrH4Es93suPNShAINgY4dcUgS9rNoTYE0BEJJR94x
         mrUThWY+qYybKR9VLlr5PRYmZ+WMKFuVXsLWgLc95Dg7Xs6URiuGZauzmWjTxmLyPwLo
         Sj9A==
X-Gm-Message-State: AOJu0YywCAz6ZepxBiIVf2bhzKgvaot1DmDVMc9QyZauFdCmMv9kpqWJ
	26iQQOe1HKhynighgBL9Lk0xMIx7Dz9jrkOCG+MakvkoiBsW4/0CnXwgRnXYZ+5wcS5jh9Nd0bg
	/YNawHgfLIi4kyo3BLG4L4Ei05hqFIAobyyrllmkgD1bzIa9++olfg6RBpXyez8/PcwmJJsJ2/Y
	5wn/WGnxmJkyz2CIYsZkVs
X-Google-Smtp-Source: AGHT+IG+R1pDScKLWVc5PYFWbJNHc+b7F3OwZ3UDvqnkMRZoAeuNeE1rn07Ee7f4lNtWJaePGVdtjw==
X-Received: by 2002:a17:902:db10:b0:1d3:d7d1:fc68 with SMTP id m16-20020a170902db1000b001d3d7d1fc68mr3339200plx.32.1703059088305;
        Tue, 19 Dec 2023 23:58:08 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902789400b001cf8546335fsm3441453pll.5.2023.12.19.23.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:58:06 -0800 (PST)
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
	Heiko Stuebner <heiko@sntech.de>
Subject: [v6, 06/10] riscv: lib: add vectorized mem* routines
Date: Wed, 20 Dec 2023 07:54:08 +0000
Message-Id: <20231220075412.24084-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220075412.24084-1-andy.chiu@sifive.com>
References: <20231220075412.24084-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_235810_109140_0DE02D78 
X-CRM114-Status: GOOD (  15.32  )
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

Provide vectorized memcpy/memset/memmove to accelerate common memory
operations. Also, group them into V_OPT_TEMPLATE3 macro because their
setup/tear-down and fallback logics are the same.

The original implementation of Vector operations comes from
https://github.com/sifive/sifive-libc, which we agree to contribute to
Linux kernel.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v6:
 - provide kconfig to set threshold for vectorized functions (Charlie)
 - rename *thres to *threshold (Charlie)
Changelog v4:
 - new patch since v4
---
 arch/riscv/Kconfig               | 24 ++++++++++++++++
 arch/riscv/lib/Makefile          |  3 ++
 arch/riscv/lib/memcpy_vector.S   | 29 +++++++++++++++++++
 arch/riscv/lib/memmove_vector.S  | 49 ++++++++++++++++++++++++++++++++
 arch/riscv/lib/memset_vector.S   | 33 +++++++++++++++++++++
 arch/riscv/lib/riscv_v_helpers.c | 22 ++++++++++++++
 6 files changed, 160 insertions(+)
 create mode 100644 arch/riscv/lib/memcpy_vector.S
 create mode 100644 arch/riscv/lib/memmove_vector.S
 create mode 100644 arch/riscv/lib/memset_vector.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3c5ba05e8a2d..cba53dcc2ae0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -533,6 +533,30 @@ config RISCV_ISA_V_UCOPY_THRESHOLD
 	  Prefer using vectorized copy_to_user()/copy_from_user() when the
 	  workload size exceeds this value.
 
+config RISCV_ISA_V_MEMSET_THRESHOLD
+	int "Threshold size for vectorized memset()"
+	depends on RISCV_ISA_V
+	default 1280
+	help
+	  Prefer using vectorized memset() when the workload size exceeds this
+	  value.
+
+config RISCV_ISA_V_MEMCPY_THRESHOLD
+	int "Threshold size for vectorized memcpy()"
+	depends on RISCV_ISA_V
+	default 768
+	help
+	  Prefer using vectorized memcpy() when the workload size exceeds this
+	  value.
+
+config RISCV_ISA_V_MEMMOVE_THRESHOLD
+	int "Threshold size for vectorized memmove()"
+	depends on RISCV_ISA_V
+	default 512
+	help
+	  Prefer using vectorized memmove() when the workload size exceeds this
+	  value.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 1fe8d797e0f2..3111863afd2e 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -14,3 +14,6 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
+lib-$(CONFIG_RISCV_ISA_V)	+= memset_vector.o
+lib-$(CONFIG_RISCV_ISA_V)	+= memcpy_vector.o
+lib-$(CONFIG_RISCV_ISA_V)	+= memmove_vector.o
diff --git a/arch/riscv/lib/memcpy_vector.S b/arch/riscv/lib/memcpy_vector.S
new file mode 100644
index 000000000000..4176b6e0a53c
--- /dev/null
+++ b/arch/riscv/lib/memcpy_vector.S
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+#define pDst a0
+#define pSrc a1
+#define iNum a2
+
+#define iVL a3
+#define pDstPtr a4
+
+#define ELEM_LMUL_SETTING m8
+#define vData v0
+
+
+/* void *memcpy(void *, const void *, size_t) */
+SYM_FUNC_START(__asm_memcpy_vector)
+	mv pDstPtr, pDst
+loop:
+	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+	vle8.v vData, (pSrc)
+	sub iNum, iNum, iVL
+	add pSrc, pSrc, iVL
+	vse8.v vData, (pDstPtr)
+	add pDstPtr, pDstPtr, iVL
+	bnez iNum, loop
+	ret
+SYM_FUNC_END(__asm_memcpy_vector)
diff --git a/arch/riscv/lib/memmove_vector.S b/arch/riscv/lib/memmove_vector.S
new file mode 100644
index 000000000000..4cea9d244dc9
--- /dev/null
+++ b/arch/riscv/lib/memmove_vector.S
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+#define pDst a0
+#define pSrc a1
+#define iNum a2
+
+#define iVL a3
+#define pDstPtr a4
+#define pSrcBackwardPtr a5
+#define pDstBackwardPtr a6
+
+#define ELEM_LMUL_SETTING m8
+#define vData v0
+
+SYM_FUNC_START(__asm_memmove_vector)
+
+    mv pDstPtr, pDst
+
+    bgeu pSrc, pDst, forward_copy_loop
+    add pSrcBackwardPtr, pSrc, iNum
+    add pDstBackwardPtr, pDst, iNum
+    bltu pDst, pSrcBackwardPtr, backward_copy_loop
+
+forward_copy_loop:
+    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+
+    vle8.v vData, (pSrc)
+    sub iNum, iNum, iVL
+    add pSrc, pSrc, iVL
+    vse8.v vData, (pDstPtr)
+    add pDstPtr, pDstPtr, iVL
+
+    bnez iNum, forward_copy_loop
+    ret
+
+backward_copy_loop:
+    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+
+    sub pSrcBackwardPtr, pSrcBackwardPtr, iVL
+    vle8.v vData, (pSrcBackwardPtr)
+    sub iNum, iNum, iVL
+    sub pDstBackwardPtr, pDstBackwardPtr, iVL
+    vse8.v vData, (pDstBackwardPtr)
+    bnez iNum, backward_copy_loop
+    ret
+
+SYM_FUNC_END(__asm_memmove_vector)
diff --git a/arch/riscv/lib/memset_vector.S b/arch/riscv/lib/memset_vector.S
new file mode 100644
index 000000000000..4611feed72ac
--- /dev/null
+++ b/arch/riscv/lib/memset_vector.S
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+#define pDst a0
+#define iValue a1
+#define iNum a2
+
+#define iVL a3
+#define iTemp a4
+#define pDstPtr a5
+
+#define ELEM_LMUL_SETTING m8
+#define vData v0
+
+/* void *memset(void *, int, size_t) */
+SYM_FUNC_START(__asm_memset_vector)
+
+    mv pDstPtr, pDst
+
+    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+    vmv.v.x vData, iValue
+
+loop:
+    vse8.v vData, (pDstPtr)
+    sub iNum, iNum, iVL
+    add pDstPtr, pDstPtr, iVL
+    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+    bnez iNum, loop
+
+    ret
+
+SYM_FUNC_END(__asm_memset_vector)
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
index 139e5de1b793..75615998078d 100644
--- a/arch/riscv/lib/riscv_v_helpers.c
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -36,3 +36,25 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 fallback:
 	return fallback_scalar_usercopy(dst, src, n);
 }
+
+#define V_OPT_TEMPLATE3(prefix, type_r, type_0, type_1)				\
+extern type_r __asm_##prefix##_vector(type_0, type_1, size_t n);		\
+type_r prefix(type_0 a0, type_1 a1, size_t n)					\
+{										\
+	type_r ret;								\
+	if (has_vector() && may_use_simd() &&					\
+	    n > riscv_v_##prefix##_threshold) {					\
+		kernel_vector_begin();						\
+		ret = __asm_##prefix##_vector(a0, a1, n);			\
+		kernel_vector_end();						\
+		return ret;							\
+	}									\
+	return __##prefix(a0, a1, n);						\
+}
+
+static size_t riscv_v_memset_threshold = CONFIG_RISCV_ISA_V_MEMSET_THRESHOLD;
+V_OPT_TEMPLATE3(memset, void *, void*, int)
+static size_t riscv_v_memcpy_threshold = CONFIG_RISCV_ISA_V_MEMCPY_THRESHOLD;
+V_OPT_TEMPLATE3(memcpy, void *, void*, const void *)
+static size_t riscv_v_memmove_threshold = CONFIG_RISCV_ISA_V_MEMMOVE_THRESHOLD;
+V_OPT_TEMPLATE3(memmove, void *, void*, const void *)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
