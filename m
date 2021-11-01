Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD333C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 13:18:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A8AB60EE9
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 13:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A8AB60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XW35pw2/mDdJA0CAb8mbhn6SElt95tD2vUWFxOyQthM=; b=hK5rrwFURNeGg1
	CtriHt9m2V73ET8dxtC+INFA6CwqRWYTtzJl12WQ+bDOf2u3LsJnzpjJmSsVZWD0MuWGZqdolZspZ
	cIeL3osp/hL20kg8Uqmlzj+oW2ATPOcH4SdEnbO7+SBUn5Fq+ZM0E4OdOHVfjPm1YcgN8L+z6weBD
	kkknfKGc/gzgzCezWja0WV2lozV6UADXNiYlH2OFBThmkOUX8xfNn5uU5p1biMe95kscThSB8EGF1
	FRTIpiPoA6uTwquizojtvw8b3t+GwtXh4UNJ1oM8XFFMRTQjmKFFJuzRmQzEXIw+IYNEOHotSTJ6G
	HlAj+azFqDHAiCQoFYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhXCI-00GSMb-4x; Mon, 01 Nov 2021 13:17:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhXCF-00GSMG-Ug
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 13:17:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0E3D60EE9;
 Mon,  1 Nov 2021 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635772675;
 bh=FhR1P06NTpzsKAAOjSZbOsnmE+WyM4ZC/stVrFCPX60=;
 h=From:To:Cc:Subject:Date:From;
 b=gcBoHXYmqHxUY3X6NU88XUt7i9BTTwDjL5thZ6UB/ZcYsiyZSOV8+ZfJcZZxE9HfA
 /wRJ2y9uuX35TuEdD7D8K8OlU5/yM0DgVb/ZdMWQAvphuspls2flJ4qSLmPniOcY30
 6L81jgTIewje4qiYp2o5DuMxs+lV9ZIRKsIblYbRhtNqgzHiF/MhT+2TC7JBgsfF2v
 bV6Lv3vBSPGcEgbVrcbhMLKW18jc5u8Hm1RlZWTVwDlSW4N+A3fZUyCEnSB3IDav3S
 /HKCKuxTb5yo6m6dTsJOk+rwafELwA2OVHt6hHHVOKugqdtqaX8NH7MPYyz3gtRfKM
 5pdTi6QAdVVlg==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Subject: [PATCH V6] irqchip/sifive-plic: Fixup EOI failed when masked
Date: Mon,  1 Nov 2021 21:17:36 +0800
Message-Id: <20211101131736.3800114-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_061756_110799_3EBF05C3 
X-CRM114-Status: GOOD (  15.67  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
only the first interrupt could be handled, and continue irq is blocked by
hw. Because the riscv plic couldn't complete masked irq source which has
been disabled in enable register. The bug was firstly reported in [1].

Here is the description of Interrupt Completion in PLIC spec [2]:

The PLIC signals it has completed executing an interrupt handler by
writing the interrupt ID it received from the claim to the claim/complete
register. The PLIC does not check whether the completion ID is the same
as the last claim ID for that target. If the completion ID does not match
an interrupt source that is currently enabled for the target, the
                         ^^ ^^^^^^^^^ ^^^^^^^
completion is silently ignored.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
[2] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc

Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: incent Pelletier <plr.vincent@gmail.com>

---

Changes since V6:
 - Propagate to plic_irq_eoi for all riscv,plic by Nikita Shubin
 - Remove thead related codes

Changes since V5:
 - Move back to mask/unmask
 - Fixup the problem in eoi callback
 - Remove allwinner,sun20i-d1 IRQCHIP_DECLARE
 - Rewrite comment log

Changes since V4:
 - Update comment by Anup

Changes since V3:
 - Rename "c9xx" to "c900"
 - Add sifive_plic_chip and thead_plic_chip for difference

Changes since V2:
 - Add a separate compatible string "thead,c9xx-plic"
 - set irq_mask/unmask of "plic_chip" to NULL and point
   irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
 - Add a detailed comment block in plic_init() about the
   differences in Claim/Completion process of RISC-V PLIC and C9xx
   PLIC.
---
 drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cf74cfa82045..259065d271ef 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -163,7 +163,13 @@ static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
 
-	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+	if (irqd_irq_masked(d)) {
+		plic_irq_unmask(d);
+		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+		plic_irq_mask(d);
+	} else {
+		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+	}
 }
 
 static struct irq_chip plic_chip = {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
