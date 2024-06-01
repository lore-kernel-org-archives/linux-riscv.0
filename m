Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA45C25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pETFBfsSYGoY1wXXFX6fORfEQl0WHgF1QcuZEjBDSHo=; b=is9np5lPluyX0V
	4vEP4hlCdiEzmi72n8CqW1CEvAAhRfixZHePQbKY9kipYAbN8taUzDzl9F5wi4wCC+bwH063wfz3I
	F1x2YDM0ahomQA7CtXZfxFJ1tI+wJ2HLIGDnhnjptxzhRkcL6Swg2ZU9CVv36BnqrHhZO9/kmqJ6N
	DS2ny4umVatAvotYsndgYndVblOskV4eXJsKkO1O4u+jRp8QvpCHC5JttisQ+I8LaAB9H5MeIRhPy
	6JiPdwB3dnASljNVm86iY4RpbrETU07bxNB3dps12fQRaEF2oRizPhAZT7NVkrPzxDDCdhdz0O8il
	Sv4nfTW/W/F9kCdKNuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQJB-0000000CprV-2FJl;
	Sat, 01 Jun 2024 15:06:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIY-0000000CpFv-2qVX
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:05:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7024494f7daso1614671b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254332; x=1717859132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xxd/snqLqM7e5ONTmxzheAfPAEAmi9DZ2uBd4oJ/FYs=;
        b=ThvCtFB9iVorEzOZ5fHZevYjEnrFf+FPyqTxAlm4/rHAwKzKcqqYhjst4zdXp1vypX
         6XRfwR0TbWA21VTgyfn67zv5VRs1UEyHl6NeuKI3uh05DTt0kndG4NmZcPMMa/+L0WGp
         mzpZ2FIvp3AoBVJCzPOXOxG4qoEC3YDUfC95NQYgOuEMFB0Czk7JAnLrutbKB73aYzy0
         f4lPNGVQGdmN+5kG4kTUgaSxy/+lEMTM2yhRcxMFbVNKSG3BaQxuBE4cDTSd6BMZAmEO
         ZeJsHCOXWOumY/uoNN/o0RMjCB7KixF+cpRDpkDDOyO67gp5D7QM9a4/mz6SBpKcNVba
         YElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254332; x=1717859132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xxd/snqLqM7e5ONTmxzheAfPAEAmi9DZ2uBd4oJ/FYs=;
        b=F3v2TIhQGczRb8YEAXAG5+IPPlJ4AlHAV6YcPAy39zQuroFuhRd3ZgoVRTpQRh6XZc
         27vDY6RpnOVfWAl4F14VXoD7pzAjAifyheI0ZaP8whFTa2WAAG/9SpdXcrpvU1Lrfn6P
         L0hZYNocD9MCMvPgFc/+tMJa/yX3XGxncswhIy1ndLXIWIzYSZF+S83YWlDvCMhZGlHq
         Jdi55mCSVRDgewNX8CDy5KDko4vI8GBayQqB3b72tQ0XfTmkJzH8E7x71UxhyJAMyAsk
         ElAYcebOiXflyYzTfbXBlBQECn9irvV3LIxjJ6/4QfYbDmFw/tw0GLPBSoCkL+d1KD6e
         Dz/w==
X-Forwarded-Encrypted: i=1; AJvYcCVq6s2OB0Eya8ay6PzoiavEthmnSeIWeYuWJk5HiaX7avADBB9l532o4OZ4IcxeZKF5tDlk/ozQkqoI/2zv80S5WLMtT+nJhnvENF3+n5UC
X-Gm-Message-State: AOJu0YyghYqNDjLTcNyaT5PjLRmcLKdiskRJYe4ryyTS+NvF8MOnJt8h
	JjA+HMDP1rsWJZ1E2OmIezzq/p0CWGhvNMHn+upVNQHotI1W9o+tlK5fNPXOr4M=
X-Google-Smtp-Source: AGHT+IFZLKdJXzy6Jd5qCfRWhIlRvV4goiwxMiN4v1BoHBszSCe89m9zjL1yy7W4W+xKrhKM387PnA==
X-Received: by 2002:a05:6a00:2d11:b0:6f8:ddfe:8fc4 with SMTP id d2e1a72fcca58-70247803d99mr5506971b3a.19.1717254332202;
        Sat, 01 Jun 2024 08:05:32 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:05:31 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 10/17] ACPI: RISC-V: Implement function to reorder irqchip probe entries
Date: Sat,  1 Jun 2024 20:34:04 +0530
Message-Id: <20240601150411.1929783-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080535_080794_BD7936D2 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
