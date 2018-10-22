Return-Path: <SRS0=qhrg=NC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B115C004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B2620652
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAda0q6u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rTyT29de"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B2620652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f7KL/srYVPQzHPd3JKsj38ppJUrjvsvH7ZfNESI6j4k=; b=uAda0q6uMmBjzjrJrmo5zgEWyb
	eep3KyvBB2qZs8RjkwmUY1bmVDAWXh13eEYlIwmv1Yf71K7FGtQ4vLH3jVfTY6RXFIoo9Vb6EQhDj
	n1brMJjsCH/cyNxfVtFIRI9G3sZrl8AfpaNq/avKOf7qjJWE/dyjn/Z5ZrcXgaBjvngEKi8QsLEH0
	F4emf3mKzzVhOlKCswF+vgp2jiWAqplT5Bpdl6dbfakbOc2yZoqRLuf+KHqlO6VuvG0P2tPDiUTOx
	ehF4vD6E5bOssOf+rn5WKQaATwCwr448bU1IhAN2sgo7kNQQniA1mPQzZ0G/I3S+8tgC4j8iLt/qt
	4KSwqPrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gEYwH-0007Wz-IX; Mon, 22 Oct 2018 12:04:05 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEYw8-0007UM-HB
 for linux-riscv@lists.infradead.org; Mon, 22 Oct 2018 12:04:01 +0000
Received: by mail-pl1-x644.google.com with SMTP id f10-v6so1192272plr.1
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TUe06IOQ52AzaiUZGqr/tV47sWpx1zaKoYXhtVZ9bkQ=;
 b=rTyT29de1bAw5zVn7PpcTaPZNMJiu+AuufRkdusojhJLqtsmR+Hg+6oJdw52BNHU/g
 /rlQQN09Rky0/o1GiaLde6EWFNXv6cJcMqN/HkdVhCNqD/qutw3kKgLeDNw2U7KubLcP
 AdBSKlq/n3tM+5uNiyp+hfdfBkAjwyXMleGvwiczLoP9OHwzeE5JtdwAiNCNgUG8KKFf
 DMiw7WXgW3DJyWU8lpgZFB9DYW0vz+22auPN4lRzESsrnoWnE3BxujMK4UG5SVpbbgGI
 H+eTQUsw337lanK5kr5Ar+NQKYRWK7JKuxrMfBtCftbY2Z0kIzCIKqVP/8pBJ4ksJGWY
 Pufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TUe06IOQ52AzaiUZGqr/tV47sWpx1zaKoYXhtVZ9bkQ=;
 b=hKuRhDCM0gdAwVbCr/XNS8hbdw3lPk4xjdhKahc7KzXfEvfsPttFdEZTtS1mT2brLZ
 3Px7g2NszF9Nnki39SPTmjZswxQhNgzMTYV6xC9Zn/UIZZ+kxFIPyY+Kvgegj0OurFMQ
 EHhKx/GN+BGu4YyXbZ+BwLWEMbn+8EME3jMb0o6AIXt03//ysR4K2glh6ttWcYRvXNsp
 vcZ6T1aeK2085BQjJ3m4+kmEf9WnZp+nW7ODryBpLV9zG+xs+GFoKQ5FpIyCJ7Py3sWl
 7yN0LFinRRWRaHFcEsuojKo6BwKe2iAuhbwY/xrgzKlCe15BxoUQj2z1u+K+Yhos7VZ4
 v0KA==
X-Gm-Message-State: ABuFfojoYw7s9aGDn2qD5EA+AWXeX+Ese7MOe4ubAxtNyGgwgcOGjv2r
 WnVt+8M84dhZxVUlTyUgHbYROA==
X-Google-Smtp-Source: ACcGV602RD/0tC4EG1YO6gYLiNlB/sAxTWlLfdtPfMmlkFCs6gZhS1ahD0BsfzIbRVLxma+6wcWTJw==
X-Received: by 2002:a17:902:bc44:: with SMTP id
 t4-v6mr13502218plz.300.1540209825763; 
 Mon, 22 Oct 2018 05:03:45 -0700 (PDT)
Received: from anup-ubuntu64.dlink.router ([106.51.30.16])
 by smtp.googlemail.com with ESMTPSA id
 n79-v6sm55443405pfk.19.2018.10.22.05.03.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Oct 2018 05:03:44 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 1/4] irqchip: sifive-plic: Pre-compute context hart base and
 enable base
