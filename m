Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07A3C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 22:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvU4De7JXXY5rth+cHi8+gyF7PfBePDwb/48vDfr8tU=; b=0gEZDnmZWEh8pn
	jvxfEdM67JTu9qNp9eoglTx138978vekNDFnj1GfNzFDiwSdUQeK4gZlGpq64zq3n5ztrDc+gZXjf
	Rakomp4qQKZyrVY5tDZPoCqFVJ2J44vQUCJXHX7lBY8nG8fzbqviBHqSds8ahvkYMZMSOkVeHOjXj
	cJ03zBiRxT/eiIi0YDOS5JAY0RzPNzojDtuWH0vxNgv5FOy3fHN7EMoJ9nos28uV9AdOm6Sx3n0be
	gjMoW/ouMLHCnflD9aOG4E9zKV4vzcf9vvAJDhesHP3ZHg1PO/Bo/4vfkrIlDulvJdEGaPIjWii4J
	ITqSzofjbWbeOc+IZioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZdQ-000SOq-Tv; Thu, 07 Jul 2022 22:06:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZcR-000RjI-44
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 22:05:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a5so13448178wrx.12
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hjZHB/xWJ3nWli7ZfNwXsxb5s5FyrkVe3kCR2sto3MY=;
        b=YAksl8QG4Ad+/zsLgP3rFBKEVMf4C2+ycllCQpHkGjWiGmXMrv44Fa5DhcIcWd6OL0
         nSTFK6m5aqU3OdaAoJJlvx90zXqFH5x1SntHlfXOfmFM2szSOaT/cE4rNrCxUdQ0k/sb
         /MXyrA28CE+ypPlAWUYiPH/jh+0UZxSU6DqiijerAqCzqowZEABCeK7WJpCw83jCWrPN
         HOA9Wt1xlePu2vJNvPB59XhOaCfAaoCWjXki4pgl5sLkfmlFKReDiNi3ADDzQ/feC8+5
         CEFG1S2hd5Dk7O/gc4h/Ij2d+6Dp0wuaAqLn9hrf7s2FMU0JpxwUaKqg4II8nREXih3L
         4U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hjZHB/xWJ3nWli7ZfNwXsxb5s5FyrkVe3kCR2sto3MY=;
        b=rtvjZ6+WzSU1dURp+PERW9XFCaWIMYmCaM4CVA7h8dnRXHTc9MHUSA5ss4eY0ss9fZ
         x1NFscg0pENkvCNsenzaf470mPpi69Ziojvp3Lvc8dbYyMOeI/FPDntusPmT4EskKOwk
         4KWgWzQa1HrtT3k75yArRbTVGF48Q5Dp/TIkgOT3RDFIyH1t3FqKBF5XYQBjPR1mFQGK
         GvdBWImXoRW+Ou5sDSc5UARgzO/zvZ8vK3f0PuwTFSqQbpNe/qweDCPIrdnYq9MtHt1S
         bTBvPvW+rYpQe9rM5hxmabnXuxPUCjpkApxQCY/xvCmFEXAIxc3zzKyINxUZePEy0lkc
         YzDA==
X-Gm-Message-State: AJIora/Ge0ShbQwGHIvjkXmuX2ol8ypD8Tb7s50dYjVo1+hbF0LlilLn
	5Xe6UnyeZFq71hV5XZigIndetQ==
X-Google-Smtp-Source: AGRyM1ucM2HayA4Nu/4tlRlCtdGGmAk0G8SNuvQDYgL/iSBK+mKdFbxIG/Vfscu+gH+wgAlYNt1K1g==
X-Received: by 2002:adf:d206:0:b0:21d:6434:a158 with SMTP id j6-20020adfd206000000b0021d6434a158mr66682wrh.37.1657231501756;
        Thu, 07 Jul 2022 15:05:01 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id bn24-20020a056000061800b0020fe35aec4bsm38625743wrb.70.2022.07.07.15.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:05:01 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Changbin Du <changbin.du@intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [RFC 3/4] riscv: arch-topology: move riscv to the generic store_cpu_topology()
Date: Thu,  7 Jul 2022 23:04:36 +0100
Message-Id: <20220707220436.4105443-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220707220436.4105443-1-mail@conchuod.ie>
References: <20220707220436.4105443-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_150507_227925_37BA71BC 
X-CRM114-Status: GOOD (  14.31  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The default implementation of store_cpu_topology() is exactly that
used by RISC-V so revert the portions of aaaabbbbccccdddd ("riscv:
arch-topology: fix default topology reporting") which add the arch
specific version.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/topology.h | 13 -------------
 arch/riscv/kernel/Makefile        |  1 -
 arch/riscv/kernel/smpboot.c       |  1 -
 arch/riscv/kernel/topology.c      | 32 -------------------------------
 4 files changed, 47 deletions(-)
 delete mode 100644 arch/riscv/include/asm/topology.h
 delete mode 100644 arch/riscv/kernel/topology.c

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
deleted file mode 100644
index 36bc6ecda898..000000000000
--- a/arch/riscv/include/asm/topology.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
- */
-
-#ifndef _ASM_RISCV_TOPOLOGY_H
-#define _ASM_RISCV_TOPOLOGY_H
-
-#include <asm-generic/topology.h>
-
-void store_cpu_topology(unsigned int cpuid);
-
-#endif /* _ASM_RISCV_TOPOLOGY_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 9518882ba6f9..c71d6591d539 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -50,7 +50,6 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
-obj-y	+= topology.o
 obj-y	+= probes/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a8239b4b61f3..a1c861f84fe2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -32,7 +32,6 @@
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
-#include <asm/topology.h>
 
 #include "head.h"
 
diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
deleted file mode 100644
index db72862bd5b5..000000000000
--- a/arch/riscv/kernel/topology.c
+++ /dev/null
@@ -1,32 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
- *
- * Based on the arm64 version, which was in turn based on arm32, which was
- * ultimately based on sh's.
- * The arm64 version was listed as:
- * Copyright (C) 2011,2013,2014 Linaro Limited.
- */
-
-#include <linux/arch_topology.h>
-#include <linux/topology.h>
-#include <asm/topology.h>
-
-void store_cpu_topology(unsigned int cpuid)
-{
-	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
-
-	if (cpuid_topo->package_id != -1)
-		goto topology_populated;
-
-	cpuid_topo->thread_id = -1;
-	cpuid_topo->core_id = cpuid;
-	cpuid_topo->package_id = cpu_to_node(cpuid);
-
-	pr_debug("CPU%u: package %d core %d thread %d\n",
-		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
-		 cpuid_topo->thread_id);
-
-topology_populated:
-	update_siblings_masks(cpuid);
-}
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
