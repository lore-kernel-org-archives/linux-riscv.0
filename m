Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8675C3ABD8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+ACWsXCkiDeyo6TelcYgJcCwcMzTGiAqhwJTb2etqg=; b=dNoAe6oDv5GCbt
	OL+wWyCMvaXG/ht++Trew2arCs8ztf8dNqh6STLKfgz8QvHBjVRQucKWpBN8y8ee8qbOD86dEBNpS
	+AQoZZeQK9saXK9oZPkEnVYpJQBZ7/P3xCY7LeYceCDhmAeOJuMeKZkhicdkY2gEQwdjjThTojbqq
	zFMQmpsxBltaB0nKXywtvTriDkiVMrLIUTSv4L4kf9KKcTTxgp7b0M4Rwn0cTg7J/PnX2OE3qirc0
	tVXaWw261P7q1RyP58h0WrfgFuh9ljxigx9qNpSooHImJivA9n7z9Npuz/rbJ2YVZNvzKJF/NVpXQ
	E0z6AJXOJ1vo8Pa1pacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxp4-00000008oQU-05ro;
	Mon, 19 May 2025 10:34:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxj0-00000008n4v-1NhS
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 10:28:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747650481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEiJP+aIWUlbRLvwbDSCG6IN+IdxLBx8kvf+B1WoqyY=;
	b=Hvk5Q2g/wL6Wqiy3SIm9MZuGOQ2ZZYmgXKrOKMRrxuFZ2af8+CP79RVyfQ1ybsGFUSD4fu
	U6ne2iM2Xeff3/5E219bNqCFW3pD5/M1OQgvUxENogQKkVVYzbZ0ebot+V8K35jSfYBtL1
	yf62Sb3U3+ytxfX2ZUWCs8M+UMiMPEqBGpa+AC13LvIfVG3lAyowIMu7fvCTInQbSgIDhp
	YrLSiKAl9Fn1aIbvy0BaDdaxJQ3vYZxWY/tC2N5TIeESwsImFBajQc8YvX1mBvlkfVjIip
	7FsV1Yu3RYauLGudpTIYWMrlP7943v2ak37vTMlCBO9MV5NxyQPvEixiUSjWag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747650481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEiJP+aIWUlbRLvwbDSCG6IN+IdxLBx8kvf+B1WoqyY=;
	b=zFEzhtpHsZs88fszWxLk8SWpPXz/ZZhmfZc518QIwQ3VfnRzh+zA2Xf4SACearnCuZCJ0p
	gZYFTRl0sPGnIIBw==
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
Subject: [PATCH v9 18/22] riscv: mm: Add page fault trace points
Date: Mon, 19 May 2025 12:27:36 +0200
Message-Id: <f723de2597ed0dd4ab75e31de36a3932e2848ae3.1747649899.git.namcao@linutronix.de>
In-Reply-To: <cover.1747649899.git.namcao@linutronix.de>
References: <cover.1747649899.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_032802_518277_56E33F10 
X-CRM114-Status: UNSURE (   7.41  )
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
index 0194324a0c50..03b048108896 100644
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
@@ -288,6 +291,11 @@ void handle_page_fault(struct pt_regs *regs)
 	tsk = current;
 	mm = tsk->mm;
 
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, cause);
+	else
+		trace_page_fault_kernel(addr, regs, cause);
+
 	if (kprobe_page_fault(regs, cause))
 		return;
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
