Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215C1C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 00:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SzYllvQYIOjUIVDhb9kpavs5r0Q4q7U31dDkxH28vXY=; b=JxAdM012JqpgJ8
	HcKjP6Ap2CPoSq5TwEgC9K7iAwUXNfVs2OFvho8qdzjLlfjkHQAidazh0ms+9uGRZ24NxPV5jfTN3
	dsBA6lQJ48OCoOmw2wkyyPfsfZqDoKaHmO3rQkC2t2ePS9Wi8UVU5vLW7TA1R6IVQEmGuncaxEyGF
	ZtTgOW1DN7j/8L0aclHsvAOPQiXbycbQ/4+e7SQw8hO5AWJ6IFNLcfiIyeUhvBrxZCUy/H9mryGIM
	y3RTBGquanvEkkX+7jnrwd9r/sWh5lnKCozuHOmGpnkrHmt98XQ4zV3ubbAC3oRPd8GHgQlxBwci+
	ZFGg40YZ1uZPWmZVhJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYzdf-004EQY-EE; Fri, 16 Sep 2022 00:55:27 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYzdc-004Dkx-5N
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 00:55:26 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MTFr94wvYzmVR1;
	Fri, 16 Sep 2022 08:51:21 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 16 Sep
 2022 08:55:08 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alankao@andestech.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv/ftrace: Set FTRACE_FORCE_LIST_FUNC if DYNAMIC_FTRACE_WITH_REGS is not set
Date: Fri, 16 Sep 2022 08:51:35 +0800
Message-ID: <20220916005135.91945-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_175524_412154_7843F8B5 
X-CRM114-Status: UNSURE (   9.08  )
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

With the following configuration options:

  CONFIG_FUNCTION_TRACER=y
  CONFIG_DYNAMIC_FTRACE is not set
  CONFIG_DYNAMIC_FTRACE_WITH_REGS is not set

Setting function tracer leads to Linux being stuck:

  echo function > /sys/kernel/tracing/current_tracer

The reason is: for static tracing, RISC-V mcount only support passing up
ip and parent_ip, if it does not force list func, some C side effects
occurs, where a function is called without passing a valid third
parameter, then kernel will trap into page fault when jump from mcount
to function_trace_call().

Fix this stuck issue by force kernel to use indirect list trace
function, when CONFIG_DYNAMIC_FTRACE_WITH_REGS is not set.

Fixes: 71e736a7d655 ("riscv/ftrace: Add ARCH_SUPPORTS_FTRACE_OPS support")
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/include/asm/ftrace.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..a9d365e46b52 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -23,7 +23,10 @@
 #define MCOUNT_NAME mcount
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 #define ARCH_SUPPORTS_FTRACE_OPS 1
+#endif
+
 #ifndef __ASSEMBLY__
 void MCOUNT_NAME(void);
 static inline unsigned long ftrace_call_adjust(unsigned long addr)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
