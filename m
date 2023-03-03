Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1DBC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yxF7ywWsKarXQG7jHxIxiRYEiFBTEzIhZAhhPRYhvE=; b=UopvFZ9w/CAF2b
	N0fkV6G+yRaGRCeGyrv6Fi4bjtz+SiH0ZKICgrAVn9hnsfiqC9kYx39AF9dyzCBGxDXYAJbKlGfp/
	3aNTdDQE7LvWmevVOVxo293Ahc8ndAQhk8Pv/7IAq+7fymH/vQJ7JznxkRYk9RCvoQTzPZdP7kZYj
	3tV4FkYoGt746eWOdSkVHJSYQWG1vW4i9+1e3oDeV3f45Ofq9q3fM5Lqd/qBVdejqpMeNBjUKwNuy
	vkiNLZyRM5rYUH3wIu7IYsjxSd2RtlUY6RbKDpFuZZJRlxaK92+9VenxKIIYh4KhVIHfTdY57rIw0
	tV+2iP2WKUDd5cTYBfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bc-006TUA-Bd; Fri, 03 Mar 2023 13:37:52 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bY-006T2P-Vs
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:51 +0000
Received: by mail-pj1-x1035.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so5648243pjn.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQCnSR2uhLGdQyOkOFgSQ8VeHxY3xwdVpRHCeTeD8ew=;
        b=NMLEUSb82IGQQhW0x4NPkapm0Psw8L1OGm/oPdiLRtWhywKWeyx7vPddrp7pmxBHe7
         bt5qBneS3lUdBhyL/Sj7skxxrBiPGzbKutT2c1sDQ448f2THTSxlpoOVfoe0QRtLRFfo
         wCd/WBraJKU65Z1HuVm12PFLXP0bexX+t2YC2UWXCZL1rJhe29HhZ84piDer3bXS8F4A
         JSJ0VA2CCJn6Fii9M5rDYYuqyB8z9ru1nPvlI3fI7T1QBDy50itlpY2KT7TLxtbt1x6V
         jqeXBMh9/JV/dWD1M/j1ibj77HWnxaUEwHgELuI7WDbyUO9eQRDj9OjlsZAnIe1xMXSi
         sxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQCnSR2uhLGdQyOkOFgSQ8VeHxY3xwdVpRHCeTeD8ew=;
        b=lv9qHzdG2fTcHALSWBBiNz53zwACTyk1I43Mj1nB4hy0Bk9Pv8tRPF+bA6t4vheAx1
         9JLHt0vIVAvlI8uB9Sd0TDXWBPJM6u+TfeQMbbEL1KfFTX6kwtbARz+QQtyz17eKgD3v
         zBh7CMc0gVPmrCWhHP7sM0cO4fOc6eMn/2GqJh/uO8X6wd1bpdGJOovVY2BGp0ZgSxjc
         Tv1MWxjVmjSm0dgIH3fE3/dxmNw1uFUX9vFYe0R5fK1DcCD09nwmQeMY+1ncLkKEjH9Z
         XEU45mPC4nmGOXDObq1QuigjhxWSbIMPIlBvaEl4+WfCu4zJvlVDUvwluJEd2Ct1+pEG
         vBYA==
X-Gm-Message-State: AO0yUKUa6rXzvrCZZLd+SJojebXHMYV1bTQEUucDzQ2NtpgEVjr7OUUv
	CbhyJkk0aMTQqSzopRlR3ZQKFmEZc3m6UUEL
X-Google-Smtp-Source: AK7set/jmy9dq9epVpz+uP0wD1ybCypEBIE8+NTFo7SLPWfCjJDt2BpAuFqvDUHvsA/phDd7zfgESg==
X-Received: by 2002:a17:902:ec88:b0:19a:e762:a1af with SMTP id x8-20020a170902ec8800b0019ae762a1afmr5549833plg.33.1677850668422;
        Fri, 03 Mar 2023 05:37:48 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:48 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 11/20] RISC-V: ACPI: Cache and retrieve the RINTC structure
Date: Fri,  3 Mar 2023 19:06:38 +0530
Message-Id: <20230303133647.845095-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053749_051206_DEC04C9F 
X-CRM114-Status: GOOD (  15.00  )
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

RINTC structures in the MADT provide mapping between the hartid
and the CPU. This is required many times even at run time like
cpuinfo. So, instead of parsing the ACPI table every time, cache
the RINTC structures and provide a function to get the correct
RINTC structure for a given cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/include/asm/acpi.h |  9 ++++++
 arch/riscv/kernel/acpi.c      | 56 +++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 111a8ed10af1..8be16c1ef7da 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -61,6 +61,10 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
+
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
+
+u32 get_acpi_id_for_cpu(int cpu);
 #else
 static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 				     unsigned int cpu, const char **isa)
@@ -68,6 +72,11 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 	return -EINVAL;
 }
 
+static inline u32 get_acpi_id_for_cpu(int cpu)
+{
+	return -1;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 81d448c41714..8b3d68d8225f 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -24,6 +24,62 @@ EXPORT_SYMBOL(acpi_disabled);
 int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
+static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
+
+static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
+{
+	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
+	int cpuid;
+
+	if (!(rintc->flags & ACPI_MADT_ENABLED))
+		return 0;
+
+	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
+	if (cpuid >= 0 && cpuid < NR_CPUS)
+		cpu_madt_rintc[cpuid] = *rintc;
+
+	return 0;
+}
+
+static int acpi_init_rintc_array(void)
+{
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
+		return 0;
+
+	return -ENODEV;
+}
+
+/*
+ * Instead of parsing (and freeing) the ACPI table, cache
+ * the RINTC structures since they are frequently used
+ * like in  cpuinfo.
+ */
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	static bool rintc_init_done;
+
+	if (!rintc_init_done) {
+		if (acpi_init_rintc_array()) {
+			pr_err("No valid RINTC entries exist\n");
+			return NULL;
+		}
+
+		rintc_init_done = true;
+	}
+
+	return &cpu_madt_rintc[cpu];
+}
+
+u32 get_acpi_id_for_cpu(int cpu)
+{
+	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
+
+	if (!rintc)
+		return -1;
+
+	return rintc->uid;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
