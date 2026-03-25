Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866CE109C036
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JM1Yot8TTZ1XY5RBBr4LGQ4NiNz9Sn24+6ZRd+d76aQ=; b=bk0Xx2rvpJANE5
	PoTOyUN3OG9rkRMzsoJLnV4QLpeDj82nLq2pw66g0f0bGOPQTExHwmYW7dRoRNdM5RSm8oZwRALyi
	EZXzXb9IVb78OYFTMeF0PeECZ36y8qi4og9yxqbLBdEfB6Img1NMS6aUsq7+xTh/Mx6FtJ1AcJOMS
	Gmi1dzyoH1UCVKZpbx0RbvacrqL9r87jaymIJ7HAWyxcwqinNy/FlvbFtok02ruj6dB0Fnizv2sFV
	kZozeJd1tmb876pBGucbub1F8+SfbKhlrQQHRqth+lScfp+WxnaVJtEHC91a6BljedrfSYbNYcBxm
	DkzaGnXb3bKGws5n2HRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6x-00000003tHw-3izo;
	Wed, 25 Mar 2026 16:29:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6w-00000003tGy-0R5K
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A80D60121;
	Wed, 25 Mar 2026 16:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98A2C4CEF7;
	Wed, 25 Mar 2026 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456177;
	bh=sDKThMtcyv96eXzde374X1AAM94GvTAWHU4orvZhEwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MS6uB1MX2q9Paw6Kikz5NNoqJupOFaj5jDJWZhAgnnC81BSka69lhSE4A1UbpFONM
	 BGGgoYiWk7oUX7Xj2M5MvPh+2RWetfUBE2uhxvIRIQStdj+XePpoiThICHLB3TYp4M
	 WZ2ifKnyqqQiZ7Xwt616WmuqRBwOrTe/Ia0LRZsC6QClIMGGr5OnqS69SwgOblf52/
	 JDDRKL6ioCWBkY/PPkZvsx2oQDvLgG8kFOyy+bgylY4g8FKg2XyUjTvLRJpdqj/eiA
	 848IuWYQCxe+Yp0GzFnViHeUHuS77Tssx+OTY0yQAXaIrZMyZE+uzoAzbiLTLZGVJF
	 ukiwetmSFy+SQ==
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
Subject: [PATCH net-next v5 08/14] net: macb: warn on pclk use as a tsu_clk fallback
Date: Wed, 25 Mar 2026 16:28:12 +0000
Message-ID: <20260325-dust-revision-368053e82d0e@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4hRMpr9HKqtdLE/ntrih5qOpiY9u0EHTozFQCcK6pdI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM2aCr9v1wvVbpZf+I7/849DjGvFm1KeHi6tbHtfZ jT12vo/HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI2R6G/15cZoGH1m1pf9TW uOqN1rxbv+MqdjxPqmFaVNCgMe9f9U5GhjNum4O894qYGuzLO7z21/QjwXaif0MYtoipB1mfzIy 4yAAA
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
index 4e5967e6ffbe5..492abe1e33b3a 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3772,6 +3772,7 @@ static unsigned int gem_get_tsu_rate(struct macb *bp)
 	else if (!IS_ERR(bp->pclk)) {
 		tsu_clk = bp->pclk;
 		tsu_rate = clk_get_rate(tsu_clk);
+		dev_warn(&bp->pdev->dev, "devicetree missing tsu_clk, using pclk as fallback\n");
 	} else
 		return -ENOTSUPP;
 	return tsu_rate;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
