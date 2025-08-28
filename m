Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEB7CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZGkgVWAaTQMES1+zl9TK6UoPXsQiRbwLQcU+kz0IDQ=; b=2rU59tnGya9ux3
	FxIkDhfGW00s9NJeMmuxfVXWYcE5N6+v4IacuunAS/XtAq9Fup3FNpteIpU2AR/2O686CrcV0jRT1
	5aF+dydjk3YrzQiXawhiUh9UD2f7nb6OyeQPnCX75Ei+X0VM1Tdd/8eT2zVvsNgbholjxSN7tg7Mn
	9Z6aXWbm/Wy8qmJmQc7uioTcWe3ixGlVHutRfO+W+mv/Xn/yjerSdv6IszYgCHbjCIdmhXGaO5WJS
	BaetEBj4o5KDyXlikWeWFEeoKQuYYoFvcymFnXXOhwgOqMwpGulgtVgtSQL4Owygvc/PPJQcmuwEN
	ywlUtcfBylPcQ9vDZE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNS-00000002S8X-13vG;
	Thu, 28 Aug 2025 17:25:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urblf-00000001YWD-21vn
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 12:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gKv9reSnTFal7lXW3j+/yEjJ6IbCvDAdZ9nuha3XXs0=; b=mY8/R/zy6i0Kh4sWhO7Di3jfhe
	O1fXCoavC+3xOR1GDmIBwvtHBmXI6uVfOS3xgp3smq4SaVR5AqwjFaeGah/392dLciS56KV4Gd2Nn
	PlnfiS5M3FZfnoHd71YVXyepEf4+dQv4LBgbqlxmzAHIIOflkl7Jd6d+jZW8tY/TcUIs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1urbl7-006LUg-DP; Thu, 28 Aug 2025 14:29:41 +0200
Date: Thu, 28 Aug 2025 14:29:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <uwu@dram.page>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v7 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <ecd74582-6d65-42eb-999d-05dbfc898370@lunn.ch>
References: <20250826-net-k1-emac-v7-0-5bc158d086ae@iscas.ac.cn>
 <20250826-net-k1-emac-v7-2-5bc158d086ae@iscas.ac.cn>
 <193454B6B44560D1+aK-x9J2EIB5aA9yr@LT-Guozexi>
 <6c221dcf-4310-4e31-b3e8-a8a3b68c3734@iscas.ac.cn>
 <D1B3E8CA05947AC1+aLAT40m4VCtlL2Yk@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D1B3E8CA05947AC1+aLAT40m4VCtlL2Yk@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_053015_518555_BF258F35 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

> > You tricked me! There's one more review comment below :P
> Haha, You are so cute, Vivian.
> I'm surprised you were able to find it, because I went back to check after
> writing the last comment. So I wasn't able to find the final one myself.
> 
>                 - Troy
> 
> (This really is the final one this time.)

A nice illustration of why trimming replies to just the needed context
is a good idea.

Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
