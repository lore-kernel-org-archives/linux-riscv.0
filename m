Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60140EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riLK2UF/S9LEYHikBovpSHLtU7QBPNkVwN/+3rDNeeM=; b=thk125yvMQ0k3p
	SlEhIke+FiGZAqKv94gjH1odxs7kp8Cdfp0Ug5JplAJ92Q8CWMCM4gwdbWjdJ6qk5jyPUkicegfkH
	D/yeqURbbfnNBh2ZxupAeCbq7Kkt1RHaz7uZybnKRv256KZZo0reidWoxHlcjWS1H/X40IBSQjPUU
	+WOyDQMlsMPQVdO/6sREiDZwbhJeyE7bj9gbfJBioVZWH8Y4UJpQx5aZJm9ChxodZHRi7PGCfDla8
	pZK1Vx8dKQ8PWIDOr7rzl4jcmY0zjp3rhUrsOdOCkItbeQDNGn8FJGM5YM2+rnGxAuXM+EtaBRFlc
	9K7OrcG8lwdjXuznO+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccN-00AUYy-2g;
	Thu, 03 Aug 2023 18:00:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccJ-00AUVN-2V
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:00:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686e29b058cso916265b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085605; x=1691690405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zrij3XCVzAcOqQorsC5sehKTr0CEJKtsrFsGaW9zZqM=;
        b=g6+YMcM4UaL1m62Ntt4qPvlZaEv/BYe4UX4PetuB3JttzYhNsA1GY4WTrRaVsePaTR
         atxJKkHV0OHfvFZ2y8Ln/HQAgi5oGOO9gAsr0K+aIIaY7ouzgXaONyhs/oUd71rdBMNZ
         LTqtCTDaFhTgMbf7aC8o2trc7JnD/nv6tEP80GHX3A+sLyfMvPmLcM1jG9CgM37CUAlF
         HA8ellFJwKVcSDXCbvFRMKk1KlpyWU7+fF8Ue932AzN1tptU0DxnNrPXXKi8jfk7+sRR
         EjceIniHqsZY3gcJMhRO2hVSYyvOldIln61vUNwnPp8vNEzk5ArDaGdXypxKcq0OKj54
         7How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085605; x=1691690405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrij3XCVzAcOqQorsC5sehKTr0CEJKtsrFsGaW9zZqM=;
        b=IYicgIe+s54yFelpRHu6J7wf+1+fSKknCMHcIVO3pQXkVaRxyO00a5Y7HhpIAR/Oer
         tMHbioA905ot6FAWPWdwknZvAqoBuDEHHkcP6qftGIiFw+zqf1KWAjXh3+GC6088o7F3
         WF2E2BqMk2IoLtkWf0BlpzPULQgssjvcC3Fu/EChoSAWmQRd5OKmq8XTHY6Yplmc0eIh
         PVITcz9l/V+vE2PWieHupxa0NCTdjv5lByFdv3xWefA+ARzlo52Ed7HJEWFcDQyYqurc
         Rr28TxLdcM9gFMVC7nTLv2jGD79V4gKOWfB71iyxhlZm1skjmGFmyMXHktmTqGGy7PVl
         fWIw==
X-Gm-Message-State: ABy/qLZmzv0CXfJbh7fzufhWAstxxBfweJnVKb28cKj2Jk0LBQZhMWQ8
	cwTF6dUp8BFrrcCCQ6apnHJzHw==
X-Google-Smtp-Source: APBJJlGfqnPnWK07EeosxE/Z01LsrLZM2OzMNSmgb3YDtRcKmZUzwJl9E9d4B2w1+YCc7DEVzsQZpA==
X-Received: by 2002:aa7:8896:0:b0:687:4369:4ad2 with SMTP id z22-20020aa78896000000b0068743694ad2mr12618344pfe.33.1691085604789;
        Thu, 03 Aug 2023 11:00:04 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.10.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:00:04 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 04/21] RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
