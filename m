Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3012C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 14:30:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2300823128
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 14:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2300823128
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bHgy/YJBH9a/DDHH0VOUZNaRMvNgEP9RIG8cjrUsdL8=; b=A1iO+bjIOM/8tHGJr6Wxv44Wz
	nvqrxUwc+lrAc6QmEAgZQYhFpz1jmLcuCDtx1eZStm4jNDU3s5LZsdN0nacaXDjHwq++MQvLT+aJ9
	Ho0zAoSNshap5z/ls41WPiNn4PNzKe1vjnYho9O12yTz4UOW0bIaAKqHODMfPPS+UlKLzbN2274Tu
	+MyFyTakNJq8u7K0veNsseftRydVNrF+IiVCSkPlUnYyZEylTq/ESpXTs/x/qJBpxI0HE1sh+/2fQ
	FNn29UHleJswGSGmprl0Vt8itOWi1Z/kwZzph6k7snPP+DKnNSa5jYRWMWjIoy2r2x//dueR9Rt5l
	lwAH+CVeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klYZp-0000lC-2i; Sat, 05 Dec 2020 14:30:21 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klYZm-0000kp-UC
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 14:30:19 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1klYZV-00AMfz-Ck; Sat, 05 Dec 2020 15:30:01 +0100
Date: Sat, 5 Dec 2020 15:30:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 3/7] net: macb: unprepare clocks in case of failure
Message-ID: <20201205143001.GC2420376@lunn.ch>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
 <1607085261-25255-4-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607085261-25255-4-git-send-email-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_093018_997337_919F3625 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, kuba@kernel.org,
 linux-riscv@lists.infradead.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 04, 2020 at 02:34:17PM +0200, Claudiu Beznea wrote:
> Unprepare clocks in case of any failure in fu540_c000_clk_init().

Hi Claudiu

Nice patchset. Simple to understand.
> 

> +err_disable_clocks:
> +	clk_disable_unprepare(*tx_clk);

> +	clk_disable_unprepare(*hclk);
> +	clk_disable_unprepare(*pclk);
> +	clk_disable_unprepare(*rx_clk);
> +	clk_disable_unprepare(*tsu_clk);

This looks correct, but it would be more symmetrical to add a

macb_clk_uninit()

function for the four main clocks. I'm surprised it does not already
exist.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
