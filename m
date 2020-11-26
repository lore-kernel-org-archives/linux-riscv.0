Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F03AC63697
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 13:33:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F7BE206F7
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 13:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+TMRzd3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F7BE206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WvRiS8TzS5OpWOVKXmZq3kaTd9HGdpWszgtmJJsx6vc=; b=W+TMRzd3Kavx9gy//aT0pTw9C
	AU4rHqZvhbkKUkcZdtXpaUdFTpRUlKPK1w8UjNELUyJ4betyBMR8rBhxqG/HutiVASlRBd5pzjWPP
	bATcVs8m+1AmQwW+8qKVeu09zAms3nB/fMtL1K0a+b56r5gkVtovQsKpfL7IfeDIzv/yr3d0uyUeq
	Y3i9pUys5leokH8rBjQmZ41aHYSfIUgo866zqvdy6X/h5RYGznm8CQHTTBfCNt5mWukhrdc/G8SVw
	CAJYNP9o0nk8+eakmeWXK2Id9vFeKgFIyfvvexcnJUXNjxjjmd6Sr/N7lZ/rmYAW/aRnONB+7kyOv
	ctvIT97Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiHPC-0002Rb-6Q; Thu, 26 Nov 2020 13:33:50 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiHLh-0000WZ-N8
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 13:30:21 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Chds86hZPzLmnB;
 Thu, 26 Nov 2020 21:29:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 21:29:54 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v2] riscv: Using printk directly in __show_regs
Date: Thu, 26 Nov 2020 21:33:38 +0800
Message-ID: <20201126133338.125608-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124112054.106960-2-wangkefeng.wang@huawei.com>
References: <20201124112054.106960-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_083020_303931_00191820 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Covert bulk of pr_cont("...\n") to separate printk calls.

Note that a pr_cont() message with a trailing newline will
"terminate" the continous line so that it can no longer be
continued, also it is possible to sort out simultaneous dumps
from multiple CPUs with CONFIG_PRINTK_CALLER enabled.

And align the printing formats.

Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/kernel/process.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e41b733abeaa..2119d49feea5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -44,30 +44,30 @@ void __show_regs(struct pt_regs *regs)
 {
 	show_regs_print_info(KERN_DEFAULT);
 
-	pr_cont("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
+	printk("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
 		regs->epc, regs->ra, regs->sp);
-	pr_cont(" gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
+	printk("gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
 		regs->gp, regs->tp, regs->t0);
-	pr_cont(" t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
+	printk("t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
 		regs->t1, regs->t2, regs->s0);
-	pr_cont(" s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
+	printk("s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
 		regs->s1, regs->a0, regs->a1);
-	pr_cont(" a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
+	printk("a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
 		regs->a2, regs->a3, regs->a4);
-	pr_cont(" a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
+	printk("a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
 		regs->a5, regs->a6, regs->a7);
-	pr_cont(" s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
+	printk("s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
 		regs->s2, regs->s3, regs->s4);
-	pr_cont(" s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
+	printk("s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
 		regs->s5, regs->s6, regs->s7);
-	pr_cont(" s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
+	printk("s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
 		regs->s8, regs->s9, regs->s10);
-	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
+	printk("s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
+	printk("t5 : " REG_FMT " t6 : " REG_FMT "\n",
 		regs->t5, regs->t6);
 
-	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
+	printk("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);
 }
 void show_regs(struct pt_regs *regs)
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
