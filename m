Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844DBECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDyEV9fWHlcyUKyFjOwjdx9yeI2adAdpQGo05Ifdxp4=; b=cCW3bdSINFWfxE
	tzi3E/euuJG5SHcCNn89RCuroX9DxPJ1VkKB/Ex70uD1Ikt/ui/+bLnsngP71ieueNmYHvn6b5NuN
	Q8oRXMUQCZVHYJE04sSWIgJ+Y5h7iwDmxSLDjWqajM69UsumolLjH3ZZcbBp0xUvaQO8TGlwsO3BD
	+QWMEY8L9/GQdEjMQWJuSSs22WCe75/9ieVK01lsECraAGJiTp9drb70NyYQKH2Q7vKS3yHvRglYn
	Kl5tS5FIK17yFCtG9iLLKsQ5cGi3NYXSnYsNKIpdDDn+QmOUfLza6nSBGFLDUB2bPKx28hopMG4Z2
	4des60vpJRvel5C49tiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThl9-00B83Q-3X; Thu, 01 Sep 2022 10:49:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThl4-00B80Z-Kl
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 10:49:16 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJHkc5llwzkWnM;
	Thu,  1 Sep 2022 18:45:28 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 18:49:09 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 18:49:09 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>, <zouyipeng@huawei.com>
Subject: [PATCH 1/2] tracing: hold caller_addr to hardirq_{enable,disable}_ip
Date: Thu, 1 Sep 2022 18:45:14 +0800
Message-ID: <20220901104515.135162-2-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220901104515.135162-1-zouyipeng@huawei.com>
References: <20220901104515.135162-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_034914_871878_6FC7F8D4 
X-CRM114-Status: UNSURE (   9.12  )
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

Currently, The arguments passing to lockdep_hardirqs_{on,off} was fixed
in CALLER_ADDR0.
The function trace_hardirqs_on_caller should have been intended to use
caller_addr to represent the address that caller wants to be traced.

For example, lockdep log in riscv showing the last {enabled,disabled} at
__trace_hardirqs_{on,off} all the time(if called by):
[   57.853175] hardirqs last  enabled at (2519): __trace_hardirqs_on+0xc/0x14
[   57.853848] hardirqs last disabled at (2520): __trace_hardirqs_off+0xc/0x14

After use trace_hardirqs_xx_caller, we can get more effective information:
[   53.781428] hardirqs last  enabled at (2595): restore_all+0xe/0x66
[   53.782185] hardirqs last disabled at (2596): ret_from_exception+0xa/0x10

Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 kernel/trace/trace_preemptirq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
index 95b58bd757ce..1e130da1b742 100644
--- a/kernel/trace/trace_preemptirq.c
+++ b/kernel/trace/trace_preemptirq.c
@@ -95,14 +95,14 @@ __visible void trace_hardirqs_on_caller(unsigned long caller_addr)
 	}
 
 	lockdep_hardirqs_on_prepare();
-	lockdep_hardirqs_on(CALLER_ADDR0);
+	lockdep_hardirqs_on(caller_addr);
 }
 EXPORT_SYMBOL(trace_hardirqs_on_caller);
 NOKPROBE_SYMBOL(trace_hardirqs_on_caller);
 
 __visible void trace_hardirqs_off_caller(unsigned long caller_addr)
 {
-	lockdep_hardirqs_off(CALLER_ADDR0);
+	lockdep_hardirqs_off(caller_addr);
 
 	if (!this_cpu_read(tracing_irq_cpu)) {
 		this_cpu_write(tracing_irq_cpu, 1);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
