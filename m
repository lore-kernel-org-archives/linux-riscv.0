Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD60C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfuDxl3P8N/wQYgSILtqC5DcgIup+b9sGwsxAxHYhs8=; b=yl6UkqBJQx8mCb
	Q0cPOvW09dXlKOEaHyuDRMKfzoDcfLCYU97dNOmR0tIgBTqFzSe28voARvAHiwseESosqbvUf8LgQ
	GBSwF63jMIownJ06kArQlD9iUsScGJpY9Z8Dr/fCwCTRI7qR0SnfODtEOyaRUUh0SVrFQZUDN8Sxh
	f2i1qTWXiQMyGfE+7xvXX2cZ0xxciXyCxo6K6KOd2yuzv/87416T9bui5CZQYEf9WlbhN8bE3CfVG
	dm95FQQkSeC3O2+13wIJjhdijDb5eAArA/dMEwtx+6cRuE/gNGq6du4XZ6nXdVVk8yAIlbp39wmr8
	UsKnQHZ8zhBA5BBPFJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyw-004mu1-7r; Tue, 20 Sep 2022 15:16:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyt-004mqD-3A
	for linux-riscv@bombadil.infradead.org; Tue, 20 Sep 2022 15:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NlgVBe9saYOarlTGQlgLKZODXqQD7q807n+Kbw/6ybc=; b=cuQgDjBLAvjNXh+TLwU1xTPvKI
	WjChwrMkmUxCk59qE8Exv3/IYUQNQRJ9yKTS4EgaIG9mE1/7JRsnQ7OuqKjz+8HG55gwqTCWG2NjI
	xtvpZTHPCW8kW3mB2xIInhLDDRo9GTeXmMZZo0Hu1trbwujkj+7v1QaerxZKMmvRfsehD1msPW8lb
	gbABuiXHxMFVoRU9wIhNG435e75wYnuA6sct+37o+/lwVq7tyJKI0b2MTOT1+2sUDuw0x0eBdPs9b
	jknfcQcSKttedBzg92k5adQhT90+8RgDZDjid6a9Ieci+mSDF0LpeIEW4jbm3DGatKPR3tG6DbdeO
	k64W8PtA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyp-00EN4a-9K
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 15:16:13 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MX4l06HjSzlW5D;
	Tue, 20 Sep 2022 23:11:40 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:46 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:46 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<namhyung@kernel.org>, <jolsa@kernel.org>, <guoren@kernel.org>,
	<nsaenzju@redhat.com>, <frederic@kernel.org>, <changbin.du@intel.com>,
	<vincent.chen@sifive.com>, <ardb@kernel.org>, <mhiramat@kernel.org>,
	<rostedt@goodmis.org>, <keescook@chromium.org>, <catalin.marinas@arm.com>,
	<chenzhongjin@huawei.com>
Subject: [PATCH -next 6/7] riscv: stacktrace: Fix unwinding on ftrace_regs_call
Date: Tue, 20 Sep 2022 23:12:01 +0800
Message-ID: <20220920151202.180057-7-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920151202.180057-1-chenzhongjin@huawei.com>
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_161611_833849_0CADD70C 
X-CRM114-Status: UNSURE (   7.96  )
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

When unwinding on ftrace_regs_call, the traced function will be skipped
because ftrace_regs_caller doesn't save the fp and ra.

Save the encoded fp so that we can get the pt_regs so that we can unwind
from ftrace_regs_call to the traced function.

Also the pt_regs->status should be set as kernel mode.

Stacktrace before this patch:

 Call Trace:
  ...
  [<ffffffff0161a0e0>] handler_pre+0x30/0x4a [kprobe_unwind]
  [<ffffffff800bce92>] aggr_pre_handler+0x60/0x94
  [<ffffffff80006df0>] kprobe_ftrace_handler+0x13e/0x188
  [<ffffffff80008e7e>] ftrace_regs_call+0x8/0x10
  [<ffffffff80002540>] do_one_initcall+0x4c/0x1f2
  [<ffffffff8008a4e6>] do_init_module+0x56/0x210
 ...

Stacktrace after this patch:

 Call Trace:
  ...
  [<ffffffff016150e0>] handler_pre+0x30/0x4a [kprobe_unwind]
  [<ffffffff800bce96>] aggr_pre_handler+0x60/0x94
  [<ffffffff80006df0>] kprobe_ftrace_handler+0x13e/0x188
  [<ffffffff80008e82>] ftrace_regs_call+0x8/0x10
+ [<ffffffff01615000>] empty_call+0x0/0x1e [kprobe_unwind]
  [<ffffffff80002540>] do_one_initcall+0x4c/0x1f2
  [<ffffffff8008a4ea>] do_init_module+0x56/0x210
  ...

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/riscv/kernel/mcount-dyn.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index d171eca623b6..56a4014c392f 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -10,6 +10,8 @@
 #include <asm/asm-offsets.h>
 #include <asm-generic/export.h>
 #include <asm/ftrace.h>
+#include <asm/frame.h>
+#include <asm/csr.h>
 
 	.text
 
@@ -97,6 +99,11 @@
 	REG_S x29, PT_T4(sp)
 	REG_S x30, PT_T5(sp)
 	REG_S x31, PT_T6(sp)
+
+#ifdef CONFIG_FRAME_POINTER
+	li s0, SR_PP
+	REG_S s0, PT_STATUS(sp)
+#endif
 	.endm
 
 	.macro RESTORE_ALL
@@ -172,6 +179,7 @@ ENDPROC(ftrace_caller)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 ENTRY(ftrace_regs_caller)
 	SAVE_ALL
+	ENCODE_FRAME_POINTER
 
 	addi	a0, ra, -FENTRY_RA_OFFSET
 	la	a1, function_trace_op
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
