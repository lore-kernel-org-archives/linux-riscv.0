Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9C7C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 02:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWjUSFoZM1M5Y1gR6oI575BTH96YO3uSO+1AoaSZD3I=; b=TPZPM3zJEYJSwh
	PEgCcQuQO66G8S3yPsjIH3AyEh76nMOLPyhMWYq412Cvq6mpRersLLOQROLccRtm9za7ONUbfyE1H
	UiwPcgqCMXfa/BdDUaEV/Anluxios/KWK56W1Up3frup/aQ/LUEi/G+/+YWBVudXriDmGqJQSYjZR
	5Oezz/G2Uj8HdJhjIMyVsErgGo4A+K6DyUiv1ALH3tyAVuXcylqT/3Ad+53aG44nAePSdUiMaHaIM
	5FJPXhGNhWQhdLPAMUIOgG7c6AP1Jv81YQDJNmm9JXGAPUD/f0q/aJVbGnGdwOwUGkKlV1h0xFCz8
	fpPe26dlRhnzSYLIDaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV0Bx-00000001FIR-1jer;
	Wed, 31 Jan 2024 02:19:09 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV0Bv-00000001FGd-0GWG
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 02:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706667547; x=1738203547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EazMTTYX9oeR/uhQC7ENeexop7S60anC75kEcPjLk3Y=;
  b=Bky9jtv1AmGnEyLuST7iUPm66tWCHVgLTmBmJ/2GNDFZNRdmDWmk4Mz7
   Tm0tF6d4Ud8gS0k+mjha5BeRWmMPLMi4RsvgN7arXDcia0PfUo4dAvFq8
   e9uNu/jUlFYVRDsyMIOz0Uh8hAJ0gOxpj9OcJbFHQOsMVEhMGFDTa+bm8
   CjWU/82fsxz80z/VvOvlJpcSf9zcQvCJoTLgE4qhogq8jGGyQnbyl+Rx5
   wBR959dZwA5DgbM2cZDW+xSf5zGn3fa98HthE+k/MIk6kp/+VPSa4xWD7
   nWIFSZPtvJCxX0jmTwSQOIMksi/0NHwhjJxx69/k2AtVqjl3FBQafxuwZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="24939147"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="24939147"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:19:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="907714731"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="907714731"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:18:59 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Subject: [PATCH 2/4] ACPI: NUMA: Add handler for SRAT RINTC affinity structure
Date: Wed, 31 Jan 2024 10:31:59 +0800
Message-Id: <a1e20de53156f50385c7609507982f08866e859b.1706603678.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706603678.git.haibo1.xu@intel.com>
References: <cover.1706603678.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_181907_147779_D32F65A2 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add RINTC affinity structure handler during parsing SRAT table.
The ARCH specific implementation will be added in next patch.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 drivers/acpi/numa/srat.c | 32 +++++++++++++++++++++++++++++++-
 include/linux/acpi.h     |  3 +++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 0214518fc582..503abcf6125d 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -165,6 +165,19 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 		}
 	}
 	break;
+
+	case ACPI_SRAT_TYPE_RINTC_AFFINITY:
+		{
+			struct acpi_srat_rintc_affinity *p =
+			    (struct acpi_srat_rintc_affinity *)header;
+			pr_debug("SRAT Processor (acpi id[0x%04x]) in proximity domain %d %s\n",
+				 p->acpi_processor_uid,
+				 p->proximity_domain,
+				 (p->flags & ACPI_SRAT_RINTC_ENABLED) ?
+				 "enabled" : "disabled");
+		}
+		break;
+
 	default:
 		pr_warn("Found unsupported SRAT entry (type = 0x%x)\n",
 			header->type);
@@ -448,6 +461,21 @@ acpi_parse_gi_affinity(union acpi_subtable_headers *header,
 }
 #endif /* defined(CONFIG_X86) || defined (CONFIG_ARM64) */
 
+static int __init
+acpi_parse_rintc_affinity(union acpi_subtable_headers *header,
+			 const unsigned long end)
+{
+	struct acpi_srat_rintc_affinity *rintc_affinity;
+
+	rintc_affinity = (struct acpi_srat_rintc_affinity *)header;
+	acpi_table_print_srat_entry(&header->common);
+
+	/* let architecture-dependent part to do it */
+	acpi_numa_rintc_affinity_init(rintc_affinity);
+
+	return 0;
+}
+
 static int __initdata parsed_numa_memblks;
 
 static int __init
@@ -501,7 +529,7 @@ int __init acpi_numa_init(void)
 
 	/* SRAT: System Resource Affinity Table */
 	if (!acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat)) {
-		struct acpi_subtable_proc srat_proc[4];
+		struct acpi_subtable_proc srat_proc[5];
 
 		memset(srat_proc, 0, sizeof(srat_proc));
 		srat_proc[0].id = ACPI_SRAT_TYPE_CPU_AFFINITY;
@@ -512,6 +540,8 @@ int __init acpi_numa_init(void)
 		srat_proc[2].handler = acpi_parse_gicc_affinity;
 		srat_proc[3].id = ACPI_SRAT_TYPE_GENERIC_AFFINITY;
 		srat_proc[3].handler = acpi_parse_gi_affinity;
+		srat_proc[4].id = ACPI_SRAT_TYPE_RINTC_AFFINITY;
+		srat_proc[4].handler = acpi_parse_rintc_affinity;
 
 		acpi_table_parse_entries_array(ACPI_SIG_SRAT,
 					sizeof(struct acpi_table_srat),
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index b7165e52b3c6..a65273db55c6 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -269,6 +269,9 @@ acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa) { }
 
 int acpi_numa_memory_affinity_init (struct acpi_srat_mem_affinity *ma);
 
+static inline void
+acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa) { }
+
 #ifndef PHYS_CPUID_INVALID
 typedef u32 phys_cpuid_t;
 #define PHYS_CPUID_INVALID (phys_cpuid_t)(-1)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
