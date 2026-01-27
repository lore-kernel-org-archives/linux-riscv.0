Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1100ED19512
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 02:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RgIGG2cbkZzG/eV6dQ8HPAo4At2fCHQ4xGBrIZCvtc=; b=38jlaieIR5tnC5
	Slr2/aBBCJOubnzR7KbLzoSLoBze2P5AVaQv+Zd1SAGn/sXqUktXjtFa9Eih7xWt4h+7hXhcIZnqS
	D/u3y0NBZuyz4py9ZbHBEkxIVeWKz2pYcR56tiqyHKNnlq4/ixQqB2hGKiAXuSb5jLdVVHtw4yCTt
	tVXJnNerKvAd2qOrkta+z8mgtk2VhEtRpOvpeiPtcdC/DRcQK3HtycpoD0kLtiMK/Be0+fS5+C3Uq
	hLVcnlMvYHg9H5O3jgmBNrh4QUJPJFjwYn6SboO+QFDCFg1dovpFHsLIa/ouNs+v97DFPdHVSPwiZ
	Rs6Qhhh8lc0k8XL47dFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYSe-0000000DT1L-2WAM;
	Tue, 27 Jan 2026 02:05:44 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYSc-0000000DT0z-17zd
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 02:05:43 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BFB16335D2F;
	Tue, 27 Jan 2026 02:05:36 +0000 (UTC)
Date: Tue, 27 Jan 2026 10:05:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Tomas Hlavacek <tmshlvck@gmail.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Yixun Lan <dlan@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH net v2] net: spacemit: k1-emac: program frame size
 registers for jumbo frames
Message-ID: <20260127020526-GYA88966@gentoo.org>
References: <20260126135919.77168-1-tmshlvck@gmail.com>
 <20260126171449.83288-1-tmshlvck@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126171449.83288-1-tmshlvck@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_180542_341314_AB80345B 
X-CRM114-Status: GOOD (  16.87  )
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

Hi Tomas,

On 18:14 Mon 26 Jan     , Tomas Hlavacek wrote:
> The driver allows changing MTU up to 4K via emac_change_mtu() and
> allocates appropriately sized DMA buffers, but it never programs the
> MAC_MAXIMUM_FRAME_SIZE and MAC_RECEIVE_JABBER_SIZE registers.
> 
> This causes the MAC hardware to reject frames larger than the default
> 1518 bytes, even when larger buffers are allocated. Frames exceeding
> the default size trigger jabber errors and are discarded.
> 
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
> ---
> v2: Added Fixes tag and Cc stable.
> 
>  drivers/net/ethernet/spacemit/k1_emac.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
> index 220eb5ce7583..31b1bdb2827e 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -228,6 +228,12 @@ static void emac_init_hw(struct emac_priv *priv)
>  		DEFAULT_TX_THRESHOLD);
>  	emac_wr(priv, MAC_RECEIVE_PACKET_START_THRESHOLD, DEFAULT_RX_THRESHOLD);
>  
> +	/* Set maximum frame size and jabber size based on configured buffer
> +	 * size.
> +	 */
> +	emac_wr(priv, MAC_MAXIMUM_FRAME_SIZE, priv->dma_buf_sz);
> +	emac_wr(priv, MAC_RECEIVE_JABBER_SIZE, priv->dma_buf_sz);
> +
I'm no expert here, but just notice there is additional MAC_TRANSMIT_JABBER_SIZE
register which is no need to set? or is the problem on receive side only?

>  	/* Configure flow control (enabled in emac_adjust_link() later) */
>  	emac_set_mac_addr_reg(priv, fc_dest_addr, MAC_FC_SOURCE_ADDRESS_HIGH);
>  	emac_wr(priv, MAC_FC_PAUSE_HIGH_THRESHOLD, DEFAULT_FC_FIFO_HIGH);
> -- 
> 2.52.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
