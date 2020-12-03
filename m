Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE813C71156
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 06:51:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBCA20758
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 06:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBCA20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iPjEl2U18akCLe4Oj+eskN8JvTx2H80vzv9ecXQfrf8=; b=TXfKkQb3s+DE0IU0Yig3N5IHy
	jTOLhMEQlqQSSLV/luTJkukLqmtdPmA9Q0f7r+y+gZ1f0uFs2/MxqQwCMZpj7pKGmI5VVAENJlCAc
	KxQKEE5+2fJ0Z2aZnIfaJpxgFG+zsJe+0b8HAH6FRfeACKHEFulUbdQbLqH4SA7JrtXUysh128KmI
	Mz3a0KbwVAEt4tM5TAJhcCDsPM7MrcFzlxk2Of+Vgz2pXQhfnFOPO10LdiF9Jf5aLJE3jiwQPJNbr
	/ppAGzsth7PSLWvfBtIgHyOL+A1PlkzfLOsR2GVAXReWKk9qUJVqHauPxBwpYSWvDBRTMVWwcKpf1
	ya+fHbXVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkiS7-0001RP-Ty; Thu, 03 Dec 2020 06:50:55 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkiS3-0001Pa-Rr
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 06:50:52 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B36njXT099106;
 Thu, 3 Dec 2020 14:49:45 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 3 Dec 2020 14:49:29 +0800
From: Eric Lin <tesheng@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <walken@google.com>, <vbabka@suse.cz>, <peterx@redhat.com>,
 <akpm@linux-foundation.org>, <penberg@kernel.org>,
 <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
 <paul.walmsley@sifive.com>, <hch@infradead.org>
Subject: [PATCH v2 1/2] riscv/mm: Introduce a die_kernel_fault() helper
 function
Date: Thu, 3 Dec 2020 14:48:25 +0800
Message-ID: <20201203064826.30832-2-tesheng@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20201203064826.30832-1-tesheng@andestech.com>
References: <20201203064826.30832-1-tesheng@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B36njXT099106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_015052_403391_E03766B4 
X-CRM114-Status: GOOD (  10.34  )
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

Like arm64, this patch adds a die_kernel_fault() helper
to ensure the same semantics for the different kernel faults.

Signed-off-by: Eric Lin <tesheng@andestech.com>
Cc: Alan Kao <alankao@andestech.com>
---
 arch/riscv/mm/fault.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 3c8b9e433c67..0bcfd0e1b39e 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -19,6 +19,19 @@
 
 #include "../kernel/head.h"
 
+static void die_kernel_fault(const char *msg, unsigned long addr,
+		struct pt_regs *regs)
+{
+	bust_spinlocks(1);
+
+	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n", msg,
+			addr);
+
+	bust_spinlocks(0);
+	die(regs, "Oops");
+	do_exit(SIGKILL);
+}
+
 static inline void no_context(struct pt_regs *regs, unsigned long addr)
 {
 	/* Are we prepared to handle this kernel fault? */
-- 
2.17.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
