Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822CFC19F21
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TughRPC6bIbiWd/6L8Vvd/8CqED21//68J46e97qZRA=; b=4MWSN2sZbaDlEs
	ld20ZPpyNRp1gMyxh3KsufC/LNTzYH3RjP49uKcKUu7JwdJhlmup3sphkp05MXj7mz/lKc6wNpwIa
	B9BIhq/AJeP/nOyTt7OXbDVSRezbuqbuYWuo3Ge+Le0jUwMR9ZkFYdGq2Nwtrt/Ky1sVl/1ydLJZb
	BP4r3aH74C+lCfLSq4wJqEeKP4kARgSmBhYnEIsSo7opJIIzVkcJLBRL+cUFK8T9uFJ9aSzZ4W0M5
	/GlAr+hYWq9xkd8lfCSmhlZIVRYU3MlCvZfRBD6fKnoiytzYh//Q19rv0NPal8Y7UNMzzC5Up7pfk
	GvPf//QHR8aOTXEPckIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGYpW-008w8H-7n; Wed, 27 Jul 2022 04:39:30 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGYpT-008w4c-3n
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 04:39:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id o14-20020a17090a4b4e00b001f2f2b61be5so1002826pjl.4
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 21:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72mc9rV+Or/UCSUqmbngTq+GJzkxqJLuquOjL+k6DMk=;
        b=RUBWXp3346mGXGsT/osQGMIKkSCA7yBvKUWTxP6L7ZIoPDHhZWW3FU0T2eh8E66tQu
         639S1w9a6BlXBIGp2jX6yp5WT2gYUDqvnvYRa4cuHGwRQ3xENfJv/A+KPLMCA3EUsGhI
         hgzz0vAqmQoeaVWvPbRpm/8xi0fiS2xSf1wsACbKru8KFtUNsK0c+O+stYy2n8GxyAim
         qrRUEbZGWGVSDoicrAUaKPzTHfVF23eXYxcO/PIFW5gbXJPU5+tynMvpsPUogKKg9d1P
         nG3fUHb7Ln1NJ3aU99x6VeKAkO2mWvEMaPOxwSYv7hAZvbO88LjX9WrifLX3tfQWSyE+
         ihNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72mc9rV+Or/UCSUqmbngTq+GJzkxqJLuquOjL+k6DMk=;
        b=H3MNQ03TqT1B3yqSWSqJIQKlJkYBsgmipYaRDF9zgqkMIBGpaj4epxY66QSGu/JzbG
         +hg+c/LgJZSd0TsDFwzlDpudA+bMw6DRUjneYPDC0UiEnklG1R4eNDJIvksSFJGX8jC1
         cFQ+ZQxG9wFux8D4g4EVahslwton4ppFkiwD0mLcEvzXyrirvbHmwjoo0VGsyNFiQMwR
         NCdUjwz+Ft30mjJxVsayd7DOfU2fPtwafUMvqxS9TJT0AOjOhSZ6Qa8yYrpSPCVEY7Q6
         lCGR3a0xDBLy23NL1DJeIwzlO16ogFWHRnWK3DSVs4Oby7/XGeKOUyxDy6IvSMj6iemK
         dqow==
X-Gm-Message-State: AJIora9pTpSpI5JCuxTqIrsotJb9CU2qs23CApQ3IDDGRWKLDq4e6REY
	h0MYoWIHZJ3GFgns4MxvNInX/w==
X-Google-Smtp-Source: AGRyM1sye5+G+KwpZYkgsqAmcItRzmgg5pY5UJAmggWcyiP+mzsHBRWAibIrbpUGHL0TCdZYem73+g==
X-Received: by 2002:a17:902:7143:b0:16d:986c:f2f9 with SMTP id u3-20020a170902714300b0016d986cf2f9mr7136604plm.42.1658896763327;
        Tue, 26 Jul 2022 21:39:23 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.87.63])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090a284200b001f216407204sm500698pjf.36.2022.07.26.21.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 21:39:22 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to /proc/cpuinfo output
Date: Wed, 27 Jul 2022 10:08:29 +0530
Message-Id: <20220727043829.151794-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_213927_180735_F07B7DA9 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Nikita Shubin <n.shubin@yadro.com>
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
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Tested-by: Nikita Shubin <n.shubin@yadro.com>
---
Changes since v1:
 - Use IS_ENABLED() to check CONFIG defines
 - Added RB and TB tags in commit description
---
 arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index fba9e9f46a8c..04bcc91c91ea 100644
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
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
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
