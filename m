Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A263C64ED6
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRvCT24ZRS/dnBgH7sKs12hcWcWm0UlndlUPHTwHU3o=; b=mqfy/KIc4ioOi1
	+flys1WbdkPsoZ3mnkUOCT2crzyE69uJil/s5QlsFCi9bZu6o56RMdIzWnyi9WamxxFoUJ+TXqOVQ
	TnVwrNFEiKUbYbyMU+0WN4KpxzNHqEHgjEfmPX1sGqy2Rcy3/Dp2LV3Ky/tn5wNbtEBacJrB1Cfn2
	dORuVwzV8P7h3FXf516CejX9x9RlcdvKZjUlWMIr7mtqIn//Y9uZBv/73BPq4tE4cIkWVWMMxLNuZ
	3Kd+VFgQEoMuoBBPcntFx4faD2iEOfZY9Gpm3DUpiesSki/led0Cs82T5zmt1XoWAdWR5dpmqzMJe
	st3YKu/EZnfUPP5KxqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXMC2-00GJ6g-Fi; Wed, 01 Mar 2023 13:08:26 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXM9x-00GG5d-AC
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 13:06:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 57C3B67373; Wed,  1 Mar 2023 14:06:13 +0100 (CET)
Date: Wed, 1 Mar 2023 14:06:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de,
	mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
	robh+dt@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/5] of: address: Always use dma_default_coherent
 for default coherency
Message-ID: <20230301130613.GC467@lst.de>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com> <20230223113644.23356-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223113644.23356-6-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_050622_435454_A84B8914 
X-CRM114-Status: UNSURE (   8.11  )
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

> -	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE

Doesn't powerpc need to select CONFIG_ARCH_DMA_DEFAULT_COHERENT now,
or even better should be doing that in the patch adding that
symbol?

In fact I wonder if adding CONFIG_ARCH_DMA_DEFAULT_COHERENT and removing
OF_DMA_DEFAULT_COHERENT should be one patch, as that seems to bring
over the intent a little better I'd say.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
