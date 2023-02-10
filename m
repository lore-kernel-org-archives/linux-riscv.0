Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D3C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 05:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAKzCaUbjs+LJ5aWp6c+ftSGBz5/j1372s0o7c2g+P4=; b=sEvuoRdsra9GWK
	54zWSSECgnX3HEqs0l6qUlReVjiW6xlFH9+JA5TEyfqceIQnhIVEyjCttJDRroignwOekqTUb2dM2
	sHL3xkxmiGOwwcfvDc1QoozJhW2okts4YF24QiyB1lwap6px4W56X3oNSJWuBeTrqSUW9mjMYEINS
	FTeossuRmAkBbGMP5o6Y17bY2EEPd2cU8FmpPwtCk8bQPkJgB8rH0tALBNkfHt49kCQi2u+2VZGXm
	86ZGnrwEdBYJcIhCazX/FTmxSBxZs4rJPbAPDmsF9Y2o8mjNZ0mhGDA80oTHj4hgihRtOGfAgyvu1
	rpYJrgfIJ0Um7Cna5syg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQMF6-004KEx-7I; Fri, 10 Feb 2023 05:46:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQMF3-004KEM-2D
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 05:46:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7191B61CA4;
	Fri, 10 Feb 2023 05:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38786C433EF;
	Fri, 10 Feb 2023 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676007993;
	bh=QSn6XoyFpXD2W04LGu/g0NJ0eT/MSQSv9o2g+wm9Txs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/salf5gPkyaTBrzxN7b928+NuEIvT5jSi/Q3nqQJg6gxqW2i4m35UKBbDcGHfot0
	 U0bq7Kt6S6mvTmcXjWMhI0eIBNEOLiMI5o+dlEcm9Y9yVRP0/dAkzCdMIyQJXF1Ryz
	 C3OkKRZBUhxZBHbzPegzM0/tupFziDqVeBJ0flUTluZN5OAToHilLNJlcrr/2SshRB
	 LDWsrk/KiUamiaknRoB9VXhUx2gzDzZWwYKJbTqXYKgvrNgNQt1ZpC2BqS0JXlsyOE
	 sZdMSjGuAa8VwCzfEfsEZscbtwYoyX3TiF1psLUjn2PafhVmsTWyYyARbEtjrABLXP
	 +SiSxEiknHXgQ==
Date: Fri, 10 Feb 2023 11:16:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: shravan kumar <shravan.chippa@microchip.com>
Cc: green.wan@sifive.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v1] dmaengine: sf-pdma: pdma_desc memory leak fix
Message-ID: <Y+XaNflpN01k2AMI@matsya>
References: <20230120100623.3530634-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230120100623.3530634-1-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_214637_186672_387C822A 
X-CRM114-Status: GOOD (  13.04  )
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

On 20-01-23, 15:36, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread support for a
> DMA channel") changed sf_pdma_prep_dma_memcpy() to unconditionally
> allocate a new sf_pdma_desc each time it is called.
> 
> The driver previously recycled descs, by checking the in_use flag, only
> allocating additional descs if the existing one was in use. This logic
> was removed in commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread
> support for a DMA channel"), but sf_pdma_free_desc() was not changed to
> handle the new behaviour.
> 
> As a result, each time sf_pdma_prep_dma_memcpy() is called, the previous
> descriptor is leaked, over time leading to memory starvation:
> 
>   unreferenced object 0xffffffe008447300 (size 192):
>   comm "irq/39-mchp_dsc", pid 343, jiffies 4294906910 (age 981.200s)
>   hex dump (first 32 bytes):
>     00 00 00 ff 00 00 00 00 b8 c1 00 00 00 00 00 00  ................
>     00 00 70 08 10 00 00 00 00 00 00 c0 00 00 00 00  ..p.............
>   backtrace:
>     [<00000000064a04f4>] kmemleak_alloc+0x1e/0x28
>     [<00000000018927a7>] kmem_cache_alloc+0x11e/0x178
>     [<000000002aea8d16>] sf_pdma_prep_dma_memcpy+0x40/0x112
> 
> Add the missing kfree() to sf_pdma_free_desc(), and remove the redundant
> in_use flag.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
