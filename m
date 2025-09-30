Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72956CCA468
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yVVPwFKIvvzDoLb2ZjCBVOVIhoaI6KG6wFJfse/Tuos=; b=NPdxlit1zXKkM8
	Eq4I4rS3lYJXBJ9UNThj2YUsAtzfSYbIg0sRGVz4yjcN0gEL+5/6AaP/ai4h54BIrwq68+wxqKFGs
	LSY9V7kRq1IC625PR0xyQEEO16dFbO8mCeDkQDtC1lHwCnGnl3Q+9yf1lfzOL6JDSfiWmBOUr6YSU
	SSqF502Yn4biGO0E3bzWfOKtil72M1kcI/PV/7XDdT71DvIHl2LDVQuLXye70xgL5xJjP7MWWmwwg
	Jlp0kkT8u78y4IGAP7kM3ppiPy7Ry8/naDkKHazkRVnXeApk3oudxaFonceJPN/rtbF6SqotaekOI
	FuS9XShYMYkBhbCxHXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3beO-00000005Y2L-2lWM;
	Tue, 30 Sep 2025 14:48:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3beM-00000005Y1i-2VKh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 14:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D45D241895;
	Tue, 30 Sep 2025 14:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3145DC4CEF0;
	Tue, 30 Sep 2025 14:48:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mailbox: RISCV_SBI_MPXY_MBOX should be disabled by default
Date: Tue, 30 Sep 2025 16:48:12 +0200
Message-ID: <c458915ba9a4d1ba3413232206c88fcffbf832cb.1759243480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_074818_655208_76911E3C 
X-CRM114-Status: UNSURE (   9.50  )
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

The help text for RISC-V SBI Message Proxy (MPXY) Mailbox support states
"If unsure say N", so the driver should not default to enabled.

Fixes: bf3022a4eb119c6b ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mailbox/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index c488725aa2a5d4b0..acc4bd93136cb720 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -372,7 +372,6 @@ config BCM74110_MAILBOX
 config RISCV_SBI_MPXY_MBOX
 	tristate "RISC-V SBI Message Proxy (MPXY) Mailbox"
 	depends on RISCV_SBI
-	default RISCV
 	help
 	  Mailbox driver implementation for RISC-V SBI Message Proxy (MPXY)
 	  extension. This mailbox driver is used to send messages to the
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
