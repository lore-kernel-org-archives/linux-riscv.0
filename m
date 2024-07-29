Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558F7C3DA7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJCmiS6vQBrKBxpieS+WlukuiX6x0ZneSlwQtdowfes=; b=4JmMHcnfcseJQB
	9kwAR80a0ywf5UORRV1ihL/H7pPtyYzrWqq4HTtSXMTtcSNfhKUdnM1q8b30jNRfnU6eZXRIvZhWu
	WPuq9Vw0J+VjjzBYxzDnbGEoFDStn7VsyZ6RLrQyzrNs2bDVAu0ANYQ4LYKVysaowSyHu2IPlY9bq
	SHN1KmGYqRl6I2d7jz/0egYyxA7TQbWrkRQ+RyeujIlU9KwDIEPybqk1Af73pEVWMXzEA1/rJ+b6e
	ByJwRFcD/su4rox/qmtz4QuDPNdfPlTRe8yDUdTmeJ8UO68Ke20lRwZRNXBaFcVFd56JuLMkN6xop
	InhsXJ9TUXYmh5MrScqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRWr-0000000Bfde-3hcv;
	Mon, 29 Jul 2024 14:39:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHM-0000000BYZP-1NuA
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fec34f94abso20410425ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722262992; x=1722867792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpUpzTn31uAv59eRsYCCTGHf2UwttQw3/INKSz7Rgp0=;
        b=NnF/mFIOLvGUy9a+iivmeYc0KEI5+72iaoJ/16ElHj6bVhcfSk/gqnNo4c+M3Nj6VI
         Py95gm58WVYqeTUXLYfcVG6JpDNS+YLSgJ6Ert66l9K4ZeBvImFdACQtc17bKVIkSAsV
         SQKRX1m+iUhN5ZzsU/Qfl9LnRNAAQuyi0XQqXgWRwNISf1PPNu58xNAo7Ts71F3vYB0C
         TB2BQygxprvm1b7O0gfPQmSCsnGTnqDCuUQOSD+KM/2bmW6+gSNw7VG8UfEE03lAzY00
         6dK0pt5RoluauaQIMHqHvuOaFgxh2iZsTNkJ7r9unpRdbuJTYqLChDUgWFfIRlSVcuD7
         sT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262992; x=1722867792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpUpzTn31uAv59eRsYCCTGHf2UwttQw3/INKSz7Rgp0=;
        b=i14U8TupaBaPaN6kb1yTaR0HumMWvr/PRddyXU+I1zA+fqXbGLjWz1oA1hi/bh5ydx
         1RekLC3aV1P7TTGFo2fwRRbf0xgUB18ykAcogeSYrBcajFaBjXC8xEZMh/VPQWbQZJdQ
         cjmUsIe4WgPsY6Hv8wERYxt8pVo/+Qc942OMEWE7s6MC1rJuWubZdNpd/sFot4KRIuf7
         TaQIlS9xvt+RUaGUhBS7V0vUF+U92Yhm7BwVE5x7iPhVqwY36CMd3qRV3dLp6auTBf8Z
         49hF/XEvyY3Y01FxMHwekB+lrDE8VSKPmW9uk+3DwqZCbGdg99bIpj6U1I9FPDqMoY3y
         AzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqZvixiEHTWBrcJwxaUOa0V04oUwWu7INNQHKm2SJfqXlC+abQU96m/0herr2bUDedgnOrOwqE4IRBiX1zAtZUWgOsmc9HmQKB+QcrniCD
X-Gm-Message-State: AOJu0Ywg5is32kUiVFeSFTfXx3QEdF4qhs+wYKxCEGoFypiIQZrv8oXJ
	B9V0oEEBu0THqdGlyNoKoSJuRYae/fJdZJvpkJyxrDmmLoJHaajO5fczxtYIxug=
X-Google-Smtp-Source: AGHT+IH8iPMjHAqTJtzMrAyY/pfHaeY/boKXW8uZbGvPFkTDNr09tJ3EGqjomR/myMHI4FJBrBAsNQ==
X-Received: by 2002:a17:903:1c4:b0:1fd:668b:ac4b with SMTP id d9443c01a7336-1ff0481ada8mr54039975ad.15.1722262991841;
        Mon, 29 Jul 2024 07:23:11 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:11 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 03/17] ACPI: bus: Add acpi_riscv_init function
Date: Mon, 29 Jul 2024 19:52:25 +0530
Message-ID: <20240729142241.733357-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072312_389552_CD8E4F81 
X-CRM114-Status: GOOD (  15.62  )
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

Add a new function for RISC-V to do architecture specific initialization
similar to acpi_arm_init(). Some of the ACPI tables are architecture
specific and there is no reason trying to find them on other
architectures.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c          |  1 +
 drivers/acpi/riscv/Makefile |  2 +-
 drivers/acpi/riscv/init.c   | 12 ++++++++++++
 include/linux/acpi.h        |  6 ++++++
 4 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/init.c

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 284bc2e03580..48d277657203 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1459,6 +1459,7 @@ static int __init acpi_init(void)
 	acpi_hest_init();
 	acpi_ghes_init();
 	acpi_arm_init();
+	acpi_riscv_init();
 	acpi_scan_init();
 	acpi_ec_init();
 	acpi_debugfs_init();
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 86b0925f612d..877de00d1b50 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y					+= rhct.o
+obj-y					+= rhct.o init.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
new file mode 100644
index 000000000000..5f7571143245
--- /dev/null
+++ b/drivers/acpi/riscv/init.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023-2024, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#include <linux/acpi.h>
+
+void __init acpi_riscv_init(void)
+{
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 3fff86f95c2f..892025d873f0 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1531,6 +1531,12 @@ void acpi_arm_init(void);
 static inline void acpi_arm_init(void) { }
 #endif
 
+#ifdef CONFIG_RISCV
+void acpi_riscv_init(void);
+#else
+static inline void acpi_riscv_init(void) { }
+#endif
+
 #ifdef CONFIG_ACPI_PCC
 void acpi_init_pcc(void);
 #else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
