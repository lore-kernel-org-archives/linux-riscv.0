Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113E6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mE6rWn5dZBL2DPJp91lhrMlXzGfURZfiWkUWOgF7yY=; b=ZLIISvJjSS0PDq
	vbI13Ikbw3BZzGsrzIUW7Z6ZIB35QlpytPHV2s6q+nSd3xppxCUltpe1epvS1cvEmDNHACuG81nFG
	WighdOZk1OETYEmNd0eO6HkS0Rci2Ad1+IvC4EpMNm8Os5LDMvmrD7aiiVUJjMMukuK06rgf+MFZq
	GEGec+NRtYr62QVFOhlA7j1321C0RnrbWlRC2Lvvh9Nw5XF//X/ya8/+qmLTkReZ62akJuSbh8qJU
	ByrJWnX1XUJ006sS1CwwfDymjJ7JOPwC7fO7JqMl2yL+l6v263BFnRr8tHRpDfHKOkCJ+iRRu7gAr
	ulzZU+Cq+MMfXX56kd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3G1T-000CPx-RI; Mon, 20 Jun 2022 11:56:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3G1R-000COq-B3
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 11:56:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id p14so4350705pfh.6
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rI0zAiF6+xouFdkf88WxUsEVQ+mvGqHQih04lexR5nU=;
        b=n1R4AymCtdjuMbvvEWoz/d9pnN3llJKP2G7oN4iZfCbG7/Y0GGXIzu6B1PssT/sF/d
         CWsYvD6uglFULOhQdMIaOXecbMrj6pXPakW4qweTQCkmeC9zn8lW70vQp6sgr5FR9dcm
         X6yQyWVqwwZJAwVDUYgCXeN5Q6arTIdHxRaquhWKB9qWoTjswJuOkEpGynPqbYXrqZLT
         4b2WfwwmuarH2Y9DoxINyGvy1pqUg+LZyGsufMWArb3aNSJYeGCQRD0nNWun/WVaUbhG
         UH7Ci/jtHZgZO1Xe/UBBrQ0Zvw/rP4jd7TlsbeLDv04g5JFoU9H1ElEQe4nxhDqZAgpT
         yykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rI0zAiF6+xouFdkf88WxUsEVQ+mvGqHQih04lexR5nU=;
        b=cJnDaVy8leFExzTlMSb8qNqITaVS0hOfAqpq74QETsOH0W6WJEDPoxsXk12ctgts2O
         MySbk8t/9v15ffumwdub1DxE3fye49WbsycQdwp44W11DFJFatv5VT+0wgLJWdICIROC
         8kYRiRKi1IP5HR6S+nv9aWhUj4kLVAnpR3mtssEx/SNprq7DdksaTo/ZTGUp+K7h+u0W
         9BwJjRma6sQmwGgcI6DaEUfgvcszsdHSn8WE+ZqoQKJL5uBoANe+yCXpS2zprbOAbYfX
         0uc1Vm7o45dlSngasGpZaqlOwpIY9+KD0huj3IJ0vlOKAPanwnkc5WMZdZZtsE7DZfml
         uIWw==
X-Gm-Message-State: AJIora8YQPnNw+D/VAenZoYbJzo1So7Wh2PMIXnNLEwRIeYxBcK9PVlF
	1Jsp0EK0oKIxCo8cdlCP3ddXRg==
X-Google-Smtp-Source: AGRyM1vC//SgXgox2YN72+b7ZCp08BereLLgLXewSNx2DC5V6PNqDmhpgdYQAR8ndKksIX1jIkydNg==
X-Received: by 2002:a65:668b:0:b0:3f6:4026:97cd with SMTP id b11-20020a65668b000000b003f6402697cdmr21086549pgw.420.1655726207401;
        Mon, 20 Jun 2022 04:56:47 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.110.75])
        by smtp.gmail.com with ESMTPSA id iy22-20020a170903131600b0016a1d007637sm2756809plb.110.2022.06.20.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:56:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to /proc/cpuinfo output
Date: Mon, 20 Jun 2022 17:25:49 +0530
Message-Id: <20220620115549.1529597-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_045649_421519_B91AD427 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Identifying the underlying RISC-V implementation can be important
for some of the user space applications. For example, the perf tool
uses arch specific CPU implementation id (i.e. CPUID) to select a
JSON file describing custom perf events on a CPU.

Currently, there is no way to identify RISC-V implementation so we
add mvendorid, marchid, and mimpid to /proc/cpuinfo output.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index fba9e9f46a8c..c037b8691bbb 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -3,10 +3,13 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/csr.h>
 #include <asm/hwcap.h>
+#include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
 
@@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
 }
 
 #ifdef CONFIG_PROC_FS
+
+struct riscv_cpuinfo {
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
+};
+static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+
+static int riscv_cpuinfo_starting(unsigned int cpu)
+{
+	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
+
+#if defined(CONFIG_RISCV_SBI)
+	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
+#elif defined(CONFIG_RISCV_M_MODE)
+	ci->mvendorid = csr_read(CSR_MVENDORID);
+	ci->marchid = csr_read(CSR_MARCHID);
+	ci->mimpid = csr_read(CSR_MIMPID);
+#else
+	ci->mvendorid = 0;
+	ci->marchid = 0;
+	ci->mimpid = 0;
+#endif
+
+	return 0;
+}
+
+static int __init riscv_cpuinfo_init(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
+				riscv_cpuinfo_starting, NULL);
+	if (ret < 0) {
+		pr_err("cpuinfo: failed to register hotplug callbacks.\n");
+		return ret;
+	}
+
+	return 0;
+}
+device_initcall(riscv_cpuinfo_init);
+
 #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
 	{							\
 		.uprop = #UPROP,				\
@@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
 	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
+	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
 	const char *compat, *isa;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
@@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
 		seq_printf(m, "uarch\t\t: %s\n", compat);
+	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
+	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
+	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 	seq_puts(m, "\n");
 	of_node_put(node);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
