Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD61EFF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeK2xYzXlVAHX09poK97W8WXfRGF2fpxOEmnLuALLVE=; b=PCTPGnWNUvDALP
	uvbFcG/C3z31+Fquj3zdAIbo/nanyv4edPJEp3pOTlKRsrgIyo/JcE45IZd9q8RcdnFdeMtel/IAB
	z7rtlXZVi/ZUtwX2B/Nb6r81BM8gXipGEci0sR0q9ZBrxso8DkyPbuORv++7vcuO2/rbeiKO2pAtA
	u5YoihcJIAHnHIaTLtRvXCw71XvX5z1nDY0OvtOv4jxsSb2omJ/KQfsVhopE/AHtQEkuVtrRw2Qmt
	usbwJrsbeTa6GMFdzNkKq/Go2F7lRKOsT58G2AlggPPNjmhpm3IghRLT21EeLqLYyaXqXVoRf6/1J
	TZLDJbsJdq6R7+RsYnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOM4-00000005AWr-3rsc;
	Thu, 30 Apr 2026 10:10:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOM3-00000005AWZ-3SkM
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 10:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4819560180;
	Thu, 30 Apr 2026 10:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CB0C2BCB3;
	Thu, 30 Apr 2026 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543847;
	bh=SnQIwcKB/QmkyDmi1HGIsJczvkQ3ZCUL3EaPXot18L0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mhgxfs6etbHf8XFTCL0NfzKw2pPnDqlEH5iCz03c6UfMqI+GkUj/q1vTukv097NVF
	 iLjF8R2NebgDUX76ObkbrF+8V+cH84V0TWg8/pMUW4An77NovKILYi6feKYSQuWKOV
	 hsZKQzzeCRREyhqeXB7B1P5935RzERP/2C9+iaLMBE3SAjxX9xys7l6jlLBmIJGySP
	 b/JiqFhtzwq7z/8cPvwDoohYrKU9Hmn+Jq2omOgGn9TNabn9Yj/nSeE2nSaj0XlS24
	 o1WfiNiKtglnjVFeQWxO9yGl69v8XP88jA0ThB5tzLaz8J5ZjvYc0J8nUfLH88Tv+P
	 dy/A6vwt26P7g==
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
Subject: [PATCH v3 3/3] spi: microchip-core-qspi: remove some inline markings
Date: Thu, 30 Apr 2026 11:10:20 +0100
Message-ID: <20260430-serpent-stimulate-59fb860ef429@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430-levers-defiling-00406e391c5a@spud>
References: <20260430-levers-defiling-00406e391c5a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jpI++FBrluLRiP6PUmGBsNndveZI5ut1N5P3XQfqIEU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmftTo5nKy87H+5ebs3ymUctc27l/DaYUew3Nn739vsp yy+m3uso5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNJOsvwz9gt/bmXp0i50MeA pS8fT9e4emuiUObuC84nLLavUti07BojQ+O07KWvV3zp62Ji36vU4nkpdrVz1aQzaqfvX/62ojB 9IjMA
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

Remove inline markings from a number of functions that are called as
part of mem ops callbacks. None of them are either particularly trivial
or sensitive to overhead of a function call. Just let the compiler
decide what to do with them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index 70215a407b5a3..4dee0fea1df8d 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -197,7 +197,7 @@ static int mchp_coreqspi_setup(struct spi_device *spi)
 	return 0;
 }
 
-static inline void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -233,7 +233,7 @@ static inline void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
 	}
 }
 
-static inline void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -261,7 +261,7 @@ static inline void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
 	}
 }
 
-static inline void mchp_coreqspi_write_read_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_write_read_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -419,7 +419,7 @@ static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_devi
 	return 0;
 }
 
-static inline void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
+static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
 {
 	u32 idle_cycles = 0;
 	int total_bytes, cmd_bytes, frames, ctrl;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
