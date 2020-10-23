Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CDDC388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B85224182
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evEbe/E5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtVp2hNn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B85224182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coUaVEUzwR9PzzYwJMOXycfvQKE7EaxC8G0/9n1+CjA=; b=evEbe/E532UkRntlBhPy/lslVM
	36Y57zey4MXJfPoEos28btDPwAc9nRCl6cw2LbQkLqUXWCjjjn9hKrV+QguR7SXKmuyWakhGGeLGZ
	Vq8Q7/+QQV3X214ssr9riWizC1QL6GHqymfdqtZlkfZ+i9hgcsAaaHojBMPUD0IMxwfNz8ZKbbBpj
	/xI9HlhLIR9mfVxyuXS9YSdHx+/bsWPuboi7aPPk/G6UM+vbqVW9KWYtpffmGr62Dq33W0k77Dp4t
	USglQrAmisNF8IMpM1Q5HGjQzD5EGtZrJKAtPTUWNI2hU93m2DI4+uLl4pVjs6H+nOJeQzp7Srz4O
	+tZB1vGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVu9e-0002di-0g; Fri, 23 Oct 2020 10:18:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVu9b-0002d4-H5
 for linux-riscv@lists.infradead.org; Fri, 23 Oct 2020 10:18:36 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E0C824182;
 Fri, 23 Oct 2020 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603448314;
 bh=VQkOQqXVAMZZl0wG36+SPXHmfOpuP3DhOAi57iQd4xo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZtVp2hNnwKo2BHrStyM/agggm9GlwzSD0M0qp+eKjILGY/n6PR4CNYDEygQ2rcHL+
 CtTu9EEFV7ziMODxvLTFw/3dG0Fs2WI3lHtpm8pc5OKbhvbdOLtzHgZSdEo27ovDBO
 tW/E3nHFIJGYlEwYcrVXK1B1FXD8e8HSv6pr/iRY=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, atish.patra@wdc.com,
 tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
 wesley@sifive.com, yash.shah@sifive.com, hch@lst.de
Subject: [PATCH 3/3] irqchip/irq-sifive-plic: Fixup set_affinity enable irq
 unexpected
Date: Fri, 23 Oct 2020 10:17:25 +0000
Message-Id: <1603448245-79429-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603448245-79429-1-git-send-email-guoren@kernel.org>
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_061835_748377_1CF8E3FB 
X-CRM114-Status: GOOD (  15.64  )
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

For PLIC, we only have enable registers to control per hart's irq
affinity and irq_set_affinity would call plic_irq_toggle to enable
the IRQ's routing. So we can't enable irq in irq_domain_map before
request_irq, it'll let uninitialized devices' irq exception.

The solution is to check the irq has been enabled, just like what
irq-gic-v3 has done in gic_set_affinity.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 drivers/irqchip/irq-sifive-plic.c | 45 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 0003322..1a63859 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -130,6 +130,36 @@ static void plic_irq_mask(struct irq_data *d)
 }
 
 #ifdef CONFIG_SMP
+static inline bool plic_toggle_is_enabled(struct plic_handler *handler,
+						int hwirq)
+{
+	u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
+	u32 hwirq_mask = 1 << (hwirq % 32);
+
+	if (readl(reg) & hwirq_mask)
+		return true;
+	else
+		return false;
+}
+
+static inline bool plic_irq_is_enabled(const struct cpumask *mask,
+				   struct irq_data *d)
+{
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
+
+		if (!handler->present)
+			continue;
+
+		if (plic_toggle_is_enabled(handler, d->hwirq))
+			return true;
+	}
+
+	return false;
+}
+
 static int plic_set_affinity(struct irq_data *d,
 			     const struct cpumask *mask_val, bool force)
 {
@@ -141,8 +171,10 @@ static int plic_set_affinity(struct irq_data *d,
 
 	irq_data_update_effective_affinity(d, &amask);
 
-	plic_irq_toggle(&priv->lmask, d, 0);
-	plic_irq_toggle(&amask, d, 1);
+	if (plic_irq_is_enabled(&priv->lmask, d)) {
+		plic_irq_toggle(&priv->lmask, d, 0);
+		plic_irq_toggle(&amask, d, 1);
+	}
 
 	return IRQ_SET_MASK_OK_DONE;
 }
@@ -168,12 +200,19 @@ static struct irq_chip plic_chip = {
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
+	unsigned int cpu;
 	struct plic_priv *priv = d->host_data;
 
 	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
 			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
-	irq_set_affinity(irq, &priv->lmask);
+
+	cpu = cpumask_any_and(&priv->lmask, cpu_online_mask);
+	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+		return -EINVAL;
+
+	irq_set_affinity(irq, cpumask_of(cpu));
+
 	return 0;
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