Date: Mon, 22 Oct 2018 17:15:14 +0530
Message-Id: <20181022114517.22748-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181022114517.22748-1-anup@brainfault.org>
References: <20181022114517.22748-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_050356_623649_0A8DCC5C 
X-CRM114-Status: GOOD (  15.20  )
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
Message-ID: <20181022114514.JDuS-QYDxPpaaRlsRW-_A5_LwYfU1SkKSnTmN9yhMIg@z>

This patch does following optimizations:
1. Pre-compute hart base for each context handler
2. Pre-compute enable base for each context handler
3. Have enable lock for each context handler instead
of global plic_toggle_lock

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 51 +++++++++++++------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 357e9daf94ae..f93ec83eaff4 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -36,14 +36,14 @@
  * We always hardwire it to one in Linux.
  */
 #define PRIORITY_BASE			0
-#define     PRIORITY_PER_ID		4
+#define PRIORITY_PER_ID			4
 
 /*
  * Each hart context has a vector of interrupt enable bits associated with it.
  * There's one bit for each interrupt source.
  */
 #define ENABLE_BASE			0x2000
-#define     ENABLE_PER_HART		0x80
+#define ENABLE_PER_HART			0x80
 
 /*
  * Each hart context has a set of control registers associated with it.  Right
@@ -51,45 +51,33 @@
  * take an interrupt, and a register to claim interrupts.
  */
 #define CONTEXT_BASE			0x200000
-#define     CONTEXT_PER_HART		0x1000
-#define     CONTEXT_THRESHOLD		0x00
-#define     CONTEXT_CLAIM		0x04
+#define CONTEXT_PER_HART		0x1000
+#define CONTEXT_THRESHOLD		0x00
+#define CONTEXT_CLAIM			0x04
 
 static void __iomem *plic_regs;
 
 struct plic_handler {
 	bool			present;
 	int			ctxid;
+	void __iomem		*hart_base;
+	raw_spinlock_t		enable_lock;
+	void __iomem		*enable_base;
 };
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
-static inline void __iomem *plic_hart_offset(int ctxid)
+static inline void plic_toggle(struct plic_handler *handler,
+				int hwirq, int enable)
 {
-	return plic_regs + CONTEXT_BASE + ctxid * CONTEXT_PER_HART;
-}
-
-static inline u32 __iomem *plic_enable_base(int ctxid)
-{
-	return plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART;
-}
-
-/*
- * Protect mask operations on the registers given that we can't assume that
- * atomic memory operations work on them.
- */
-static DEFINE_RAW_SPINLOCK(plic_toggle_lock);
-
-static inline void plic_toggle(int ctxid, int hwirq, int enable)
-{
-	u32 __iomem *reg = plic_enable_base(ctxid) + (hwirq / 32);
+	u32 __iomem *reg = handler->enable_base + (hwirq / 32);
 	u32 hwirq_mask = 1 << (hwirq % 32);
 
-	raw_spin_lock(&plic_toggle_lock);
+	raw_spin_lock(&handler->enable_lock);
 	if (enable)
 		writel(readl(reg) | hwirq_mask, reg);
 	else
 		writel(readl(reg) & ~hwirq_mask, reg);
-	raw_spin_unlock(&plic_toggle_lock);
+	raw_spin_unlock(&handler->enable_lock);
 }
 
 static inline void plic_irq_toggle(struct irq_data *d, int enable)
@@ -101,7 +89,7 @@ static inline void plic_irq_toggle(struct irq_data *d, int enable)
 		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
 
 		if (handler->present)
-			plic_toggle(handler->ctxid, d->hwirq, enable);
+			plic_toggle(handler, d->hwirq, enable);
 	}
 }
 
@@ -150,7 +138,7 @@ static struct irq_domain *plic_irqdomain;
 static void plic_handle_irq(struct pt_regs *regs)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
-	void __iomem *claim = plic_hart_offset(handler->ctxid) + CONTEXT_CLAIM;
+	void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
 	irq_hw_number_t hwirq;
 
 	WARN_ON_ONCE(!handler->present);
@@ -240,11 +228,16 @@ static int __init plic_init(struct device_node *node,
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
 		handler->ctxid = i;
+		handler->hart_base =
+			plic_regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
+		raw_spin_lock_init(&handler->enable_lock);
+		handler->enable_base =
+			plic_regs + ENABLE_BASE + i * ENABLE_PER_HART;
 
 		/* priority must be > threshold to trigger an interrupt */
-		writel(0, plic_hart_offset(i) + CONTEXT_THRESHOLD);
+		writel(0, handler->hart_base + CONTEXT_THRESHOLD);
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
-			plic_toggle(i, hwirq, 0);
+			plic_toggle(handler, hwirq, 0);
 		nr_mapped++;
 	}
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
