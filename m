Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED163FC592B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Nhhe0P6kC5a5sUf7oC0s3P9t0jrzp+cwWjDGfJcw28=; b=er6ghCP/trzXPl
	3eH3iv+1nDO03WFz4SlEiWILE9IjXUjQen+q58IhrqE5EJVi49dCkI07YYxmbQz11EHtYvOBII3W0
	P65aQ8z8kr+55wFp2jaHmGKTmnstzlXZEPZl0302/7+LyW63FzVZSj8bfeVSTDsdHzsATf0d9glBx
	BUCnxkSRyFYZYaYO3wGp5Rc/lk+PJKolBZVKyLg4P3kFlQQuJBePQxa3ZmVvqCf9c4vdKruxMKtqI
	oy7k3HmHz38DXotaobGlGVxEbO25QxGNsCz1qkLjnJkkPg8uEKWAoYnMLVDv0oTRQVaTVktzLn8x5
	gD5JERponU0vBZMzBjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZAC-00000005ywI-0wm0;
	Thu, 26 Feb 2026 11:04:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZA9-00000005yvX-293Y
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E8E343BA6;
	Thu, 26 Feb 2026 11:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC113C19422;
	Thu, 26 Feb 2026 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103849;
	bh=eeYz6zI8m7LMZepqFrVEA7MQyer3DvTEMH8GCtn3pmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoU8M3tbmKgO4ru/+HbIjF0dJZKZwCsfpCcEULrgHAHMfAjUrlbT2LbzzwQwo9PdQ
	 UkEy4TwZX73nGKnP57QUrzk0KOYyRNPjn2gKfnqWHPKTcBdV4jiO7CQMt36E22wRvF
	 9wa5NJESCGPU0+XBjAwl+ElS2KPvyBpby7qaSsENMtZpWk4wmmu/q0HX+CNLIJnScN
	 JgaAMx3mPIHo1s2XfBcwGnmkOcN4vYC5nwAPEjZ79tAExtDW9rskZbv/swUdJ2aveX
	 YbklJJh3/qTRXVCS0WUYgzLLPAuEOV0iXzqVQDxuFivrJ2XCRVbv/t0frp6pbIInxw
	 7gun6YIW9uoBA==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v2 5/8] net: macb: timer adjust mode is not supported
Date: Thu, 26 Feb 2026 11:03:20 +0000
Message-ID: <20260226-dollop-maturing-9e3c83192ee5@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226-snowshoe-amusable-6716d4ddea11@spud>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=KRrduA/pCBBIY5BCiuiQyuvVljzb1F3SRIwOIkFLtvg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLNMqn1wXsTEopsHuprm2yJW2yfGLGgY3d109kRpRmm RzyaOruKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwESev2NkmNoYsPpnlInajFud /66LMaZ+jl6rc+6A8owje/00lIofZzEyvLp65MGOr97211dU6AvLXD5TzzY94tSkFxt3sxVb5vD fYwYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_030409_588712_563679E5 
X-CRM114-Status: GOOD (  11.56  )
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

The ptp portion of this driver controls the tsu's timer using the
controls for "increment mode", which is not compatible with the hardware
trying to control it via the gem_tsu_inc_ctrl and gem_tsu_ms inputs in
"timer adjust mode". Abort probe if the property signalling that the
relevant signals have been wired up is present.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index ddbb0c327b303..fa55e6e7036f2 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5535,6 +5535,12 @@ static int macb_probe(struct platform_device *pdev)
 
 	bp->usrio = macb_config->usrio;
 
+	if (of_property_read_bool(bp->pdev->dev.of_node, "cdns,timer-adjust") &&
+			IS_ENABLED(CONFIG_MACB_USE_HWSTAMP)) {
+		dev_err(&pdev->dev, "Timer adjust mode is not supported\n");
+		goto err_out_free_netdev;
+	}
+
 	/* By default we set to partial store and forward mode for zynqmp.
 	 * Disable if not set in devicetree.
 	 */
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
