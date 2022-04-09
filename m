Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3012C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 22:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2SuFZt0cOb5EzlbF5pTGr/s0g2brWTnyzz9ovegQchg=; b=R+e/WlxqZxbTBZ
	EISkpvTqUVRzpLmyZm65e23NvKe+OpCWIiO09VHqyQNCsnTrWml6agOif+d/zN0BY470DzPAdnySQ
	ycIJZ6Phm+bPj+9ocZow9EsOsqYWqCcd7vz+m9RzOBfY6TYqJhFxsmEEjCEKLhsblpGvAMoKSlL1m
	Pbg2puh6hsDWJkgb6BSBNEGanOQq8OEhPefYQ/SDeBasbzT/zUS88xvGEpa8SZHkhbR+gyJJ1vR8l
	+QBjK72/XJidk0kgIIFssXRhFFHkAuow5q/kPupEkqxqhDpo3x//DU/BNGILCuMIM+OCKWJjWbXEi
	l4gW36CuzI93/SvzVddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndJxM-003szE-7P; Sat, 09 Apr 2022 22:53:24 +0000
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndJxH-003syH-MI; Sat, 09 Apr 2022 22:53:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Anup Patel <anup.patel@wdc.com>, Anup Patel <apatel@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] RISC-V: cpuidle: fix Kconfig select for RISCV_SBI_CPUIDLE
Date: Sat,  9 Apr 2022 15:53:17 -0700
Message-Id: <20220409225317.14332-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

There can be lots of build errors when building cpuidle-riscv-sbi.o.
They are all caused by a kconfig problem with this warning:

WARNING: unmet direct dependencies detected for RISCV_SBI_CPUIDLE
  Depends on [n]: CPU_IDLE [=y] && RISCV [=y] && RISCV_SBI [=n]
  Selected by [y]:
  - SOC_VIRT [=y] && CPU_IDLE [=y]

so make the 'select' of RISCV_SBI_CPUIDLE also depend on RISCV_SBI.

Fixes: c5179ef1ca0c ("RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/Kconfig.socs |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -38,7 +38,7 @@ config SOC_VIRT
 	select SIFIVE_PLIC
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM && OF
-	select RISCV_SBI_CPUIDLE if CPU_IDLE
+	select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
 	help
 	  This enables support for QEMU Virt Machine.
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
