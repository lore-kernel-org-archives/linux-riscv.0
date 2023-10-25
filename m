Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE94C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4InUAwAVyQE32cFpoqedWPL9nk1w3kUWefMFdtUrpqA=; b=w29vV5DGAGP5sc
	XXgykx3KinM4QpSdOTjvdwvn08Am5k7tdnYV7K1jhbMx1tr1G9+p3laVpnl06UIpFc1karMu0srbJ
	jHuIgDsyoWc9PgNV7ntGvHpyYhaVtWpjBM0wUjrDQl4wVFgzzGJH+2dm/eSzpbnsOlgrx48KfLYxI
	vCn9aL9XmhdbXH9DvGK3/3n17ks20l9AT+6prUCS2wspXMIrllJURzZgQw+QNnXE6/tg8j28amSJY
	reSQ0Xq56kxfQvJ+R2d9lU7591/PMVfhcaaAInLPt/2d9vPW5CEASkxP69trD/Pcu1yJY3laJUofD
	sI1gHT+TRL295kCXVvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRf-00D3RL-0H;
	Wed, 25 Oct 2023 20:25:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkR9-00D319-21
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6b9af7d41d2so154746b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265507; x=1698870307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxzCTJ+m1lwBq+RMy/cftySc6UneYPqTwJF8JhbniDw=;
        b=pUfO6dChYmz+oFbJFBygPFZetmEmeu++WzPOLGypMxKaefkm+foOpM0ORzPiiwGTBg
         GTJOVKiI0SN+FIO3hGtO2/oJVcMnMccuSpmZBNVhTxz03Y+0fhfTt3YiDSr+t+Bp7Xxb
         6uJuDBFqGsKSZsxUhtrb04bSZCSUOW36D9y2EdAYP1+UcDzITNcIaMZujb+8A50M59w8
         mi7CSHwoOoXlbt5+K/CabltkjnxFC3If+mzqaHSam49jRbBBHxqT2+FPtTY0sRe8EvNd
         zHsGwXX6W8L51nF1Hi4qYqFKbmJSlPq/kA4NLgyKmMW1F5tKuG0RlDMPTGj1Iy3q1uwt
         y1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265507; x=1698870307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxzCTJ+m1lwBq+RMy/cftySc6UneYPqTwJF8JhbniDw=;
        b=SERfznw3mzn2egFbwrKmKJAH6bjMziL8aq0WqW2oKRJSv217yq0cqyKDypSDuJO6Us
         oSvW/7h+6HXp/Ptz4f4B3lZwyxFqoRXazcecMJCLc6+n+PNBUqH/QPNjDfHZjA7fg0um
         GdHdlWmy0q8EYV4JqPxiGr5nmaAVzBhGBQcudA7suuFeHDFzah1F15whLKnnpotqZ12q
         qmbCYvfVkIkq6F6utugGy8HPxiSQsaQnhcnzWFmhyXn+r/JPjuUzsbBP/tDJjo/L1PYO
         WzFTA6Qsp6gM5sBfXcNVNUasgcN2osfhBmXVlU44mvCVvxM0Qi239r0OG/ygg4m7NDv9
         tVIw==
X-Gm-Message-State: AOJu0YxXbLXBFsPIN7nGQE8zwKS9L2Jy4EDr8LzA0YFc63+Op4uXDaR/
	dPUZ0lgtUlCQBo6C4dABhERtvg==
X-Google-Smtp-Source: AGHT+IFKGK+9x6obxjzCs3/eR+3q/3iIQzNNW6EXTTk1GAvemcOrYvQgO6IFBiNDzQzfVY0iJ8I2bw==
X-Received: by 2002:a05:6a00:2d91:b0:690:d4fa:d43d with SMTP id fb17-20020a056a002d9100b00690d4fad43dmr14404404pfb.6.1698265506987;
        Wed, 25 Oct 2023 13:25:06 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:06 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 10/21] ACPI: RISC-V: Implement arch function to reorder irqchip probe entries
Date: Thu, 26 Oct 2023 01:53:33 +0530
Message-Id: <20231025202344.581132-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132507_697151_0FE3FF71 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPI MADT entries for interrupt controllers don't have a way to describe
the hierarchy. However, the hierarchy is known to the architecture and
on RISC-V platforms, the MADT sub table types are ordered in the
incremental order from the root controller which is RINTC. So, add
architecture function for RISC-V to reorder the interrupt controller
probing as per the hierarchy as below.

RINTC->IMSIC->APLIC->PLIC

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/Makefile |  2 +-
 drivers/acpi/riscv/irq.c    | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/irq.c

diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 8b3b126e0b94..f80b3da230e9 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y 	+= rhct.o
+obj-y 	+= rhct.o irq.o
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
new file mode 100644
index 000000000000..36e0525b3235
--- /dev/null
+++ b/drivers/acpi/riscv/irq.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#include <linux/acpi.h>
+#include <linux/sort.h>
+
+static int irqchip_cmp_func(const void *in0, const void *in1)
+{
+	struct acpi_probe_entry *elem0 = (struct acpi_probe_entry *)in0;
+	struct acpi_probe_entry *elem1 = (struct acpi_probe_entry *)in1;
+
+	return (elem0->type > elem1->type) - (elem0->type < elem1->type);
+}
+
+/*
+ * RISC-V irqchips in MADT of ACPI spec are defined in the same order how
+ * they should be probed. Since IRQCHIP_ACPI_DECLARE doesn't define any
+ * order, this arch function will reorder the probe functions as per the
+ * required order for the architecture.
+ */
+void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr)
+{
+	struct acpi_probe_entry *ape = ap_head;
+
+	if (nr == 1 || !ACPI_COMPARE_NAMESEG(ACPI_SIG_MADT, ape->id))
+		return;
+	sort(ape, nr, sizeof(*ape), irqchip_cmp_func, NULL);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
