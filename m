Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3D1EE14A9
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 02:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvNibiHXAztFgTcPpt9+JUgP5N5bldlhGt4vLJBAbCg=; b=ZTnesVyOST6H23
	G4PGtWw3dM1aXLC2TmRG25SIc0XSxm2bsjE7eXBkLHjD4TF2O84QtdavxOKqeLHORCd24fxIJ5bLm
	AXdkyNqO2WDdYsgUxMVlx3JfSRihMLkLp4fz0oBCptVkBFW2eLVrFoOhaR3fJbZPXozwg0rrnnrQr
	/T++iJK7o3SYJHf98HTuwo3AaSaLJ1DDhg9WR4G2aDAcG7rLWpKDKoDPHYHay9Aqj6ZQjX8Iw38t3
	S+9FHKWBy52KOgUpPkhmlPL4cWfFBbULLSU/uRoWLyk1lQJz7FPZqPXV1IUt8HtOIahcVPuyyYKgM
	qOgxAkysN4gmxCi1A13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bc-00BBKy-0s;
	Thu, 07 Sep 2023 02:18:52 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bV-00BBI7-1f;
	Thu, 07 Sep 2023 02:18:47 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3872IKK1024147;
	Thu, 7 Sep 2023 10:18:20 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Sep 2023
 10:18:15 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
        <atishp@atishpatra.org>, <anup@brainfault.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: <ajones@ventanamicro.com>, <heiko@sntech.de>, <samuel@sholland.org>,
        <geert+renesas@glider.be>, <n.shubin@yadro.com>,
        <dminus@andestech.com>, <ycliang@andestech.com>,
        <tim609@andestech.com>, <locus84@andestech.com>, <dylan@andestech.com>,
        Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH 3/4] riscv: errata: Add Andes PMU errata
Date: Thu, 7 Sep 2023 10:16:34 +0800
Message-ID: <20230907021635.1002738-4-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907021635.1002738-1-peterlin@andestech.com>
References: <20230907021635.1002738-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3872IKK1024147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_191845_999610_7FE8636C 
X-CRM114-Status: GOOD (  20.22  )
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

Before the ratification of Sscofpmf, the Andes PMU extension
implements the same mechanism and is compatible with existing
SBI PMU driver of perf to support event sampling and mode
filtering with programmable hardware performance counters.

This patch adds PMU support for Andes 45-series CPUs by
introducing a CPU errata.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Locus Wei-Han Chen <locus84@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 arch/riscv/Kconfig.errata            | 13 ++++++++
 arch/riscv/errata/andes/errata.c     | 45 +++++++++++++++++++++++++++-
 arch/riscv/include/asm/errata_list.h | 43 ++++++++++++++++++++++++--
 drivers/perf/riscv_pmu_sbi.c         | 20 +++++++++----
 4 files changed, 111 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 92c779764b27..a342b209c169 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -21,6 +21,19 @@ config ERRATA_ANDES_CMO
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_ANDES_PMU
+	bool "Apply Andes PMU errata"
+	depends on ERRATA_ANDES && RISCV_PMU_SBI
+	default y
+	help
+	  The Andes 45-series cores implement a PMU overflow extension
+	  very similar to the core SSCOFPMF extension.
+
+	  This will apply the overflow errata to handle the non-standard
+	  behaviour via the regular SBI PMU driver and interface.
+
+	  If you don't know what to do here, say "Y".
+
 config ERRATA_SIFIVE
 	bool "SiFive errata"
 	depends on RISCV_ALTERNATIVE
diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index d2e1abcac967..19256691f1ba 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -56,11 +56,54 @@ static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
 	return true;
 }
 
+static bool errata_probe_pmu(unsigned int stage,
+			     unsigned long arch_id, unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_ANDES_PMU))
+		return false;
+
+	if ((arch_id & 0xff) != 0x45)
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	return true;
+}
+
+static u32 andes_errata_probe(unsigned int stage,
+			      unsigned long archid, unsigned long impid)
+{
+	u32 cpu_req_errata = 0;
+
+	if (errata_probe_pmu(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_ANDES_PMU);
+
+	return cpu_req_errata;
+}
+
 void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 					      unsigned long archid, unsigned long impid,
 					      unsigned int stage)
 {
+	struct alt_entry *alt;
+	u32 cpu_req_errata = andes_errata_probe(stage, archid, impid);
+	u32 tmp;
+
 	errata_probe_iocp(stage, archid, impid);
 
-	/* we have nothing to patch here ATM so just return back */
+	for (alt = begin; alt < end; alt++) {
+		if (alt->vendor_id != ANDES_VENDOR_ID)
+			continue;
+		if (alt->patch_id >= ERRATA_ANDES_NUMBER)
+			continue;
+
+		tmp = (1U << alt->patch_id);
+		if (cpu_req_errata & tmp) {
+			mutex_lock(&text_mutex);
+			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
+					  alt->alt_len);
+			mutex_unlock(&text_mutex);
+		}
+	}
 }
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 56ab40e64092..bb4c276e2c7f 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -13,7 +13,8 @@
 
 #ifdef CONFIG_ERRATA_ANDES
 #define ERRATA_ANDES_NO_IOCP 0
