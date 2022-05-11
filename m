Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CC9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6JI39bLpTeeX0qys3DVzJ+zmrQijg7hG4MWqF9d/8Y=; b=LsVGpvetCBB0pg
	hqJRXeoVppAgvgDfgsk0f/vycv5t5t6IlN1+VAP75PW/WroO6MwSGrxx8koJN4uY8FsSURyXLaQJq
	Db/7rJSMrDD8BAQXgxc5PBQ2oxO0Sq9dGa3N6iHzzMBH0rJi+IIghyUYf8YVGDf/EObbG7LDOqn4h
	K7Mhic4le7gdJl1+2JWgS893SLeIDSiTax7m23NiJ+yS+5N1yOJJtKUkE+1dNT9v/rFy0MYSugYZM
	jKfjslNrqfAAwkNG4SDy3XwpcLooTvgYXyFQa3SCtANLv0mePZWY7A9iW+BnehQ9rhb9cw+w6phg0
	TUTQkSAd0lx0FK4Rwg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohlT-005xoB-Ai; Wed, 11 May 2022 08:32:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohlB-005xU5-RG
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id bo5so1381588pfb.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=p1pBW1G0xf+nuHQeCYtlJM/ltXiGJIWoD7vDEEsgp4w=;
 b=WDIcU8bjpBGvAlkTDqgBOmYbiNsSiBNbDZF3wLdzgCr6ACi1CJQw5lvUk4mVQ3jZPG
 zqch3k0NX6mq72w13vNYULGE9N43XVtl22wqzxEY7sWjF1DweqWQzYfyb4JuNTyD06Ce
 nszmu2H6sdp+CzvOEl2G8xJB6TV5B9vrP1Xv9B8xaFVrbxJ/8psDZA8wz9Gu7+YCkjg4
 i9P/bxF99NpWssE77t5A5M+KLIo7j4QsVaiIMZ5etgZyqKC28D1JfjSzjcTJYchsQwWe
 gqbSjpTODDEILDVh9tnAwH3ubh1hKeKDnNKyZ110Axd4MCVREtpyvImghTPUWjly/UrS
 G5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=p1pBW1G0xf+nuHQeCYtlJM/ltXiGJIWoD7vDEEsgp4w=;
 b=KwOnXSzcaHkgOT2Wic8azDxf22sQQoWA3z48nt6Qlfi0EwlmKzx+DhFIjnUG69bxXY
 7pAWqTS5LGz1kg3O+tP+HEiP5Dr4N1HipJU5SGQUDiFO2d4AAID3gOEcFRzqFofJFJoQ
 6WE1naNHZjPxBWLRNCPL2V4C9WQV2NfuFxmEOFZ7rPLMbiMkWBDzWFR3ef8r5rMHaEuy
 K7NsrSmsFaECdWQCBqxLIdT8dqmoTjFByn2Wsph7lpcUry+tEV6ze8t99uNBAWT0u3zw
 x7+AXxq2LheX5GlJEuUwI3epzxuExcQWr9yVHn2V1SuVD2L9vVTMVHSmH1FZE23GXQ68
 ahZQ==
X-Gm-Message-State: AOAM533WgUvPuFU3HnIJA+pGPnE2crDX/0rA0fhUJsxv8JxBJof7WUM+
 yE/Ver+4Fc8f9f7YsOruaQpUZ8neJTEyeg==
X-Google-Smtp-Source: ABdhPJyDvWf/WS9fKbB9NiiG/YzFYnTHR8XFEkmyHpLk0Zno8zCPZD4WsMMxgDoffXFPgK1E6als1g==
X-Received: by 2002:a63:8948:0:b0:3da:ec12:1b1c with SMTP id
 v69-20020a638948000000b003daec121b1cmr5526407pgd.598.1652257910737; 
 Wed, 11 May 2022 01:31:50 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:50 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 13/16] riscv: Add vector extension XOR implementation
Date: Wed, 11 May 2022 08:31:23 +0000
Message-Id: <a6ee089f36a53bcec364c52fdf5bcb49108ca27a.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013153_928566_FF31BF92 
X-CRM114-Status: GOOD (  14.65  )
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

This patch adds support for vector optimized XOR and it is tested in
qemu.

Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/xor.h | 82 ++++++++++++++++++++++++++++++++++++
 arch/riscv/lib/Makefile      |  1 +
 arch/riscv/lib/xor.S         | 81 +++++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
