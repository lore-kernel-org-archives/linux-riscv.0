Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387CAC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3ohQsk+KjUlC1Mgnsczlc12vOY0c5sLTcNNm1hkaSQ=; b=1cNMkXqwWms7OS
	kjDICnMEshZOXiWEbIIkzg7xJt4MOI9VU49VaODzWdwACuFjIwQ0CIPzsFMVnUJO15uPX+lw5Bu9+
	9YGN8Ixu4Lg5GjI1aIEs09PJNYMlPpFlqvK0muHelNgCXZy9uI7N5M+9D8UmFyJvi7jMkEwZ7PGNc
	4IBkbGoKUhpqa5A6Qc9RKdw/NhDFXHEy39ycRhADeR5UQeyvEqjnNoteP95LzqbNLgNPjoJp6eWhj
	4JgEvfi0eAhIWbPSH1xTue9DeBcdBsbFMCil0U3FK+TgBKXExFO6fw6wrZZc6m2Cj1dWV4g1U26G1
	pfinAY5v1Ymzrolvh2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTIit-00000006fD8-2xL7;
	Mon, 15 Jul 2024 10:14:24 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTIip-00000006fC9-3Xzu
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 10:14:22 +0000
Received: from ubuntu-2204-dev.. (unknown [180.110.112.93])
	by APP-05 (Coremail) with SMTP id zQCowACHjeVp9pRmxFxsAw--.40406S2;
	Mon, 15 Jul 2024 18:14:02 +0800 (CST)
From: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Zhu Hengbo <zhuhengbo@iscas.ac.cn>,
	Suren Baghdasaryan <surenb@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add tracepoints for page fault
Date: Mon, 15 Jul 2024 10:13:55 +0000
Message-Id: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACHjeVp9pRmxFxsAw--.40406S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF45Gr18ZrWrKw1rtw17trb_yoWrZr4rpF
	nFkF95Gr47Xwsa93yxuw1qyF15AanYyayjgry7Gw4Yvw4IqryUAws2vrWDtryxGr1kGFyI
	9F4Yyrya9w15u3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUwr
	WFUUUUU
X-Originating-IP: [180.110.112.93]
X-CM-SenderInfo: x2kxxvpqje0q5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_031420_303162_3DC35F7C 
X-CRM114-Status: GOOD (  13.49  )
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

Introduce page_fault_user and page_fault_kernel for riscv page fault.
Help to get more detail information when page fault happen.

---
Simple test go below:

root@riscv-ubuntu2204 ~ # bin/perf list | grep exceptions
  exceptions:page_fault_kernel                       [Tracepoint event]
  exceptions:page_fault_user                         [Tracepoint event]

root@riscv-ubuntu2204 ~ # bin/perf record -e exceptions:page_fault_kernel -e exceptions:page_fault_user
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.091 MB perf.data (19 samples) ]

perf report tracepoint:

perf     826 [007]   894.795520:   exceptions:page_fault_user: user page fault, address=0x7fff95af4400 cause=0xd
perf     826 [007]   894.795970:   exceptions:page_fault_user: user page fault, address=0x7fff95a73400 cause=0xd
perf     826 [007]   894.796738:   exceptions:page_fault_user: user page fault, address=0x7fff959f2400 cause=0xd
perf     826 [007]   894.797088:   exceptions:page_fault_user: user page fault, address=0x7fff95971400 cause=0xd
perf     826 [007]   894.797273:   exceptions:page_fault_user: user page fault, address=0x7fff958f0400 cause=0xd
perf     826 [007]   894.797445:   exceptions:page_fault_user: user page fault, address=0x7fff9586f400 cause=0xd
perf     826 [007]   894.797998: exceptions:page_fault_kernel: kernel page fault, address=0x7fff95870000 cause=0xd

Signed-off-by: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
---
 arch/riscv/include/asm/trace/exceptions.h | 60 +++++++++++++++++++++++
 arch/riscv/mm/fault.c                     | 15 ++++++
 2 files changed, 75 insertions(+)
 create mode 100644 arch/riscv/include/asm/trace/exceptions.h

diff --git a/arch/riscv/include/asm/trace/exceptions.h b/arch/riscv/include/asm/trace/exceptions.h
new file mode 100644
index 000000000000..a9a68d471703
--- /dev/null
+++ b/arch/riscv/include/asm/trace/exceptions.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Tracepoints for RISC-V exceptions
+ *
+ * Copyright (C) 2024 ISCAS. All rights reserved
+ *
+ */
+
+#if !defined(_TRACE_PAGE_FAULT_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_PAGE_FAULT_H
+
+#include <linux/tracepoint.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM exceptions
+
+TRACE_EVENT(page_fault_user,
+	TP_PROTO(struct pt_regs *regs),
+	TP_ARGS(regs),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, address)
+		__field(unsigned long, cause)
+	),
+
+	TP_fast_assign(
+		__entry->address	= regs->badaddr;
+		__entry->cause		= regs->cause;
+	),
+
+	TP_printk("user page fault, address=%ps cause=0x%lx",
+		  (void *)__entry->address, __entry->cause)
+);
+
+TRACE_EVENT(page_fault_kernel,
+	TP_PROTO(struct pt_regs *regs),
+	TP_ARGS(regs),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, address)
+		__field(unsigned long, cause)
+	),
+
+	TP_fast_assign(
+		__entry->address	= regs->badaddr;
+		__entry->cause		= regs->cause;
+	),
+
+	TP_printk("kernel page fault, address=%ps cause=0x%lx",
+		  (void *)__entry->address, __entry->cause)
+);
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH asm/trace/
+#define TRACE_INCLUDE_FILE exceptions
+#endif /*  _TRACE_PAGE_FAULT_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 5224f3733802..22874074c5bc 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -22,6 +22,10 @@
 
 #include "../kernel/head.h"
 
+
+#define CREATE_TRACE_POINTS
+#include <asm/trace/exceptions.h>
+
 static void die_kernel_fault(const char *msg, unsigned long addr,
 		struct pt_regs *regs)
 {
@@ -215,6 +219,15 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 	return false;
 }
 
+
+static inline void trace_page_fault(struct pt_regs *regs)
+{
+	if (user_mode(regs))
+		trace_page_fault_user(regs);
+	else
+		trace_page_fault_kernel(regs);
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -235,6 +248,8 @@ void handle_page_fault(struct pt_regs *regs)
 	tsk = current;
 	mm = tsk->mm;
 
+	trace_page_fault(regs);
+
 	if (kprobe_page_fault(regs, cause))
 		return;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
