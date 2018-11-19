Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACFBC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F6A20851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZO/J62T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PzxXtv//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48F6A20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvwatdav/30AvJMNHYDyzlESPOd3AMazsSFrRoEGbME=; b=dZO/J62TDNeFmd
	a+v37AeXjjU68pK9YZEwo5pyAZxIIDtLcLOVlXV8plC9LH5EDO9Q55vpeFuU74QQRtvoykIx5RPZ2
	6S41nTqVJjokGCXYn5OcVMoU3PheN13DPk0CGHzIw1rIyqtcHejlm7Xb5gK7OBGodMQl3oYPeNKvN
	95OGEZcmPZBWT482j+rktBniczXhHxr92KibpVECdVameEuZqRRxfw2W9uIfnjcF27Vc9Msb+2PU0
	CysggwzsDrv89xOpA/kITS/UoVWd/QqV2QihekzYyg7hurxxdM6u7ij51mZzxsAAe6Azipdc/M8UU
	8ScyjYryI1kd+jogIqhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOlfA-0004tz-QJ; Mon, 19 Nov 2018 15:40:36 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOlf9-0004ts-Ca
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 15:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=77j1Uv/Nd6jcni8FrYSrkmBq72ETw8A4ySylarrIiKs=; b=PzxXtv//33FteX29CoDD2ybXL
 qaNOpFW88MhzyKIZ3HwKWhfwttkrSJlXUwk6yM3OfV5cvVcO/+zE4EMEoT64dHzt1R9sV+erqFgBu
 G6FQ2+jZuxn6rKPpwwv6TDsj1LdHJsMvZ+w6bc7kzr3NegGKr71XWjZ35syxYFjNov3fxlN9y9HBQ
 PPyqcdAwAY6vkwmQVgpW9JS9WkWzI28VT09cM1S89mQXXk5p6AXUGEhZLs450muTWq+mRTwD87yx2
 iZCKfUoQak1oJTQ+vjaCUWQtSxWw4NXBa1X6J8CmtqsMKlGzMPBTnSqKE4JkTqajs1unpcTl4zwZX
 bQYf1qKYw==;
Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOlf6-00016x-9T
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 15:40:33 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 6065320D27; Mon, 19 Nov 2018 16:40:15 +0100 (CET)
Received: from localhost (242.171.71.37.rev.sfr.net [37.71.171.242])
 by mail.bootlin.com (Postfix) with ESMTPSA id 0A91820CFD;
 Mon, 19 Nov 2018 16:40:05 +0100 (CET)
Date: Mon, 19 Nov 2018 16:40:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
Message-ID: <20181119154005.GA8367@piout.net>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181119152830.GE26852@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_104032_449529_6AA951D8 
X-CRM114-Status: GOOD (  23.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: f.fainelli@gmail.com, Quentin Schulz <quentin.schulz@bootlin.com>,
 Andreas Schwab <schwab@suse.de>, linux-kernel@vger.kernel.org,
 allan.nielsen@microchip.com, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119154005._-9Mq4s22THlY9lqZ-oPC6sJuDdUer9FH1PMAHin6WM@z>

On 19/11/2018 16:28:30+0100, Andrew Lunn wrote:
> On Mon, Nov 19, 2018 at 04:13:10PM +0100, Andreas Schwab wrote:
> > On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > > On Mon, Nov 19, 2018 at 03:57:17PM +0100, Andreas Schwab wrote:
> > >> On Okt 08 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:
> > >> 
> > >> > The Microsemi PHYs have multiple banks of registers (called pages).
> > >> > Registers can only be accessed from one page, if we need a register from
> > >> > another page, we need to switch the page and the registers of all other
> > >> > pages are not accessible anymore.
> > >> >
> > >> > Basically, to read register 5 from page 0, 1, 2, etc., you do the same
> > >> > phy_read(phydev, 5); but you need to set the desired page beforehand.
> > >> >
> > >> > In order to guarantee that two concurrent functions do not change the
> > >> > page, we need to do some locking per page. This can be achieved with the
> > >> > use of phy_select_page and phy_restore_page functions but phy_write/read
> > >> > calls in-between those two functions shall be replaced by their
> > >> > lock-free alternative __phy_write/read.
> > >> >
> > >> > Let's migrate this driver to those functions.
> > >> 
> > >> This has some serious locking problem.
> > >
> > > Hi Andreas
> > >
> > > Could you be more specific. Are you getting a deadlock? A WARN_ON?
> > 
> > See the stack trace.  That's where it hangs.
> 
> So you never said it hangs. The stacktrace helps, but a description of
> what actually happens also helps. And i expect Quentin has booted this
> code lots of times and not had a hang. So some hits how to reproduce
> it would also help. Maybe your kernel config?
> 
> I'm interested because he is using the core mdio locking
> primitives. If those are broken, i want to know.
> 

My first intuition is that he mac driver quentin is using does
phy_connect when the interface is opened while macb is doing it at probe
time. I didn't investigate but maybe this can help :)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
