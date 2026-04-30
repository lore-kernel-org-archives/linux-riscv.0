Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91100FF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ofyhGT9YMVlBfrTkrLMbVs7bEsf90Q0hHFCkBrN8FM=; b=D4bKN3KujsH6VP
	ssfKho/n9YbkuM5aJaO5vGZ3QBNBD4lJVd+j+zF1k/Gf59l/PLFjoQfyeFr+iLERMIOtjTDGoA7Dd
	Hl2akWRfY6WDK0R2PP4vDddsqpG9gSH017MtBGs3jaYnjrf6dNB4+l1mz/xRwwksJVWBxLAdbiI7W
	ySPx83/O1+b3uVEbnxFIaqm442HCId2o800QsSIAxiZ2669+x/0HubRvSqrrYJMjtLqufSSreyfNM
	a0J7DV7pnqmqqJNUgiK4qLpmbJW1Rgotizdt4VY9iCHi/5ak2H1qA1P2J0sWihquhr7WDEgYMMGYB
	zjMuQyAtvokGU6vPOymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOM1-00000005AVm-2ZC3;
	Thu, 30 Apr 2026 10:10:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOLz-00000005AVB-26es
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 10:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B5BD43DCB;
	Thu, 30 Apr 2026 10:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3B0C2BCB3;
	Thu, 30 Apr 2026 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543843;
	bh=tyiLkTgwXliiyK1du6P+88X6L+VQhuFkJIR0zkN8O70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V/Xx0K9FWdV5p9KjsM/JcTZ+DudzsXHycvmJrQkYmUqMjjCs4Vy/0xvzI3HnAHBPi
	 smwqAACmlKwQzrpPEUNihM87p1+RGOdsqi7Q2pjNvOMc1xqmx7PYYGuzIOKf9qLfhX
	 nn9riF6SlVcEQxLF70nUVT/7NxYxhbin/Tv67+2LwVfpWbuwSpvfFvCprM+ehsfjRx
	 R2h/CTCZdEdiHUnJgMlWkxGtmOdWVuBf2MDWdWDRSnRPERc8OCiFNnzpl+mcvc19S/
	 fP6dYR7b9hwtay5cjELXVUr0ld9OvijV4AcViIE8oVRgRhUvy7IrvFabN7qz1HXCZI
	 dtjSjCub8y2vw==
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
Subject: [PATCH v3 2/3] spi: microchip-core-qspi: don't attempt to transmit during emulated read-only dual/quad operations
Date: Thu, 30 Apr 2026 11:10:19 +0100
Message-ID: <20260430-freezing-saloon-95b1f3d9dad0@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430-levers-defiling-00406e391c5a@spud>
References: <20260430-levers-defiling-00406e391c5a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vCnHD2gB9c1t2oXBPiwMs4RyXB/Zb/Hdlg3mIo6+93A=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmftTp3B7po3lmxiWsmc43EFI0jSepOTd4Sv4zX3nu39 8LWDav/dJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi388y/E9XaorRYu/WXVx6 78uPfXdPFkTUq2iGS3Fc/ujjtuFniiDD/5LlerPmcIUdXTK1Vk5pts6VmxdnnOaPNfp8tYvDc9b V+ywA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_031043_563941_3E5C9B7F 
X-CRM114-Status: GOOD (  14.43  )
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
index ffa0f33a0ae09..70215a407b5a3 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -690,18 +690,28 @@ static int mchp_coreqspi_transfer_one(struct spi_controller *ctlr, struct spi_de
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
