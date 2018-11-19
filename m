Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377C3C43610
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:26:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6E5206B2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:26:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O/2Dz0AI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XUxh5osv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="araiZIVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6E5206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPy0UEMCzfOmFNFrOSPD5MpS9IuE9hK53SwG//cAbbo=; b=O/2Dz0AIk/1gSS
	lPPBywDqPaEY8JPUZyjcDIu1Ra6wd2loZ9sEi73PTT+jURM12g70baPgDcmmyLfwjlgXpTQsqUWtz
	WLlo0PEFUO9dGom0Jys+CY95K9jaUoJYwctAE5Tt9DolGtr4+ybHoZUDIT8SNo2bewkpPOqmhJr69
	ZXZSmSBdB5pfwD4BX2klHDJgTLa+gnMnfRFOnXnHRJgQg34igRdz7Tr/jjB44WCkPhxM7Aw2NZlu2
	l2haPtjJb7OW3Ttxnhp85TemV+LQiobDODXDN/IT/WzYtvwAZrcMyfyKWeFK89K6OBAS4sbLHarwV
	EezdswVDNzkhNIaNYYCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOmN6-0004QM-CY; Mon, 19 Nov 2018 16:26:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOmMu-00046k-0s
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 16:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rdekz2H73urYUl46tjJrWPKjwUS/lIfEs52H5sjj36Q=; b=XUxh5osvi0v0aq3Uy8U3tRAyU
 5GCQzl52xXMTahSvGv7wYzVIsNAkyab3lLh54IYzIyqTxquop8ZZr2PqI2QEDLPe1ByfYPPsl3ET3
 EvVHMbekblh4EWuhk87K23FpWZB8GRaNfBCWt7q2jNxAEhDy2gRFo8tiu0XimvTH9EgUGqzCvbHUm
 Bnia6KEl1Ks9m80++gXKmWXN0F8Ystx6yzl2A7A+kaGpcrYCU/xlUC/dyCH4AT+gByS2Fx8mF8Z2l
 jUnKQxnsc7J8LJAACb6Ese33UVl+NLq3B6H0uCMHFjq7scSOdZl8p2Mwu0XNxSb6tN3wLcjgbTM8Y
 j3A/jLglA==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOmMr-0000VY-5w
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 16:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=rdekz2H73urYUl46tjJrWPKjwUS/lIfEs52H5sjj36Q=; 
 b=araiZIVi1P73XEaIUBHuKiOWgqN1773W+hEnDCzf361tFM0IRyNQAAlzFTol1d+7XEUvaIVYLMA10zvTPSdzEDzqNHXmrVBce4KSqnQgrupCFzicF57WTO048ycv6cO4MfInBhJrKV3bNvjbuivXDoutYPVTZ690vYPfCsnfsdI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1gOmMb-0008Lk-Ug; Mon, 19 Nov 2018 17:25:29 +0100
Date: Mon, 19 Nov 2018 17:25:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
Message-ID: <20181119162529.GA31955@lunn.ch>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch> <mvmva4t9h8x.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmva4t9h8x.fsf@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_162545_262554_B4838DD4 
X-CRM114-Status: GOOD (  10.36  )
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
Message-ID: <20181119162529.jJ9S7kvqtDYXvsbq1GhcFB5HBoTGwzVlY0hY3rQ2ZBo@z>

On Mon, Nov 19, 2018 at 05:14:38PM +0100, Andreas Schwab wrote:
> On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > Could you turn on lockdep and see if it reports a deadlock.
> 
> How do I "turn on lockdep"?

make menuconfig
Kernel hacking
Lock Debugging (spinlocks, mutexes, etc...) 
Lock debugging: prove locking correctness

It has changes its name at some point. it used to be called
CONFIG_LOCKDEP, for locking dependencies. Anybody who has been kernel
hacking for a while still calls it lockdep.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
