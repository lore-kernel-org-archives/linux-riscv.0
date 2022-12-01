Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F8C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuXLuzRnikghdYN1YVyyoUbtOHoN9exzz9YrlCXzOic=; b=n/pS4WliTXQ9LX
	D+jr2A84xG91aRLmRBu9ObE6YfFViof+De/5pE+pit1lmkfM8sejJkrlO56JrwLd1cXynI+HqUF79
	beDcidujD8e4Ohi2kwiLJtzvlD4DMpm7zqfRGgBVON6MEDn9D/NpKMS6iKMLgc1yQOrP4JwP7pM86
	DE9jRd/7WXh2PudedrWElt1ntW6MRm7aGDc0eHC/R9g+TV7YvE7hFjNdthV5vgKpzYX29B9pzfI/M
	KmRQsxb9ITzu+0MRjnSLzfAcg1NzZfKkPcr1rpFfq6FgWV4g2WhsrFZeFAUCdMK1WNP7VdtIEI8Qh
	pwzed9DTazye89kK4VhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jI2-007aRE-SL; Thu, 01 Dec 2022 13:07:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jCq-007TKl-Vu
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:02:26 +0000
Received: by mail-pj1-x102e.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so5176697pjp.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=fo7AY9pboIe0ZJcIHcZHssx/Fv6yMUxHk5pOTZgl/310+2AuM9F4JAgAGN6E98l73e
         jVxZYWn1D+mPWtaLmlhPAoddu20lmKlsahPX9z5FHHl2H9jGkT7nbJtpsFfSTL1b1oYi
         Qomi2vFrOFdq/qU0TSA+qe5klggIfjdYzvPi7LoN9GYdX2vp67+K6nOo0VTUTqNvp9PM
         +Kxnvszajn/b6hlTAoh+eT5vkN/W3/SFrnGs1v0aH4wGzsNHuMT7bm6BNRjLKb5VkXuz
         sIMvaQmC2Di4rGc4Xx3mRTaCx4pPLQ8eisvuheaX63Z542ybF7ptuHTFqu+i3T5nDDID
         0EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=OvGEAuXCBMFD7tIizuibCqiIY7Z8202ZWYhcWh2ylhxppExHY1ynBxm1MgIKEs7RYc
         KDy3Go60ijpB4eTGE3EFwHaGtQZkKxcQmv6URCf97lMJl9PpFXf9O1y7CZUHnwXbxNZd
         oGxTmUf9WgRL9QC0Hw4aPfVYYmidDcqs4hFyUoLhtt/U471zIFp7MygGo+ZNoYng11ID
         DzMnUxjOiZnzcjWjRhP0t614typ9EHSO8/dzxgeLz7nCz9qQRbB9/KlGpwnE0ayotfEt
         NcIyn/0JnFLRcyH87JDxroRGYy9s9kzWplggXCbnfRBzXX9BEe9azFaLxg9KJa0L/7nX
         02aw==
X-Gm-Message-State: ANoB5pm2MgFe+zRLtxCc3EH8HowlMzYP7tMrDDIf6TNyyC7TQr2ug8Uo
	RuaB5bKqgI8+6gPywCFznZ8xaQ==
X-Google-Smtp-Source: AA0mqf5PQ521+yihjzeyfsJKJ4JWk+Io5YpSnmTZL/MABGqC4OUWdtY2+uZKfeMq2gshRjq3UzIxzw==
X-Received: by 2002:a17:90a:440f:b0:218:9894:62c1 with SMTP id s15-20020a17090a440f00b00218989462c1mr61850866pjg.205.1669899740831;
        Thu, 01 Dec 2022 05:02:20 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm4855856pjf.17.2022.12.01.05.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:02:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v14 8/8] irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
Date: Thu,  1 Dec 2022 18:31:35 +0530
Message-Id: <20221201130135.1115380-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201130135.1115380-1-apatel@ventanamicro.com>
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_050225_056623_67C0948A 
X-CRM114-Status: GOOD (  10.85  )
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

We add empty irq_eoi() in RISC-V INTC driver for child irqchip
drivers (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) which
implement chained handlers for parent per-HART local interrupts.
This hels us avoid unnecessary mask/unmask of per-HART local
interrupts at the time of handling interrupts.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 784d25645704..f229e3e66387 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -46,10 +46,27 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
 	csr_set(CSR_IE, BIT(d->hwirq));
 }
 
+static void riscv_intc_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * The RISC-V INTC driver uses handle_percpu_devid_irq() flow
+	 * for the per-HART local interrupts and child irqchip drivers
+	 * (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) implement
+	 * chained handlers for the per-HART local interrupts.
+	 *
+	 * In the absence of irq_eoi(), the chained_irq_enter() and
+	 * chained_irq_exit() functions (used by child irqchip drivers)
+	 * will do unnecessary mask/unmask of per-HART local interrupts
+	 * at the time of handling interrupts. To avoid this, we provide
+	 * an empty irq_eoi() callback for RISC-V INTC irqchip.
+	 */
+}
+
 static struct irq_chip riscv_intc_chip = {
 	.name = "RISC-V INTC",
 	.irq_mask = riscv_intc_irq_mask,
 	.irq_unmask = riscv_intc_irq_unmask,
+	.irq_eoi = riscv_intc_irq_eoi,
 };
 
 static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
