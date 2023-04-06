Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC6EC76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 20:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJxhOYpzYIlLo4q+HGFjjZgyiSUDF6dOeu634ub1rJw=; b=0kmTf037rnWpgg
	FSc/e6RtptsIWuqukC1FekegD8Hv3AMRso+MeEoM4uOo1IXM3mjmtQC7PHcDf0+MFs3sA41sHRihH
	VCKLRlhN1YmJm0ceUOJgUQfISR5aU0MQrqOxfwYVnYGdG3MPvN/HftT2/IIW6lbjtemWZTes6pll8
	0g8dkMPzb5DdOG135WBqXq+N9eIf8zk0nRlenZUS2TyGS+TYUVfRSXdqndMSPLRiCuaaTCRNGUQDw
	ZdLrUQVCIJ8sHNw3JGYMVviYxg7gveD5tVcoq77cppf52aTtieaRF4vNcvQeWVlzBk08tGdqzo1D8
	8cRjFnCvvMX09OdeJsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgi-008avg-17;
	Thu, 06 Apr 2023 20:58:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgf-008auT-0F
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 20:58:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5205160FCC;
	Thu,  6 Apr 2023 20:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC87C433A4;
	Thu,  6 Apr 2023 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680814707;
	bh=IKUc7m06MHBX8fQN+6StDGew/WwB4gSFHqXLMoZdc6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hE6EUmXBvB/oapBU6JQz1G86QwvtKJsyIQrGqZuTbbye8d/bew9rj99Axy3eaj7iB
	 SzQrJC5gnG0eGKqFFYGvUw9lBGloxOhGIjRoG+PdGj9ewEMlLWnPQjDHBnjubZzlny
	 6kNb9/XkK3FwgSLtf6Lm3MRiKlcr5YxTh00BdQqANtc4HSOYKZR6rxlrOOR5P93IdG
	 viQVGlPFf3lzqodvII69nW/6WoWgOySNkHYpJps7JDUI7Fwh9Dax20lcCN/uF88oxb
	 gVOyGDqMyjehnSKl8RueqNEuhQq/4t8UUY0Qix0MDdNGzjUAS1D4qEaJaWxKm4UG0H
	 yvX9dvGxV6kpg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 1/4] clk: sifive: make SiFive clk drivers depend on ARCH_ symbols
Date: Thu,  6 Apr 2023 21:57:47 +0100
Message-Id: <20230406-groovy-trustable-15853ac0a130@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406-undertake-stowing-50f45b90413a@spud>
References: <20230406-undertake-stowing-50f45b90413a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=sO1/UT/w7gYjWlZwOHP0tQk4JgO6l6TlBFVZlWRWj+w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCn6Rl6X+g7uXuuY+r/Cd6Lg4qlBUjfuP9/Cbrv91v1vJ xZsa63x7ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBELi9iZFgSuGedsIZ+3E+B rPCSuVOVz8UluTYt+ntqsYrClc4zPEqMDH+nqlRInzv/e3HH0tPrDrFcCZrqMFE70UK6u+5h2vS C2+wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_135829_155204_1C65DC77 
X-CRM114-Status: GOOD (  11.91  )
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

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the SiFive clk
drivers to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/sifive/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index b7fde0aadfcb..2322f634a910 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -2,8 +2,8 @@
 
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
-	depends on SOC_SIFIVE || COMPILE_TEST
-	default SOC_SIFIVE
+	depends on ARCH_SIFIVE || COMPILE_TEST
+	default ARCH_SIFIVE
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
@@ -11,7 +11,7 @@ if CLK_SIFIVE
 
 config CLK_SIFIVE_PRCI
 	bool "PRCI driver for SiFive SoCs"
-	default SOC_SIFIVE
+	default ARCH_SIFIVE
 	select RESET_CONTROLLER
 	select RESET_SIMPLE
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
