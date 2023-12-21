Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB4DC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzhyEtGaXaTm7QHCx6aU+nrKbpEhoKsy5k5jmhcl+CA=; b=IzM5HIg6jHu6K0
	zoVjOR1FDhmZNPk45Oicyrv67CWK9hhnWDW53CzhZcNuIbwdKBBUsKSZIHt4fg7mJxA6A/CNhDU1N
	EYAF/9LghYgXz/ai+nHL7WQ2/+en7MDmfh4H+wDPlCuJsMRqU4b8o8HhzgNpzMljt60uAKs7NKfYn
	kVIqCqXq7MAMuZvEdmWM6WxFFsjK2PsG+r65QeqkZemF35xXmBdIXxX/HzAFNpReN9szlVW19A73A
	CSI6MxWRMatwkQK1IuwWjQF6sBIMJMQJCbIHEwws12/UZL1wQ31hM+9voD8IkBz9d1vZT7Fms5KE3
	NLboL2GP9SZUK7GM6Dng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLn-00322A-29;
	Thu, 21 Dec 2023 13:44:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLk-0031zi-07
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:44:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28bfb64e746so173868a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166270; x=1703771070; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1jZcVBDRaflxDGHuWgpJUzAXe4cvvRKG5aPkIKHmck=;
        b=liyN+l9PS4ZMC32sdWygRzQXsVx9HiO8Oj7zavEKzqKBnIqRqdV/5AFJr8eOJ8FQDw
         ai7UWjY3403hY2A1s/7veHRKnd6M3IrCUQpSNlBkPQBPyYSuGx/PQFu75a9nF/90lhZa
         it5kwjH4mQBRNn7hJiqsdmC55q46nxy3Na4OV7g9ZUMl0Tmk2xKDoCOIb0Z8ncSSaJrp
         9YHfoSzqLCuMT+Di1ITlRrgxOXqLOVGiwjsvIPwESXAPq2+Urz2x0w1tm2aJgrkJguFi
         nVEgwnQkA0T1ZN1aO+vdJ2iXf6i7rRhNwxHEF8mNwN8dr/N/GNtTwgFbY4NhV+uOvXBM
         6Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166270; x=1703771070;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1jZcVBDRaflxDGHuWgpJUzAXe4cvvRKG5aPkIKHmck=;
        b=NTCAHUwOgChhzzDF44jeJbWMMYeCalmqqAasD/K5vEs4ovMGAp0z+49YUu64dVl9Eg
         E6NIU5fWKQIYwubOpCNHBnNwE7i7HSZL7F2sgbwAhy3SiInUOcAr4dB9p7yifzhALpOP
         G5hmyY+kaPrZi3PGeHxlGov59Q9GbGCfIcKPt9L/O5ufnE3UFSiBVp5i8CkjtEd9rtWh
         brs2CyV2a8qta+U6idHH4MJpX7MT/tHU1TVpV14skl7XR41SLCVdt20oVRyc6oivKJHh
         tVqw7em3xsGLIZ8YnIFkkhKcTQp2nPfRnmn3YYIYl244lv5EgsDTpuENpbdBvVZR8r2H
         dSIA==
X-Gm-Message-State: AOJu0YyBATxIi82pCfluvTYl8S50k7vDMVUWqO2i4p4PaCZdhOQyL7eq
	LdVbCljU3D1NM4DvDZwOAzvFZ+1AHj2JXPDSbmM3d9dhAUsGrl6/YKxA6NdZ96H62SZb8QGKnRN
	KA6dNuURPUokefKi5N3JdoGriwR4Aj3+jYj0Zybz+Z3pBjIf/d6gD1AKXP1NA9qFc4kc26mtURk
	YBh/nIVo6Q7m69
X-Google-Smtp-Source: AGHT+IFTLCrwrXYM5pIn3dAgoGLhtzxTtp+vg+N4GYjR/fut4cytVyvkBT91N5pBvdfSxohbBBaQyg==
X-Received: by 2002:a17:90a:d710:b0:28b:8bbb:32cd with SMTP id y16-20020a17090ad71000b0028b8bbb32cdmr3870198pju.78.1703166269927;
        Thu, 21 Dec 2023 05:44:29 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:44:29 -0800 (PST)
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
	Kees Cook <keescook@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v7, 06/10] riscv: lib: add vectorized mem* routines
Date: Thu, 21 Dec 2023 13:43:13 +0000
Message-Id: <20231221134318.28105-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221134318.28105-1-andy.chiu@sifive.com>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054432_077646_3FAA785E 
X-CRM114-Status: GOOD (  16.33  )
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

The optimal size for the kernel to preference Vector over scalar,
riscv_v_mem*_threshold, is only a heuristic for now. We can add DT
parsing if people feel the need of customizing it.

The original implementation of Vector operations comes from
https://github.com/sifive/sifive-libc, which we agree to contribute to
Linux kernel.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v7:
 - add __NO_FORTIFY to prevent conflicting function declaration with
   macro for mem* functions.
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
 arch/riscv/lib/riscv_v_helpers.c | 26 +++++++++++++++++
 6 files changed, 164 insertions(+)
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
index 139e5de1b793..28467d737faf 100644
--- a/arch/riscv/lib/riscv_v_helpers.c
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -3,9 +3,13 @@
  * Copyright (C) 2023 SiFive
  * Author: Andy Chiu <andy.chiu@sifive.com>
  */
+#ifndef __NO_FORTIFY
+# define __NO_FORTIFY
+#endif
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
+#include <asm/string.h>
 #include <asm/vector.h>
 #include <asm/simd.h>
 
@@ -36,3 +40,25 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
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
