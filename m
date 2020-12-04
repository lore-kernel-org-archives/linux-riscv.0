Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F89CC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 05:45:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD24224BE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 05:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FD24224BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qcvAt/hAq+9IhzLExmju3dSRjkxAIUrtVZkmd9XQDAg=; b=Zsh3uypR9k0YzNB4nu8YCk7mQ
	uDVse1XS4o7G6524U39QN1l9TgwcVUTx/mojanjfg/oXPur5Bh4B9IOYcG086GJx9CNVhjIsRqRqf
	pQb1CS42SoTlaknaSGlO4/i+usAmzmknvndPdMFVTFz0w3e/LCzliZbW22EbXfHug2/ae/0Dc/TeU
	ZLHU1Brw68EMMYgkEEeHed8D/+vhek3cnu1hPzpQNw+1Kjo1iCsPBYpeIfhZpmkuYsrphN/jLzQkp
	bJdLxmvrggfJx6SlauSqNGf1hmVITOJhqKPhlLAUVXTWtIKWMu0J4veWMNsoLfwJdKE2KXD4ETXyS
	ce3GZbJ4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl3uD-0000rB-Fr; Fri, 04 Dec 2020 05:45:21 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl3u8-0000ns-Le
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 05:45:19 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B45hwMc094282;
 Fri, 4 Dec 2020 13:43:59 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 4 Dec 2020 13:43:50 +0800
From: Eric Lin <tesheng@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <walken@google.com>, <vbabka@suse.cz>, <peterx@redhat.com>,
 <akpm@linux-foundation.org>, <penberg@kernel.org>,
 <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
Subject: [PATCH v3 1/2] riscv/mm: Introduce a die_kernel_fault() helper
 function
Date: Fri, 4 Dec 2020 13:42:58 +0800
Message-ID: <20201204054259.32684-2-tesheng@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20201204054259.32684-1-tesheng@andestech.com>
References: <20201204054259.32684-1-tesheng@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B45hwMc094282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_004517_305559_DDFBD6F6 
X-CRM114-Status: GOOD (  11.76  )
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
Reviewed-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/mm/fault.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 3c8b9e433c67..0d5f06d6e3c7 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -19,8 +19,23 @@
 
 #include "../kernel/head.h"
 
+static void die_kernel_fault(const char *msg, unsigned long addr,
+		struct pt_regs *regs)
+{
+	bust_spinlocks(1);
+
+	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n", msg,
+		addr);
+
+	bust_spinlocks(0);
+	die(regs, "Oops");
+	do_exit(SIGKILL);
+}
+
 static inline void no_context(struct pt_regs *regs, unsigned long addr)
 {
+	const char *msg;
+
 	/* Are we prepared to handle this kernel fault? */
 	if (fixup_exception(regs))
 		return;
@@ -29,12 +44,8 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
 	 * Oops. The kernel tried to access some bad page. We'll have to
 	 * terminate things with extreme prejudice.
 	 */
-	bust_spinlocks(1);
-	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
-		(addr < PAGE_SIZE) ? "NULL pointer dereference" :
-		"paging request", addr);
-	die(regs, "Oops");
-	do_exit(SIGKILL);
+	msg = (addr < PAGE_SIZE) ? "NULL pointer dereference" : "paging request";
+	die_kernel_fault(msg, addr, regs);
 }
 
 static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_fault_t fault)
-- 
2.17.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
