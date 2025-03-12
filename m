Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C8EC28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20/nAZDLnunVZC3VlaHVkZvI3INZtxkw5KvCk1NHJu8=; b=MSNhTh8CbS/B0M
	2cL32dQtaDhUXa2WvrE8kuG5jMi5yo0qJpoLTzwzJ1JDJYEw3I3YqhwYShONaK92FldgVWywqRo6b
	G0RfrVht1lJqRh/s8uFuJSFA66knMEXKeRFa5qJVsXMHto8vB+8p+mKigQisD3kTYeltrk82MExgk
	CJyODoeY18Rn04NCJDDVfPwq05LgVfkT2FJl42som1fGL2365Z5QF8j3pTgY+gh5WhQzkX6oKxTD0
	nrYXswHq3WHNWMvtEBhZIxDZWnzs/MmQJNoLT+cBWP73JK9p+YKiwHbOm6PEfa7xAWIypXdMWB76H
	9b8ugSgxy9ph0fTmdaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIeX-000000081Gz-0Q0E;
	Wed, 12 Mar 2025 09:45:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIUD-00000007zKT-2sB7;
	Wed, 12 Mar 2025 09:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wl6zOR+xtNbThqwqizqyBwsRBu7DaTBch3G1Ngsw9UI=; b=tQy/MXDASRxCbhwMAs0WOjYgC1
	m/A3j6oE1GprwCfkaAzfI5IgKGdHLWDbpQMN9g95HskKLxAUqXz1PwSKfIx+pSxAem9iS3UikdIkw
	65tdgBJZVWX6OxdzbExLxS5xmKk5xBW+dfolr3dfMMjNfSWJyFkU+hphBwtCvTMVJyvaDLqfpfwEz
	FlIxCeOnJSn1Qv09csh21n4tyDvf5ZAX2/pHiNT+YsOQpGRtTYxLzCTUg3iO9MJp1WuKm+f2U1aKM
	Xd8nkGmVayKRDZcv630OeLqrsEgQ42HLC44CN/DFPaedQvI/lIl1PRu0BCIwopVvmVI+YTLq8DlEk
	l4SzR1Ew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52664)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tsITu-0005GN-0y;
	Wed, 12 Mar 2025 09:34:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tsITk-0004R4-1o;
	Wed, 12 Mar 2025 09:34:20 +0000
Date: Wed, 12 Mar 2025 09:34:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@st.com>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Samin Guo <samin.guo@starfivetech.com>
Subject: [PATCH net-next v2 0/7] net: stmmac: deprecate
 "snps,en-tx-lpi-clockgating" property
Message-ID: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_023449_723952_95D5EC5E 
X-CRM114-Status: GOOD (  14.81  )
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

On Sun, Mar 09, 2025 at 03:01:45PM +0000, Russell King (Oracle) wrote:
Hi,

This series deprecates the "snps,en-tx-lpi-clockgating" property for
stmmac.

MII Transmit clock gating, where the MAC hardware supports gating this
clock, is a function of the connected PHY capabilities, which it
reports through its status register.

GMAC versions that support transmit clock gating twiddle the LPITCSE
bit accordingly in the LPI control/status register, which is handled
by the GMAC core specific code.

So, "snps,en-tx-lpi-clockgating" not something that is a GMAC property,
but is a work-around for phylib not providing an interface to determine
whether the PHY allows the transmit clock to be disabled.

This series converts the two SoCs that make use of this property (which,
I hasten to add, is set in the SoC code) to use the PHY capability bit
instead of a DT property, then removes the DT property from the .dtsi,
deprecates it in the snps,dwmac binding, and finally in the stmmac code.

I am expecting some discussion on how to merge this, as I think the
order in which these changes is made is important - we don't want to
deprecate the old way until the new code has landed.

Changes in v2:
- Correct Cc list

 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  1 +
 arch/arm/boot/dts/st/stm32mp151.dtsi                  |  1 -
 arch/riscv/boot/dts/starfive/jh7110.dtsi              |  2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c  |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c     |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h          |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 16 ++++++++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  5 ++++-
 include/linux/stmmac.h                                |  3 ++-
 9 files changed, 22 insertions(+), 9 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
