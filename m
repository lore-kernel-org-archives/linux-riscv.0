Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE6BE82CAE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPiPdZOE3Z3UlPrasq/OnRDqajsStKj1qg56cR+U8nk=; b=zaB7vao8EAmy0p
	DQrLR5zxaT2GHMU4Wf2q/MIjXfOLb3qqOHauZi/3LM5Im5sfAKwgM1RRUzY8MJX6Wh2IwV5zIVCiv
	6k/KYkXK07Snh3TCupg/Zmk+G+kxdMoZ3o7IqTYdlK1PcE/h8GuZl/dikpYJnAMwvrvNDwVOv2/4E
	TeT3PdmGN3B/dc1puV51tNyfMebLEmqHNOdMI2k5XXLNReRiDnw8wNGlTLu0MHpjtLp8m1EVoQd7V
	EdbXWEQrVJgP/xA1vg+/VNuACBPnMpFQK6fVcH/LOoYzgdG7tOh6wc9lEGg9bO0Is3UhutGfycEbD
	w4wRVsmaJgyE6sGujTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXtq-001TCW-1x;
	Wed, 27 Sep 2023 17:00:34 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXtn-001TBn-2o
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 17:00:33 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4527d436ddfso5436697137.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695834029; x=1696438829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DmNFRxVXj8V3ocvjWMiRzGtl0URBCJyLqRyOWHwpdo=;
        b=fdx7y7VWKlCJk9lM7FHIVMuALEarOvjWXvQcmKVcwsQRapdlZlXPDeolRn0tBcRsHo
         B9E8JHMs+Yr1W3UNuc9fDeoXVSj1g/oZCtF8KH4UeqDOjQjc65ygwbstsU+scty4335l
         0fbZ8O+2G/1vQJLDxKRVOxtdN27Yd1A9xrjVN5gEzDuGI3EEz1VRcNPVL8Ic4KdTL/n3
         pGR8btWwql5FUr5/jkV5hon8vK4QJhD4KIU/NuuN8Sv0fQcjQT84up/nma+cznrBcsDL
         CdoXkmj4uKAuQlJechHhZmwBtfq0mRnh2x9ZmqPvS8P6AXZZCJQ3OtfjoByylJV/RmgN
         zfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695834029; x=1696438829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DmNFRxVXj8V3ocvjWMiRzGtl0URBCJyLqRyOWHwpdo=;
        b=M9pQVggSoHNWHUP2JQjbMklvUq8vr3eaMESx7Es9pFp70K/0rSXptjzw52zPk4TY71
         +LbV+okkLSDd7DFq1u4AHEkODebINC3LZSkHSNZ9AUzD/YwC3DG97JK7Sw3pVfJ539jS
         3aIF6hSeMljFHVFAKPHLoWgZJku7QlBsCc6bnO7B7O0jhF4xD4PhqBVGZ2MQURrSS+T7
         /4yi0XKqqzcE0+LY6Lh3A++hkaNvSsrKaGR+vOZMaTmyr1zrYPdISzMgpcoEvpYm0MQT
         gRQIdHV6Nt8SbJ3oDujK5niZxla/O5uQkQxUomUuTDeUmFMvCiup7zlwYf+eulZL39/c
         XJkQ==
X-Gm-Message-State: AOJu0YzTLAQZY9KlLzdlJdgjj9AAjMmuus6b6yMW8N6r0LUo4eKtCGnm
	7MbENawhCnd0F+XOzdHHpPtRzkFtlgAvhxoDwPI=
X-Google-Smtp-Source: AGHT+IGBgFPJjICylrMDS7JPEnRZuaEEh3Sec+u6/LbCPif/YPGepNKpytUBblydLbUQWx1xQGW8Jw==
X-Received: by 2002:a67:f98f:0:b0:452:81c4:3b56 with SMTP id b15-20020a67f98f000000b0045281c43b56mr2534411vsq.18.1695834028193;
        Wed, 27 Sep 2023 10:00:28 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.42])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm3279396pgc.80.2023.09.27.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:00:27 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 -next 1/4] RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
Date: Wed, 27 Sep 2023 22:30:12 +0530
Message-Id: <20230927170015.295232-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927170015.295232-1-sunilvl@ventanamicro.com>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_100031_911926_4FA01614 
X-CRM114-Status: GOOD (  20.13  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enhance the acpi_os_ioremap() to support opregions in MMIO space. Also,
have strict checks using EFI memory map to allow remapping the RAM similar
to arm64.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig       |  1 +
 arch/riscv/kernel/acpi.c | 87 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..ac039cf8af7a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -39,6 +39,7 @@ config RISCV
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_VDSO_DATA
+	select ARCH_KEEP_MEMBLOCK
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 56cb2c986c48..e619edc8b0cc 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -14,9 +14,10 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/efi.h>
 #include <linux/io.h>
+#include <linux/memblock.h>
 #include <linux/pci.h>
-#include <linux/efi.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
 int acpi_disabled = 1;
@@ -217,7 +218,89 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 
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
+				pr_warn(FW_BUG "requested region covers kernel memory\n");
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
