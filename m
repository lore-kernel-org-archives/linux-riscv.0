Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0570C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+EwN4kFuyyb7Zf1tq+s3M1ILXH1LIE8XQlhJHkN9ME=; b=GyycSh0e9iw+Mx
	Rdt/LEZNBhBw/jIuI7CNw0HCTDtNQXLJTdSRd6zvAx1RHg0uFkws0kDNSTM926qQ7xTlRVfFCasCj
	AZkm253WFSEz0kWNWoxpi3SyH0qUWerxy4dE6EVz9Hxp3S/LmsCFfc8MxiarIgX4GzXndKOOajGSG
	nGdR/QdoAFbgm8B17rY0fZOLPEuokEPaT5uHvgKbd1eolzqUMd1H1EEHU5mfJig6S2BkyZGevhJmf
	+HEzdthLvYECzDm70AJov61J21M6KTIBopmIKeFw64cju0OIUmhfEN7GApN7wPCjcTmmrQUCdCl24
	A8ASeBzE3UDf5HYtOSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9DE-00000003e0s-0UN1;
	Thu, 07 Mar 2024 08:34:48 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9DB-00000003dzp-0jGX
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 08:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709800486; x=1741336486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vVb6RIIvOt4enB6/MzuWcA6dkAPHXShQ2Vxb7to1nk8=;
  b=gmMy1doeiLf/bohCn0JmPik8+HxLrqPIr48cMTerjyxxV/LzyO65Q3+v
   CVMUqxijcJypm4/DCpuiK9lXQ70pOhuJ9h50PkstneoZ9oYKtfz3AYOH5
   tYbyomj5Zw4mzCroEh7M5kwmUN+zkqHQIIajduc5x3LcPLi1PWPpuQpr1
   7lL16gFthcCFziyCIkQI9iBT8Mw+vQwkJ4Y2GzHHl96hS22EeE3XpcjAB
   6y1o7CNJYYzaMW8M3hkkj3rax5+3i+gvXe2LMz3yt2jbNZGFC9BrjAazu
   05R8dZvQ2cJudKDa2PN/NCych81ZNAYMcUPJz4QvzpbflV1qnqdjFZy1G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4600307"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4600307"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="14699587"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2024 00:34:35 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Subject: [PATCH v2 1/6] ACPICA: SRAT: Add RISC-V RINTC affinity structure
Date: Thu,  7 Mar 2024 16:47:53 +0800
Message-Id: <01b9c8a6d029b178f819616912a0ff8928b534a8.1709780590.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709780590.git.haibo1.xu@intel.com>
References: <cover.1709780590.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_003445_271833_E0B21A92 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Jisheng Zhang <jszhang@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Dan Williams <dan.j.williams@intel.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPICA commit 93caddbf2f620769052c59ec471f018281dc3a24

Add definition of RISC-V Interrupt Controller(RINTC)
affinity structure which was approved by UEFI forum
and will be part of next ACPI spec version(6.6).

Link: https://github.com/acpica/acpica/commit/93caddbf
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 include/acpi/actbl3.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl3.h b/include/acpi/actbl3.h
index c080d579a546..5202e3fc9b41 100644
--- a/include/acpi/actbl3.h
+++ b/include/acpi/actbl3.h
@@ -192,7 +192,8 @@ enum acpi_srat_type {
 	ACPI_SRAT_TYPE_GIC_ITS_AFFINITY = 4,	/* ACPI 6.2 */
 	ACPI_SRAT_TYPE_GENERIC_AFFINITY = 5,	/* ACPI 6.3 */
 	ACPI_SRAT_TYPE_GENERIC_PORT_AFFINITY = 6,	/* ACPI 6.4 */
-	ACPI_SRAT_TYPE_RESERVED = 7	/* 7 and greater are reserved */
+	ACPI_SRAT_TYPE_RINTC_AFFINITY = 7,	/* ACPI 6.6 */
+	ACPI_SRAT_TYPE_RESERVED = 8	/* 8 and greater are reserved */
 };
 
 /*
@@ -296,6 +297,21 @@ struct acpi_srat_generic_affinity {
 #define ACPI_SRAT_GENERIC_AFFINITY_ENABLED     (1)	/* 00: Use affinity structure */
 #define ACPI_SRAT_ARCHITECTURAL_TRANSACTIONS   (1<<1)	/* ACPI 6.4 */
 
+/* 7: RINTC Affinity (ACPI 6.6) */
+
+struct acpi_srat_rintc_affinity {
+	struct acpi_subtable_header header;
+	u16 reserved;           /* Reserved, must be zero */
+	u32 proximity_domain;
+	u32 acpi_processor_uid;
+	u32 flags;
+	u32 clock_domain;
+};
+
+/* Flags for struct acpi_srat_rintc_affinity */
+
+#define ACPI_SRAT_RINTC_ENABLED     (1)	/* 00: Use affinity structure */
+
 /*******************************************************************************
  *
  * STAO - Status Override Table (_STA override) - ACPI 6.0
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
