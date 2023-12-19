Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971ACC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0ZJvyP9Idf2F/KG9b3Nfh0VL/Z54RDvyWzoWlQqotE=; b=vgER+NiAKo6CRj
	9rrkw1msCYvUt5GmpRFcUy7T1DgUyPTJlU7KU45z0IwZeslSDgIP5hWWtKcn+2SCrgrw20ZTURf0z
	1D8i6h8qBgkV93Qpx/HbBzWYfSv58/sn5bZQ1HLNAQHsP/wq9Ojb+biC6d0Wte6EoOrL/jXWOJVDa
	ABI+7wChC/yQWDg+vii1pSxdjjMDgtj071kLeOcsQmKVyT9VtAX8R2JiAMQfrbfxchpwzeF2+HNSn
	TRbHoIzJ34F7TimXKSGSxGzXXJ6PNw3v9aLd+/pRcRWGITLiedyzNz3Y57HzSMa6EcSJpuirERbR+
	HFlSIVLQxcMpB4zc8pKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFf7C-00FEJ7-04;
	Tue, 19 Dec 2023 18:46:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAC-00F0cv-0D
	for linux-riscv@bombadil.infradead.org;
	Tue, 19 Dec 2023 17:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X2my/S8LtCsC0GLqIKOd4U0OgSfb/RvK23itt/cKu94=; b=Bn36/OyZ/4fQWzDUXqfuxPmwYk
	QF+s6EqyTtc8Ei10PTLlYCyonEBmP7h782vUN/ljCjzNpgpykFSTx9KuN4kvYaVay/qiEX/Dw9TRO
	rWT0Z8fwDpanJPH94kf7zY22oEAmtJo9o9QztgnqM3gRlLEHyKSB9qErN1+vMcp/Gy2pcZ9MvGj+/
	ahCZcutevo/nguuovVdXNzQzj+0YFI1JoJenS98p8L7kVoRVUiYYZ66ShvDrToA0R0lfAL+y1qbsq
	a7NkaDKYyVaSUE7Li3Tq55wBLNeOCWbjdUXMBt54nDVkOF9yu/53NodL6K0MQXaeJ1rx9/bFwrDMx
	P0dxC7fw==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeA8-00DXvB-2g
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:45:50 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6d099d316a8so4451684b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007947; x=1703612747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2my/S8LtCsC0GLqIKOd4U0OgSfb/RvK23itt/cKu94=;
        b=KKJt3UT82XsphgIfOonQ+cFYKrSwwME7leDdakQQ67oN1124DEYnaZw7CWQ7I7mQea
         AXsct/53WPvhXzSyYnXljQx2hlq1noiia3DNWdRSGV5+OhgxsDrpwbuhsjQVoz765zse
         khUur+dJC/EN+EnsKKNbUPEicZEPB+8abtoRR9bMUMMCq5j2tK44bnjsi55hz/JBtrp7
         npWY8ewrvnhqSCn4qt2tW/xrzMneKKkWgT5OiIz7C7x+aH4KNNLJqK6Ant67D/hzAAm3
         7DeCfbJwJGP6OKb7ZjFLP4XkQjUmPYxWug1KVXaaouQSrQ0rMXVHoOFyJhIc5bDrra3N
         vkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007947; x=1703612747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2my/S8LtCsC0GLqIKOd4U0OgSfb/RvK23itt/cKu94=;
        b=w3RDF+AQnAYL+ASxEKCoTkdNPSqVUjWmXGis2QUfB2CDBNYJKoR3O3+B63wT0kjCea
         sj2ZPtDOA7jhhTjqSdc2dLKJeQlAPeU9Y5wyxrRBYrkELVGiMm9+uoArDlKwbvksD5R6
         UEiL9cWUNH6i5+vf7DYr+zKhBqsWXyCs/lAI6p+I48luCaecK3x9/e3RIlO/8AfjaSSW
         ehgLBgWODx3qKYxmYit96BWHu49xsJI1Gyz8LGo2TiEQpJAupwgrE5pH/OiPYwVaCXyP
         NukIPKnS/qgthc4doDRjjRvo9SE7GtN+dj6XoiWmAheYgXEpAZHO90N3kA5PYXjWWHgJ
         clNg==
X-Gm-Message-State: AOJu0YxtkuEbT0qVy8bBz1xqb1koBQLeRyaYM1J3khY4Vy9N1zUN8jqE
	Vur4GkYwOFGowFmTSQtyHT67QQ==
X-Google-Smtp-Source: AGHT+IFDCMqXKe3sr6t+NRPle0lI18fn2yS4WEUvyrpP85oA70voh4ftGShJGXf8FNnSuam1RUEIzw==
X-Received: by 2002:a17:902:6bc4:b0:1d0:6ffd:9e2c with SMTP id m4-20020a1709026bc400b001d06ffd9e2cmr17679545plt.126.1703007946725;
        Tue, 19 Dec 2023 09:45:46 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:45:46 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 02/17] RISC-V: ACPI: Implement PCI related functionality
Date: Tue, 19 Dec 2023 23:15:11 +0530
Message-Id: <20231219174526.2235150-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_174548_997988_E588D538 
X-CRM114-Status: GOOD (  13.57  )
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

Replace the dummy implementation for PCI related functions with actual
implementation. This needs ECAM and MCFG CONFIG options to be enabled
for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig       |  2 ++
 arch/riscv/kernel/acpi.c | 31 ++++++++++++++-----------------
 drivers/pci/pci-acpi.c   |  2 +-
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 45c660f1219d..d939fff5b5b1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
@@ -151,6 +152,7 @@ config RISCV
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
+	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
 	select RISCV_APLIC
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 56cb2c986c48..b7bf1678241a 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -223,29 +223,26 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 #ifdef CONFIG_PCI
 
 /*
- * These interfaces are defined just to enable building ACPI core.
- * TODO: Update it with actual implementation when external interrupt
- * controller support is added in RISC-V ACPI.
+ * raw_pci_read/write - Platform-specific PCI config space access.
  */
-int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
-		 int reg, int len, u32 *val)
+int raw_pci_read(unsigned int domain, unsigned int bus,
+		 unsigned int devfn, int reg, int len, u32 *val)
 {
-	return PCIBIOS_DEVICE_NOT_FOUND;
-}
+	struct pci_bus *b = pci_find_bus(domain, bus);
 
-int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
-		  int reg, int len, u32 val)
-{
-	return PCIBIOS_DEVICE_NOT_FOUND;
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->read(b, devfn, reg, len, val);
 }
 
-int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
+int raw_pci_write(unsigned int domain, unsigned int bus,
+		  unsigned int devfn, int reg, int len, u32 val)
 {
-	return -1;
-}
+	struct pci_bus *b = pci_find_bus(domain, bus);
 
-struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
-{
-	return NULL;
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->write(b, devfn, reg, len, val);
 }
+
 #endif	/* CONFIG_PCI */
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 58497b25d2ab..c8c3369fd69f 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1520,7 +1520,7 @@ static int __init acpi_pci_init(void)
 }
 arch_initcall(acpi_pci_init);
 
-#if defined(CONFIG_ARM64)
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 
 /*
  * Try to assign the IRQ number when probing a new device
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
