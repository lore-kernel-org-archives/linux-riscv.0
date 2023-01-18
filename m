Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ED9C38159
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=92mSfufXRyxeqONynrvoTjY1PG805IQAkyQKi+qWFw4=; b=e9ADPZl11qGp2q
	XbNDbNG8r54xbnCqr2hZrmF4QNgu0QnVo9nwcM+ySRuCws3o3XIOy8rIgy+lL+wS4FXHw3wQMNAJ/
	AkjE/wHgnkh+IP0HdBFfoYRIJN32fMR74pzD4XQiCnN3DDAYD+jMtZJgU9Buj5Hq4pUX3AeVxQjAx
	Wifk7H9c5APl5MXKKyOPKXETtsfFJG35trbYr1tVl2oO+fifrkc7CNpEy86ipYC+1v9ouHoKX0j3B
	Lejb9OmUXQpRMYsTXltW14oKD2JXZkIEpiKtsf1O36Tct/xLeZofu/XbZdVG3JfswfYS4K64sXBNL
	xUym2qquY1XjCbVzhTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9LC-001JN0-Nf; Wed, 18 Jan 2023 14:23:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9LB-001JLj-1h
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 14:23:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pI9L4-0000RK-Mn; Wed, 18 Jan 2023 15:22:54 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	philipp.tomsich@vrull.eu,
	heiko@sntech.de,
	abrestic@rivosinc.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH] RISC-V: Fix do_notify_resume / do_work_pending prototype
Date: Wed, 18 Jan 2023 15:22:52 +0100
Message-Id: <20230118142252.337103-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_062301_112741_92D3DF88 
X-CRM114-Status: GOOD (  10.98  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Commit b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to
userspace slow-path") renamed the do_notify_resume function to
do_work_pending but did not change the prototype in signal.h
Do that now, as the original function does not exist anymore.

Fixes: b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path")
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/signal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/signal.h b/arch/riscv/include/asm/signal.h
index 532c29ef0376..956ae0a01bad 100644
--- a/arch/riscv/include/asm/signal.h
+++ b/arch/riscv/include/asm/signal.h
@@ -7,6 +7,6 @@
 #include <uapi/asm/ptrace.h>
 
 asmlinkage __visible
-void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
+void do_work_pending(struct pt_regs *regs, unsigned long thread_info_flags);
 
 #endif
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
