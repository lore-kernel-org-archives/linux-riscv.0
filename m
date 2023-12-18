Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C04FC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 21:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NagwNG6i8AkTwBUNJNhwJm2L07b45msTMlTdCSUXoNA=; b=1OGZrF1h2X+OwE
	Qk0mvBqzSSUUyiTP5kNFLG/Zkxmh2clbUMt5rs9y6tFqsudghhj2WfrZHc1Fb3HSKX5Arv5a89ZiU
	Bpke6xonVI2/tCluaelC21UimfguPogG5Ef3l9Ba7bRVKVRfA8wgvuNHwMPQ/H2wxUfZiB2oXS+op
	zsXStjPgPXuFKF3XTtLz0oYCRADKONVOzmypBM+wQ1MQ1u8+M9wWkMM7US3r3REaGvpw+azSGipA5
	1KDFQZxtVJdhZlAaNaXczreSQ8W2Sk9OqtrsZIjW2ubn0Xdfr8frTpetNs24Fzqimi/koEO31RZdg
	+boeybALHdqA/R0B4nVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLQp-00C9ee-2y;
	Mon, 18 Dec 2023 21:45:47 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLQ8-00C9BZ-2Y;
	Mon, 18 Dec 2023 21:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702935903;
	bh=PX9WR1wsK5Wtdc1EF8E/KGnEO4lLD+GneTrUOqNm76c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o2FDqXiNcCLgRFLH5qXcvMq2L1svg6g+4RfB6S3dIApGqILH0GwNj0NiXlz8iPutr
	 geetWUt63bwQm91x8TyEmvlUh0T/PaqEddJRgiJYx5sbplzUT1T1za7+AGId3t2qKt
	 V1gA9RmLAJ8S+OBauEmtxJBVuKgi1ddHCEjSwN4mNF84mBQx9LJAq3JVIi3eYLZh0j
	 IoyY+9+Z7Zh37qJXhYZuOxKBl64KAsR++zRBXOf/8bDh6/O8/1llN5K3QU01Awdg/V
	 TO4Kvjp1DcCxG2+q3yRTSufKxsDmLzB4I1HiHcI9lPtrLnQ80x0Za4EUiVCm8bdK9R
	 6zDcFd2WpG5hA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A6753781495;
	Mon, 18 Dec 2023 21:45:03 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v4 9/9] clk: starfive: jh7100: Add CLK_SET_RATE_PARENT to gmac_tx
Date: Mon, 18 Dec 2023 23:44:49 +0200
Message-ID: <20231218214451.2345691-10-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_134504_974577_0F0FDC4E 
X-CRM114-Status: GOOD (  11.86  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

This is needed by the dwmac-starfive ethernet driver to set the clock
for 1000, 100 and 10 Mbps links properly.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/clk/starfive/clk-starfive-jh7100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
index d3b260c01d5c..03f6f26a15d8 100644
--- a/drivers/clk/starfive/clk-starfive-jh7100.c
+++ b/drivers/clk/starfive/clk-starfive-jh7100.c
@@ -200,7 +200,7 @@ static const struct jh71x0_clk_data jh7100_clk_data[] __initconst = {
 	JH71X0_GDIV(JH7100_CLK_GMAC_GTX, "gmac_gtxclk", 0, 255, JH7100_CLK_GMAC_ROOT_DIV),
 	JH71X0_GDIV(JH7100_CLK_GMAC_RMII_TX, "gmac_rmii_txclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
 	JH71X0_GDIV(JH7100_CLK_GMAC_RMII_RX, "gmac_rmii_rxclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
-	JH71X0__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", 0, 3,
+	JH71X0__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 3,
 		    JH7100_CLK_GMAC_GTX,
 		    JH7100_CLK_GMAC_TX_INV,
 		    JH7100_CLK_GMAC_RMII_TX),
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
