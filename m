Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88221C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 03:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:From:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buM+Fdck4AkIJf13VKdNrpXWiPpHiUwGQq/gcLu2yxA=; b=p2pd01gOoQTPa7
	RvHm9wY4ffDJbpvaW/wnTN/TX1O2DYG7yDiI6W5ttfP9Gd1hpUK3acKBatcK4f/b4US4vPzRjKKAd
	tKde5ZNZQmvFbsfUmNqOmXS7Blwcbx01ijTgkIeGIvuO/yRxKW6ZW2FqfJ+I/nG6iYkRiegQoJgx9
	JX/O1hq47wDah9kyvgiHipApb0Gay3gv/+JnlKf6fBjk7tiQMgCrh3sPgu6+uv/0dQyR8qMlnfIzm
	KP8LvlOPDWPiTtTkKcQZmXnOCIk1TqCUYrn4qWFfBdLiSOa5KFTIhoSfnRJJXoCZFNUCpCXyu8Rap
	Qxt7zpbDrqICUOryCaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ltv-0000000Fv8q-0GAW;
	Sat, 19 Sep 2026 03:38:07 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7lts-0000000Fv7d-3pft
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 03:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789789080; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sgWKI1y5XLT4ulSXwOPuxJWMC/sDZ6Am6sYFd61oFM8=;
 b=dW7JjkzYUWJgkk1vQ06fHqA2F4cq4wT+s/L3qae+mme89lZGfoB0NQV7qRfFOErEPHFqRO
 bGYBwNKoVjlL4mlc6zFxmMI+jkySodTqytiaQNyknFgYsKaq88aONSEzsy3fI6z3WFqxka
 IumFdHIDrwJKQMIO9CiJIoTzYkaL4w0uJXSDa4E8cD7xrIF60F7LDvIX31KRtvR24eR89q
 2Gure92PBt2n/B5jO7NpK7wtV4dq9AqD+clrrqzoi3V6xLizrvId82+StKlPXPWbTlANzF
 DpMlj9NyeZ0S3Qjqd54eWvYvMelLq7vff8XcyefqrUPVlhGARhspq7XNqG6beg==
To: <rostedt@goodmis.org>
X-Mailer: git-send-email 2.20.1
From: "Rui Qi" <qirui.001@bytedance.com>
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
	"Chunyan Zhang" <zhangchunyan@iscas.ac.cn>, 
	"Guo Ren" <guoren@kernel.org>, "Jiakai Xu" <xujiakai2025@iscas.ac.cn>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-trace-kernel@vger.kernel.org>, 
	"Mark Rutland" <mark.rutland@arm.com>, 
	"Masami Hiramatsu" <mhiramat@kernel.org>, 
	"Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Song Shuai" <suagrfillet@gmail.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26aae0397+346754+lists.infradead.org+qirui.001@bytedance.com>
In-Reply-To: <20260919033726.1361382-1-qirui.001@bytedance.com>
References: <20260919033726.1361382-1-qirui.001@bytedance.com>
Subject: [PATCH 1/2] ftrace: Clarify function graph retp identity
Date: Sat, 19 Sep 2026 11:37:25 +0800
Message-Id: <20260919033726.1361382-2-qirui.001@bytedance.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_203805_027941_15DC1E01 
X-CRM114-Status: GOOD (  11.13  )
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

ftrace_graph_ret_addr() does not dereference retp. It compares the value
against the retp saved by function_graph_enter*() to find the matching
graph return entry.

Update the documentation to describe retp as a return location identity.
Most architectures use the stack return address slot, but an architecture
may use another stable frame identity as long as its graph entry path and
unwinder use the same value.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 kernel/trace/fgraph.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index ed455b53513b..f95e2a9ed352 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -946,7 +946,7 @@ unsigned long ftrace_graph_top_ret_addr(struct task_struct *task)
  * @task: The task the unwinder is being executed on
  * @idx: An initialized pointer to the next stack index to use
  * @ret: The current return address (likely pointing to return_handler)
- * @retp: The address on the stack of the current return location
+ * @retp: The identity of the current return location
  *
  * This function can be called by stack unwinding code to convert a found stack
  * return address (@ret) to its original value, in case the function graph
@@ -959,7 +959,10 @@ unsigned long ftrace_graph_top_ret_addr(struct task_struct *task)
  * will be assigned that location so that if called again, it will continue
  * where it left off.
  *
- * @retp is a pointer to the return address on the stack.
+ * @retp is compared against the value saved by function_graph_enter*().
+ * It is usually the address of the return address on the stack, but may
+ * be another stable frame identity as long as the graph entry code and
+ * the unwinder use the same value.
  */
 unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
 				    unsigned long ret, unsigned long *retp)
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
