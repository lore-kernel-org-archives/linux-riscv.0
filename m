Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B29C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mt9TxGTGwhX+ZqzAtvzK7vW315ZYuIyD4D8stjAjwB4=; b=GwsJtsnZ+4MYGF
	ogFlWDilNHh8squQP5wzlMYD3YkWtJbd4eVLQJkQlMD+GQxoWmMn20hWJZGC+m59djRvH2cmam8P+
	x5WJ7dfGNOp3apYDnADYrmSfrtFhzkkgjaUKW+11Be2M1lee9CaOeUE6Z5KxonzKGSGAhsXX5jPT0
	rIpagwnNCjcyRNHuFsq5QAcB1iZ5MSFc1NdrTnUWDFjIKZoEPVsJcP1LlQaZriKTRnLgYTIGbaK59
	DuaYOSIPfAx65fVhnCSTu3BIn2btueabIy6UvBkCUfxxegPriCKih3Wv5LIQycOna4j2g7yHIB5Ox
	OysUSZpuBYbWd5CQARXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRO-000SD3-06;
	Mon, 08 May 2023 11:54:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRL-000SBP-1W
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:54:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1aaec6f189cso29522645ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546841; x=1686138841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2h3vevkYkVu6ki2VA7HPdPz/xuNcH/E20UC4Fi6w3o=;
        b=ZZntHeSbVEpN02Cc+DEk3iz4bVfHnuRM7WXQFLS0RRgrCwNBHq8sayu889D7P++r3l
         1gAWSEh9mwMM1kV8cZ4wLRQO6IgX4yBBIXJiz9RrSkfYghpY3CmVSdAcHA9dEq3URnX/
         QpFe+mOoaH7nAoQtsuoqkZzYKMeL3KF7pKgtxQiTauaupMtTSAz+NKn1LgASFO5wXbUi
         EcqgjxB7hqnvV7G1mrA8dhh2WIDT5/evRVQiT1GKkkpgK3LN02qAuAAKd90NpRQ113F1
         OffZEST/D6geWJCn+4z4IOeEejiohuTr/piTkuJSkGofxieZm2iKwTRYMQijgLtpweAr
         cTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546841; x=1686138841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2h3vevkYkVu6ki2VA7HPdPz/xuNcH/E20UC4Fi6w3o=;
        b=iN257nSWe/aahX6Q713k/C3ejN39Zxw+mz6DIopviuSs/5W7/y3GKTkcanaGsTPLvN
         c4P+9NS6KZaL1Kwl11IAxa08VJ1dQOa9kdFqnc9B2bJQO0Drt9J49J6hyn5PTEMvNHuC
         UDfs8lEFtrdrKeo3MH5pHExLi8tHwjNZBwwCwo1GHz8ekFlacvSgLChd8vbhxYMG5W6K
         Sz/PDTqXxt0Xbqq1FzpqzYM3r+Mznty65hCM4mW58T0XQinHchaD1OWZdQgL3C8Cmiuj
         YibNNuCuXFGLpRlDAz3exsU5i2UQCGZenRTqtiMofF6ik2vJZnTmx8kHLlp/SBkUwjCS
         6KkQ==
X-Gm-Message-State: AC+VfDxlvAnw9nVfg8Ne0p4/dOS4iYGCR4Q2cciv07e4GDvt4W2fLyO6
	6ifMBBpg1RLme8qO0iXGPCUg5w==
X-Google-Smtp-Source: ACHHUZ69ugSarTSAMXC6f5oL9jNd6KuCehtnlrYptJAQTMRmfWkWaZ+k5Pb6dtDwggIXeWsz/yggPg==
X-Received: by 2002:a17:902:e74c:b0:1aa:cddd:57f2 with SMTP id p12-20020a170902e74c00b001aacddd57f2mr12752642plf.25.1683546840856;
        Mon, 08 May 2023 04:54:00 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:54:00 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 08/21] RISC-V: ACPI: Cache and retrieve the RINTC structure
Date: Mon,  8 May 2023 17:22:24 +0530
Message-Id: <20230508115237.216337-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045403_514955_CB2347B0 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
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
 arch/riscv/include/asm/acpi.h | 10 ++++++++
 arch/riscv/kernel/acpi.c      | 45 +++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |  4 ++++
 3 files changed, 59 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 9be52b6ffae1..6519529c8bdf 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -59,6 +59,16 @@ static inline bool acpi_has_cpu_in_madt(void)
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
+void acpi_init_rintc_map(void);
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
+u32 get_acpi_id_for_cpu(int cpu);
+#else
+static inline void acpi_init_rintc_map(void) { }
+static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 81d448c41714..89e142611c84 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -24,6 +24,51 @@ EXPORT_SYMBOL(acpi_disabled);
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
+	/*
+	 * When CONFIG_SMP is disabled, mapping won't be created for
+	 * all cpus.
+	 * CPUs more than num_possible_cpus, will be ignored.
+	 */
+	if (cpuid >= 0 && cpuid < num_possible_cpus())
+		cpu_madt_rintc[cpuid] = *rintc;
+
+	return 0;
+}
+
+/*
+ * Instead of parsing (and freeing) the ACPI table, cache
+ * the RINTC structures since they are frequently used
+ * like in  cpuinfo.
+ */
+void __init acpi_init_rintc_map(void)
+{
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) <= 0) {
+		pr_err("No valid RINTC entries exist\n");
+		BUG();
+	}
+}
+
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	return &cpu_madt_rintc[cpu];
+}
+
+u32 get_acpi_id_for_cpu(int cpu)
+{
+	return acpi_cpu_get_madt_rintc(cpu)->uid;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 9fb839074e16..a44c7fcde12f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,7 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
@@ -293,6 +294,9 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
+	if (!acpi_disabled)
+		acpi_init_rintc_map();
+
 	riscv_init_cbo_blocksizes();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
