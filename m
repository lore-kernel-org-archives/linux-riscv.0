Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A36C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XgryRLj0sKfcMWm4qpvjqtaA0RDfue+9IHqUVnRnM8=; b=BOE9Z4hoaCRT1T
	VjGa/DQx2Gzm2Vr4iut8ikLMUgabJL2Uy+AUdD0eIFdx8cV98ndDqFXhYNCFSEwACo6gX+f6vuXDG
	jP5D7Lo39wFbPwHtao24MV6KG9s445+qOmXxyYnVJI+dvkcMlf5MwtVcaVb/ik1UR6WraxsWhJu4N
	QTkFy+ckcRThDkS1zDfyoRco5Y/VV3lHCm3qMYFIgoPp/QfYtjiUlIm/wg+AtVDmmPXPubF7ZUgse
	4LKePzpOSERHDR6e7FtJNnM4UqLDZ5KUCaSxIBpFVuwg0tkyeSUNuF4s211+mFKAJ850KwpgFyaY8
	Mh0jbK8quTAUJH+mg+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bh-006TYp-QM; Fri, 03 Mar 2023 13:37:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5be-006TVf-M1
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id i5so2693688pla.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZDqAIiQh1iz6zpk7hAy2IsEozk94KbzxqCS/Vkjh5o=;
        b=n9umgm4XarNc8gsfjp46IzZiTpAtE1BOvMr6t0GaPEd94V3o+dimvJdd2NYqtOt78O
         Wk+cZPGvnjxrCP3dVWSfVY9zKY3X8tqXfP3UdsGlTOPWW154spoB+PqEfdHwPD4Qpb/J
         7LRu60H/NBGrMRCOkbBn+Dr0fJMKGQRJPePyLQ6anbUECkmPLh70AerRQEj8aUiZrnG5
         u5fn27T3NYKQvJGj2iKX0KpqsKqK1amngKRdJ1OkVxEawrTVxLYuoc8z5OBzyFIm9Uwj
         YfO0Nnzktsu7Kdq4Wb/adAasHPg9ygDntDuGxorrprkG3NkNqIi/oSuy4LdlkhpXJtu0
         CcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZDqAIiQh1iz6zpk7hAy2IsEozk94KbzxqCS/Vkjh5o=;
        b=XzuEodHnoy+hfhtog9sl1N2XAlIN31iqM9VHgkVcgNBJYNPX84f+wPCjPSyiW2WZ23
         g5p2CMBULKKU1KUdXmS83MajUd8f6zmGjWow1zwkBrwH/BEQ2+3suhcdy9ZHGODktqXN
         FYaSkhiP+RbpKN/VsJuwR/q9vD+PEhFmRvyCV7O0DrVJWmghr2jsm9eO+lhfU8QTaVO5
         MUqNE+98tGZx8R3tZNo1OOJrtJWcbIDVSHX5iR4NEUALVM50HnVkQHcyD5rrPJsuJ0IE
         3Wb8lO5QiPvUETheY+7JmtC/B367R/A0Oy31wvqg1kUuE+bDgd0OSQMz6BJJ3TSrDpfn
         TyNQ==
X-Gm-Message-State: AO0yUKVP+zdQv8P5/yf7B1nvKN73FNt8ol4gYgLyMvc/JHJYDXn6OUMY
	NC681mvJWM5fqcgo2UqkldCNZMXuu02Sfy0k
X-Google-Smtp-Source: AK7set8J/vYbwyD1m4XRQ3AgWGRchGR8NoRHsIuocp3J3fFoa1b+Rs9bDGRjPxWCAPErZncQBtxuqg==
X-Received: by 2002:a17:90a:db92:b0:237:44ad:5124 with SMTP id h18-20020a17090adb9200b0023744ad5124mr1650183pjv.42.1677850673253;
        Fri, 03 Mar 2023 05:37:53 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:52 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 12/20] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
Date: Fri,  3 Mar 2023 19:06:39 +0530
Message-Id: <20230303133647.845095-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053754_773063_27432A69 
X-CRM114-Status: GOOD (  14.33  )
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

On ACPI based systems, the information about the hart
like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
Enable filling up hwcap structure based on the information in RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..478dbf129922 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
@@ -13,6 +14,8 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
@@ -91,7 +94,9 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	unsigned long hartid;
+	struct acpi_table_header *rhct;
+	acpi_status status;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -104,18 +109,33 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
+	}
+
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		rc = riscv_of_processor_hartid(node, &hartid);
-		if (rc < 0)
-			continue;
-
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
-			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-			continue;
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (node) {
+				rc = of_property_read_string(node, "riscv,isa", &isa);
+				of_node_put(node);
+				if (rc) {
+					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
+					continue;
+				}
+			}
+		} else {
+			rc = acpi_get_riscv_isa(rhct, get_acpi_id_for_cpu(cpu), &isa);
+			if (rc < 0) {
+				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
+				continue;
+			}
 		}
 
 		temp = isa;
@@ -248,6 +268,9 @@ void __init riscv_fill_hwcap(void)
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
+	if (!acpi_disabled && rhct)
+		acpi_put_table((struct acpi_table_header *)rhct);
+
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
