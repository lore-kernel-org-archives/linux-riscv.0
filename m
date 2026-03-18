Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B7310775E1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMdjOrVXXHLK8N0yejqmWl7GRk54LT5Y+qMFtI5pbCY=; b=OBbtbukEh0L+Zz
	Ori2yPNK2ZHecS0H5RKBLTwMvONn2uHSYup74+DBWt/XD2JbIziAMXXvfClCFs/Pq8JfQtdK4KNTZ
	b5nlX1G6FYKyWnnjZTz7AQ3y7Woh7p2K6MlQR7TnknrIsJvvT4YgDh+/3ppNBsCNYt7ypiw8B2hcy
	L+6xTkgAixNWcj5Xt9sw09iqY7901Ta/vVucorCFqkBboFSA9pHIsBtfFpxsIo0NVkGVDcKfC/r79
	JnjfQVh1hO77hy4LM9HpHCxMTJFqa22j9NKqdQ25/mdFoOcWJiIcJ15EIT2E9izkntgyKFjr8TqLb
	GBkaHBUC8O7V3Fc2wugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuj-00000008y3N-1aII;
	Wed, 18 Mar 2026 16:38:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tug-00000008y0v-3hCx
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81BEF435E7;
	Wed, 18 Mar 2026 16:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AC3C2BCAF;
	Wed, 18 Mar 2026 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851910;
	bh=XKo6oEcfxrAO5a6uL1jOlJ673A3wAiggYrYhD1OOv/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOTU+wykhR1t2yBz7HLBWylJ8vzW13aWPZ5+cme2mPJx4PzhYH8SLecjV2v0jYSMM
	 rCnbFdysf6KC+y4tEV9Qr5vGbZHvEoaZdwRK1vzjvswF6RM/zMnBBr28UJIyZ7+EX4
	 yqzkpIHW1E5bYHEAb4Eh4pofVFQssXnWJmAUKDyPGmSAnCU7e/cfMxjLqxFhNR9hWC
	 0/JqErQPkkNySNiaGwV3usP08phJzQciOGuCJA4moYNO6xNeCtXN5TB7M/bBZHEUHs
	 99gpoP7vKnuJnBErpGbXBsW6RX67vegDO8QlkpoH3QYCM53lDLo4eQhSO7bcJjEwKv
	 mH4G1JlHs9a4g==
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
Subject: [PATCH net-next v4 07/13] net: macb: warn on pclk use as a tsu_clk fallback
Date: Wed, 18 Mar 2026 16:37:38 +0000
Message-ID: <20260318-greeting-tipper-70bbe3e4f5d2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NwKelKp1tigxckCA+KrqnMxOmrCbE/r2GTIcp/cWLQA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlw6dNsuYFtacMqq7q//1V4qRC1xWLXjl59nRwRT5 cVQD8X9HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIuShGhs1Hfp3gPfGZp1L8 9r4Xi9qTXH5mVOaUZV6Z6bdTfJfyRmNGhmnxkvsuzdzd96Rq+1n9OsEX/64UrBBcVrdFv/2o16Y nyzkB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_093830_969065_EC557C67 
X-CRM114-Status: GOOD (  21.90  )
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

The Candence GEM IP has a configuration parameter which determines the
source of the clock used for the timestamp unit (if it is enabled),
switching it between using the pclk and a dedicated input.

When ptp support was added to the macb driver, a new tsu_clk was added
to represent the dedicated input. While this is understandable, I think
it is bug prone and that the tsu_clk should represent whatever clock is
used for the timestamper and not just that specific input.

>From a driver point of view, the benefit of taking the conceptual
approach is avoiding misconfiguring the driver when the hardware
supports ptp (and it is set as a capability in the relevant per-device
structure) but no tsu_clk is provided in devicetree. At the moment, the
timestamper will be registered and programmed with an increment that
reflects the pclk in these cases, but will malfunction if the pclk and
tsu_clk frequencies do not match. Obviously, this means the devicetree
incorrectly represents the hardware, but this change in approach would
make the driver more resilient without meaningfully impacting correctly
described users.

Out of the devices that claim MACB_CAPS_GEM_HAS_PTP the fu540, mpfs,
sama5d2 and sama7g5-emac (but not sama7g5-gem) are at risk of having
this problem with the in-kernel devicetrees. mpfs and sama7g5-emac
have been confirmed to be incorrect, and sama5d2 is correct. It may be
that the other platforms actually do use the pclk for the timestamper
(either by supplying pclk to the tsu_clk input of the IP, or by having
the IP block configured to use pclk instead of the tsu_clk input), but
at least two are wrong, as they do not use pclk for the tsu_clk, so the
driver is registering the ptp clock incorrectly.

Add a warning if no tsu_clk is provided on a platform that uses the
timerstamper, to encourage people to specifically provide a tsu_clk and
avoid silently registering the timerstamper with the wrong clock. If the
pclk is actually used, it can be provided as a tsu_clk for improved
clarity in devicetrees.

While this changes the meaning of the devicetree property, it is
backwards compatible as there's no functional change for platforms that
didn't provide a tsu_clk and the changed meaning of providing a tsu_clk
in the devicetree does not impact platforms that already provided one as
the decision about the tsu clock source is at IP instantiation time
rather than at runtime, so there's no driver behaviour that needs to
change based on the input to the IP used for the timestamping unit.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b476bc9663ecd..6b37598ac57cd 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3534,6 +3534,7 @@ static unsigned int gem_get_tsu_rate(struct macb *bp)
 	else if (!IS_ERR(bp->pclk)) {
 		tsu_clk = bp->pclk;
 		tsu_rate = clk_get_rate(tsu_clk);
+		dev_warn(&bp->pdev->dev, "devicetree missing tsu_clk, using pclk as fallback\n");
 	} else
 		return -ENOTSUPP;
 	return tsu_rate;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
