Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCC0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/1zWx4EBq5+EBPnUVdcY3D30sPOYo0xqyYdUmvgFb4=; b=ecd6iNUiK8d8Pz
	Yzfu719B25JPz9Axcpn6/RP9DrAZzX4MhRg5JISom+qy0+tjcHKRV7fN4/DQvgZErtQNU9lUwsuhM
	HUzpBouilKVT2tZ5o4dSJYbniQ+jR1CS675KQx96thFPBloIvJtjnNXZNmPdQX/yPyxa5ELT5t85f
	Mdw1nn1xvx8L89IBlCzRGXb7AH/XadGPHO1ONzD8nCLcuRnXCjcWuI1Tx8gBKbazy5zG0NFMwKmXJ
	GJVvgqMIsdAoGBSxfyTC28AXuc93JRcsmGklQ/GYFy2emTl7QMhH1bLhLJqaC7Gn4eSBLa+rvgN28
	8lTj3tZ+O36iPR6QqqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7a-000mVD-7u; Mon, 21 Nov 2022 22:18:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7V-000mQa-M1
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4266B6149F;
	Mon, 21 Nov 2022 22:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F925C433D6;
	Mon, 21 Nov 2022 22:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069108;
	bh=TYvibF/sO0W4k/n9Ss/JUmsxEP0GfE6ckLgGytOKLAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eq+jtHDTB4XHFwTKDIfZjjsRIbCER/xhrT0UZqxYSLeHrHd4mbWO7eX77rpCkQ9bj
	 /3MDFxEGm1a7b15o/rMoFNUux6y7M/EIFsAcGGq0BgWgs97CvnzUeG9sHozkpQ2FMP
	 T9rhA0hRdgD76EjaOFe/GChmxSbfZW6dNWSt9/wbgJNEFvH6isExdUNkOSTF5ZB0zs
	 Rwq1Cx8qwGLeYEDPGc39UCjHydtKVCD4EFROTYlSFbdi7GaZkBcoLlZtEA7wdJ30ax
	 Czd1KXFK1kBh/K+jGLZYt72+S1Ttri3FWlVXXfMZ3NNkVqTHlU2WNQVHAADWwcfw3/
	 PUEvLynh3gldQ==
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
Subject: [PATCH v1 6/7] RISC-V: stop selecting SiFive clock and serial drivers directly
Date: Mon, 21 Nov 2022 22:14:14 +0000
Message-Id: <20221121221414.109965-7-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221121221414.109965-1-conor@kernel.org>
References: <20221121221414.109965-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141829_788721_10245C29 
X-CRM114-Status: GOOD (  10.61  )
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

The SiFive clock and serial drivers will now default to the value of
SOC_SIFIVE so there is no need to directly select their symbols
anymore.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index aca5e750772c..b90af1e22bc0 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -18,10 +18,6 @@ config ARCH_SIFIVE
 
 config SOC_SIFIVE
 	bool "SiFive SoCs"
-	select SERIAL_SIFIVE if TTY
-	select SERIAL_SIFIVE_CONSOLE if TTY
-	select CLK_SIFIVE
-	select CLK_SIFIVE_PRCI
 	select ERRATA_SIFIVE if !XIP_KERNEL
 	help
 	  This enables support for SiFive SoC platform hardware.
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
