Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F21FF885A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+HTSkBVGGm04Ci761hMg+xNEvLF+zlfYcwVPrVqhg4=; b=cPLP7NbA4A9Dyx
	1g2oxNqOjw/S7IwSmQNz6PUaBhqygYlR1qFCOgt8a6vaE6HvciwOmkjqlRgdvkWRMCX1BLUD3Zuo4
	quKTRmU7pTEa8uVxI18lO28eYFkV9G9NgGAugYjawGYOYvsfeRcvDxKDXLCsDNdt0JGqcZW003F9y
	IteHU3rsbcRwfeOLKlzbUMoKGaEzNaOm4Tj/8pPL03MoBp2jsd4OxVT2tnzIikaV9GIbrwRULUZuV
	KfUiTMwApWRw8Ec28Q3WiR3CW/Y/cP6NqX+DZyy3xC9nlPmWe9Lp+Mmwfx5E/TO1dyEs+vrPVEfYD
	ibyMoslvalGhc5/yV81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmuD-000000023wt-3YDM;
	Tue, 28 Apr 2026 18:11:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmuB-000000023wN-1HSi
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 18:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CC4544390;
	Tue, 28 Apr 2026 18:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC8AC2BCAF;
	Tue, 28 Apr 2026 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777399890;
	bh=/uECH2zjlibLlsJAdmhC/CXvxN/bm+bCDRaoAlCIo+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LybcyWZHUJacpuoAWHtQb3Rq73SbC5ypZRjIvaUhUsoO1h1sByVWHfBWIqOF64Zx1
	 GmPLZLenmk66aDGEbAC/e+0X0l+sXg/a4XvdB7JJtljCMTWaZfQRQ6eZGJp4qPZ/Ji
	 7iBejm8HyS8ZjiTpZ6p5m0k5sE7oBFFL7EPWikC5RPpBMij3RzFiSAjKwYp4vvkCft
	 UXZBJoPm9omqrXjx2/PKqTuMIOi64VzBFb+UGGvxkhqkorI8gwqjVwSL/acIhoWTrC
	 p4KngxN7UJzKNcwHrgILei+4mfw07lfsuCY0rc17nIfW7rBLLEgCbFSUZVfX+NIHhn
	 XcL0mGJgSqpTQ==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] spi: microchip-core-qspi: remove an unused define
Date: Tue, 28 Apr 2026 19:11:12 +0100
Message-ID: <20260428-viability-crepe-4e4c85e7c506@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-surfboard-unhearing-96776be0495d@spud>
References: <20260428-surfboard-unhearing-96776be0495d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VNXeihsw7ojkS6VjtBbTddZL37lqa6SOjRRE8S3DHDM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkffthLqt5rUbAS6dgx/8nF/pQqJ07fLcHxCyXEFsziu pJ0uOp3RykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACaSs5Hhn3pi7teivw5pP/xz uI5Wsv6zmfOJQdhk0qdTu+wreF/vP8rwT3WSXoOijtiCM8kfzGRXd9a9Lnt7OyfC1eBt0AVbnZt VvAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_111131_364839_93AA82C2 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Conor Dooley <conor.dooley@microchip.com>

I noticed this define was incorrect, it should be UpperAddress, but in
renaming it it became clear there were actually no users. Just get rid
of it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index c8b053c7c857b..477a1bb390bb9 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -92,7 +92,6 @@
 #define REG_IEN			(0x0c)
 #define REG_STATUS		(0x10)
 #define REG_DIRECT_ACCESS	(0x14)
-#define REG_UPPER_ACCESS	(0x18)
 #define REG_RX_DATA		(0x40)
 #define REG_TX_DATA		(0x44)
 #define REG_X4_RX_DATA		(0x48)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
