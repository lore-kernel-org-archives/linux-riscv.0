Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A090C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pETFBfsSYGoY1wXXFX6fORfEQl0WHgF1QcuZEjBDSHo=; b=OxiysxsgD+Bvuw
	FkjRuLUueEZz798TqvWVeSfBV92ETBtGXamoVeYAjKyqoD+HOC/XCvbDzjezWqANhk1QfdZPZdXPE
	6+3HqP9cAv61vDhnA0kd7YVmBPJk1PHXxIreRSnsfxcYabufmGB2Hhp0CNaPIvobim54jE0od7GX4
	BRuS2ZlUMu8FnUWiItHHyMNx4xaEN+bc/oXQLe4vhJQrvckcA8hdtBepVsHsV0oSXH5k7atdVmfcM
	iRfUpfdwziqGk3J5T/oH0S5dzsbLw55kY4OCxo9cs5Vx0qej9FRoNkXjad6rBV4xwwBHQz8GcaXlX
	yr9LLzRG+O+h0IVIOZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29Dl-00000009V0j-1Qc8;
	Wed, 01 May 2024 12:38:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28vi-00000009N1q-2D37
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:19:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e3c9300c65so57041965ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565962; x=1715170762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xxd/snqLqM7e5ONTmxzheAfPAEAmi9DZ2uBd4oJ/FYs=;
        b=DCY5LEN8GPHiIVrBMo9m50A9lxpa2xu2lNln25RsHqgWDHfos2cDMCxrVw/3aE+HJr
         jBS4XMIrS7SzTZTv6NxQmnA+GZPDbat8WXs6WNDsy5sE/DApazN7jwNYzgrCFgMpC/66
         uaTJ9m6013irYQePFI2+k12pzPoq/Y/9y0Q3Cfb3Zvt/3sNxdwJ+Bs1gxzATnwTtpb+I
         opVsUSsUAevVYd/lyLkUgTeqNHo/zoRgcRvv0tzLiZCmCH510fwSSdIGC90T37IBE1SM
         gSd9AharHYKfIoCbasIT3m+sCXIhSTh+xHmvb4bU+nlHC8AsVYYY1DpjbQJHU1qLrjIs
         KAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565962; x=1715170762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xxd/snqLqM7e5ONTmxzheAfPAEAmi9DZ2uBd4oJ/FYs=;
        b=XLimo1vU8ixfxmNb7vG4W0eAso7AOvOabbyL6wfqZDwN+WGxHRLZ415D7AOSCnBQzD
         IJpxlrQnqnndxwsIaRpVjbbhgwU7iNeNr23mp63zoSXs0Y1sSysW21y+MDTMebti06jm
         AtnWI2gxkqgwp1GZ7x+SxE9Ds0SR+3b98dRr9en6RK/vIZRNxoV5v0yUMqU3pyslGPsV
         vzEDxHrcIrjLOVGQctvAZKvI36KEUGSis2PzawJZna+uPUMy721YV+MOmCAeKWzgcVyZ
         nYeUE6ZBVfshs3SqEnPepyC0EsaUBvm7MUeDcnAwjVYJFmc7D/2dKTVhNxIwADgrZxAO
         /t/A==
X-Forwarded-Encrypted: i=1; AJvYcCVtGV9EOF5u8syRrcWFthceG2RqhSsz57A8cjfVHSn4akKMhsttrgCTF1Tzri7u+c/ZAb9udmYHo99qELNIZybsCY3qSEW5Rv1tNYIboNWo
X-Gm-Message-State: AOJu0Yzkw68m37nemGU91nRPKpG0DceSmqbsQQQWecM/pzenxIkqUZ8m
	vOZXB0KaexZE59m6Rluattr0JDeVaAN4DDOhAMBNu4dAy6Lh/RTulW+X/kC/knI=
X-Google-Smtp-Source: AGHT+IGHJ7p4jwXpu3JYkUWYmOJNcHmWpwQOeQhUAAD/vtuVqVDXO7Ep5uVJu5jo4IP3B8sXFyhN1A==
X-Received: by 2002:a17:902:f68e:b0:1e4:24cc:e021 with SMTP id l14-20020a170902f68e00b001e424cce021mr2637625plg.50.1714565961718;
        Wed, 01 May 2024 05:19:21 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:19:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 10/17] ACPI: RISC-V: Implement function to reorder irqchip probe entries
Date: Wed,  1 May 2024 17:47:35 +0530
Message-Id: <20240501121742.1215792-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051922_603278_18AAA36A 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
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

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/Makefile |  2 +-
 drivers/acpi/riscv/irq.c    | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
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
index 000000000000..f56e103a501f
--- /dev/null
+++ b/drivers/acpi/riscv/irq.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023-2024, Ventana Micro Systems Inc
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
