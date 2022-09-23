Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3951C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsb6TOeWijK7HJ6VVpxooe/PQxu8iX2tqIO63YRWNv0=; b=twNPRSEB1nMB6H
	SjpzVot1KmP4PySlIFLKkQNkU52As7c3ov2hxygXqNY1tWRjG3IHlS8tK/ZiKxNFZl4lvLS3kBvh8
	W/TA8cCouq/TlqN7RkjTbmacoRyXRIxc6XuXygAnCVpLqPlaEWJDx3kSDf6XU/piy25dnBCiV6Y4f
	ZWse6Ux1/b4oZMzWXdY3ZXzR2Rd38YIbwoJnteUAFGSyFjzf846ZIam8Kg2U5v2KFnMCGDXzoin0c
	58T+WZa6k0oe4vjNVtpzrHcZoThHFva6upNyD3tZ4SmaHUvTqvpxGFQmrpJc5dAn26cwleYE1oCcj
	EUw58M9jhM0eaSf/ktPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsv-005Ri1-Gr; Fri, 23 Sep 2022 18:58:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obns6-005Qv7-Pj
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:58:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 376B66114C;
	Fri, 23 Sep 2022 18:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA44C433B5;
	Fri, 23 Sep 2022 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959477;
	bh=YbwaH8+jN8pGdWBtlOHSTGQ9XdYYtvuZVyOycj1sImo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+v7KDeFGCVgIzUieI1Z/HA5VyfaRvf1bMzjp02twtFbkcuUKr42YQ6kaa+/1GqEy
	 f8vZ5SbD3OOjoy4Z1yLvtAUHXQgznpkKuYbg1NKerzNssB7grjzJiMVpEkG6fj+sZA
	 xvjkv4aCLeo1zGQTstw71l123/2FIxA6w7jGK1DuU8R4mbM+WO3UELvqjimQrnZ48D
	 KLW7TlLD/lpLh5ZFLeBzytecZrKDOJXWyKnyygzhZfME3yxw4QTv3sRoVr87NxRklz
	 YYlbyvl0zQy+ppIHohPAsyHkK9GP8mQn9HYjnAgVQxeZWWHD52D4fMSVnQ3ixrcyww
	 w7rKwgi5ovZeQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 22/27] clk: k210: convert SOC_CANAAN to ARCH_CANAAN
Date: Fri, 23 Sep 2022 19:56:01 +0100
Message-Id: <20220923185605.1900083-23-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115758_906883_5BCD244D 
X-CRM114-Status: GOOD (  11.01  )
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

As per the discussions at LPC, the SOC_ symbols in Kconfig.socs are to
be converted to ARCH_ for consistency between "incumbent" and incoming
vendors who have a legacy in other architectures.

Convert the SOC_CANAAN dependancy to ARCH_CANAAN. Since ARCH_CANAAN is
only defined on RISC-V, the Kconfig dependancy on RISCV can be dropped.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 48f8f4221e21..68477aa6fcbe 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -423,8 +423,8 @@ config COMMON_CLK_FIXED_MMIO
 
 config COMMON_CLK_K210
 	bool "Clock driver for the Canaan Kendryte K210 SoC"
-	depends on OF && RISCV && SOC_CANAAN
-	default SOC_CANAAN
+	depends on OF && ARCH_CANAAN
+	default ARCH_CANAAN
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