new file mode 100644
index 000000000000..d1f2eeb14afb
--- /dev/null
+++ b/arch/riscv/include/asm/xor.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+
+#include <linux/hardirq.h>
+#include <asm-generic/xor.h>
+#ifdef CONFIG_VECTOR
+#include <asm/vector.h>
+#include <asm/switch_to.h>
+
+void xor_regs_2_(unsigned long bytes, unsigned long * __restrict p1,
+		 const unsigned long * __restrict p2);
+void xor_regs_3_(unsigned long bytes, unsigned long * __restrict p1,
+		 const unsigned long * __restrict p2,
+		 const unsigned long * __restrict p3);
+void xor_regs_4_(unsigned long bytes, unsigned long * __restrict p1,
+		 const unsigned long * __restrict p2,
+		 const unsigned long * __restrict p3,
+		 const unsigned long * __restrict p4);
+void xor_regs_5_(unsigned long bytes, unsigned long * __restrict p1,
+		 const unsigned long * __restrict p2,
+		 const unsigned long * __restrict p3,
+		 const unsigned long * __restrict p4,
+		 const unsigned long * __restrict p5);
+
+static void xor_rvv_2(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2)
+{
+	kernel_rvv_begin();
+	xor_regs_2_(bytes, p1, p2);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_3(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2,
+		      const unsigned long * __restrict p3)
+{
+	kernel_rvv_begin();
+	xor_regs_3_(bytes, p1, p2, p3);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_4(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2,
+		      const unsigned long * __restrict p3,
+		      const unsigned long * __restrict p4)
+{
+	kernel_rvv_begin();
+	xor_regs_4_(bytes, p1, p2, p3, p4);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_5(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2,
+		      const unsigned long * __restrict p3,
+		      const unsigned long * __restrict p4,
+		      const unsigned long * __restrict p5)
+{
+	kernel_rvv_begin();
+	xor_regs_5_(bytes, p1, p2, p3, p4, p5);
+	kernel_rvv_end();
+}
+
+static struct xor_block_template xor_block_rvv = {
+	.name = "rvv",
+	.do_2 = xor_rvv_2,
+	.do_3 = xor_rvv_3,
+	.do_4 = xor_rvv_4,
+	.do_5 = xor_rvv_5
+};
+
+#undef XOR_TRY_TEMPLATES
+#define XOR_TRY_TEMPLATES           \
+	do {        \
+		xor_speed(&xor_block_8regs);    \
+		xor_speed(&xor_block_32regs);    \
+		if (has_vector()) { \
+			xor_speed(&xor_block_rvv);\
+		} \
+	} while (0)
+#endif
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..acd87ac86d24 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -7,3 +7,4 @@ lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
+lib-$(CONFIG_VECTOR)	+= xor.o
diff --git a/arch/riscv/lib/xor.S b/arch/riscv/lib/xor.S
new file mode 100644
index 000000000000..3bc059e18171
--- /dev/null
+++ b/arch/riscv/lib/xor.S
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+#include <linux/linkage.h>
+#include <asm-generic/export.h>
+#include <asm/asm.h>
+
+ENTRY(xor_regs_2_)
+	vsetvli a3, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a3
+	vxor.vv v16, v0, v8
+	add a2, a2, a3
+	vse8.v v16, (a1)
+	add a1, a1, a3
+	bnez a0, xor_regs_2_
+	ret
+END(xor_regs_2_)
+EXPORT_SYMBOL(xor_regs_2_)
+
+ENTRY(xor_regs_3_)
+	vsetvli a4, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a4
+	vxor.vv v0, v0, v8
+	vle8.v v16, (a3)
+	add a2, a2, a4
+	vxor.vv v16, v0, v16
+	add a3, a3, a4
+	vse8.v v16, (a1)
+	add a1, a1, a4
+	bnez a0, xor_regs_3_
+	ret
+END(xor_regs_3_)
+EXPORT_SYMBOL(xor_regs_3_)
+
+ENTRY(xor_regs_4_)
+	vsetvli a5, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a5
+	vxor.vv v0, v0, v8
+	vle8.v v16, (a3)
+	add a2, a2, a5
+	vxor.vv v0, v0, v16
+	vle8.v v24, (a4)
+	add a3, a3, a5
+	vxor.vv v16, v0, v24
+	add a4, a4, a5
+	vse8.v v16, (a1)
+	add a1, a1, a5
+	bnez a0, xor_regs_4_
+	ret
+END(xor_regs_4_)
+EXPORT_SYMBOL(xor_regs_4_)
+
+ENTRY(xor_regs_5_)
+	vsetvli a6, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a6
+	vxor.vv v0, v0, v8
+	vle8.v v16, (a3)
+	add a2, a2, a6
+	vxor.vv v0, v0, v16
+	vle8.v v24, (a4)
+	add a3, a3, a6
+	vxor.vv v0, v0, v24
+	vle8.v v8, (a5)
+	add a4, a4, a6
+	vxor.vv v16, v0, v8
+	add a5, a5, a6
+	vse8.v v16, (a1)
+	add a1, a1, a6
+	bnez a0, xor_regs_5_
+	ret
+END(xor_regs_5_)
+EXPORT_SYMBOL(xor_regs_5_)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
