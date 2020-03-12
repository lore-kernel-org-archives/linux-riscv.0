Return-Path: <SRS0=jpEU=45=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF627C4CECE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 05:11:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA9DC20737
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 05:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Im+GAKs7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jzhyhUWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA9DC20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCTFBYGMKaKoaSLULeobbE2zcBlUs+Iri4hZo7fP5lQ=; b=Im+GAKs7lSvFtk
	pOYQZ01HBfVOwSyKxF0UwFtFbXC5zNHs238AIqZzBdaR7/1Cu5ldLf1zHn9WEgrCpdm11yvTeRjG9
	mW740q/dy3Z/dy2K2wXShulMKWsO4i6SPSFvnWb5q+4Rdh3T584rohDEoYopBPyfdG0BoBL4GTErc
	ZAoAwAs+GG5xX2z8AA66QiuA9x+bPS83jRiixHiV3wBXH5wqGs5o2WjZIU+qLHooLWxtflqBXPlP+
	ny7wOC+vEjYBrsG0UMcLZzuSA/F3sHofPOOZHF/OZGaoQxCEoKJRpMUv6mWqlw5eoheXy90muYcR9
	MlgoZ0eIqdiGrX0NBbRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCG7s-0000Cp-JX; Thu, 12 Mar 2020 05:11:20 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCG7m-0008Vc-4z
 for linux-riscv@lists.infradead.org; Thu, 12 Mar 2020 05:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1583989874; x=1615525874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+lTDu/+CUwlC3+GlWJY9X6Dj5Os2gcPlhaWzDWjb7E=;
 b=jzhyhUWLOYtpX5BjbclpIzH8TW7DMqTaocuHI5PPaOwabom/lMFr79Fs
 oY78m4UTW2rRqshJoY4dW6jFZB8aJpr8ll6bLz4BzNiBuGu5AGHCLNFkk
 nn+75VQwkV5sOpvRbSUClh8/alNXI/219rjGfPxWWWUUuXo7A1YuYD826
 MPp3eQU6Nh9VxUh6a8smDTy0BayRrbyQD67vrIamQtXrjfK2zEW0knxOm
 T3/oujqpH47qNJyYZDnWAMCrzhZkBgutK/6MjQH5W8ZAbU4/8MBe1P862
 zbtBGO6cxAb0tOG6P+P/4Guq0ZkdM4PBm0oY7GBsy0CHbezzLljDatUYn Q==;
IronPort-SDR: fDbvCloZMIfV4SRKjgrWw0yFjDNR4Vw4ETli3qn1tBte8X0NJ/ZMBwBteH4HnfneOJp7qYXBZC
 HyySmsVtDQcO65oo0CIOmRcudGJHNTlhxziFVwqaje7WRJ/z/DUHEWw4Hn6/nbAzqGNigJACTd
 00DnMWgvc2OLmXlIY926vglm9/3q589cRPdHZcDqVUNwWdKNwRL3GWoKSLMDSblTrdo2Hu2zGQ
 f92eOqG70zMGhnSSzWIww1sIrQtNibBGhb1TRxblSZc6XSKyAtTYoa0d5gODqk+2qH+UVF8ucH
 R3s=
X-IronPort-AV: E=Sophos;i="5.70,543,1574092800"; d="scan'208";a="133718973"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Mar 2020 13:11:12 +0800
IronPort-SDR: HPgzTTMU6HUU0oS0eF0Kp3vhAjyYzcXxPVFzTCeOvb1u2sTl39cjS18Lz4WJ5OIeJHvoRw97hY
 puIz9Bbj5g3ljjxlbCELst+uj3NhOg11khlE67MiXzmQQGgHaMzi0A4+dLYJKZcv5dZqhB5b2b
 NHtF9dayFMgiUOZKhgnAXyVFcxOUbUYGpaFMrTqBRnHuL3r8x2ABqtY7NyNCvAf0N9ibXV9Oqz
 MQcGSzb4wFa59VfaGctKr6ONUzH3uMQby1IgBvgKfangQS/3GmrPil6R9x9x++qQcTQVCQyUjh
 dZuzSh2jg4Qy8BxLg/STowUz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 22:03:12 -0700
