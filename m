Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53394C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aW4irIi6A713PQlTYtogjBrv2a0l2Ra4zMkpQ4vj2E=; b=IPyjAZRf0ec/Uw
	ywdIm62YOjuIPaHjr9rnwiDxG4a7Y/+VpX73jAZH2mo7tcMmmDg3F+vXj1/l8kllaanfYfcZOm2+p
	5ST8NkqdMw7lyy/tkzG+j35gRIRJkIdcGVbEH2+vxG0VfXbSw8vkZGmimacWUeiqvnkXE10mp1++9
	+IFX2++QgrSv3Zl3JQ6g7APx8CZhYSEnIuZV4qxdRP0ggHjrtiGmxr4mHcnfz6ICZurlDo6lllp4h
	DUFhyyFSuUWvj4rWT/WDqo7mGGLSWs7X0G+WDnmkwi4hwObnxaG+ZQVqUyi3CRFM1P7QPq8fjy4C/
	yrBVm3MTRLviyHPSVgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw0Am-000XWw-2t;
	Mon, 08 May 2023 12:41:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw0Al-000XWN-11
	for linux-riscv@bombadil.infradead.org;
	Mon, 08 May 2023 12:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xPSUnhfUj53RcidJeP5kL6gGwZHEmDmCHUal6KZm638=; b=BLDp75Cvav+WGKJO9NHCHkEkC7
	pqhR+kLRIr04JCGjOA2ZpwYJ+KWe+9zIsjW1bB3PXBuojsTwAcgT6lUo+XoiKhU668C9/rrXuFvfM
	VdjB+yuJ8ixiKGAt2WUmB8zoM6o5bSptWndDIPl97nr5BQKvbyxpLaKWe9c6JCZk+5z5nehqUj1US
	303JxHFiVTtx1lF1hDoaBa+YMgM8jXA6MtlLwetw99sBoyDWI7/0LcLsBRqvmVJNL9n7Rq3Cs70sI
	qdUy3oIiOI8jXeuTWXKuCoAGNf9Cn7MfLzO+zDYLTYnA2OKvIa4JenKXDWZMbk3sjr6oALS4gucns
	n0xh914g==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRl-0059QQ-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:54:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1aaef97652fso29739345ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546867; x=1686138867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPSUnhfUj53RcidJeP5kL6gGwZHEmDmCHUal6KZm638=;
        b=B89bgCvRmGEMAUxP/QGsfNQm2gjwxDg+QrprfVD8J+SUcbDL0JuefH8yg3QbKPSusP
         8rH/5FTe8ecRIqNzZRrZVua1E97KFmKTWvsf05A6XAiAhMWHWulc88M5zsYV9fPB6BS/
         MG1FdVheDOnn8ZrtyfRM2iqXy2fuTrATFp+FIVtPvWglUNAhf60NlY4E0EgKpwIVymAG
         22Z/iJxvTrTLUL6IMkcXxeYFv6Sm+2OuG3qF25Rr4SJJxf68+Ai+1zi6h4/KC4tNa7G2
         WrEHfPZyxjuUyQJiZAjQ56tNOS0EUPhcyh8ipbTdoOLoQSzzpNN6x9F1W2Hpj6hP3F0Z
         eKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546867; x=1686138867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPSUnhfUj53RcidJeP5kL6gGwZHEmDmCHUal6KZm638=;
        b=du185z53g37g/bPwqoVu4pgcYDtjRCoHkC9JQTo6Abi8O/ASPLznjvMceBqh0n+jVe
         YknqJ6hiK5nT33YeJtsDwmOtSaEof6u+c/yuRT6FKpEbu670kNtNkyqYJphrGnc1tvKj
         0mB3frhgBeTSgsiqFwRUH49+eYoKQOYMYoXy5Ll/v3NERWOb1n5p8ug0tmLuB4ekwhoX
         J70c5JxIB5GJbucgJE+YXlCzWn4Dj21pCCmVWRT6COMtDQ8kagwiFM/z9T+wceglhcOQ
         PEtpfUABIGw/NhwJLT90V+Zx8ZcZFPsKMgyvpJW22XTIgjoBA+zP5syvtKCLFHkJVDkg
         EK1w==
X-Gm-Message-State: AC+VfDy1e7eu2GlJChSwOsMNsW1xT0Qf8HzaBm2zHfiGwszuBWk811UL
	wp7flom58ktVc2hLVhAp9gbcIQ==
X-Google-Smtp-Source: ACHHUZ6Gz6YRt/rRbsWfX8rM4EyT+3FO881Otsm/ltvRREx1WVjAZpVesBHDJ+4NomT8Orb6vkyrsA==
X-Received: by 2002:a17:902:f547:b0:1ab:bfb:4b6e with SMTP id h7-20020a170902f54700b001ab0bfb4b6emr13666475plf.31.1683546866800;
        Mon, 08 May 2023 04:54:26 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:54:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 11/21] RISC-V: smpboot: Add ACPI support in setup_smp()
Date: Mon,  8 May 2023 17:22:27 +0530
Message-Id: <20230508115237.216337-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_125429_929397_4C1A3536 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable SMP boot on ACPI based platforms by using the RINTC
structures in the MADT table.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  2 +
 arch/riscv/kernel/smpboot.c   | 72 ++++++++++++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 39471759bec1..f71ce21ff684 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -64,6 +64,8 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
 u32 get_acpi_id_for_cpu(int cpu);
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
+
+static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a2e66126b733..67bc5ef3e8b2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/arch_topology.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -70,6 +71,72 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
+#ifdef CONFIG_ACPI
+static unsigned int cpu_count = 1;
+
+static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const unsigned long end)
+{
+	unsigned long hart;
+	static bool found_boot_cpu;
+	struct acpi_madt_rintc *processor = (struct acpi_madt_rintc *)header;
+
+	/*
+	 * Each RINTC structure in MADT will have a flag. If ACPI_MADT_ENABLED
+	 * bit in the flag is not enabled, it means OS should not try to enable
+	 * the cpu to which RINTC belongs.
+	 */
+	if (!(processor->flags & ACPI_MADT_ENABLED))
+		return 0;
+
+	if (BAD_MADT_ENTRY(processor, end))
+		return -EINVAL;
+
+	acpi_table_print_madt_entry(&header->common);
+
+	hart = processor->hart_id;
+	if (hart == INVALID_HARTID) {
+		pr_warn("Invalid hartid\n");
+		return 0;
+	}
+
+	if (hart == cpuid_to_hartid_map(0)) {
+		BUG_ON(found_boot_cpu);
+		found_boot_cpu = true;
+		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
+		return 0;
+	}
+
+	if (cpu_count >= NR_CPUS) {
+		pr_warn("NR_CPUS is too small for the number of ACPI tables.\n");
+		return 0;
+	}
+
+	cpuid_to_hartid_map(cpu_count) = hart;
+	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
+	cpu_count++;
+
+	return 0;
+}
+
+static void __init acpi_parse_and_init_cpus(void)
+{
+	int cpuid;
+
+	cpu_set_ops(0);
+
+	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_rintc, 0);
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
@@ -118,7 +185,10 @@ static void __init of_parse_and_init_cpus(void)
 
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
