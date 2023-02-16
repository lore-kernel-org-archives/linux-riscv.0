Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDA7C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDF2ioizATTO/2oAWGljm5ucN5rDD1hWaiboVxh7noU=; b=qBmumP97loXdW0
	7pL86DNuwt7uWOBoxoNYekVsYgEZcnyKOQygLqS66kRx7X0IpAVy4IPev5YpTHr2rwsy+RrKOc3Fb
	UkpDlxdYyxpQkkIwEbCwGJveZ5CjI1RxWwpW2xVb/mIlM1nhMKlMWsiJNByxds4bOfvuYqeUmjw/d
	E9iqIhAgo7mksSMd/LKyun5VxQDAY/qcXYIhVyvvEAHcBfBbprGiZ0xLskaG4BG9S/FeiEMcY05bo
	1f8Bpxa1GguTIFiHwP8ANCrRODX041LTsMa51w4KdUZEKk7wueMCQAFsepcOcsEtj3W3yI36fCkVZ
	U/WQR1CqMNklfnY+ZgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitH-00BTz6-OG; Thu, 16 Feb 2023 18:21:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitF-00BTvS-9d
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id x4-20020a17090a388400b002349a303ca5so2450999pjb.4
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVlhq9jJF5fkqCwNhAPs1olNplFdF6B5WclRLPqFQkc=;
        b=Ih5cdvHUc+6binLwjpr9QH0EbQBhTLyXOn/RYXvnmLofBP2hcHPkdG0+7hRgOIc02B
         5GjCVp29i00cLIPLwY831s+ehgLGUY5ccr/5K8Ey+Q9UIFlTzXxleMG/mmV+zz0rmfxx
         EeCcij3QYpom+JUlpOhqSPVU14ZW5Q01dfQ9xD0heAmdGyuYsIbPcwN2dc6YsfWyPYvh
         liTNxl3kFNv75Su6bUJ37zkzS0WxwE7ZOgsJ4PWqf/bMl4qPijkYC+2QM6Y2e1gJ/1DG
         szGLGMguiud/r0MyWRTMx0xryUd8EIMUNOEcamcLUNJP+REakrD9PxQOyILiHtEZ2zJ+
         im/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVlhq9jJF5fkqCwNhAPs1olNplFdF6B5WclRLPqFQkc=;
        b=EyDdhAIyFDdF/H/sI2eUS8ZhMocMAcEX4n8FxKoe24OgO4exJrzIb+uug8iwBY3aB1
         fSmhys5mRM9dt7BsjPkiT+0My7fqPR9BixhiFaTFrCu9qI4JH22/9FEXGpDo+7kkWKh8
         IF2Qjye+CQB2tvmVZ8TudJb4MiMnffVgJs2xFwlNg5EEIkfGHNhIOdBMA4LL9b8PDPu0
         UHnwXFzpKudIGxzuwmY/yHeawd22f3bZkDxhdK+dFZB7yUg+3LoxzOl2FOSGn4KYKkau
         rmhwdQ5c9BCfs9HFxhi6VpLIiWKi70R6LIOYIgX7DFAUCRYOLKDaNoI7wKbd6a+0PidK
         +VAA==
X-Gm-Message-State: AO0yUKUxdObkSFqTSKWaFB/mb/gKSxaQNgX7OumdHFQlZF48FPi43H0a
	qWQ1XmcHrJRP5DXFrTKg5OCwBQ==
X-Google-Smtp-Source: AK7set+h7vf0LoZNkAGb2ghe6awEhCUdpqK+4V6FZ+wNFpKTON2Ckkza6yhNBDRyc7g3pDb0ZFspUg==
X-Received: by 2002:a05:6a21:7899:b0:c7:6664:1e07 with SMTP id bf25-20020a056a21789900b000c766641e07mr202270pzc.28.1676571710197;
        Thu, 16 Feb 2023 10:21:50 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:49 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 12/21] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
Date: Thu, 16 Feb 2023 23:50:34 +0530
Message-Id: <20230216182043.1946553-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102153_356739_455E0444 
X-CRM114-Status: GOOD (  13.94  )
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

On ACPI based systems, the information about the hart
like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
Enable filling up hwcap structure based on the information in RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..cb67d3fcbb56 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -6,12 +6,15 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
@@ -93,7 +96,10 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
+	struct acpi_table_header *rhct;
+	acpi_status status;
 	unsigned long hartid;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -106,18 +112,36 @@ void __init riscv_fill_hwcap(void)
 
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
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (node) {
+				rc = riscv_of_processor_hartid(node, &hartid);
+				if (rc < 0)
+					continue;
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
-			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-			continue;
+				if (of_property_read_string(node, "riscv,isa", &isa)) {
+					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
+					continue;
+				}
+				of_node_put(node);
+			}
+		} else {
+			rc = acpi_get_riscv_isa(rhct, get_acpi_id_for_cpu(cpu), &isa);
+			if (rc < 0) {
+				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
+				continue;
+			}
 		}
 
 		temp = isa;
@@ -248,6 +272,9 @@ void __init riscv_fill_hwcap(void)
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
+	if (!acpi_disabled)
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
