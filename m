Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D11BC27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pM1el/joVwLrueBi31po+Wk3S4iZLeAPP1l8z1hhdvI=; b=FWURnHLYgXfruo
	LGC0rylhR6jv8FlOSZIIruv9sv42M1zA2eP9F22vOZIBKlHaYVEzCUYopPlqhq7TwgAQzurxtzq2R
	zkV+oWtBk4LkjuZVV27N909sJUJdc8tZDJ0k+KVgWssyNwL3h6BU/8BudjnrOxFubuUwArGkHW3j2
	2crDcRuxkgVTs13R2m7ZK6/qbBEK+8oFB+3hJ9ex6X7ssegYYAR0ImzvwWhudcJ+zjOCwKn7m+5rG
	8YiHetyf4m85xK9YzqHppZD+GBBy5UwvHE14d+mf9mtZyD+4UTYcxfvbUpWs7OpxA3Z9EZi9DucYK
	tw5xAw9CxhGW6T/wm3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI8wA-00000003FPc-22Eg;
	Fri, 14 Jun 2024 15:33:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI8w8-00000003FOv-0uIj
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 15:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3174ACE29F4;
	Fri, 14 Jun 2024 15:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0932CC2BD10;
	Fri, 14 Jun 2024 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718379230;
	bh=XPs2SWgcg9zduhMhSD7BO0xKySl3NyBcZQRSGIiEXLg=;
	h=From:To:Cc:Subject:Date:From;
	b=TFrW7etlj0iwXNYY0ftpeIkaSGEDDdSHHhLlHu9RY9Dcy1BKNE6BN709gSW23z6jN
	 4NYG+TrSA2WzJ768BqsUzeW7070uUkmVza1P4C9v4b0UwxDXgq6W8KyRqp4L3NBlDW
	 XWAkmKLsAEYUrTrcfhiNUBSDwmSkucIAsA3zhs2NssPBxqplshjQNiPnkLAHkiFx/O
	 7+zW7HUXtP7wdwVyyIoaMXPmUtdy0kgq+CBTyK6dSvJNIBWdnHlkCviB2MvPuEVWHJ
	 C5xJvPfOYAxtUwDQF6ri3dn3Gk0OhHRI2pXJZmsSAvTC/oKFLhrinAnOFuCqS0PELI
	 FFZpS5vYjcNVA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/riscv-intc: Remove asmlinkage
Date: Fri, 14 Jun 2024 23:19:55 +0800
Message-ID: <20240614151955.1949-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_083356_484049_9D0A3B5A 
X-CRM114-Status: UNSURE (   9.62  )
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

The two functions riscv_intc_aia_irq() and riscv_intc_irq()
are only called by C functions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

Hi riscv maintainers and all,

Related question:

I believe the asmlinkage in riscv is a nop, is it OK to
remove asmlinkage from all riscv code?

Anyway, no matter what will be the decision, it's correct to
remove asmlinkage in riscv intc driver as this patch does.

thanks

 drivers/irqchip/irq-riscv-intc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4f3a12383a1e..47f3200476da 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -26,7 +26,7 @@ static unsigned int riscv_intc_nr_irqs __ro_after_init = BITS_PER_LONG;
 static unsigned int riscv_intc_custom_base __ro_after_init = BITS_PER_LONG;
 static unsigned int riscv_intc_custom_nr_irqs __ro_after_init;
 
-static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
+static void riscv_intc_irq(struct pt_regs *regs)
 {
 	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
 
@@ -34,7 +34,7 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 		pr_warn_ratelimited("Failed to handle interrupt (cause: %ld)\n", cause);
 }
 
-static asmlinkage void riscv_intc_aia_irq(struct pt_regs *regs)
+static void riscv_intc_aia_irq(struct pt_regs *regs)
 {
 	unsigned long topi;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
