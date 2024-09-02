Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD2CA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGfBdlmzUVuIncAZhJU3Q8IY3HRMMhfAWXOCgcPod94=; b=HDK8q+y+l4JxV9
	Q2jp7tQoy2CfjlEzH1IqgUgvRSk6x4zFjHh4bZSWYYzjrYdqWWF9a61U14OYjiW1MEMDJKXudZe70
	B75a7FwXddcCwZ5Jkk9lE8De5njfi1fgsGUT9TdshJK6CoFwDXG3jmHAEJ6VU7YTAf8E3iO3MUJkS
	DZro0IXs0kMM5P1Lf2KH9ARgeWiGAEHViiFB4TOcnOpzsnfcl+WXVMiwOx/2/tICCORxREg9dR2uX
	6E7Y8leVe2fjCzTuW0MdrYXBoL95BRyv6VZv1hnstTO7c6mBoMWhWM3arlQvB0fjd57H5LGV4jqjm
	Y55Y6KrqPtN9I0UxKIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl6fI-0000000EP1t-0sQe;
	Mon, 02 Sep 2024 13:00:16 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl6fD-0000000EOxv-0yiO
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 13:00:13 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wy82v4vXQz18Mvw;
	Mon,  2 Sep 2024 20:59:03 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 922D41402DE;
	Mon,  2 Sep 2024 20:59:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 20:59:58 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <tglx@linutronix.de>, <paul.walmsley@sifive.com>,
	<samuel.holland@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next] irqchip/sifive-plic: Make use of __assign_bit() API
Date: Mon, 2 Sep 2024 21:08:24 +0800
Message-ID: <20240902130824.2878644-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_060012_126740_92819FEE 
X-CRM114-Status: UNSURE (   9.68  )
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

We have for some time the __assign_bit() API to replace
open coded
    if (foo)
        __set_bit(n, bar);
    else
        __clear_bit(n, bar);

Use this API to simplify the code. No functional change
intended.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/irqchip/irq-sifive-plic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 2f6ef5c495bd..c576b9bbeb13 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -252,10 +252,8 @@ static int plic_irq_suspend(void)
 	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
 
 	for (i = 0; i < priv->nr_irqs; i++)
-		if (readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID))
-			__set_bit(i, priv->prio_save);
-		else
-			__clear_bit(i, priv->prio_save);
+		__assign_bit(i, priv->prio_save,
+		    readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID));
 
 	for_each_cpu(cpu, cpu_present_mask) {
 		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
