Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4096BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C36E214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7O2nOMg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="WAe7HAbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C36E214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bNjnoKQr0Trgn8oabkrUsFCnbim60tnBPtd0ucE0LKo=; b=N7O2nOMgzohQ763mc4ZfqceWxF
	2YXhFjzShOqMJBaajWawHvuJWN3CpQRYev74efnY/vJ2nvgVG0srhm/EOokk5T0e7NEbF1ae7D9Wo
	1Af+O90N5XlumRX/IpvMH+P03zz3VC//a65Jz1pbsG1yyxHUpeJpMrxHGZ7Z68UciwIW+qpKvayZV
	os9bIFbdzXfMMrhrexhsqockhvP/IfSnlpdylWUqjvZ3N8m7kabV9S+kYpC6tbUFCtKRaKDM4qlmA
	dre5SmZZs70hSx4v8HImWBl7vDKcZPFlK56SLpoLy/E8WiwM94grrrw+QoKRK7uwJy05xOY8RoC3q
	AhXnqwyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcTh1-0001yb-1p; Thu, 27 Dec 2018 11:19:11 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcTgx-0001r8-TQ
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 11:19:09 +0000
Received: by mail-pg1-x543.google.com with SMTP id w7so8677382pgp.13
 for <linux-riscv@lists.infradead.org>; Thu, 27 Dec 2018 03:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zz52nPvPtFJqyPj2XZVPMynhhMIZtDAuu6S8fhVpQdc=;
 b=WAe7HAbnm+qv9cToQwe0w2BpEYSadHAV9NFIvbw2zg8l4wmOPVaprWswj9twekOMhq
 rYIQVAe4LelBXZ5O2RNolRB8KvZX3BLohqDYj2UfQPTjLuDST7tmQTAide8wpveB0izD
 SWCZ9ew+Y7dkuDeb/WlHVcq8KJ5Xbby4pHCoulMohyW13G83jCDC7bUfqk+X3cr20Qed
 0AMvDdm+wr99n1LEJaPzUVvcBK26yT7M4GLh0+Pe+DUEE589WVqpS9akf1+TLINjPWgo
 0yPINXpFjw7Rzg1V7vk0PXgZRVDaMElD8E0fX8HUN4PkJv54E353XIiodNrK/NUQ1kBI
 N0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zz52nPvPtFJqyPj2XZVPMynhhMIZtDAuu6S8fhVpQdc=;
 b=jtnVPsNbJDMXl/CHuOFStLRy+a6Ky1uxgBm7SzjzCwm04vPtLwfSoOBjLlhnWLu29n
 WgNVIl6L3exyMx+Z4ss7b5WQ8lQRQmYL9pVhnZYRii9ibTUPQyaup2jObUDOQENBfa9I
 pSHmu/lZZH2344Rqf8MXd/fxzUOfc90g49zLuzHUmGersS/hW9TiMhWE4S4o40VxPsCB
 nJqa9k9r1/uIi64ny4PSK3YazYc9XjhPgqUrlg5ZHiCJqycGmDtTF+KZY5vWDLD/i88x
 vUEu+7ehlabSCF9MelEPlTQMREDkG2qX6MAYFSwf0UlO95VaelxaUbwJlk6Y8xQJlQl4
 +BnA==
X-Gm-Message-State: AJcUukdsllrTCtaeFLfqXQcb+a3IsxlKmV5VZDyEHp9DOoe2Q+S1MuAB
 AAu5CtnGJn660as1LGfkEUg4hw==
X-Google-Smtp-Source: AFSGD/X+LOHWk4aZSzbivi7mbj6HaStEZBpd4C2Oz2kwlxEufHrcAyEZmTI6ihSrnR2GfGep4DVgig==
X-Received: by 2002:a62:f247:: with SMTP id y7mr23817585pfl.25.1545909536994; 
 Thu, 27 Dec 2018 03:18:56 -0800 (PST)
Received: from localhost.localdomain ([106.51.18.57])
 by smtp.gmail.com with ESMTPSA id u137sm66830105pfc.140.2018.12.27.03.18.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Dec 2018 03:18:56 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v4 4/5] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
Date: Thu, 27 Dec 2018 16:48:20 +0530
Message-Id: <20181227111821.80908-5-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181227111821.80908-1-anup@brainfault.org>
References: <20181227111821.80908-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181227_031907_949518_DF28602E 
X-CRM114-Status: GOOD (  12.89  )
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
