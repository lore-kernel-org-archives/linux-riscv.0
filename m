Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535D3C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vboZThzSBxSQY/WEVaUw/ayuEXEHZbP9T0MdJCqFXTM=; b=FnbVKYwX5beTWL
	wU0292VolAloDhlne4oAftxy0gR4omTiMFXfo7My9ZVdP77iGe/wnp64cj4e3/gkrtzun1hleQVCY
	TkqcGjvKjFclPhXPDNuUtKfcJ6vn1R198M5awm6WxnrhNelNOXRyMEHCQ5WdhjoDjRUchmU6vN5Na
	16x8N9UjjXMaYVG0MjjhogbrWvdfEXJLMc9n0wbFfTUA0LTj5dV7DlAKPm96j4hC44TlibBXuE74L
	JthcmcxdTw4RAXa88v9M+RbY623+4m8F2wPxyvM6Oq8AzJPfMKahX+Px2pMayLAQLs4KkWs4UFuQK
	tUKLHssAyF7TkphJGtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFfLg-00FGu4-3D;
	Tue, 19 Dec 2023 19:01:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeBK-00F1Ta-2E
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:47:05 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6d940d14d69so343898b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703008019; x=1703612819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMG56uSWd/ufo/nc8FBDk9fzkMf+1BzSryO0Av4W69w=;
        b=W0LKHmqq7igxUhhkvNt4+RSagZN04e0xVe6S1JBtATSdXAMl1zOvjNzgXnhzMj8xTK
         T7+hBSP8H610qZizsXugmZObb6rhw1WCcKf16mVVG+1ieOcoWBIwT3gJgF3WzoGa2xFZ
         VQpoejZGMa+/CIRq740VF2w1frBdw8vipDf1rpkRlnQxAItbCisi1EmkSaOgQzcwIYWW
         VZQmLago50eVqIZ0qx2gJUtsXpAKZ2QWOHKhFrDBBRgcjlLWMOwvQXkaINRJIc2LKsmn
         1Mp7QyOdFMfo6iijivoJMwfE+0gtVqkU62uuKpgf59zDCUc/EznwFIHuxzl8fxbjQQFJ
         vFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008019; x=1703612819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMG56uSWd/ufo/nc8FBDk9fzkMf+1BzSryO0Av4W69w=;
        b=qSgywjRdtDbhOaLNA0sXFBtHmPij3MLIGQ4DpEN5AufibO38uvJSrKW/eW8xTSuMWr
         YNFHov2FI1nxhJidOkHetZGxpkGTip1NF7z92gtuaNWX3oQJUQMxi2dzeR4WECSvYp9Y
         LEMCU8IJyY8nLx/1yT/WzC3m1piJexx+bdoBaZ1SPLCu8S0O5IQPlrM4+Y6J8kVCbr8U
         IoEJgVhLjnnycpp/RshzrdeEOqRaGf7VCCtG1J9XyeiVsMar0Upop8YHGp+71GTPFEeE
         y3iFTp8bQ/eCo1WQ+G+UO9eUNJZztZHDVdjLUi3ebrJbCrVvY1xP9/h4vBxTZxd4krRP
         CMIQ==
X-Gm-Message-State: AOJu0YzRLsnQl+5ePYkq370+u8autvDC+DtAOv8Ly1+IHWnuwzzssOBU
	suxQfjV+6Ax3X4/ps9kDGdxT/g==
X-Google-Smtp-Source: AGHT+IHXM72nArT21GjLZtiiN3K06SzkiamqR5ZRviUGxMyVpE460cqqru+VtpRXXtaDP8/IywYfuQ==
X-Received: by 2002:a17:902:eb8a:b0:1d3:da07:5731 with SMTP id q10-20020a170902eb8a00b001d3da075731mr1397869plg.22.1703008019566;
        Tue, 19 Dec 2023 09:46:59 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:59 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 15/17] ACPI: RISC-V: Create APLIC platform device
Date: Tue, 19 Dec 2023 23:15:24 +0530
Message-Id: <20231219174526.2235150-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094702_764920_AA2E6B1D 
X-CRM114-Status: GOOD (  17.56  )
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

Since APLIC needs to be a platform device, probe the MADT and create
platform devices for each APLIC in the system.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/init.c |   2 +
 drivers/acpi/riscv/init.h |   5 ++
 drivers/acpi/riscv/irq.c  | 118 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
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
index 36e0525b3235..d08a851ab6dc 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -6,7 +6,36 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
 #include <linux/sort.h>
+#include "init.h"
+
+static LIST_HEAD(ext_intc_list);
+
+struct ext_intc_fwnode_list {
+	struct fwnode_handle *fwnode;
+	u32 gsi_base;
+	u32 nr_irqs;
+	struct list_head list;
+};
+
+struct fwnode_handle *ext_entc_get_gsi_domain_id(u32 gsi)
+{
+	struct ext_intc_fwnode_list *ext_intc_element;
+	struct list_head *i, *tmp;
+
+	/* Find the External Interrupt controller that manages this GSI. */
+	list_for_each_safe(i, tmp, &ext_intc_list) {
+		ext_intc_element = list_entry(i, struct ext_intc_fwnode_list, list);
+		if (gsi >= ext_intc_element->gsi_base &&
+		    gsi < (ext_intc_element->gsi_base + ext_intc_element->nr_irqs))
+			return ext_intc_element->fwnode;
+	}
+
+	return NULL;
+}
 
 static int irqchip_cmp_func(const void *in0, const void *in1)
 {
@@ -30,3 +59,92 @@ void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr)
 		return;
 	sort(ape, nr, sizeof(*ape), irqchip_cmp_func, NULL);
 }
+
+static int __init irqchip_add_platform_device(char *irqchip_name, u32 irqchip_id,
+					      resource_size_t iomem_res_start,
+					      resource_size_t iomem_res_size,
+					      u32 gsi_base,
+					      u32 nr_irqs,
+					      union acpi_subtable_headers *header)
+{
+	struct ext_intc_fwnode_list *ext_intc_element;
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
+	ext_intc_element = kcalloc(1, sizeof(*ext_intc_element), GFP_KERNEL);
+	if (!ext_intc_element)
+		return -ENOMEM;
+
+	ext_intc_element->fwnode = fn;
+	ext_intc_element->gsi_base = gsi_base;
+	ext_intc_element->nr_irqs = nr_irqs;
+	list_add_tail(&ext_intc_element->list, &ext_intc_list);
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
+	return irqchip_add_platform_device("riscv-aplic",
+					   aplic->id,
+					   aplic->base_addr,
+					   aplic->size,
+					   aplic->gsi_base,
+					   aplic->num_sources,
+					   header);
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
