Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2580CC25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=555lnW05PQqAylDpba9OJGqz1DgITF5kHTblsuPTRKw=; b=4yKotZ3CmtOjxr
	LOfdgHtfKhM0wKgfiIkn7POBEfCFuVh2Tugil70Ml1akqbeMFLZlVYJ/Uwq+mFbLncQm5iXFxNPln
	/M7ROoOJXR45N+l/6/ZoDXZi+fXwKXY3dy6Xo5Kt4LbjzELD2+CozZ8ELDP+XCBWLNCkhN1TfNPGq
	SNKEXW3dBFg3a7cGFrMFnV7Om/SusW/E3TMcjx0p/XWk/vGqtrIIyI/OKT/ZM5LLMjhYmW1/d5txX
	giIvgdlxVl4xPPaQm8zVdwXef9qO6brtNRSOYIAjPq54RbnscZd133NP+UIfSCUtko2lVDFLJn879
	KKiG/lLCQ6YB/qXtcCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkT9-00D4la-2T;
	Wed, 25 Oct 2023 20:27:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkS8-00D3pC-0J
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:26:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5a1d89ff4b9so167457a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265565; x=1698870365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyAbjmaR4eN/4ltFJMCVbHeHJN24CQKSdc3guUQ+sXY=;
        b=XojkXMKCh1UUoZtwQBZ8yUj1Qrfzx8bxujo39ROANNcvQVUCVra0A2MSCjYIsoZ5WZ
         +izGkaSImwBFQWo1eq4LOKAmdIB49MPpFP5UhdAFaU7/fW4iZwer5NYKDMl/g8mDCBZv
         8CdwThV2rnA5JmUgogtLPEW/FnFYdwQMCwb0w0EJxUWohuFwnVulzHLFjQBwgWyUjJ4T
         jcEEF76AyRJTTq89nFcokOEcMcEuUYDdGpEC629N3SrWe2rBv8blYy+laeMWHZbxDL+8
         YATwEkA40Zvnc06LsIWJe96gN5TFUGvYQd7mWC1UAdjh7qqZ4VPCNbWh43B65mH7WSjC
         J8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265565; x=1698870365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyAbjmaR4eN/4ltFJMCVbHeHJN24CQKSdc3guUQ+sXY=;
        b=Uixz2GPjk5Kl1jxkWTSfIZiv7QhLdJztBkiVUBZUvQwZnGxo5g9iXjzalJqahHywby
         68P6EdPjYd8kMFY24HaVw/G8Ny2edONDn0y+0luvlxKL9vzzA1ZKJW0ZRkPVJWCZkXXt
         +YW7mCShbeku9JfJ/dBK8BlBpAOXwHAd58p4ksv3idf8rDiPGqVzrqpLMCJrLyvs89RG
         J/6Z983UBGxO7q30CUUM/WNPOfcWtdOOy6LUXEacJVVfgwC0SQEEnIc/KtBIyFoAh0jr
         bHf0aguVOnYdWgOsX2U8SvZ/2VHeIdpw98Fd3mq8sHN58NjR9PSEtS0UIlN1jWY4Y1Sk
         dOTw==
X-Gm-Message-State: AOJu0Yyldoz0usKJ1OBacpYYtmFE83VGDKHDtnNAlLkNSjksS4FjCJOH
	IzagOVUvj1OYnbp/DXmBXo6rFg==
X-Google-Smtp-Source: AGHT+IF7LV+DTM8Xp2zCb8vMCjjf9RgtWialAHShVkTza7omnaz58BwRnPvcOqBLoChX7glmevCqxQ==
X-Received: by 2002:a05:6a20:3d13:b0:16b:8132:b547 with SMTP id y19-20020a056a203d1300b0016b8132b547mr8489178pzi.4.1698265564985;
        Wed, 25 Oct 2023 13:26:04 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:26:04 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 20/21] ACPI: RISC-V: Create APLIC platform device
Date: Thu, 26 Oct 2023 01:53:43 +0530
Message-Id: <20231025202344.581132-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132608_142497_0A29BFAA 
X-CRM114-Status: GOOD (  16.53  )
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

Since APLIC needs to be a platform device, probe the MADT and create
platform devices for each APLIC in the system.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/init.c |  2 ++
 drivers/acpi/riscv/init.h |  5 +++
 drivers/acpi/riscv/irq.c  | 74 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 drivers/acpi/riscv/init.h

diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index b5807bbdb171..e7eff7ab1474 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/acpi.h>
+#include "init.h"
 
 void __init acpi_riscv_init(void)
 {
+	riscv_acpi_aplic_platform_init();
 }
diff --git a/drivers/acpi/riscv/init.h b/drivers/acpi/riscv/init.h
new file mode 100644
index 000000000000..17bcf0baaadb
--- /dev/null
+++ b/drivers/acpi/riscv/init.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/init.h>
+
+void __init riscv_acpi_imsic_platform_init(void);
+void __init riscv_acpi_aplic_platform_init(void);
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 36e0525b3235..fbccecdcbf8b 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
 #include <linux/sort.h>
 
 static int irqchip_cmp_func(const void *in0, const void *in1)
@@ -30,3 +32,75 @@ void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr)
 		return;
 	sort(ape, nr, sizeof(*ape), irqchip_cmp_func, NULL);
 }
+
+static int __init irqchip_add_platform_device(char *irqchip_name, u32 irqchip_id,
+					      resource_size_t iomem_res_start,
+					      resource_size_t iomem_res_size,
+					      union acpi_subtable_headers *header)
+{
+	struct platform_device *pdev;
+	struct fwnode_handle *fn;
+	struct resource *res;
+	int ret;
+
+	fn = irq_domain_alloc_named_id_fwnode(irqchip_name, irqchip_id);
+	if (!fn)
+		return -ENOMEM;
+
+	pdev = platform_device_alloc(irqchip_name, irqchip_id);
+	if (!pdev) {
+		irq_domain_free_fwnode(fn);
+		return -ENOMEM;
+	}
+
+	res = kcalloc(1, sizeof(*res), GFP_KERNEL);
+	if (!res) {
+		irq_domain_free_fwnode(fn);
+		platform_device_put(pdev);
+		return -ENOMEM;
+	}
+
+	res->start = iomem_res_start;
+	res->end = res->start + iomem_res_size - 1;
+	res->flags = IORESOURCE_MEM;
+	ret = platform_device_add_resources(pdev, res, 1);
+	/*
+	 * Resources are duplicated in platform_device_add_resources,
+	 * free their allocated memory
+	 */
+	kfree(res);
+
+	/*
+	 * Add copy of aplic pointer so that platform driver get aplic details.
+	 */
+	ret = platform_device_add_data(pdev, &header, sizeof(header));
+	if (ret) {
+		irq_domain_free_fwnode(fn);
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	pdev->dev.fwnode = fn;
+	ret = platform_device_add(pdev);
+	if (ret) {
+		irq_domain_free_fwnode(fn);
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __init aplic_parse_madt(union acpi_subtable_headers *header,
+				   const unsigned long end)
+{
+	struct acpi_madt_aplic *aplic = (struct acpi_madt_aplic *)header;
+
+	return irqchip_add_platform_device("riscv-aplic", aplic->id, aplic->base_addr,
+					   aplic->size, header);
+}
+
+void __init riscv_acpi_aplic_platform_init(void)
+{
+	acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
