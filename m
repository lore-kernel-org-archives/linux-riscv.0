Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C1FCFC27E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+e6LfIVFpntJEuOKjgyuym9nbcKQf0N/umMIZjVuD4k=; b=oqnShyVrWSFrcM
	Y9FtfmlPoqIu4WSKqUQGW6se53Ksfb/A3go7rovbZZXxMWVKXlQIYChjiTqbd86z8qsufQFkO8QFb
	cttxye4jT5j5cQoN9T0HTo3EuGr9jzKDYAk7X6BpST9lZ9XH2SXBozSPKfzhT+CKITZD1u2LV9sEq
	NhMkagWoVS1gqYmf9bZb8Jwm4nXGuJGITkvwaD93RfSaTK7qAOyYaAEqmEHukcZX+Xa8IR76g71em
	iyyHL+jzXOOqTtChOmw808C4i9XW5qsJ+t2TUVF2PvMQSxz9HFnkJlDw9DgGDYt7LksfheZ2TCDKV
	zR8KeIoxN7Z6BT0oxM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQr-00000008R5g-1ktt;
	Fri, 21 Nov 2025 13:44:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQp-00000008R4e-254c
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 13:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E4B74189D;
	Fri, 21 Nov 2025 13:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A32C4CEFB;
	Fri, 21 Nov 2025 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732650;
	bh=Ngz4pYB+tJwskK/2e2v6SrMSgYaik/dmE+6l4zJ63mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4Ymhv686ddYKssiczei2H/0gnm9QRk3XP/8ToBKlU49Rn1EL6pd6VddsJw75SHi6
	 GZCa3XTt3O8NUd6x2+Qc8aM2GaGQNQOg2PhfKfY8UyiCK0Z7zmfC4oJ9Gi4e6Odll/
	 /2ugiI+t9msUHObZLTDxmYPTCvjuJSBrkP+vvEX6+bzucf/sKVjXlR7pVLi/bsf02K
	 NAu5Pefb44jEDKjxcCBPLulTaSPDGArLjYRPVxuWS2UIlnkER2sS9TMuci+ThA2Kma
	 Qw2oxQB2l9HwSjEqik+wyI6JXqBPAc28FvaD9uSr30Kpc50NuuPqr65GUDODrX/Jnv
	 z3/F8P+2AAmxg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
Date: Fri, 21 Nov 2025 13:44:00 +0000
Message-ID: <20251121-prude-dilation-79d275fec296@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121-tartar-drew-ba31c5ec9192@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=twE2/xw0EdY4lCByaHHfukqX9Ahnfe+zRoGGS/KLfAU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfPF+dPyJc5oCj1MzPJVEZM85uQqqHPX+6uOabPYI QX2mU0dpSwMYlwMsmKKLIm3+1qk1v9x2eHc8xZmDisTyBAGLk4BmIjzX4Z/quLrpLjzxOc2rNN8 wLuB1/KpGVuWlpNInHmEvWvAPp+LDP/0fTRO8R+yy50bZZd2RXXevVuTjlycs7P6qeEE0Sf8cr8 5AQ==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_054411_554926_1911E766 
X-CRM114-Status: GOOD (  10.59  )
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
