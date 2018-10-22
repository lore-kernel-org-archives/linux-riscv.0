Return-Path: <SRS0=qhrg=NC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB58BC67863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3F020652
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ci3N6AcQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="vI4mEup0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3F020652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6TsW8v/a52YwZ88Tx5nd7gSmv/Gh6ab1pDNHk+RYzWk=; b=ci3N6AcQ4gtDcGMLYhp9zM5Og8
	YVV87eSpT77dQYmAZj0LFpYB/hNlTRlNkUtWgUJzehHG0x7p0abe85ea9jXyVBq8foW6parFuHgKj
	yb7mUNDkEtADJU+CV36lH8aj7lSxv+zvsmvmrgniiomsON0epmobpmYv/OFCA/w87b77QrHkxazJo
	dgggXZke39b6Q3RTsHyuihRwGxwNFthMMXlXC7fChhiLNY6Tw8oAeh0wCewUyIw0ZPhZv4pMuQQUk
	E+z9AZeWCxRtnKAC6nm5nUcLT9EXjMd5bk6OQqU6E0U8nECZTLY+6gesOcfzilX1cmkz1CxnVjcyQ
	B+G3pgHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gEYwQ-0007ae-BJ; Mon, 22 Oct 2018 12:04:14 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEYwI-0007Us-GF
 for linux-riscv@lists.infradead.org; Mon, 22 Oct 2018 12:04:10 +0000
Received: by mail-pl1-x643.google.com with SMTP id 1-v6so18980282plv.7
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cklJIrGQO1v9yxxg7e/arLZA2lgKk/qgd+gAAteDwCs=;
 b=vI4mEup0AVsDH6t/6VpaZsZkVp3Zpv+LSIZivK2GEYN+mtCIkCqQfuwu+T907pT47N
 ljN3gvAy+6AnuofKquMjUdfW0+Y0pcTwVP54u/tWZhcw6QZBY9f3VMWbMH7mev3zXUxy
 mD3Y99mFaDIsuvducq9Wpawlz8RG94GMLQKNHxMO1UK/qUumNQOG1rx/F+Sn6RlIE0g/
 Abq5MfCN4P56oWTEd8ZOLLSAJAbeU+76CHQrY2WRb2ImvK24eI5kUV+THd1be3DrnqaN
 iUKFkp6nqv0lVzN3QjOpAzTelPJJGGkMOSl4/PICEm7ZoPWfFzl6aAmJZbzWfBHzMIOi
 y0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cklJIrGQO1v9yxxg7e/arLZA2lgKk/qgd+gAAteDwCs=;
 b=f8SE/TNSC5P+ynnRCiqfd31cp6ZPiQTp2Zf/4hOEm5t4zHTEe6ZSmDt+eq3Ssr5sxk
 8P/TVcLQ+caYy6tHl7RRHI1IuBn2z/yfaRqv1IVaizpqrv+lyjsi01lbs7iG6PAge5OR
 3t/OBBsnYab2hWQbE3WiDt7+SDJP6veqXmbG+LGCQYBVTBvf6oHGtq/P8e8Ty6dfy6d7
 6nGOImZsJXLSD7B/q88VOBTmAq92quuYe55Oj9LoVX6fXr3OwaHpTyo+JrrbxK1qe81W
 /vCfy4Gqtbk9jbzjw+kdGxCCvbRthlvvtja4mkDSOSf9ScE2JvAMza6354ehPi8LR8rV
 Hh/w==
X-Gm-Message-State: AGRZ1gJHStTdwPgNn+RfWclEdXyv+jen9fg4F7Zt1PqysJeUPBdgUrrj
 2uN1xXdgrXsOgPLc6XX0IBqhCg==
X-Google-Smtp-Source: AJdET5dIe4lwYNujouwXUxRcKh4fPvcM0GAbqkPaHYm/SxWJMAwmJ7cXUCjxKoKD5NctXJRZIh8mTw==
X-Received: by 2002:a17:902:748a:: with SMTP id
 h10-v6mr6869891pll.187.1540209835477; 
 Mon, 22 Oct 2018 05:03:55 -0700 (PDT)
Received: from anup-ubuntu64.dlink.router ([106.51.30.16])
 by smtp.googlemail.com with ESMTPSA id
 n79-v6sm55443405pfk.19.2018.10.22.05.03.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Oct 2018 05:03:54 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 3/4] irqchip: sifive-plic: Differentiate between PLIC handler
 and context
Date: Mon, 22 Oct 2018 17:15:16 +0530
Message-Id: <20181022114517.22748-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181022114517.22748-1-anup@brainfault.org>
References: <20181022114517.22748-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_050406_561202_9045BD3D 
X-CRM114-Status: GOOD (  13.84  )
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
Message-ID: <20181022114516.6Ra6YHvTXoPgXEoSHpgV4fufZOSS_WLDvd2dgVhndoA@z>

We explicitly differentiate between PLIC handler and context because
PLIC context is for given mode of HART whereas PLIC handler is per-CPU
software construct meant to handling interrupts from a particular
PLIC context.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 869355d2a713..eb9e8aee1a1a 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -64,8 +64,8 @@ struct plic_handler {
 
 struct plic_hw {
 	u32			nr_irqs;
+	u32			nr_contexts;
 	u32			nr_handlers;
-	u32			nr_mapped;
 	void __iomem		*regs;
 	struct plic_handler	*handlers;
 	struct irq_domain	*irqdomain;
@@ -190,10 +190,10 @@ static int __init plic_init(struct device_node *node,
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
 
 	error = -ENOMEM;
@@ -206,7 +206,7 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!plic.irqdomain))
 		goto out_free_handlers;
 
-	for (i = 0; i < plic.nr_handlers; i++) {
+	for (i = 0; i < plic.nr_contexts; i++) {
 		struct of_phandle_args parent;
 		struct plic_handler *handler;
 		irq_hw_number_t hwirq;
@@ -229,6 +229,11 @@ static int __init plic_init(struct device_node *node,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(plic.handlers, cpu);
+		if (handler->present) {
+			pr_warn("handler not available for context %d.\n", i);
+			continue;
+		}
+
 		handler->present = true;
 		handler->hart_base =
 			plic.regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
@@ -241,11 +246,11 @@ static int __init plic_init(struct device_node *node,
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
