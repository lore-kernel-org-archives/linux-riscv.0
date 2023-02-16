Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4ABC636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnxruBTBx0e6ETK3CKPtS/DGKEJmCFd62OsmTFnX5CM=; b=wRIE85lQTQacdb
	hQ0NGKFUrzYMzewyWln1pKoPKlLz+VjWtTRK93VywIKcYHkaPJZkvVp4HrCzs5zCd/zz6HEIaPc6Z
	dlT+1TkvgcMhqH/Fk6G3VoweKb2lHC6CZYm37QYTJD7nKkzqLvejWhtxzpDhP3fwrn+n3lH9jpufC
	sVbXHm44nE+nPToUYm+vXVu89/5SvDTOXj0Bne1P8wBvhalanYsGZgGXr/oIvsh2zWbltlh3bjv5d
	ra0Gd0PrgqMhJDiqO5tkAhZgv3YOWH4WtWZUSjFWBRmGAayY1Gx28ZesqUjGfqtjG5M8BkE8VfBIt
	a+npvpnjjAeALNkTP0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitR-00BU7h-WE; Thu, 16 Feb 2023 18:22:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitP-00BU33-0M
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:22:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id m2so2944839plg.4
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+mNmph7z+0hgeAPhfRjYNKRnC89i/LR46jyYpJ0Apo=;
        b=l+E/4mGvkIJFMOx3vpketHl6w+OVgKH1DxDQBosv+JiXnn3EnFIE5kJx5+YzS6lLiS
         0rYHRmZl+afg6HhbnviJ+eKMj5yIjob50D2ExCAbohUNkrRvegMgK53TL+DatL6okNB1
         f+4FlaxZq63X6ZwMSDhpiwE6X2KLXp7s5x+yRBbSxUoHZgSQtI87+UVq0Z2HgJ9Ay/Zd
         yif3+oeSS9ykcKUaZq3ZNvy7s4zFmSY3VYzDbAcXZ0n7WsSQoMo4LXuYcp5xcp9ruJdm
         7QGg+T1xe2cQhLpXyD5XCOSgPN0bqnBE7qZdpVxAexRvSprB2mokXcWga7rVPXqE1fX0
         d8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+mNmph7z+0hgeAPhfRjYNKRnC89i/LR46jyYpJ0Apo=;
        b=COQqg4euDLZa8YthYVleOJTqpVdgW6mP8gpFyY4tlDWXTwQ04TRJcjZhMC/JvtjUcl
         HieRfp01WVXaX6md4y9LfqFr3dFltY0pwdZksATWTmpQm01R+3o2sYHWNFtaRYzWc9VZ
         CP9lwdABCwKyRgsbDZk+nFq/LXGiURGoc5fqgwdbU/eq9aQMRpENJJ91PW+j2rCyjkiz
         tIREeQiBoCEpfLY2QmLAKzCa7/4F8bjb0KOuFM4rcquTY97S6AvrDDsrRzE3BXIZ5q6k
         4/CTXix9faaPNTUW7sdF7VDf7Gl+q70mHrrhRzUd/rl2zxcDTaoGx9A1NnyxUg7FlRhT
         tV1g==
X-Gm-Message-State: AO0yUKWGcWJtAFZmLcIOBwQ41t4e0hbtZxA3b8wcj9LFhXtZO0lqUtAP
	cU0stE6VdVEmdpd3hw9GGAe+Zw==
X-Google-Smtp-Source: AK7set940eocbZJrVpFGvstTalckFPNlTIQlDCA11v5kbvJbNDaml4O2OhjVpI7zpc+dOhk9Rjo3Bg==
X-Received: by 2002:a17:90a:1ca:b0:234:106a:34b7 with SMTP id 10-20020a17090a01ca00b00234106a34b7mr7684245pjd.46.1676571719882;
        Thu, 16 Feb 2023 10:21:59 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:59 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 14/21] irqchip/riscv-intc: Add ACPI support
Date: Thu, 16 Feb 2023 23:50:36 +0530
Message-Id: <20230216182043.1946553-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102203_069792_9639C432 
X-CRM114-Status: GOOD (  14.69  )
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

Add support for initializing the RISC-V INTC driver on ACPI
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/irqchip/irq-riscv-intc.c | 78 +++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f229e3e66387..97a8db0fbc6c 100644
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
@@ -133,24 +158,53 @@ static int __init riscv_intc_init(struct device_node *node,
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
+	 * for each INTC. We only do INTC initialization
+	 * for the INTC belonging to the boot CPU (or boot HART).
+	 */
+	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
+		return 0;
+
+	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
+	if (!fn) {
+		pr_err("unable to allocate INTC FW node\n");
+		return -ENOMEM;
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
+IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
+		     ACPI_MADT_RINTC_VERSION_V1, riscv_intc_acpi_init);
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
