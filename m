Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C7CC6FA8B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4edOL5HwsTDYWftjA5NDjGNsf6Yc8j5xH23+IXiTrvw=; b=AqRMVcPiWjaBni
	UDaWimGe7hnA9T3yKcZjd7TZNTVkOPqbJknxbNlCGw7HvB8SJ2nPy7KIAERU1ygEsvWylgEEUEVnN
	22ZpmnuymKl2mMoOOIC9whhrB3UUZKdZ0zvFs/4yHv8XZNa5otj/Vx6eR/DWHxmyLCweG/rnu1r5p
	xhe93i7OLTElYv5/YcbpURWSAt5ldddlYygk/c+EWDRfPgf1BDS5cZhLDB9rZZq3+F2yhscGgOPZl
	3GFFF/fPMDub7VwBjWIbEQMJ3VsRDfLMKI19Pz2U5/aQo7l1D3K8qG21JvEa8SwMogqQhs/tVfhmO
	JKUPwkchLRCuFMkFy0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGOl-00Bn1R-MQ; Mon, 19 Sep 2022 13:01:19 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGOi-00Bmxt-4X
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 13:01:18 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MWPrP0qzVzHnxM;
	Mon, 19 Sep 2022 20:59:01 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 21:01:08 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 21:01:08 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <zanussi@kernel.org>,
	<mhiramat@kernel.org>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>
CC: <zouyipeng@huawei.com>
Subject: [PATCH 1/2] tracing: kprobe: fix kprobe event gen test module on exit
Date: Mon, 19 Sep 2022 20:56:28 +0800
Message-ID: <20220919125629.238242-2-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220919125629.238242-1-zouyipeng@huawei.com>
References: <20220919125629.238242-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_060116_390707_0A9FCDF1 
X-CRM114-Status: UNSURE (   9.04  )
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

Correct gen_kretprobe_test clr event para on module exit.
This will make it can't to delete.

Fixes: 64836248dda2 ("tracing: Add kprobe event command generation test module")
Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 kernel/trace/kprobe_event_gen_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/kprobe_event_gen_test.c b/kernel/trace/kprobe_event_gen_test.c
index 18b0f1cbb947..e023154be0f8 100644
--- a/kernel/trace/kprobe_event_gen_test.c
+++ b/kernel/trace/kprobe_event_gen_test.c
@@ -206,7 +206,7 @@ static void __exit kprobe_event_gen_test_exit(void)
 	WARN_ON(kprobe_event_delete("gen_kprobe_test"));
 
 	/* Disable the event or you can't remove it */
-	WARN_ON(trace_array_set_clr_event(gen_kprobe_test->tr,
+	WARN_ON(trace_array_set_clr_event(gen_kretprobe_test->tr,
 					  "kprobes",
 					  "gen_kretprobe_test", false));
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
