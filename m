Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3A8CF9C46
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8Vk/02yxp+LlNcg+fpdgr+vGJxW9yURMe2kQyuoOKk=; b=NGoXuO6GlAl3py
	U/uBUYVJ9YDEMjxIxPIwEv7ZIm7m4HUwX13Y3vevdMPhsfd+FeIlxZ0Eh6rr264Hqz6GYHfsJ8Qvs
	Njt6lC4mf4brGGae7JPb3fjfJZoiWuaNOVPvk35P/hKcfOSSuauEFS00RC98xT+PBumnCSQMmOSTy
	2EW+zdIKkiF7cWawauNz1rlbBInp/xb7i1TsKeNarHKbLIinVeWjqn2ba+djrEhmK8DnFDjfLcHpF
	BQ1U5B6pmSIMYGXE8W570f0rDpfUGS0OP9k4IpKOhcZX7wcNP6JJboa9heTHo+SIpGF7s+uMkqKNA
	eL+8JLOPsvL4akRfojSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Uq-000000070ct-3OXo;
	Thu, 20 Nov 2025 16:27:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Up-000000070bA-0bWB
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E768601BB;
	Thu, 20 Nov 2025 16:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E521C4CEF1;
	Thu, 20 Nov 2025 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656018;
	bh=vyKf7oAe73jG7REVIeUhuNZDGGytb/NVXkzSMRKd0IY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1U8Lsrs/SxWVweihN4p0v2fQXX5uuo5KT1E0ATmGO7U44Cg1lZoRLt2akgeKu5Eu
	 PhVO5/ACbGAAMWNLo37apEbqD/B6pt5iXzcQylc8Fuo+KwWMVAxs9vKh9KtKHRsp3I
	 BF5MyxkA8z+Z2FakraOKNu8wzeBjd7VQYsEIMEin7CXevE6XJnzIziNcuzcLF7/ooQ
	 eGum4pIH22+TM8VL8dzK5EgnpvgL5JEavG3gjOb13fdaJenmDJpMu5GUCa9u8rTIzq
	 xeZSeTNSzZ0LdFZveCpuaO/nQXKN/TKwcEVRD8upoH5VE0V/ScIylChZgSZIKbOeP7
	 234s5P0on+iKQ==
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
	Abin Joseph <abin.joseph@amd.com>
Subject: [RFC net-next v1 6/7] net: macb: afaict, the driver doesn't support tsu timer adjust mode
Date: Thu, 20 Nov 2025 16:26:08 +0000
Message-ID: <20251120-grudging-gargle-690dad0a5c5f@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
References: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QT0eIvEE2MWf5tzLxJfFcb6I4liyojXQm/8lvAoxpqw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnyjtKnJH/Lxxx509ptxp515eBnJpeuOYL35+0MqxUql ki+Fzito5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNpqmX4X3H0yh7VtcUdBfyq VSytl5j+zt/+vuHQnrgJbv8E8wXX2jEytFx9vHXprXMbp3Nyhx7ercrvwSgSGSN/LqVpzmqBPZ0 nmAE=
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

The ptp portion of this driver controls the tsu's timer, which is not
compatible with the hardware trying to control it via the
gem_tsu_inc_ctrl and gem_tsu_ms inputs afaict. Abort probe if someone
tries to use it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 21045575f19c..4ad1409dab63 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5531,6 +5531,12 @@ static int macb_probe(struct platform_device *pdev)
 
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
