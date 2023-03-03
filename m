Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E9BC678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Gy6Xx3mvmXgF5noVfvTa9ybFqxfbICh2Bx2i4UA5qg=; b=45VfQskFP58//4
	NfP2gmacxMi5qudXZcSkRxJ/kbpjvBoJhg/vBijiiwnQ69J3rhX7OSI5rklgHAoqVQGwfA1qxrnz7
	LERsgJdw2L1bZVcp9RU8NGZOlUomhPkYylTyh+E2bRD7Shz8sxgPIgPBXuI7LnAkVVkJhJDdvE1IF
	L1ZCw1hYZXLhttoDLuMkzI1WdzCGxiAMQhY+7matF+MO4kViECV3wNbzGdL+h195/TaWGoCyGeEEM
	Gzf3qmWaJamQ0QbdTok70rmfceQH3pbDTRFEvTlmn7ZqMKKoEDJmyN+xaBawRNq6HSSZnSvF89mXv
	IwuOWbalo5QBUIZXhQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5c9-006Tvm-HS; Fri, 03 Mar 2023 13:38:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5c6-006TVf-Gt
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:38:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id i5so2695053pla.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnWMRVmSE/FRN1G4jePLo7NyPHxO3nOfwGFEZAQeYgw=;
        b=AG/Tf51+s22adpeRGvtvyn8utYIGCZCOngUStWWIN4Xvgcjf9OT7yemtdcuDE9RF73
         Tp2l5evMan993UfOjExmWatX1Ej6KbCl21v/LybejXpIcTUMKt65Yc8taUjveX6u48Te
         1UFN6b3oiLuPxRLljwFChqMEPCWO3uCiRB4XQ8VZZjRMqpHyhS+wKyBI8w993vl3rxYs
         AXb0qEGrWMbN89nZ5JRoB/PYsUA/yWnhiHulSKHbq5h8+VF+/HFRkoUp1T/41VLNGEBY
         WMRc9UqlSwE4zk2Z+8oReKckCgw/IkBYNrFQXQNBSnPj961BIKn43KCLUezicY1o3EUf
         Gtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnWMRVmSE/FRN1G4jePLo7NyPHxO3nOfwGFEZAQeYgw=;
        b=fM7RSUlVNaUcU6nkV6uvPoUhzlrc20aSjdkxnf+gGPOueRV4sWIHfbYnblUVWVJwq0
         5aNq771JjgxzxRCxPJYpyYRci8psI3UgTYw5FLF4cKYQP2cnT7PzLWYb+QjwoTddNcXT
         /G2DEsMDCFLBbVpYsqkVvrgZfY+ApbqnpXXyC4BNJdX0f5ya21506sYYcY8ilGjW5F/B
         GGM1B0ge+7QnlHhiYDPKuM0h+uCU80PBQc56dGHZBz17vIEWS7lIlnvYMfUPng9eE7mb
         qzlGoTw8sIsBSE5rSSJDXlZGzNujrUrXmo+xpKtMcoNqPLAzI8HbZutShaEXVfhygE2D
         TVHA==
X-Gm-Message-State: AO0yUKXFgipOytr4zLthw453SihE16gTg58T0FYXAs5j416MMrns4MYe
	Ufb6uA4fFd0W9IzJO9Fr+5ylhU5F2pinTtWU
X-Google-Smtp-Source: AK7set+V51+07N8qgFm1g2lKLOWif8Yck9PdXztlJ+r/xz8awvRzgCb/QA45Sz9lhXFjogmhYXfMNA==
X-Received: by 2002:a17:903:124a:b0:19c:d550:803e with SMTP id u10-20020a170903124a00b0019cd550803emr2225851plh.57.1677850701885;
        Fri, 03 Mar 2023 05:38:21 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:21 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 18/20] RISC-V: Add ACPI initialization in setup_arch()
Date: Fri,  3 Mar 2023 19:06:45 +0530
Message-Id: <20230303133647.845095-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053822_589627_73DC766A 
X-CRM114-Status: GOOD (  28.41  )
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

Initialize the ACPI core for RISC-V during boot.

ACPI tables and interpreter are initialized based on
the information passed from the firmware and the value of
the kernel parameter 'acpi'.

With ACPI support added for RISC-V, the kernel parameter 'acpi'
is also supported on RISC-V. Hence, update the documentation.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../admin-guide/kernel-parameters.txt         |   8 +-
 arch/riscv/kernel/acpi.c                      | 126 ++++++++++++++++++
 arch/riscv/kernel/setup.c                     |  25 ++--
 3 files changed, 147 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6221a1d057dd..047679554453 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1,17 +1,17 @@
-	acpi=		[HW,ACPI,X86,ARM64]
+	acpi=		[HW,ACPI,X86,ARM64,RISCV64]
 			Advanced Configuration and Power Interface
 			Format: { force | on | off | strict | noirq | rsdt |
 				  copy_dsdt }
 			force -- enable ACPI if default was off
-			on -- enable ACPI but allow fallback to DT [arm64]
+			on -- enable ACPI but allow fallback to DT [arm64,riscv64]
 			off -- disable ACPI if default was on
 			noirq -- do not use ACPI for IRQ routing
 			strict -- Be less tolerant of platforms that are not
 				strictly ACPI specification compliant.
 			rsdt -- prefer RSDT over (default) XSDT
 			copy_dsdt -- copy DSDT to memory
-			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
-			are available
+			For ARM64 and RISCV64, ONLY "acpi=off", "acpi=on" or
+			"acpi=force" are available
 
 			See also Documentation/power/runtime_pm.rst, pci=noacpi
 
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 8b3d68d8225f..9b6841700e30 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -16,6 +16,7 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 #include <linux/pci.h>
+#include <linux/efi.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
 int acpi_disabled = 1;