IronPort-SDR: 2AU80hk70b1DmVD43iXSbW9mx/5dcYRxYM/YFQo+2FV8DwWudTI+FhEl9hLC/o+TuEm7Xq68o+
 jsxngWIEAWF+2fyOrxqYBPgBNrX0pI17zhxnqgb2S//I01nzsjAfLJF2SH1vUQG0VGYnVUZU+0
 j762UwMHMVx8LJ8jURtJbCmehtp/+f2n8Bv6gn0oLl0zJpElQV4W2Q8QejHH1aPdYElbnLuupf
 3z6XG5dpoBjys2V+BVJiqz7RRPAu9t4QEu26TsonvZKRSQoxc/X0N2D84Xq1ilVkcYGcGJv+3f
 F68=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Mar 2020 22:11:11 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 3/9] riscv: Add SOC early init support
Date: Thu, 12 Mar 2020 14:11:01 +0900
Message-Id: <20200312051107.1454880-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312051107.1454880-1-damien.lemoal@wdc.com>
References: <20200312051107.1454880-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_221114_253274_189E7320 
X-CRM114-Status: GOOD (  17.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add a mechanism for early SoC initialization for platforms that need
additional hardware initialization not possible through the regular
device tree and drivers mechanism. With this, a SoC specific
initialization function can be called very early, before DTB parsing
is done by parse_dtb() in Linux RISC-V kernel setup code.

This can be very useful for early hardware initialization for No-MMU
kernels booted directly in M-mode because it is quite likely that no
other booting stage exist prior to the No-MMU kernel.

Example use of a SoC early initialization is as follows:

static void vendor_abc_early_init(const void *fdt)
{
	/*
	 * some early init code here that can use simple matches
	 * against the flat device tree file.
	 */
}
SOC_EARLY_INIT_DECLARE("vendor,abc", abc_early_init);

This early initialization function is executed only if the flat device
tree for the board has a 'compatible = "vendor,abc"' entry;

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/soc.h    | 23 +++++++++++++++++++++++
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/head.S        |  1 +
 arch/riscv/kernel/soc.c         | 28 ++++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S |  6 ++++++
 5 files changed, 59 insertions(+)
 create mode 100644 arch/riscv/include/asm/soc.h
 create mode 100644 arch/riscv/kernel/soc.c

diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
new file mode 100644
index 000000000000..9b8c332cbe76
--- /dev/null
+++ b/arch/riscv/include/asm/soc.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef _ASM_RISCV_SOC_H
+#define _ASM_RISCV_SOC_H
+
+#include <linux/of.h>
+#include <linux/linkage.h>
+#include <linux/types.h>
+
+#define SOC_EARLY_INIT_DECLARE(compat, fn)				\
+	static const struct of_device_id __soc_early_init		\
+		__used __section(__soc_early_init_table)		\
+		 = { .compatible = compat, .data = fn  }
+
+void soc_early_init(void);
+
+extern unsigned long __soc_early_init_table_start;
+extern unsigned long __soc_early_init_table_end;
+
+#endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 97d0c35f8b37..e4a22999dbc6 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -10,6 +10,7 @@ endif
 extra-y += head.o
 extra-y += vmlinux.lds
 
+obj-y	+= soc.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 85f2073e7fe4..52ed11b4fda6 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -131,6 +131,7 @@ clear_bss_done:
 	call kasan_early_init
 #endif
 	/* Start the kernel */
+	call soc_early_init
 	call parse_dtb
 	tail start_kernel
 
diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
new file mode 100644
index 000000000000..0b3b3dc9ad0f
--- /dev/null
+++ b/arch/riscv/kernel/soc.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ */
+#include <linux/init.h>
+#include <linux/libfdt.h>
+#include <asm/pgtable.h>
+#include <asm/soc.h>
+
+/*
+ * This is called extremly early, before parse_dtb(), to allow initializing
+ * SoC hardware before memory or any device driver initialization.
+ */
+void __init soc_early_init(void)
+{
+	void (*early_fn)(const void *fdt);
+	const struct of_device_id *s;
+	const void *fdt = dtb_early_va;
+
+	for (s = (void *)&__soc_early_init_table_start;
+	     (void *)s < (void *)&__soc_early_init_table_end; s++) {
+		if (!fdt_node_check_compatible(fdt, 0, s->compatible)) {
+			early_fn = s->data;
+			early_fn(fdt);
+			return;
+		}
+	}
+}
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1e0193ded420..32b160942f40 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -24,6 +24,12 @@ SECTIONS
 	HEAD_TEXT_SECTION
 	INIT_TEXT_SECTION(PAGE_SIZE)
 	INIT_DATA_SECTION(16)
+	. = ALIGN(8);
+	__soc_early_init_table : {
+		__soc_early_init_table_start = .;
+		KEEP(*(__soc_early_init_table))
+		__soc_early_init_table_end = .;
+	}
 	/* we have to discard exit text and such at runtime, not link time */
 	.exit.text :
 	{
-- 
2.24.1


