Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4ACEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+e6LfIVFpntJEuOKjgyuym9nbcKQf0N/umMIZjVuD4k=; b=mDl7E0zEK9POzV
	j1jCSKGoiPrsj8SukwiWevP4w6pEK8Zn7j/8VLsgf7FCcIjfFL12RnBJSqGHU+IQ+zl8xZGZUgHUP
	CRFeAEfMMr/Zlzm93rxIHMKq5VyoNqyjdeTu3IwSLVGhwSY3mpyqJcJqC+eaYIvz9ENZmyk2ANfYX
	zGqt361oinb4e5/f/4F2OTYmZrPN873O2xzrjOItLSo4wMyuzryp9V6Eq5MSYqyHB+cQxZdknbW7n
	CnYNADud5gyfEWs8xmRvgEgmRNaf7en2S1BMkooiKzDzdDRbiUdd95fNIMnOpEaE65aHJkTfIJCeJ
	j4NNIQW/XVPrKn5rPzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Gx-0000000GKnu-1Gte;
	Mon, 17 Nov 2025 15:36:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Gu-0000000GKnF-2cPE
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 041D24046F;
	Mon, 17 Nov 2025 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58490C4CEF1;
	Mon, 17 Nov 2025 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393763;
	bh=Ngz4pYB+tJwskK/2e2v6SrMSgYaik/dmE+6l4zJ63mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VM8x3CbHTupXwTr57Eb8p21yqdbvluqHmz5mDdB2hX+xxlkninb9c7D3PrDrM3rLm
	 fze9QkI5seDqXbzfhqfYv+iGsv8orJQB50B3k0CAmZS8CEuseJQUQQ1WNS8rT/j/ai
	 ++AZC8OH8V9D7laBkKZaqBbNTVh3IjSWnHxLMkr6arTpoOq+6ZsiOu18cEZ2uNoVlQ
	 Qe2lYbBGQxNmPgZbZo9+u0lnq7fIWz+vs9mmoqTw4bC0YCnz5DawVQh0U8hskNy/MQ
	 re7VeFXf8V9XtpNA0uDKEST3dJ8N2NhUYAppATvlYpqCMTo+uteJ1SNFG97UJHA3Oh
	 z4D1myf/1eU8w==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v1 1/3] clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
Date: Mon, 17 Nov 2025 15:35:18 +0000
Message-ID: <20251117-bulgur-wildfire-a8c5a2b417dc@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-shadow-police-56aba5d855a3@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=twE2/xw0EdY4lCByaHHfukqX9Ahnfe+zRoGGS/KLfAU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDlt+5p1jdy4VaS085if53oWrI7LwVNDUOSfkTD5G3 T6SWdnQUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImkrGBk2H0v7uWtzlC/l4HJ n8yPad+8aBo+tcd1onRE9HF+hyVbXzEyfHbbvnLtm/AJgUs/byk59uZ00IqNhSmWP3QCOSfdiE7 5yQ4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073604_687530_B685E1E1 
X-CRM114-Status: GOOD (  10.53  )
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

This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
symbol has been defined for some time on RISCV so drop it without any
functional change.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index cab9a909893b..a0ef14310417 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
-	default ARCH_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	default y
 	depends on MFD_SYSCON
 	select AUXILIARY_BUS
 	select COMMON_CLK_DIVIDER_REGMAP
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
