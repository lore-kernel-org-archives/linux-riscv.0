Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A9C678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cj9/M5TadA6K1fLyxhiazrYLrBqPS8brUrwIbzym10s=; b=C7zQwiH9DI+yfL
	RXgLYYJ44pEC4vsLDbRGsS4gduEwwFhauNmJ6JlvbDakVxhv/U9/git+1I1Na400cObuLb5y9PvHc
	dEheEP9yXkzZNreo32Iapg1POqDle9K4o2/dVB2FBObSkQtQnejIjAFNcoTOcQo5oJWOSGTjx23in
	A86G4a2PNql5Ytiu0RnqOdpbdXPuZ/hshjxPNSdR2haTRo0SBtGVbGEc31y5SureXHnP/T3o1OiCC
	WyukdXXw78crF9ivY5DnhZHZvervv2gmqa6YV+3gRc7i1TBI4AZUZlbeDhrJwMtFotKbNLRCbRRJK
	ToEQgeH8AcP5e9qVmILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bY-006TQg-K2; Fri, 03 Mar 2023 13:37:48 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bV-006TMZ-Kb
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id y2so2520452pjg.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8QTnerj7bYskLlpj17RAvWj070+do7b32kQaiggteA=;
        b=RgJqREjhLWiT9HAwULg1TCKy3elPJioYn7o58gezsP6MvD88qFFcqTs8G4yvOZl1+x
         uACE7bocF1Nt5qSzzsw3Id8jszuDh4dCI34HMitP5OGUEy0rypJR0r1L+EWVBdLdPJOK
         L3W3Af6kXSq9+OjQxCsfQMpWrgqlvh/c3/grFMzOVy/bM+ARSvmoksPof6W9e0RUXsvj
         srUJfWInlYLWE1JJR6JImY+rNgxvrmC3zyQYnnq9efC8Y2f1zyc1D+I+Cj7T9ltu79mh
         t8GR2B13Tgo6izfj2S+7J1Chr1wjxfZs9uxJju+wjkhw0lZhR7quW1egY3yUltQV2PkU
         Rfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8QTnerj7bYskLlpj17RAvWj070+do7b32kQaiggteA=;
        b=WSvU66GGTuY1G90Lws6rmSMkLRaPyTAu1cmNx36sX3itPcqzdvkumdDYhaKncibdKV
         n/0HBJY6ElF1HEk7r+EyaWU+s/NruXZvsxbJM9+aM98c0b8sPucB+fysS1fM6vkS04J5
         ex9F1tveYP48jHcGZwAFwjRjXlZFQ3afGOSEhSljQPq7vzwZ84V6Nl2rYjhO5W/jFaOb
         HF+IYod9tEf1teRxkZ8V1Mt9Ic6M1RuJ26iTGZtso/SI7TuFTUMfa+MDwowKx/GvRiMr
         kRr62xFAYE8bCusQw6gZZHoiFiTxktr5lb7ZfEMr4EhX1jbiR8sxN5gbHfebpBxKL6pv
         RVwg==
X-Gm-Message-State: AO0yUKW9/2+a9/OfNsO6BRXpy/RWrQmjO1xenrAGslziW2b+7OsOoVt7
	OaocX/UsQoCGEPlPaDFFYDAiVyIz6jA4K0RC
X-Google-Smtp-Source: AK7set+3syqBrexDfRhiXUmwPvMl0XTqXIm4cfBvm5pKr9zwZ/LM+g847U2jDtODoXH4qiNOEEMLMA==
X-Received: by 2002:a17:902:d4c8:b0:19e:7bce:cc65 with SMTP id o8-20020a170902d4c800b0019e7bcecc65mr1963990plg.66.1677850663667;
        Fri, 03 Mar 2023 05:37:43 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:43 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 10/20] RISC-V: smpboot: Add ACPI support in smp_setup()
Date: Fri,  3 Mar 2023 19:06:37 +0530
Message-Id: <20230303133647.845095-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053745_699439_BBA1B3DB 
X-CRM114-Status: GOOD (  17.74  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
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
 arch/riscv/kernel/smpboot.c | 72 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 26214ddefaa4..27047322d3bb 100644
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
+		early_map_cpu_to_node(0, NUMA_NO_NODE);
+		return 0;
+	}
+
+	if (cpu_count >= NR_CPUS) {
+		pr_warn("NR_CPUS is too small for the number of ACPI tables.\n");
+		return 0;
+	}
+
+	cpuid_to_hartid_map(cpu_count) = hart;
+	early_map_cpu_to_node(cpu_count, NUMA_NO_NODE);
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
