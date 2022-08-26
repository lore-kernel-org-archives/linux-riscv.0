Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10042ECAAA6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zPmhZF+EXT546Bt21gu4zoCYfM2hGEx1iw6jDTA4vzM=; b=VubqHuJ5q6Ap9T
	UFHYVsqv+J4cOhyA4rYSIhVn0RukurjFDW1AIpJsy5Fjj4l6Q+mZ9bySYNWpjq2KYLy/Sj+Jct5Ja
	D4fVzQzzxLBadSXiSVd8Bw1dI2EZdzJkPif5DVgwwGRjprchNuQchEnVRBcPHoopLpBjzuDqfvt9E
	ntIpvPEKpGGMrruvdWTJb1yS/JcJQ0cy+kFIyvR3Uwq0ZmkynGaKeiR/Wc/KwWOuR/fjd9C3qrd+V
	3ea7Ux4u13otZVG1II0Ftse0PhQ5lvg4jp0USGJbGiJ27T4tEWvY6rGOcHwEBq9S1t0F6j4zLhhQO
	Iq8jqpMAliNjNAylVK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRcIo-008KXv-OA; Fri, 26 Aug 2022 16:35:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRcIl-008KQf-FO
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 16:35:25 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oRcIf-0001BS-Mg; Fri, 26 Aug 2022 18:35:17 +0200
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
Subject: [PATCH v2] drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Fri, 26 Aug 2022 18:35:00 +0200
Message-Id: <20220826163500.1748653-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_093523_680753_F9D60884 
X-CRM114-Status: GOOD (  28.04  )
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

As the reading of the overflow-csr is in the hot-path during irq handling
use an errata and alternatives to not introduce new conditionals there.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes in v2:
- use alternatives for the CSR access
- make the irq num selection a bit nicer

There is of course a matching opensbi-part whose current implementation can
be found on [0], but as comments show, this needs some more work still.


[0] https://patchwork.ozlabs.org/project/opensbi/cover/20220817112004.745776-1-heiko@sntech.de/

 arch/riscv/Kconfig.erratas           | 14 ++++++++++++
 arch/riscv/errata/thead/errata.c     | 19 +++++++++++++++++
 arch/riscv/include/asm/errata_list.h | 16 +++++++++++++-
 drivers/perf/riscv_pmu_sbi.c         | 32 +++++++++++++++++++---------
 4 files changed, 70 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 6850e9389930..f1eaac4c0073 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -66,4 +66,18 @@ config ERRATA_THEAD_CMO
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_THEAD_PMU
+	bool "Apply T-Head PMU errata"
+	depends on ERRATA_THEAD
+	depends on RISCV_PMU_SBI
+	default y
+	help
+	  The T-Head C9xx cores implement a PMU overflow extension very
+	  similar to the core SSCOFPMF extension.
+
+	  This will apply the overflow errata to handle the non-standard
+	  behaviour via the regular SBI PMU driver and interface.
+
+	  If you don't know what to do here, say "Y".
+
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 202c83f677b2..e6101eab25c8 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -44,6 +44,22 @@ static bool errata_probe_cmo(unsigned int stage,
 #endif
 }
 
