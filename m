Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72768C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461F9214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pl5VHQ3Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QDCO7B55"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461F9214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TDurgI0oRgkVCLkv8nQoosQoBEn13GGAepAzUtSLdCY=; b=pl5VHQ3ZVdKVDNoShSzS6PtdSX
	Q3hQz7b4MrFLx+R1hu2AvJF5CYN4hpdGtetLWrmMh9w9l8r0zuaRxIeFjzv/YmVAKde/qTplo7klX
	vkzqjOr0DTVH8JfFymnuvkeYFMVobK/5+OkNkKQR7WIv+dQDMIwRDLpBMus4Y3kBczJzXeCSjThqD
	XJ2pWYaFpx1QjjNeZGJos0dCjJ9Q+nvYddEyhLrN1wiI0ituXwg0ZMzfRKV5cH/nxmx5CZ0rGpCEo
	bBl3+jT6dsjSSXe9xh48l+6eZ8ZygxGBwlEgOtOdZFYa8zJZwTCG5sXtzSCwlkX2Sr+T4uw63TTJ0
	ZHmTRObA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJXM2-0007on-Ih; Thu, 25 Apr 2019 05:55:30 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJXLz-0007md-56
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 05:55:28 +0000
Received: by mail-pl1-x641.google.com with SMTP id f36so10489730plb.5
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 22:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HBZ81zBR+gNBrVYDn/RnhzWBVHDUFouGqjqPTpdIw2A=;
 b=QDCO7B553id7VW0m8u9bFT3bvHfc7Q/d3qYsilI6ML4MDpT2Bk/FopjPr8rDERWKWo
 TRbydG7pwEipXLJI3PO/9GajqLVGwPVbPpr62dEReDH4B+9sYxhb+awW2nT2YmHkmbHN
 yVCk4kKKhAxNlHu2TH3kcOIFcr24rD7zCd+Q2i3laP3CPQKJkULN1Al/A5/vcKuwdl8E
 jiddrgKZRBaqjfRSFPhqpIYn4ayM1MQhTzgIN/7Jd5dB+x33lByI8/rJF13PUJIPWJRA
 4U0ONriawFhfFCZO/3NMDxqlEByozPYL5uF8/OkXU9GQYzatub8AxEyXgj0gKqHOj41t
 LmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HBZ81zBR+gNBrVYDn/RnhzWBVHDUFouGqjqPTpdIw2A=;
 b=X37khnk6gwVdsYz52E1ySJddbwt/flMukqiQEGPYnLgTnC3FreLjD4hq1kMwnyZlWP
 9Jls8lrUORqS+E+nramD+1eq99mgoEy0KvVO9X7sNZa6Vcf7msNHL2xMuydXf0xn5fCj
 +oESaERSoms6NJKx20PqAZe7Q6IuJfZhXZ6ALr4FiOLk2CKireqp/lQBvTBKIWufMw7r
 OmEkaLwCj1k3L+HFKOd5lZyOC0AgFRNu2+4zI3t8rK0fXnChMNuskIJdE68KAqa1jV32
 HXcRHu5Sua+Ckt2Mf8sRuqdotVMq0mkIwwxniRs7pqXqsmDx4GGUR0gtSi8xUsD0XHzk
 x6eg==
X-Gm-Message-State: APjAAAWI8TqdsctsePUiHxafey58/gHZe6XEbUqAa11OrXm7+K0tc9ql
 xe0mxPJ6viZ8m70Y+cJc1Eedfmtxv/U=
X-Google-Smtp-Source: APXvYqyRMZZOez5DXJgLYq0wcnFea4aQ8P9obv8wbFLkAkDmAAAf+Va8nFbDvZLfso0C2zC3wx55qg==
X-Received: by 2002:a17:902:525:: with SMTP id
 34mr37513739plf.138.1556171726096; 
 Wed, 24 Apr 2019 22:55:26 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id m16sm46332170pfi.29.2019.04.24.22.55.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Apr 2019 22:55:25 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 palmer@sifive.com
Subject: [PATCH 2/2] RISC-V: sifive_l2_cache: Add L2 cache controller driver
 for SiFive SoCs
