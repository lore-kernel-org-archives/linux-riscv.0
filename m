Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B76CC61DFD
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUb34KwcJFXhBEkyMexWd32I5hyUDLDvd7olqJ/q9qo=; b=vqcCDXNFGjFqeu
	QU3dHsrXqRal+zkNCjeUKYGmdI67tuzGbqqaIvzihBW0xxZDfiQNiVFvhCrnlYhiN5fSNIH4iKSf0
	IuowabCFB98Y7lM8J9n2PBRYcWigbZyaOfdqcrHQHdS64y/vKS2XLysdejOtMpbg9UFNZ6z6Rk+BF
	3lhP5R6R1AeZ/aNlzfrcZE4wqA5IVaBlG8wKuzY2+S09kHXxmoYDQ3qguJLCiQ59e1/U49gqK3maO
	L+bv84WbDwXqxfqFaRR9iqVLiQHU7Q/rY/RH9Foehd12wrMahkZHvzpCgHwE+85X5LThAxzpCSAze
	DF7lchRwyPDvLFOZOJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zc0-000000098HK-0seT;
	Mon, 31 Aug 2026 10:51:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zby-000000098Gg-23ha
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 10:51:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43770444EC;
	Mon, 31 Aug 2026 10:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA601F00A3D;
	Mon, 31 Aug 2026 10:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173494;
	bh=rR69ic9FQZSapE5sg/ABBzxhACPJIL3BPm0zD8pyE60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K3DeXQtIfnUV5+F5oMPHi9dhGZB+kNoIBsw+ZHnl5BldpgSE0cnGHeZy3LNq9WV3u
	 VpjaqydyJ0TxkVXNKNd2ENMGt4o/OnMtdypV+iUgyGlbifQD+m3/k6B+qCRrcx8PuI
	 XLScuN2XYZgCFwu7OSuX7p4eUO05xggujeQaYSPuC8iHvCyQiWD4vKXLlBZJXjg1d3
	 0qHNBzCz6YNLbak/45leEF6iH4aUDgWZxa8df8kCgI3eymfzHwvUrUnv7Dx1O35Qti
	 v0iOHLnNNajS7nGsuWgdsO2QdkapnXLlMq4ONQEcUXmMQcTrp9KrZMGPyuSKqC06a4
	 dC/RMRdhF6Gyw==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	stable@vger.kernel.org
Subject: [PATCH v1 3/3] pinctrl: mpfs-mssio: use correct regmap function to set bank voltage
Date: Mon, 31 Aug 2026 11:50:59 +0100
Message-ID: <20260831105056.756259-8-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831105056.756259-5-conor@kernel.org>
References: <20260831105056.756259-5-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=conor.dooley@microchip.com; h=from:subject; bh=iZ8hHPxlioduqcAJXU0xpcnuVbcgYDtpROhjkH9+UbE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlTY1b8MahoOJg09c0qG1dtpzNs95RSmBpvnjb+WGok0 LZ2ttTyjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEwk6CrDP6U0B2fGNJ7+Sewn 1J22HWR8N+l+3XRD5RTTK4E9WVv1/zAyPE27+uaO/AfXvtSVO5oFy7cuOrlQWP2t1QHxHtOJMw3 YGQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

regmap_assign_bits() is not the correct function to use for an RMW
operation, as it maps to regmap_set_bits() or regmap_clear_bits() and
the former will never zero a bit. Use regmap_update_bits() instead,
which will actually set the bank voltages to what have been requested.

CC: stable@vger.kernel.org
Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index 9e6d233804cb..8da0c5312ce3 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -156,10 +156,10 @@ static void mpfs_pinctrl_set_bank_voltage(struct mpfs_pinctrl *pctrl, unsigned i
 	u32 val = FIELD_PREP(MPFS_PINCTRL_BANK_VOLTAGE_MASK, bank_voltage);
 
 	if (pin < MPFS_PINCTRL_BANK2_START)
-		regmap_assign_bits(pctrl->sysreg_regmap, MPFS_PINCTRL_MSSIO_BANK4_CFG_CR,
+		regmap_update_bits(pctrl->sysreg_regmap, MPFS_PINCTRL_MSSIO_BANK4_CFG_CR,
 				   MPFS_PINCTRL_BANK_VOLTAGE_MASK, val);
 	else
-		regmap_assign_bits(pctrl->sysreg_regmap, MPFS_PINCTRL_MSSIO_BANK2_CFG_CR,
+		regmap_update_bits(pctrl->sysreg_regmap, MPFS_PINCTRL_MSSIO_BANK2_CFG_CR,
 				   MPFS_PINCTRL_BANK_VOLTAGE_MASK, val);
 }
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