+static bool errata_probe_pmu(unsigned int stage,
+			     unsigned long arch_id, unsigned long impid)
+{
+#ifdef CONFIG_ERRATA_THEAD_PMU
+	if (arch_id != 0 || impid != 0)
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	return true;
+#else
+	return false;
+#endif
+}
+
 static u32 thead_errata_probe(unsigned int stage,
 			      unsigned long archid, unsigned long impid)
 {
@@ -55,6 +71,9 @@ static u32 thead_errata_probe(unsigned int stage,
 	if (errata_probe_cmo(stage, archid, impid))
 		cpu_req_errata |= (1U << ERRATA_THEAD_CMO);
 
+	if (errata_probe_pmu(stage, archid, impid))
+		cpu_req_errata |= (1U << ERRATA_THEAD_PMU);
+
 	return cpu_req_errata;
 }
 
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 19a771085781..4180312d2a70 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -6,6 +6,7 @@
 #define ASM_ERRATA_LIST_H
 
 #include <asm/alternative.h>
+#include <asm/csr.h>
 #include <asm/vendorid_list.h>
 
 #ifdef CONFIG_ERRATA_SIFIVE
@@ -17,7 +18,8 @@
 #ifdef CONFIG_ERRATA_THEAD
 #define	ERRATA_THEAD_PBMT 0
 #define	ERRATA_THEAD_CMO 1
-#define	ERRATA_THEAD_NUMBER 2
+#define	ERRATA_THEAD_PMU 2
+#define	ERRATA_THEAD_NUMBER 3
 #endif
 
 #define	CPUFEATURE_SVPBMT 0
@@ -142,6 +144,18 @@ asm volatile(ALTERNATIVE_2(						\
 	    "r"((unsigned long)(_start) + (_size))			\
 	: "a0")
 
+#define THEAD_C9XX_RV_IRQ_PMU			17
+#define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
+
+#define ALT_SBI_PMU_OVERFLOW(__ovl)					\
+asm volatile(ALTERNATIVE(						\
+	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
+	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
+		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
+		CONFIG_ERRATA_THEAD_PMU)				\
+	: "=r" (__ovl) :						\
+	: "memory")
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6f6681bbfd36..f814d3ce5ba2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/cpu_pm.h>
 
+#include <asm/errata_list.h>
 #include <asm/sbi.h>
 #include <asm/hwcap.h>
 
@@ -46,6 +47,8 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
  * per_cpu in case of harts with different pmu counters
  */
 static union sbi_pmu_ctr_info *pmu_ctr_list;
+static bool riscv_pmu_use_irq;
+static unsigned int riscv_pmu_irq_num;
 static unsigned int riscv_pmu_irq;
 
 struct sbi_pmu_event_data {
@@ -575,7 +578,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	event = cpu_hw_evt->events[fidx];
 	if (!event) {
-		csr_clear(CSR_SIP, SIP_LCOFIP);
+		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
 		return IRQ_NONE;
 	}
 
@@ -583,13 +586,13 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	pmu_sbi_stop_hw_ctrs(pmu);
 
 	/* Overflow status register should only be read after counter are stopped */
-	overflow = csr_read(CSR_SSCOUNTOVF);
+	ALT_SBI_PMU_OVERFLOW(overflow);
 
 	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
 	 * all the counters to avoid any race condition.
 	 */
-	csr_clear(CSR_SIP, SIP_LCOFIP);
+	csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
 
 	/* No overflow bit is set */
 	if (!overflow)
@@ -651,10 +654,10 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	/* Stop all the counters so that they can be enabled from perf */
 	pmu_sbi_stop_all(pmu);
 
-	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
+	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
-		csr_clear(CSR_IP, BIT(RV_IRQ_PMU));
-		csr_set(CSR_IE, BIT(RV_IRQ_PMU));
+		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
+		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
 
@@ -663,9 +666,9 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 
 static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
-	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
+	if (riscv_pmu_use_irq) {
 		disable_percpu_irq(riscv_pmu_irq);
-		csr_clear(CSR_IE, BIT(RV_IRQ_PMU));
+		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
 	}
 
 	/* Disable all counters access for user mode now */
@@ -681,7 +684,16 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	struct device_node *cpu, *child;
 	struct irq_domain *domain = NULL;
 
-	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
+	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
+		riscv_pmu_irq_num = RV_IRQ_PMU;
+		riscv_pmu_use_irq = true;
+	} else if (sbi_get_mvendorid() == THEAD_VENDOR_ID &&
+		   sbi_get_marchid() == 0 && sbi_get_mimpid() == 0) {
+		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
+		riscv_pmu_use_irq = true;
+	}
+
+	if (!riscv_pmu_use_irq)
 		return -EOPNOTSUPP;
 
 	for_each_of_cpu_node(cpu) {
@@ -703,7 +715,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		return -ENODEV;
 	}
 
-	riscv_pmu_irq = irq_create_mapping(domain, RV_IRQ_PMU);
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
