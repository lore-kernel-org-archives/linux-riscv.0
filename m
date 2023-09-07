Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1854EE14AA
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 02:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgMYECTmbLsUwVfAdhOaE/1kcDsKJX5Fu6Hoi1r1UGU=; b=JXNdEN6aJjPb7h
	2/lyPC5u9PYYOn4AEGxZQzHNsJgVU1nrAfcmmJSM/m5EUXczftmS6XIuJggKPNXdF08+g9dC4mnCe
	L42VQv/wVMjNB9qlPsPitPXrtpe3w0FSB5F7jDDEm2neJff/X//hJec0SbiaRfxhJjLjcHppboEqF
	TEQqu2E/wg7bxATJKESMVb0I4ERqVEoKV2mbqlHAag0y2d5qsmD4petZB4Sv94EAv24hx8uN0Pcnz
	gCzma7+rfTKG+M2Mro+YnfQq4NFdgwecl8mGBAJhp9uon1TAnGu+zW9KmYX61fSS7MXPqqqmBbQt+
	68BtR0YyQbUekmo/FZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bY-00BBJg-1O;
	Thu, 07 Sep 2023 02:18:48 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bS-00BBH5-2x;
	Thu, 07 Sep 2023 02:18:45 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3872IFlN024125;
	Thu, 7 Sep 2023 10:18:15 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Sep 2023
 10:18:10 +0800
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
Subject: [RFC PATCH 2/4] irqchip/riscv-intc: Support large non-standard hwirq number
Date: Thu, 7 Sep 2023 10:16:33 +0800
Message-ID: <20230907021635.1002738-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907021635.1002738-1-peterlin@andestech.com>
References: <20230907021635.1002738-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3872IFlN024125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_191843_394739_7E52D866 
X-CRM114-Status: GOOD (  11.70  )
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

Currently, the implementation of the RISC-V INTC driver uses the
interrupt cause as hwirq and has a limitation of supporting a
maximum of 64 hwirqs. However, according to the privileged spec,
interrupt cause >= 16 are defined for platform use.

This limitation prevents us from fully utilizing the available
local interrupt sources. Additionally, the hwirqs used on RISC-V
are sparse, with only interrupt numbers 1, 5 and 9 (plus Sscofpmf
or T-Head's PMU irq) being currently used for supervisor mode.

The patch switches to using irq_domain_create_tree() which
creates the radix tree map, allowing us to handle a larger
number of hwirqs.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

---
There are 3 hwirqs of local interrupt source exceed 64 defined in
AX45MP datasheet [1] Table 56: AX45MP-1C scause Value After Trap:
- 256+16 Slave port ECC error interrupt (S-mode)
- 256+17 Bus write transaction error interrupt (S-mode)
- 256+18 Performance monitor overflow interrupt(S-mode)

[1] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
---
 drivers/irqchip/irq-riscv-intc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4adeee1bc391..76e1229c45de 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -24,8 +24,8 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 {
 	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
 
-	if (unlikely(cause >= BITS_PER_LONG))
-		panic("unexpected interrupt cause");
+	if (!irq_find_mapping(intc_domain, cause))
+		panic("unexpected interrupt cause: %ld", cause);
 
 	generic_handle_domain_irq(intc_domain, cause);
 }
@@ -117,8 +117,8 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 {
 	int rc;
 
-	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
-					       &riscv_intc_domain_ops, NULL);
+	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops,
+					     NULL);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
 		return -ENXIO;
@@ -132,8 +132,6 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
-
 	return 0;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
