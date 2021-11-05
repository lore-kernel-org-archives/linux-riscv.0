Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D74C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 09:48:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4C261212
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 09:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B4C261212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wtZsASSR0o0aP3p/MmPVlFwnYqzB1BcBXn/cFG1m4aY=; b=0d3X67dBnaVdiK
	QKMEWh1EB3iZzjXMJnFFMKPO4EpyyNZN37mJ9ENPoSoPVbIqwgQdPno+HOHpn1hgzx8QCg1dpbAGW
	M9h9JWOfQVcGZCdTFKubG2O4WZXcRpaN9x7+nN2mqoQ6ToPdOExSHcMZciOKhEHoIcC0STi2835AG
	iKm5g7XRLfsu2UfHp3GaFVbkIKN4P8ytY2tIOihGAOInpKnVrAf3ATjDS4N0GY9VNkmjorCXcxHFt
	PAp9XoDAzFAuUC071vin0irqlH1fXLtUeonRB0GrHwl3prhhQl6T203HSS3cJPpXltd70VoPDunRX
	xt4itySGca0oW85XgPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mivpR-00B0da-Ul; Fri, 05 Nov 2021 09:48:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mivpP-00B0cu-9O
 for linux-riscv@lists.infradead.org; Fri, 05 Nov 2021 09:48:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E7FA61053;
 Fri,  5 Nov 2021 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636105686;
 bh=JOH80MQM+ARdKAOqfocajIJekKiO0ckjPSkcV5eTJ6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=bRUUYc42UheVd+lqBiGwbxGbznCjzRk26KuZ5te7exx7ygeJ5/15bNZQboLZItdnz
 1pgj3VWS3Osq/SEVVfsEDRrB1MZLSHBpgS0DCcbwe15wFXK5u9bKKu1UT3TttfCX/d
 AHZzMOjA4A8h2SOCXKI3CZNsPBJjW9zIH0GGCBGqVLdPXffkv96KigvFiMTlDoRZLK
 IUviqWEUOeA6jXVMsmUWupwIGpvavc3vIUdwIIca8xBcFLNh+XHsVpa60uz37zvy0C
 azLx7qZLBPNnOi2exrFihtm9p3Fa47clMfh07H/ZihSFo+D69ghw8NshSKX7ACLV+S
 9xW0ysPLIdFjg==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, stable@vger.kernel.org
Subject: [PATCH V7] irqchip/sifive-plic: Fixup EOI failed when masked
Date: Fri,  5 Nov 2021 17:47:48 +0800
Message-Id: <20211105094748.3894453-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_024807_399208_318DD6C6 
X-CRM114-Status: GOOD (  15.83  )
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

Fixes: bb0fed1c60cc ("irqchip/sifive-plic: Switch to fasteoi flow")
Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
Tested-by: Nikita Shubin <nikita.shubin@maquefel.me>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: stable@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: incent Pelletier <plr.vincent@gmail.com>

---

Changes since V7:
 - Add Fixes tag
 - Add Tested-by
 - Add Cc stable

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
