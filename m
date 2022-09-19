Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E6EECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+qW+VV9hNZWfz3zOi1n2mW702dz1TSNrcmejbUQ/aZs=; b=F2CMa0f3UJXzof
	WYA1XfcDRjGJ8/fNBTJtxRQoM2FMhnZZS04+pEj3GHGH5DAAUG7rWdKg6URTCyIgH1lXmMpd/GH1q
	fzddLHqFHR6OLZk+thjrBfO77jv7YmfbDHuosCP5iN1mSw8wTVAojHDrAPB3Djr3i6MSygOKja4ZB
	5hz6ZZ7gOdUN9fHbGeYqB1tK/CfFDU+1bMCU7q0wWtRTXXL4d9jJsyb6ii910TPfeUvau/droTVrx
	4UsJoKE9oWzyIClNNj81MoLg1C/6cF1PgLNN8EcrirbV1YH19iuH5HsnAj8fDW8KkmFVIIo0ZB7qd
	hyYOEdaKOqbEA2tYlUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCTI-00ALrM-Ig; Mon, 19 Sep 2022 08:49:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCSu-00ALMF-M2
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 08:49:26 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWJCd39KkzmVVN;
	Mon, 19 Sep 2022 16:45:17 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 16:49:09 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH] kprobes: Mark ftrace mcount handler functions nokprobe
Date: Mon, 19 Sep 2022 16:45:33 +0800
Message-ID: <20220919084533.42318-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014920_976060_D1F6B141 
X-CRM114-Status: UNSURE (   6.77  )
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

Mark ftrace mcount handler functions nokprobe since probing on these
functions probably reaches mcount recursivly during kprobe breakpoint
handler for some architecture(tested for riscv, arm64), and reenter
kprobe is treated as a fatal error, causes kernel panic.

Pesudo code below demonstrate this problem:

  mcount
    function_trace_call (probed)
      arch_breakpoint_handler
        arch_setup_singlestep [mcount]
          function_trace_call (probed)
            arch_breakpoint_handler
              reenter_kprobe
                BUG

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 kernel/trace/trace_functions.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index 9f1bfbe105e8..440a678a8c7c 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -16,6 +16,7 @@
 #include <linux/ftrace.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
+#include <linux/kprobes.h>
 
 #include "trace.h"
 
@@ -194,6 +195,7 @@ function_trace_call(unsigned long ip, unsigned long parent_ip,
 
 	ftrace_test_recursion_unlock(bit);
 }
+NOKPROBE_SYMBOL(function_trace_call);
 
 #ifdef CONFIG_UNWINDER_ORC
 /*
@@ -245,6 +247,7 @@ function_stack_trace_call(unsigned long ip, unsigned long parent_ip,
 	atomic_dec(&data->disabled);
 	local_irq_restore(flags);
 }
+NOKPROBE_SYMBOL(function_stack_trace_call);
 
 static inline bool is_repeat_check(struct trace_array *tr,
 				   struct trace_func_repeats *last_info,
@@ -321,6 +324,7 @@ function_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
 out:
 	ftrace_test_recursion_unlock(bit);
 }
+NOKPROBE_SYMBOL(function_no_repeats_trace_call);
 
 static void
 function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
@@ -363,6 +367,7 @@ function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
 	atomic_dec(&data->disabled);
 	local_irq_restore(flags);
 }
+NOKPROBE_SYMBOL(function_stack_no_repeats_trace_call);
 
 static struct tracer_opt func_opts[] = {
 #ifdef CONFIG_STACKTRACE
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
