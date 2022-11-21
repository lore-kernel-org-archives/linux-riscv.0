Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB13C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGjfaa+JiQJdt6F7XcaVCoQEP77JbN9xvJUOX/GD9gA=; b=ChhG2duK3WqZKQ
	7KdnfGcxcDGI8v9ZsDCFAWK47KUhl1CFrhziArw8uqkEZxVatIUsWEzCwMrkhbY4/C5V6ZoSw5o+A
	sk08WGkkogzbrdzUFAbLTA7Hie7E4LWi1spOE307jh5zktJq6TATZ8JlNde7JgH/6WLUMcbhCivkl
	TJ11BFTXb/XxvEgr3dCKmNqzUIIFWDzjW8zmfHzP2/FEgleH2Yyvx0nkI9KPYoYvzFa7cmk+zxF6m
	emNVrhaiL6bDqIqCa2z+49AyZ2VBxrt8SIxItcCVPIXCocQLlZrjke1bi3ZTIOiC+y/xZm/NfaZ/q
	Q1unLRWYe6BWAIkmehog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7e-000mYN-1D; Mon, 21 Nov 2022 22:18:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7Y-000mTi-M1
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6A206149F;
	Mon, 21 Nov 2022 22:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1E3C433C1;
	Mon, 21 Nov 2022 22:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069111;
	bh=6yvpjQYCQCs9/62nLOCVqcxUwiSZDzo3MdFQLazZ1sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ykj9ObagLLB8i8gcOlwGV1Ln4Pn0fmNMmgrA3Gd9AW8dLrV02yxNgazaH7tx47sLL
	 wNyc7yuShBosN6vq1R9G2kvXZ/0VCae7/jXubXAlcwsmhYpmY5jS70JvQICquA8YbA
	 e7ZCbra+Dx3QQ/2oQ2PnTNPdmmfU8BdUSWhxDkR8gLvLD9+yfZJmIyQIZUp8tE6Unq
	 zUWZueG3828YIpWNvgVRVGkkSV7uW5R8R1BYAutxO2/765RevykkncQW8yDyvX2Avf
	 B66PXvhH/kD6ca0daKJZCI/RvyiW5t8S5XGKnDMUHHLEcYU+2XZ8LHug80N4Na0nAm
	 CBH/Z158CQzwQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v1 7/7] RISC-V: stop directly selecting drivers for SOC_CANAAN
Date: Mon, 21 Nov 2022 22:14:15 +0000
Message-Id: <20221121221414.109965-8-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221121221414.109965-1-conor@kernel.org>
References: <20221121221414.109965-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141832_764770_A367EBBB 
X-CRM114-Status: GOOD (  10.43  )
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
index b90af1e22bc0..34a54e5310a1 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -56,12 +56,9 @@ config SOC_CANAAN
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU
 	select CLINT_TIMER if RISCV_M_MODE
-	select SERIAL_SIFIVE if TTY
-	select SERIAL_SIFIVE_CONSOLE if TTY
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
-	select COMMON_CLK_K210
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
