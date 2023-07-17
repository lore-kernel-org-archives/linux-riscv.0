Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA27C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kyP/rCvHQLgEZkiU22xdObEVVKjnc/f9A13tXDZDBH0=; b=mLiteX9eMWIHmS
	BqzfAt1tfk7fqfJJunSF+iIiVSv7yrEcn/WuDfnMm5Xe0uTeIP6j/Qu+M/Po3nkCZ02EQ+L3vPQ57
	WzaMKKsEqFWe9oTAVCV+66YkVEouznlik4hwrbKepbqmaOa1jBTQcnjgkvIh83b0TqTiQvdSmHmss
	8aLghglrfO+5XxPrURXckxKVKkFi9blVmZig9ke7egqkCRc2+W0NeTET0OlYK0+hAHhRrEHl5g2Hv
	aDRrHa+Xi9WDlVTsf+6k3r9KTh+d6kHCeW/7obfL65OqVPxJQRKu/s31ys0/74w6tbGpDaBghVXQa
	dicmYRPjYo3MAq5lGQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzgT-005Hjd-06;
	Wed, 19 Jul 2023 05:25:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzgJ-005HbT-0N
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EfmtkIn1nFJzPpqeHKOOLhwST2S07YVZFJfXxqbhgY0=; b=rWJyV2r9kZw3HuScDBYgZOVMzN
	jOHUFIwTf+Im147ZOkEm3IE7/NgYfpuDM5pxfoa9wwK4B+sxwEWwE3O3B6yvAAosH3EsEldbukUI0
	uR7/pzXlJh0VRAUVpPBB3EmpDphLJLn22VR6lP/j12lsEAyLohQiS0QxAvq5yQM8RHgyJGFVhsDgC
	8NjUP7i7/EyV0H/6vYNFgaEOu2DuWXnvYPQwuopri2iLeAoWX2XMJKZE+C447DYGoZ2bZxzARt+0f
	x5jCzz8A7DEzW6FwWWTrxvau8if1oeGRiTsmHfS6Y4yKythLD3dWa++QbEqXJdEYmgBY4ozZfJOgd
	+/M5139w==;
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTSk-009E10-0s
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 19:00:52 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-34611de0ee4so20559265ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689620328; x=1692212328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EfmtkIn1nFJzPpqeHKOOLhwST2S07YVZFJfXxqbhgY0=;
        b=D1yapx1Lv8/tzSF+WaDvCUTSWpi2YKsZqA+ywGtnpKvr5SOUGaZ5uWH6be6fTKEA5N
         59CAL1PghSameGhFxIucjgZD0b7W0esrr6OondMCbrZ2yRxtKO8Z/LL+PT5JYix3MSHd
         0zK6oIDMt/ABuWqp5gGvd/l83JmN2bEvKmaFh40ySnav/l85EVh1NWitSqR2U2Szv3aR
         c01Sw6C/vzqlFwW844z5riQVSU9YzOo2Q7g18/hHgNcz42S/UIDp/oM8Uz5162pGGvWD
         Rpb3+atspnSsayHiLs/EC35T/6pBmQTW2anFooHq9Sq650HNpky3RyPY5MTAqsaTuFdG
         JQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689620328; x=1692212328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfmtkIn1nFJzPpqeHKOOLhwST2S07YVZFJfXxqbhgY0=;
        b=bFp6epMnnZKJ0rMEdRzPagu5osXdqtd4V/RDSYxqs8KuVd6ymuAnTEn71Ml5noPciI
         66yvxgEJy7uPl/HYAeJZxIh9rHo5+H5jXkY9fmioqD/oP4a/5dg1j9Ph1XJx1Jpd3Z7v
         pvq3OY2EG2ZsXtWe6IhkCL4euAWqb8MFSsm88pjm5X1ZKHyIQtvNn7exyX2b15Nugoch
         DIPSE2fwJnd73ix5Vl9Cj8CdoXzdSHh8BUP1YJBUiPfsv7u6Iz/wF4JtCA2CpEO+qkxz
         6OgGCvjRuaaiQqKs75sv4kUjkNGAwmLh5AK6gX35ZNAOr/rBm9cBx4LhYKxY0Svz97BN
         004A==
