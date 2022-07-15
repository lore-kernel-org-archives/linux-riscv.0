Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6D9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbaYSSUQ30pMjlAqPf4c387O0djDOhmv9DDo9cxJ7iE=; b=cH6GJP1LCJZVy9
	TUqHJaN14GAMzXFZAQQZSQxA8dwh+LEJOaqEZEPVeg+7ob7G4f9vfcVrcDYS5KVRNpKPFXpWv+5Od
	/UwJ0Ph3UJ8mlikVALXIs4IledreaVOGePmukHS83eim9L5XTZqkFPSW5BR9rsSTtKd9fziH0sp7H
	MLf0nB0BgAwQdi2WBnxTFZ08pDfN0goZdUYKZBZ8sWJ4m3HVmLGCQzsjaj+873l/EYevSKYjfJHJE
	XnYJ16747DyxzMaR7EtDwYpL/z/TwqWp72D2nSlwctKDJBJ+t0S+xU50EVUBXEU2V0ki/Kv1yNWno
	HLUNgM+92HjzgBLyV1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPVs-009I2B-U9; Fri, 15 Jul 2022 17:54:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPVW-009Hw6-MF
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:53:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id ay25so3239602wmb.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TI7+rhWBkGbatNs0vcGExprAw/dMIZ8+GzDCKOj9Sjs=;
        b=RgCkQ22+lKhSv5UsZqETHaBjszzbB5eZRyH3n6fwC/Jj2lw75DYoUeo+aViZw/SvZg
         h9OJO8RN4xqEBgYi9eveVVYu/bzADw3b2JbKd5r/FKXz2GQI60hPuiyH7NZNu13t739x
         Kv2KQDxz0jNyNCrT3uEGpQ+gFSO8d0SgakZhK7ifXNOAQ/rk7nOt5KFatwJThxiUWWJO
         E14uh7FSnos+EN/l8GNBYtX23RweEVhtkrqp2aGbwVFqi4d+cfQEogYGUCKKc0QBVQPm
         tNsRg+8vigIs2MirGKEXFTSKr4KRfNC6C+a1+r92yl3tibDAelNN/WoU4kwmJ37yZ37/
         y68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TI7+rhWBkGbatNs0vcGExprAw/dMIZ8+GzDCKOj9Sjs=;
        b=6YvtxUB/pP+Em+tGideyjYhoh63DAyn9t6WsSz0BuGZGFF+OFRmpeQnAoF0eJFg41l
         9ladNn0nLKqfIj7MuTZ7WsNdQznXQekD5q+RUpTkek8gqHYxK0xMXy2jcix+So6cN5O4
         jqRakrSrQ5dUWehqIzQqSa1xcXwuIRbDuy7+40eUhBSQz9hYwyJTlgPCsjLxJK7xPIFy
         myKj8/9L4Of6ZyLrNOpghRuDjLfoJm5B8s5F1BFouBvYs5wGPG/uVQD1e3ZTe00wAToq
         o/qDsdBvr08rMi3+X4IlpxjWrUwmNuOMjmgqWO/jjZwfpxeC+E8n+HgY/YwCEvlsAnVv
         S6kw==
X-Gm-Message-State: AJIora8yI4S4emE6Gf92z42c8c/2cQYjvIuF7CAJ9Bm/xot1FpjOWSog
	6nB1QgcU0gYdrbbdA3/Oa8w6pw==
X-Google-Smtp-Source: AGRyM1v16C+sTtH7uzq4xXTnOT9ZFNxBc0KIM/kiFyQv3Pr4mNsCyT2217B/fiLmVgaLmHeEMPlI2A==
X-Received: by 2002:a05:600c:3491:b0:3a0:4d4a:2e2d with SMTP id a17-20020a05600c349100b003a04d4a2e2dmr22285077wmq.4.1657907619894;
        Fri, 15 Jul 2022 10:53:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4c49000000b002167efdd549sm4364131wrt.38.2022.07.15.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:53:39 -0700 (PDT)
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
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH v4 1/2] arm64: topology: move store_cpu_topology() to shared code
Date: Fri, 15 Jul 2022 18:51:55 +0100
Message-Id: <20220715175155.3567243-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715175155.3567243-1-mail@conchuod.ie>
References: <20220715175155.3567243-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_105342_731728_11B6931C 
X-CRM114-Status: GOOD (  17.77  )
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

arm64's method of defining a default cpu topology requires only minimal
changes to apply to RISC-V also. The current arm64 implementation exits
early in a uniprocessor configuration by reading MPIDR & claiming that
uniprocessor can rely on the default values.

This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
topology: Stop using MPIDR for topology information")', because the
current code just assigns default values for multiprocessor systems.

With the MPIDR references removed, store_cpu_topolgy() can be moved to
the common arch_topology code.

CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/kernel/topology.c | 40 ------------------------------------
 drivers/base/arch_topology.c | 19 +++++++++++++++++
 2 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 869ffc4d4484..7889a00f5487 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -22,46 +22,6 @@
 #include <asm/cputype.h>
 #include <asm/topology.h>
 
-void store_cpu_topology(unsigned int cpuid)
-{
-	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
-	u64 mpidr;
-
-	if (cpuid_topo->package_id != -1)
-		goto topology_populated;
-
-	mpidr = read_cpuid_mpidr();
-
-	/* Uniprocessor systems can rely on default topology values */
-	if (mpidr & MPIDR_UP_BITMASK)
-		return;
-
-	/*
-	 * This would be the place to create cpu topology based on MPIDR.
-	 *
-	 * However, it cannot be trusted to depict the actual topology; some
-	 * pieces of the architecture enforce an artificial cap on Aff0 values
-	 * (e.g. GICv3's ICC_SGI1R_EL1 limits it to 15), leading to an
-	 * artificial cycling of Aff1, Aff2 and Aff3 values. IOW, these end up
-	 * having absolutely no relationship to the actual underlying system
-	 * topology, and cannot be reasonably used as core / package ID.
-	 *
-	 * If the MT bit is set, Aff0 *could* be used to define a thread ID, but
-	 * we still wouldn't be able to obtain a sane core ID. This means we
-	 * need to entirely ignore MPIDR for any topology deduction.
-	 */
-	cpuid_topo->thread_id  = -1;
-	cpuid_topo->core_id    = cpuid;
-	cpuid_topo->package_id = cpu_to_node(cpuid);
-
-	pr_debug("CPU%u: cluster %d core %d thread %d mpidr %#016llx\n",
-		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
-		 cpuid_topo->thread_id, mpidr);
-
-topology_populated:
-	update_siblings_masks(cpuid);
-}
-
 #ifdef CONFIG_ACPI
 static bool __init acpi_cpu_is_threaded(int cpu)
 {
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 0424b59b695e..0e2c6b30dd69 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -841,4 +841,23 @@ void __init init_cpu_topology(void)
 		return;
 	}
 }
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
 #endif
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
