Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0306BC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 22:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Abu4gjslGasuFPE/OErzGYeFoknzRjyCOzGgHp8dzk=; b=ec2pdhNcehForm
	7AdDBe8fkrwGd8Wpi49pe3dBwSNGJLyNJaZFEWOsCBDzuUVg2pRrDuJmUxmWdf1B2cjU0iVXqGxW7
	8vrDqRtfWTQbEv9Z4dGqvM9C5pvXzRlaVRmkUG+E6eE2EbCGMF5rVgAsiSU9yBv0T/7693uXF3j14
	FnaI89GkY6zjExApgXv5jbnhwog/ziGJ62/KGPirFb4N81WlnkKxP0i1LvbtA53jS/IHDuzeL7CVH
	aPVK/AK8ZCMCjoVBMnPEfHakr0HP4k9wWeXBY3eDHxkBOnHZhtie5uhgL6ogd6AMNK4tnA8DCyF5i
	LiJLTp5KBdkrdE3u/TSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ze9-000SsE-5Y; Thu, 07 Jul 2022 22:06:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZcR-000Rl9-Em
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 22:05:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id j7so11441176wmp.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 15:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bzkzOE355hqIqljAM5HpDyXsSE0Xgb88DMeaRs7oG5A=;
        b=CFw2+uM+g57y3O9S+BDDURXZpzm9TZdcD9w6aL1Q9BBp/mVgPJmSASYxpP46ODI+6+
         PgecRsuYskGLfb7pWQW18Rujt/ybeSrNqS2YyYXjL3PGfbJRSv6K1lZvtZs0Ew1awjCa
         tVi1UlnKshb0eP3bQ2It6U0uotgqO1ULv83499xyeDvhineaEnJgXRPaQ5XOSDgJfCNW
         EYUOjSmyeNrhenndSIkT/LnOYLFrW9I93HhO6uvHc07xdx91/7VKhz/YRjw17AIp5dCS
         c/EM+eOKzdPqPxP39Ifo1M7TWu6prFO7raXxXu/h7XuyKFrTAY4/OjwkNGwG2Mu9aQ1G
         gADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bzkzOE355hqIqljAM5HpDyXsSE0Xgb88DMeaRs7oG5A=;
        b=ntsa1A0TC8tXaEi+7w3yHxBr5HwG6SFYHJkJXRvWHwaIuMMaDXb1e7EZBOEr0kAWnU
         p0mCltfNp/9jj3lY7oCnkhh9U3W/S62Mc+pZUPZOGT0yhpEpYYqYLrcH76qfBy+6npm2
         sE/AOsslpcEql3oLq7Bnl2+aLGI6SsTeUzU/koG2pRKKqZCa6g6Hl816BNwtCG5IcRJX
         DeUAZgc4pG3LQRLZx3Bu/ajTZmieSZqPIUNs32pwUXDeFEPDAPVQpDDw79HcYgghJg4M
         znKcSlzr/hn7ZCGSyjE8Fdvk9bM7M7U5rZfnrTOeTyVWedDB26Hzs5UxmAlE6P4G/h/a
         /Mmg==
X-Gm-Message-State: AJIora9AM6leU2wfW7umOFmbB+jdJsjzwXdHXwwXdSRU35wFBoBztyv+
	qjhbcIkdoxP73PKk/eGLVfwg6g==
X-Google-Smtp-Source: AGRyM1tLaiEFk5UPNSD3yHAf3ofk6myCgCJqlLCWLDoubSbnhyUqfAR/rUMStUtSYmUvTHShFmNKCw==
X-Received: by 2002:a05:600c:601d:b0:3a1:a02e:872a with SMTP id az29-20020a05600c601d00b003a1a02e872amr14268wmb.3.1657231503662;
        Thu, 07 Jul 2022 15:05:03 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id bn24-20020a056000061800b0020fe35aec4bsm38625743wrb.70.2022.07.07.15.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:05:02 -0700 (PDT)
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
Subject: [RFC 4/4] arm64: arch-topology move arm64 to the generic store_cpu_topology()
Date: Thu,  7 Jul 2022 23:04:37 +0100
Message-Id: <20220707220436.4105443-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220707220436.4105443-1-mail@conchuod.ie>
References: <20220707220436.4105443-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_150507_523403_C8C2EEDE 
X-CRM114-Status: GOOD (  18.27  )
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

The default implementation of store_cpu_topology() was derived from the
arm64 implementation, but with the mpidr bits removed. Extract the mpidr
bits from the arch implementation to the callsites & use the generic
version.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/arm64/kernel/smp.c      | 16 +++++++++++++--
 arch/arm64/kernel/topology.c | 40 ------------------------------------
 2 files changed, 14 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 62ed361a4376..9e8acaa4c2f7 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -234,7 +234,12 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
-	store_cpu_topology(cpu);
+
+	/*
+	 * Uniprocessor systems can rely on default topology values
+	 */
+	if (!(mpidr & MPIDR_UP_BITMASK))
+		store_cpu_topology(cpu);
 
 	/*
 	 * Enable GIC and timers.
@@ -719,6 +724,7 @@ void __init smp_init_cpus(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
+	u64 mpidr;
 	int err;
 	unsigned int cpu;
 	unsigned int this_cpu;
@@ -726,7 +732,13 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	init_cpu_topology();
 
 	this_cpu = smp_processor_id();
-	store_cpu_topology(this_cpu);
+	mpidr = read_cpuid_mpidr();
+
+	/*
+	 * Uniprocessor systems can rely on default topology values
+	 */
+	if (!(mpidr & MPIDR_UP_BITMASK))
+		store_cpu_topology(this_cpu);
 	numa_store_cpu_info(this_cpu);
 	numa_add_cpu(this_cpu);
 
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
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
