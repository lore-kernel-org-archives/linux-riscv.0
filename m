Return-Path: <SRS0=Oyqu=FB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757D7C2D0E4
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 08:41:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB904221FF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 08:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ResSNKWV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB904221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qmtntq24HqQEiBAzpURE15+Cs6VL29bTJcxqYwpXW+U=; b=ResSNKWV84fugHjHQKBIyIYEJD
	9P/exyVmc+YzqL/GjKN13p6v4D9DeGjEvhu095TB5/lktRzYI6yFOpqCNz2X1NOqx0zezrVOaKIR0
	/dKYfOkATFkbwsI403J0zv5dmFapmPjBJRr0E6A2AI/MdVWJJAlTfrjhctgDN3jru5I9R7evhpLvi
	eQapnvjibQq4cofM91lTWpS99GbguZoOLtJJImATyw8BIc1ejxbSraYQ8nrU8MsOYCMd1OPzBInGR
	359Ru5izCT3dMYJ9FjnMPp4LWlch4V9/lGtH+7rbhrtc2MiUs09cLSgbFwHZRZIp4AWd99j3oX09m
	noIxNJbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZJo-0004mw-Ew; Fri, 27 Nov 2020 08:41:28 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZJf-0004jd-Oe
 for linux-riscv@lists.infradead.org; Fri, 27 Nov 2020 08:41:20 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cj7PX5XSqz6vHL;
 Fri, 27 Nov 2020 16:40:48 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Nov 2020 16:41:07 +0800
From: Chen Huang <chenhuang5@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv/stacktrace: fix stackframe without ra on the top
Date: Fri, 27 Nov 2020 08:45:02 +0000
Message-ID: <20201127084502.2133722-1-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_034120_116993_ECE093AC 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When a function doesn't have a callee, then it will not push ra
into the stack, such as lkdtm_BUG() function:

addi	sp,sp,-16
sd	s0,8(sp)
addi	s0,sp,16
ebreak

Then we use pt_regs as a parameter to walk_stackframe(), for the
struct stackframe use {fp,ra} to get information from stack, it
will get the wrong value. And the call trace will be:

[<ffffffe00066c56c>] lkdtm_BUG+0x6/0x8
---[ end trace 18da3fbdf08e25d5 ]---

It should be that:
[<ffffffe00066c56c>] lkdtm_BUG+0x6/0x8
[<ffffffe0008b24a4>] lkdtm_do_action+0x14/0x1c
[<ffffffe00066c372>] direct_entry+0xc0/0x10a
[<ffffffe000439f86>] full_proxy_write+0x42/0x6a
[<ffffffe000309626>] vfs_write+0x7e/0x214
[<ffffffe00030992a>] ksys_write+0x98/0xc0
[<ffffffe000309960>] sys_write+0xe/0x16
[<ffffffe0002014bc>] ret_from_syscall+0x0/0x2
---[ end trace 61917f3d9a9fadcd ]---

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 arch/riscv/kernel/stacktrace.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 595342910c3f..d1d4c18335c4 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -57,7 +57,14 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
 		sp = fp;
-		fp = frame->fp;
+		if (regs && (frame->fp & 0x7) && (pc == regs->epc)) {
+			fp = frame->ra;
+			pc = regs->ra;
+			continue;
+		} else {
+			fp = frame->fp;
+		}
+
 		pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 					   (unsigned long *)(fp - 8));
 	}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
