Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0001DC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C291A214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d9AFhtgS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="eGeQXCrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C291A214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SxlTxSyCfCjQDckrc5psabEizFh+6OOayvxqlAO7XLk=; b=d9AFhtgSUPefpbOMYHbaZcKRyd
	rWqj63HA/Sc0JtyMzLb+1mg7WhHRJu8eECaEIMqygaJXHs1W6e1/bEJv6q99FFSu6pgGI1i/f0A+F
	Etctq1j+RlT6yLi2WEUUZiHhfuHHuH2/odGVeHqNn6vDyLf1KHFF7aNt7SZjXUYNQBMD63CnkjOUp
	WD/BWy0gMjW4GE/N0NsAx1P+9jG5qIYaH5kaGDBleHuUgA8LqREQoR1z8eTBvAdWjWYv/Wvv8g9I4
	2Y/MmhTaWE3G+YPyLACpbaXKxnH9M2kp/79pTrJHDSo1rdRMJ9UUE0a3vuW9OTemOpYucvqk3t67o
	c119Cmyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtXYs-0007bF-W7; Tue, 12 Feb 2019 12:53:18 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtXYp-0007ZF-VL
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 12:53:17 +0000
Received: by mail-pf1-x444.google.com with SMTP id n74so1249240pfi.9
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 04:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gsJS4yIBKT28AV4SM0RQ9vanzyz+KIa+304VYw5cpNg=;
 b=eGeQXCrAfG8ecew51ixd+Ac7u9cHblpOfC3x2VIestEm3l6OJrv91fKp/chn7pHbmw
 qTGPdy7Sm2e8YJLLunTQ32oxestJRfmAdc18+vosvs0/GFLPp4q2Z8ch1aCN3r2mxUlD
 pLpVdysDGowHQ6fU2NRlixxGsEJfsQs80CW/IDLZIlLpN2g/ZxUMMdBPB5vi8APmxOF1
 6MEW5kEnp/Vr8eTsv0FbKDaz/pUhjqs7NpfxolIO7fPBrZFgtIZgpTIF+YMC2BAPZmDM
 9SfpgtsbdoOwxcKkvfSUIAgBi6e3WO7KpRog68VmEtymfcTNaf9D92zAG657pA+dxdVf
 4zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gsJS4yIBKT28AV4SM0RQ9vanzyz+KIa+304VYw5cpNg=;
 b=pewvAvJm/CzS1lIUdh5Q1scQcZG8rp9Ia7qr9uWMmARVZVAqxyrgAFTT6d3oaajlHf
 85oLoi2BvlDLrs1TflbQnqYWVOeA8L3bZCr9eesgnxuN9yQME/5xqMKef4FavpNNI4NP
 uap6mb2nRiJ4oS8ZyqdWvO0pnsBJ+1l6qw47DXE5FdiLsWEgeZ42Z0g1Tp/JybPgpx9F
 BSfzfjgUd3AUico7cwoQd7W2ncqDxKG4cZn/NZ/K/wUjYuRPA1xZrljnJxqok6VGRX/k
 CWnEkCdoC1OJ/bfwLwu//FdCcZTHzvkJ0eYTYwpFDjKyuQlJOtfGNfm9AQX423bjQLqU
 b6Tg==
X-Gm-Message-State: AHQUAuav+uyYt0AOuwM4AwZdy83LzsFUZ1ATAy0OPNc5zpGrNKy5aaCu
 aT/52EyyM4OaMkdKSpzKsXsIgA==
X-Google-Smtp-Source: AHgI3IbZlbgAG111vB2Qds3H2DoDuEUXcMbwnPw8/9IQsf02qUY+paif0M6Mj0tE45zdvj+zjrz03g==
X-Received: by 2002:a63:1544:: with SMTP id 4mr3590228pgv.290.1549975994963;
 Tue, 12 Feb 2019 04:53:14 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.205])
 by smtp.gmail.com with ESMTPSA id z67sm27894828pfd.188.2019.02.12.04.53.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 04:53:14 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v6 3/4] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
Date: Tue, 12 Feb 2019 18:22:45 +0530
Message-Id: <20190212125246.69239-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190212125246.69239-1-anup@brainfault.org>
References: <20190212125246.69239-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_045316_018027_99819EE9 
X-CRM114-Status: GOOD (  12.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We explicitly differentiate between PLIC handler and context because
PLIC context is for given mode of HART whereas PLIC handler is per-CPU
software construct meant for handling interrupts from a particular
PLIC context.

To achieve this differentiation, we rename "nr_handlers" to "nr_contexts"
and "nr_mapped" to "nr_handlers" in plic_init().

Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index da09f46fad64..542a9e4c47fc 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -177,7 +177,7 @@ static int plic_find_hart_id(struct device_node *node)
 static int __init plic_init(struct device_node *node,
 		struct device_node *parent)
 {
-	int error = 0, nr_handlers, nr_mapped = 0, i;
+	int error = 0, nr_contexts, nr_handlers = 0, i;
 	u32 nr_irqs;
 
 	if (plic_regs) {
@@ -194,10 +194,10 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!nr_irqs))
 		goto out_iounmap;
 
-	nr_handlers = of_irq_count(node);
-	if (WARN_ON(!nr_handlers))
+	nr_contexts = of_irq_count(node);
+	if (WARN_ON(!nr_contexts))
 		goto out_iounmap;
-	if (WARN_ON(nr_handlers < num_possible_cpus()))
+	if (WARN_ON(nr_contexts < num_possible_cpus()))
 		goto out_iounmap;
 
 	error = -ENOMEM;
@@ -206,7 +206,7 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!plic_irqdomain))
 		goto out_iounmap;
 
-	for (i = 0; i < nr_handlers; i++) {
+	for (i = 0; i < nr_contexts; i++) {
 		struct of_phandle_args parent;
 		struct plic_handler *handler;
 		irq_hw_number_t hwirq;
@@ -245,11 +245,11 @@ static int __init plic_init(struct device_node *node,
 		writel(0, handler->hart_base + CONTEXT_THRESHOLD);
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
 			plic_toggle(handler, hwirq, 0);
-		nr_mapped++;
+		nr_handlers++;
 	}
 
-	pr_info("mapped %d interrupts to %d (out of %d) handlers.\n",
-		nr_irqs, nr_mapped, nr_handlers);
+	pr_info("mapped %d interrupts with %d handlers for %d contexts.\n",
+		nr_irqs, nr_handlers, nr_contexts);
 	set_handle_irq(plic_handle_irq);
 	return 0;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