Date: Thu, 25 Apr 2019 11:24:56 +0530
Message-Id: <1556171696-7741-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_225527_204941_5B0AF6A0 
X-CRM114-Status: GOOD (  16.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The driver currently supports only SiFive FU540-C000 platform.

The initial version of L2 cache controller driver includes:
- Initial configuration reporting at boot up.
- Support for ECC related functionality.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/mm/Makefile          |   1 +
 arch/riscv/mm/sifive_l2_cache.c | 224 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 225 insertions(+)
 create mode 100644 arch/riscv/mm/sifive_l2_cache.c

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index eb22ab4..1523ee5 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -3,3 +3,4 @@ obj-y += fault.o
 obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
+obj-y += sifive_l2_cache.o
diff --git a/arch/riscv/mm/sifive_l2_cache.c b/arch/riscv/mm/sifive_l2_cache.c
new file mode 100644
index 0000000..95f10e4
--- /dev/null
+++ b/arch/riscv/mm/sifive_l2_cache.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SiFive L2 cache controller Driver
+ *
+ * Copyright (C) 2018-2019 SiFive, Inc.
+ *
+ */
+#include <linux/debugfs.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+
+#define SIFIVE_L2_DIRECCFIX_LOW 0x100
+#define SIFIVE_L2_DIRECCFIX_HIGH 0x104
+#define SIFIVE_L2_DIRECCFIX_COUNT 0x108
+
+#define SIFIVE_L2_DATECCFIX_LOW 0x140
+#define SIFIVE_L2_DATECCFIX_HIGH 0x144
+#define SIFIVE_L2_DATECCFIX_COUNT 0x148
+
+#define SIFIVE_L2_DATECCFAIL_LOW 0x160
+#define SIFIVE_L2_DATECCFAIL_HIGH 0x164
+#define SIFIVE_L2_DATECCFAIL_COUNT 0x168
+
+#define SIFIVE_L2_CONFIG 0x00
+#define SIFIVE_L2_WAYENABLE 0x08
+#define SIFIVE_L2_ECCINJECTERR 0x40
+
+#define SIFIVE_L2_ERR_TYPE_CE 0
+#define SIFIVE_L2_ERR_TYPE_UE 1
+#define SIFIVE_L2_MAX_ECCINTR 3
+
+static void __iomem *l2_base;
+static int g_irq[SIFIVE_L2_MAX_ECCINTR];
+
+enum {
+	DIR_CORR = 0,
+	DATA_CORR,
+	DATA_UNCORR,
+};
+
+static unsigned int l2_dirfix_addr_high(void)
+{
+	return readl(l2_base + SIFIVE_L2_DIRECCFIX_HIGH);
+}
+
+static unsigned int l2_dirfix_addr_low(void)
+{
+	return readl(l2_base + SIFIVE_L2_DIRECCFIX_LOW);
+}
+
+static unsigned int l2_dirfix_count(void)
+{
+	return readl(l2_base + SIFIVE_L2_DIRECCFIX_COUNT);
+}
+
+static unsigned int l2_datfix_addr_high(void)
+{
+	return readl(l2_base + SIFIVE_L2_DATECCFIX_HIGH);
+}
+
+static unsigned int l2_datfix_addr_low(void)
+{
+	return readl(l2_base + SIFIVE_L2_DATECCFIX_LOW);
+}
+
+static unsigned int l2_datfix_count(void)
+{
+	return readl(l2_base + SIFIVE_L2_DATECCFIX_COUNT);
+}
+
+static unsigned int l2_datfail_addr_high(void)
+{
+	return readl(l2_base + SIFIVE_L2_DATECCFAIL_HIGH);
+}
+
+static unsigned int l2_datfail_addr_low(void)
+{
+	return readl(l2_base + SIFIVE_L2_DATECCFAIL_LOW);
+}
+
+static unsigned int l2_datfail_count(void)
+{
+	return readl(l2_base + SIFIVE_L2_DATECCFAIL_COUNT);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static struct dentry *sifive_test;
+
+static ssize_t l2_write(struct file *file, const char __user *data,
+			size_t count, loff_t *ppos)
+{
+	unsigned int val;
+
+	if (kstrtouint_from_user(data, count, 0, &val))
+		return -EINVAL;
+	if ((val >= 0 && val < 0xFF) || (val >= 0x10000 && val < 0x100FF))
+		writel(val, l2_base + SIFIVE_L2_ECCINJECTERR);
+	else
+		return -EINVAL;
+	return count;
+}
+
+static const struct file_operations l2_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = l2_write
+};
+
+static void setup_sifive_debug(void)
+{
+	sifive_test = debugfs_create_dir("sifive_l2_cache", NULL);
+	if (!sifive_test)
+		return;
+
+	if (!debugfs_create_file("sifive_debug_inject_error", 0200,
+				 sifive_test, NULL, &l2_fops))
+		debugfs_remove_recursive(sifive_test);
+}
+#endif
+
+static void l2_config_read(void)
+{
+	u32 regval, val;
+
+	regval = readl(l2_base + SIFIVE_L2_CONFIG);
+	val = regval & 0xFF;
+	pr_info("L2CACHE: No. of Banks in the cache: %d\n", val);
+	val = (regval & 0xFF00) >> 8;
+	pr_info("L2CACHE: No. of ways per bank: %d\n", val);
+	val = (regval & 0xFF0000) >> 16;
+	pr_info("L2CACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
+	val = (regval & 0xFF000000) >> 24;
+	pr_info("L2CACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
+
+	regval = readl(l2_base + SIFIVE_L2_WAYENABLE);
+	pr_info("L2CACHE: Index of the largest way enabled: %d\n", regval);
+}
+
+static const struct of_device_id sifive_l2_ids[] = {
+	{ .compatible = "sifive,fu540-c000-ccache" },
+	{ /* end of table */ },
+};
+
+static ATOMIC_NOTIFIER_HEAD(l2_err_chain);
+
+int register_sifive_l2_error_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&l2_err_chain, nb);
+}
+EXPORT_SYMBOL_GPL(register_sifive_l2_error_notifier);
+
+int unregister_sifive_l2_error_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&l2_err_chain, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_sifive_l2_error_notifier);
+
+static irqreturn_t l2_int_handler(int irq, void *device)
+{
+	unsigned int regval, add_h, add_l;
+
+	if (irq == g_irq[DIR_CORR]) {
+		add_h = l2_dirfix_addr_high();
+		add_l = l2_dirfix_addr_low();
+		pr_err("L2CACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
+		regval = l2_dirfix_count();
+		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_CE,
+					   "DirECCFix");
+	}
+	if (irq == g_irq[DATA_CORR]) {
+		add_h = l2_datfix_addr_high();
+		add_l = l2_datfix_addr_low();
+		pr_err("L2CACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
+		regval = l2_datfix_count();
+		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_CE,
+					   "DatECCFix");
+	}
+	if (irq == g_irq[DATA_UNCORR]) {
+		add_h = l2_datfail_addr_high();
+		add_l = l2_datfail_addr_low();
+		pr_err("L2CACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
+		regval = l2_datfail_count();
+		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_UE,
+					   "DatECCFail");
+	}
+
+	return IRQ_HANDLED;
+}
+
+int __init sifive_l2_init(void)
+{
+	struct device_node *np;
+	struct resource res;
+	int i, rc;
+
+	np = of_find_matching_node(NULL, sifive_l2_ids);
+	if (!np)
+		return -ENODEV;
+
+	if (of_address_to_resource(np, 0, &res))
+		return -ENODEV;
+
+	l2_base = ioremap(res.start, resource_size(&res));
+	if (!l2_base)
+		return -ENOMEM;
+
+	for (i = 0; i < SIFIVE_L2_MAX_ECCINTR; i++) {
+		g_irq[i] = irq_of_parse_and_map(np, i);
+		rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
+		if (rc) {
+			pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
+			return rc;
+		}
+	}
+
+	l2_config_read();
+
+#ifdef CONFIG_DEBUG_FS
+	setup_sifive_debug();
+#endif
+	return 0;
+}
+device_initcall(sifive_l2_init);
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
