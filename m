Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D138CC71133
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+PVKZEclBBem4oh+NIQUo6C7cnTVKVFK//mdqarUj0=; b=nAzdRGErBxW/Jd
	4h73ze2OqfwKSb5gh5LJoBb5zUonn2TLT/TiqQjaut5qvmOL+0T0ADv4aOXyj2Ka92ZaSbtpt0AFA
	nRcwX/+Wqg2YdN/xmFnr0ZU7lJ35pFq0wIdrgib1J8VCCekMpt6OAV3CfaWhmUfOToUTBm8hwC3fn
	tm3BGRYLvVYO9Pe4Fpb9i06t/1U22kwmghaGh9JfkOR0eC7nl4Lu9xpyvaCakZ6FWF7XvyjgmRdjn
	Gz0GltimZL0kerGUGnHSJsCYNszuwAE+G5xeAUsmPCE5/KPFV0FW76hNU0hXVwyqjePvKDiwyva21
	G5y5w5S24/r9oUSibcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwer-00000006Xz5-2Fos;
	Tue, 10 Jun 2025 10:56:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvWZ-00000006Ndr-0oLF
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 09:44:08 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749548645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eh7rmA0Cl1o4yt9TMnFteZzX4SWFzi/ZV4bMT0NRh8=;
	b=r3EMHvmuPzv/YMdohLDmR/hjxPR/GlwDwL3UPD4gNFVzuSgkzKI0qRKNSlQ+Sa90qUMrtm
	kKGg5xy3VZp2OGtfp+U9SgsCCLJw+uiuCmVcioZz5cJpj2ASCWqNSLl6UYrtW/lKBBSfy9
	KS8QCyVV9JDgzLkMhqfy/8r6ELPZG5NjF1zpFeys02AJmL0njPHfvGsvYchlKrZe2gN+Nc
	OEI7Tk+raA0CAiN8MbDstooiHWpLH2O2ezSO3or4SBPnl6iej5OVX+mh4dK8zjZ0EwXbAn
	yB1AmX1MgDJGSbkdxrW+Yn9IqR2ZhAaHuZ7hVkJdeqqcdDCYeNBS8oEFq4m6ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749548645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eh7rmA0Cl1o4yt9TMnFteZzX4SWFzi/ZV4bMT0NRh8=;
	b=2jwS4cz8nw4DchmIN4TEbdrF9IqQm7u+oo/JEI2Hw/knR2SL0uqXrebvfeA8aRNOyYRppT
	FPGZUepQoVANPXAg==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 15/19] riscv: mm: Add page fault trace points
Date: Tue, 10 Jun 2025 11:43:40 +0200
Message-Id: <8ec7721c8c300ee99d5ec0782558c7689b7ec203.1749547399.git.namcao@linutronix.de>
In-Reply-To: <cover.1749547399.git.namcao@linutronix.de>
References: <cover.1749547399.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_024407_371661_ABD2DB38 
X-CRM114-Status: UNSURE (   7.25  )
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

Add page fault trace points, which are useful to implement RV monitor that
watches page faults.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/mm/fault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 0194324a0c506..04ed6f8acae4f 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -20,6 +20,9 @@
 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/exceptions.h>
+
 #include "../kernel/head.h"
 
 static void show_pte(unsigned long addr)
@@ -291,6 +294,11 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, cause);
+	else
+		trace_page_fault_kernel(addr, regs, cause);
+
 	/*
 	 * Fault-in kernel-space virtual memory on-demand.
 	 * The 'reference' page table is init_mm.pgd.
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
