Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED588CFD36B
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 00:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9E7EpLDv1ikKpsWlL3ZVMkLEJHu9IXfntMNp7BvMpBg=; b=0benSfLy2KD6r6
	HfKcK+de7VdpsUxcui8EHpYSvO/RFgJQXZ7qTm55uk8xhk2oQthzpV87o3w8wRA/+MJWCOBOiWDek
	BCcI+kBWme+6ZXvpGDTtGHUU2Tfn61t9rOtgLcX+xahz5fjOooMjf1TxT7nMteHnJhaBI1H0FPCGm
	j6APThvX7NvD6kYqGb0HTfP+Mr0irtL99fbHo7hHyBf95dsvlrcJ3j303GiTVufhKmpMc+KijKxgj
	fg7hDX3ZTLNNoiUX7O8xrp+VKfT9v8tm5y5N9KEvQfAN10/ZPnaI4iqZhymRObrUlDS9JsVsyArO2
	CdnbZDVkpjseV0/TDH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgoX-0000000CVwH-0TQu;
	Tue, 25 Nov 2025 00:21:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgoV-0000000CVvu-302U
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 00:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J+TANZWcOgQJfDvygww+ASmyXzn+Rs4bLGiVbxMb90k=; b=tIr5G9glL6VbI7ZTorMTvbjU4o
	JDpX5zVtTUXBKeOzKZjxTkHmD6kxO/hzfbsh2AqvZlypONdc4QmZmyqfvR2C7enOt/24ywYaskjoj
	3Bm7mz+GQyT5RRjAUsl2ZPwKSz0v/tkkZB2S6bSdGPgSLbZ974xZrLL82Aw7RHTwlNbs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vNgnn-00ExY1-Kx; Tue, 25 Nov 2025 01:21:03 +0100
Date: Tue, 25 Nov 2025 01:21:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: spacemit: Remove broken flow control
 support
Message-ID: <78328381-db8a-4bc9-b520-eb1c687b846f@lunn.ch>
References: <20251124-k1-ethernet-actually-remove-fc-v2-1-5e77ab69b791@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251124-k1-ethernet-actually-remove-fc-v2-1-5e77ab69b791@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_162147_756238_98C66853 
X-CRM114-Status: UNSURE (   9.97  )
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

On Mon, Nov 24, 2025 at 01:28:27PM +0800, Vivian Wang wrote:
> The current flow control implementation doesn't handle autonegotiation
> and ethtool operations properly. Remove it for now so we don't claim
> support for something that doesn't really work. A better implementation
> will be sent in future patches.
> 
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Starting at v2 as this is the net-next successor of:

If this is for net-next, and not for backporting to stable, you should
not have a Fixes: tag.

Otherwise it looks O.K.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
