Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA4AC4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3v5yrWuNAGuxLEjG6XLbGU0RxGc8PQKDgYhBexJxEF4=; b=eQNSyzU0L5mY8H
	kpC24TiKNnFT4z9aQjB5OrqV2R3bRLCxVvVcOZnkI9GCaGHrdAVAZhoLeSmODjJFl3d8i655/vTAP
	6gAygTlVhL6X5/7UzXa4vi1xB8kjevXRn8+4dG0NUq+hlbK6FMgqOHDjpcJDCAxr6Y9xdD4WogTtx
	y2oqmP1u1x+DekXJYRfHgiFpoiYEsNWuWnbenHrLAiuyjGtgYQx0HA1OICEN2IKQStTfBmhRJO+dZ
	sigOCTYvJoj3Fvg76D/P3Ys6T0uXU70BTIPTEjfLWVX+VOt17Zspo44CXVF9593dIBTwoM/jpOR5O
	g7ShBSOKXC0jQvsLDWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP4G-00El4O-24;
	Wed, 13 Dec 2023 13:14:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP4D-00El2U-1a
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:14:27 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ce94f62806so3747037b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702473264; x=1703078064; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjCT+w+87frztlza5cPJ8CGdORAwqhWad8QuF88LbdQ=;
        b=kPs8/seOX4AzPjlDPrp2clpOhpM9l7aPcjqNYnJAMxSRqSu1rw0pZ7MI22ItLlE76R
         VJzBjav9A3u2vTbzTCY3hwnIXCSU9BleR89f7h5FA7+0O/biHGERvMMWll8KCuKu9SoO
         /UYhcMAXHrvT1b27diOTmAqQSbZ2xSJsa1IkZBGSB232cCFWplBRE8CCT387gWb0Bh56
         OAAzE2BLr0yTc3C89QNtRRVje/XcimlcMWAC/YSeGRFmc8VX8sFHRTmg+4nYbT9v6RcD
         YZY73tMZkJd5XWxSOg9QwgErLCU4WXoZgd9WSZ5z9PVrGaPW6REljgL5la/SiG3QojlJ
         kSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473264; x=1703078064;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjCT+w+87frztlza5cPJ8CGdORAwqhWad8QuF88LbdQ=;
        b=KUBTZ/H5ySmmn01d0JQ+V+hid+cofN17iNFh1/koGwNRD6R64o8iBkAS2wi/F23hRV
         iC+LkGXAMo1LnvafDokAYcFzAfkrKmpOdPsGJIYti6KOdIq0JmdB5WOd3IHavBjLMo4Q
         hnYfIj191k+MOkwz6P9hLra97XnR2OdQymZbM41hnEKd6XgDjqRl5brG/A+rS26X0Wja
         DEFZf3/rCxTrpByNNR3WatF3YlJoVI4ElpZfMb+QwkriqwprHBKdvTIPrrnMTgzXlLsw
         So8xyhxG3WgqrFv/a3aumoBOvuPeKL28HOyvVK1JJtbfQrJ9A0dHKQYs6+0Kf4rLXVck
         8v7A==
X-Gm-Message-State: AOJu0Yxk0k76LSNQHk9KcxnfDuyONt97PeUAlze949L3d3Oaa53WZWWb
	WtADN6ONzU7LZX0ujzU80nkKYJCVNUTtiIp11KGfDHrEA11OeQ/TyLEaBEC4tNmukghYh5MG4gc
	c3ccy+6NDyaeOuYR0oh6QuAMKGu1KrtTosb7fH16eh0f+y9I74f+7OqBQIcdGyO3u8xe0QAa0fD
	jPbQDTaMRv9/NK
X-Google-Smtp-Source: AGHT+IH3OPwQlgI8c2Thox7GtsXF5w3m5wvasAU5KVwnwS62Fgocve0nuMPBTZ9yUBdCUO7j1I/SKQ==
X-Received: by 2002:a05:6a00:80a:b0:6bd:b7c5:f776 with SMTP id m10-20020a056a00080a00b006bdb7c5f776mr4977765pfk.8.1702473264135;
        Wed, 13 Dec 2023 05:14:24 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id fn7-20020a056a002fc700b006cecaff9e29sm9928601pfb.128.2023.12.13.05.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:14:23 -0800 (PST)
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
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bo YU <tsu.yubo@gmail.com>
Subject: [v4, 5/6] riscv: lib: vectorize copy_to_user/copy_from_user
Date: Wed, 13 Dec 2023 13:13:20 +0000
Message-Id: <20231213131321.12862-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231213131321.12862-1-andy.chiu@sifive.com>
References: <20231213131321.12862-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_051425_529518_D4064200 
X-CRM114-Status: GOOD (  19.95  )
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
Changelog v4:
 - new patch since v4
---
 arch/riscv/lib/Makefile          |  2 ++
 arch/riscv/lib/riscv_v_helpers.c | 38 ++++++++++++++++++++++
 arch/riscv/lib/uaccess.S         | 11 +++++++
 arch/riscv/lib/uaccess_vector.S  | 55 ++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S

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
index 000000000000..d763b9c69fb7
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
+size_t riscv_v_usercopy_thres = 768;
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
index 09b47ebacf2e..b43fd189b534 100644
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
@@ -12,6 +14,14 @@
 
 ENTRY(__asm_copy_to_user)
 ENTRY(__asm_copy_from_user)
+#ifdef CONFIG_RISCV_ISA_V
+	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	la	t0, riscv_v_usercopy_thres
+	REG_L	t0, (t0)
+	bltu	a2, t0, fallback_scalar_usercopy
+	tail enter_vector_usercopy
+#endif
+ENTRY(fallback_scalar_usercopy)
 
 	/* Enable access to user memory */
 	li t6, SR_SUM
@@ -181,6 +191,7 @@ ENTRY(__asm_copy_from_user)
 	csrc CSR_STATUS, t6
 	sub a0, t5, a0
 	ret
+ENDPROC(fallback_scalar_usercopy)
 ENDPROC(__asm_copy_to_user)
 ENDPROC(__asm_copy_from_user)
 EXPORT_SYMBOL(__asm_copy_to_user)
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
new file mode 100644
index 000000000000..98226f77efbd
--- /dev/null
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -0,0 +1,55 @@
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
+#define pDstPtr a4
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
+ENTRY(__asm_vector_usercopy)
+	/* Enable access to user memory */
+	li t6, SR_SUM
+	csrs CSR_STATUS, t6
+
+	/* Save for return value */
+	mv	t5, a2
+
+	mv pDstPtr, pDst
+loop:
+	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+	fixup vle8.v vData, (pSrc), 10f
+	fixup vse8.v vData, (pDstPtr), 10f
+	sub iNum, iNum, iVL
+	add pSrc, pSrc, iVL
+	add pDstPtr, pDstPtr, iVL
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
+ENDPROC(__asm_vector_usercopy)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
