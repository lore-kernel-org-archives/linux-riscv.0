Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FDEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 05:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcdptjkzCLULlt5b5mMUeb8EMUDqNZ34yS8dvB+DEmA=; b=NHFz0jVdUePjd7
	jm6Aj/svAI0lObwfD+Mn2PQR0u4OFpbYXmM/o0KaCdOV8Cw0w5Ke0TU4blx9fLt+TwFUirFUb0y9Y
	NAa5zVRKL3sClWwRXz5BMThMYSVFhGMxHaYgaHdLg8VKQxIx2Nom6enMveS2BxDj0Rq7604aTVlbK
	ImPe6IeutdTfn/bcYvMIeZKO57jWPtl0hrUcARylNAyRLGwbXmXb9nNlGqbnaw7d5gzhI0J1uTn6W
	qcUKGXSXvks+PicjK/GIIl7fDWmOdezqryNPBSpwgiTXA9RMiom2fDNTFQvW2TP+2zoq0sUqMTt9J
	u/E9brVReN7rmd5s/flA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVEE-00000002h3U-2lo3;
	Wed, 24 Apr 2024 05:31:34 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVE7-00000002h0T-2icP;
	Wed, 24 Apr 2024 05:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713936688; x=1745472688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tPo4ypzFj/KicqcCKxaiOjCo7Eyu+TsGnLXFq3hFYTc=;
  b=gL0SCOdXaEOJkH48CwLlNNYb6X1X+WgXbMhxfce6c9ajjf80uUQd2Y20
   zeDuvOBH0G2EjuNKylfmUC3P/Xo7+hg+ehq0kJWcJInFDGYlSRzh8zZMV
   m/wVG4i1TVN7zKSGppqK22sLVoWcb7ZmXu7+Fz5mGv+ivflyfqhz0nZIV
   nJMB7HpeKo0agO08rYM0WFxPRgUFiWodR2j+bLc/qg+lxFMAu9ondfK/N
   MXvMoKpagHAVsJbTIVPb/TkOQ4MOdspxdlEYj633+63E+buxi5fY1sfm/
   Q6IiKZEST49vy5VNN/y92fYhrYp/Qd3JDtZhHXxk9Wx2SL2MmxRbFc+s2
   A==;
X-CSE-ConnectionGUID: qcD7O2ZyTy64D0OIYhliYQ==
X-CSE-MsgGUID: 9a0aIZVLQpGht0vMd0sB0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27004482"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27004482"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 22:31:28 -0700
X-CSE-ConnectionGUID: K2nGZA+6SxS85oF+8k8ISA==
X-CSE-MsgGUID: idXSMI25RBWTdeIp9t4v1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="62050525"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2024 22:31:16 -0700
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
	Greentime Hu <greentime.hu@sifive.com>,
	Baoquan He <bhe@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v3 6/6] ACPI: NUMA: replace pr_info with pr_debug in arch_acpi_numa_init
Date: Wed, 24 Apr 2024 13:46:26 +0800
Message-Id: <70870d88a26f50677eb31ac72bd8c343f428e5b6.1713778236.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713778236.git.haibo1.xu@intel.com>
References: <cover.1713778236.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_223130_030276_60964A58 
X-CRM114-Status: GOOD (  11.53  )
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
