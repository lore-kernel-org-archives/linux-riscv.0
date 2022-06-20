Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49D1C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 06:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ts5+2gSBQtaTyvv1qsedrOMPuyQBHkPqUgQfudu5vSg=; b=lPQoNZGht53oLY
	VrGHliOXKucW9yLRa0zeZLuUKKK5K776vEaVStQiKuHrWqiuAIwUhzOFqQ3LdxgFEejtHjJk6+fih
	bYxcR4D/bxOlfBq2GyirownITOIPuPYmvoaI95cpEebrUVs6e3FGoa0bMP8K36p8scnOBtP2t8HJt
	Qr0L9jbpslU9dRARta8biFIj2EBbgbusKR2IQA8tLvp6WOC95g2VftsAtWTGbvvPy7WMi+xFGZDBk
	jjlGDfCiouaCkXpMttavYrimVGYpIUvKeWyrTZ4VxAn1MEZfXslwXsjG41alEbmFJwurYt3K0TFcQ
	VAwMJPxMgKs3p7+mmUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ATe-00GNxW-W5; Mon, 20 Jun 2022 06:01:35 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ATb-00GNv9-MW
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 06:01:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 90D1A68D06; Mon, 20 Jun 2022 08:01:28 +0200 (CEST)
Date: Mon, 20 Jun 2022 08:01:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
	philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org,
	atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
	robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	drew@beagleboard.org, rdunlap@infradead.org
Subject: Re: [PATCH 1/4] of: also handle dma-noncoherent in
 of_dma_is_coherent()
Message-ID: <20220620060127.GA10297@lst.de>
References: <20220619203212.3604485-1-heiko@sntech.de> <20220619203212.3604485-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220619203212.3604485-2-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_230131_985316_3123C831 
X-CRM114-Status: GOOD (  10.36  )
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

On Sun, Jun 19, 2022 at 10:32:09PM +0200, Heiko Stuebner wrote:
>  bool of_dma_is_coherent(struct device_node *np)
>  {
>  	struct device_node *node;
> +	bool ret = false;

I'd rename this to coherent or is_coherent.

>  
>  	if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
> -		return true;
> +		ret = true;

And then do this at initialization time:

	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);

but otherwise this looks good to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
