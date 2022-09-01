Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80E8ECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9M6KSaFcNkGiqXDpOpA4+0oyTeBwzgWJusuvIjclS8=; b=A5e/WBjEeRXznU
	5wUrLHSHM2coEUF0AQt3kITVSV8uAgINMh0SxO1FhiohSv/PtuKBZiCisRXRi3e7JJ0LtVl5xL7pR
	Mm+OsDukETdP675q+5XpEZTiKBeIV8j8fsAYdx9rc7EdkYL7IZftLtKFbMU9lwtSZsrlzngQ54mPi
	NI36IE099HbWvWWiGCl2j59bn3zC+GWHyRjB+7I3pIx4DOvYOrHbvMj/PWCe7gYvcXKBaR9gdEcR4
	JjyfkDVTQmmudRzvmom+05ohh7QI07i7zWV+QJC/wIWNZFvoXuaqUtmnI1VqS+GcGKjET2aIVgW0y
	hDctamHmx2mnW0R2/aVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThlA-00B83s-87; Thu, 01 Sep 2022 10:49:20 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThl5-00B80c-Ng
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 10:49:17 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJHjn4GCFzYcys;
	Thu,  1 Sep 2022 18:44:45 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 18:49:10 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 18:49:10 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>, <zouyipeng@huawei.com>
Subject: [PATCH 2/2] riscv: tracing: Improve hardirq tracing message
Date: Thu, 1 Sep 2022 18:45:15 +0800
Message-ID: <20220901104515.135162-3-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220901104515.135162-1-zouyipeng@huawei.com>
References: <20220901104515.135162-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_034915_952420_F7675A61 
X-CRM114-Status: UNSURE (   9.46  )
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

Use trace_hardirqs_on_caller to improve irq_tracing message.

lockdep log in riscv showing the last {enabled,disabled} at
__trace_hardirqs_{on,off} all the time(if called by).
But that's not what we want to see, the caller is what we want.

Before this commit:
[   57.853175] hardirqs last  enabled at (2519): __trace_hardirqs_on+0xc/0x14
[   57.853848] hardirqs last disabled at (2520): __trace_hardirqs_off+0xc/0x14

After this commit
[   53.781428] hardirqs last  enabled at (2595): restore_all+0xe/0x66
[   53.782185] hardirqs last disabled at (2596): ret_from_exception+0xa/0x10

Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 arch/riscv/kernel/trace_irq.c | 4 ++--
 include/linux/irqflags.h      | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/trace_irq.c b/arch/riscv/kernel/trace_irq.c
index 095ac976d7da..7ca24b26e19f 100644
--- a/arch/riscv/kernel/trace_irq.c
+++ b/arch/riscv/kernel/trace_irq.c
@@ -16,12 +16,12 @@
 
 void __trace_hardirqs_on(void)
 {
-	trace_hardirqs_on();
+	trace_hardirqs_on_caller(CALLER_ADDR0);
 }
 NOKPROBE_SYMBOL(__trace_hardirqs_on);
 
 void __trace_hardirqs_off(void)
 {
-	trace_hardirqs_off();
+	trace_hardirqs_off_caller(CALLER_ADDR0);
 }
 NOKPROBE_SYMBOL(__trace_hardirqs_off);
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 5ec0fa71399e..46774fa85cde 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -53,6 +53,8 @@ extern void trace_hardirqs_on_prepare(void);
 extern void trace_hardirqs_off_finish(void);
 extern void trace_hardirqs_on(void);
 extern void trace_hardirqs_off(void);
+extern void trace_hardirqs_on_caller(unsigned long caller_addr);
+extern void trace_hardirqs_off_caller(unsigned long caller_addr);
 
 # define lockdep_hardirq_context()	(raw_cpu_read(hardirq_context))
 # define lockdep_softirq_context(p)	((p)->softirq_context)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
