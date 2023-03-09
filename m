Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8114FC6FD19
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 20:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2aozNN2oWniPbdj/ln0wbifVJQuT4iG6ZqB732Ns5U=; b=JmNUvHyv55/U+S
	vn77//H6+r+P6thwmcK2/gNau+JoD5VRlv5hQzUvEcwsFke/zBf3BSds1bubPBNOqiKMJaW9guiPY
	MK8yFeY6MXWAj5QKWR5H1xNUG2x2n5MbHseS95Tg9TLshSSd0PYRUiYFS3FptWfjUIYUEg0N4r4pG
	T8AVYF1uwfajnocjElwFJ7VcD2eFaZZRxNqxurfLasMchjuSY2I4GptisWMOZzHKgavH1rxf4q5tv
	iItBdqNVSQWsTGG7ox7c4/XbcZg/c4bE5fAPP3qsW38yeRMk7HY6NoYiKrbSOtxdtNqgHSw90Bcwy
	aEATEaFSPDOvnvhEEuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8X-00Bnun-Ef; Thu, 09 Mar 2023 20:45:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8U-00Bntn-Pl
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 20:45:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E8CB61CE2;
	Thu,  9 Mar 2023 20:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2028DC433A1;
	Thu,  9 Mar 2023 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394713;
	bh=9xUeuaqJETlsyaOBibq9HqTPqXfzlcN4B6jvEtDgTas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGDw9GshVwKoLdPjIxK7oLw5/ilRPAbxYq2j8YmvhFhgVyAO35+tbtndgxNXvKMRL
	 iK53TmvKBXT0GSYoe73SHWiQj99xtJpRqm8vYgegX5YvVkyNzCZAGj1hsPdWIP33PE
	 rAon7G0u84acHoFx6kkbNweOuOZIpIqf20ZUU7DB0dGj9L3Ev8F3pU+jxvPZz86glJ
	 PPG5D0pWD3Enk3hWsglJwq90cYf39JWVqlFyq9AQCtZ1BLU98XQwy+LjCctHLx69d3
	 h1py7sojz8cheFE7AuDBynp+jMZ7+uKsdn4Tfs0mHV2N1a0Fn51PfyiAdKbq5m4ODo
	 L1YiQVAUFhr5Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-clk@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 3/5] mailbox: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date: Thu,  9 Mar 2023 20:44:50 +0000
Message-Id: <20230309204452.969574-4-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=848; i=conor.dooley@microchip.com; h=from:subject; bh=9jucC2HUrzLki0OwISlZ9w8uDjkgxcnchy6bulfM2rU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs5LlmjGTr4Vo/ArYPZ9o861T3331dyTmHN/2acCb enQzI6pHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI+2xGhq29az7az0/S6le8 qOpTu2PK3jz/N/bBDLOyj37pS3uXlcrw3715goRcWcSTRt239Rt6jzHcW6On9mZh+NuUzZtmN1o qMwEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_124514_898510_B827DAFA 
X-CRM114-Status: GOOD (  14.93  )
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
use of such symbols on other architectures, convert the Microchip FPGA
mailbox driver to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 1495965bc394..3f97d5535267 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -176,7 +176,7 @@ config MAILBOX_TEST
 config POLARFIRE_SOC_MAILBOX
 	tristate "PolarFire SoC (MPFS) Mailbox"
 	depends on HAS_IOMEM
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	help
 	  This driver adds support for the PolarFire SoC (MPFS) mailbox controller.
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
