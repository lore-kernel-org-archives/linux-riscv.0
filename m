Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7FE10775E1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQGYMmVBeGCgVVOl1MOnNuTXMY4CKDc3Z2PWWDjNRX8=; b=Q/3R54jU7Wkuoa
	w5higL72YnzTBY4PmAkbRBqOp8xX2DZ3KRAQW06jZZszS9Oa8JQQNTH6p71xpLfycazcWwZs8z1A3
	y8B+BtOjAKMlLDUaOgcI3im2BHKL9jvTsTPW6tCQ+gGBSnklJQQG2JGAa0/yHlvLDKrnwNIG3c370
	BTzsV+DZGclCqZv1peB1A7ANBIoDZ4SrQ7cpsdddJdkAbZKezFRwAX7oy7/FqAX73NiDaDlS6bll3
	inJ9dI19J7F6AqHZ15km3NqdR78BHN2BMzehXSNk1z5WL58tXYJq5MPcVvwD9Y8iPmCs+RY79D8jX
	h048sXzUbvLufMwF6RoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tv4-00000008yJh-1eDZ;
	Wed, 18 Mar 2026 16:38:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tv2-00000008yHB-3Pur
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=J6RjHjBxLKASBqsPqRkDWJ/hIESdR/fTnV+eVP5JJ9U=; b=aRcBB9jhRcijuPWyxgnnWzttw8
	jt/LG89TnC809rRw9bGBfe5eHGcNE6Xq79PBQ13Btll72hVYsdO6ufzbSJb7WK4A6PcWu6+whnaQd
	GIyvzvWwwCFCX1Bpz57uwg/26r81cK+EpjhyUb/fKI0Rp7p1TSSW2Jkr9BRxUvBlRngNSaMfZTmO2
	mrfi2suHg2/lA8CwXZ+GPeDCL8S3kVQ+xBqTamhEx2yTO/yPaCUqyrS2zBDvGkRIXspuahDBN0ri4
	YIMEw6+9eR5M3EbPbQvvnVYS7+o4W0v7pWLaaE+AD9zAvRI6gBypd2wh0JSBf1lVX/NiOywi79x08
	ZjUNvJEw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuy-0000000Bk8Q-4AZC
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC79E43711;
	Wed, 18 Mar 2026 16:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFC3C19421;
	Wed, 18 Mar 2026 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851927;
	bh=9DLc73kRovjX7PmKOfMC6v7DvLF8VkwF6ivlc5RlT3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YIOHMbPJf94NLNUV9jBhDq41CqmoAepK1RX00vXTypZdd1Gf/FXdTqWm+vWLDl/Dc
	 z5HZrY53xhay2S8W2IlAc42Oprs3LMHYhN1SSKUmrLI1+Qtm/9frgSpmvy2NsH2uw3
	 HeUtp/DW4zBd/LAMS1FqxkwOnm/tmY2Sw8+jwQghQxKzIUmv6fa++lojdsEtg3/Xjy
	 lg0i3TCZ5CTPJWplenL3FZsND6BhFUW+OW/DdWh2qGd3hWlcESXSPOxysSu7XGBqz0
	 5WJU2rnPtXAd/v05vFNmVtOV/1M/OxHRzOgmeAulaENRNxEcw8u8QXvRhaCVlIJfU0
	 tONegjVjLtA8A==
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
	Ryan.Wanner@microchip.com
Subject: [PATCH net-next v4 10/13] net: macb: timer adjust mode is not supported
Date: Wed, 18 Mar 2026 16:37:41 +0000
Message-ID: <20260318-armless-generic-9845d484aca1@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OqQujPb90kYRx/KgLbRe0CGbTbZ7JG8YWaMugKJ3peY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlyK+v2e34jRK2GFxczui4m7r0TEORfH88Rvk5v+P OhXxxqPjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEby/D/9Km8GvK54x0bmxi OhdTdYFlt3b2B7XkFq4j57JfmAk83MXwh+f2hZZnh3OtsmtMv9vueLa9saIl62WFk/cDw6d+M+c EsgIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_163849_419889_798B5E90 
X-CRM114-Status: GOOD (  12.23  )
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
index 38e75c2e097bf..3e0ab23e9b9b0 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5577,6 +5577,13 @@ static int macb_probe(struct platform_device *pdev)
 
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
