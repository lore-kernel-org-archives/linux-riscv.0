Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3F3C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uS7C+FSEBCmX3hArb1iI7hwXX8rGgN6ug4VjAQ8U/Q0=; b=MzEDZctC7kVlz2
	5fIlsy0VfLZYozUHy3XMjCnL9qpAlL0l1tUVXVIYRt0OzcjM6oPaKWpeRXQubLGd2nKXZtsXjSHZv
	tHjPvo4EAY1XDSStxo+d4NqeMqnuQWsSAND0sK5QH2XBfZK0WSP0OGs0dA8U4H5HJYkjzaoaMFb8K
	NEi4eztRbtmEX2IgRQ9RHLIN6mhb1OMjlLDyLygPMBeWOFK9JcrqMfB6BfFgVaiRgbzidqlPOkIZ3
	01FCS52Y0cPbPV90CWiGiAnELM/ofVnCKom9w9I6U8b0esTAKPuHwOWER4Gn8RP95h39ZB8pp+lU7
	IFLrTbCp99PVs/lCbrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccE-00AUUE-2C;
	Thu, 03 Aug 2023 18:00:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccB-00AURR-2t
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:00:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686f1240a22so1103504b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 10:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085597; x=1691690397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlgMxBU+gnbxavLK2CnXHLqjxrOHpsQhLJivrmp7gq8=;
        b=Mn/vo0MoTkPiEepTolmO07DSHUYqv7rFmArT6LTUsVmzAqnBvKBjkRZBvhSJTyiZAM
         1h1+n6DkofxPjLLD7asRa2i/oE66f7GWtWQqA9+nDJYue6PrwjDM067chowzEAr4ODxH
         vSRhcalLZi64uzfoqGFqhxbjGjGGDhdaLNb94wU3+LcfSd6SGzYCkrAI2qx43QP8mXm+
         DJ0Il1lN5U+uqlCxzJ+JnPkr+AJ87TQm7Mbi6Aqs2pV30Apw6vIAlJMrvnORHqksud91
         revKW71DM8rTMoqvZp3Ftaus2TBe8ju/o/MzItnmUE5tDKZn5+PQ0RhtNd0uQFIakZk6
         1UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085597; x=1691690397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlgMxBU+gnbxavLK2CnXHLqjxrOHpsQhLJivrmp7gq8=;
        b=lMgWewFv1LFNvjfVIPle563gnZLMCV3C5aEvIsB1PPp48Ki66OM2HfL/Sulr/GF7Ie
         kAlXpGKdFE4oXYl4NTDC1ZsLGfchZW0S/JHSVMb2SH+s1/xrWA+tbOzGtNU0pWlfjYk3
         4b/Yz1gPj2RvZfoZHMoNjWIcUkMO7hyAxZcsT8eYyYhynm7Epg+h+cUcqRowhRNYib5F
         5UfJ3Rf8Q92WukjfFDAMhHUJbn0b/YOhbK0NkbkasSVowhn8SuhuET5jVkC1+XIGtwG8
         zP0NAMQOyIiy7+FZPcbQHd763vDjPavVX8u2Y2QZ5vIN4yllbK33ysXANf8GAUgkSobe
         3Qaw==
X-Gm-Message-State: ABy/qLZy6d3NvTZu3ZRsX/2lpo4GtzTQ5vxwwQfREYiPxU7wyt5+nrgN
	NVEIGiJhxu1KJxuwNnF2OxnkHgifTSG77kCf+ko=
X-Google-Smtp-Source: APBJJlHeLQhx5wJXxieN87kQ/FrrGdUXv58YAFTjJ6UeQQPmtQGf8bvG5vbiImqAXiXcjHGvc1bNlw==
X-Received: by 2002:a05:6a00:c86:b0:682:4c9f:aa0 with SMTP id a6-20020a056a000c8600b006824c9f0aa0mr23559310pfv.29.1691085596954;
        Thu, 03 Aug 2023 10:59:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.10.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:59:56 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 03/21] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
Date: Thu,  3 Aug 2023 23:28:58 +0530
Message-Id: <20230803175916.3174453-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_105959_939685_55A74C2D 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel test robot <lkp@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_os_ioremap() currently is a wrapper to memremap() on
RISC-V. But the callers of acpi_os_ioremap() expect it to
return __iomem address and hence sparse tool reports a new
warning. Fix this issue by type casting to  __iomem type.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h | 2 +-
 arch/riscv/kernel/acpi.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index f71ce21ff684..d5604d2073bc 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -19,7 +19,7 @@ typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HARTID
 
 /* ACPI table mapping after acpi_permanent_mmap is set */
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
 #define acpi_os_ioremap acpi_os_ioremap
 
 #define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 5ee03ebab80e..56cb2c986c48 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -215,9 +215,9 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	early_iounmap(map, size);
 }
 
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 {
-	return memremap(phys, size, MEMREMAP_WB);
+	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
 }
 
 #ifdef CONFIG_PCI
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
