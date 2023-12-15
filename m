Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2F6C46CA2
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 20:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NagwNG6i8AkTwBUNJNhwJm2L07b45msTMlTdCSUXoNA=; b=To9QJZsTZJVmGB
	C+KU0+L5gNB6nDZgTNtxUoD8VmqmfG1BYlrMKuvwBPV3AeGmKBdlk/HQihz1ZaMnfHYIp7OAfi1iK
	9js7fMp/1UlrFrxS5CbY9d/+2Z/cpFwvg64Z5MJByvSa9y4Y9AF9f6z1FjZ52wZhDjNBltnKG87Q5
	w0Zp6dKUhXShuIccWKY6IkxqU6SOS6vlFdZRRyfvhveg3wkpdiEUOiN7zlji26AcXQET0DKlRoIk2
	Rov8XM6GBBF6XtAU/2/GIQRv5VkBlT9z+Sx2/iGqMylEznFi6sQy5jBPYSokwEorxAU/oD1SHFUIK
	yAOdTJ7EKKhugIHLVsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEF0N-004VVU-2d;
	Fri, 15 Dec 2023 20:41:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEzX-004Urf-1A;
	Fri, 15 Dec 2023 20:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702672862;
	bh=PX9WR1wsK5Wtdc1EF8E/KGnEO4lLD+GneTrUOqNm76c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=frCB9iKGAFAbOSItOQhGFfLXvx9vsuCY61t3pn/0ExlBYpg81tQiLBxsyJTxGwirT
	 DJqUznLKLDhJhir8+g3J3t50E+1BNtzr03kTeQmUdLpvaO9CYcGLaiB4rGT2qo8u/G
	 UgSQThlnUSPe4zYlhgeJnEsCSEA8DHhtnpWJVfM10agkJXaqSw2V0z5zyd24vyhsEy
	 VnJwjlmjjCELpN4d2D9fXymH8LvoG1VBS470YZWeXXqOQZin3Piv/Z9JH9TPD1lUCg
	 7BT5BMcRAiLNRpBGiyKUIaWzuFzksG/Y3oqIiuHX13Y/ICeyIbVSenwi4q2EJLRYrK
	 MgQUWJy7AM0uA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F09763781FEB;
	Fri, 15 Dec 2023 20:41:01 +0000 (UTC)
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
Subject: [PATCH v3 9/9] clk: starfive: jh7100: Add CLK_SET_RATE_PARENT to gmac_tx
Date: Fri, 15 Dec 2023 22:40:48 +0200
Message-ID: <20231215204050.2296404-10-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_124103_570537_ABF77321 
X-CRM114-Status: GOOD (  12.25  )
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
