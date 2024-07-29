Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95520C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEpChhi0TgK/35qNuPdmSWXVNpO+65V2bDt/ktQbWhM=; b=ZIFn1df/9eYTns
	5jtaaT+qRgcNKp61YetqFVBLy8amZxTGPXh0Ao4kOul9RiRIlJon/IVFo49JtMvqXAAXpoiMerPNE
	MUrySh3wY+Uf5pf00kqIERmyE0D+morkOpzINo3/YriOKHvP6bI/yx2sclSQNnPtc7RUdH3FryUeT
	f9r11+wQrvJhJBFhOY3kSTT6G/M8lbhw8iMzDF7qdNbr2LR3Px5X8G6zi5edQUMC0cCFEL+Vhdd/2
	hQCX+1xnwqQZ/EA5javI5Amy+CUoHZ06qS0HA4Z4RZyt17vIPGGLvuq2phFUI9gsR+6fqNJOpHmTD
	eNBDlApfTrfy5eR2hUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRY4-0000000BgAI-06ga;
	Mon, 29 Jul 2024 14:40:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRI0-0000000BYud-0zG6
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fda7fa60a9so28832465ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263032; x=1722867832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbM0a+feX6KT++9LC9tUXyb/bLPakmTLy8AENK3qxq4=;
        b=njtDhEk4Wvc64or7d5sMwyM28mLkg6FOnldPvyQI2IydXqJb/mGlS+0/LjhCmh+UtE
         cFv8++qiVd1UfcIV5wpBHrfiwBVq1au8H/nx7RZinLPlnFPAdvfdUZ4pixN0FIsxiWcN
         0yhTOj9MBRNAPNY6PEJSX2+C0hg7btC4e2A/OA4v4TzcQJVCFYYWZ+m8ypakNZ8hGwgV
         4F2FGIcqDGqMtbJvShPKfD3Ri/MFsHm5OhKMOjozBvvbDwWOfoZijeZLU2vF7sW2uoau
         acreoulj5NjMdf0ABfZvjSeEoBmsevcFFqluiAMY3Kkn9BRP5gYRj7+PgjoUYpg5L788
         tw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263032; x=1722867832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbM0a+feX6KT++9LC9tUXyb/bLPakmTLy8AENK3qxq4=;
        b=cj8RJ0UuHKssIJ5r9AsANheqSq3mcUBS0KZrqw568rfKPntlRF9UXwn/BzlzmEMxYz
         V67Oy+3ABANoEinjJ6BGJTV+ZPQOjLGmZziPZkj7HL+R0vzFa7AleuUFlxqx2BXhScQ0
         bPuS+b27nHD4Ln60lONBTtFX+wF1gMXqJ7MPZOU1b04T+F3hTwetEsRxSQpK7usH1u+z
         /oapwnnzDjnWpt1x21U6Org++Y9bwu3wT/gj+39pYb52yuDefr3oAdz8ta2yWRql0WVA
         +ek66q2KFH2WGXiD7a4CIihGpPXxmOVNbVUVCvL4uAWCGdhst3zB+8uqPL1W6DRqsoaP
         4QEw==
X-Forwarded-Encrypted: i=1; AJvYcCWVM32qTqNLCDUx0iwm22x2YCZczMhZ19THO1MxR5+Xk5ZEQPHuLMr4TmR8mx6zWzrFr3Jt0r/8WkIR9SKlRRlMo1k5faOG7u2MfuaC8ZFP
X-Gm-Message-State: AOJu0YzcpDKoBxDKN13tl5L2dbu3rIV1NXbOu4hEGzs8a1Tbpd838Pb8
	YaIHZBtZrK5zY+9qWJsz6Axi6cAcWCrtrCvB/4Q0xVJaExaN86xUjR4zpmoJEjQ=
X-Google-Smtp-Source: AGHT+IFH4IFEEqFnFuD3LFxB9/YGdoZ1voAL0RS56DOiFLXrkbkYEDIaLZyWRT2+lCXe+UQYlpMB3Q==
X-Received: by 2002:a17:902:d4ce:b0:1fd:a360:447b with SMTP id d9443c01a7336-1ff048b7daemr104566225ad.52.1722263031612;
        Mon, 29 Jul 2024 07:23:51 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:51 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 10/17] ACPI: RISC-V: Implement function to reorder irqchip probe entries
Date: Mon, 29 Jul 2024 19:52:32 +0530
Message-ID: <20240729142241.733357-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072352_320466_0473E788 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Anup Patel <anup@brainfault.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On RISC-V platforms, the RINTC structures should be probed before any
other interrupt controller structures and IMSIC before APLIC. This order
is established by using MADT sub table types which are ordered in the
incremental order from the RINTC. So, add the architecture function for
RISC-V to reorder the interrupt controller probing as per the hierarchy
like below.

  ACPI_MADT_TYPE_RINTC = 24,
  ACPI_MADT_TYPE_IMSIC = 25,
  ACPI_MADT_TYPE_APLIC = 26,
  ACPI_MADT_TYPE_PLIC = 27

This means processing all RINTC structures (in the order of appearance
in MADT), followed by IMSIC strucutre and then all APLIC/PLIC
structures.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/Makefile |  2 +-
 drivers/acpi/riscv/irq.c    | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/irq.c

diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 877de00d1b50..a96fdf1e2cb8 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y					+= rhct.o init.o
+obj-y					+= rhct.o init.o irq.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
new file mode 100644
index 000000000000..835eb6eccd53
--- /dev/null
+++ b/drivers/acpi/riscv/irq.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023-2024, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
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
+ * On RISC-V, RINTC structures in MADT should be probed before any other
+ * interrupt controller structures and IMSIC before APLIC. The interrupt
+ * controller subtypes in MADT of ACPI spec for RISC-V are defined in
+ * the incremental order like RINTC(24)->IMSIC(25)->APLIC(26)->PLIC(27).
+ * Hence, simply sorting the subtypes in incremental order will
+ * establish the required order.
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
