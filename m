Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C54C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bz0eNhKraS1YHjTdxyAdGUDmLYFibVqUihb9qfNXrRU=; b=QwNnr7HkYYJfag
	5bSRZENEhBjYeFVXt3qS+2bhSV/epYucYK5FY+ygN0XqStefrx2PYhjsOBx3vKEyPL74undHrVE1M
	cjsJLWfU+PkfulVuclGkkLHAgn3EWtYyc/cAPW3UKoSMEfaCVdjFu0y9FFNJdk8L3o57ixDOmqW92
	cH9NSID952eatiqA3w3ZyuN79UGmFQLzdhHqOnVkDJdRKcWG1Z7NY3dcWfYt/MQ35lCa6IoOAeFjN
	IDlYiNZGvtKCJYV5zvQHVrQiqPTEjVXZ93jltNacyFoZkaUT2W9xAfuuIrIjDVgObJ0qU3dl9/D7R
	bBVF5mb7upcN9MF0yaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfxd-0000000FjBN-2vRg;
	Thu, 13 Jun 2024 08:37:33 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfxY-0000000Fj4N-3deS;
	Thu, 13 Jun 2024 08:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718267849; x=1749803849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N5aRoQ5a+tTTGwEUeHzYzKK2fG6O4xqUyQUF3EVDF0I=;
  b=XFvJjgQZEn0WAGQUZEl3wAWq19eZrw82Xeyco5Ko7Xmlgk/mziNma532
   0lkDetP/MnCbo+EBsNSWHQ98OdRYYmZf3ew/TYqzcyFtqxkRjt4rIf870
   rWOtCGTsisBLQnYme25uJTIPEMiO8GT1LOPvvjC3oJUY/SVKG6jfPp2O4
   CzwhW5RVgLtLc3+RIwEAB3FCTAlK7Uk+22sjQ2+H8L8qWA3TAzTPZnFhG
   VencKV9qyn7QapxGc6DXJN6B7EPw7JZQYMzGc1976freHR7vFGxG1Dy2t
   /ohd0B2O5j/wY+JLZtDA4THiPlQvtJrWTaL+hcbJwTRQyk3Edn+qXuhek
   w==;
X-CSE-ConnectionGUID: VcsSSECvTnais6xyIKE5xA==
X-CSE-MsgGUID: KOXQBXPWSFqGZxZ/+vrqyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25749238"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="25749238"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:37:28 -0700
X-CSE-ConnectionGUID: xEtIyw0CTh+EBzaSslP7dg==
X-CSE-MsgGUID: puLY93RPS1CngwiVDwzSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40033803"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 01:37:19 -0700
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
	Baoquan He <bhe@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Zhao Ke <ke.zhao@shingroup.cn>,
	Andy Chiu <andy.chiu@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
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
Subject: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
Date: Thu, 13 Jun 2024 16:54:35 +0800
Message-Id: <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
References: <cover.1718268003.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_013728_953142_50BEE13F 
X-CRM114-Status: GOOD (  12.40  )
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

x86/arm64/loongarch would select ACPI_NUMA by default and riscv
would do the same thing, so change it to a hidden option and the
select statements except for the X86_64_ACPI_NUMA can also go away.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/arm64/Kconfig        | 1 -
 arch/loongarch/Kconfig    | 1 -
 drivers/acpi/numa/Kconfig | 5 +----
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5d91259ee7b5..5079ad4e21a5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1484,7 +1484,6 @@ config HOTPLUG_CPU
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
 	select GENERIC_ARCH_NUMA
-	select ACPI_NUMA if ACPI
 	select OF_NUMA
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e38139c576ee..8d9e06e4ad84 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -470,7 +470,6 @@ config NR_CPUS
 config NUMA
 	bool "NUMA Support"
 	select SMP
-	select ACPI_NUMA if ACPI
 	help
 	  Say Y to compile the kernel with NUMA (Non-Uniform Memory Access)
 	  support.  This option improves performance on systems with more
diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
index 849c2bd820b9..f33194d1e43f 100644
--- a/drivers/acpi/numa/Kconfig
+++ b/drivers/acpi/numa/Kconfig
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config ACPI_NUMA
-	bool "NUMA support"
-	depends on NUMA
-	depends on (X86 || ARM64 || LOONGARCH)
-	default y if ARM64
+	def_bool NUMA && !X86
 
 config ACPI_HMAT
 	bool "ACPI Heterogeneous Memory Attribute Table Support"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
