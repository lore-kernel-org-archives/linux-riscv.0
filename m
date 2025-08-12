Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640AFCA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7Q93oZMe7m4n7sQQIbcyT1ARSfXWp3OaEBHS65/NKg=; b=Zc9zYSmMYw2AFu
	V6WKJi/MJsXWUG7/NpfFH9eQvjo/v6NwBgiCK/eD6BDAr744jXV+3zJNSCYDFKXQhfQWZ5l2pG4+O
	/6/mmetxuZqlJi9TH5tAIvwyCS9hkvU8WOuM367XlMOhnCrx/85LGtRjcfeUEv3ZR8AEKkMrO93kP
	hOpY1yLUvIoZJ7y+DKShtNUM0IGR9ZZmWH0DRWucP1ZAHaT85le/ifzf+pheEbpbfGa7ZOGWK5Gdc
	f9qK6p81Pl4hm50sycG99gf/dmFNLOje3GwC3b/H/EtZmPbmg4nQJO5VwT+IOnuzLE+imwv8Kr5ZQ
	yG7tjA5HBRnyevw8H/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uleaB-00000009bDh-3h4A;
	Tue, 12 Aug 2025 02:17:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulea8-00000009bCw-3Wkx
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 02:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Xg2zz37NQZwnjzW1ZVhxRl064ST3U4ZE4dYyZIQGosE=; b=kNTKg67vzA9dT0L+K3+eNJMYni
	rT9ZgJZnmhoczgL6neUKbWK45YwYXHRH/IM+y/EVuL9eLuaRBQrBJHnbkps8pAKA0aZHmkJzlbFPV
	w3CYg4sdSFpso53dUjGSDPsSgmW7BsHxU4m6kkailW8+fdZUyDBDoE2xS30d3zci/Jl0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uleZa-004P2G-1f; Tue, 12 Aug 2025 04:17:10 +0200
Date: Tue, 12 Aug 2025 04:17:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH net-next v5 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <5c32fde3-0478-4029-9b71-e46a60edf06b@lunn.ch>
References: <20250812-net-k1-emac-v5-0-dd17c4905f49@iscas.ac.cn>
 <20250812-net-k1-emac-v5-2-dd17c4905f49@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250812-net-k1-emac-v5-2-dd17c4905f49@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_191744_878967_4AF1F850 
X-CRM114-Status: UNSURE (   5.99  )
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

> +/* Caller must hold stats_lock */
> +static void emac_stats_update(struct emac_priv *priv)
> +{
> +	u64 *tx_stats_off = (u64 *)&priv->tx_stats_off;
> +	u64 *rx_stats_off = (u64 *)&priv->rx_stats_off;
> +	u64 *tx_stats = (u64 *)&priv->tx_stats;
> +	u64 *rx_stats = (u64 *)&priv->rx_stats;
> +	u32 i, res;

Rather than the comment, you could do:

	assert_spin_locked(priv->stats_lock);

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
