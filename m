Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3132CC07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjbR/xXM9KLCuP3fzr+st8vLfcSwj7eSwwSPCR5BUMI=; b=4S2tqpfUohHMM5
	Iqk5G3WLfBFZjc+uwr1oTdJpEZBAX6pnjPZfei9WMpmf6rjpIB08cQq7euM5yLfkpapyQbzQUsje7
	HdEc0QjdLr80boAXVC86eL6ylpwkSM2a2P1kbsLQWGQstJNYZnKwKpI4Lds0iqRoWT6+X3uJpg/wH
	woXzcrM9SRdqQVB0FYzQoTMd/SvH6CWs2fhN+iAb6IpjIfTZQL4BXu2gw+JfzMAwCcMfZDdVObBdE
	QLEbu5W1IFI4JhPQO7z5k4hwTxAqWO/JiErvEPfOgu30+BkFhoifmmQ5FlFjC1qH3FXFIoWwBvrgz
	4HfTr9aIEH4hlc/vb70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrm-005QYt-24; Fri, 23 Sep 2022 18:57:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnre-005QS9-QS
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CEE761EBD;
	Fri, 23 Sep 2022 18:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5486C433D7;
	Fri, 23 Sep 2022 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959449;
	bh=KScYVdphdA9UDsl9AC+ubUdmNvluj1e4xuS8WeS+f/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bQDcmd4ojpVn5vY7GvxQN8pcEMR87NwuRv0lz1J5RHzEIDWSuwxo4ksvufRMPprEV
	 iXSa/Jio1M5ca5ESIK26st2PIw1hJ3gwgdskFXcDA5aGSNePiMgx7UpSzZzu6CG6pD
	 kBebHX0lU1VQ7iRY54Rk7IRFkcTBvWr3RwOuCMBHTvrxp8OxmOm0z9VOkDBPppW6xN
	 yQAyWjsCf8nsHTtWAf3PHU3TL57hIj5Rsxa0MGEbBJAzxImXfTHGALwjqTAp8AdRHo
	 GGP41KJjfzmgAiZr8bCuRUCVBrmIFgD7k9tYlS4lGfh5jZ/bV81gaB+mhVv1PuUwy0
	 mTpnolt+qb2cw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 09/27] pinctrl: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
Date: Fri, 23 Sep 2022 19:55:48 +0100
Message-Id: <20220923185605.1900083-10-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115730_938366_C24F8E44 
X-CRM114-Status: GOOD (  11.11  )
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
 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index da87f2dc358b..8862a71de8af 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -433,9 +433,9 @@ config PINCTRL_ST
 
 config PINCTRL_STARFIVE
 	tristate "Pinctrl and GPIO driver for the StarFive JH7100 SoC"
-	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on ARCH_STARFIVE || COMPILE_TEST
 	depends on OF
-	default SOC_STARFIVE
+	default ARCH_STARFIVE
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
