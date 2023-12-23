Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C35C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xaq2TRk3wXbQZSmYt3X3wTn1lW/bK0rQJZnzB7U/D/M=; b=QMpp6itN86PQP3
	7VvogT87d/rFeRg3OwphqPR4JI0TdaG6zD4g03IwA0UKVRtueYd5S9xN9yccAn3dr7pI56H3E0206
	4/vPWUYwP0i6u5sBwW8k/QJ/4nbSdtRXDelu0B4lZxEDLd2iLITy+Z086cB6g57V0Jnoq9S2mja+X
	lrJNnxQTHwT4YfJAKib8aR9iQ7743qqeIqrrt8nF0ZPWOF2QvwcWkK/vm/bnrWGXT0DxRmeC6FqN3
	NNMu7e2DXBwGBRCMjAGgTL89uHagPbsJy2iBwUCVwzgbAs6lmUEHkNNuarLiQZzmEcRlN7UPdCeBo
	XDIUCgfVw84qK7VSX6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGteD-007Luh-0N;
	Sat, 23 Dec 2023 04:30:01 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGteA-007LtC-2R
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:30:00 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-593fa46fd45so1587133eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305796; x=1703910596; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NFnYzFltuLxaA5kymfUv4YQXh/w1s0UKs0KJQeLv+3U=;
        b=LG15DRl8moFYtPmIaqdf+vqsh9P2R58Lgu3o1HcTiDvoSQIrP4gcUi8btR4eoix0Ek
         6d7H4c8nFezcmOdEn83WNEr6BtTVEMTThDH0ayfqTcZK1M9q6UL7tKW71asZ8eHyM+UM
         toj/azNRJ+ULiah6SkRpMVtraxYpI5NpmsNU+O6maMRHhVQ9N1+DB5NzQN7NotffFeMT
         zfu8xAAf9wF9VwCNwKD06xbGIuDbhBxSzCd8UzmrDYgb2/e3HdpGhCe7zxO7KMTjBxwl
         dd7JIdSbbpvT+nL6/1v3n2QE3qgNnT9hO4BPPPX9TxO2dU1WmPR7BPJIbr1kbPuFHovs
         VH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305796; x=1703910596;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFnYzFltuLxaA5kymfUv4YQXh/w1s0UKs0KJQeLv+3U=;
        b=Sbjl4a0+3JI8Tvz0YBD0lLRgB2baVB3yajjMDbdCa1/HYyEnMbrxIV2d4j184k6knT
         6qPeHcgmZpNIbG3lgGGe49QWnHAeADwFvBc+5yTrcBgKEzkirouj7w//HyakLq4ymY9e
         db1MSecsis5MwrN/xsjRoMEKHngOk+YVrwlg4PUF6vlO0QWwsjqomnomEZOIAgMqlIoH
         s24Or/IqXrcVBgTSGUxjDllzGxnInoXKkbzEyESkyoBZ3sQOK2K/Rx9Nh86qSwk1SxVk
         lcf89ikCOs809YrsGbOxRklZhUbj+46k4okqEfkdErKyPhg9OMUDSxcTfWrDVmWaJaeZ
         941Q==
X-Gm-Message-State: AOJu0YxjVaOq12NV7ueDAM4Alz3/qVyG4IWiA4CRnn9mbTDf97vksd46
	jJh9rzFiPkPZJT5834ayXwOCCiwvG41VvM6Dnzb9Yi/mSg4U/skeob3Tl//HSU+5dBef9MO30pG
	ts9POvQudaKQ7wTUFBvjbh8E8ZTKEX/sJ6HxRAUhRwxB1VDNHID+2Zi7mDDCG4agiy4nsJ181CT
	18zcpobFx2bj/EK+6vmb4X
X-Google-Smtp-Source: AGHT+IHOtzusNbmxPsflP0l4pVxtG4GJ8CdLY+2Gx6+BB2pQF8JbzgWb9Y02/R9UPu/bKHvkn0dZIA==
X-Received: by 2002:a05:6870:fb88:b0:204:4351:8bb7 with SMTP id kv8-20020a056870fb8800b0020443518bb7mr2584101oab.43.1703305795877;
        Fri, 22 Dec 2023 20:29:55 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm2623397pjb.33.2023.12.22.20.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:29:55 -0800 (PST)
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
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v8, 03/10] riscv: Add vector extension XOR implementation
Date: Sat, 23 Dec 2023 04:29:07 +0000
Message-Id: <20231223042914.18599-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231223042914.18599-1-andy.chiu@sifive.com>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_202958_794076_2F2C89CE 
X-CRM114-Status: GOOD (  15.31  )
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
---
Changelog v8:
 - wrap xor function prototypes with CONFIG_RISCV_ISA_V
Changelog v7:
 - fix build warning message and use proper entry/exit macro for
   assembly. Drop Conor's A-b
Changelog v2:
 - 's/rvv/vector/' (Conor)
---
 arch/riscv/include/asm/asm-prototypes.h | 18 ++++++
 arch/riscv/include/asm/xor.h            | 68 +++++++++++++++++++++
 arch/riscv/lib/Makefile                 |  1 +
 arch/riscv/lib/xor.S                    | 81 +++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 36b955c762ba..6db1a9bbff4c 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -9,6 +9,24 @@ long long __lshrti3(long long a, int b);
 long long __ashrti3(long long a, int b);
 long long __ashlti3(long long a, int b);
 
+#ifdef CONFIG_RISCV_ISA_V
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
+#endif /* CONFIG_RISCV_ISA_V */
 
 #define DECLARE_DO_ERROR_INFO(name)	asmlinkage void name(struct pt_regs *regs)
 
diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
new file mode 100644
index 000000000000..96011861e46b
--- /dev/null
+++ b/arch/riscv/include/asm/xor.h
@@ -0,0 +1,68 @@
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
+#include <asm/asm-prototypes.h>
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
index 000000000000..b28f2430e52f
--- /dev/null
+++ b/arch/riscv/lib/xor.S
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+#include <linux/linkage.h>
+#include <linux/export.h>
+#include <asm/asm.h>
+
+SYM_FUNC_START(xor_regs_2_)
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
+SYM_FUNC_END(xor_regs_2_)
+EXPORT_SYMBOL(xor_regs_2_)
+
+SYM_FUNC_START(xor_regs_3_)
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
+SYM_FUNC_END(xor_regs_3_)
+EXPORT_SYMBOL(xor_regs_3_)
+
+SYM_FUNC_START(xor_regs_4_)
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
+SYM_FUNC_END(xor_regs_4_)
+EXPORT_SYMBOL(xor_regs_4_)
+
+SYM_FUNC_START(xor_regs_5_)
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
+SYM_FUNC_END(xor_regs_5_)
+EXPORT_SYMBOL(xor_regs_5_)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
