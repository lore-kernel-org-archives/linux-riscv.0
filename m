Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4838FC10F16
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 05:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMikPvrH5pZhUHfYaO6ETV9tSP0/KXvHOw0WZovcXpM=; b=xJhBYJ9xjePkCF
	zEzj3LdK9ExGn+6LQATCLyIqbcipBxZ1Z/Fx/OCGrOPf3vN9c2GAbryJz/3EHjmbYwS0w5f2J6mJH
	zVuSwuJYGP42Za9uQixEyM4ypbhnt8x0WGBQwGtzH79YqGlkX5Ds/NQ0KpO2OIj7/CKIU9hgsZg1b
	YmM0pb0u/ygEgkjKMzGg3zvV13b1S9En7dsXYD7MiyRglcOrIm9zl7HVXoo6jsT9OFyUZmUR4CG/C
	Xc3QeDP5WeImJA3ZV/8X2gqWgCQ3ZiAIHwXHfkV8M7ClWGpZouA3TV1yuZ0gkLSct/a1EmcnCiIuI
	4ovS/w8PL2gNMUq1HMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVDx-00000002gtM-1am5;
	Wed, 24 Apr 2024 05:31:17 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVDm-00000002gmG-0j2z;
	Wed, 24 Apr 2024 05:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713936667; x=1745472667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xx39zSGpS7CLVBj5LielZhHEXa/MDDWMlQjEZWaS27o=;
  b=OA9mFPSnE+SHBYO3BftzWPtlKspDpmsy7qgRUNOie2Qfy9CZgvxzZu+8
   BD+Tspq1ML9uHLBGh/Fhrnwbp+Vm6eryZ28zt5SVQJjlXx0tt1fJxCYHH
   L6m8shgsdfuX2f8SkqcJXl1f0+PEf4lb/wJ8CsfLdhJuNXWTuwIFQI5VL
   QJpn4gqg9Z1NkL2GJxftO2qcF6X8fH3ewRpcde/KTCwHOU7wOqNELgtS9
   MXh7lMlMjzCD8YZNAZ6zq+h3a5+HILIfS6bpAs0ZP6nQMfyQFIzxtsZRd
   7llYVe6VTjqVOEdk1D8xgZ/mQOFMam42pDiY+4ETTQF2K99UYlwXX/a25
   Q==;
X-CSE-ConnectionGUID: 3VAGuhRYSp6ZZIHSug2d1w==
X-CSE-MsgGUID: 9gv3rurTSTO9Ya/ZfraIxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27004421"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27004421"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 22:31:06 -0700
X-CSE-ConnectionGUID: qWS/ZITWTV66hOx7yeOqmQ==
X-CSE-MsgGUID: Nbe1G5h2Sai4uMbWmluw7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="62050438"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2024 22:30:56 -0700
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
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Evan Green <evan@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v3 5/6] ACPI: NUMA: change the ACPI_NUMA to a hidden option
Date: Wed, 24 Apr 2024 13:46:25 +0800
Message-Id: <5c3a005a67096010cf3c465f8e3362651763fe3b.1713778236.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713778236.git.haibo1.xu@intel.com>
References: <cover.1713778236.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_223106_919783_CDD286D6 
X-CRM114-Status: GOOD (  11.83  )
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
---
 arch/arm64/Kconfig        | 1 -
 arch/loongarch/Kconfig    | 1 -
 drivers/acpi/numa/Kconfig | 5 +----
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b11c98b3e84..c6c667898da6 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1439,7 +1439,6 @@ config HOTPLUG_CPU
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
 	select GENERIC_ARCH_NUMA
-	select ACPI_NUMA if ACPI
 	select OF_NUMA
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..29d574a5c34c 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -465,7 +465,6 @@ config NR_CPUS
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