@@ -25,6 +26,131 @@ int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
 static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
+static bool param_acpi_off __initdata;
+static bool param_acpi_on __initdata;
+static bool param_acpi_force __initdata;
+
+static int __init parse_acpi(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	/* "acpi=off" disables both ACPI table parsing and interpreter */
+	if (strcmp(arg, "off") == 0)
+		param_acpi_off = true;
+	else if (strcmp(arg, "on") == 0) /* prefer ACPI over DT */
+		param_acpi_on = true;
+	else if (strcmp(arg, "force") == 0) /* force ACPI to be enabled */
+		param_acpi_force = true;
+	else
+		return -EINVAL;	/* Core will print when we return error */
+
+	return 0;
+}
+early_param("acpi", parse_acpi);
+
+/*
+ * acpi_fadt_sanity_check() - Check FADT presence and carry out sanity
+ *			      checks on it
+ *
+ * Return 0 on success,  <0 on failure
+ */
+static int __init acpi_fadt_sanity_check(void)
+{
+	struct acpi_table_header *table;
+	struct acpi_table_fadt *fadt;
+	acpi_status status;
+	int ret = 0;
+
+	/*
+	 * FADT is required on riscv; retrieve it to check its presence
+	 * and carry out revision and ACPI HW reduced compliancy tests
+	 */
+	status = acpi_get_table(ACPI_SIG_FADT, 0, &table);
+	if (ACPI_FAILURE(status)) {
+		const char *msg = acpi_format_exception(status);
+
+		pr_err("Failed to get FADT table, %s\n", msg);
+		return -ENODEV;
+	}
+
+	fadt = (struct acpi_table_fadt *)table;
+
+	/*
+	 * Revision in table header is the FADT Major revision, and there
+	 * is a minor revision of FADT.
+	 *
+	 * TODO: Currently, we check for 6.5 as the minimum version to check
+	 * for HW_REDUCED flag. However, once RISC-V updates are released in
+	 * the ACPI spec, we need to update this check for exact minor revision
+	 */
+	if (table->revision < 6 || (table->revision == 6 && fadt->minor_revision < 5)) {
+		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 6.5+\n",
+		       table->revision, fadt->minor_revision);
+	}
+
+	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {
+		pr_err("FADT not ACPI hardware reduced compliant\n");
+		ret = -EINVAL;
+	}
+
+	/*
+	 * acpi_get_table() creates FADT table mapping that
+	 * should be released after parsing and before resuming boot
+	 */
+	acpi_put_table(table);
+	return ret;
+}
+
+/*
+ * acpi_boot_table_init() called from setup_arch(), always.
+ *	1. find RSDP and get its address, and then find XSDT
+ *	2. extract all tables and checksums them all
+ *	3. check ACPI FADT HW reduced flag
+ *
+ * We can parse ACPI boot-time tables such as MADT after
+ * this function is called.
+ *
+ * On return ACPI is enabled if either:
+ *
+ * - ACPI tables are initialized and sanity checks passed
+ * - acpi=force was passed in the command line and ACPI was not disabled
+ *   explicitly through acpi=off command line parameter
+ *
+ * ACPI is disabled on function return otherwise
+ */
+void __init acpi_boot_table_init(void)
+{
+	/*
+	 * Enable ACPI instead of device tree unless
+	 * - ACPI has been disabled explicitly (acpi=off), or
+	 * - firmware has not populated ACPI ptr in EFI system table
+	 *   and ACPI has not been [force] enabled (acpi=on|force)
+	 */
+	if (param_acpi_off ||
+	    (!param_acpi_on && !param_acpi_force &&
+	     efi.acpi20 == EFI_INVALID_TABLE_ADDR))
+		return;
+
+	/*
+	 * ACPI is disabled at this point. Enable it in order to parse
+	 * the ACPI tables and carry out sanity checks
+	 */
+	enable_acpi();
+
+	/*
+	 * If ACPI tables are initialized and FADT sanity checks passed,
+	 * leave ACPI enabled and carry on booting; otherwise disable ACPI
+	 * on initialization error.
+	 * If acpi=force was passed on the command line it forces ACPI
+	 * to be enabled even if its initialization failed.
+	 */
+	if (acpi_table_init() || acpi_fadt_sanity_check()) {
+		pr_err("Failed to init ACPI tables\n");
+		if (!param_acpi_force)
+			disable_acpi();
+	}
+}
 
 static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
 {
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2d45a416d283..7b2b065a9f70 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -8,6 +8,7 @@
  *  Nick Kossifidis <mick@ics.forth.gr>
  */
 
+#include <linux/acpi.h>
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
@@ -276,14 +277,22 @@ void __init setup_arch(char **cmdline_p)
 
 	efi_init();
 	paging_init();
-#if IS_ENABLED(CONFIG_BUILTIN_DTB)
-	unflatten_and_copy_device_tree();
-#else
-	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
-		unflatten_device_tree();
-	else
-		pr_err("No DTB found in kernel mappings\n");
-#endif
+
+	/* Parse the ACPI tables for possible boot-time configuration */
+	acpi_boot_table_init();
+	if (acpi_disabled) {
+		if (IS_ENABLED(CONFIG_BUILTIN_DTB)) {
+			unflatten_and_copy_device_tree();
+		} else {
+			if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
+				unflatten_device_tree();
+			else
+				pr_err("No DTB found in kernel mappings\n");
+		}
+	} else {
+		early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa)));
+	}
+
 	early_init_fdt_scan_reserved_mem();
 	misc_mem_init();
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
