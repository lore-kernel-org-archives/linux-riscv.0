Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A67C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfsuWrSW8D7Ud8kcxxE1V0O7R77fpT+e0xWwixQjzyM=; b=IRNXGUNHJ3w4v7
	MVtOG4THgoY1IwHQO+/FB28csVpF2+2RQP/YyM3Aueuo6Z4+Flby+ltd89VRA10Cg9MXU1zDi9Nj9
	L9Nq3Cbjb7ZqckV4UEIiNmOOdXSJHILhfJ+88WSX0RtXUFxfHzhu6d3CfNfAcg4r7Z4ubfr3mVPV9
	N7yiw7ymguYavix6JZqNWbMKAMZ7/ysJZ7I+O6stREPlF64YVJ8TMI6NW7DI5wxtTno29TQgw1EAn
	vLuiFDK9GOcYLZtA0q/XFInNAP8iHe+K1MEAQu0TRNlEHzCvw3ygDmmS0AkHjSHZXWh9bDqVXgFH0
	PuyaT6i7TcdXVvptIpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIF-002UAh-0a;
	Tue, 04 Apr 2023 18:22:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlID-002U9g-0P
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:22:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id f22so28024355plr.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGonri/T19XQF2naGXJvqqLnbSM1YN1GWyJxGmsm0G8=;
        b=jlU6cVDRpS7N+hbCajzQ5MBLlupJaHtqzIdkqiPTdgeHP85eBAGnt3IyBNq6jANDpp
         cwqU4j6QhylWaoAD+i+RvRnFnexq1wQ7hFZtqJGwVlBRMJgGNeR4vpKazmlZG0XQ2Zrn
         InczBkrjePyvmC01JogcOj/miAoB9IP8R8uwJH07fk96+hULRShilpkKLxZorAWOWvPs
         4lTqHyEsR8TapU0eESkEuqvZH3dKe12+qtas+XnrbS95Qwlo+rOrfF8OWmXZ214KwCeV
         0u+YSRiu7NhnExNyDKcz1HrlVGKzxl7vbNHloZt2ohNHTePS3ZURQLDXTYnysnOHTTCx
         aDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGonri/T19XQF2naGXJvqqLnbSM1YN1GWyJxGmsm0G8=;
        b=mG9EcvIwq44AeEpwpNCGkO8YXtxcUharb1gb+0cwAqozI53cJhrx7g4Evu6ODo1N7P
         4tzdUE6z5G2XjVX96uEz/SljCMHcayMfI83dcC6Rr2xB+ZT3QNZ513WsAaw+qVHFPe4M
         4WcmtuJBMgtB9eCdGQvjgjqHm6Od3Tg4GhnLEOoBwnnPWcIohXvLwimAvz42jJKcqA7B
         xfUY9lawLp0IUlEhYp+8W06v1Vmw1Tk1vWmZYFUIBw44xB9Gzm9wEU4OLbXbIFR3u31r
         p1byEQzmeAC8UY8gYR2MKLwfAMNp4PddcnmQWUfyJzXsJqVJSeXfdkjiTgeuAAdo2XR5
         TaKA==
X-Gm-Message-State: AAQBX9e0A+0Ux2MvBN1Tj6XHysrldP/Rpq4o3Gv/aOfCBvkc6d/LTaQW
	h+vt5RIgtAfxTPJ9co1dMyDhXQ==
X-Google-Smtp-Source: AKy350ZlBkhsUYFGZoVvsAnR0Ixd22Yfapa7HDI3EV26dD/3aAUWLts/geeosBM5SkSk2DgEm45zyg==
X-Received: by 2002:a05:6a20:930f:b0:d9:7af9:6a82 with SMTP id r15-20020a056a20930f00b000d97af96a82mr90355pzh.9.1680632524615;
        Tue, 04 Apr 2023 11:22:04 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:04 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 11/23] RISC-V: smpboot: Add ACPI support in smp_setup()
Date: Tue,  4 Apr 2023 23:50:25 +0530
Message-Id: <20230404182037.863533-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112205_165097_63060ECB 
X-CRM114-Status: GOOD (  19.97  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
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
 arch/riscv/include/asm/acpi.h |  2 +
 arch/riscv/kernel/smpboot.c   | 72 ++++++++++++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 2b3e78d5a13b..b26ba911f0a9 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -63,6 +63,8 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
 u32 get_acpi_id_for_cpu(int cpu);
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
+
+static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
 #else
 static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 				     unsigned int cpu, const char **isa)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 26214ddefaa4..6a854b200b72 100644
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
