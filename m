Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6A8C64E7B
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 06:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB8620709
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 06:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB8620709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yMD39cRiqwWfBAa7gMk3bVuDksaa4FX5+CZXjGdKjIE=; b=T6u0tEv/AOvDSEwqEB+VfAdzd
	tzo1iosMVBv/qfgt/iW0K9QcUVvOAAUsWhK+emCTtk/QY8VEv/PWesFkaXI8mpNnvRVcymAR2yKwH
	etz1hjMy9nuS/xhArOHBXeB9oQxn0TXuS7MQ9kj8tUM50lqPaLQBePfnc+bQ4229xjAlx/6zLRYWA
	TYgujR5Ta7wIFbINsQe28XOyVoRIZEYeyDhFvkXPqIYZ0FnwgX9/BsJMOPNi5EA+3aboP4kKTYZt6
	LwRIYRdCvjIN2C/VuoMfGF9xLEDqw4fGyUkAbltIRzjt1OaipzAQUTWlLip8L8Kl7N7FTXqQWdnB2
	d56Dabo6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkiS7-0001R7-1l; Thu, 03 Dec 2020 06:50:55 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkiS3-0001PZ-Rq
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 06:50:52 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B36noOo099128;
 Thu, 3 Dec 2020 14:49:50 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 3 Dec 2020 14:49:38 +0800
From: Eric Lin <tesheng@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <walken@google.com>, <vbabka@suse.cz>, <peterx@redhat.com>,
 <akpm@linux-foundation.org>, <penberg@kernel.org>,
 <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
 <paul.walmsley@sifive.com>, <hch@infradead.org>
Subject: [PATCH v2 2/2] riscv/mm: Prevent kernel module to access user memory
 without uaccess routines
Date: Thu, 3 Dec 2020 14:48:26 +0800
Message-ID: <20201203064826.30832-3-tesheng@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20201203064826.30832-1-tesheng@andestech.com>
References: <20201203064826.30832-1-tesheng@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B36noOo099128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_015052_318874_55821A4E 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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
Cc: Eric Lin <tesheng@andestech.com>, Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We found this issue in an legacy out-of-tree kernel module
which didn't properly access user space pointer by get/put_user().
Such an illegal access loops in the page fault handler.
To resolve this, let it die here.

Signed-off-by: Eric Lin <tesheng@andestech.com>
Cc: Alan Kao <alankao@andestech.com>
---
 arch/riscv/mm/fault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 0bcfd0e1b39e..00884c1bac28 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -245,6 +245,11 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
 
+	if (!user_mode(regs) && addr < TASK_SIZE &&
+			unlikely(!(regs->status & SR_SUM)))
+		die_kernel_fault("access to user memory without uaccess routines",
+				addr, regs);
+
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
 	if (cause == EXC_STORE_PAGE_FAULT)
-- 
2.17.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
