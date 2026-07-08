Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E3C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 01:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C+JST3QO6VsW2nj/URjnyHXVEMAeXYcCXbFlU20dtmc=; b=hj47MWHMhmApb2
	n1cKWHYW5jx4pEzE3iFkcw5D6xiE+ax1LRd4uJ1x6eX25aKGOh5tA/Cnux7BLUuXo2ScR2o7n1jAc
	GB4QmXgABoO7mnh9k3mUmpNUzBesY/3ZdBWrVkOopmlg6UousKQnK9iaYERLikf+Y3S4TK3fQCZoz
	ojvFLt+RxgW95FCHef5c8Xepy9Vri+X9emIHQTcBmdmOGM00HPzEESmGEqIDr+GF5R8ggoN8Kk+4I
	P00ZrTzdREo+l+t+4WjeyZ9kXAq6HitaPbPEHcvfO1C3Xs8ECWw73StzPgNQdOjVfIYp2EitcQcef
	6qu0tSM3F+9sxanrsZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHRF-0000000G7ne-0fYF;
	Wed, 08 Jul 2026 01:51:01 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHRB-0000000G7mt-1kFD
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 01:50:59 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gw1Jr2JCgz8XrrJ;
	Wed, 08 Jul 2026 09:50:52 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6681ojIQ011042;
	Wed, 8 Jul 2026 09:50:45 +0800 (+08)
	(envelope-from zhang.anmeng@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 8 Jul 2026 09:50:46 +0800 (CST)
X-Zmail-TransId: 2afb6a4dacf6642-59625
X-Mailer: Zmail v1.0
Message-ID: <20260708095046716mVQlEvhyoXko9eueCxict@zte.com.cn>
Date: Wed, 8 Jul 2026 09:50:46 +0800 (CST)
Mime-Version: 1.0
From: <zhang.anmeng@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <alex@ghiti.fr>, <qirui.001@bytedance.com>, <hu.shengming@zte.com.cn>,
        <gao.rui@zte.com.cn>, <luo.haiyang@zte.com.cn>, <zhang.run@zte.com.cn>,
        <zhangchunyan@iscas.ac.cn>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogc3RhY2t0cmFjZTogRml4IE5VTEwgdGFzayBwb2ludGVyIGluCiBmdHJhY2VfZ3JhcGhfcmV0X2FkZHIoKQ==?=
X-MAIL: mse-fl1.zte.com.cn 6681ojIQ011042
X-TLS: YES
X-ENVELOPE-SENDER: zhang.anmeng@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 08 Jul 2026 09:50:52 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4DACFC.000/4gw1Jr2JCgz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_185057_614590_562C4AE8 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Anmeng Zhang <zhang.anmeng@zte.com.cn>

When dump_backtrace() is called with a NULL task argument, and the
call stack contains functions that are being traced,
walk_stackframe() eventually calls ftrace_graph_ret_addr() with the
NULL task pointer, which results in a NULL pointer dereference when
accessing task->curr_ret_stack.

Fix this by assigning the task pointer to the current task in
walk_stackframe() when it is NULL, keeping the behavior consistent
with other architectures.

Fixes: ecbf894165a2 ("riscv: Fix ftrace_graph_ret_addr() to use the correct task pointer")
Reviewed-by: Shengming Hu <hu.shengming@zte.com.cn>
Reviewed-by: Rui Gao <gao.rui@zte.com.cn>
Reviewed-by: Luo Haiyang <luo.haiyang@zte.com.cn>
Reviewed-by: Run Zhang <zhang.run@zte.com.cn>
Signed-off-by: Anmeng Zhang <zhang.anmeng@zte.com.cn>
---
 arch/riscv/kernel/stacktrace.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..d19545efb5dd 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -52,11 +52,14 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	int graph_idx = 0;
 	int level = 0;

+	if (task == NULL)
+		task = current;
+
 	if (regs) {
 		fp = frame_pointer(regs);
 		sp = user_stack_pointer(regs);
 		pc = instruction_pointer(regs);
-	} else if (task == NULL || task == current) {
+	} else if (task == current) {
 		fp = (unsigned long)__builtin_frame_address(0);
 		sp = current_stack_pointer;
 		pc = (unsigned long)walk_stackframe;
-- 
2.43.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
