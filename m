Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9EBCCA47C
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP22rTAP/G9mJ/p1u3Urlfd26Wv+plrKwcTccdaRv44=; b=gVHkerzi953OkY
	82aP2/e/IbWkOOmhL/82Htj61cLNAWhIrrESOCglQahSrCJHxR2F2dAV3jAEyg6GoM8h9oGASWwmz
	lNBTo9idULHotm4FZVGrqE1f9FGkBmrirK66djuMcYuJmeZKDN6Uqc8TIZC6GmxpOSh9M5mg6iUw5
	l0YPw9aqtd/mpJrzw8lIZWZdXimPCgS0ReRiQhUKrbyM0QnaVomSwcItAYyTX7Hdesk4SQb3sr1oD
	8dmbyue+8Oba1/G6CZoZASi9bO+cfkUMfcQ182R+YWbICVptnvl8TGthF6UhJzhxF/PE8tUTUM5uY
	EztwqzQW9HIjn7F2PFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oACKL-008RqM-VE; Sat, 09 Jul 2022 15:25:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oACK4-008RiH-P4
	for linux-riscv@lists.infradead.org; Sat, 09 Jul 2022 15:24:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o19-20020a05600c511300b003a2de48b4bbso1319145wms.5
        for <linux-riscv@lists.infradead.org>; Sat, 09 Jul 2022 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZvwkXF6SJyNdBT6GaKehBhnkInv+9xYsnjB27F2CrTA=;
        b=cWTxzGaC+PmqSgrWtYZ3lV2Ogppapc9JsZQQ4yuI9kyTwToYEt+TaRo1SNL2/8VSKZ
         NkKVvHZJo1U+XZV4hjmMqe2/kH3kABibGL2WK0pBrfbE0Qtm7IyJoyGvHaJiyWVDsy6a
         6PNwjP3lexTIt5Z0I5TzwDPBe0eWxVtWM/umfUSkCmsxjMygGx+Px3h0W5JAxuZtPXKh
         Vhzb55MiyjYNhJwzKmJ7L4ysB6HgpMMhuwxGWehmJxzC7slj6tEb61vYZAaQDRLzf/7V
         Hmw8kOMwVVMndg6q5gHq79p1KQBMaJFPhzLOkTfujofWsAZI3myeO3nZDAD1ZrMCsaWe
         BMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZvwkXF6SJyNdBT6GaKehBhnkInv+9xYsnjB27F2CrTA=;
        b=1bakXXpVSVxguA80Qo4LTUV8dMwShx9S5K5EWccR+R83q+kXZnPyoICEuf1CfHM4pg
         CaSFO9f3+wsxWFE4u+J8nbzxyJYt6DFRf65nEFMVZdJcbEzMOG7IXCuprN43ulUUYcJz
         ik6lgWyekLpVz29t8Rv12R77FRaFOuef78/ObdzRIYBPVpMptht0D5tQznS7a2VSeCTd
         xTq8MV9WP6r3fLlxFY2oMQImCMNDIRzIaBpOMmZkbWIN69m7lj+GhdF04wfsDLFRUbh6
         QI5gU7qDijhCmHrsrDXGY1NRw+BG7H39gM4ODlBAbWnyqzflsmDCIOsaMns8M275BGb0
         +h7A==
X-Gm-Message-State: AJIora+DtCsjE6LB4ShJxYVgdggaxK95jpIrkUgzBlrbIM46Lm0aH1YK
	+Qtm+uZ7fEGyk77yT1nA6DXUzA==
X-Google-Smtp-Source: AGRyM1su0j5S1ZJEHOgEYJAvl01nJ+NeZWkGFf5ZilleXbx20pC9durj+kh1JowffRW8wgnNtAhd/Q==
X-Received: by 2002:a05:600c:1c0e:b0:3a1:9a4b:28ee with SMTP id j14-20020a05600c1c0e00b003a19a4b28eemr5840203wms.203.1657380280658;
        Sat, 09 Jul 2022 08:24:40 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id y12-20020a5d620c000000b0021d63fe0f03sm1626730wru.12.2022.07.09.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 08:24:40 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: topology: move store_cpu_topology() to shared code
Date: Sat,  9 Jul 2022 16:23:54 +0100
Message-Id: <20220709152354.2856586-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220709152354.2856586-1-mail@conchuod.ie>
References: <20220709152354.2856586-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_082444_900248_A2ADDDBD 
X-CRM114-Status: GOOD (  17.76  )
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
index 441e14ac33a4..b7633bacbd31 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -845,4 +845,23 @@ void __init init_cpu_topology(void)
 		}
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
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
