Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCFDCD4851
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EOIn+amkLmOwVXCURBTNzfrkbE/Xcpf3p2ie8lKLpDM=; b=NdVQweIE0VUQtB
	WU69emzyLFLvU8sUa53CZHbDuAwj1Mx/Trmka1g0ewvUQtkWXYBWcdQGYEnCjN0Kpb5DjVn0+3nDR
	j1zvbaNeC2enuZYj1axhgoei6+TzpsflgsnqakJLHQ7qZ9UEleqrDdLF14i6cKgOgwWHGmOcczvYZ
	ZRmUU/YRlmhYuR+bwaQuxKzwwNqeipSWniBOkKrKxXPfRDaNmeNpn1nc/09uZJIMswxgomVGV/m5S
	WWuOnRIJhIzde+z/P43DMkXr5BMGZIKSbqeDivZTUuYiG7A7qzQHcoLFF8AffagXb+uKpway/Q2RE
	mgxvXYGgIC/rLdRkCXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZ6U-000000065DI-1wY4;
	Thu, 14 May 2026 16:40:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZ6Q-000000065Bm-3T3q
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 16:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B35144270;
	Thu, 14 May 2026 16:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE565C2BCB3;
	Thu, 14 May 2026 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778776799;
	bh=Uu8LgHeTvuBSkg46HGL1uzGanUNqMH+ybOhQ0yJ7ZcM=;
	h=From:To:Cc:Subject:Date:From;
	b=u7r0o5hm/RgDFmoq9cOUpZyvqIBPO1SefinkqwdT/Ih1IF5rfKCSyV74u/wc6eANU
	 jawb81Xs1etleaKDIljvFZWkGyZkQsufDFQSbeEVi45MqjFc9qFRwTJvIyb7tEuIz5
	 gd1ee+4mhJ2jjQLZ1sO2GB1PeFu8k5xav/trts/t0mvNpZWCiSDl/0+V3GQpE9ovmp
	 RaSRud4/P0LzSKpVtlimH1rfdRuzi1D4CMt9eaamEtxk9cMG4bMFlgRZg+cOpbt0fL
	 ic9NOurZqqLudKDhx9c/fgJF7jO/qtssqX8NtrXXYTwnnkXzbat238Cfk4+DEUOtiF
	 d0HSHXUmhD//g==
From: Conor Dooley <conor@kernel.org>
To: jassisinghbrar@gmail.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v1] mailbox: mpfs: fix check for syscon presence in mpfs_mbox_inbox_isr()
Date: Thu, 14 May 2026 17:39:51 +0100
Message-ID: <20260514-reopen-purity-0e8914bf3c51@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nZN8rv3keeoKA6RSwvYbwGD0yvX+d5JBkA0LYCAO2eM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFmsv24k9nlEBL2e8frGnUgPfjlr9dMpRVPvJy+WimguW ffSw3lqRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbC5MjI8H7D7qnHt//P7Hsj +yPHecOZEx4yL+6tMJqu+aTxq/8tcxdGhqXctd+jE1ac2tXpUz3XJXnn5F3OswxmaLFas5f8CHi +hAkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_094004_206114_5B7552E1 
X-CRM114-Status: GOOD (  10.00  )
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

From: Conor Dooley <conor.dooley@microchip.com>

mpfs_mbox_inbox_isr() writes to the sysreg scb syscon, not the control
scb syscon, but checks for the presence of the latter. Ultimately this
makes little difference because if one syscon is present, both will be.

Fixes: a4123ffab9ece ("mailbox: mpfs: support new, syscon based, devicetree configuration")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com
---
 drivers/mailbox/mailbox-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index d5d9effece979..ef40fe2be30d6 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -201,7 +201,7 @@ static irqreturn_t mpfs_mbox_inbox_isr(int irq, void *data)
 	struct mbox_chan *chan = data;
 	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
 
-	if (mbox->control_scb)
+	if (mbox->sysreg_scb)
 		regmap_write(mbox->sysreg_scb, MESSAGE_INT_OFFSET, 0);
 	else
 		writel_relaxed(0, mbox->int_reg);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
