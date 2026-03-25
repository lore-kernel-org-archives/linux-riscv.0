Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF6EFEC11F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLpuFvfr0PEtzX10NrhQdrU6sYKvSmfWxq+t7xGtCQ4=; b=jCk5sfPuraR6zV
	/h9Iq3tdo+iT+O2JRO9ceNTXOj5pebg4MXECLJvNrm7pwXd5X0w6fxoRivObW+NrCZCzzUWUNA+Aa
	7qHYBYu8T7c6meXOpq9aihdwd2jcMLiV4PnJgU+J2Z8iWOGxrDEuZUf7241cxBvXNoe/EMIoK1i0n
	FsrzVwEFjCA94qlXn0LEpg+jE2xAIuyV9ef0EjgNNe9IPZCPwoQ8rdCQ2xPxvpPVKK51+LV9i3LCT
	j3wyamzyor6N6FFhWu88aLtGOndp1ovuullTatO94aM6GFvCIeIUGf0SV4Vco1p3zT8XVzDlpq06r
	KD9KGy4zaXBSUs+4OSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7E-00000003tSi-3V83;
	Wed, 25 Mar 2026 16:29:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7D-00000003tRz-3OkP
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D587600AC;
	Wed, 25 Mar 2026 16:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D603C19423;
	Wed, 25 Mar 2026 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456194;
	bh=DVwy/SiED1aUxG3GP52kN89RSs8GgqpP4611q2+C8S4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HPc/4aTDLITG0PNefDLdDWiTkQObOQxOwedpjrYDouUexkm1Ukh3SegG+qh8xfFRw
	 yZHIBiq6eb/HqmBnTRyFqULAmHI/B66dr14N1tBbFqUG3d3/u9T4aGaVKQ5raLiBcq
	 CVpmBI3U7iIudADuyAgU54pSqfX1VyPLjM2q5AzKRc7ANVOdao/qIkrFcZ/J0g0lOF
	 5GRDW7mCXodlVAFx9e35PV+gcz0DCR2YRMC+m8slG/dqZwhyQy/wy67lenV+nVY7jm
	 N/BS//AXLAmDEuTyfVml6nwqRrqslBxOCbkrI0B00pQiPYySdgcPb3kFy4iWbWYciS
	 Tacf5F0sMHIfQ==
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com,
	Kevin Hao <haokexin@gmail.com>
Subject: [PATCH net-next v5 11/14] net: macb: timer adjust mode is not supported
Date: Wed, 25 Mar 2026 16:28:15 +0000
Message-ID: <20260325-facebook-chop-cf792c53f1da@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=im8X4CvHY/qWpTRXmAP5CqBJbYe51EIu9ctXDYbqxgw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM1rp67OPT7jieVu+R6hYxpTKkoEJZ69f57+ZdW5+ bO/lVTu6yhlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEjuox/NP+FhPBefNM3PrF Tikl3z893qFcU6OSfPFw65IYxtUyFRsYGR4FTWJbo3DPROyB8otIRxPPG4Emp4/73zzvoFOV++D 8BQYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
 drivers/net/ethernet/cadence/macb_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b28fb771e03ba..58d89b9e2f08e 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5838,6 +5838,13 @@ static int macb_probe(struct platform_device *pdev)
 
 	bp->usrio = macb_config->usrio;
 
+	if (of_property_read_bool(bp->pdev->dev.of_node, "cdns,timer-adjust") &&
+			IS_ENABLED(CONFIG_MACB_USE_HWSTAMP)) {
+		dev_err(&pdev->dev, "Timer adjust mode is not supported\n");
+		err = -EINVAL;
+		goto err_out_free_netdev;
+	}
+
 	/* By default we set to partial store and forward mode for zynqmp.
 	 * Disable if not set in devicetree.
 	 */
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
