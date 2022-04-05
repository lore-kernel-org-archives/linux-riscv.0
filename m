Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ACAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 18:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoJuLn/jVwaIwk9HPfpFZfpQTQ2t+DY61KS+7Di5B8k=; b=GVZHxqWk0IIXav
	4uutpTvL0fPP2MFdV6ztI6mhUq+28mD+GjTOXphkjS62qQRdcGeO19Agy7IPVIE/xJG2A3BJV9PEf
	ygmH1tm174F0+8dRe8OsnACOSnE0+mAjMBAYAKDF5nPT7kT1793g6qPzMm5//77K+3zW80C9dGtO7
	oYwNHSXu0dZ8rftMWK1KvHKnfBJdFwVucky/cJEMHyhw9KYbt6oSEWXmTFRz7NXUfd4+fmFIz1hTz
	rfTrejb72DGIkqDaJJ8vbR4hhF2PH5tX+UJV/lfPHDSwr8Nm0BLTZt2Oifp3+8BfizE4+FmH+vw23
	8RWPbt3EDd6kPGwOcX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nboLQ-002Gzm-67; Tue, 05 Apr 2022 18:56:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nboLN-002Gyy-4n
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 18:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NX3oZ68N8cBADa9iIhw5WvRWV9qY5iTZ7eFVhCIexyo=; b=io2h4mOh0ZBY6ZWULGwhUdaslp
 MQKIGNzYgjblJDOV6ue60NrxUbYZGAEZL/i/NIdj9pXLES/ACjBsfmMU7EcMaaVBn0B7qtxCxur6O
 1fDKXkEcY6UT7qFpVTsuzoHmxxHJOuN1ImCT9WTdQoWLdrksXLZiMptSyqqEHsNfoJbFHitAROp8t
 r2iOh0iRvH7TUDgI/EVg0qQ14+U9vwDt5dUCBlk65UMiyZC2L5NsoT9PYuv8dolvN87HX7BRTVO5K
 +I+6b34QN8JgfZMDjkrfjT/Bzs6RdGNBRD+932dGYpaO3EN8oBTqflkV8+enwVpnf8W2TiE/sgQMY
 CiB37CRw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58136)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nboLB-0001no-8j; Tue, 05 Apr 2022 19:55:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nboL8-0004QI-N0; Tue, 05 Apr 2022 19:55:42 +0100
Date: Tue, 5 Apr 2022 19:55:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Conor Dooley <mail@conchuod.ie>
Cc: Conor.Dooley@microchip.com, palmer@rivosinc.com,
 apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux-riscv@lists.infradead.org
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Message-ID: <YkyQrgUCyLd1A2A1@shell.armlinux.org.uk>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
 <Ykxl4m1uPPDktZnD@shell.armlinux.org.uk>
 <0415ff44-34fd-2f00-833d-fbcea3a967cb@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0415ff44-34fd-2f00-833d-fbcea3a967cb@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_115557_224033_8AB37837 
X-CRM114-Status: GOOD (  32.45  )
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

On Tue, Apr 05, 2022 at 05:58:50PM +0100, Conor Dooley wrote:
> On 05/04/2022 16:53, Russell King (Oracle) wrote:
> > On Tue, Apr 05, 2022 at 01:05:12PM +0000, Conor.Dooley@microchip.com wrote:
> > > Hey,
> > > I seem to have come across a regression in the default riscv defconfig
> > > between riscv-for-linus-5.18-mw0 (bbde015227e8) & v5.18-rc1, exposed by
> > > c5179ef1ca0c ("RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt
> > > machine") which causes the ethernet phy to not come up on my Icicle kit:
> > > [ 3.179864] macb 20112000.ethernet eth0: validation of sgmii with support 0000000,00000000,00006280 and advertisement 0000000,00000000,00004280 failed: -EINVAL
> > > [ 3.194490] macb 20112000.ethernet eth0: Could not attach PHY (-22)
> > 
> > I don't think that would be related to the idle driver. This looks like
> > the PHY hasn't filled in the supported mask at probe time - do you have
> > the driver for the PHY built-in or the PHY driver module loaded?
> 
> Hey Russel,
> The idle stuff enabled CONFIG_PM=y though in the default riscv
> defconfig, so it is not confined to just QEMU.
> 
> I am not sure what the symbol for the generic phy & I am not at work
> to properly check, so I hope this is the relevant part of the config:
> 
> CONFIG_PHYLINK=y
> CONFIG_PHYLIB=y
> CONFIG_SWPHY=y
> CONFIG_FIXED_PHY=y

The generic PHY is part of phylib, and will be used whenever phylib
wants to drive a PHY but no specific PHY driver is found at the point
the PHY device is attached in software to a network device.

For reference, that is a very important point to understand:

1) if the PHY driver is a module sitting on the root filesystem, but
the network driver attaches the PHY during boot before the root
filesystem is mounted, then the generic PHY driver will be used.

2) if the PHY driver is a module sitting on the root filesystem, and
the network driver attaches the PHY when the interface is brought up,
that is fine as long as the root filesystem is not network based.

> If you look at my response to Andrew [1] you'll see that my problems
> are not isolated to just the Generic PHY driver as a builtin Vitesse
> driver has issues too (although validation appears to have passed).

I've been catching up with email from the last three and a bit weeks,
so I haven't been reading all the threads before replying... there
will be some duplication between what Andrew and myself have said.

The right thing is certainly to use the Vitesse driver, and get to
the bottom of why the link won't come up when that driver is used.
I think from what I've been reading that it feels like a timing
issue - when cpu idle is enabled, then something affects the PHY
meaning that link never comes up.

The way this works with phylink in SGMII and in-band mode is that we
expect to read the link up/down, speed and duplex parameters from the
MAC/PCS end of the link, and the pause and link parameters from the
PHY. phylink will only report link up in this mode when the PHY and
the MAC/PCS both report that the link is up.

phylink should already contain sufficient debugging to work that out -
it prints at debug level whenever phylib reports a change to the link
parameters, and it also reports when the MAC/PCS triggers a change in
link state. That should be just about enough to work out which end of
the link is failing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
