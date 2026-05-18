Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C015CD4F50
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 02:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeGEKdyP0uZIhhuhJbrQdga31e6rGU3ld0tK0W8PynY=; b=ekXuVhaaHiOseW
	aOfFTbQOf47v9UTUz/GZkuZZirmXS9PSeTGoOGk5s2YGX44nLqY+IdKUC3h0icpk/rhuPacYSIkeA
	HijTjz1Zx1aVtkOP4tflI2l0YKQNljFrO3KU1mWWnNZq7WBIhKt2MFYynB/V+m6ly1gRksN32JuLZ
	JRmGxe+Btx7MlgiD+e0tPQ9sgCr6rZvX9Ms6RNaZ+Ha0MP0gdrwrIuOXRqMu4ySJ17+hPVb+8N2Wn
	52dR+/jMxj7KefeKhX3xcT0bbmwse9LkN1vXLOIxDaWto7WrJU5LdBFbU56LpxTI4KtSSmtV+vFhv
	vpmhDskTa+xlok4jfonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoC7-0000000DzaR-3EjP;
	Mon, 18 May 2026 02:59:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoC6-0000000DzYz-18oE
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 02:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6436601E3;
	Mon, 18 May 2026 02:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760D3C4AF0D;
	Mon, 18 May 2026 02:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779073141;
	bh=XxdEmKf8DS55rZAzMNuHJSIOWTeQpZR6aHl3tGKnq/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Da7WudO0HE8s5xqa86YcxMA9/x7IAUwGlSaK0AaQir+YkB7pWy3FxMIknQwbh6NVT
	 P619raV3EuOdXwk5LDDXPRg1VqDv7kp9m87Q405ZoBUDSbAH3VgQ+qezNfSlfPQSPQ
	 OuvyjYv5TOThVod6MIzGLRsKZQIZ/GsGN4VytgU4pdLxnO07khgXDjHuKytax56Kly
	 O5wCjgX0oikGz1Mv7QVIErECbERVa8bQYs9pO0rmvAlrrenHozVla61gr16FGnzIkG
	 cmUQxwOD/eB9WT+72usczdbXHtzC8LptC+dXfnOyjhpECLxni57uE/NM5oLswnSzSw
	 jgLJSge3637KQ==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 18 May 2026 02:58:37 +0000
Subject: [PATCH 2/2] reset: spacemit: k3: fix USB2 ahb reset
MIME-Version: 1.0
Message-Id: <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=dlan@kernel.org;
 h=from:subject:message-id; bh=XxdEmKf8DS55rZAzMNuHJSIOWTeQpZR6aHl3tGKnq/A=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqCoBqIyhwbnCf8GhDiubAMBbGYAuQ7egUVaHEG
 AGig3UheUaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagqAahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2EYg//byp11dyLr30tTs4QfbIupcvVoRaoMOYXjdn/452MbESYQlTbDME0C
 +b+eSCNdjCNlTA82gPzkMRkjq0ySHexOWYJ4+Bq0D0MQ8GY3zAiulwDcLPNrljkg8PkTdpVmEEj
 1ei+7mOp9ZaH+WkaayDk+oesl46hCwCAP02YVPAZ0csm7Sp/YdiI2Wz9HDmc7XTI0npCPC7ngRS
 QWzw49cdhjsT9amC7wuXjElaC2l3cpm5O/du/JdDMbyb/tMFY8xfIx166nPhYIO2cx9frzxmcR5
 Z/BAghJand+pNucUyrPfMYgHZfGIIgvonKikoV0HUT70Yv+PPdRSR0PKEu2yP1k2fr1onZ8z+te
 LwhEo5Z3//2xg7xRWrR0RDA6TiUxObaTFYY1l6W5GsHyN4H2T14h7eiOXQiIOXvXolIlTQMfTzf
 w8bRXU+HzuNlBo2WVITrkp/W0tDLCJka/307tAS7cZHyB/YvElb0+NVTSHEo6bL7uz+He9NNJ4f
 MOzMBcLyNjgiBGD7/dEoHrJsQnH7xx5q1C34XRh8oe9qYzlqfzPK53zjTneipskzsix9nJyKCRY
 4bRFqs5UvOkJlsARTglefRzb3iZFk5M/Vs6/DlJyLZXpDxdle1LLhkeetmocyIv3nhcvsMJ2g7H
 OPkzw0DY2KRglPTWfqW6mPT0kELScI=
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

According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
clock enable bit was wrongly swapped, the correct one should be:

Register : APMU_USB_CLK_RES_CTRL
bit[1]   : usb2_port_bus_clk_en
bit[0]   : usb2_port_ahb_rstn

Fixes: a0e0c2f8c5f3 ("reset: spacemit: k3: Decouple composite reset lines")
Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/reset/spacemit/reset-spacemit-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
index 9841f5e057b2..2e87f320cf11 100644
--- a/drivers/reset/spacemit/reset-spacemit-k3.c
+++ b/drivers/reset/spacemit/reset-spacemit-k3.c
@@ -112,7 +112,7 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
 	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
-	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
 	[RESET_APMU_USB2_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(2)),
 	[RESET_APMU_USB2_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(3)),
 	[RESET_APMU_USB3_A_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(5)),

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
