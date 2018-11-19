Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62719C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2274220831
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+r5sfDV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TbO35950";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="otYy1kce"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2274220831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTm4/3uXagXeLOQLb6D4SBwRz4m8HXcTfCGqtoJOv6I=; b=Q+r5sfDVbwF+t2
	Uaf9xIZHIY3GxHL40NZEuOLHs5ZWr/7aoeIGgKYg7M6cDUCBvT8o5n5EL0OLDw7svr36d0OuUs8w0
	cCJIrCGWvu9ZwPI8/PcNfEm+g/5AgVbXI8hPzVElqDBSou3qgAWOe8uM7l4mW35A1+1JSbdaq+A1j
	VbUXyxKiURfrvx+KnrXqWx0zX8PRYtmDdCFkhDn/vqRn6KaGO0G4kX43DCBsQGI+xtDGdpdi6djSt
	licZt5j8HDc79R0RHLMcIIcn6FdJ6w8OYv2/g1GzyTOpq+WzFpBAdpH+bJyxD5iVe63mfBBUNVyCd
	FAVZpm/3a/WBuFH/js+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOlCs-0002Xq-7j; Mon, 19 Nov 2018 15:11:22 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOlCr-0002Xk-5G
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 15:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PW/karcgM4kSkrrHapxyj81pv+/jN6zfGatvHa6BB10=; b=TbO35950dRlnHIn1iY3YaY9TN
 /CMbAS1hCMXG+RoqyegX3/LIYRNQR4bJPUIPcSBljp7CFlpINaKKBEcPrXPxFdCX5F03hYpitUKaC
 omCzLO1zGpjUo+PgnILh5Ah0QfjZoRiyOhxiHFLXAl8rvyauadvQgRr/7Ixvocn2b6bmZnTw1+qDA
 RJQCHaVARW5eBmHf/E22ZkDSUd2twbW+ytEnz21vP9naFTtCk54mMYjv0KiolyNZenMoeaskH3bPo
 TkMBAcjBRa/FTMmI3PU+K6IzBWiw7949bnlq1UbhI9FUoj+DQzkr5h5lINJIvcsrdEYhar8SqffMJ
 kWH6Nk8eQ==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOlCn-0000pZ-C0
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 15:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=PW/karcgM4kSkrrHapxyj81pv+/jN6zfGatvHa6BB10=; 
 b=otYy1kceijuuvHxbonE0R+8aFp3ktP9qvcJSemxyUknPEqIQ8WKlYmFr7+CyDTe+tPs05Fo6m11/4/YBfoEYl9pSF4MESC2+M8mAX0BU5A6Ypu/6+rQqp+BVA5KbQSA8IxUGUo09JSch823P0Ti9bJNh9rmUF/SOm0V5T748nec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1gOlCT-0007eG-5E; Mon, 19 Nov 2018 16:10:57 +0100
Date: Mon, 19 Nov 2018 16:10:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
Message-ID: <20181119151057.GC26852@lunn.ch>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvm8t1pazea.fsf@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_101117_545343_1BB74B65 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
 Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, allan.nielsen@microchip.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119151057.TZ3ALoW3a1XbSyPi2VRXwKdKADEXhFe4zCCgFMiYzFs@z>

On Mon, Nov 19, 2018 at 03:57:17PM +0100, Andreas Schwab wrote:
> On Okt 08 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:
> 
> > The Microsemi PHYs have multiple banks of registers (called pages).
> > Registers can only be accessed from one page, if we need a register from
> > another page, we need to switch the page and the registers of all other
> > pages are not accessible anymore.
> >
> > Basically, to read register 5 from page 0, 1, 2, etc., you do the same
> > phy_read(phydev, 5); but you need to set the desired page beforehand.
> >
> > In order to guarantee that two concurrent functions do not change the
> > page, we need to do some locking per page. This can be achieved with the
> > use of phy_select_page and phy_restore_page functions but phy_write/read
> > calls in-between those two functions shall be replaced by their
> > lock-free alternative __phy_write/read.
> >
> > Let's migrate this driver to those functions.
> 
> This has some serious locking problem.

Hi Andreas

Could you be more specific. Are you getting a deadlock? A WARN_ON?

Thanks,
	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
