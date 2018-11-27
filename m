Return-Path: <SRS0=t+O9=OG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7E0C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:03:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6029020873
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBvcwoc8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="QHNk+ALf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6029020873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PYhBQ3pIZfIEZjmTe2RvXkUsMdbzKu+t9ewfFgxL6c0=; b=QBvcwoc8ajv6RRUtIe5HEJQAGe
	5YqC4QnpKpyKjilgXqMri5bTj4H1sEcRSV8XBWN/+iB4DE75YThodfW0juEBhq1eNvlK4gp4Acq8q
	k40buio8lLVIZA+Bx+PgGSb5zO5AsL3tl4K6BAwBg3HLPPhfdCgRe9Buq6dg2lbQ49tzaDigCC6B9
	9WKsDFwgQJ/PKv3Z1EVwvhi/h629PaaRkQ5DnrE7bmLiccA6mdi3+2/SwCb+15JJioA4jEuUbpWQ1
	SiuUurR5t/GOlUewVKVUOMJxF/ncoeAj02Cc1Kbow9ARpqsYKzV4a95xY/EaTo9dFGSO3LCeaEvlg
	k2+TlIcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRaDc-0005s7-Kf; Tue, 27 Nov 2018 10:03:48 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRaDZ-0005pA-NV
 for linux-riscv@lists.infradead.org; Tue, 27 Nov 2018 10:03:47 +0000
Received: by mail-pl1-x643.google.com with SMTP id k8so4714258pls.11
 for <linux-riscv@lists.infradead.org>; Tue, 27 Nov 2018 02:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wo30fNAFxowk7vavcNnVWNqww0lbMrK1m/X23B6Fp88=;
 b=QHNk+ALfeyKpN0si4Wm3EQ7524fCXsiFXK5gRGka5z33j+ywQqgIJd8B47TJFpvLCe
 Qzwbtt9aLISufOI+EOX/M9lu0JdNAnJW3eKVeOhqxLNzLMGH5ZmOt61GpCWuCbOFw4Tk
 bgMfDUN7WQqFleDORptgr7bb+fubp7PbzVKezJsVXGui34sCAmiKH24Fk1QVyVnyJ1u5
 VM3dy51OiXydhzFxpZ+pXaTFjhdLvUOBS7WlHYMpm621XbhBGSR4frtNR8pjxHUQ/qEr
 jaWK7U5nlMBp/JeRzM105v7yElrzJq8rOUCuP1EJuiKgAXiCEVBpR0ZMpdp9rcq5ytBu
 83/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wo30fNAFxowk7vavcNnVWNqww0lbMrK1m/X23B6Fp88=;
 b=h2KLOtg+Ze70AShixaZKhHxkk0XWlglGilDrIcugI2HAMjSglprD6QQoIuTp+abLsA
 xuhrWFjax4B8Y3b6kCu4udC1IVF7tXyzDYPh3xj32/1rcsSzA0wv6YjLLsVCQvtJ/wgt
 IWKkmp1PTaRzHHkpPbUeZ/gSSI/v6PWbLuxaT8eDBwuV6Vp+GMwwG9fmF3JcZDxCzumO
 pcj7iliZGOAuVdarDyJ2zs5aBV/JgIdwdMLTlz36TXTxOKosdCFONycBngkmaiMl9dkr
 +dkvHz4N4xEBIAkCmPP0RspiCDBA17/Uf1L2+q5/kLerHzqXutBD9J0KjIMxy3AejAUQ
 7RHw==
X-Gm-Message-State: AA+aEWYwxDb34Lc134X8iSC8bv6b4LUxMUS3mGFA4tT2AwaRD4AzfhFB
 O/nOW8evGeL3XnDeDKdxV4USL0v900U=
X-Google-Smtp-Source: AFSGD/UHTcS9Q7p19GViATyS2yk8DI1//va2kHg8uCFpbK5lLICWY8kojgi2XuZ7FrxKJj18mFsW2w==
X-Received: by 2002:a17:902:2ac3:: with SMTP id
 j61mr31644117plb.185.1543313015005; 
 Tue, 27 Nov 2018 02:03:35 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.48.241])
 by smtp.googlemail.com with ESMTPSA id t87sm9519590pfk.122.2018.11.27.02.03.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Nov 2018 02:03:34 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 1/4] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
Date: Tue, 27 Nov 2018 15:33:14 +0530
Message-Id: <20181127100317.12809-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127100317.12809-1-anup@brainfault.org>
References: <20181127100317.12809-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181127_020345_761403_88115B6D 
X-CRM114-Status: GOOD (  14.00  )
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
Message-ID: <20181127100314.Vn8B4zJCMtMOR4o1pL9GYYOq25gUNJ7jP3tD-21itrg@z>

This patch does following optimizations:
1. Pre-compute hart base for each context handler
2. Pre-compute enable base for each context handler
3. Have enable lock for each context handler instead
of global plic_toggle_lock

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 41 +++++++++++++------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 357e9daf94ae..56fce648a901 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -60,36 +60,24 @@ static void __iomem *plic_regs;
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
