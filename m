Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1517C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBLzKjKc8XH/Us9fl3QnxRusk5ZrpffPW3QqfOh5sD4=; b=eI2uYRbbiWeCMZ
	vIj7TwARop4HpG+f4SvdemT67jOrt9b5LgL89kPo22rM7S0c0pz2gAniS5OZxWghGsQ5qFhL91pPr
	AAe/18ZSNoyn2Tbf+sb4seZL6rZ6L6NbEqIZA3TLN2pNsDi+AIwrZCK8ZFzAF69DadUeeC9bHmMAJ
	Jmti5z+lU3QOStNgBxqNOGSwPVHPNx4EqBmlcKj3qtZkdFrkQmUszWTOkkyCX3nqIK7QChNrraNzq
	khTlC4HksdabwmKQZWHHDAUdqOC5X4N+P7/kzm6BhA4amy/21eFu7yBEcUN6J8XRRnEldbMDe1KJI
	vE5mZ2ZZcgF2V4LbjRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfxW-0000000Fj6j-26g0;
	Thu, 13 Jun 2024 08:37:26 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfxT-0000000Fj4N-1BAX;
	Thu, 13 Jun 2024 08:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718267843; x=1749803843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SaRkpFjoaclCx1YKomHNzFUcpLG013FKO00vTLvw6fg=;
  b=UwqUJRPR4Mhj9h4ca+1W5+c09Pd+gEnoi4xQ90Qlz2qNQppaYMBYcMLA
   mq56uodW2kMOvima5Z+TIkV8J1pAibo0+qr18Do3suS1LVgi9ql6z0Gc8
   zBQWNedZSejvigIAqZsLD81CEr39wt6n6o2Q6u3jpDS7FDRKeh83M8bq3
   QllMLLrvL2GrRq5dgHiwzEfvNII/97isvI6Uttfg89A6oDr7rT1zumMOA
   jdSFOzJVlA+byMpeMk4pCdxV4nSZ11vwZeu/65PFHXShebs348o72D+mN
   S899cO8h565cMM2lnqd9Css4HhLbXhRHUaC27yMoVHJLEwsFpTr65wjjO
   w==;
X-CSE-ConnectionGUID: LTP3NtCpShSzzPl8K06KbQ==
X-CSE-MsgGUID: pqoSfN6vSHCMkGyl727arQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25749157"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="25749157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:37:10 -0700
X-CSE-ConnectionGUID: pGAZOKfuR1K929rsczf0QA==
X-CSE-MsgGUID: wl+rYQFQQuqkHmvs9SoygA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40033730"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 01:36:59 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: sunilvl@ventanamicro.com,
	arnd@arndb.de
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Zhao Ke <ke.zhao@shingroup.cn>,
	Andy Chiu <andy.chiu@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Robert Richter <rrichter@amd.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 2/4] ACPI: NUMA: Add handler for SRAT RINTC affinity structure
Date: Thu, 13 Jun 2024 16:54:34 +0800
Message-Id: <e076514d78d92f104a5f2d8c82b8921f6aa26fdd.1718268003.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
References: <cover.1718268003.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_013723_426140_A68E71D7 
X-CRM114-Status: GOOD (  12.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add RINTC affinity structure handler during parsing SRAT table.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/numa/srat.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index e3f26e71637a..44f91f2c6c5d 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -167,6 +167,19 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
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
@@ -450,6 +463,21 @@ acpi_parse_gi_affinity(union acpi_subtable_headers *header,
 }
 #endif /* defined(CONFIG_X86) || defined (CONFIG_ARM64) */
 
+static int __init
+acpi_parse_rintc_affinity(union acpi_subtable_headers *header,
+			  const unsigned long end)
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
 static int __init acpi_parse_srat(struct acpi_table_header *table)
 {
 	struct acpi_table_srat *srat = (struct acpi_table_srat *)table;
@@ -485,7 +513,7 @@ int __init acpi_numa_init(void)
 
 	/* SRAT: System Resource Affinity Table */
 	if (!acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat)) {
-		struct acpi_subtable_proc srat_proc[4];
+		struct acpi_subtable_proc srat_proc[5];
 
 		memset(srat_proc, 0, sizeof(srat_proc));
 		srat_proc[0].id = ACPI_SRAT_TYPE_CPU_AFFINITY;
@@ -496,6 +524,8 @@ int __init acpi_numa_init(void)
 		srat_proc[2].handler = acpi_parse_gicc_affinity;
 		srat_proc[3].id = ACPI_SRAT_TYPE_GENERIC_AFFINITY;
 		srat_proc[3].handler = acpi_parse_gi_affinity;
+		srat_proc[4].id = ACPI_SRAT_TYPE_RINTC_AFFINITY;
+		srat_proc[4].handler = acpi_parse_rintc_affinity;
 
 		acpi_table_parse_entries_array(ACPI_SIG_SRAT,
 					sizeof(struct acpi_table_srat),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
