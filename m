Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D466C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hg3oA87qgogLh9rBJXDAXOHaW3RLq5Jf3EDxVOOi3Rw=; b=xE7tKj1/0yX9gH
	LQnmTUrfWdKgCkeRr7YRjMelTjGi9vNEEu+IyENYCg8cNbBQOUMA/8qZvKJ7eIhs3dezkQ3kZLwag
	cDBM9C6o7WT9AkGgqj82baVyqCCuIDhveZzQe7FHTsP8oVelHwWQiGfQObvbvI433Adl4KqVFYRiS
	xeMlKDcimEBDKaQEFaS5m9YLdEll1Iw8s9UFrEf94Q8FbIEThoTlkewWJCjeySZCvI1E+W7qe+rf9
	fVrFqJQUME5kLbxZgI2rR9FSCoGhi8EdP6En1G1F5HEC16lEjr9tMXgm0j7NOCjTfvYtCBCwUdI22
	HFi+cSeyMhfa1UkcJthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yX-00FNbC-E1; Wed, 05 Oct 2022 17:14:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yV-00FNZn-43
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:14:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CA29AB81EC2;
	Wed,  5 Oct 2022 17:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB2EC433B5;
	Wed,  5 Oct 2022 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664990064;
	bh=FYFZ1JV5IJJ1bzGkzuTk0Eck/dERbIKxB/AHNzA5FWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLVOBGmzOcxKlwnKXhY9Nvf3yga8bk/SinMKfLEJCMmulTw0cFOwico/z1cWcpZG3
	 aT61mCCBGQFwaH4ZYobLLrhfIlKVrD/NTRC5MtlynbHK+u+opQM6xj/K7bduf0YI6k
	 A1OlFu8JXU3wey7Mx4WinAz9/tuKRajAJn3QHmNld9b+MftnhOf1/TNX0kR6le09gP
	 sv7AIlXuQBoQjfclYt7M0j8LbOhpHIezElAd/FADAbcwzh3F3Gc42GFuKA6wPTyJ+N
	 bjRGcXX8BpdWl9KBzM9iWOJMO/tPOv/bWA6rp8LVeIxrjSkfRA1tekQBMtfAA3Dy1c
	 /MSQn5tMiefQQ==
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
Subject: [PATCH 1/6] clk: sifive: select by default if SOC_SIFIVE
Date: Wed,  5 Oct 2022 18:13:44 +0100
Message-Id: <20221005171348.167476-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005171348.167476-1-conor@kernel.org>
References: <20221005171348.167476-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_101427_325264_08E8B670 
X-CRM114-Status: GOOD (  11.31  )
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
default the SiFive clock drivers to the value of SOC_SIFIVE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/sifive/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 9132c3c4aa86..b7fde0aadfcb 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -2,7 +2,8 @@
 
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
-	depends on RISCV || COMPILE_TEST
+	depends on SOC_SIFIVE || COMPILE_TEST
+	default SOC_SIFIVE
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
@@ -10,6 +11,7 @@ if CLK_SIFIVE
 
 config CLK_SIFIVE_PRCI
 	bool "PRCI driver for SiFive SoCs"
+	default SOC_SIFIVE
 	select RESET_CONTROLLER
 	select RESET_SIMPLE
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
