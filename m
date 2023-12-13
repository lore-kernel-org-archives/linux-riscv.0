Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B191C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxxS46L427XKmh9YY6qCUb1FO9KbJPUvMTsi+wJZSKA=; b=ECG9aL1roMcjxE
	sMiJvfQVQ6IwMGVuLva66McEAQGepe0g90tcZ1yozSN+mnkNW124JQc1JLzPSHZaia26Z5h4qmDH4
	3FmAsQMYoGtbzeQK/2rVKawWYBM6SFxxwMhXTzQj446oaNIcbkLeaUSXIZsaYuslNtRwc3Z2Xvzz+
	+anREj9qQu1KfG0v8L5zIfsyCqUXmysHtAxIvVjTR/lahskNINymosYV7DVJkmegHSspUbLcfb9dm
	SbG0r9sEp9rZ6zUQ6Wvs1W+cEtr4ffIT/XvcKrqQPuvZJI2AaIfz8aGABueN9c2As0XDi4pjhYvon
	2ae7zOkOtzAiwj2SvbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP4V-00ElCM-2J;
	Wed, 13 Dec 2023 13:14:43 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP4S-00El96-1h
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:14:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ce6b62746dso4204373b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702473275; x=1703078075; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ualX2swTBrXI+FwzOjM4q/ZoSMm8A2VqrOIQc8Gos8=;
        b=R0f2tyxjSmY4b5SenjfNTwe4kIRnFTV+YzHl0hkJekLqkoKkcuLJWNcA3NdmLpiamE
         Ft1Pvy+OqODrd0/jBjlve8V+KTxni5KPtW+nfTVv9x+2G/vv+Ci8GpyPIql4bTIoj0DR
         Ah2lgZgwxxq+B5AZadm8EW0uT6+b01nNVFQ+6dZqga56SuQZba+JhSBE0ZtHSQBuVg7u
         dJF4U5/YhiEpRGzw/wK4qDNRzuFLxwoqCXRHJ/0rfCReml6Xkkn5cMz0dflDOA6WPB7n
         XRdHKP7eLjCkEBKKcFMkre4A7yDcXcDLAzpozUcwh2yjOC0HPZojUCSnQxjO+7yK7j8u
         WXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473275; x=1703078075;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ualX2swTBrXI+FwzOjM4q/ZoSMm8A2VqrOIQc8Gos8=;
        b=kAWadiQGVd5RMIRb770LMgIkUosnN2qnpndS7FbBPWuAkbh0xATPBdUe+7NeU8uhDD
         x0CRRaxL+59Svbb83iFZHvHppcYvDpkpLeilDTfsUDb9p+1U54WHyxj9vEANdON2QYij
         DUUVwGjoiPjjU/Bfvf9WvRFEZTuW5R5H0a57YYm83zaQHqPyPvtbv98p9VuEb2WVX5e6
         1NqEOF7KWYg6EMYIVpQjl/Vxfd9WNdx8dZEWLA2krq2yVqmtbroNA6nWv1EUQ6VetX2z
         c+H/zxYEsxSOCBLtZb8fDxoKJkXbOBtRpgStAMzctvCIlSnTnnWnlpngJqQ4VrS94//i
         6U9A==
X-Gm-Message-State: AOJu0YxFxxcC2wAu/P3Sl2fCjiYQW/H0drCZTeYO52sH7A4bIovncbMz
	6tO4xYApE6cSaptL/OoL2u59n+U47ZBhhOiIPoSwHuKo11DNrolVIjosIzGWjk2JXbDQfBoMtIE
	5uB+9t4+iAjY0Lj7IJXDmR+WMb1FxnUnh/O3GqHj2xu32jtJZDEBswJcKtaRcCp6PGkfGPfA5Oj
	zOXmOm0y9cNDZz
X-Google-Smtp-Source: AGHT+IEhf97n+EouAuUoiNfbwwdZLVPWlSL8GQ9FrHhGWXRimjnKTE0HDqfxpxNe7GTSzj+WvwoYGw==
X-Received: by 2002:a05:6a00:2d04:b0:6cd:f35d:afb8 with SMTP id fa4-20020a056a002d0400b006cdf35dafb8mr4365948pfb.11.1702473274368;
        Wed, 13 Dec 2023 05:14:34 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id fn7-20020a056a002fc700b006cecaff9e29sm9928601pfb.128.2023.12.13.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:14:33 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v4, 6/6] riscv: lib: add vectorized mem* routines
Date: Wed, 13 Dec 2023 13:13:21 +0000
Message-Id: <20231213131321.12862-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231213131321.12862-1-andy.chiu@sifive.com>
References: <20231213131321.12862-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_051440_561877_CA860B4D 
X-CRM114-Status: GOOD (  14.91  )
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
Changelog v4:
 - new patch since v4
---
 arch/riscv/lib/Makefile          |  3 ++
 arch/riscv/lib/memcpy_vector.S   | 29 +++++++++++++++++++
 arch/riscv/lib/memmove_vector.S  | 49 ++++++++++++++++++++++++++++++++
 arch/riscv/lib/memset.S          |  2 +-
 arch/riscv/lib/memset_vector.S   | 33 +++++++++++++++++++++
 arch/riscv/lib/riscv_v_helpers.c | 21 ++++++++++++++
 6 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcpy_vector.S
 create mode 100644 arch/riscv/lib/memmove_vector.S
 create mode 100644 arch/riscv/lib/memset_vector.S

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
diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 34c5360c6705..55207e6f5736 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -110,4 +110,4 @@ WEAK(memset)
 	bltu t0, a3, 5b
 6:
 	ret
-END(__memset)
+ENDPROC(__memset)
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
index d763b9c69fb7..12e8c5deb013 100644
--- a/arch/riscv/lib/riscv_v_helpers.c
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -36,3 +36,24 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 fallback:
 	return fallback_scalar_usercopy(dst, src, n);
 }
+
+#define V_OPT_TEMPLATE3(prefix, type_r, type_0, type_1)				\
+extern type_r __asm_##prefix##_vector(type_0, type_1, size_t n);		\
+type_r prefix(type_0 a0, type_1 a1, size_t n)					\
+{										\
+	type_r ret;								\
+	if (has_vector() && may_use_simd() && n > riscv_v_##prefix##_thres) {	\
+		kernel_vector_begin();						\
+		ret = __asm_##prefix##_vector(a0, a1, n);			\
+		kernel_vector_end();						\
+		return ret;							\
+	}									\
+	return __##prefix(a0, a1, n);						\
+}
+
+static size_t riscv_v_memset_thres = 1280;
+V_OPT_TEMPLATE3(memset, void *, void*, int)
+static size_t riscv_v_memcpy_thres = 768;
+V_OPT_TEMPLATE3(memcpy, void *, void*, const void *)
+static size_t riscv_v_memmove_thres = 512;
+V_OPT_TEMPLATE3(memmove, void *, void*, const void *)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
