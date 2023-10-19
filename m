Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF951CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJSSAYNPmACBCn2sE4TEEv371QLzeS3Q/r8lXWNNqMs=; b=4QMkb6Ni/GKLJw
	aCzI0OelxF+IiT8RztB+0XSvovTGJTNvMxTLausMFZXCgnPKOlBQDFwpjxKfXImvyTe/q7KAG8nQw
	qwYdO3sp3ptZkh8WFwDiZEXJGS+mB+mtLxI/oqL8MSCS7CW5qMk+EVk3wuuTcJ9L7KpDTIJCOiaA8
	/yeJrloNYrlCyqwr0EeR7fsti2PVm9bni72nSgvZ8FDlLiU3pZk0g4/yst8wAzvA0sIwZtk7BdAVS
	EDCpAuSXZZhqLN+ZBjAEO/vo6eiAI1pn+gMVeg9XRsWqqZw/0cZqq00qI8s5PmudVtM2dq32ZP/me
	vbLlZdiFaqPVLKsZQg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVED-000EwP-1M;
	Thu, 19 Oct 2023 15:46:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVEA-000EvR-1m
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 15:46:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bf55a81eeaso57988135ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697730385; x=1698335185; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i9NRPfuDspExspcewG3zKAebEn0P1bg8Tb7NM+tntho=;
        b=F271woT4FxQcUjCC8TW2B/j1JgnwkqbySwW8QzD6WNRBMN998u7iW5fBhNA0Cz8cCN
         EZBMVQEDcHnL5xpCPHESbE34PB7PeIc4nTwh18RZWdPHLnJKAiCjb8MbMgoP62+E8oTV
         WHzgnHoBnJqk9PgUaHboDiG9aWM7Ff69O2472h4Ms11pPm+PNz9uxsqRytuWqd2FO3VO
         s9VAH6w1Yv1UwYQIzZCduxxkP8szdiuUhfcQfx9ajgpywGC87aoeG1p2jnAZ0UU1ggQu
         hiFeRW6YxxgA1DoH7MIh0j9fy6RwMfemOsFNdMah8gDGYgn9W/RUApqJ69Y+8oT0rNQJ
         qrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697730385; x=1698335185;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9NRPfuDspExspcewG3zKAebEn0P1bg8Tb7NM+tntho=;
        b=rf/feeyRiBUjqAMNZMZED3wK932l/y9EXgYxnFjzx6bfuwvSvZbMYKO91w2Q3tHYlf
         /ta8Pncvx2NGWAAVnXEoshNIDrYXmT0LjhIuuW/rdo8ZdS4IBG6aUwTOS1OP868pmSi8
         hXtHjhbredtSzhZXi/H0U/+ZSttee6EPXd/bp+QzGLjRSXfQF173HlHmrJgxy5YI78EP
         Hc0bL5LBcSFni/5qraY4QWLcrFOdr9ILi4tBvNF7npMHf6eCNMj/UvfdOVAT51Q3MWsl
         W6uM935+Ks7v03OSCZqJTasMw4zJbSXDf7jYZGch4wesbrJTLR2TZl30y9aC+dPeccLS
         dWXQ==
X-Gm-Message-State: AOJu0Yx32ZYLRk8zFUQNM7Qb0oyzZmDuOEj2eArQPJL+6L91t0vRhrsV
	eGpJmuLXAlhOg5d5/loHawtEl1U+1SrR25mdnxUlGaSgYV8sYDUn+22F1MrlNLewWrnmlK7WxXy
	GKerFHRcMwV8YaXDDSnyDEAoLFQOSG+ai3qxzFC2wXKeSqTErtVsqxE95H6Mr0HtI/L7vodPElo
	FZPOPNv3MkaMgEgLM=
X-Google-Smtp-Source: AGHT+IHkIRc6Djt3dG0oiHpsJjaFf30uvidb0dwXM7Ua+YS3JoEXQX9bmZ0b0m5yDcg3O5mAwDXUQw==
X-Received: by 2002:a17:902:ce91:b0:1c6:2acc:62ea with SMTP id f17-20020a170902ce9100b001c62acc62eamr3189981plg.57.1697730385035;
        Thu, 19 Oct 2023 08:46:25 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090282c800b001c75d7f2597sm2084710plz.141.2023.10.19.08.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:46:24 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v3, 2/5] riscv: Add vector extension XOR implementation
Date: Thu, 19 Oct 2023 15:45:49 +0000
Message-Id: <20231019154552.23351-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231019154552.23351-1-andy.chiu@sifive.com>
References: <20231019154552.23351-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_084626_588492_3EB9BA5B 
X-CRM114-Status: GOOD (  15.40  )
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

From: Greentime Hu <greentime.hu@sifive.com>

This patch adds support for vector optimized XOR and it is tested in
qemu.

Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v2:
 - 's/rvv/vector/' (Conor)
---
 arch/riscv/include/asm/xor.h | 82 ++++++++++++++++++++++++++++++++++++
 arch/riscv/lib/Makefile      |  1 +
 arch/riscv/lib/xor.S         | 81 +++++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
new file mode 100644
index 000000000000..903c3275f8d0
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
+#ifdef CONFIG_RISCV_ISA_V
+#include <asm/vector.h>
+#include <asm/switch_to.h>
+
+void xor_regs_2_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2);
+void xor_regs_3_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2,
+		 const unsigned long *__restrict p3);
+void xor_regs_4_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2,
+		 const unsigned long *__restrict p3,
+		 const unsigned long *__restrict p4);
+void xor_regs_5_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2,
+		 const unsigned long *__restrict p3,
+		 const unsigned long *__restrict p4,
+		 const unsigned long *__restrict p5);
+
+static void xor_vector_2(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2)
+{
+	kernel_vector_begin();
+	xor_regs_2_(bytes, p1, p2);
+	kernel_vector_end();
+}
+
+static void xor_vector_3(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2,
+			 const unsigned long *__restrict p3)
+{
+	kernel_vector_begin();
+	xor_regs_3_(bytes, p1, p2, p3);
+	kernel_vector_end();
+}
+
+static void xor_vector_4(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2,
+			 const unsigned long *__restrict p3,
+			 const unsigned long *__restrict p4)
+{
+	kernel_vector_begin();
+	xor_regs_4_(bytes, p1, p2, p3, p4);
+	kernel_vector_end();
+}
+
+static void xor_vector_5(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2,
+			 const unsigned long *__restrict p3,
+			 const unsigned long *__restrict p4,
+			 const unsigned long *__restrict p5)
+{
+	kernel_vector_begin();
+	xor_regs_5_(bytes, p1, p2, p3, p4, p5);
+	kernel_vector_end();
+}
+
+static struct xor_block_template xor_block_rvv = {
+	.name = "rvv",
+	.do_2 = xor_vector_2,
+	.do_3 = xor_vector_3,
+	.do_4 = xor_vector_4,
+	.do_5 = xor_vector_5
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
index 26cb2502ecf8..494f9cd1a00c 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -11,3 +11,4 @@ lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
+lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
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
