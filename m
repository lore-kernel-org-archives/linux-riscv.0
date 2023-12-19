Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9F5C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4InUAwAVyQE32cFpoqedWPL9nk1w3kUWefMFdtUrpqA=; b=495GRU5V/256tx
	wqBfm7ueQJke7O6bI//PMzlzFQMlG/bDm0MU33asmCnYecWmAY9nVkcdC9hjSYtJBSrL9cSk+fLpC
	+45qfEg7Isu/K9xRRE+qlzepqakCPOJxYY/OpcEVL6iVE2wHB9eUTTfBfX+D8PRaX/eSraxj82sqi
	D8Q4TPvFU3QOa1QFVOVdaN9EPcowosewf6ZKR3gFUHmy2SxZrw2m1PMmr0EUFMzWU+b5SJ77wcsss
	VERI75EZ9PB+ercdeOXw4N/LUBs3NezoNo7DOqmEpyfy+NZI2bMIUEQ/I+EgHWE6owRO8X9e1UIHW
	j2ZZ6Jeho+mh6gjaAONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAv-00F17R-1z;
	Tue, 19 Dec 2023 17:46:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAo-00F0rc-1O
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d3e84fded7so3141555ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007980; x=1703612780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxzCTJ+m1lwBq+RMy/cftySc6UneYPqTwJF8JhbniDw=;
        b=XrA9wQCYcx3jpZo2hbxOgPjcCzZk12Loz38MHF/A19Ah8puL7EN0sIoD/mUXLkSA+Q
         iD14PdIEMw4WoiEwNa0s811SC2L9ujGAJuxDvY/MZDU/H3C8SfGkoHqt1b5984DQgWAv
         rr6aH6hjU6FaxXn3DQid7rmFs0LJg+59REZSy+nQgMJBtXsQ1ivJRf8BKdtnjk44NZXi
         9vQLLi0MAqY6mNlV2GAWZMPPuBXjZaVQrw0+e65SjXZlxdTZVRC+JETGo5JQanKCw6T9
         LqGJVyX5n5SNKFHYPHfBFMZmG+vtbUYGgf3NqUKbLusUjmJAzcIeeBwYV4rtgtgwcyuC
         EK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007980; x=1703612780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxzCTJ+m1lwBq+RMy/cftySc6UneYPqTwJF8JhbniDw=;
        b=Mz5miG+d6WsB5Jt9CT2CMMBuhLa8P8/WTjmOvWF5h28sZ5aTBwiVTyOCa3arQJuHR9
         +bW1F+C3mJtJa96mbLjXNft6LivURAHpYM8kS/M/SHd2kAfv4qlz3t17Ekrp1GSahq3W
         DY2Cjx4pV3GJ2ctLG/OSmb6CUSmvoUkHtPn7M6le6n1Vp/eYPQ3pIZfn4mOHOHeIwy4U
         /FPanKwikM36zF+lef/GPrY6oNPmVSY5y0iBFAw+meymIOmB7bvK4Jozg8Nt0RgmUxk+
         9tVRkfNSSvw1pEi3py+BAc+aIAutccZ4gpmuxGhQnJGRWvgtZxJxLQhTlaZDPi+bwzKO
         Z1gA==
X-Gm-Message-State: AOJu0YxoVlYq8t7XuC0eYLWc/15MhwtYK+jx61zU/z2mZFhTbkAX3MvL
	HuCDeKxJsyIdW/3fuwEoiFJOfVKhyXc36xEGcaU=
X-Google-Smtp-Source: AGHT+IGFtvkGTPcA5+8hPSE9xpA6pHB1AGzz+4bVKCbl0RMQ6TV2kDkPIPCZHZCd/3GrTRkpVagWdQ==
X-Received: by 2002:a17:903:41c8:b0:1d3:c5e4:b2f3 with SMTP id u8-20020a17090341c800b001d3c5e4b2f3mr2609020ple.100.1703007980064;
        Tue, 19 Dec 2023 09:46:20 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:19 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 08/17] ACPI: RISC-V: Implement arch function to reorder irqchip probe entries
Date: Tue, 19 Dec 2023 23:15:17 +0530
Message-Id: <20231219174526.2235150-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094630_513747_839F934D 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
