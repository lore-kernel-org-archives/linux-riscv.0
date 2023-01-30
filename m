Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F62C61D97
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xnta/bmTVuy4UxbZ4S5HPl3SkMBnApaqlVWYgu2cw28=; b=q6XTpiHZYF2Tvt
	btpueD5LLUNyoTMX171hB8ZFMIER32vbGkXMGl7KNxNvKhqQjUsBPEXNH2RL+3eOFI6dlYYzhj5k6
	DYAEgk+5Wkk/tPTBAZYz1Ks46UMpUhL3mgvbVC38+lLy2zAjaPB/tsko0yQchADJx+UstJQeojLUr
	S59lHsG5aVQMdlPsqkaJA12r8l4c5I+snI8AbdlyJELVLJRfh3f0ksTSFw3jKL/o9oh1L9/Uakqyl
	hoGEP+Anij58UESfn70OltF9s3AOECCY0ip4JDbsv4/f8hXFDkIK9ZHpVD+aPeFWkG41VaK0853yv
	APW5tvcEf0zWRekN21rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYqq-004yOs-St; Mon, 30 Jan 2023 18:25:56 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYoP-004x4w-Bq
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:26 +0000
Received: by mail-pj1-x102a.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so5357931pjb.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/7p8mpWwrRZDJ0Ssv5B2rQ0QEcsG8FyQnZGa88XnoU=;
        b=PW+JkRB4EcpFyhCBbGvgqbqLOB8Ov8q0vsn9Z5bbhMkMlF/2+7eW27QVw4YVoMmlyu
         bVamRDgEm2QzEPQk4lCpp0rjmuPrZX/AFddnJcQBQxnflSDDa8CTulnMOTeuSQ94xMmp
         YiJlwQ3EL/bxTVczbemObTMHUVp7/Kb4fQcRLsjDdDTswPYS3tp7Y3qZJ654JLsXQFA+
         sqd5gTjZZNVRseZskZuH+9xzzFXfpYjqF4Rn1CnMFtxi8CwANtVxsa1syuQyzjGS6Kqc
         R5JwHbtjnYh4NIvyUUzEYRdHX40u97uY5TcnrqH3EqEzJcnm2f0zxGAqBoANMRl7MiQT
         E+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/7p8mpWwrRZDJ0Ssv5B2rQ0QEcsG8FyQnZGa88XnoU=;
        b=T4w5eScmNW0Fw6+ygT1RhJeCa7s36lDwc16ttOjBGERqWg83+1X7LPF0owO1WDKnQM
         CyU+tyKSRjy8/2trluzub7bjxP+p14SKs7hBUHe8aVIRawuBBpR1y/1aSHKdA5Gt7dYk
         sUFohBa24zZXO5kD0VISnTUAKx4l/WuL4YnAOwUPdEy1ZeHgZV9zVPs18HKm0iI3kwki
         X4KIXpWaFPUJOKQd9fWzwm2pgyvvY+R3c2N4dlIlYi2jKyJlsRsZP2xsRQkcDmsFVFY9
         t4H6j1JF9r3tYcb0Py3wlFulCoQIvv4JHhr2aV7x6A8B4AYEwHlu37sCEg34igpWPmzC
         cCog==
X-Gm-Message-State: AO0yUKVUx456eok5/UpPjc1ai+7aj7PIpulQLfztjFB+fJWi1xcvrWjr
	uJA9+2tV4tiTVPtsRCfhWyHZHg==
X-Google-Smtp-Source: AK7set/O9E/ul7V9nZdfoDMHFdpq19d+UP5/qbcgqnRZAgazc3TW9AomhsBc2fFFKf/jDgy9fCJUrA==
X-Received: by 2002:a17:902:e20c:b0:196:7f9c:6c86 with SMTP id u12-20020a170902e20c00b001967f9c6c86mr4411085plb.45.1675103004634;
        Mon, 30 Jan 2023 10:23:24 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:24 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 11/24] RISC-V: ACPI: irqchip/riscv-intc: Add ACPI support
Date: Mon, 30 Jan 2023 23:52:12 +0530
Message-Id: <20230130182225.2471414-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102325_449044_EC6CD942 
X-CRM114-Status: GOOD (  14.93  )
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

Add support for initializing the RISC-V INTC driver on ACPI based
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 79 +++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f229e3e66387..044ec92fcba7 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -6,6 +6,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-intc: " fmt
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bits.h>
 #include <linux/cpu.h>
@@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 	return intc_domain->fwnode;
 }
 
+static int __init riscv_intc_init_common(struct fwnode_handle *fn)
+{
+	int rc;
+
+	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
+					       &riscv_intc_domain_ops, NULL);
+	if (!intc_domain) {
+		pr_err("unable to add IRQ domain\n");
+		return -ENXIO;
+	}
+
+	rc = set_handle_irq(&riscv_intc_irq);
+	if (rc) {
+		pr_err("failed to set irq handler\n");
+		return rc;
+	}
+
+	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+
+	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+
+	return 0;
+}
+
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
@@ -133,24 +158,54 @@ static int __init riscv_intc_init(struct device_node *node,
 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
 		return 0;
 
-	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
-					    &riscv_intc_domain_ops, NULL);
-	if (!intc_domain) {
-		pr_err("unable to add IRQ domain\n");
-		return -ENXIO;
-	}
-
-	rc = set_handle_irq(&riscv_intc_irq);
+	rc = riscv_intc_init_common(of_node_to_fwnode(node));
 	if (rc) {
-		pr_err("failed to set irq handler\n");
+		pr_err("failed to initialize INTC\n");
 		return rc;
 	}
 
-	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+	return 0;
+}
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
+
+#ifdef CONFIG_ACPI
+
+static int __init
+riscv_intc_acpi_init(union acpi_subtable_headers *header,
+		     const unsigned long end)
+{
+	int rc;
+	struct fwnode_handle *fn;
+	struct acpi_madt_rintc *rintc;
+
+	rintc = (struct acpi_madt_rintc *)header;
+
+	/*
+	 * The ACPI MADT will have one INTC for each CPU (or HART)
+	 * so riscv_intc_acpi_init() function will be called once
+	 * for each INTC. We only need to do INTC initialization
+	 * for the INTC belonging to the boot CPU (or boot HART).
+	 */
+	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
+		return 0;
+
+	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
+	WARN_ON(fn == NULL);
+	if (!fn) {
+		pr_err("unable to allocate INTC FW node\n");
+		return -1;
+	}
+
+	rc = riscv_intc_init_common(fn);
+	if (rc) {
+		pr_err("failed to initialize INTC\n");
+		return rc;
+	}
 
 	return 0;
 }
 
-IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
+IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC,
+		     NULL, 1, riscv_intc_acpi_init);
+#endif
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
