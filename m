Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A93C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXKo953gMrZ1OWLoGSLEGF0Qt+hzC3stpmnhExXITkw=; b=TqNCRqt4iRTEkp
	CWJdT1znHezBfmUADEuwrH04lEyMHlIaeJ7m9+5CIkmUzy6O7gz+gJDiAKPkSwXZD0M+ahwTNN1l+
	1c7CsoHrDCxLaRxiwFOKjrH+KRQh98G3D9t5lWHO3jxnuSfFuXRFBb3S/hCGD3bUq+LpG60hEzGpX
	7m8RBSWTGMAtygfrJhZo9eD/88fRAUPofUJWO8zX4tfcPt/N16O1T5WEIVv+Xiy7riLMJH4Er9LtW
	ubQNP1glZ0TeQVT+64aYMoHpBYiKv6NUSkdUXFgIKmFc3hpiHJLZgtcpoP+cSC0aPVejN5HJAUCZP
	F+yyZoQeqpiHNYF6EFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obntZ-005SHD-Mu; Fri, 23 Sep 2022 18:59:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsK-005R7G-J9
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:58:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BEB0CCE25A8;
	Fri, 23 Sep 2022 18:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E13C433B5;
	Fri, 23 Sep 2022 18:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959488;
	bh=ahY1i1bH6DX0SjejSkUix7a6Ukr6WI2doDA4HTOF9HM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKtLUegE34qCZG5SK2qinnOOOnzGPbEH0ew8bONpXzZZuLq/tfZopJEhKW2PThMqX
	 5l2GjHL0iAwnKq6Xob0dKrWsE9KQBxzPYPiC/FpPHvy/tGKc6+Chm/PrwR39rJ/gYK
	 TA07jmTWy79zGynzIZNALULI3w6tWySd4sa4Viz2L/PqEfywF9+HuIJaJPEbHWU6TJ
	 E1zxhIKCfe05x+6cUeAbAkRhih2YXUQwZ4HRUOFzvNYysVdyKojKU8i3jSQNK+6IFA
	 fXh/x/YUBwwR3FMmEacUHCnHdD3kkvN3qiriwmstJvhO0ZZwn4BBn47pRHcLNqMsYP
	 jKkZEJLgjECDQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 27/27] riscv: stop directly selecting drivers for ARCH_CANAAN
Date: Fri, 23 Sep 2022 19:56:06 +0100
Message-Id: <20220923185605.1900083-28-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115812_874087_31AA669F 
X-CRM114-Status: UNSURE (   9.29  )
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

The serial and clock drivers will be enabled by default if the symbol
itself is enabled, so stop directly selecting the drivers in
Kconfigs.socs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index f195cae638c0..377f484cee09 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -40,13 +40,10 @@ config ARCH_CANAAN
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU
 	select CLINT_TIMER if RISCV_M_MODE
-	select SERIAL_SIFIVE if TTY
-	select SERIAL_SIFIVE_CONSOLE if TTY
 	select SIFIVE_PLIC
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
-	select COMMON_CLK_K210
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
