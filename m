Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DBBCDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rb+Ugygp+E3Hl5cKUOBeKpd5uNly6IeCU40uLn5B8co=; b=j4E3zql4GFVU1J
	nMXOHhOZWUHrYzUkJw57TwpilqEKOWIia5llCdCurFTIFG2peiuazI/Ya4Yf8r2b/PZ8PvyiUmRrv
	Yusa6xNUYN9WA19nhSREC6hkTUpDsnXUVEWgUkWnjsTX74BHdeuOCaC6g6sP9u7GT9uiGeqULCLFF
	ed9MATXyw+cIXsymZMHnpxyojdfv7V/xiOsgriY7mRA60cXJweWHmsuxRSmZcykwx4nOXp39jr83Y
	lsvLlEoP0U0xTA8Qsk7zTp+m0R2ZV2zyjebN6mf06jTBUCCeeGmXJKgW7h7JiU2Qn3tREtFvj6Vzl
	t1dPgEBqB5BxOFxBnriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTcT-0000M8-1q;
	Thu, 19 Oct 2023 14:03:25 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTcG-0000F8-10;
	Thu, 19 Oct 2023 14:03:14 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39JE2iEt029473;
	Thu, 19 Oct 2023 22:02:44 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 19 Oct 2023
 22:02:41 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <atishp@atishpatra.org>, <anup@brainfault.org>, <will@kernel.org>,
        <mark.rutland@arm.com>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <linux-riscv@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>,
        "Yu
 Chien Peter Lin" <peterlin@andestech.com>
Subject: [PATCH v2 06/10] perf: RISC-V: Eliminate redundant IRQ enable/disable operations
Date: Thu, 19 Oct 2023 21:59:40 +0800
Message-ID: <20231019135940.3658613-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39JE2iEt029473
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070312_791836_CE71300B 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

The IRQ enable/disable operations are already performed by the
IRQ chip functions riscv_intc_irq_unmask()/riscv_intc_irq_mask()
during enable_percpu_irq()/disable_percpu_irq(). We can just do
it once.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
This patch allows us to drop unnecessary ALT_SBI_PMU_OVF_{DISABLE,ENABLE}
in the last PATCH3 [1].

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20230907021635.1002738-4-peterlin@andestech.com/

Changes v1 -> v2:
  - New patch
---
 drivers/perf/riscv_pmu_sbi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 96c7f670c8f0..f340db9ce1e2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -778,7 +778,6 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
 		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
-		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
 
@@ -789,7 +788,6 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	if (riscv_pmu_use_irq) {
 		disable_percpu_irq(riscv_pmu_irq);
-		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
 	}
 
 	/* Disable all counters access for user mode now */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
