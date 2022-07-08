Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465B4C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 20:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1gR/b6sGFOaN9gZDzpeBSL1GbmyrMitLPLGM+sIaMA=; b=TYQyBOD6gyLXV4
	2eqqatQOTQRPO0oUaxTgv/BybuddSqDdp+fsA+wkUgbY2KGO+R8LOwy894QPqyBpjjQGH1LMlK09n
	S0BAnnKKZ+jJxcvfUZoRIlVcRdDXUFYyqTePO42wU6nZdVU+mxaXEz2t2QXs6+N1+G5NH7p4McJnG
	WVv8XliNcXCLvVipA/oar8ZPykHGtvvRtAtQbnsMZ7O0SicRguLrq3UG1gYNbrlaCHjwtFrjTjxqq
	jkw5UG+gX5PiQxKW8oFHylRMhPgHgcebsCa/kj71HWOiFi4LG+pPItoZDin8IVLGtAyLaU1AxL3Pw
	qD7g2ucC7s9+Wbcqm2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ug6-005p39-Ko; Fri, 08 Jul 2022 20:34:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ufn-005osI-QP
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 20:34:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id o4so31971401wrh.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Jul 2022 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3esZkwVy613d0mnGZgND5AwNK9S9FQGfuQwBw22Whgs=;
        b=LkdUJp8NQYuFnVjXuy40IWe/u/nUF1iLbAgQ8kwt1DzSjr8TjfY8OK6w5l4+RjAXpk
         iGEmip0XDsX5gphRrNhPKMRPlkxlJqghGpZhzZudw+mX4vXVSW5nv+HF7n2HqosjpiNM
         YonBlNbVJGWEEjJWl6z8/W4YIUcSFU7ulSKNbE74naVf2Y99F3CuefQwEjYmdXe9v9b0
         fYmg1JHhBwoNkaQ/eVpAo2iok0Zha85+oVM3BYxDZ5uGjFwyUdRev9zn8IzWlbt8z6Ob
         Wtcv+QL+5yfEOCJSycnUNxWqTVOR4k8tyJi4/8LzdW7E9wG4na7ntkHzNCS6Ybym50G0
         kWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3esZkwVy613d0mnGZgND5AwNK9S9FQGfuQwBw22Whgs=;
        b=TgpjsRJZVEL2OHy2OZaF8ZR9KUZO1mznZcvOTtJPIBEh+POcWIwTzDJZOAs/1KoZ1Z
         pXKesfXIrMhvMwa3/LnZ620jp7kBJYdFMmXAVgjCuwvFwmC57y4dorQsL2VFW0IgMvoq
         s0dUXIht/V1P+ooR6V1W5IZGSmvJ9k9s3NTaiAXxpzgngUG3R8+VvPhnKbsusf5VCl7X
         c01U1ThsnHgFBllA25cURnf8e88pauL+Q5H05KrtWzLZcW1lFb1Z3ZyeyaWl69Lir9s3
         N21o9cmVnPmB50lJXIID7JHUmx+KA9WPjh/kNV+423DTDCfCVW80yo0tZBDnGc5JiW+f
         zJQA==
X-Gm-Message-State: AJIora8jhP+ppgyRGgaBV1BAujoY33KfiG4lwSaSXylCycmGSzd5ov+h
	JRo0bPhSe+oDO0ggremE7J6EuQ==
X-Google-Smtp-Source: AGRyM1so5vGVqM4+gNIz7n/aN1RHiJ4Q1lPp5fkyRoMDo9JFFCW9Qz/vji4dAeXxwm+HNa/iGx/gUA==
X-Received: by 2002:a05:6000:18d:b0:21b:901e:9b27 with SMTP id p13-20020a056000018d00b0021b901e9b27mr5062706wrx.389.1657312435597;
        Fri, 08 Jul 2022 13:33:55 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id a3-20020a1cf003000000b0039c8a22554bsm3165034wmb.27.2022.07.08.13.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 13:33:54 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: topology: move store_cpu_topology() to shared code
Date: Fri,  8 Jul 2022 21:33:42 +0100
Message-Id: <20220708203342.256459-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708203342.256459-1-mail@conchuod.ie>
References: <20220708203342.256459-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_133359_866955_CE653BCF 
X-CRM114-Status: GOOD (  19.05  )
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
index 441e14ac33a4..07e84c6ac5c2 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
 	}
 }
 
+void __weak store_cpu_topology(unsigned int cpuid)
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
+
 static void clear_cpu_topology(int cpu)
 {
 	struct cpu_topology *cpu_topo = &cpu_topology[cpu];
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
