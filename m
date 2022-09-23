Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB84EC07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaUuNy9ueWhm6oJRInAFu15XFgm0cF5vM6Xgibc0jRY=; b=Dt7br2MAglLGph
	y5RZEUuMw6rAMpJL/uSAU5LjAGreTpzeu+HJY+JunjeS/7p2WPZ+E55oYQ1JKz3Ff6tXzbiUdXb92
	1aOX2UfVUW5DvJeDUqmuGRHIH9wH2MpjBYmAY7j1Pf686aSQcsywCsB6EFoKZ4+giF1oiMgP6EUUt
	VMg4JMycRDkgiZeCVSmyQguKIl54OQUqjKJvd5ebI07cRtQoCGm346fUUmVF20qyk8hcpN0ln+9w/
	RGfyajGxKZ7+MHwRlUUjSUsAoFtkW/zJqhwi3cjBcEjlh/IE/PvmyHppG6vgpiS+ctaGwK7aTiz+F
	UAUvjb1ocMDVSi4833kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnro-005QcD-W3; Fri, 23 Sep 2022 18:57:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnri-005QUQ-Di
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1420EB822B9;
	Fri, 23 Sep 2022 18:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102F9C433C1;
	Fri, 23 Sep 2022 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959451;
	bh=Py2zzXT5JURx2TaCquAkGwu4Wq93W+9KP9uR0gJXKYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qKDNJtLXd7pWj13chXnQpG6r6VLwZl6xgzfr0h0REFCXBprIeRUPX5bd9EJebmLRr
	 xDh02bcdM8gs6/6ZNo6SiUqb6st/SCyDroEzSbk4QnKGoiuQIfDmWXR2pUcMSvy7BS
	 +x3czbuYiinyr1GGTsyj1VsvE3mJ8OIOGwooZfbJ5npn8HUoEk8iFhoAg5m7v4F+0W
	 PHHWFjxTD5AqfB5Tq7UR6h80EaSVDCOSIrelCpQSZATwEhGekAm1GbHP3ObJaaoG2j
	 DW0RmnXN0OUpMUJUagfRid2rQbAYRJ0tm0H8zhDqmmWasxFU3/YqJGRlT9zkZdD9yE
	 PmfSP/xxoCJgw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 10/27] reset: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
Date: Fri, 23 Sep 2022 19:55:49 +0100
Message-Id: <20220923185605.1900083-11-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115734_638064_F968344B 
X-CRM114-Status: GOOD (  11.22  )
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

At LPC we decided to replace the SOC_ symbols in arch/riscv with ARCH_
variants, for the sake of consistency between "incumbent" vendors and
those with legacy in other architectures. To that end, replace the
SOC_STARFIVE symbol with ARCH_STARFIVE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/reset/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index de176c2fbad9..a69bd6ef3110 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -234,8 +234,8 @@ config RESET_SOCFPGA
 
 config RESET_STARFIVE_JH7100
 	bool "StarFive JH7100 Reset Driver"
-	depends on SOC_STARFIVE || COMPILE_TEST
-	default SOC_STARFIVE
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7100 SoC.
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
