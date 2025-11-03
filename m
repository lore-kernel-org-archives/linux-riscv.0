Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC784CCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eINi5CJ9UlnQdswmLG/TCqqMYerc6a04NmzgLzV0Soo=; b=h3HGlyJL7xMdK4
	QhG82JbDliCUfG9JjK26VcjUO1Qh792vrvdNPz4/N12XkyNYTa1ycfMLimXTUd2AXMtCK5/EsRRNY
	j3yIF2lWc6PI/SUJajlp+lxLdriwAO/Xth70ShmZq5192146qgEwAesW2YetyjTrOHeL2etsxArTG
	5LLcOrWN7u8GmWnZtmtKM8Wau2Yu9eRieMPMPoKFK/pJhP7iHLy6f/WyVvTUW0zs0+uh3B18Urxs1
	fhRCJaWj3dGJXjyb79hn36BVV8s7iasRZScRDXu66aP72XEFcrZEXbKkw8D8dmbM2yzuYRQbzjWD+
	1EWDk/9jqqSsHNFdO4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwFE-0000000A6VO-0gTA;
	Mon, 03 Nov 2025 15:13:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwFB-0000000A6UC-2eaw
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 15:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JSXdgW2kfRWFxjWTR3l7Kh9s8bfojqXtZjuMl+0bips=; b=bm3C/hpNZY8fqnVxP022GlshBm
	31AP42vDSUyI6KbUn9Jo0Z3QzSUJGsL/da2JwIx5c1BgMoki0OLohgNb8TrgXd3IZT5VwLOhd/xBR
	wigGmg+7naJpD14G2ZB0rR8MrEjDh0jzwDT4yn+c69Whpy+MvTSgCS0xMfry/CkPN05g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vFwEo-00CnDn-Tg; Mon, 03 Nov 2025 16:12:54 +0100
Date: Mon, 3 Nov 2025 16:12:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] net: spacemit: Check netif_running() in
 emac_set_pauseparam()
Message-ID: <bcebb4b4-69c3-4fa5-bbca-9558a9a7d526@lunn.ch>
References: <20251103-k1-ethernet-remove-fc-v3-1-2083770cd282@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251103-k1-ethernet-remove-fc-v3-1-2083770cd282@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071317_669500_43D732C0 
X-CRM114-Status: UNSURE (   8.51  )
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

On Mon, Nov 03, 2025 at 10:02:49AM +0800, Vivian Wang wrote:
> Currently, emac_set_pauseparam() will oops if userspace calls it while
> the interface is not up, because phydev is NULL, but it is still
> accessed in emac_set_fc() and emac_set_fc_autoneg().
> 
> Check for netif_running(dev) in emac_set_pauseparam() before proceeding.
> 
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
