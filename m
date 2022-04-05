Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202CAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8Eb09/BiCp1lQXg/qeih5xdyUzcQWQvyJaW9ue56VY=; b=YeV7ykkUyR7S+i
	pLkxrdBKIv562nQQHVUFckWFhk0WicikjPzjf7XsF0tI3HJfPot8b+f0llkvGvyh4lUfGGHeUsQFd
	JXmziKnHc+r0qD3E5dEcjbSmmAfOYFJrfuck07V354T57PSfL+mvlCGfrtnWzknDtoHRJMkbygezY
	43qdYXYpl52iTBrJ39+tyanZP/Fl+gyONz35+CC1tNV4FVR2QXJc6rbo7MPSylGIWMKDStLt1kJZL
	r4eFapjT9PmBklPJ8hfJeu4TrU1LdxY6NRN3Mtu2PdNfeP0iYgUObWvne6hngXqIso/U5847dL5RU
	o9B/gBrpIer9qIT7sudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbna8-002A30-K2; Tue, 05 Apr 2022 18:07:08 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbna6-002A1U-7r
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 18:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=DnpgwdQdGEsvMQlOn3L1tEyieFyj3RpD31tAg6KOeLU=; b=pTOZ8SYUS6sF8Sr+zKur9U1pK+
 caGh97J10J2tnyEj+eclzd6Z+TX8SnP9zuhm9vQ5B1hanySq/ICwncyvfPc+9vQoeIhUdm9a+wudL
 J9FfBP1dGGIm8Xfm/ldSEqh/7YQBMAcsnwy5ZtyLC9r0vEJwoIzEHvmxc5qmVBB1DCxk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nbnZq-00EHVs-IY; Tue, 05 Apr 2022 20:06:50 +0200
Date: Tue, 5 Apr 2022 20:06:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux@armlinux.org.uk,
 Conor.Dooley@microchip.com, apatel@ventanamicro.com,
 netdev@vger.kernel.org, Nicolas.Ferre@microchip.com,
 Claudiu.Beznea@microchip.com, hkallweit1@gmail.com,
 linux-riscv@lists.infradead.org
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Message-ID: <YkyFOqAqA2IyTCOp@lunn.ch>
References: <mhng-524fe1b1-ca51-43a6-ac0f-7ea325da8b6a@palmer-ri-x1c9>
 <25acda81-4c5c-f8ba-0220-5ffe90bb197e@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25acda81-4c5c-f8ba-0220-5ffe90bb197e@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_110706_332949_882A4381 
X-CRM114-Status: GOOD (  14.50  )
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

> I tried using the one for the VSC8662 (0007.0660) since that's whats on,
> the board but that didn't help.
> Without the revert:
> 
> [    1.521768] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at
> 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
> [    3.206274] macb 20112000.ethernet eth0: PHY
> [20112000.ethernet-ffffffff:09] driver [Vitesse VSC8662] (irq=POLL)
> [    3.216641] macb 20112000.ethernet eth0: configuring for phy/sgmii link
> mode
> (and then nothing)
> 
> If I revert the CONFIG_PM addition:
> 
> [    1.508882] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at
> 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
> [    2.879617] macb 20112000.ethernet eth0: PHY
> [20112000.ethernet-ffffffff:09] driver [Vitesse VSC8662] (irq=POLL)
> [    2.890010] macb 20112000.ethernet eth0: configuring for phy/sgmii link
> mode
> [    6.981823] macb 20112000.ethernet eth0: Link is Up - 1Gbps/Full - flow
> control off
> [    6.989657] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> 
> I will try again tomorrow with "ethernet-phy-id0007.0771" to see if
> anything changes, since that would use the Microsemi driver rather
> than the Vitesse driver that VSC8662/0007.0660 uses.

The numbers here should be the same as what you find in registers 2
and 3 of the PHY. They identify the manufacture, version and revision
of the PHY. With a normal probe, these two registers are read, and the
PHY driver found which says it supports the particular ID. The only
time you need to actually list the IDs in DT is when you cannot find
the PHY using the normal probe, generally because its regulator/reset
is turned off, and only the PHY driver knows how to fix that.
Chicken/Egg.

You don't have this issue, you always seem to be able to find the PHY,
so you don't need these properties.

Also, using the Microsemi driver for a Vitesse hardware is like using
the intel i210 Ethernet driver for an amd xgbe Ethernet hardware....

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
