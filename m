Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAD2C55179
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8A3F24631
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nt9n7q1z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXVNjYYN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8A3F24631
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KJrc09DfUrMklVU9zuNVYpnH5me6/LVyAdaNecmTEqY=; b=nt9n7q1zpMuP0hb+QpinQx95OB
	/mRQh8aW/xhtTh5XyzJy1ujLSiQbGuZq9Gu1UFSDMT4XgdAdMqJ5zJE4ReRSlRBtLnfsT65yGhM+d
	+VuQPMOJcmdwp1WSz9/ZQJIajkZ2bwnnRB9WdGlM/YlK9x3+w81pqWOQcGlCrOS7GN9v8v03RWMrz
	e3keWwJgcSrq0+I+cZNmlyN98yhqU1r7b5hYg6xIVIgTPw3RtUBPscfkUVYQ11CozjU0pd2BwkD3v
	53ONJ6GCBGVUTddEHrxSTTqQmFWJnMYclR0kBNnScWuBJL7/glmdOVLP1V7DsyK/FHfCS7RS236pA
	RLa7vTxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVu9N-0002YY-EF; Fri, 23 Oct 2020 10:18:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVu9K-0002XU-R9
 for linux-riscv@lists.infradead.org; Fri, 23 Oct 2020 10:18:19 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 708DE20936;
 Fri, 23 Oct 2020 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603448297;
 bh=BV1tH2U1Lsosw+Ugkhs7glTIjtqVDoAJop9TuiKHT44=;
 h=From:To:Cc:Subject:Date:From;
 b=FXVNjYYNeEGZSvIhl4SuHitDKUsn6hlGW8Wg42BMzw7N0bBGFCQQcXhfA83VUXfh9
 PWbmy5NXe2PNDWiHSzBy2/Ktf60A1UV7UDxoKHO6LjuY2r1O41pscRE2LB20gp4Wkb
 MSAAeYE9mUg2sG/WR0ot+g2CIOxzKRiblzgHdqDM=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, atish.patra@wdc.com,
 tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
 wesley@sifive.com, yash.shah@sifive.com, hch@lst.de
Subject: [PATCH 1/3] irqchip/irq-sifive-plic: Fixup wrong size of xxx_PER_HART
 and reg base
Date: Fri, 23 Oct 2020 10:17:23 +0000
Message-Id: <1603448245-79429-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_061819_022959_1302A770 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 guoren@kernel.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

ENABLE and CONTEXT registers contain M & S status for per-hart, so
ref to the specification the correct definition is double to the
current value.

The value of hart_base and enable_base should be calculated by real
physical hartid not software id. Sometimes the CPU node's <reg>
from dts is not equal to the sequence index.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 drivers/irqchip/irq-sifive-plic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index eaa3e9f..2e56576 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -44,16 +44,16 @@
  * Each hart context has a vector of interrupt enable bits associated with it.
  * There's one bit for each interrupt source.
  */
-#define ENABLE_BASE			0x2000
-#define     ENABLE_PER_HART		0x80
+#define ENABLE_BASE			0x2080
+#define     ENABLE_PER_HART		0x100
 
 /*
  * Each hart context has a set of control registers associated with it.  Right
  * now there's only two: a source priority threshold over which the hart will
  * take an interrupt, and a register to claim interrupts.
  */
-#define CONTEXT_BASE			0x200000
-#define     CONTEXT_PER_HART		0x1000
+#define CONTEXT_BASE			0x201000
+#define     CONTEXT_PER_HART		0x2000
 #define     CONTEXT_THRESHOLD		0x00
 #define     CONTEXT_CLAIM		0x04
 
@@ -358,10 +358,10 @@ static int __init plic_init(struct device_node *node,
 		cpumask_set_cpu(cpu, &priv->lmask);
 		handler->present = true;
 		handler->hart_base =
-			priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
+			priv->regs + CONTEXT_BASE + hartid * CONTEXT_PER_HART;
 		raw_spin_lock_init(&handler->enable_lock);
 		handler->enable_base =
-			priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
+			priv->regs + ENABLE_BASE + hartid * ENABLE_PER_HART;
 		handler->priv = priv;
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
