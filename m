Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9BDC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7P+xXjBtB61ZKJ2KJpuQrOCXW0TU49v640a+sM0nXcQ=; b=UwRWJQbbl0V9zV
	/UH8ULOhaUbhrTaw/EutTd0qvwgO32d0jheXo9RZv8FKHp8Dl/4IMYfRwrXPROkb6eR1a+/uSdfQd
	vLRn8kdHP4jynX9f4RgUf1zxx3b4mqV9qY4A7ZOXlryvjjyUwDyWnL3yRZrmoP8rvBaYt2bmipo4V
	SX6aop42ZSfAinQCq6zPkvQzmrKAXSMCVnF5ZemlPAoEEBdvGnUtC/sj7dZjjIUys9axnl4Z15wQx
	/5+96cQLo4NWhRhcW/V9PsAiDfVTr/rU8/wq9VLFLY5SW3tm8xDfOHPkhNTTTz+BkKk5UHRbtC+iO
	u5M8Qap0lApdPEBZUMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrzp5-00BsXA-Tu; Fri, 20 May 2022 10:25:31 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzp2-00Bs4K-FL
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 10:25:29 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
 by michel.telenet-ops.be with bizsmtp
 id YyRT2700938adXi06yRT5m; Fri, 20 May 2022 12:25:27 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrzp0-000zwX-Or; Fri, 20 May 2022 12:25:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrzp0-003vMq-6u; Fri, 20 May 2022 12:25:26 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: starfive: Use existing variable gpio
Date: Fri, 20 May 2022 12:25:25 +0200
Message-Id: <93595278e4775788a5c3e1d0a354c608444dc18f.1653042265.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_032528_679793_D07C56A4 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Use the existing variable "gpio", instead of obtaining the hwirq number
again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Feel free to fold into commit 48bd5c381c4a750b ("pinctrl: starfive: Make
the irqchip immutable"), if possible.
---
 drivers/pinctrl/pinctrl-starfive.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
index f82a72f8016f59cc..669aeb45d70dd57b 100644
--- a/drivers/pinctrl/pinctrl-starfive.c
+++ b/drivers/pinctrl/pinctrl-starfive.c
@@ -1079,7 +1079,7 @@ static void starfive_irq_mask(struct irq_data *d)
 	writel_relaxed(value, ie);
 	raw_spin_unlock_irqrestore(&sfp->lock, flags);
 
-	gpiochip_disable_irq(&sfp->gc, d->hwirq);
+	gpiochip_disable_irq(&sfp->gc, gpio);
 }
 
 static void starfive_irq_mask_ack(struct irq_data *d)
@@ -1108,7 +1108,7 @@ static void starfive_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 value;
 
-	gpiochip_enable_irq(&sfp->gc, d->hwirq);
+	gpiochip_enable_irq(&sfp->gc, gpio);
 
 	raw_spin_lock_irqsave(&sfp->lock, flags);
 	value = readl_relaxed(ie) | mask;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
