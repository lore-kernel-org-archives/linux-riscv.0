Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBE0C7EE2C
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuQw6NUMcRc/o+PPKSEX3RCjpqGeDFH+Yw6bdXt0Mio=; b=zLPZSTV//cDFOI
	IASuLs28fqBTg2lRas/ODMTe6j8xrejB6RBGfuYiBrYbxH2xBSxeZGIowZxZ0I+LHFhTVORVZp6LE
	UFEzhyZSGc0idBCwq0Sd88HITgHUn4Hy6eROOSIhaqMHELTC9ARAUDB2hUq5zjnfnP5EmBNPh2O2P
	ok2bQqjIR3ZuN7QtHLy9pmhr4KhZ2tou/5L4xZSYYnEVQ7HTd0xYUHoLBi7fAomfNgpVtfPVTzeK6
	81OehV4F7pfZLb+k8Y07f8JUfu3bUB4LPOWhimFRuL2iWUEwmWUokO9OHv6+Exf1WiehKEb3BogEG
	mzgKRjuOhhmQkNS2C48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI9-00ENNl-1J;
	Thu, 18 May 2023 22:40:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI5-00ENMR-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07798652B2;
	Thu, 18 May 2023 22:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403D4C4339E;
	Thu, 18 May 2023 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449608;
	bh=9JfENNR9tgTK4UNoFGHEIVOabute+dkxlDAuBXGtQfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QB0M+oGr1rOKswGvnr1C1iL1UiQbWGKJuDv1CinMsLyBHci9L/DWgl4qPPmz+7gru
	 PC14tSSVtgI0V3i1n2Ologpb3OByMA9+zCzftqxrWmZp951DtVr0cwfaLp6ldIMb4C
	 /W6GKiBKQiXWBSJz6+y//8e+46ngZpoZtUQZc7qSHy67r5sEPUOC4XMWWkWrPcWTKv
	 cHJB/MQmkIKZEarQS/ihxSdAsPkKZJoxzXaA1Om9p+0rwwBJ1+MXKUiq5S2Av2CCrl
	 RqMxabhOM6c3b/ZdUaLSKSjxT4TR87jjMZN9vJ1omgc20TfHN/iyhns6WFfZTyAZEJ
	 K1zdY78/BO/rg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 3/8] RISC-V: split early & late of_node to hartid mapping
Date: Thu, 18 May 2023 23:39:04 +0100
Message-Id: <20230518-president-stride-c199d1001579@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-moneybags-rebalance-1484db493d6a@spud>
References: <20230518-moneybags-rebalance-1484db493d6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3273; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=mqXlw0fgDUn4br2UCAGz540cPsRpVLpHCsPCQP13VEQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpKzk2culaM+bWTqqZtXvtoq7Yrr51woW7ZdnLtdP+e 844aePcUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIn4FzMy/F8qOVvFIf1vs+ee v3kVDxbIbi/Ib1q77VDrlV1rCr693MLI8OzVe76rR+4rvGCYcYC3zpC/8tOJukpub80z/ZcYTqq EcgMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154009_601358_3CF9159E 
X-CRM114-Status: GOOD (  16.10  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Some back and forth with Drew [1] about riscv_fill_hwcap() resulted in
the realisation that it is not very useful to parse the DT & perform
validation of riscv,isa every time we would like to get the id for a
hart.

Although it is no longer called in riscv_fill_hwcap(),
riscv_of_processor_hartid() is called in several other places.
Notably in setup_smp() it forms part of the logic for filling the mask
of possible CPUs. Since a possible CPU must have passed this basic
validation of riscv,isa, a repeat validation is not required.

Rename riscv_of_processor_id() to riscv_early_of_processor_id(),
which will be called from setup_smp() & introduce a new
riscv_of_processor_id() which makes use of the pre-populated mask of
possible cpus.

Link: https://lore.kernel.org/linux-riscv/xvdswl3iyikwvamny7ikrxo2ncuixshtg3f6uucjahpe3xpc5c@ud4cz4fkg5dj/ [1]
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/processor.h |  1 +
 arch/riscv/kernel/cpu.c            | 22 +++++++++++++++++++++-
 arch/riscv/kernel/smpboot.c        |  2 +-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 94a0590c6971..3479f9fca4b0 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -75,6 +75,7 @@ static inline void wait_for_interrupt(void)
 
 struct device_node;
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
+int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 
 extern void riscv_fill_hwcap(void);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f4dadbfecd04..7030a5004f8e 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -20,6 +20,26 @@
  * isn't an enabled and valid RISC-V hart node.
  */
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
+{
+	int cpu;
+
+	*hart = (unsigned long)of_get_cpu_hwid(node, 0);
+	if (*hart == ~0UL) {
+		pr_warn("Found CPU without hart ID\n");
+		return -ENODEV;
+	}
+
+	cpu = riscv_hartid_to_cpuid(*hart);
+	if (cpu < 0)
+		return cpu;
+
+	if (!cpu_possible(cpu))
+		return -ENODEV;
+
+	return 0;
+}
+
+int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hart)
 {
 	const char *isa;
 
@@ -28,7 +48,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 		return -ENODEV;
 	}
 
-	*hart = (unsigned long) of_get_cpu_hwid(node, 0);
+	*hart = (unsigned long)of_get_cpu_hwid(node, 0);
 	if (*hart == ~0UL) {
 		pr_warn("Found CPU without hart ID\n");
 		return -ENODEV;
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 445a4efee267..626238200010 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -81,7 +81,7 @@ void __init setup_smp(void)
 	cpu_set_ops(0);
 
 	for_each_of_cpu_node(dn) {
-		rc = riscv_of_processor_hartid(dn, &hart);
+		rc = riscv_early_of_processor_hartid(dn, &hart);
 		if (rc < 0)
 			continue;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
