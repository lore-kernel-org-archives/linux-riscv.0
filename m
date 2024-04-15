Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8C5C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x83hadpOiMabDPax6E+FMFiO1ftfgvZmpzOPpSuubH4=; b=isA0KAzWO6S6Hc
	CeB35+VH85IyZGYL/nwgz/wALwvU+lDOfFQlgbAHs9oZIKulKGm+2UmlODQbAfY5TE4K23IxtolWL
	AFUSH9b78HTcarJsjm1X3Y9xrCUJu8n7nhYegsI6aPtBtei4+Se24Ajtjv5COJHH8VnIoT06B8f9o
	gNXQ0YqNwC3SDtl7xwwsVHx8iXeGxRiE1LTn4ZGzEJPQ5yCEYr1elpfa/B7CTvdPPAZWKkw53WzIg
	89SrDP9gvLK3pBVFRueosayFHpA8GQp2zppiv3Nw7UosY4eCMhbTEr1Kb9799zYzfyIUJmI1I4eSO
	bX68kWkWbIbf/egnf7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjT-00000009CFy-2XyQ;
	Mon, 15 Apr 2024 17:03:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiQ-00000009Bb1-0OIg
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso2452339b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200517; x=1713805317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z52/1ZZYR1CvGL0V5chwJsk+UfCztWDiXCAoT+2GZNk=;
        b=JKJS5AgnWFe703jJXTr2O+uxXy2QdAGmV+WQ86Upv08fjr/M3ZaAJT7M3WYiaUhBwV
         zCZcyzl327z5er5d+FADKulnZVAXr+9pOFedaq8jJJ+pEYdS1oC4tRlYTBukGx366mhQ
         pWzTFsi/+3GiscbDxekUTfQDFnm69J4urLkw+yIzC/m/ehL6J6GaTGVKmt23RseEmQ9j
         luxsZDrmMPdqFuXvyUt3O74a4g5Ca36qrvrd5LT+MwoPO5SbZVk98+P0HF16yIBvFiGt
         oVpIoW/0yeXCZH5AXMyercEbcTmL+e7qMJ+dpyo3NDEFpyEP65FBswGF5DTUqEuvX8yg
         gQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200517; x=1713805317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z52/1ZZYR1CvGL0V5chwJsk+UfCztWDiXCAoT+2GZNk=;
        b=u03N1EWiLM6ISZAPXePg3Z9A9CvkLw4qHOH4tAw99cmOtNdxqqVIu76SUpAFzJrJ4i
         gyyThGHMDn2DpJumfB7s7NauwbAshZV7i38CGlfrpvA3+gyQ+XAvGUf5PKB+BpgGPpoM
         1W8NJbWdQ8DvindUCGYz81/E9kunlvv/p0uY9utR4seTLl2A4r773a8i32y9QtsqwAz8
         dWdw2ySH0r8TZyCtvMY+8hUF9Y7KHRhd01ZbbGrH8VljdsdlmXrwxAwoopQxZIQrVMDQ
         z1/9U8AJv71HSTNiaYu73gpZbLJ/tJ8q/uVag0X3EDqJAFaYl/SldaEGvUW7LqKnKJsx
         HBaw==
X-Forwarded-Encrypted: i=1; AJvYcCWTkfGfxiXKebdftnJnwo6RItW9wLL86n/tsDYpUBKjwGJgZh12GXk8nmOayyvZPPM1Rz7N7yGuzn5k22Ey7i+nbcJFW6I2kUQyhhKivECX
X-Gm-Message-State: AOJu0YwqTNJ+AJMiiUOWeGj7cCoqGoRBuPcFm0A6ibS6cs4Ka7gya7zb
	03fmKX55Jse19FIMF1o2iKRkF+xQFwHumwWxZ1vVNsECxZeomnpD7dg0AMrmAx8=
X-Google-Smtp-Source: AGHT+IF3pZ5kgHd0L+s0ETBbrzTu2eQzZocJwTnnUWv3+XrCVjsqR27b/As/nt3u7TcsRgOfwdwSGQ==
X-Received: by 2002:a05:6a00:986:b0:6ed:1c7:8c6b with SMTP id u6-20020a056a00098600b006ed01c78c6bmr10123074pfg.1.1713200516899;
        Mon, 15 Apr 2024 10:01:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:01:56 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 05/20] ACPI: RISC-V: Implement arch function to reorder irqchip probe entries
Date: Mon, 15 Apr 2024 22:30:58 +0530
Message-Id: <20240415170113.662318-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100158_249871_2FC5BA46 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index 86b0925f612d..dceec808cfab 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y					+= rhct.o
+obj-y					+= rhct.o irq.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
