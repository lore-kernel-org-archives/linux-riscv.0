Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40366C624D6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntaeg4m8djuCdSSiIAB/2OwnA1E3TGDqd89M0IJZHdA=; b=UsguZqXAXwX62W
	pir45RGYctOzU4IBFd1dYscWZF/ucZDfXAEjqqsvIfbm1/27MHO1xyf/NZjOVsOdTt8JMrfTjtG5Z
	vnwZ92WmZnOdQFJ7jb/oCAW2/YZxUXB9/xH1Tyx/nNXhiX67VtVVg8arzxWkB1oIQCTL27ccm9bne
	O74IrYdWL9t6TQreJKVTSWpmjG44X+7EFuhCs01CI8ewsScMeSB9XA4L/5M/lB0glaYIOGlT6vfcf
	kRG2z3jNvlDD+olj+oUEmfkShNjOO0QFSEZlzMPJ/brVTHLtkMTGax9QAquXV1DocxSlojubet0WK
	pfgYWaapZSTOcUwXOnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fy6-0000000E0vC-2c1k;
	Wed, 02 Sep 2026 08:05:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fy5-0000000E0ud-0rjJ
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF2AF4477F;
	Wed,  2 Sep 2026 08:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C15C1F00A3D;
	Wed,  2 Sep 2026 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336312;
	bh=POmWOknNtTO/bFj1tOVGoSaF82mOopdrhB/HoyO6q9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FcV1fCpwLiSaXYRxlMf0DXaT7DyJ70mcfwu32BA0GH1LFj1LOgK1L76JUQbcJ+N7D
	 V2DztpwkbYO9VAuqt0WTzmgdgUdV4gkms4uXlIVa160uKvzbLUlHY02qu1/4a5bxje
	 ZnG8vACEEV4U1wIxCWzaW2lF4MV2rKDx4tBB6SQDciw3o5sQmW1uyScogYsH/qowo3
	 ByqHGIxdUQ1SIfeos81IrpoAlLFT/Eaf1TUD0d723YgarGJspp5qN0n2mFQAVirn2L
	 SnWiCd9JpDrVwpdGQlUhAqB8eQ4s3wwl62eT+WbCJGlEb7IRQoEMBc9zjXbSVe/e6v
	 eDoK+ycsWh5DA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 02 Sep 2026 08:04:27 +0000
Subject: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
MIME-Version: 1.0
Message-Id: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
References: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=dlan@kernel.org;
 h=from:subject:message-id; bh=fxIltcJX5Uwnq3dNxRUoyfBOhLTw8pBZO1fExcD0Xrk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBql9iknDWofrDWeNlh+AiDVUT/uohKMRltmkQ7G
 tU5ZNSEZ0SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCapfYpBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+18jw/+IsClSoXL1iuwryIUbeeMdJqr3eSUcezMiUhCiVZ0ulvN0d4jGikzk
 LGs1uxoCBN6kqD6Xy7RB68+0TJ22sjvPxDQlDKevgZsa1XlYq3G9cfFYAroiXtHkZyJ9W9Tw6Tc
 nB4Yr434vzRuC+ZHzAb+41xSpSoU8Dlg3DzTzfCcj5eTyQniYO3H5p06JXcjbGUaMg2b3VcSy1E
 PQUxskHTxOgSruQkNOlx7roPoJm6OtlWb8wUHMV8M8tEyLotUNRnSzIUlbUHnkquOfQp62MiBq0
 8cWutal+oIrM0uUAe+dcO8PDBT2Ylyb/poaWr1/Dd5FpCGGDeGhEXWGpOJBKlpl+4DHd/xLJqHn
 jD2jYPEDPegn1p5NH91PB0V0trnlc5nRfDrby3JqeJbgp5WsxAev8Utp+STggeGnXoSYMtIgM94
 QjMcJxh1It7LBNvsoUnrM0f1DtForTLocQeqT3mu1Uss8I1oRaWFl6Giz7woaOX4uq2HaFmni0c
 CpDhaNMTuTUnpmzZ3CGnJlo3FiWBahQGMrNI8HIjiFTW/KTa2vl5soHX0ZGkVzFQEqm9yBFftPQ
 VBofRkEQvNOVpICPCVt163ZlL44TSD2rWSDLTZncdDUlYWLi8Ahn/GwZtdoovTbz5iT2d4nF+fA
 RQVAFG9Nnrivu/lw0zZx0pWre2byxY=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

From: Long Wan <long.wan@linux.spacemit.com>

Raise the minimum delay codes of RX tuning window from 3 to 50, to more
accurately retrieve a valid configuration.

A window of 3 codes wide leaves no sampling margin, which will result
tuning tests reporting success on a configuration that drifts out of the
window under thermal or power variation.

Fixes: e9cb83c10071 ("mmc: sdhci-of-k1: add comprehensive SDR tuning support")
Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 257c954ce587..a07e7db0853e 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -314,7 +314,7 @@ static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 		max_pass_start = current_start;
 	}
 
-	if (max_pass_len < 3) {
+	if (max_pass_len < 50) {
 		dev_err(mmc_dev(host->mmc), "Tuning failed: no stable window found\n");
 		return -EIO;
 	}

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
