Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40775C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJSSAYNPmACBCn2sE4TEEv371QLzeS3Q/r8lXWNNqMs=; b=QSqF0RQePNgc8T
	PUBbcgaFaPxSsm6cdtEdQd1BefgSugdAGjV3Slh+5GdyPOjDv+YYk1v/mbPPjS8qyCctKE8yep3l6
	+h4I19Xklol2JrcoonvQz8NVHXxQifdkJQEM+rlr86Wcf3c5wp9EMmwWMrxAVpr1w9iv390/oAjz2
	vaoq+mI/nK5LjRYgO2G/ZJ19lTFadfFEpIctpeFz6fG7TMQMF2OLCIYZfcwESpbmNrVE25lhR4MvL
	prJVeu6CWlz1RoutM0hmNTKw5yheWcR3Ey1xns3wur4C3O37pxXsaK2/7wCdB2hdOggc3LB+Zc4Ao
	dowQnYwjoUiTdJT+CkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP40-00EkwM-2m;
	Wed, 13 Dec 2023 13:14:12 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP3x-00Eku2-14
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:14:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ce7632b032so3557621b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702473245; x=1703078045; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i9NRPfuDspExspcewG3zKAebEn0P1bg8Tb7NM+tntho=;
        b=izAb4pIOqnwH0C+fPNqbVoCYozA5GgWjY9jaDc3bXkCUAND05toS7hOFMvv3V8MfA3
         zSCqHvD4TJCUlq90DuvzoTyReo577SEPTk791zRm+mA1nNWU2Wo4ZnCpnxENmZYhQPcy
         gGIWJH90MZC5fwXdbrwAbGqXhKHzDpUXRyca/gTb5LREIfUHIt2CfePBmdI7eBGjKsm6
         Reo3DIshJtprA3rW6jd5shHM7WC74r6Zzf2pZ2CGNqIpvnnlMT7IN+8EoTRbgFhB705y
         0UpWnBBWsd/X8wDHcqqcVvPRqpXrGOpp0YP3Zfa2ftnwv39eTB/pPMUqpjZOaQ5zv1gk
         xVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473245; x=1703078045;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9NRPfuDspExspcewG3zKAebEn0P1bg8Tb7NM+tntho=;
        b=gGiBSRAYreT9sVFD01eUkJwkQ4HwLPGBbw3NHd78GrjHNKGLKRSK+05O8pPZ2PDf4e
         +Z/g3aXW78P+N5PjC2MtRoiFLesUZdxejpS5fo2DaPOB1pz4HkdeYsLpAC4HIcd7JBIM
         +gjbZscvAJ/zYwWYuN6CfuexJtkU9Z4KVtxeKG8Uhmqy86vbjevStTmM98JLfNiQfIiA
         GkSz7frP3B5sSnY8AMRFjKeNe+3lC6rbWdw5M0ZxOXwWIKcxDThP9I9Jqz3F4lFp4X+h
         zUGVY2fHA4lMuCra4IczMMayMgYTctGxfxtNMmmEqJCXGYzV4eMP83GLV4u/YBC8oPBj
         Il5g==
X-Gm-Message-State: AOJu0YwZYPoN/kvUvMhULiz/UMt7KwKqxHT3lL/7x/7+Anig0Uk8n49a
	b2kDff2j9Slfh1vEo18uv+hFYEoK1S/rHEkZCp3tE7OgM4LNSIMVYetuoONYGDrD/xYuAdlsEeG
	iCL4+G8GbACGa128IeRoCaTL8ORyADazYpmyxuBsXHzK84429WFGeaVTGHeUAlGt7dwVK5S73PQ
	d4981Rcjyv9VDJ
X-Google-Smtp-Source: AGHT+IFAP1MVjOOsFtZBK1jpvI4x5jvPmvTFyEZdjxxtOSRDueQA6XDecxTMiYfk9bfjHKQcim5Xkg==
X-Received: by 2002:a05:6a20:e113:b0:18c:f9a7:6f66 with SMTP id kr19-20020a056a20e11300b0018cf9a76f66mr3951037pzb.30.1702473244325;
        Wed, 13 Dec 2023 05:14:04 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id fn7-20020a056a002fc700b006cecaff9e29sm9928601pfb.128.2023.12.13.05.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:14:03 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v4, 3/6] riscv: Add vector extension XOR implementation
Date: Wed, 13 Dec 2023 13:13:18 +0000
Message-Id: <20231213131321.12862-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231213131321.12862-1-andy.chiu@sifive.com>
References: <20231213131321.12862-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_051409_371152_665FD818 
X-CRM114-Status: GOOD (  14.66  )
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
