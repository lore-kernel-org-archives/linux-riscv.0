Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EC0C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Su6w85RPIFw9BmX3myrMXtX6LGAEMJcr/ExZjLImuHs=; b=C7SQ5zOxNGNsj3
	4oU52qXHooiPyE6Sr9zwo1GPTFFRSyJ/YMBXNLC1QiHlIz3oU9HVrI/sLwYFdoaEFET09zBqfs+dn
	v2zCwbSNzOLZHEtt59HUqIvLa1ZePYIXn4pa5yonsVM3jgxfZrkhxj37O986+6bUZpEgMEj2Duacu
	OiNivGKSIOMt3atym7S7vA5ZEWatvh/V+u/rnzTLIXI+Hy78UghNLk7GxP98ilh3uDNL/rNZdfURn
	sl7zSYII4w81sdCvlZFa7YjsaI3wWtPYA/hpg14mopLkHfPM2u4VIgZXp51x5LoRhO24WllOchoKk
	kLDdAbQHeJUx2umZ4tCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbkUu-001X7S-9K; Tue, 05 Apr 2022 14:49:32 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbkUs-001X5e-1y
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 14:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+UXAjBtR+par1eNANQQR44eVeNMSFyy5Nd35Ufev2VE=; b=GTebAwQYzuCaaXTqLz1BRsgxkU
 0BVavZs9MPIUEfV2YztTt7ranS/grTURUI/TdJynEABmNF6Dx7XM/8mwpSKLZCNQJVc6lSXdY2EBW
 EZi7YVCGH3NCx9G+M8fNK7zCBjdsLwvzzNcTbEK4mV7BGxCn6dr8wyxRgVbpHTomCcfo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nbkUd-00EG96-Tq; Tue, 05 Apr 2022 16:49:15 +0200
Date: Tue, 5 Apr 2022 16:49:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com,
 linux-riscv@lists.infradead.org
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Message-ID: <YkxW68j5N4hVgY18@lunn.ch>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
 <YkxDOWfULPFo7xFi@lunn.ch>
 <98b571fb-993e-9fe1-1cf9-dc09651feb0b@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98b571fb-993e-9fe1-1cf9-dc09651feb0b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_074930_130292_7A33405D 
X-CRM114-Status: GOOD (  16.00  )
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

On Tue, Apr 05, 2022 at 02:18:17PM +0000, Conor.Dooley@microchip.com wrote:
> 
> 
> On 05/04/2022 13:25, Andrew Lunn wrote:
> > On Tue, Apr 05, 2022 at 01:05:12PM +0000, Conor.Dooley@microchip.com wrote:
> >> [ 2.818894] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)
> > 
> > Hi Conor
> > 
> > In general, it is better to use the specific PHY driver for the PHY
> > then rely on the generic PHY driver. I think the Icicle Kit has a
> > VSC8662? So i would suggest you enable the Vitesse PHYs.
> 
> Hi Andrew, thanks for the quick reply.
> It does indeed have a Vitesse VSC8662, but the link never seems to
> come up for me [1] so I have been using Generic PHY. I'll try look
> at why that is. Either way would like to know what's gone wrong in
> the Generic PHY case since that's what's available in the riscv
> defconfig.

Hi Conor

Generic PHY is purely best effort fall back for when there is nothing
better. It might work, it might not, depending on the PHY. If it is a
simple PHY which only implements the registers defined in 802.3 clause
22, and not much more, it has a good chance of working. Otherwise, you
really should be using the specific driver.

Don't worry too much about the defconfig, nobody actually uses
it. Distros have their own which turn on most things. So a real system
probably does have the correct PHY driver.

	 Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