-#define ERRATA_ANDES_NUMBER 1
+#define ERRATA_ANDES_PMU 1
+#define ERRATA_ANDES_NUMBER 2
 #endif
 
 #ifdef CONFIG_ERRATA_SIFIVE
@@ -150,15 +151,51 @@ asm volatile(ALTERNATIVE_2(						\
 #define THEAD_C9XX_RV_IRQ_PMU			17
 #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
 
+#define ANDES_RV_IRQ_PMU			18
+#define ANDES_SLI_CAUSE_BASE			256
+#define ANDES_CSR_SCOUNTEROF			0x9d4
+#define ANDES_CSR_SLIE				0x9c4
+#define ANDES_CSR_SLIP				0x9c5
+
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
-asm volatile(ALTERNATIVE(						\
+asm volatile(ALTERNATIVE_2(						\
 	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
 	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
-		CONFIG_ERRATA_THEAD_PMU)				\
+		CONFIG_ERRATA_THEAD_PMU,				\
+	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
+		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
+		CONFIG_ERRATA_ANDES_PMU)				\
 	: "=r" (__ovl) :						\
 	: "memory")
 
+#define ALT_SBI_PMU_OVF_CLEAR_PENDING(__irq_num)			\
+asm volatile(ALTERNATIVE(						\
+	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
+	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
+		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
+		CONFIG_ERRATA_ANDES_PMU)				\
+	: : "r"(BIT(__irq_num))						\
+	: "memory")
+
+#define ALT_SBI_PMU_OVF_DISABLE(__irq_num)				\
+asm volatile(ALTERNATIVE(						\
+	"csrc " __stringify(CSR_IE) ", %0\n\t",				\
+	"csrc " __stringify(ANDES_CSR_SLIE) ", %0\n\t",			\
+		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
+		CONFIG_ERRATA_ANDES_PMU)				\
+	: : "r"(BIT(__irq_num))						\
+	: "memory")
+
+#define ALT_SBI_PMU_OVF_ENABLE(__irq_num)				\
+asm volatile(ALTERNATIVE(						\
+	"csrs " __stringify(CSR_IE) ", %0\n\t",				\
+	"csrs " __stringify(ANDES_CSR_SLIE) ", %0\n\t",			\
+		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
+		CONFIG_ERRATA_ANDES_PMU)				\
+	: : "r"(BIT(__irq_num))						\
+	: "memory")
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 9a51053b1f99..8b67f202d2ae 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -687,7 +687,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	event = cpu_hw_evt->events[fidx];
 	if (!event) {
-		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
+		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_num);
 		return IRQ_NONE;
 	}
 
@@ -701,7 +701,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	 * Overflow interrupt pending bit should only be cleared after stopping
 	 * all the counters to avoid any race condition.
 	 */
-	csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
+	ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_num);
 
 	/* No overflow bit is set */
 	if (!overflow)
@@ -773,8 +773,8 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 
 	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
-		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
-		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
+		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_num);
+		ALT_SBI_PMU_OVF_ENABLE(riscv_pmu_irq_num);
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
 
@@ -785,7 +785,7 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	if (riscv_pmu_use_irq) {
 		disable_percpu_irq(riscv_pmu_irq);
-		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
+		ALT_SBI_PMU_OVF_DISABLE(riscv_pmu_irq_num);
 	}
 
 	/* Disable all counters access for user mode now */
@@ -809,6 +809,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		   riscv_cached_mimpid(0) == 0) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
+	} else if (IS_ENABLED(CONFIG_ERRATA_ANDES_PMU) &&
+		   riscv_cached_mvendorid(0) == ANDES_VENDOR_ID) {
+		riscv_pmu_irq_num = ANDES_RV_IRQ_PMU;
+		riscv_pmu_use_irq = true;
 	}
 
 	if (!riscv_pmu_use_irq)
@@ -821,7 +825,11 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		return -ENODEV;
 	}
 
-	riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
+	if (IS_ENABLED(CONFIG_ERRATA_ANDES_PMU))
+		riscv_pmu_irq = irq_create_mapping(
+			domain, ANDES_SLI_CAUSE_BASE + riscv_pmu_irq_num);
+	else
+		riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
 	if (!riscv_pmu_irq) {
 		pr_err("Failed to map PMU interrupt for node\n");
 		return -ENODEV;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
