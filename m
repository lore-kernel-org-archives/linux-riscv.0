Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CFC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diwWlz7cXBnj1+h3pq/1ZvjqLA6hyjbbJCx+LjjX5eY=; b=njiPqkGh3hoLSZ
	HLqTfRux5m+s94vzcLP2/BkhC78JcmhlF2ayfUIlq1hXbs5t2U+ptumFFbiO4T1ywaojutkH/qQ6r
	QCAIiN+NZlepGHp5P6sNXIMmB1jWjQ6H7XxGg4knpNQHqU8GF+P0q/daelMqR486FQWpmu3DznEXz
	lLQ522J6aAdld2ImaPLOh7YNbhRD+GdtcgLmA8MI2Y4oZqzhFTNxmmy/lK5j3UlRlFL+b+RjFtv1m
	iPPzMY5JDFO2bak9zSXc3/xP75CxE717jPp8OEL/xhQ6+3vHCctOAXUFbKOYLLb8gSV8loDRx6kpQ
	XdBZUnkoSmxHEU1O14jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7X-000mSf-GW; Mon, 21 Nov 2022 22:18:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7U-000mPD-Pd
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6CE4CB8169B;
	Mon, 21 Nov 2022 22:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E866C433C1;
	Mon, 21 Nov 2022 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069106;
	bh=SFx9KT5uy/j1ogg2Yxa6LtTVSwGZyMb8tZR4MKjd2XQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0jUcsd8r6l/N9XMNPgTUAhnq80hYTwRh1IycXJEEqHVI6S9MmDlETcrH3XWXAOey
	 Mseld0XTWokkJbLNmHrMlJWvibwolQkNWz9svu3sdZJEsZSJwl3CRe5npy/3+Y+kP1
	 nyswCbQs8IANJgyeOg4OJivcUXmQFSjtfPVDbNbyYyhmLaC+VPPKCz8oj0Nzlu6eoO
	 73wj8oc5pWKHAdj9MObAotfRchO3nIi1DUbHzHMpQJiUEYpX0vA/43T6mbvdWssdo9
	 PWfmNmt8gXA0tGvP7c4ad13rD4kIgVEk+5oNtFTniWWefhrser7RmOcdrSlstgtkk7
	 LRT9gBObeyAVQ==
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
Subject: [PATCH v1 5/7] RISC-V: stop selecting the PolarFire SoC clock driver
Date: Mon, 21 Nov 2022 22:14:13 +0000
Message-Id: <20221121221414.109965-6-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221121221414.109965-1-conor@kernel.org>
References: <20221121221414.109965-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141829_022085_CA07C4D5 
X-CRM114-Status: GOOD (  11.89  )
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

The driver is now enabled by default if SOC_MICROCHIP_POLARFIRE so
there is no longer a need to select it in Kconfig.socs

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index ce920f627f6d..aca5e750772c 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -5,7 +5,6 @@ config ARCH_MICROCHIP_POLARFIRE
 
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
-	select MCHP_CLK_MPFS
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
