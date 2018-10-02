Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA2EC64EBB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 488D82089C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cHw+9JCJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Ebdn3nsc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 488D82089C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vyvOlgq5nzrYfSsjoha6yPcO2yWCgPcfOaeYUC9UWjI=; b=cHw+9JCJwaTJiyvVXvAJ1rKzWP
	xeOUQBqOYtULnBSY0DgYIX/4vgEYC+XP5/dB3briOmOmPcFV/0VmmwGf2933egzlFgZzeXUad5qL2
	6AiO7X0FVW+4lhSacIJMscr+D6Q2CsaM8pJv5gQ+oIcPpvEKIrwnMCQ8bbgG+OJiab1QQo9KKzlwL
	QroCm65SVM6L/eGcggXGhEvWsbOw9MpshrMHZ+5AIKbkBP99BEtP5LS2UiYnp8Qbt6TXniRdei5YV
	/bANkDXv0R34Jc8gkrtCC7LpUAzSMCf20GtHS21hjdymJNt/I0FQOPc0mX/ga40vu4vjITIVCtRQl
	bSnYUBug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q99-0005yp-9s; Tue, 02 Oct 2018 19:15:51 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8p-0004mL-QW
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507732; x=1570043732;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=YFrlU3OmqRZtyf8NLoWNxfiOD2AxshO648ddxoKLstQ=;
 b=Ebdn3nscxRtt0LI78+z3LMWeKDjb5HEcB/cEtOC6rNa0xO3E+owVrEa7
 yaXKpfvLL54Hx2jaKzQDWM2VaThtBf3U2XdvxbFNn19CmhTiTqKx7FkRF
 aTyK2S+6D7c/gEv92GttCEbyxeD6LXi8bJgNkBjpfNGfkZDdsTCrm05tJ
 eZunzTDjbPPfNeLtrRlvzEGJ/tZ4XVdOHzTGmwXM7QbkJwuqncOzIxAjx
 A08X8UISXoUAcCPLVE9F1Q/kpgQTkAqeDChORR2SpjKt4Bxm5hxAdsLSm
 YrKOfvn4cYU9paYyUMSEcHMWUfqrZpJQBEugTr7v3KvxzyOaSb6MYif2c w==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732908"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:51 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:10 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 09/14] RISC-V: Use mmgrab()
Date: Tue,  2 Oct 2018 12:15:02 -0700
Message-Id: <1538507707-22299-10-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121532_071429_F7B158B8 
X-CRM114-Status: GOOD (  12.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, anup@brainfault.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002191502.byOvohPksolWFN5ibUn7TKqwVj9rYmgkbNtn3oWnEVA@z>

From: Palmer Dabbelt <palmer@sifive.com>

commit f1f1007644ff ("mm: add new mmgrab() helper") added a
helper that we missed out on.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 4a232600..17e74831 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -30,6 +30,7 @@
 #include <linux/irq.h>
 #include <linux/of.h>
 #include <linux/sched/task_stack.h>
+#include <linux/sched/mm.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
@@ -101,7 +102,7 @@ asmlinkage void __init smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 
 	/* All kernel threads share the same mm context.  */
-	atomic_inc(&mm->mm_count);
+	mmgrab(mm);
 	current->active_mm = mm;
 
 	trap_init();
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