Date: Thu,  3 Aug 2023 23:28:59 +0530
Message-Id: <20230803175916.3174453-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110007_815112_847E53B3 
X-CRM114-Status: GOOD (  21.55  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enhance the acpi_os_ioremap() to support opregions in MMIO
space. Also, have strict checks using EFI memory map
to allow remapping the RAM similar to arm64.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig       |  1 +
 arch/riscv/kernel/acpi.c | 86 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 318f62a0a187..e19f32c12a68 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -38,6 +38,7 @@ config RISCV
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_VDSO_DATA
+	select ARCH_KEEP_MEMBLOCK
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 56cb2c986c48..aa4433bca6d9 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/efi.h>
+#include <linux/memblock.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
 int acpi_disabled = 1;
@@ -217,7 +218,90 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 
 void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 {
-	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
+	efi_memory_desc_t *md, *region = NULL;
+	pgprot_t prot;
+
+	if (WARN_ON_ONCE(!efi_enabled(EFI_MEMMAP)))
+		return NULL;
+
+	for_each_efi_memory_desc(md) {
+		u64 end = md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT);
+
+		if (phys < md->phys_addr || phys >= end)
+			continue;
+
+		if (phys + size > end) {
+			pr_warn(FW_BUG "requested region covers multiple EFI memory regions\n");
+			return NULL;
+		}
+		region = md;
+		break;
+	}
+
+	/*
+	 * It is fine for AML to remap regions that are not represented in the
+	 * EFI memory map at all, as it only describes normal memory, and MMIO
+	 * regions that require a virtual mapping to make them accessible to
+	 * the EFI runtime services.
+	 */
+	prot = PAGE_KERNEL_IO;
+	if (region) {
+		switch (region->type) {
+		case EFI_LOADER_CODE:
+		case EFI_LOADER_DATA:
+		case EFI_BOOT_SERVICES_CODE:
+		case EFI_BOOT_SERVICES_DATA:
+		case EFI_CONVENTIONAL_MEMORY:
+		case EFI_PERSISTENT_MEMORY:
+			if (memblock_is_map_memory(phys) ||
+			    !memblock_is_region_memory(phys, size)) {
+				pr_warn(FW_BUG "requested region covers kernel memory @ %p\n",
+					&phys);
+				return NULL;
+			}
+
+			/*
+			 * Mapping kernel memory is permitted if the region in
+			 * question is covered by a single memblock with the
+			 * NOMAP attribute set: this enables the use of ACPI
+			 * table overrides passed via initramfs.
+			 * This particular use case only requires read access.
+			 */
+			fallthrough;
+
+		case EFI_RUNTIME_SERVICES_CODE:
+			/*
+			 * This would be unusual, but not problematic per se,
+			 * as long as we take care not to create a writable
+			 * mapping for executable code.
+			 */
+			prot = PAGE_KERNEL_RO;
+			break;
+
+		case EFI_ACPI_RECLAIM_MEMORY:
+			/*
+			 * ACPI reclaim memory is used to pass firmware tables
+			 * and other data that is intended for consumption by
+			 * the OS only, which may decide it wants to reclaim
+			 * that memory and use it for something else. We never
+			 * do that, but we usually add it to the linear map
+			 * anyway, in which case we should use the existing
+			 * mapping.
+			 */
+			if (memblock_is_map_memory(phys))
+				return (void __iomem *)__va(phys);
+			fallthrough;
+
+		default:
+			if (region->attribute & EFI_MEMORY_WB)
+				prot = PAGE_KERNEL;
+			else if ((region->attribute & EFI_MEMORY_WC) ||
+				 (region->attribute & EFI_MEMORY_WT))
+				prot = pgprot_writecombine(PAGE_KERNEL);
+		}
+	}
+
+	return ioremap_prot(phys, size, pgprot_val(prot));
 }
 
 #ifdef CONFIG_PCI
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
