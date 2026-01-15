Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A10BD44C48
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eL2M122A9goX9STrshrJ+BzHZcPMHl8fTS4UzYwYL6k=; b=kDviSMWopboPhM
	u9qrbZwaaXfB9vOxgrRc41s8b5fQ5pkK5yW28+/YllDcunkKO6fpETWr56NN6eroyLkLT83+UUty8
	lEbUbFeRDGWMWpLjIaKC2jgejsND7cK8T6/OE3aEgLTL8CG7W3g7xZl2b3O/8eOSKiWm+clYXiMCj
	i90rMs/41/7YOR2UPDByeXYL4SiH5lLQGNGeoa1p9uCxwnztINqdfO6x+ewFmPUhU5+3BO6FMbbaD
	yFw8+ONRBmho+zLXl+3d1O73NonhLCgp0bYlvwAoj1UHKNLl3ts4Ogm392XUyLONCg3Ji+VsisLpR
	e7UUlw2Ve8LM3PZxY5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOBz-0000000CTFJ-1vO7;
	Thu, 15 Jan 2026 14:19:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOBw-0000000CTEN-1tDU
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 14:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABBE5409EA;
	Thu, 15 Jan 2026 14:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC355C116D0;
	Thu, 15 Jan 2026 14:19:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2] mailbox: Improve RISCV_SBI_MPXY_MBOX guidance
Date: Thu, 15 Jan 2026 15:19:11 +0100
Message-ID: <056a7d9af85a20633e54602b2c4d2c3bbbaadd78.1768486684.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_061916_507408_594056DE 
X-CRM114-Status: GOOD (  10.49  )
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

RISC-V SBI Message Proxy (MPXY) Mailbox support defaults to enabled, but
the help text states "If unsure say N".

Recommend enabling this driver, as it is a very critical RISC-V driver
providing mailbox channels to other drivers such as clock, system MSIs,
etc.

Fixes: bf3022a4eb119c6b ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver")
Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is v2 of "[PATCH] mailbox: RISCV_SBI_MPXY_MBOX should be disabled
by default".

v2:
  - Change the config description instead of changing to not enabled by
    default, as requested by Anup.
---
 drivers/mailbox/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index e47cb68989267881..c27c1097db21be27 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -387,7 +387,7 @@ config RISCV_SBI_MPXY_MBOX
 	  Mailbox driver implementation for RISC-V SBI Message Proxy (MPXY)
 	  extension. This mailbox driver is used to send messages to the
 	  remote processor through the SBI implementation (M-mode firmware
-	  or HS-mode hypervisor). Say Y here if you want to have this support.
-	  If unsure say N.
+	  or HS-mode hypervisor). Say Y here, unless you are sure you do not
+	  need this.
 
 endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
