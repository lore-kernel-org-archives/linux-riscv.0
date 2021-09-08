Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FE4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB38761153
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB38761153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SaOwu5aHt8b5iXB76guT58NB7M91Ny+iWPzMZRnFhcU=; b=GHsyujhvxLoAT+
	2qbxX6es/Mly8IzN7OSzptCHLH1o/7zf2KMXAfpJ6PeGf+SO4h73dziT5UC7sr7rHN+nsRMNJhhi3
	nkq8mj7gU87U94qEWZQgbxTBKgGHBgwwtuzSWRFb1acLD9nYjWnY6RZVPjPXdHHBz6CcVvGHzLYZ3
	R5r2o/cN/op0f9G9ujifxH9gl/Jre0kAuDz0yDW8WF1qGkkk6jY30FvfcyCrvgjQAq4j7BqDm68xc
	u/TuYEI5bDi74A9A6vU5n4ygsgpqsSMB4TK+Szf57a1jq12WB3v757ucMkJ6a4vgI2LIum+m5o3ob
	KmfZZetDwDD9jF45zEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1eZ-007J1U-4R; Wed, 08 Sep 2021 17:46:31 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1e4-007IZz-8K
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:46:01 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so1873357pjr.1
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bYEb93v2edJxduQ1tKdJAFizc1jWHNKcldlmNIUxJJc=;
 b=Fc+eGN/TbPbgtYCV0XIKvvs4j8YfYuqog4Bo8ySp4UCX+N2thheP3GvjOknBdpETOR
 1n1Fokqrqg7amJioOSqOCphpC8VegHsVhd8bKiyIbjVt1Khk9o3JfLGVahl43LhHGy3G
 Dtp5Cz1Omu9YKMJe8hDKC5Ehp7R7JpwwYZEtzAHulkVyZ6URgTnYua3F/ktfOFrXm2aE
 CwNkE/+MEINnEtchw02Um6ms0WYA+WLzMP/P0etL8YyoUyhXj+s/m0Iy+7jrSR17ymep
 9TgT0Ws4OO87Sn/Zw8c65/9OuTYVXZon8AVspXtkjk+b7NlDokCKid9EL5GSOlbBJ1P8
 ltgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYEb93v2edJxduQ1tKdJAFizc1jWHNKcldlmNIUxJJc=;
 b=0i43hIBjkWeW5CvGH4rlrFDlt+RCjV2Nv6UQvoDd/Rq853Ao/lc/8/Vt4oo10G4Y2I
 RFTqLIAFKXFSQEVLtcIoSPCToydtbpdDYdRhsKo3p+DPXKIXJNCRZjk52wyEjhEyXySI
 2cbtpvDSrJkb8FVUqrwYwir+Pjcfb44yXAA0pqx2s11MkOXaPWTUUFveoC+dWl+ilfxa
 IWl0xUkgFZXToYUiVKW1wd+kKMsvu3ItcdPveMxdsC4u4bJgupMJocgOePD/M9RZ5zxF
 vQ4au3qe3lPmL0NnduEUpb509JcceJ1EaS0Sa+4rtIe8zubwzkTuy0G0d7BvFSGBv/ql
 QtGQ==
X-Gm-Message-State: AOAM5334x1hHhCafbo9mDv6OSwARdyqdqEMUUc+D/tzxlBZniJjWztRo
 1Cz3hSWRYQG6jnN7HDLuLKQdw6fEEb2jGA==
X-Google-Smtp-Source: ABdhPJy4fkxyLd5n51UTYMDmSAtKZcR/1z+AtxWJY8nwKCMXlRZc/PCB2QyS1yrxUdmEFh/Lv5Touw==
X-Received: by 2002:a17:90b:1902:: with SMTP id
 mp2mr5443716pjb.4.1631123159339; 
 Wed, 08 Sep 2021 10:45:59 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:59 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 15/21] riscv: Add vector extension XOR implementation
Date: Thu,  9 Sep 2021 01:45:27 +0800
Message-Id: <33c485ee595aff1e19a0e43074da59779f58d105.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104600_365696_A8118253 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch adds support for vector optimized XOR it is tested in spike and
qemu.

Logs in spike:
[    0.008365] xor: measuring software checksum speed
[    0.048885]    8regs     :  1719.000 MB/sec
[    0.089080]    32regs    :  1717.000 MB/sec
[    0.129275]    rvv       :  7043.000 MB/sec
[    0.129525] xor: using function: rvv (7043.000 MB/sec)

Logs in qemu:
[    0.098943] xor: measuring software checksum speed
[    0.139391]    8regs     :  2911.000 MB/sec
[    0.181079]    32regs    :  2813.000 MB/sec
[    0.224260]    rvv       :    45.000 MB/sec
[    0.225586] xor: using function: 8regs (2911.000 MB/sec)

Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/xor.h | 74 ++++++++++++++++++++++++++++++++
 arch/riscv/lib/Makefile      |  1 +
 arch/riscv/lib/xor.S         | 81 ++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
new file mode 100644
index 000000000000..60ee0224913d
--- /dev/null
+++ b/arch/riscv/include/asm/xor.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#include <linux/hardirq.h>
+#include <asm-generic/xor.h>
+#ifdef CONFIG_VECTOR
+#include <asm/vector.h>
+
+extern void xor_regs_2_(unsigned long bytes, unsigned long *p1,
+			unsigned long *p2);
+extern void xor_regs_3_(unsigned long bytes, unsigned long *p1,
+			unsigned long *p2, unsigned long *p3);
+extern void xor_regs_4_(unsigned long bytes, unsigned long *p1,
+			unsigned long *p2, unsigned long *p3,
+			unsigned long *p4);
+extern void xor_regs_5_(unsigned long bytes, unsigned long *p1,
+			unsigned long *p2, unsigned long *p3, unsigned long *p4,
+			unsigned long *p5);
+
+static void xor_rvv_2(unsigned long bytes, unsigned long *p1, unsigned long *p2)
+{
+	kernel_rvv_begin();
+	xor_regs_2_(bytes, p1, p2);
+	kernel_rvv_end();
+}
+
+static void
+xor_rvv_3(unsigned long bytes, unsigned long *p1, unsigned long *p2,
+	  unsigned long *p3)
+{
+	kernel_rvv_begin();
+	xor_regs_3_(bytes, p1, p2, p3);
+	kernel_rvv_end();
+}
+
+static void
+xor_rvv_4(unsigned long bytes, unsigned long *p1, unsigned long *p2,
+	  unsigned long *p3, unsigned long *p4)
+{
+	kernel_rvv_begin();
+	xor_regs_4_(bytes, p1, p2, p3, p4);
+	kernel_rvv_end();
+}
+
+static void
+xor_rvv_5(unsigned long bytes, unsigned long *p1, unsigned long *p2,
+	  unsigned long *p3, unsigned long *p4, unsigned long *p5)
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
+extern bool has_vector;
+#undef XOR_TRY_TEMPLATES
+#define XOR_TRY_TEMPLATES           \
+	do {        \
+		xor_speed(&xor_block_8regs);    \
+		xor_speed(&xor_block_32regs);    \
+		if (has_vector) { \
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
index 000000000000..de2e234c39ed
--- /dev/null
+++ b/arch/riscv/lib/xor.S
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+#include <linux/linkage.h>
+#include <asm-generic/export.h>
+#include <asm/asm.h>
+
+ENTRY(xor_regs_2_)
+	vsetvli a3, a0, e8, m8
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
+	vsetvli a4, a0, e8, m8
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
+	vsetvli a5, a0, e8, m8
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
+	vsetvli a6, a0, e8, m8
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
