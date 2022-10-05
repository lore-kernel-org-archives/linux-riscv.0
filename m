Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC7C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EURxilIjEGyDjgFMgsWEQZzWTfSFQfNZSO8iTFJV2ug=; b=H4pajMqylQuMBc
	aIwXP13YSesVZHoiv1EEE+B8BpIRfH6NzDQuygEK3ldrIXrKZQFXmVmkyW29uckErLqVGvhsdkSVY
	6nFcs1F5G+dKo0JJBTJ5MtBytVSa1mY8RPdDwA5SrJXfwzE0Y4As0rPdKMBt0pTgsY1vd8wLP6eG9
	Dc5WtEdAUhC+WoiHpU6GVJ5kqUeVSXLyThab9B2l2Nkw2wbUr3xLpQkoGQqb2EOlpQM1KQ/GlK/FP
	uRb4olWwvLSf1/Gx0YTKEKZe81iV6/cDoUFlQbkS+exdBDioNNGXCYQZdOH3SP9QF4qG6PCKHVLxo
	+vxMQ6pg4oDLrMQ7aBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yj-00FNjN-TL; Wed, 05 Oct 2022 17:14:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yh-00FNhI-Na
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:14:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47DE1615B7;
	Wed,  5 Oct 2022 17:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2B8C433C1;
	Wed,  5 Oct 2022 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664990078;
	bh=wJnnXErmXwIuS63pnOYPIZMoevXGwPTwZXkAnc5SFRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=argNZOR8Kv0lIi1n4XhQAUao3CpXMOun1Insci6BNIyqTffXlQGyinpCqCnAy9394
	 7CaQg0s5dikONMfgDA4V2YxxotOhWe30fDpm13XfALC8WcgQ127SiT+yPYiGnPc+Tp
	 gDSIpafpUt3bhdTMDX+sqyLgk3N8LGfqxwrukyqf++qF7jNQ1g0yUevKFVZuWk1EqI
	 ozmfLIqE8YETr1PFrWYfnjSAtpYWOkbfHuke9VWmEVYlOm6mO4CarklkKr2JE//er6
	 Sv13IXl1ddjVSVwemC0z8AR8LFx7HC/mCOYtqWF1VnLtu2XYr7CfF5D4U0st0x8FSj
	 giZ5nbM9671oA==
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
Subject: [PATCH 6/6] riscv: stop directly selecting drivers for SOC_CANAAN
Date: Wed,  5 Oct 2022 18:13:49 +0100
Message-Id: <20221005171348.167476-7-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005171348.167476-1-conor@kernel.org>
References: <20221005171348.167476-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_101439_834863_A92E2276 
X-CRM114-Status: GOOD (  10.22  )
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
index b6f4cfad159b..0ddbc9eb7af4 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -40,13 +40,10 @@ config SOC_CANAAN
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
