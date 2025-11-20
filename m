Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FE6CF9C46
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7eyUp5D3eUr87dC6YrhbsehXzI2XD6jjivHsLMRC3c=; b=wOOmdDKUmbS4ND
	108ijKECoN2RZaPQiqeE/NAiU+WpY4IQSrLY2L1K2CuJn+8FrpvORQ0D3PoLVbLQ5vT0ZZ+yL0mGk
	y8Db5A9dFYM4VtURKH4RMTcXdBpPHNq1CtI2rzOwMnEjVFSHOQDOGS7uc03gESDOST2/hjmLAPfDF
	eW7Kp4/5HCbzmKIX3A4pWGsiDcOEbRBn2oJcm2l906ZO69ZFby8WZV8JkZBPr8OCCP4C9t+8nShi9
	G9fyQTgzxs8VPYD8FZYcsPBVh5hKwXHok4LW3OQtPStbDKDgAYtTziiO680FcYYxY1QHIEH9RWJDm
	ePntdDpxzGb5rRX7o2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7UU-000000070P9-2a8M;
	Thu, 20 Nov 2025 16:26:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7US-000000070Nt-0MCZ
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C67F5443D8;
	Thu, 20 Nov 2025 16:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E99CC4CEF1;
	Thu, 20 Nov 2025 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763655995;
	bh=uTA+9by6WkTj/YyfrRJaP6uWrGxXUK8E1OGGD6svXNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OUP7Q68P6m2hQLa6Yx7/cAJrv+1/blhA4zCLQkPSXtvz+EUdA88migDRkMrmrJtr3
	 rwkZywC88dG/x/WIvmwd8dWAc4WjKgyQk1h2B2ff0i35FqCZYsW2PGjBXLvcrQojYh
	 zng3tHYtG+JYW92klZlGfZMReaaRa8rrgS1WNSmddn6MJlSkGxM+Xt6qEP12mruCq/
	 03ba7fOIMgi4EiaGOZYumPnQ4RzqkwT7XDOgMFpgi/W7gK5bx6+zy2Q7us9EAsnrOg
	 S1HiJKY7NOLd1ivURQSDxb4zo98lUBDZOfWf9Aduo8+KIqV/hV+zmoq6D6liINiaKn
	 dwI8HjbFJkVLw==
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
Subject: [RFC net-next v1 2/7] net: macb: warn on pclk use as a tsu_clk fallback
Date: Thu, 20 Nov 2025 16:26:04 +0000
Message-ID: <20251120-guts-grandma-15cf7838b0aa@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
References: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3306; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=v3962aZmMGVHfkgDFXhApnPxgvXxwo2H9ZQ6D4IRJzc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnyjlISvNuTixaHS5zRuum9YtpeL9Gd2wMfnnvxYrvD/ xl+FlLZHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIpRTDXzHxP/+K5azEdgRr Npk+f77oxd69tzgvGVydXrg6YFLlBjaG/44bVqw1O7blu4GbwFeTrdxPrgWn6yml68RXJSl/fBc tyg4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_082636_163756_EC183AC6 
X-CRM114-Status: GOOD (  25.59  )
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

Not a serious patch as-is, but I think this pclk fallback code is not
really a good idea.

I think the reason that it exists is that there is a parameter for the
IP that will make the hardware use the pclk to clock the timestamper,
but from a devicetree and driver point of view I don't think this is
actually really relevant and this code is just bug prone.

It makes more sense for the binding/driver if the tsu_clk clock
represents whatever clock is clocking the timestamper, not specifically
the tsu_clk input to the IP block, because what it does at the moment
will register the ptp clock with an incorrect clock in the "right" (or
wrong I guess) circumstances. This can happen when the capability
MACB_CAPS_GEM_HAS_PTP is set for the integration, MACB_USE_HWSTAMP is
set (which a multiplatform kernel would) but the devicetree does not
provide a tsu_clk. Sure, that probably means the devicetree is wrong,
but there's no per-compatible clocks enforcement in the binding so
getting it right might not be so easy!

It's my opinion that, regardless of the way the parameter is set, it
makes sense for the binding/driver if the "tsu_clk" clock actually
represents the clock being used by the timestamper, not strictly the
clock provided to the tsu_clk input to the IP block. That's because
there appears to be nothing done differently between the two cases
w.r.t. configuring the hardware at runtime and it allows us to be sure
the ptp clock will not be registered with the wrong clock. Obviously,
for compatibility reasons I can't just delete this fallback though,
because there are devices using it, so just warn in the hopes that the
devices that actually use pclk for the timestamper can be updated to
explicitly provide it.

Out of the devices that claim MACB_CAPS_GEM_HAS_PTP the fu540, mpfs,
sama5d2 and sama7g5-emac (but not sama7g5-gem) are at risk of having
this problem. It may be that these platforms actually do use the pclk
for the timestamper (either by supplying pclk to the tsu_clk input of
the IP, or by having the IP block configured to use pclk instead of the
tsu_clk input). mpfs is wrong though, it does not use pclk for the
tsu_clk, so the driver is registering the ptp clock incorrectly.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
As I say, not a serious patch at the moment, but I'd like to know what
folks think here. All of the Xilinx platforms I looked at explicitly
provide the tsu_clk, so aren't impacted.
I know this changes the meaning of the dt-binding, but I don't think it
is harmful to do so, as it is a nop for any existing devices that
provide tsu_clk.
---
 drivers/net/ethernet/cadence/macb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index ca2386b83473..b9248f52dd5b 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3567,6 +3567,7 @@ static unsigned int gem_get_tsu_rate(struct macb *bp)
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
