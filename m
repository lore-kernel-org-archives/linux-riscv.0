Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288A7C001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQmlCoNoNBMgiByf9QSeuKVkUbIFjUN/W9IQnWcNihc=; b=4HoX1oh+eMa0uk
	Q8BgEho8ibJsJ/LNIpjbHOZnywVnHsoAqa+LSOJrJivA6JA0MAwc2uhWCIQQ5qX9l/G4f6J2tWGlv
	7bOIB0Dm3Fpp2o9f+4JJAtmT5S7wHwDRLsDt7US86k2jJIhokrubJ+4zxiZ7Caw3vNBbUPrlwrB1p
	J5+/M2M+B74GRtMphyiu5N1Sf3xGRFXRlgZVN9UNz8BBjPnwonovq1aSQ+mQg20EW4y5yC9E3f/GX
	9dt2MS5VdkRenvKX3KyqNJPgxQtrrtM1P7SROs6JcQc/CEIPbFmyrBy5GcrsgP2GBYuoQnh89btRP
	aOl+QtHLyVv+Rdh5fDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglj-008zdq-21;
	Sat, 15 Jul 2023 15:01:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglg-008zcq-0s
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 15:01:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-666edfc50deso1814474b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689433266; x=1692025266;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+km7VpAaR7aHNOC6jttnFLPGVHZYCDtVJYd/spo1/P8=;
        b=OBjNNQGEwB1iuhHQLflfF0ssRBwollQ0UOiHp2W50BNKJBBzwuteNEsR+hWc9+zxPl
         +oM6NNX+1yTeibVPtgC9OJRW2OrA+fcCBfcXHCfJimJgj7iVCKzsJr2g2roxdPZjhrVj
         3EKQe9X8s/PabL3gH+E0J5Ql4rak/scCkYpOH6bj4jLxFKgOkPaf9g7oQOEF+Dm0Rnib
         WN/ZC4S/qbxGjoqgmCfPe7GDcGUHRkCNtw4OHA9nifNqmEL0NLYQ8QetWRaYrn89Q6ct
         l0koygYWxbHRCiIMzfMM7OXl6FMPvFOaKEa6vAJnEX+upySJ/JHnqH8WKW5oclgJyfdI
         cZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433266; x=1692025266;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+km7VpAaR7aHNOC6jttnFLPGVHZYCDtVJYd/spo1/P8=;
        b=aYjx/gI1B4Sw4M7O7dhyPu6UL2KnM21LJfxOoQU0irb2L30xeL1+FemeIwJ2dsTIvl
         ED9ODTzh61Pd77V3GekQRy3xFaxPngIE+FIGhdDD8Ssc/A4dl8yMtA03LBBeLkec1Zlz
         0gpxyJYLgoJwAtyclltb29zD20qJiVcHZ78uYx0U7M1p5ZJNFgNBJ1ktxOynk8T8PIR/
         b4tZsls6PX3WWFm+yC8XH5IpOansREFJlee+1zLmSq770lRpuQrhjtRtcRDKwBlwz7P9
         47YXJ9UzQFbP8DtR7b3oWB9s/d0GK6unWh/X/Fo1Pdh9flVvLX05oWxfgT8L3vWm0Fcx
         2cTQ==
X-Gm-Message-State: ABy/qLadVOg1dUVLntS7wJ/NL5/FsZCkYINcADIJCaoymzdYUgZGJa10
	+GSkgS/6jKzG0r5I2GFhCiVw7yN3bbKr/yA8TXCM4faS3C7eH8OAV2EQKlHmecS9WSTmWBmviX4
	bOFN8XJQtXMpxPqSOYf/dSpBI9ECKZ4P+RxVP0hE0W3bAHOu2GzJ5X2LjM6JIfNv9p1Wzw0cFyT
	v/yL9T42/J3WlY
X-Google-Smtp-Source: APBJJlEo6tfhpeWSveX0qSiMjipd2GDcZDYTR3KmhsxO4GyI20r0Q0stNft2lFfCkPwal8gDo2YpBw==
X-Received: by 2002:a05:6a20:6a23:b0:134:135c:5a23 with SMTP id p35-20020a056a206a2300b00134135c5a23mr2878051pzk.18.1689433266374;
        Sat, 15 Jul 2023 08:01:06 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id a28-20020a63705c000000b00528513c6bbcsm9356535pgn.28.2023.07.15.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 08:01:05 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v1, 3/6] riscv: Add vector extension XOR implementation
Date: Sat, 15 Jul 2023 15:00:29 +0000
Message-Id: <20230715150032.6917-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230715150032.6917-1-andy.chiu@sifive.com>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_080108_318213_51D4E1DF 
X-CRM114-Status: GOOD (  14.63  )
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
 arch/riscv/include/asm/xor.h | 82 ++++++++++++++++++++++++++++++++++++
 arch/riscv/lib/Makefile      |  1 +
 arch/riscv/lib/xor.S         | 81 +++++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
new file mode 100644
index 000000000000..81b8837fa161
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
+static void xor_rvv_2(unsigned long bytes, unsigned long *__restrict p1,
+		      const unsigned long *__restrict p2)
+{
+	kernel_rvv_begin();
+	xor_regs_2_(bytes, p1, p2);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_3(unsigned long bytes, unsigned long *__restrict p1,
+		      const unsigned long *__restrict p2,
+		      const unsigned long *__restrict p3)
+{
+	kernel_rvv_begin();
+	xor_regs_3_(bytes, p1, p2, p3);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_4(unsigned long bytes, unsigned long *__restrict p1,
+		      const unsigned long *__restrict p2,
+		      const unsigned long *__restrict p3,
+		      const unsigned long *__restrict p4)
+{
+	kernel_rvv_begin();
+	xor_regs_4_(bytes, p1, p2, p3, p4);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_5(unsigned long bytes, unsigned long *__restrict p1,
+		      const unsigned long *__restrict p2,
+		      const unsigned long *__restrict p3,
+		      const unsigned long *__restrict p4,
+		      const unsigned long *__restrict p5)
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
