Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF471D70DF2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fImycT2q1W+hFxjBktJVYWRDAPDptvcQg8oAzMfYY1c=; b=K8d0fbRqQitFDh
	z2Ej5nfiAEgU/4Xw6LXP205Xv6qgAJO8yBq7FV0OtRlnTH4AbZDqrPczuzEhPhnXEcxal73oA8DJ2
	2b4g9DHnJzTlRYoCZ8XXnl2wNH+gtwy2c0QTUr8Z6kKKwX6CaMLyfl86gy0OczHnemafxURgRv6JP
	60w9ccar4vC7wjoyrNq9geT1Z6JLCNnGDqpYHE7mGC32AxhmUW5sLLQGo2roq3GQvu0VPxl9KbLh5
	8L+tToVlLHeD/3J7+EChlY5jIQuCAG3iuif6JsoQw4UAgyAqbeYE8UWP2fw9s6PndMUrwTCw/lsm2
	N3xaxSnNURR4m7s7cHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJRi-000000094FI-0q6g;
	Thu, 18 Dec 2025 19:13:54 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJRg-000000094Dw-1Vqy
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 19:13:53 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vWJRU-000RlX-0O;
	Thu, 18 Dec 2025 20:13:40 +0100
Received: from localhost.localdomain (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 18 Dec
 2025 20:13:39 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <linux-riscv@lists.infradead.org>
CC: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, <daniel.weber@cispa.de>,
	<michael.schwarz@cispa.de>, <marton.bognar@kuleuven.be>,
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
Subject: [PATCH 2/2] riscv: Sanitize syscall table indexing under speculation
Date: Thu, 18 Dec 2025 20:13:32 +0100
Message-ID: <20251218191332.35849-3-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251218191332.35849-1-lukas.gerlach@cispa.de>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-FMZ-05.um.gwdg.de (10.108.142.64) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_111352_395730_694EFEA6 
X-CRM114-Status: UNSURE (   9.39  )
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

The syscall number is a user-controlled value used to index into the
syscall table. Use array_index_nospec() to clamp this value after the
bounds check to prevent speculative out-of-bounds access and subsequent
data leakage via cache side channels.

Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/kernel/traps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 80230de167de..47afea4ff1a8 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -339,8 +339,10 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 		add_random_kstack_offset();
 
-		if (syscall >= 0 && syscall < NR_syscalls)
+		if (syscall >= 0 && syscall < NR_syscalls) {
+			syscall = array_index_nospec(syscall, NR_syscalls);
 			syscall_handler(regs, syscall);
+		}
 
 		/*
 		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
