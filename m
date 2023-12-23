Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F5C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbxQdMfKNEwIenHIavvgK6M/fE1oVXHnNl4kXC2nhgE=; b=5A+rASFvEpnLX/
	RSU190/NKuQjOqN0eFkX2jp+aILadvztlwnxVEj5qkR+h09mvKSwWLQaYfjVUvlgzUzf2pZ+aMnYU
	XKrm95RiGlxRaefPD9HSLcNG3ScdOHONdUMBs3MTnQcMFz1orp2jDqoJNXjtW7jkNRDrgCxpyEYKE
	3NfydZAwUF3eP0aE4n72y63TlVUECUHxqMIymNHmvIzDIUfBcy494xRJ1x6JsQ8e8MFkM66CTSlGT
	WOL2EiDE1k7Juves7JHgTt/Dbu2fwuyMrMmQynbuMz2sR+GbZtQTSZv5Pzh7AyCmJcIZH7ZhRNO66
	BCQ8R8+oROlU1crwA3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtf2-007MEc-1d;
	Sat, 23 Dec 2023 04:30:52 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtez-007M88-1I
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:30:51 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-59446cd46e9so533637eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305832; x=1703910632; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mqdq8las81Phx1TUr4Zt2rkRy0CyQ2SbCdGd8DVHTUk=;
        b=GxmRkYay5CRkRSPjr0jnFlGpW3VEU68xoGn7g85ohz2Ha47ebxhIVq5lDSv1rVU55y
         tEM8oHEXaShxBPWFC5W6SZNjyo1m+4yj2XT2Ee9U5ueQfBEpkoamDW/fgzJ3eJJK0ot8
         yEy9sIhBzJ/nrn1ylYaP229SAwtqghnj3Qg74VL01Q2nZMcbO5d2q3/PgUANCX1QKhID
         FAbKHZA+lWUqjBYE7VLYxGa//OY3DU0sKdvfZfl6sEKLfZgjfRZqQqpKcYO0PDNKQaCk
         3+hsVtKgtfLBQ75yST/I87IGFTfLcuHFjae1+Eq9n2orD40a0luNsjsF1pU++gnN78h+
         vokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305832; x=1703910632;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqdq8las81Phx1TUr4Zt2rkRy0CyQ2SbCdGd8DVHTUk=;
        b=VB461rIuvyjHp77IvttGBPOPqNKDubMIKQXTli0Z+6Id5VZciVU5xsc+OoWAjS6+E5
         A3xqyPGz/uuEeMnU0c+9BN51D1kFsl+skaZthVsj7pPsDxkQ52/YfHkx0hqqBC11GvJi
         FPFZPDT9IIaVbqvTZJSzmungZ3A7+yuDzYa0uyiuXQ3+gYsGcxkF0WiZrgdsocJgBEpR
         7Qm7X8ES+ZJOLjH+U0q2dO7aerDQ6y7L/dQmHI/xh6ePvsbwRi4AvyqqHslMGra1aH8g
         GuzmpfJRiKDlgvp8OUTGGnHe7Byn3hY6IgFIDRxZ9B3chII9h50SMn/r7pyzmhxlie+I
         dSRQ==
X-Gm-Message-State: AOJu0YzSTUEX5zPWhFBjltRDOnyzrZYxXGXOZkpstLkQ8l0fota1YzrC
	Re+dYF4dRuzgFjSILVm/ZdxlGbM7qH7A6JEnGPaDSgBC0LDs/ATUyCfpwHzQ25sVft0wOMdKu1i
	y41/0hDfr/QKTbeZjH1/48P83rlXqXeEYc2+YmNODuz3+2WDGXLhrPwWIGhNwFu4Vj7493RSRvC
	E18y66/mI2Job0UKScOaJA
X-Google-Smtp-Source: AGHT+IF5JjNsoQm5epEVk5B35JJM8Uor8Reuh0cMXafj1GyOfS+pYDPq6Rijc4EOpDclqdHbyVD5tw==
X-Received: by 2002:a05:6358:a085:b0:170:50f4:447a with SMTP id u5-20020a056358a08500b0017050f4447amr2478570rwn.48.1703305832355;
        Fri, 22 Dec 2023 20:30:32 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm2623397pjb.33.2023.12.22.20.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:30:31 -0800 (PST)
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
	Kees Cook <keescook@chromium.org>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v8, 06/10] riscv: lib: add vectorized mem* routines
Date: Sat, 23 Dec 2023 04:29:10 +0000
Message-Id: <20231223042914.18599-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231223042914.18599-1-andy.chiu@sifive.com>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_203049_438680_793728D1 
X-CRM114-Status: GOOD (  16.34  )
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
index c8a6787d5827..d389dbf285fe 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -16,3 +16,6 @@ lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
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
index 6cac8f4e69e9..c62f333ba557 100644
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
 
@@ -42,3 +46,25 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 	return fallback_scalar_usercopy(dst, src, n);
 }
 #endif
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
