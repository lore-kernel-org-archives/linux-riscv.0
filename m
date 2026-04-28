Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF56FF885A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLR7WLOmvRMrsDr/A88Sl3YAkwdz91Xb7KmnuNjD0GU=; b=AC/qHoR+PSBVFL
	YPyncQMvg8NyhUazRAFJjS8a8iEhxHf7+mOYXt3yYJiB6F4hsMWqdJQFE55byzYmGaUFf0IRlaWv0
	QHvkuhpuvpUMmZWvw9MaHQO80riAw5uu6y3PIO6JSeE2S1oelOGqkgnQ9sS/nPACO5WJ/YxLKsL2v
	dYLA9cS+s/96w8gdjaRhpmX2WfPA5e+xAa9ds0RYCvPVAq1F4MH9xe3VuHLOpo9C9Il3FX8NwOaeE
	iD0ncCOVZ9JJKHDeL1b71dzYES6lO+DCzkwCndQcT7tHgCArA7kNYlkgzcRe7+x6vwusxW450u+d9
	mmyoiEV2y8N3RHr670qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl3B-00000001sL3-3iZH;
	Tue, 28 Apr 2026 16:12:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl3A-00000001sKH-2dEr
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 16:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16EDB60008;
	Tue, 28 Apr 2026 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC618C2BCB5;
	Tue, 28 Apr 2026 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392759;
	bh=kxxeRh+fiRBAkPPQ6Ege8TcSd/UDjWuIziK+9tp8mck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zr5uUgjAiwDDNiO5RdBkwMQqczxPCPHO8vmjveAqjkFhvjgL1qKFOsnf5BCTmdp40
	 NDbbhIkbfGDlnpZdrhDwfo/y8Zx/jyTsaFJyLQDoFQ3/uCPKbzZGzo/enWsgT30JrB
	 ct6s6Wrvolvm9BIPAj46bK72BjJjSwMPSdlh8rvlOTzC8w8D+fZuDWvccC72Oq7BTN
	 IYWnqc+F/b+Yo9UvHvbAfvoMD19uheFZRamYFKg9fqCw5oSyriK1rIR09NCRY9IFmX
	 ccphEexyQpOF5vv945jVUOBmm5he616hUzVKUsIPzJgHlM3HYKy5ItwlOje2JDSNLR
	 yks4T5YWJ2UEw==
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
Subject: [PATCH v2 2/3] spi: microchip-core-qspi: don't attempt to transmit during emulated read-only dual/quad operations
Date: Tue, 28 Apr 2026 17:12:06 +0100
Message-ID: <20260428-directly-stroller-f6551c3dca16@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
References: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=659GQtxfjWiZygrLJrj8jZ6QG6PovzBK+5ouTwOvfAE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkf7iQ6T/rAp1WhaGNTK3tC7EQiG0NR0nqvOU+V+S23R R9VsdnQUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInUtzMytEzQPZtxoU/LazHD MsWEjsMT2xd26bJ6++71mrWifdcvA4Y/fAlv9jUe6PYNeRd4/F7svnWOna5ru96m3KsxnO//hms iHwA=
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
index 7bd2c9dcd4771..dd3644ee80c6f 100644
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
