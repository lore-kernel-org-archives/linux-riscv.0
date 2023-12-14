Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIwe0S92H5GvvGtES4iAkmKSpkYCOArR9nEwSqN4OPk=; b=qr/z0eWthL53jX
	AlI6rO6t3hkA4fNdIrwPwjyUO2hYYPsNiN1e4Si8ISHSlacJWZkvdhlxGHnS6CwmImJxSSbi9LcK5
	P+u0YWZlwhqti5200tknwM5oXEmi9dG8x5Flp3AjNNzskER5HSJC7/KrSmfJFAHnhJACfm9LLPutO
	qz+N6R9v3SmI8j6G0wCoJji0CSVCEPi8RNCnbfLezUQgkot+QsrLRK1SokOCblM20cPD3IOD2PuSF
	6v80ktymuyxJpTqnYuWfEDxUAYYjkoxmo5qMxCPaueIfVo3lrzZINN7r84zoP3SXEJOFSiDKQq1Kw
	6rc6e4jnYZGqA5pS26Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo7A-000jZQ-2u;
	Thu, 14 Dec 2023 15:59:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo77-000jXl-2d
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 15:59:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d2e6e14865so40937375ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 07:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702569544; x=1703174344; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M2INiZjT1dR9jMzqVnDUQHsJSZ5/v7zoYN31TBwrCZc=;
        b=HGhZqB0t3+bIL8yG3z3oofvjPuh80OcTLE59GE5IWWESR/9VU14MAP18JLTQJWGBcB
         P5VD+k/hY3b1nKBkThLTACXsNhb1MlmCdLfIHs4V9Kk37nwX7MmbZQIQzAIh5mST4kxE
         UkRNFvn7hx9okCMGOXuQOlK/8UkgIiUx/rKr8+WHscXlntsfeaLqm9vyRjhsqFxE+5fk
         THGTuUDZrLRmTii0/2WZ9+3uyFIL4oxv5giMn+9yn0YjadINPgrQu0B+5n9liFDF6nO0
         d9YixsRIJTN8u+lrGa8K4e157QxmWmfYTEYppZac/AMOZb98Lcs+/Az5hkuHK1Vh28kR
         v9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569544; x=1703174344;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2INiZjT1dR9jMzqVnDUQHsJSZ5/v7zoYN31TBwrCZc=;
        b=T37yrfPzrgISY0m5qhB8EwsLqF2m0usi780p0tc0J93r4W8gLpgUZL5XXA+0EMSBID
         0ourvOyUb6eO/2uNG53Di5o9jMWzUGxpekaVUsu08cfXPo8XSXCJCIc8mY0AsOMspgYt
         YyIPznd1OCghBjb07Gf+rcH8WgNBIy4OZLF/zTha+7BCMe7pUmSY+hKUWuJhd2DV9VXL
         OGOfW+8DXQ0kpqgG+ftVonCH+7Sbgjdq1i4p6KN5gnDMhgsy9+X9NEFYXt2OgDmVLbPV
         B8ODmI9v9pNf4JMtnDW0qTnmdDSfJZwet71IOXZcDbZHEfogcPsmz80WjkafqJzYw40Y
         p6vA==
X-Gm-Message-State: AOJu0YxwXBc7nl1uSi6IslfHjLRVIwwQ9kLNVFjdI4KcidHmfLbzzZ9d
	Gj3fHi4T0fdudirGiTGiOdOIpbeG7jiKt9IV2JZDTxRDTX+HNRnKCd5NlJhp//SFRzHUR+tn/98
	s0SUrgy/DdpbCOudITl6r3HdZQg/8fBEij2ZkJKJhtSqwGRapHWFsocvYQpfjzn8/TmAwBy5iXA
	3ZfAiF2qu1/iQk
X-Google-Smtp-Source: AGHT+IG59ErnM4S2zfoOBS15RGTwePoBaO7smGHj3K/VC/c+VXAmtOqZt2coxkFw1Spi7kbNgzwqwg==
X-Received: by 2002:a17:903:124e:b0:1d3:3357:22b9 with SMTP id u14-20020a170903124e00b001d3335722b9mr3288553plh.139.1702569544406;
        Thu, 14 Dec 2023 07:59:04 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b001d35223d0besm3320799plb.251.2023.12.14.07.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:59:03 -0800 (PST)
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
Subject: [v5, 6/6] riscv: lib: add vectorized mem* routines
Date: Thu, 14 Dec 2023 15:57:21 +0000
Message-Id: <20231214155721.1753-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231214155721.1753-1-andy.chiu@sifive.com>
References: <20231214155721.1753-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_075905_852058_AE6794ED 
X-CRM114-Status: GOOD (  14.48  )
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
 arch/riscv/lib/memset_vector.S   | 33 +++++++++++++++++++++
 arch/riscv/lib/riscv_v_helpers.c | 21 ++++++++++++++
 5 files changed, 135 insertions(+)
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
