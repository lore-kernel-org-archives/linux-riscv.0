Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB5CC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VOgnHPscafQelqOTPHlzlmFpvaWR9T2R4S4EGvmQ57Y=; b=Z1hor7I+K6XaWG
	ut5i+04Jqoh9kZIggoby6FPxzf93rlfM5lPJIhsfcqwoB/W7OYe+RpL5yxPHpclBNvC5pKf1mRitA
	a2RozdgGfYmjGX+qO0XQTSgbHfWsOKJTtfyKYRbW3yHopM92kj+edHu6qwSWyLKqMpmK5163wzQ04
	QpvQOzH/aEmIknVJLPCErGFLx8wZoj7PMB+STr60oMO7j2WkKvCzZxFKiT8EyhYIyaohThuycbeUw
	rv0k+jMV4QfGABGmTvWF6A2p5b59BqNpBoJPiK4OK09ooxZPgUyiItQke0E29exUXrUWcuteQvy3E
	utwukwLTKKg1rJugd2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOH8g-001N4K-Sm; Wed, 17 Aug 2022 11:23:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOH8b-001N0a-5u
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 11:23:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oOH8X-000217-JK; Wed, 17 Aug 2022 13:23:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: atishp@atishpatra.org,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	philipp.tomsich@vrull.eu,
	cmuellner@linux.com,
	samuel@sholland.org,
	guoren@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH RESEND] drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Wed, 17 Aug 2022 13:22:59 +0200
Message-Id: <20220817112259.745877-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_042305_298569_7894DD60 
X-CRM114-Status: GOOD (  17.51  )
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

With the T-HEAD C9XX cores being designed before or during the ratification
to the SSCOFPMF extension, they implement functionality very similar but
not equal to it. So add some adaptions to allow the C9XX to still handle
its PMU through the regular SBI PMU interface instead of defining new
interfaces or drivers.

To work properly, this requires a matching change in SBI, though the actual
interface between kernel and SBI does not change.

The main differences are a the overflow CSR and irq number.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Resend, because I missed two important people in my Cc list, sorry.

openSBI-patch-series can be found on
http://lists.infradead.org/pipermail/opensbi/2022-August/003259.html

 drivers/perf/riscv_pmu_sbi.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6f6681bbfd36..4589166e0de4 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -41,12 +41,17 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
 	NULL,
 };
 
+#define THEAD_C9XX_RV_IRQ_PMU			17
+#define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
+
 /*
  * RISC-V doesn't have hetergenous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
  */
 static union sbi_pmu_ctr_info *pmu_ctr_list;
+static unsigned int riscv_pmu_irq_num;
 static unsigned int riscv_pmu_irq;
+static bool is_thead_c9xx;
 
 struct sbi_pmu_event_data {
 	union {
@@ -575,7 +580,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	event = cpu_hw_evt->events[fidx];
 	if (!event) {
-		csr_clear(CSR_SIP, SIP_LCOFIP);
+		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
 		return IRQ_NONE;
 	}
 
@@ -583,13 +588,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	pmu_sbi_stop_hw_ctrs(pmu);
 
 	/* Overflow status register should only be read after counter are stopped */
-	overflow = csr_read(CSR_SSCOUNTOVF);
+	overflow = !is_thead_c9xx ? csr_read(CSR_SSCOUNTOVF)
+				  : csr_read(THEAD_C9XX_CSR_SCOUNTEROF);
 
 	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
 	 * all the counters to avoid any race condition.
 	 */
-	csr_clear(CSR_SIP, SIP_LCOFIP);
+	csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
 
 	/* No overflow bit is set */
 	if (!overflow)
@@ -653,8 +659,8 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
-		csr_clear(CSR_IP, BIT(RV_IRQ_PMU));
-		csr_set(CSR_IE, BIT(RV_IRQ_PMU));
+		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
+		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
 
@@ -665,7 +671,7 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		disable_percpu_irq(riscv_pmu_irq);
-		csr_clear(CSR_IE, BIT(RV_IRQ_PMU));
+		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
 	}
 
 	/* Disable all counters access for user mode now */
@@ -681,7 +687,11 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	struct device_node *cpu, *child;
 	struct irq_domain *domain = NULL;
 
-	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
+	is_thead_c9xx = (sbi_get_mvendorid() == THEAD_VENDOR_ID &&
+			 sbi_get_marchid() == 0 &&
+			 sbi_get_mimpid() == 0);
+
+	if (!riscv_isa_extension_available(NULL, SSCOFPMF) && !is_thead_c9xx)
 		return -EOPNOTSUPP;
 
 	for_each_of_cpu_node(cpu) {
@@ -703,7 +713,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		return -ENODEV;
 	}
 
-	riscv_pmu_irq = irq_create_mapping(domain, RV_IRQ_PMU);
+	riscv_pmu_irq_num = !is_thead_c9xx ? RV_IRQ_PMU : THEAD_C9XX_RV_IRQ_PMU;
+	riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
 	if (!riscv_pmu_irq) {
 		pr_err("Failed to map PMU interrupt for node\n");
 		return -ENODEV;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
