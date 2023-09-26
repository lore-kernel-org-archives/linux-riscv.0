Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA2E7D277
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=92B2yF1pfkan97h1tTmGU1Bsd+O8XyEP+RhCvqLjvaA=; b=S3/cKrqVYHJJZb
	KrFNqEOGVuIeJ5e0XcmVDgGVOVhkEGPyBAYYOn2EVgsTqmfTKDfCZhJ78WZCelQ1VuZ7ufj67JKy2
	ykdz/FQzXxzlCcco9p4/KTc5aqcRIdeiKlg1ukGxmWB9p8Q30CbT7lE+BPQY7rFuTFUkKCuBIs52q
	MBtvI0HZS7IALry4d9rTbmazDs7+4WaYSSQ1pHF9/kN/USIR+ArxFu0+PSASwBvsaNmO2q/0VLk6H
	h1G2qTjTTHbPM29jdGAwCMlyAcYwC9WFHKomCENFIYzOkiI56sqAzGtHwWpsC0ZGuZyd1EclwaAyh
	GBbUmUeGlWV764XwSmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5JJ-00G3AP-23;
	Tue, 26 Sep 2023 10:28:57 +0000
Received: from mail.tecon.ru ([82.112.190.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5JF-00G39s-1I
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 10:28:55 +0000
From: Dmitry Dunaev <dunaev@tecon.ru>
To: 
CC: <dunaich@mail.ru>, Dmitry Dunaev <dunaev@tecon.ru>, Thomas Gleixner
	<tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH] irqchip/riscv-intc: Mark INTC nodes for secondary CPUs as initialized.
Date: Tue, 26 Sep 2023 13:28:01 +0300
Message-ID: <20230926102801.1591126-1-dunaev@tecon.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_032853_606173_7C81C414 
X-CRM114-Status: GOOD (  10.63  )
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

The current Linux driver irq-riscv-intc initialize IRQ domain only once,
when init function called on primary hart. In other cases no IRQ domain is
created and no operation on interrupt-controller node is performed.
This is cause of that no common Linux driver can use per-cpu interrupts
mapped to several CPUs because fwnode of secondary cores INTC is not
marked as initialized. This device is always will be marked as deferred.
For example the system with devicetree

    cpu0: cpu@0 {
        cpu0_intc: interrupt-controller {
            interrupt-controller;
            compatible = riscv,cpu-intc;
        };
    };

    cpu1: cpu@1 {
        cpu1_intc: interrupt-controller {
            interrupt-controller;
            compatible = riscv,cpu-intc;
        };
    };

    buserr {
        compatible = riscv,buserr;
        interrupts-extended = <&cpu0_intc 16 &cpu1_intc 16>;
    };

will always report 'buserr' node as deferred without calling any
bus probe function.

This patch will mark all secondary nodes passed to irq-riscv-intc
driver init function as initialized to be able to act as correct
IRQ phandle node.

Signed-off-by: Dmitry Dunaev <dunaev@tecon.ru>
---
 drivers/irqchip/irq-riscv-intc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4adeee1bc391..c01a4e8d4983 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -155,8 +155,10 @@ static int __init riscv_intc_init(struct device_node *node,
 	 * for each INTC DT node. We only need to do INTC initialization
 	 * for the INTC DT node belonging to boot CPU (or boot HART).
 	 */
-	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
+	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id()) {
+		fwnode_dev_initialized(of_node_to_fwnode(node), true);
 		return 0;
+	}
 
 	return riscv_intc_init_common(of_node_to_fwnode(node));
 }
@@ -179,8 +181,10 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 	 * for each INTC. We only do INTC initialization
 	 * for the INTC belonging to the boot CPU (or boot HART).
 	 */
-	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
+	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id()) {
+		fwnode_dev_initialized(of_node_to_fwnode(node), true);
 		return 0;
+	}
 
 	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
 	if (!fn) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
