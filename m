Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4B2105D9AC
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:To:Date:From:Cc:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i6DxaiyijXH0hoNwI/qiUO1TQMVlbGppgdTbyci2m7s=; b=ckY98oxS9So28z
	it8cUOiPhBW2kun2aKs3PpNu9qJ6oYxDr9bDq83TCazUoqOFcITUNIwY3l4iMnNhPpXrxtA9bjl6/
	/KcxDQr4nGP1C6t9hQHJOnONDc6HaLVlxOvRujQGbHhrD/SiyJgVg/e7xCW0F7c27Qws5krX1h0CT
	5wy2ufAqb7LavJSWrX29drJhyDKVk/kxvOWeVCcw5mzqGXdLCaYDDXpi/riXxB+kxBKCB/XMIFUzM
	92/DlzQRHG/0ykNuNtW/eJO3q/G2pRXFKMyQ5dbx0sEGxmjOLyJYtASacbD5thmHSJOSPd6AbrIo9
	UwLHaQbpSygRJLUdI77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPG0-00000008cFW-0VSL;
	Wed, 08 Apr 2026 09:31:32 +0000
Received: from va-2-113.ptr.blmpb.com ([209.127.231.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPFv-00000008cFB-2NC9
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 09:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1775640678; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=JKdvdbWvQjaY2kCvzSIVoR8XPkLrhKuJXTb+nrkhdZ0=;
 b=BWyGNgH7xDMYN1ytquVloSy5Qgtuw19CPPSL4WH1XsUIMjNZonP0hDnyh6qfVshaEzl10E
 X7FzNFNzbgWJKpWaJTJxY3n/kn/t4bSV6n9AodzQKp0bIBrRgS1dDOusx5LYrj6zWsAk5m
 hNwVoCO21XV3oR++algD/dq9EvL445Rab2yNECUCHzbMUfJRjfGPv+0LWUPWMhfQYfrfVk
 skymga0ZEG/v34NDF3nGnuEcCDfYCy5+F59vEKDarb6KFHXwLbOCwvYX4Uloipa1yFRXFh
 ZorOxbdRBF19FWo9dIIpUw04AgGb8ZJz1ex998qNxz7Y5HinACs86IHElyXDZQ==
Message-Id: <20260408092915.46408-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.52.0
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Wed,  8 Apr 2026 17:29:15 +0800
X-Lms-Return-Path: <lba+269d62064+56535a+lists.infradead.org+qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, <zhangchunyan@iscas.ac.cn>, <xujiakai2025@iscas.ac.cn>
Subject: [PATCH] riscv: Fix ftrace_graph_ret_addr() to use the correct task pointer
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_023127_681650_9C5A85AC 
X-CRM114-Status: UNSURE (   9.94  )
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

The walk_stackframe() function is used to unwind the stack of a given
task. When function graph tracing is enabled, ftrace_graph_ret_addr()
is called to resolve the original return address if it was modified by
the tracer.

The current code incorrectly passes 'current' instead of 'task' to
ftrace_graph_ret_addr(). This causes incorrect return address resolution
when unwinding a stack of a different task (e.g., when the task is
blocked in __switch_to).

Fix this by passing 'task' instead of 'current' to match the behavior
of other architectures (arm64, loongarch, powerpc, s390, x86).

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index b41b6255751c..2692d3a06afa 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -87,7 +87,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		} else {
 			fp = READ_ONCE_TASK_STACK(task, frame->fp);
 			pc = READ_ONCE_TASK_STACK(task, frame->ra);
-			pc = ftrace_graph_ret_addr(current, &graph_idx, pc,
+			pc = ftrace_graph_ret_addr(task, &graph_idx, pc,
 						   &frame->ra);
 			if (pc >= (unsigned long)handle_exception &&
 			    pc < (unsigned long)&ret_from_exception_end) {
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
