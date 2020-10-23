Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AE9C55178
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C71E20936
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8jMKkz8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="o32LBurp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C71E20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6r94yj2VnAUwvtmekIBuJOUpEKs188RLpZzOGjmSnI=; b=P8jMKkz8EOpNSlGophgNbLaiut
	jjPGe5s3HO2t/OSoiIuEGUVpNdHMGe7xAVwjeea6166DdA6rS3RNI5Xg38mfcxiIhHsqWpw6j3zJc
	ldBnqODUo9ZzMcBC1c0D5SOspBGnvKJZc/psHxbKpYT6lrlQtqcHrdsQYfH83bYNyPm6oL21shdTT
	HUh2X6zCIuk5rfvgp1rXlcufxt91tfhD2LDl/AjA/0gtJaVSOb00YNJz3Yi3dFHiS7l2OEaz8dc+u
	kAACiX6LNljJhkXf0Hk6SQFh3LWRJHnnh4aDwSPqDXaZrrfMNSl/zaMSWxJl32q/GHsx+p8bmn+YC
	EHbnmHmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVu9W-0002bR-66; Fri, 23 Oct 2020 10:18:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVu9U-0002ah-Rw
 for linux-riscv@lists.infradead.org; Fri, 23 Oct 2020 10:18:29 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5255E20936;
 Fri, 23 Oct 2020 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603448308;
 bh=Q2r2MpV4mhDq9ZPXIsBSWpTyiKSzFfZDPrP/d+7Waxw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o32LBurpluUVsOnJUTvVZM9MNs2/Yn9MJ9dd9LoErCOY4LYhqGMrav90SdRA1ftoo
 3hvBWuzZ7SC0FiGceMW1gP/J/A6nPIV9ajR5ywAJf/rS/VH+j/caR0kVJ4M2lEBW3g
 ocpv9JC6gAt7ChMeauwUpsf81qXeKTp53BrBYpOw=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, atish.patra@wdc.com,
 tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
 wesley@sifive.com, yash.shah@sifive.com, hch@lst.de
Subject: [PATCH 2/3] irqchip/irq-sifive-plic: Fixup couldn't broadcast to
 multi CPUs
Date: Fri, 23 Oct 2020 10:17:24 +0000
Message-Id: <1603448245-79429-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603448245-79429-1-git-send-email-guoren@kernel.org>
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_061829_021637_5195CE58 
X-CRM114-Status: GOOD (  11.53  )
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

If "echo 3 > /proc/irq/1/smp_affinity", we want irq 1 could be
broadcast to CPU0 & CPU1 and one of them would pick up the irq
handler.

But current implementation couldn't let multi CPUs process the
same IRQ concurrent.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 drivers/irqchip/irq-sifive-plic.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 2e56576..0003322 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -114,15 +114,12 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 static void plic_irq_unmask(struct irq_data *d)
 {
 	struct cpumask amask;
-	unsigned int cpu;
 	struct plic_priv *priv = irq_get_chip_data(d->irq);
 
 	cpumask_and(&amask, &priv->lmask, cpu_online_mask);
-	cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
-					   &amask);
-	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
-		return;
-	plic_irq_toggle(cpumask_of(cpu), d, 1);
+	cpumask_and(&amask, &amask, irq_data_get_affinity_mask(d));
+
+	plic_irq_toggle(&amask, d, 1);
 }
 
 static void plic_irq_mask(struct irq_data *d)
@@ -136,24 +133,16 @@ static void plic_irq_mask(struct irq_data *d)
 static int plic_set_affinity(struct irq_data *d,
 			     const struct cpumask *mask_val, bool force)
 {
-	unsigned int cpu;
 	struct cpumask amask;
 	struct plic_priv *priv = irq_get_chip_data(d->irq);
 
 	cpumask_and(&amask, &priv->lmask, mask_val);
+	cpumask_and(&amask, &amask, cpu_online_mask);
 
-	if (force)
-		cpu = cpumask_first(&amask);
-	else
-		cpu = cpumask_any_and(&amask, cpu_online_mask);
-
-	if (cpu >= nr_cpu_ids)
-		return -EINVAL;
+	irq_data_update_effective_affinity(d, &amask);
 
 	plic_irq_toggle(&priv->lmask, d, 0);
-	plic_irq_toggle(cpumask_of(cpu), d, 1);
-
-	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+	plic_irq_toggle(&amask, d, 1);
 
 	return IRQ_SET_MASK_OK_DONE;
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
