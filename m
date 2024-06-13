Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734C0C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl6WK+geQFfhcvogwL6Hiaslv7DRc0mbyagF9fCLgos=; b=TUkFddab/uviXO
	7U0WVy4R/idxTOCo0xWkkP/7FUJs6YjeG+MzN1fRdQsQVMJfQUZcS5ewdI+akFq7vJx9SmtgxxRba
	9k4FxuPyzCQzVYu1FZQ9cGrDyYJN0CsfLJ+UCkUyc4BivqonCz2ejm0EOc1cV1E9DFHGUPy/dm+m8
	DsW65ecxsLgyL81IzTMv7VcxbpEZMnujdydPkXvm2muxMD85ARwlI6rLRT9ktaiFWK5eE+kQRzZl4
	FrDqVyU3s0Dm3l5erdJEPmcoF/z2ZvayoXXUY1ykVgB5EpIV4pkbEMPT43PGGIsRvXGZiVeaFDc0I
	BqM2Lt+k0f3Uu0Z7Bm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfxv-0000000FjMZ-01gX;
	Thu, 13 Jun 2024 08:37:51 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfxr-0000000FjKG-2Nps;
	Thu, 13 Jun 2024 08:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718267868; x=1749803868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ex1BfUqwBKGcn6bmqOhnx0hqarbIcWjP42s/m1fBXKk=;
  b=F6Mcol+Mf98mG1lU3NY66ovG0avOWsIf+PchjUeipeuKGvLy4QpZoFXA
   US4AqVBct/15sXjrp8QH8nqXcFac5/vo/38rU+GonHo9X+K5kfZ8P+hfT
   pgMB0Rto70FzmFAFNnkmlRDVsn0qDJ2RXAd1lEqm8hBUYbI9KN/DbGu59
   7k4JLWgsL4nmGws7ybiSE9InDAm2IaafWYWFF069oI8HdzCRvV1j8iIxp
   TzN1DLT7H/qj3/keqiOIUundjyBm0fw8u7QkqlyGJM9fd4Wgq4kY1NZdK
   rxQAFuAzzTk56drDRSoJKQUrj/6CWi0sBwpfJu6ivffHMDfA3FSgBKLNM
   g==;
X-CSE-ConnectionGUID: V00rd+K9QYeubd+gryg/AA==
X-CSE-MsgGUID: HrGrY9jAQSG3sTZX/1TruQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25749303"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="25749303"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:37:47 -0700
X-CSE-ConnectionGUID: 1gvnnVjqQ6yZUNEZ9djjdQ==
X-CSE-MsgGUID: sHA/Q8m2T2yX18P2Q81yoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40033851"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 01:37:38 -0700
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
	Zong Li <zong.li@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Robert Richter <rrichter@amd.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 4/4] ACPI: NUMA: replace pr_info with pr_debug in arch_acpi_numa_init
Date: Thu, 13 Jun 2024 16:54:36 +0800
Message-Id: <109354315a02cd22145d2effa4a8c571b69d3e56.1718268003.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
References: <cover.1718268003.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_013747_767691_476DE4A5 
X-CRM114-Status: GOOD (  12.08  )
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

There are lots of ACPI enabled systems that aren't NUMA and If the
firmware didn't provide the SRAT/SLIT, then there will be a message
"Failed to initialise from firmware" from arch_acpi_numa_init() which
adding noise to the boot on all of those kind of systems. Replace the
pr_info with pr_debug in arch_acpi_numa_init() to avoid it.

Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/base/arch_numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 5b59d133b6af..555aee3ee8e7 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -445,7 +445,7 @@ static int __init arch_acpi_numa_init(void)
 
 	ret = acpi_numa_init();
 	if (ret) {
-		pr_info("Failed to initialise from firmware\n");
+		pr_debug("Failed to initialise from firmware\n");
 		return ret;
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
