Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CAFC28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpLaBZvUkWNVyj46/RaJwJBAqNGS+nlhnBFQrYM5wEk=; b=TTR8mKkTIabviY
	pnqbnxopOQxdeeIYW771iQLPIe6Fz6O6VRhJr6Owwq1YM3DgeVQrM32BRETx0MUkPoPpvmYCBOiES
	Ei/Lo9rNToWRlWuTIl57JSTMLkNXWyrL24AbL6G8s85HlzPZqskvl97i/+9SrkKi+kflzeFBLwB0+
	aun7vSpEUUBWd6mSafdbg8v27pJ8TMK78zfTkLijeXwK77TNO+ot/XY+8Ma+lVgCi5SRz/hEC2u94
	k1xl37ZtEhrUMBcGENY8BcmEPE8x2UqALEf0K2DZ26ywE5qgrXD0eHhvLan3hZYPz/65NjiQOCOCu
	NIrlTXJO+cOUaSkkIpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIhm-000000081lS-382S;
	Wed, 12 Mar 2025 09:48:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIUY-00000007zQk-3L2M;
	Wed, 12 Mar 2025 09:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HlbmyzYzLADsI2UNSNeNHJhLaybCyKx8Gh+zDwNi5KA=; b=Cje0fCZPMZ5rLcB/uy+H0ZonX6
	X5XnBKLvztTCG+EXQynSq4V/Ub9m32CdpJvnOI9MaCei0ucOk9BRQAK7ggYkb2mgJnZZQKKJNUsLh
	rRwBbXGOyATiADxvM4E2Y5cxeJ2C5/wY/bWOW6L5mDQ6ZaapCf3YeT3Wa/5DGPVGb0IG0LR5Z1Ab/
	wiW20vJeSUaaQG/SQAP1bmGUePWtb9SWc3Vk8QcFx6W1AjZd82JiblvB7eJG5+6oQve6+zA1EyHg5
	jSb0McZT9d768gNKEw1IzMgNlSB9S1wRodBi14cPg6bdUoOsYuRfD29TFi9WovUOUArs66uPZ3PaS
	iz5bn6ag==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51964 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIUF-0005H0-1t;
	Wed, 12 Mar 2025 09:34:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsITu-005vGF-TM; Wed, 12 Mar 2025 09:34:30 +0000
In-Reply-To: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Samin Guo <samin.guo@starfivetech.com>
Subject: [PATCH net-next v2 2/7] net: stmmac: starfive: use PHY capability for
 TX clock stop
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tsITu-005vGF-TM@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:34:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_023510_825823_F558C31B 
X-CRM114-Status: GOOD (  10.56  )
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

Whether the MII transmit clock can be stopped is primarily a property
of the PHY (there is a capability bit that should be checked first.)
Whether the MAC is capable of stopping the transmit clock is a separate
issue, but this is already handled by the core DesignWare MAC code.

Add the flag to allow the stmmac core to use the PHY capability.

Cc: Samin Guo <samin.guo@starfivetech.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 5e31cb3bb4b8..2013d7477eb7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -124,6 +124,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 
 	dwmac->dev = &pdev->dev;
+	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->dma_cfg->dche = true;
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
