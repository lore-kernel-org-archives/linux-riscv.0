Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97363C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IofHoFzSGu9Rf6x3lpqqKmrfdZtcUI7J15eC+IF3onA=; b=xZA2kBsz0GoLT6
	x1LLfjW1fdb2t7NRRPT99Bh6M+jfdpT1REjYdaQzo4Bt4SXb9fkKWt/FyOU+CLE43ovp7WDF5COT1
	eSoWRPysw2OkAUcJG482YpUF3ciLuFwkU24DA4Fc41burbslVfDwrCCkBd1rxmUTSzaO20RUaRHmk
	5knwCTwy2lPXNFl/jyLhpLPfP1/p1F/51mr44U6lmqOlmDJoaeW5pWjAIrXQ47KnAz6uvnTTVq69s
	+AzkeSxnQ2+miL1I6lwuTtZ/z3VZCIMVf2tfGYSQ3Bw32uNikIViB7C2H51XrYW8rA9n7TqI0yWAw
	KXTGbyqFgIal9y5QNMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnri-005QUy-ED; Fri, 23 Sep 2022 18:57:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrd-005QPm-OW
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C70C4CE25A7;
	Fri, 23 Sep 2022 18:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C03EC433C1;
	Fri, 23 Sep 2022 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959443;
	bh=Hd0TcNw5nX/NYEEay/CqmUtWKMC8WZzPifH+PrkMoAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bxXRIz/n4Y/ZaHZkoCP0vtNJkhc2fVAfd/tWMMDj6nF7k2v6wlzToqrhzLaz0PRRN
	 kBUT/hz78bHqFyYCWqSu0Dl/QKgcXrOg+6ZjTFZ5Ct0eml5GQteuAwARXTUm6luE3c
	 u5MugXXtKhQaPGRniLvzB/g6vLwslB2jSP7Dte6sd9oYooGqc+Z0VVozKodhPgwR+U
	 z4mnVv0fPRNmi/zDrswp+Da6rOu7sY35gn4p6cOyfaOJemwQHmpa9GOO75Ek48gmqC
	 9oP/RGJD7SHA9lc4XJDRtQKKbph309mf9Te4YTyWok2ZdNlU+6Dzd+1WrrTUbFckQM
	 wZxjn1hvb54gQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 06/27] riscv: stop selecting the PolarFire SoC clock driver
Date: Fri, 23 Sep 2022 19:55:45 +0100
Message-Id: <20220923185605.1900083-7-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115730_028068_5960438C 
X-CRM114-Status: GOOD (  10.23  )
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

The driver is now enabled by default if ARCH_MICROCHIP so there is no
longer a need to select it in Kconfig.socs

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 20b7f17614f1..c4c7add1516f 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -2,7 +2,6 @@ menu "SoC selection"
 
 config ARCH_MICROCHIP
 	bool "Microchip SoC FPGAs"
-	select MCHP_CLK_MPFS
 	select SIFIVE_PLIC
 	help
 	  This enables support for Microchip SoC FPGAs.
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
