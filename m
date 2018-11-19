Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE662C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:12:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9125E20851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e575G1Si";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lMB5ATuX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Rm4EgFfr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9125E20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUcBqIYshbpRgdV0an5oAL/fDoQexWXKVh71TAZYcZ4=; b=e575G1SirkvVnH
	yw/UmSSbn35CQW5migNyDofTw5966C+Tw3FMk8J/29DUHXP4hSwy/WZa/W0pu32eVSW5Pv5CVF2hU
	OJN57r2DueBwOSI0uY74Sx5mxI/zwF/DYzY6SBlQVOxVNAQUhYdUGZnI/x4AmJ+R7YEvd28QMoXPl
	2SjXrmB15I+ftN6NJanupy9FW9CG/pJUuoIKujPqSXCw55V21RqYsNG+8QOHUSPN+HIZQiKKvoDMj
	DKyX4LU1C5SDBgZadz/xkXUZrH9axcvQU0lkrtW/WfNsd62OR7pdKqxBVFCL+mk+nNwNWT8dFKcb6
	wFykzdwGXF6JnyobTqZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOm9y-00078x-Bn; Mon, 19 Nov 2018 16:12:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOm9w-00078M-Jt
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 16:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Fe+FOpVzqRBtzLcNwwRdtRrycwAANPVT3+pQXIs7dk=; b=lMB5ATuX51WX9MkCBNeXasAxr
 2Wa8jxu+wDu4n8hfrCOAYnPsjdkv5VMt7ynZAEmZ5kzJIntjZGsDED8Y35H+o4jaYfTphHC2dbNic
 1lNGLm5uDnLdBq6TiOwaKLiJYgDAX1n9ndNmQV0/0KwpLF/+Vu1VphTCVTixbYFccc98qY5HqYRYL
 FY2ZofD6vsC+sUj8aLngbDI231OLdknSCfkD5nRdbkfn4N9pKdri8SpMxRgJ+DBLiUhRCeSHrqlGN
 ttGot2Y+qe7wj2IDDc08SfMiqj1y7Nkby2vehQTrkof21fliSXfRalikqWmyeSsYAAEfLgJ4xrnxN
 oVj0QaOxw==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOm9t-0008N4-NG
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 16:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=5Fe+FOpVzqRBtzLcNwwRdtRrycwAANPVT3+pQXIs7dk=; 
 b=Rm4EgFfrtw+xYAZZqmNfBGiQTs1ON92IvVpF4fs1bJWpTxz0ldVYwn2pomIch2y83IqpUXeRuol+CIA0Z0mbFTKxHpolPKZO4pgVbsCvXBK84WrqNdiJs280kgPj+g+Gv5E7mEKFfzaLMw67XYeLXI6u7PUXHaLGdOcuU/wxMIU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1gOm9c-00088Y-78; Mon, 19 Nov 2018 17:12:04 +0100
Date: Mon, 19 Nov 2018 17:12:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
Message-ID: <20181119161204.GC2393@lunn.ch>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmzhu59idl.fsf@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_161221_780553_18FEF772 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, f.fainelli@gmail.com,
 Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, allan.nielsen@microchip.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119161204.joyJLzp-evwmtMPgS-6X3EW6SLLC5u3Vc5thmEyEK_w@z>

On Mon, Nov 19, 2018 at 04:50:14PM +0100, Andreas Schwab wrote:
> On Nov 19 2018, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> 
> > My first intuition is that he mac driver quentin is using does
> > phy_connect when the interface is opened while macb is doing it at probe
> > time. I didn't investigate but maybe this can help :)
> 
> The phy probing of macb is very unreliable, perhaps it needs to be
> rewritten.

Hi Andreas

I still don't see why that would cause a hang.

Could you turn on lockdep and see if it reports a deadlock.

Thanks
	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
