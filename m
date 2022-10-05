Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6752C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1Xu4G/CWF37YrN79hfZjZGJMigNTQSn77YwX8TxMzk=; b=a+Nd1zKB5zi3qK
	J36dboPn9PgSE43/vLIJLwWiKq1Xg2B61IJkBnv784N4GhSjuk4IwvU5cfnNnOsV2+c+ewHHsdCmb
	34edEQtPzgRVn3qpbJJUH08KlmZxmHQQRj4VKf/QTq+Rl37qHTgEdg13wUC90oqLeKq486TNtgUJW
	CGz+e8Y3RTKZppwfJ7LNg1dgTkyjJMadAtgdKKM0lD/iTdM6JjoMrBE7jLbAw+DfYhE0Qb74gHNKp
	ueYf22Ipm4KrpcpfEmh3aUXigxsNFPt437Uiqrtd3RBBVSBFGBzS1hY6AotzpMdDabGV5bKKfEOBl
	TYDIo26cANH1dIiPHMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yc-00FNe6-Uy; Wed, 05 Oct 2022 17:14:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7ya-00FNc6-PS
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:14:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 79187B81EC0;
	Wed,  5 Oct 2022 17:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEA9C433C1;
	Wed,  5 Oct 2022 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664990070;
	bh=SrRvD4SwDz0Bv8OnFxJh7YVeUXOe4OG5XNkeYsdBWws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FwQLqwX5iYTvFNc4YjoKoPCRcxDPLarKMHG5waZRZEbVk7dlYD+urFb6t+dPSN+us
	 MJmw7dFf8Ly2VIlW2vJMGejDHR6UJ2bGzx0sudczdTbPJWeESHtYBkGwp7XqlU4kMF
	 RhV3RXMF9+5aV9OOUhc5jNoydOPhu2CInUh5gO3ZlDGF3x018umuOR+LXLr1K6wDCq
	 3BJMwgsqIBk/0yaOXJnCy/qdZoOrR/LCNxBek/5dBiAMZ8i6JzhAz4vLhhPnIMT/Ae
	 iWhF1+GpWqe3JOMfFamLn8oNRkjnj6VZI/wZg2VYxHiMsRohPq1q7QHNPufdKzuvq6
	 +rKa6tDsaj0yQ==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 3/6] serial: sifive: select by default if SOC_CANAAN
Date: Wed,  5 Oct 2022 18:13:46 +0100
Message-Id: <20221005171348.167476-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005171348.167476-1-conor@kernel.org>
References: <20221005171348.167476-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_101432_991313_AEC47733 
X-CRM114-Status: GOOD (  11.76  )
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

With the aim of dropping direct selects of drivers from Kconfig.socs,
default the SiFive serial drivers to enabled if SOC_CANAAN.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/tty/serial/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 768f1138c9fb..58f6f8e11592 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -972,7 +972,7 @@ config SERIAL_OMAP_CONSOLE
 config SERIAL_SIFIVE
 	tristate "SiFive UART support"
 	depends on OF
-	default SOC_SIFIVE
+	default SOC_SIFIVE || SOC_CANAAN
 	select SERIAL_CORE
 	help
 	  Select this option if you are building a kernel for a device that
@@ -982,7 +982,7 @@ config SERIAL_SIFIVE
 config SERIAL_SIFIVE_CONSOLE
 	bool "Console on SiFive UART"
 	depends on SERIAL_SIFIVE=y
-	default SOC_SIFIVE
+	default SOC_SIFIVE || SOC_CANAAN
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
