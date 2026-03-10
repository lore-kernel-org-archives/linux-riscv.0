Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF263FD4F08
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzUAnr5smveB676PcnM+wUSL2ihBKAKuOVfr83fd/Mk=; b=jfSN8OfLh+uFD/
	l/2bKUwYmYwrXVWKpGH/6CStveiYSv2rbRMX2/aqwZT+WmNWcFyBh9LH9FGQE1p4s0A0OHjBKpSu+
	lziPc17LoZPVfCV9jcJnZmPovdOzCtnk2OWTx5tAo7wqkqHLYmWUKClvVuofn7HgKLxHK8yc/OVzn
	AhxuUusp4ro4U3LgIc8DdXp58QE/OAoU79YjfQR5xbDYI7LQjRQ7h4lYwz32cWJicLve73JP8aJA+
	+k6cMOq3YBbPS6HkpXrQWOyezAQsUy1GLWnm6MJRh84JaBPCriNWqYAvzkf6GkisFx9zQrbVFDCc3
	UHfH0qPLvZSaeBgQWMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jl-00000009xt9-0AwJ;
	Tue, 10 Mar 2026 17:19:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00ji-00000009xrd-0WCI
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 17:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B21C7402E6;
	Tue, 10 Mar 2026 17:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45606C2BCB3;
	Tue, 10 Mar 2026 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163153;
	bh=hLF9AXo3lnRxCyN0gi/H0Xuz7Ot4l/b2adjyOOaaEI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bwf9qDw/MyxKklGxC1YMHWeNHNONf3PTOcwDD4Egre0SngpWtcsBvesiwLKTh50Mx
	 twUPpUQyBtpbZ9HFZd2z1eKEIzF2czgc+UvQqRIuCs53UI7vjAFJhfep22/GZC+c2D
	 DWhGCXdky/T/eSKNQGz/cuC053Mgz7Uf7b1K3Zh1eyPd4tSXCKVZiR8OaA7aOXRtn9
	 mc/hhN9BKI/c0ii/rKR6VidQ5QHZu2fpqyvMsM8vbZTGqsbdAuk/1OGcisp4Ua08LS
	 E53Qb8ui27LsD9n+MWnaC9ihLePi9a54xC2vEMsU+yUxyt21j0vau9OY4HAZWJ5/0j
	 z7vizcfy6LPlQ==
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
Subject: [PATCH net-next v3 05/10] net: macb: np4 doesn't need a usrio pointer
Date: Tue, 10 Mar 2026 17:17:12 +0000
Message-ID: <20260310-stubbed-passenger-30e7c6736c8f@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310-moneyless-dispense-7bce14b16388@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=F9UBzeUId/kao0gPpAeZyIh8nfmZqgwg0AfcGoyheCk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbgnRnL/waZl51aLHuooOxwpu1ZV4f5ND/qXL4K/s11 ynlgs4HO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARpVBGhn3be72Xx19sM54R xsaVtjxmCluD96SI/ZkeecynY3bM+sHIcC2hKF/LUIFvZvyiR2pvzXz/i4XrpPvEdjAcqd7g+fE MIwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_101914_192086_8DDD3C56 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

USRIO is disabled on this platform, having a pointer to a usrio config
structure doesn't actually do anything other than look weird.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 1f9e46cf7e1cb..414a8fa3f99d9 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5349,7 +5349,6 @@ static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config zynqmp_config = {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
