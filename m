Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A65CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+XJJ+z+xT1mCl6Ofnss/t4XPzAgWUv6uskWZygceVU=; b=z7eqyN7ss1F3dv
	sExYUO/6D4n5uJ8edJaEHKgWs9D6QNVqKqeOFMg0VX/F7j9pZq9TzMhtOmTYlTs9kOeGrwh4E3URQ
	XKTmEkZs5aGLCLR/rqy3u1DuOjbW6hWGuvsbV8Xw4AbaihI9IaXb9V4dJRRQw1GmI3J+ThkRJPzn+
	kw6yrRFJscAl2ZcA0+TvsVdWHQ31NgFxk8lPX8ZpyZz+0028tBhSHgqOEdaLihLKSUzA7YY6ECQAW
	8CMCRoEol1VG7pmF43p107M54jhDZCTN4+FD3AqGNsdUMbfV6l+IXRcUTUyCMQEPsTD7YLcXhWln6
	peYfrtm1ZXwbcajujkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbkji-001axT-7J; Tue, 05 Apr 2022 15:04:50 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbkje-001awl-Sn
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 15:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=fdTy2QipSt2ilSloKM6Bz0bLZTQbPg4xCc/LdGQ2Lls=; b=EBche/hJNuTuHsxC+sdoH/7FA3
 FT80nu32uYuNi6J1O23hcThReg2oDdw1ELNMJplZbpA235gQk1Ne41jxxwOXUGnSCpaZU31ewmwEZ
 9fJk0kc25GXWTGTtz19oWXsVFH4O13SC2Sn71K3QmhDCrOkHKHKuOWqRMHmuO+J8CO0Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nbkjY-00EGET-7v; Tue, 05 Apr 2022 17:04:40 +0200
Date: Tue, 5 Apr 2022 17:04:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com,
 linux-riscv@lists.infradead.org
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Message-ID: <YkxaiEbHwduhS2+p@lunn.ch>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_080446_963899_DE16670E 
X-CRM114-Status: UNSURE (   5.32  )
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

> [ 2.818894] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)
> [ 2.828915] macb 20112000.ethernet eth0: configuring for phy/sgmii link mode
> [11.045411] macb 20112000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
> [11.053247] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

You have a multi-part link. You need that the PHY reports the line
side is up. Put some printk in genphy_update_link() and look at
phydev->link. You also need that the SGMII link between the PHY and
the SoC is up. That is a bit harder to see, but try adding #define
DEBUG at the top of phylink.c and phy.c so you get additional debug
prints for the state machines.

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