X-Gm-Message-State: ABy/qLa3eolpvvh+rOkICN2oIqQlYMyY3jJAkHImxAq/C28DiBU6m4BS
	PbezMlt5mSzGouIhmpGqp3zPyA==
X-Google-Smtp-Source: APBJJlEhvu3bQym103eRoa3eTOAVL431uI1Zb2PLz4J74XzAwMvTWQ5uufumJffdGeald1ECQG94LA==
X-Received: by 2002:a05:6e02:154b:b0:345:66f5:3404 with SMTP id j11-20020a056e02154b00b0034566f53404mr689436ilu.0.1689620328043;
        Mon, 17 Jul 2023 11:58:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id r17-20020a63a011000000b0051b8172fa68sm152882pge.38.2023.07.17.11.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 11:58:47 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] irqchip/sifive-plic: Avoid clearing the per-hart enable bits
Date: Mon, 17 Jul 2023 11:58:40 -0700
Message-Id: <20230717185841.1294425-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_200050_527155_30BAFFA9 
X-CRM114-Status: GOOD (  18.31  )
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

Writes to the PLIC completion register are ignored if the enable bit for
that (interrupt, hart) combination is cleared. This leaves the interrupt
in a claimed state, preventing it from being triggered again.

Originally, the enable bit was cleared in the .irq_mask operation, and
commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
added a workaround for this issue. Later, commit a1706a1c5062
("irqchip/sifive-plic: Separate the enable and mask operations") moved
toggling the enable bit to the .irq_enable/.irq_disable operations and
removed the workaround.

However, there are still places where .irq_disable can be called from
inside the hard IRQ handler, for example in irq_pm_check_wakeup(). As a
result, this issue causes an interrupt to get stuck in a claimed state
after being used to wake the system from s2idle.

There is no real benefit to implementing the .irq_enable/.irq_disable
operations using the enable bits. In fact, the existing mask/unmask
implementation using the threshold register is already more efficient,
as it requires no read/modify/write cycles. So let's leave the enable
bits set for the lifetime of the IRQ, using them only to control its
affinity.

Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-sifive-plic.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index e1484905b7bd..c2673fdad8e5 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -120,12 +120,14 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 	}
 }
 
-static void plic_irq_enable(struct irq_data *d)
+static unsigned int plic_irq_startup(struct irq_data *d)
 {
 	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
+
+	return 0;
 }
 
-static void plic_irq_disable(struct irq_data *d)
+static void plic_irq_shutdown(struct irq_data *d)
 {
 	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
 }
@@ -169,12 +171,12 @@ static int plic_set_affinity(struct irq_data *d,
 	if (cpu >= nr_cpu_ids)
 		return -EINVAL;
 
-	plic_irq_disable(d);
+	plic_irq_shutdown(d);
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
 
-	if (!irqd_irq_disabled(d))
-		plic_irq_enable(d);
+	if (irqd_is_started(d))
+		plic_irq_startup(d);
 
 	return IRQ_SET_MASK_OK_DONE;
 }
@@ -182,8 +184,8 @@ static int plic_set_affinity(struct irq_data *d,
 
 static struct irq_chip plic_edge_chip = {
 	.name		= "SiFive PLIC",
-	.irq_enable	= plic_irq_enable,
-	.irq_disable	= plic_irq_disable,
+	.irq_startup	= plic_irq_startup,
+	.irq_shutdown	= plic_irq_shutdown,
 	.irq_ack	= plic_irq_eoi,
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
@@ -197,8 +199,8 @@ static struct irq_chip plic_edge_chip = {
 
 static struct irq_chip plic_chip = {
 	.name		= "SiFive PLIC",
-	.irq_enable	= plic_irq_enable,
-	.irq_disable	= plic_irq_disable,
+	.irq_startup	= plic_irq_startup,
+	.irq_shutdown	= plic_irq_shutdown,
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
 	.irq_eoi	= plic_irq_eoi,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
