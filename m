Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7D4C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 02:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1005206B2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 02:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ozzFnmGP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vNEdYoKF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1005206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdwCzuVmXs+nWtXzNuOPDJPWEpNTOKndzwT7iPeFMIk=; b=ozzFnmGPYw7ZcS
	3RkVds2sAHLJSFoEQTHBs6PmSQc5fRYUiRLOjIqFIK76YHFFWzfN4kKyIiQiVad5ptWwHVr+TvHAA
	oR0C/XmKucIwGG+eTr/LSBDDHVxfGVZSo1ORiIHM0GoMayxWAryXjQiJa5Afxm5TseSyInc0cV0qu
	7wFntKsKmdzRaZSzTJsclm1JMOJjDt1oiYxszK8YI3/3AQxPTbcUM7lEztLNq3CLtLMqyDU9LcWrz
	yyS9TMgGCyrKpNecOOE3hP7bYFf3np36/KD1tOuJQuVhHS920PcVm9vkC/4dWIusTfuJ3iS4QrzXs
	U/kQbC6Op8W4XpIqCzXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSC4x-0006aZ-NM; Thu, 29 Nov 2018 02:29:23 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSC4u-0006Zc-Cc
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 02:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=IaREirnIWjEsEDdg8DNRbadVs1/HXGD9LzYebql2mcI=; 
 b=vNEdYoKFBEFDYGkDjM1TM3N8uyQc7sUYqKw+N/bt4JoFZjsp5qgraI8PystQWQdy5jjGxvavbBU7iFUPP9XiDmIDRyc/5fgKH4FVI9UrZSE1gw5/mbQbOrEiSzsWkc2qRcuyHMrKWlxENpSbnqmMPDxPny+dpV0J0CwU3E1o/VQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1gSC4Z-0003dH-0g; Thu, 29 Nov 2018 03:28:59 +0100
Date: Thu, 29 Nov 2018 03:28:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: macb: probe of 10090000.ethernet failed with error -110
Message-ID: <20181129022858.GG5037@lunn.ch>
References: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
 <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_182920_584006_19E49B8E 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
Cc: f.fainelli@gmail.com, sergei.shtylyov@cogentembedded.com,
 netdev@vger.kernel.org, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, schwab@suse.de,
 linux-riscv@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181129022858.TyLG0k34Zoh2bn1vEKPPvyQkMYI6c64_EjJfEApUQKs@z>

> This is all fine as long as Linux doesn't go and reset the phy again. Until
> bafbdd527d56 ("phylib: Add device reset GPIO support") was the case.  After
> that commit I believe phylib is resetting the phy while attempting to enter
> unmanaged mode, which is now allowed in this particular chip.
> 
> Since it appears the phy is not usually described by the device tree but is
> instead discovered by probing a MII-based ID register, it seems the best
> place to put this is within the phy driver itself.  I find it's usually best
> to describe things with code, so I hacked up something like

Talking to Florian, i was under the impression that you could not even
discover the device when its reset state what wrong. You could not
read the ID registers.

Your suggested change assumed you can discover the device. Is this
true?

	Thanks
		Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
