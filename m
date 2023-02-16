Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72786C636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4u4nP6Dy+xQ3eF5wfG1irLJItWMrIwCjPj/9unHhzv4=; b=dDh0nWXEWy3hzW
	OVR3Weg4zY38TXSDR6WAaOUB33BInDlz1qY3QMDute1swfL7S/wXsziCCq0Jwr7uqqeRwoSav8hFS
	6LD6nz5Vu2k9QBxjf0HlfRU/wuKe4JzWMS0pxjdPnbh98Cm93+KY4/uzfVbud37c84VspPXhv+FIf
	M4jbJCB1bDMu87ya7RD/EnhQ6Q8yOOo7MSrWYo+DESzj15sncXRuaJP7cfUNSKjaf9E7k2zztQqzi
	LTCvqrOm5lDmVYYdApmh6iWxJqTlY8xv8JWwLcK5qDcjwlzgEzmAux3IwT9CaJ4MBGpjgA8PgNi/Q
	NCgqoQsohfkXZDm45uww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSit7-00BTrB-Fq; Thu, 16 Feb 2023 18:21:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSit5-00BTnu-2e
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so2977389pjw.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8gLVy86DoWbnyaOmwt3yk4bIOk4obRTX8YOySNU6bM=;
        b=VpdtjEii+t5cvC5ibTSbTwjU4Vx3GiWKkzTOXqXjUr0YDKlzh2RTmRhrfafw6GTtsc
         YTQqnR6kqj6GRIgl9yX/vR6IHxTBJo7vdDNEj8DswgI7MPqnnTKk6CnOzErmcN5CCH2b
         ZwMNZtNf6oZbN7d+YG/54CFyPCKr7rLx8eQKziHq+F0+XPYQXsrOqlge5KMGhUXVQVMo
         nT8fZ/aoGGnmZ86ZY/5kHh7e+61wbBNj1IkEy+Sk4r9srBbf2euRVlaJls3S5LTMegLN
         dC+DQ9pSlYuPW3W5SR4Zgw/zMM7vqJOQ/chaI5xf2TMznWD+BoyMvGkFM9XtER5brYcS
         3B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8gLVy86DoWbnyaOmwt3yk4bIOk4obRTX8YOySNU6bM=;
        b=0pMKOOCRMlAIeqTjSbulY0SLVTvjl0M2AMcm3Yl+isL+PjgHTTD82LgvAEKsWlMVVq
         a4NewZlIbUC1Qu45Ai3RPq3OnzkJkBZsmj0AIqCNq8w9gDoa6ulHXdLjbAwF2PbVwfbc
         8ALd3xEC0Ok0YkLQvorYJjvD5sv7zIGW9QmdQci1HziX0sydy8/A92ETJLLW5zIVSmht
         1o6YJQUkZ0Og2Fn1xKAfwvnyqnQK2e4yVVoDWrYRLWGhlO2sIAeZL+72NEXrlHQuWg8W
         6LPO4yS+g4CV1WtKLSxVf8MgHIZML22AvRoXM9HY5kWmGRXmf0RfbklcOK62QQ73KL0S
         7dbA==
X-Gm-Message-State: AO0yUKXqMFz64q5v81uqsZPCjbFBOTRW4NV43FootU8jjxNUo7Y+U6O5
	Sk139bRBsrRh0aC1x/hFYVVeBQ==
X-Google-Smtp-Source: AK7set82OpBoXgv7SeiV1Z4RhXl7WcwMoJmnfTKXKVRwepNnMNF/4KU9sf9ovobJziBAs+uVZziTXQ==
X-Received: by 2002:a17:90b:1d87:b0:233:d4fd:38a3 with SMTP id pf7-20020a17090b1d8700b00233d4fd38a3mr7710027pjb.41.1676571700518;
        Thu, 16 Feb 2023 10:21:40 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:40 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 10/21] RISC-V: smpboot: Add ACPI support in smp_setup()
Date: Thu, 16 Feb 2023 23:50:32 +0530
Message-Id: <20230216182043.1946553-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102143_145584_D48F18A9 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable SMP boot on ACPI based platforms by using the RINTC
structures in the MADT table.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/acpi.h |  7 ++++
 arch/riscv/kernel/smpboot.c   | 70 ++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 7bc49f65c86b..3c3a8ac3b37a 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -60,6 +60,13 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
+
+#ifdef CONFIG_ACPI_NUMA
+int acpi_numa_get_nid(unsigned int cpu);
+#else
+static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
+#endif /* CONFIG_ACPI_NUMA */
+
 #else
 static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 				     unsigned int cpu, const char **isa)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 26214ddefaa4..77630f8ed12b 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/arch_topology.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -70,6 +71,70 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
+#ifdef CONFIG_ACPI
+static unsigned int cpu_count = 1;
+
+static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const unsigned long end)
+{
+	unsigned long hart;
+	bool found_boot_cpu = false;
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
+	hart = processor->hart_id;
+	if (hart < 0)
+		return 0;
+	if (hart == cpuid_to_hartid_map(0)) {
+		BUG_ON(found_boot_cpu);
+		found_boot_cpu = true;
+		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
+		return 0;
+	}
+
+	if (cpu_count >= NR_CPUS) {
+		pr_warn("Invalid cpuid [%d] for hartid [%lu]\n",
+			cpu_count, hart);
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
+	/*
+	 * do a walk of MADT to determine how many CPUs
+	 * we have including disabled CPUs, and get information
+	 * we need for SMP init.
+	 */
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
@@ -118,7 +183,10 @@ static void __init of_parse_and_init_cpus(void)
 
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
