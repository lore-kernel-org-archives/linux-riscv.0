Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE8AC61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA40C2086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pahpbTBN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="f/6EgnVa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA40C2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bNjnoKQr0Trgn8oabkrUsFCnbim60tnBPtd0ucE0LKo=; b=pahpbTBNIaJaQMFDYaxvQ5NNNA
	U1MBktBaJt6HWhdZxjSG8/XYMOGjrLvtoRM0fI1i9l4F7GHDoPXrmJor6lkVFl2eD2RhKkO6KcCHT
	RJ1H3kdIqQHuvVk4/HVLnPPDfwb2QKX2OldMb+fx13stje74DhXZgmYaDf47SKbYvAsBHyr2A/yHz
	LnNd4e4PNozk0cLqZhfVljjBXt32G46GBZ06hO7xyW79qNqe8GjSOaX/73cGaMWk5PDuS9JYGLLsN
	dSQ2HKHddo27VfJlMRDv4xOHWQ7azbrEmm68iry9OVqb9JCEB/l0J7w+evFOEbWbY4Ijy99UCpWaT
	AxiqwELA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkjdA-0003WA-R4; Sat, 19 Jan 2019 05:57:20 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkjd8-0003UX-8N
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:57:19 +0000
Received: by mail-pg1-x543.google.com with SMTP id j10so7070466pga.1
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zz52nPvPtFJqyPj2XZVPMynhhMIZtDAuu6S8fhVpQdc=;
 b=f/6EgnVaPcImxeZ24fW1x3B5RgtHb20eZMqTQ96nYxSVMUllIaqDMVJprUUnRUxpsn
 mKCOlaefUjQF3kfbvkVxg28riYDbStDjlKgTaSm3dQD6JQpCiQKEwsv8OUl8dgawEYPo
 ic5/xhdDU1M0ZhHGZDicrWjpwYif6fPWPpwaDJbC1zxvXFziFUbVGlFi+7lbKOZjMHiE
 RydhpZA+l2O8O9BVWgo5WzkOL83oNG5WbLSb7Nc9J7/W8LDtSANpWGPGD8G5NfkIMgpm
 jpE1L/Hbq8tEco++PE4lo3gXhBwS/RjUyhOp6mhQdRdhG3tDcLesyYVvPTCWNPDMXRRu
 kRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zz52nPvPtFJqyPj2XZVPMynhhMIZtDAuu6S8fhVpQdc=;
 b=UH7U10vqXJ3KI+dfDyPFZgxAvBp0Up8xLZ9LWzH5rZZh+q2lxqgeodvCtZdTAv+MTE
 qpbDk+waVNKKti7ElFajKD2OgNtvMI2dmYgEhPEODoL05m/cj1M4sITAWvGwX+Mff0zP
 yp+PLwGeeVArxYQMQ+1soSbOXWTxvnpfHUl9zfRQYX00203h0CPeRpLxpNXBvo5lsowL
 FkOQuvRy1MvM5iEjU8Qv9EDa6Zvpng6t6EZKeu9swifFDbglrtmBfvCCUfZ3OwyC3DI8
 g/KFYj8/ojVhABcDJkl5Au5D4eCbVIcURHqTVBK/Dp9iOV+PmgFCkPokzVx0ugqZooAC
 ZwIQ==
X-Gm-Message-State: AJcUukc3jWsQmq94Hrg0FDsHfkCPYRuaEO2t4odCkHa5BR7WaJx2mZEB
 pPwIMPYFC/zPpX/wzZY33BPohA==
X-Google-Smtp-Source: ALg8bN5yaqJwyxbRwG4IIcWKUrLsn+0tH7+5XWFIVPrlf3zW4l96BtUsxikPVWNhTZZqfJ6OEB+Eiw==
X-Received: by 2002:a63:4e15:: with SMTP id c21mr20644687pgb.50.1547877437499; 
 Fri, 18 Jan 2019 21:57:17 -0800 (PST)
Received: from localhost.localdomain ([49.207.51.221])
 by smtp.gmail.com with ESMTPSA id c7sm9295535pfh.18.2019.01.18.21.57.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 21:57:16 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v5 4/5] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
Date: Sat, 19 Jan 2019 11:26:24 +0530
Message-Id: <20190119055625.100054-5-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190119055625.100054-1-anup@brainfault.org>
References: <20190119055625.100054-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_215718_293710_8682E6EB 
X-CRM114-Status: GOOD (  12.79  )
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
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index b9a0bcefe426..24c906f4be93 100644
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
