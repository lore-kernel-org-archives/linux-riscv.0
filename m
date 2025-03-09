Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C0C28B2F
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Mar 2025 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQgQ/RsCYOfcpo9pf0BEvlmDxeXC1aQbwVza66ivhRM=; b=wfCcMes2M3n801
	Fsr4asw45LN4Sv5IRZOP2ux6Dvkaiqn9xkldGewmGK5tVL/xCvMWn2GYlYtYydvDsi248K0AcIynD
	tPnoidj10wqzJ5xaCNOhMPqFLuE0w8cMK7ULp2XOWt5vaBQjdEj1s4Uf0io2FNYKqoYCwYxBVogkZ
	GjTPESKGjF85n3IcTeD8ogTFxYlcV/C0PUAsLCVzSzKH8QplDDpdsVhwa8lcCjJy+6DeJ5L9CPYnD
	si7KG239uz9MtGhNz7LkQ+jT5MahzntlvVcpSJsCFCP5gvzEBuY7MD0wBb/EWAH9N99yz/Yy0sDiG
	ciCGLYSWGa4CEYJv1Wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trIH2-00000000inY-3T36;
	Sun, 09 Mar 2025 15:09:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trIAv-00000000i1i-18th;
	Sun, 09 Mar 2025 15:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EjTTpaZia4xPDrHFP8XfvKcQeiE7s1ZisD7eXsEguQI=; b=CIT2vDEcIkQZahNG9MZxS/nLAd
	IKQ5L2mYxMAkoITqMILETe6PkR1T2SY2U700eCD3oLMDMnwdSyr3OWM7nhmpv4YvKn0z3UrttyCHw
	WqNEtu+VY4rqYEV8+KpHJbiZzdWAscHKk/sNH21fV8lwWtTPapOuNC7QdWqi9FYbZAOn5603Pnw6X
	Z2T3jqMbVPMSvFACFljYDt2DoQ/M+5WCc6LgClKZJ2H5KG9QbrGm7w/UYBdsC3Kb2RcgOTyI1aHaz
	5x/AcRIQ9wI8mJNtNhsIEDp4TQLPs2q3JRh2CcvfBlEL0fBWQ92YF00tjrJzq6qtd1wscNChx8GJB
	PHksNOcw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36610 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trIAb-0001Pn-0p;
	Sun, 09 Mar 2025 15:02:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trIAF-005ntc-S5; Sun, 09 Mar 2025 15:02:03 +0000
In-Reply-To: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 4/7] riscv: dts: starfive: remove
 "snps,en-tx-lpi-clockgating" property
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1trIAF-005ntc-S5@rmk-PC.armlinux.org.uk>
Date: Sun, 09 Mar 2025 15:02:03 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_080245_308639_4584E9D2 
X-CRM114-Status: UNSURE (   9.48  )
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

Whether the MII transmit clock can be stopped is primarily a property
of the PHY (there is a capability bit that should be checked first.)
Whether the MAC is capable of stopping the transmit clock is a separate
issue, but this is already handled by the core DesignWare MAC code.

As commit "net: stmmac: starfive: use PHY capability for TX clock stop"
adds the flag to use the PHY capability, remove the DT property that is
now unecessary.

Cc: Samin Guo <samin.guo@starfivetech.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0d8339357bad..a7aed4a21b65 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1022,7 +1022,6 @@ gmac0: ethernet@16030000 {
 			snps,force_thresh_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,tso;
-			snps,en-tx-lpi-clockgating;
 			snps,txpbl = <16>;
 			snps,rxpbl = <16>;
 			starfive,syscon = <&aon_syscon 0xc 0x12>;
@@ -1053,7 +1052,6 @@ gmac1: ethernet@16040000 {
 			snps,force_thresh_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,tso;
-			snps,en-tx-lpi-clockgating;
 			snps,txpbl = <16>;
 			snps,rxpbl = <16>;
 			starfive,syscon = <&sys_syscon 0x90 0x2>;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
