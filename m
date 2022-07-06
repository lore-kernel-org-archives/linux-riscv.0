Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F164C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y76V16C1iuPNp2KHo/w4vZoUvN7SeH3S/2cc8NZsgqs=; b=oFcbawA4Js+p9l
	xD3UTREfWY2Jor2q1jCQ0UCth+w39EhTDUrDKtkOCpfMd60vnvNAh3+fK+7sSBb8PSLZmETQZPgA5
	RuZypJMRKaiK6yXGkoue8zEny6O4JuzHpIdrm2ihkxA3+FPLiYtCmU+ccg1nbB7jhoUtr0F+yvinf
	AeDVqhxqJ5fwnkyMxXSfjBqWUBGkqmQOld1oMnB97wzNqvgDjOJg1aUGDAglaw6O4I6ZvLzgA3nl9
	0zooAsrHCT5FGSbPs3SkLkkEQ24TrzU6L/EGX1OQm7FEKCF+RIF14umbj48CHBAavdukwbPXe5R+s
	Fsk16lBqReIX0Y52mGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9A2q-00C5B7-7c; Wed, 06 Jul 2022 18:46:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9A2n-00C595-C8
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 18:46:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h17so10127931wrx.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 11:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGvdz6Rm9o6IiK39KaZUlJWK5Ze9j+QdwV7tWQUA7MU=;
        b=Li8ztQ8ExNO98qv/gkCCl4oswxBwJHWf8Bm9oWaRjJHFNYPxPlYLiX0mSCO0sOMqOZ
         Jhydkww51gb4Uzdx+NtkZTefyLEIV6NWETM39flo7p/dKteM1j/ggg7MnYCvVObggzGx
         /6ylVdcmljUpSq9OA/i9kO9GcpyjtCl9dga4EYhHfBnP7Q17+zwBX7nU4w7dZBFsqalY
         Yd7k/sCuBcRMkaWfTcuX72xrU6115zPPyaV02AFu/3IWfD56DXTDQ3eyM0oGlHJ8lAU+
         A78ff5CDf76QCWcY5fxSv7JIhD3rFlS+r++abSr30I0PZjAV+bzU7DYvLwYqstqyn6Dj
         x4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGvdz6Rm9o6IiK39KaZUlJWK5Ze9j+QdwV7tWQUA7MU=;
        b=BzqSTACF/OUNHGlybd/J4iLrdYOQ9PFJSjSYnacKKOImQSVa3wHvnKuNjaXbW/0NeM
         0PovnTYzUbIoP35d5MYAAftNUCNH9MT0+195Vce0AQ88HFqoE8qOEbz6HYW7kzgCFYg8
         mMiNMYretlVgFUggkfb3jE/6G6FZjxnnXKVUQWB2y5yMB6jjduIC8VCyNK2GQPKypdCz
         8Dzf2qjL2RwMbhJUvWx2pHxdH1uOYGFZhR2AKKTB/Cv2fIAnmnrxHQe9AzSFdxDg7J4B
         r+n5K0DRGLk9SWCAacv82ZHd3qywdo8MnMUqUl/TMBsAyaRR6lmOn5/83P56GTimYg3s
         dd7w==
X-Gm-Message-State: AJIora/MTakgUTSz4qSdO2LEDoEEmDKTnDaC3je8abD7YtX168wpgwsW
	6Zdkmw1BLI0H49myH7kblLtI0hd2BgxYw5wzMpY=
X-Google-Smtp-Source: AGRyM1tc8cpgGWi82HnlRM0HYNg5vNvrHP5xofK1RdiRUlhPNGD8kzJ0a8PCmA+MWR+HU7nadb1BmQ==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id o8-20020a5d6488000000b00203b62870d2mr37474998wri.83.1657133194465;
        Wed, 06 Jul 2022 11:46:34 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b003a17ab4e7c8sm26876310wmq.39.2022.07.06.11.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:46:33 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudeep Holla <sudeep.holla@arm.com>
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH] riscv: arch-topology: fix default topology reporting
Date: Wed,  6 Jul 2022 19:45:59 +0100
Message-Id: <20220706184558.2557301-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_114637_509586_599D2665 
X-CRM114-Status: GOOD (  18.53  )
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

RISC-V has no sane defaults to fall back on where there is no cpu-map
in the devicetree.
Without sane defaults, the package, core and thread IDs are all set to
-1. This causes user-visible inaccuracies for tools like hwloc/lstopo
which rely on the sysfs cpu topology files to detect a system's
topology.

Add sane defaults in ~the exact same way as ARM64.

CC: stable@vger.kernel.org
Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Sudeep suggested that this be backported rather than the changes to
the devicetrees adding cpu-map since that property is optional.
That patchset is still valid in it's own right.

 arch/riscv/include/asm/topology.h | 13 +++++++++++++
 arch/riscv/kernel/Makefile        |  1 +
 arch/riscv/kernel/smpboot.c       |  4 ++++
 arch/riscv/kernel/topology.c      | 32 +++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 arch/riscv/include/asm/topology.h
 create mode 100644 arch/riscv/kernel/topology.c

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
new file mode 100644
index 000000000000..36bc6ecda898
--- /dev/null
+++ b/arch/riscv/include/asm/topology.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
+ */
+
+#ifndef _ASM_RISCV_TOPOLOGY_H
+#define _ASM_RISCV_TOPOLOGY_H
+
+#include <asm-generic/topology.h>
+
+void store_cpu_topology(unsigned int cpuid);
+
+#endif /* _ASM_RISCV_TOPOLOGY_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index c71d6591d539..9518882ba6f9 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -50,6 +50,7 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
+obj-y	+= topology.o
 obj-y	+= probes/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f1e4948a4b52..d551c7f452d4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -32,6 +32,7 @@
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
+#include <asm/topology.h>
 
 #include "head.h"
 
@@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
 void __init smp_prepare_boot_cpu(void)
 {
 	init_cpu_topology();
+
+	store_cpu_topology(smp_processor_id());
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
 	update_siblings_masks(curr_cpuid);
diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
new file mode 100644
index 000000000000..db72862bd5b5
--- /dev/null
+++ b/arch/riscv/kernel/topology.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
+ *
+ * Based on the arm64 version, which was in turn based on arm32, which was
+ * ultimately based on sh's.
+ * The arm64 version was listed as:
+ * Copyright (C) 2011,2013,2014 Linaro Limited.
+ */
+
+#include <linux/arch_topology.h>
+#include <linux/topology.h>
+#include <asm/topology.h>
+
+void store_cpu_topology(unsigned int cpuid)
+{
+	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+
+	if (cpuid_topo->package_id != -1)
+		goto topology_populated;
+
+	cpuid_topo->thread_id = -1;
+	cpuid_topo->core_id = cpuid;
+	cpuid_topo->package_id = cpu_to_node(cpuid);
+
+	pr_debug("CPU%u: package %d core %d thread %d\n",
+		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
+		 cpuid_topo->thread_id);
+
+topology_populated:
+	update_siblings_masks(cpuid);
+}

base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
