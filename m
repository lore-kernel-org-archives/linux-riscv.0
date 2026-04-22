Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED138F9EDF8
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88TncfX/SZT2UI9SnBW2KrbuMx8s17DrZjfyNqQQLV4=; b=MiLIARvu+iw6/G
	IKjdXQBjkAodppI41DN+pqEz3cHvnUcS/xWiR1p7MI0rlAgJXxpWOKFVTdin35orKKrsJ7pMV3TwM
	pOnipXRQ+uKOZBrHnu7hL4aQ7hygE+Vb9vWpDYmy+X3/RW7GcyU86yVkmEIFiGY05L91GZMa21ezf
	DgTLuexy7X8JF7qVFGOo/0ejNzpqpXM8mrM5+sJ6NPLrzHjf6TkMzATm44mFnZtPhcX1vY80LJWSZ
	cVcHQelV9HefUQF3tzTU/JCXdlxHSQ9R3xETAWT+uUuS/x/8kmDfEZ9EE1envKbs64IjmxxfusKgx
	EwjpmP/TAX/vos4PUTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZK3-0000000AQ8B-1nHY;
	Wed, 22 Apr 2026 15:17:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZJv-0000000AQ5u-1xQ9
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 15:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0760A4191B;
	Wed, 22 Apr 2026 15:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC670C2BCB2;
	Wed, 22 Apr 2026 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871012;
	bh=eAMN+EEHmLUF2Ne3S/DRJKeFMCv8/8xTGSnTG+9H6Y0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NLoKQAUNEDVOWOLeP3sSex+01SudFGa+UTqIE9rIa7M8TBAG3m+I7q6Cgp44YXJfo
	 BcT/IkDfdjs8vKvjVw/2VXjyyblnyGkuqdjjlZBTB2FUF/vXWV6Krf5BvfsQQr2dtp
	 9yV6hJaMI179tzFC4lD7UlJCpcl1Ik4GlBDlbu5Wk/vJCY1fClGTplNCyeUKQalH7G
	 sZB0slFrZ3RFHc/yJzvF4tGY8S/WPcCjtJItsZPUH7H/NJbVGpyYR7NGUT8Kt6yBIv
	 f0GjYc4dc0/8mObQIySIyUzQYEpOgV62OBOP8ykqqPlU8wDi3f1AFfmqFJjAwXGHjz
	 BJOE/1bOfNuZg==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/5] spi: microchip-core-qspi: don't attempt to transmit during emulated read-only dual/quad operations
Date: Wed, 22 Apr 2026 16:15:43 +0100
Message-ID: <20260422-omit-fancy-ad0bac3d843d@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422-foe-strength-a5d8ad650ef4@spud>
References: <20260422-foe-strength-a5d8ad650ef4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xzvGmGWw+PhfUIzGLyaHBy7UzwyYroknqKzAQ1SA4Gk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkvnjnkbtgnEVX0Lm6hElPZdbZlGWI3dm4vMVvLV/nQg Xduy+b6jlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkSTMjw/e7M7dd+3v5O3ul VYhq4rsMVwO3c6L2ItP+mRsVHeoUu83wP2naXAO1yU8WGHOu0pJQN+pzvzpvj++k2M7z/S3LDu+ 4zQ0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_081655_549418_7BC0C0D8 
X-CRM114-Status: GOOD (  14.44  )
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

The core will deal with reads by creating clock cycles itself, there's
no need to generate clock cycles by transmitting garbage data at the
driver level. Further, transmitting garbage data just bricks the transfer
since QSPI doesn't have a dedicated master-out line like MOSI in regular
SPI. I'm not entirely sure if the transfer is bricked because of the
garbage data being transmitted on the bus or because the core loses
track of whether it is supposed to be sending or receiving data.

Fixes: 8f9cf02c88528 ("spi: microchip-core-qspi: Add regular transfers")
CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index 0a161727706ef..d39b04f9b6b38 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -693,18 +693,28 @@ static int mchp_coreqspi_transfer_one(struct spi_controller *ctlr, struct spi_de
 				      struct spi_transfer *t)
 {
 	struct mchp_coreqspi *qspi = spi_controller_get_devdata(ctlr);
+	bool dual_quad = false;
 
 	qspi->tx_len = t->len;
 
+	if (t->tx_nbits == SPI_NBITS_QUAD || t->rx_nbits == SPI_NBITS_QUAD ||
+			t->tx_nbits == SPI_NBITS_DUAL ||
+			t->rx_nbits == SPI_NBITS_DUAL)
+		dual_quad = true;
+
 	if (t->tx_buf)
 		qspi->txbuf = (u8 *)t->tx_buf;
 
 	if (!t->rx_buf) {
 		mchp_coreqspi_write_op(qspi);
-	} else {
+	} else if (!dual_quad) {
 		qspi->rxbuf = (u8 *)t->rx_buf;
 		qspi->rx_len = t->len;
 		mchp_coreqspi_write_read_op(qspi);
+	} else {
+		qspi->rxbuf = (u8 *)t->rx_buf;
+		qspi->rx_len = t->len;
+		mchp_coreqspi_read_op(qspi);
 	}
 
 	return 0;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
