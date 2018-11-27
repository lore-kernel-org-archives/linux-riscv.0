Return-Path: <SRS0=t+O9=OG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211B1C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA983208E7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ydsto9Sx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="KCPo0TX6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA983208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XTUGkWaHYddkhAkoFG0GwUjK5KkjTK0J71CZQO8IHZs=; b=Ydsto9SxKaH8JlE5OCI780aNsT
	9o+y+1Lugpk9v4dA2nnZ/iy50BRaa/c/xGnKc16jn5awu9buqWHz2PtIai/sELOSPXoabZSBRFSRp
	4GeC7sZU6Lnr8hCnxmP3Nn76UnwZ0kFM22sn/aen+mO4QrO9x8TEJiLCeXPAioW+I0GBqZW6WnX8b
	6KwE5904MFeoLUJalUX79h1jV5+V1XjSTMTe1/j/ncDzOPdl9tJHm1NJHRc27BEFS0jRS9Y8xBs3r
	RdCssOIJsRnyyQ6RnjP3Nr3p41NcUJd7TY7uRDqAoFtrR+RGt9jaYrS4MJ41ZwvU2jlegJnO2sXhc
	yzdEDvkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRaDr-00060u-FP; Tue, 27 Nov 2018 10:04:03 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRaDj-0005qD-6e
 for linux-riscv@lists.infradead.org; Tue, 27 Nov 2018 10:04:01 +0000
Received: by mail-pf1-x442.google.com with SMTP id g62so8094282pfd.12
 for <linux-riscv@lists.infradead.org>; Tue, 27 Nov 2018 02:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=arjeBMdw9sCQtY7MdQAlVkfUbrvemGUsW01G3n51jWI=;
 b=KCPo0TX60Z45IB5BeS5G7Sm/miAkY91wN3wEOAgkNTzBD4uM3Dz8duXoAi1+x99lzD
 7159m3jNaF6GdMhdwLxYRww9baUAYmMBTLA42HOrmKQP3GAPWk+JH/btZBLEyaam5/z3
 d0wyISCHqiBRgOsdvEiiZO4YQructIsdP8vBOCHAL5YYMz7QAFYGC8w3S1p7EXw+khXF
 x5pDtU6mBmAg6Z7P1ouRX7NWkFeekZQJM4xQFKTyDnMmUuORUjTUiXdhNM8+/xLxggcl
 866cynbFqqvQQxWAwuOkYkay79h1TF8qUtaVU6JYI5niU8+lFfKNUoPFiPnnkw34+6QX
 t6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=arjeBMdw9sCQtY7MdQAlVkfUbrvemGUsW01G3n51jWI=;
 b=YxG+XsfvqlZDP2S9gZ4/VicRshoKUXiURy2H8g47NZqXt2B/3YrrhOfS0n2UoSAdy6
 okTRc3I6FMwwk6UyGlWq44whRdAZQ9Y7STYafVyme2Uh6tAreBxmt6XHJr5Vuchl7GOx
 P8kUmdJ7flUJQzVQmn8rA2zSi6dkU8sna2q9wKQSvi9PelSESH8zgC0WgBYT767GXbAx
 7qQuALCb5Xf1hfRMSbdOv5iYFPx8uwUlRsJ6X1ViQLm/Hrh9oEDg1iLfk35SMOP+D489
 9pXxHf4YzDOsRDgd0ojLf1sXY7dgIl6I0XRA6iwzexuRKQO3oPTLZS+MGIiBSdHHZpLs
 rsLw==
X-Gm-Message-State: AA+aEWYqWkZRnuyRCGh0bm4uC7M2uGIEPTYOgT23/4jVoZHZwRulx54e
 T83cRmKt7b1HvM49t4vKJTRDQA==
X-Google-Smtp-Source: AFSGD/XH92rpV5v0MJGRy132yya5Md/mor/XvAlG2mkFetuFuGQilUnsbhKmcr1D/Hy4lfPm7IQTRQ==
X-Received: by 2002:a63:334a:: with SMTP id z71mr28779865pgz.400.1543313024612; 
 Tue, 27 Nov 2018 02:03:44 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.48.241])
 by smtp.googlemail.com with ESMTPSA id t87sm9519590pfk.122.2018.11.27.02.03.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Nov 2018 02:03:43 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 3/4] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
Date: Tue, 27 Nov 2018 15:33:16 +0530
Message-Id: <20181127100317.12809-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127100317.12809-1-anup@brainfault.org>
References: <20181127100317.12809-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181127_020355_252609_F276FD18 
X-CRM114-Status: GOOD (  13.00  )
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
Message-ID: <20181127100316.rgCYSZdywbLHRTj53yGQvZ3aHD-TQIAHImzE3hkR4jI@z>

We explicitly differentiate between PLIC handler and context because
PLIC context is for given mode of HART whereas PLIC handler is per-CPU
software construct meant for handling interrupts from a particular
PLIC context.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 95b4b92ca9b8..ffd4deaca057 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -66,8 +66,8 @@ static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 struct plic_hw {
 	u32			nr_irqs;
+	u32			nr_contexts;
 	u32			nr_handlers;
-	u32			nr_mapped;
 	void __iomem		*regs;
 	struct irq_domain	*irqdomain;
 };
@@ -191,10 +191,10 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!plic.nr_irqs))
 		goto out_iounmap;
 
-	plic.nr_handlers = of_irq_count(node);
-	if (WARN_ON(!plic.nr_handlers))
+	plic.nr_contexts = of_irq_count(node);
+	if (WARN_ON(!plic.nr_contexts))
 		goto out_iounmap;
-	if (WARN_ON(plic.nr_handlers < num_possible_cpus()))
+	if (WARN_ON(plic.nr_contexts < num_possible_cpus()))
 		goto out_iounmap;
 
 	plic.irqdomain = irq_domain_add_linear(node, plic.nr_irqs + 1,
@@ -202,7 +202,7 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!plic.irqdomain))
 		goto out_iounmap;
 
-	for (i = 0; i < plic.nr_handlers; i++) {
+	for (i = 0; i < plic.nr_contexts; i++) {
 		struct of_phandle_args parent;
 		struct plic_handler *handler;
 		irq_hw_number_t hwirq;
@@ -225,6 +225,11 @@ static int __init plic_init(struct device_node *node,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(&plic_handlers, cpu);
+		if (handler->present) {
+			pr_warn("handler not available for context %d.\n", i);
+			continue;
+		}
+
 		handler->present = true;
 		handler->hart_base =
 			plic.regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
@@ -237,11 +242,11 @@ static int __init plic_init(struct device_node *node,
 		for (hwirq = 1; hwirq <= plic.nr_irqs; hwirq++)
 			plic_toggle(handler, hwirq, 0);
 
-		plic.nr_mapped++;
+		plic.nr_handlers++;
 	}
 
-	pr_info("mapped %d interrupts to %d (out of %d) handlers.\n",
-		plic.nr_irqs, plic.nr_mapped, plic.nr_handlers);
+	pr_info("mapped %d interrupts with %d handlers for %d contexts.\n",
+		plic.nr_irqs, plic.nr_handlers, plic.nr_contexts);
 	set_handle_irq(plic_handle_irq);
 	return 0;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
