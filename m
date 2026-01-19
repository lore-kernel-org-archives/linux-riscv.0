Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAB6D29C33
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xo+yaPr7AMdpAvv2/p8gHXVIEEl2e2VlO4155STpWVo=; b=NzmHgEH3izGAGG
	eJtAl3z0IkdX8YdMCHnb8zlKSuWjNmn1SRWxaDYzDHNWcGkhhedHJEaiko5E8qpb4WqahWghdPjR0
	RIff0JwFm4MaxMVX37qS4NYpvL66VyXFc8peVEMEixoaWAHJ/K0cVb9CDv4Mnu7wXM07dHzke87HS
	Q9SkeZSWUfsNVFAqwQrXojHEWS3/jaNiEH1XIaiqxFlQyXLUetQZnwCou08se2ozl05cd/eFC/K9w
	5Wx4Dw3S0eTiQF3c/jnyQt6JtP2PyCSi9yBxHEXx+IDHZHAcQ03fhB3GcSYT3VjqW39BwqjLw72KT
	stT/ZofwNhZMHFg4wReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqso-00000002Jro-1uLA;
	Mon, 19 Jan 2026 15:09:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqsl-00000002Jqw-39aE
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 15:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=34ElnxDRQbNZrGi1RSpU0QbjEZAsJP9D0opkzbG1cjM=; b=MC4ly2iXpNquh53DTz2ysfgs+h
	krl7wIQO0oWIql0odQRzCSD1domNspeN+8kqQEA4dez2UFKN/DZDiDQVHb/DZSyuRqETDW1H2MYMi
	HLMUq0zmRseIN3UQhmAdpsug8euvRvmc96ilA8C9pnCeVmaeZ4WosWPTg7WE2YzMjSCA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhqsT-003W6M-VF; Mon, 19 Jan 2026 16:09:13 +0100
Date: Mon, 19 Jan 2026 16:09:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: wangruikang@iscas.ac.cn, andrew+netdev@lunn.ch, davem@davemloft.net,
	dlan@gentoo.org, edumazet@google.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, pabeni@redhat.com, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] net: spacemit: Check netif_carrier_ok when reading
 stats
Message-ID: <48757af2-bbea-4185-8cc9-2ef51dbc8373@lunn.ch>
References: <e3890633-351d-401d-abb1-5b2625c2213b@iscas.ac.cn>
 <20260119141620.1318102-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119141620.1318102-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_070931_811713_E7DAEC32 
X-CRM114-Status: GOOD (  10.08  )
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

> root@OpenWrt:~# ethtool -S eth1
> [   71.725539] k1_emac cac81000.ethernet eth1: Read stat timeout
> NIC statistics:
>      rx_drp_fifo_full_pkts: 0
>      rx_truncate_fifo_full_pkts: 0
> 
> I just discovered that adding "motorcomm,auto-sleep-disabled" to disable
> the sleep mode of the MotorComm PHY prevents the problem from occurring.

This suggests that when the PHY stops the reference clock, the MAC
hardware stops working. It needs that clock to access
statistics. Keeping the clock ticking will increase power usage a
little.

I wounder if anything else stops working? There are some MACs whos DMA
engine stop working without the reference clock. That can cause
problems during both probe and remove, or open and close.

So it would be nice to have a better understanding of this. If this
turns out to be true, maybe a comment by this poll_read_timeout()
indicating if it does timeout, the PHY might be the problem.

	   Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
