Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1034CC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7f2X4/7b5Q07L+9Iiey7SQ7WMcJUtZ216Ft/pxAXhc=; b=2BHBY3rBDS7Q8t
	0re9Tw+dEK+1NGC8JHhy4QGipuJbVp9VY0t+WQjaa1EImLZ7JfXswotYbz/HGJ10Y/JB4P5es/lXr
	UR/u7ufakJkD+9BJ6UjxDv82Dzao5Ny/25hPb6P593JqS+IQ50siI3wTYE7HlO3fua8+2t6Z3521Q
	mXyiKtN5Y9flfbB1WGlmuBI9iRMUuKR9NojWj6R9NfDlVqG90Z2Wq7B3t2SVPSn8yVNg8xjhSZwwz
	glIFcbvzRhHfsmQfNyIuYH0wIcZv2PhiaFwyL+5oZxReD7ZcKed0lq6luuu9pM7bSxdvAWJQ4hV2m
	d1cPHVWqBWLJHXtVIWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px8Xp-009GAq-0E;
	Thu, 11 May 2023 15:49:29 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px8Xn-009GAa-1C
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 May 2023 15:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E7i+xfg7Zmreb4Vww4EYKdJmkpv928hvjj/hafEYQT0=; b=lcji4WyJLssRCy7rI7/Az0ugmh
	ZkLmERyuj2+EwqT26K5R/xTKEwPtxaVcoXn+OeaurH02jSnGEC/q2veholXFSnwyWTot7b//lZ59/
	7IHkVGlp2y/w4xEOr6gm3Dhnd6v2cX3v90WRQaEVxXfPHSq0Ro/tBL/iLFXvfEgfsSdOIyxaQx3YG
	iJzTS0T1rL9JQPj4fuqQK7ru17j0i+fb8IPl6evL6JnvHudZde+KNgzr008o+vOna8gQa5tDB8jXx
	BYfP9DOGXFv2gpBI9ZyGOR6W0VPHbZyZFqHTj/T/LEGOn5tU/mKb/JZmmEzS50c7M90EnZX8AMrke
	gQlKViKg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px8Xk-008HrU-0T
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 15:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E7i+xfg7Zmreb4Vww4EYKdJmkpv928hvjj/hafEYQT0=; b=1M5qqDtAkcn+e6iqllMITj2Nmy
	U756c5EXwyGGyFDZlxHj9uDncFUTsXS7nQbZgXV8HxqdWcquRn7z9S0aRiIN/wNqbqfmobsA6UzcY
	ZwDulJZWQ/d6D9Y+7Y5p59yV531pEJb5aNNP1oQ8mvRs0uhFCTKosjuCtP55wP/XXr2k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1px8XW-00CZd1-2A; Thu, 11 May 2023 17:49:10 +0200
Date: Thu, 11 May 2023 17:49:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pranavi Somisetty <pranavi.somisetty@amd.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, linux@armlinux.org.uk,
	palmer@dabbelt.com, git@amd.com, michal.simek@amd.com,
	harini.katakam@amd.com, radhey.shyam.pandey@amd.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v2 2/2] net: macb: Add support for partial store
 and forward
Message-ID: <3a3c6241-2134-42d0-8dd3-0c96d8e7300b@lunn.ch>
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
 <20230511071214.18611-3-pranavi.somisetty@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511071214.18611-3-pranavi.somisetty@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_164924_303066_266B6288 
X-CRM114-Status: UNSURE (   8.34  )
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

> +	if (GEM_BFEXT(PBUF_CUTTHRU, gem_readl(bp, DCFG6))) {
> +		if (bp->caps & MACB_CAPS_PARTIAL_STORE_FORWARD) {
> +			retval = of_property_read_u16(bp->pdev->dev.of_node,
> +						      "rx-watermark",
> +						      &bp->rx_watermark);
> +
> +			/* Disable partial store and forward in case of error or
> +			 * invalid watermark value
> +			 */
> +			wtrmrk_rst_val = (1 << (GEM_BFEXT(RX_PBUF_ADDR, gem_readl(bp, DCFG2)))) - 1;
> +			if (retval || bp->rx_watermark > wtrmrk_rst_val || !bp->rx_watermark) {
> +				if (bp->rx_watermark > wtrmrk_rst_val) {
> +					dev_info(&bp->pdev->dev, "Invalid watermark value\n");
> +					bp->rx_watermark = 0;

Please return -EINVAL. We want the DT author to fix their error.

> +				}
> +				dev_info(&bp->pdev->dev, "Not enabling partial store and forward\n");

The DT property is optional? So when it is missing, retval will be
-EINVAL. Please don't spam the logs in this case.

	 Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
