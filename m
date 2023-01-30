Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE1C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxMZAwC9mZWDRLGKCTknSjsd95ujC51/lfg8ez9wNDc=; b=vZ+UFfOOKJtFG+
	hTPfL78dtGvivdj/0Jv2/wWKacu1gWO8iXfKXmWE9fxBWfv53Awd7Wi6FJY+PX3yXzwFqZFSBvOyE
	xhMni364JPYnRRkW8Wi7CkxXybdvvY5uzaFuylOhrcpO4yj06g17k132RCS7IW5RiwhgDF7qYLnZe
	88BpbP8q45GxHS+Zb//284RgQPJsGc5OCi2/1YUDGXP9sfXysRshNgtCuL26pHMHDvwJdVRfZj14F
	D69BouLL+8egxILVUE7D77R2BWTJ+2ruZIOwGDcQevwYPkUXUjNzJVX2kiRgc44hLJYr2WrIE2rdm
	f5iExh0IH/b/ozp/PaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYr3-004yYc-EG; Mon, 30 Jan 2023 18:26:09 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYoX-004x7B-Tg
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:37 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 88so11871845pjo.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tmqm1KrH8Rx3qerFslFMAYGwIdVV+GEj7SnscFfXmQ0=;
        b=cPqIpB8prS7hDFjj+h2EyPJYy7PzmnnK7RExz1Ok8dR7rRKT+hcVUGsFGHWUlBqJwN
         7TFI8iyfHhoGD4a989XpaHBs/LV8kw/QUgsWAYRqlX1j2J426hfu4JuvWvWp2Ur+aJva
         bIvHdZ3mMBp4tBmotAyHnxK+PkLaI1ltXKPKRM3DZCEAeySNiyDpT3o7bmmnIzIHMSvv
         NHmf9xDgFjhefd/ngOEANI2MN4vf8CxitwuTZvXZT7ThVciVKtcZRlVErvkJjCEEW2sn
         WchYKaK4+/IvPJhKS+PXyhvjlMpYJw11G5D54C68fDhwazqvPkacu5QTTU7uvSoVkfjg
         zARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tmqm1KrH8Rx3qerFslFMAYGwIdVV+GEj7SnscFfXmQ0=;
        b=WRaDufgX6v9hSh1jtfJ6dfcBVXeSVaGoBvHMuCoMf48IPL+H4MccAipn3+QjmSH7Tr
         HxEmth3IG25Sre6tvdBLauYwhOatq/3i7JZRAF8RnjQRZaLLaHSVovXRxsC0wQg5pSJQ
         MLZ2H3oJYQ73XWR51Ij5YzqWGgzFgQZmekq3zK4R4MXjWUirQTDwnr1j3GGAPVW4v58I
         mRtMpKIQPECwKiOCb/IK8dp1qxrUXHKKqJdA5wLNZRYbzTEK1wsg1sTM231Y217YQaEU
         J3EKJEPmBKxvSyMdagT2gf+6CcSq1gAxaUUTksyPG6RbVHtMLQpOb1WeDOgAhpCpXMts
         V6iw==
X-Gm-Message-State: AO0yUKUr1H+6UMIKixBL00XGJZfDC68DXwtoKZgpoNU6GR2hCbQ/8zKf
	YcOafX5fikA3Rx+WOE9N0EqmjA==
X-Google-Smtp-Source: AK7set8mUQ/h8KMYQ2zVbbHUXRL1WVlOMXJhgdTYz7w1If9zAbycA9u/XMnVWA+UBeINzP9AUSP2wA==
X-Received: by 2002:a17:903:190:b0:196:869c:8c5c with SMTP id z16-20020a170903019000b00196869c8c5cmr5258522plg.51.1675103013599;
        Mon, 30 Jan 2023 10:23:33 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:33 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 13/24] RISC-V: ACPI: smpboot: Add ACPI support in smp_setup()
Date: Mon, 30 Jan 2023 23:52:14 +0530
Message-Id: <20230130182225.2471414-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102334_008927_848DA319 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add function to parse the RINTC structure in
the MADT table and create the required initializations to
enable SMP boot on ACPI based platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  7 ++++
 arch/riscv/kernel/smpboot.c   | 73 ++++++++++++++++++++++++++++++++++-
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index c5cb9f96d404..d1f1e53ec657 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -58,6 +58,13 @@ static inline bool acpi_has_cpu_in_madt(void)
 }
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
+
+#ifdef CONFIG_ACPI_NUMA
+int acpi_numa_get_nid(unsigned int cpu);
+#else
+static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
+#endif /* CONFIG_ACPI_NUMA */
+
 #endif
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 26214ddefaa4..e48cf88d0bc1 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/arch_topology.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -70,6 +71,73 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
+#ifdef CONFIG_ACPI
+static unsigned int cpu_count = 1;
+
+static int __init
+acpi_parse_rintc(union acpi_subtable_headers *header,
+			     const unsigned long end)
+{
+	unsigned long hart;
+	bool found_boot_cpu = false;
+
+	struct acpi_madt_rintc *processor;
+
+	processor = (struct acpi_madt_rintc *)header;
+
+	/* RINTC entry which has !ACPI_MADT_ENABLED is not enabled so skip */
+	if (!(processor->flags & ACPI_MADT_ENABLED))
+		return 0;
+
+	hart = processor->hart_id;
+	if (hart < 0)
+		return 0;
+	if (hart == cpuid_to_hartid_map(0)) {
+		BUG_ON(found_boot_cpu);
+		found_boot_cpu = 1;
+		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
+		return 0;
+	}
+	if (cpu_count >= NR_CPUS) {
+		pr_warn("Invalid cpuid [%d] for hartid [%lu]\n",
+			cpu_count, hart);
+		return 0;
+	}
+
+	cpuid_to_hartid_map(cpu_count) = hart;
+	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
+	cpu_count++;
+	return 0;
+}
+
+static void __init acpi_parse_and_init_cpus(void)
+{
+	int cpuid;
+
+	cpu_set_ops(0);
+	/*
+	 * do a walk of MADT to determine how many CPUs
+	 * we have including disabled CPUs, and get information
+	 * we need for SMP init.
+	 */
+	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC,
+				      acpi_parse_rintc, 0);
+
+	/*
+	 * NUMA - TODO
+	 */
+
+	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
+		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID) {
+			cpu_set_ops(cpuid);
+			set_cpu_possible(cpuid, true);
+		}
+	}
+}
+#else
+#define acpi_parse_and_init_cpus(...)	do { } while (0)
+#endif
+
 static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
@@ -118,7 +186,10 @@ static void __init of_parse_and_init_cpus(void)
 
 void __init setup_smp(void)
 {
-	of_parse_and_init_cpus();
+	if (acpi_disabled)
+		of_parse_and_init_cpus();
+	else
+		acpi_parse_and_init_cpus();
 }
 
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
