Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F4C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sSJP4OxVQ/YkIqo0cT/qTf/jKKort4a9fZL93iAQQI=; b=2BWgGpxQ5iDf0j
	qUxaKmOHBYUe5gmVcZrXggNeogtCRBRpna7uCKIYzEqbjxQuYsF187EMQmM7kNMkXzWnIq+KPqgfB
	ETNEo+KEOjP3/bQ+B9sdOt6yXARBCqSdcknc5eG54wWQzN9nFd1KNSP3t/goImqqoQyeK/0hKE7Kx
	skWxCGruMztdN5zEen8gAwxGJZvG1Co1+cVoBkFEppBY2oiX81cjH6DovObTO4Z5aIc7uQpYhv4//
	tNT4pKK8ycaD/wrDirPzWlsZWn7AQIg0gib+rJfIm7mZBY2Nm1y1HZu3ikzhXgrbt2vuk+Fzkvf46
	NyHFSh5IOQIgxDQ6DVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91u6-00883D-TK; Wed, 06 Jul 2022 10:05:06 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91dB-007v1W-HS
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 09:47:40 +0000
Received: from [167.98.27.226] (helo=[10.35.4.171])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1o91cy-0000jJ-LW; Wed, 06 Jul 2022 10:47:24 +0100
Message-ID: <ec401a51-5895-fce7-1075-a2c964466d2b@codethink.co.uk>
Date: Wed, 6 Jul 2022 10:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] crypto: flush poison data
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, LABBE Corentin <clabbe@baylibre.com>
Cc: herbert@gondor.apana.org.au, heiko@sntech.de,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk> <YsP0eekTthD4jWGV@Red>
 <20220705164213.GA14484@lst.de>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220705164213.GA14484@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_024737_641873_CF39E97D 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 05/07/2022 17:42, Christoph Hellwig wrote:
> On Tue, Jul 05, 2022 at 10:21:13AM +0200, LABBE Corentin wrote:
>>
>> I just copied what did drivers/crypto/xilinx/zynqmp-sha.c.
>> I tried to do flush_dcache_range() but it seems to not be implemented on riscV.
> 
> That driver is broken and should no have been merged in that form.
> 
>> And flush_dcache_page(virt_to_page(addr), len) produce a kernel panic.
> 
> And that's good so.  Drivers have no business doing their own cache
> flushing.  That is the job of the dma-mapping implementation, so I'd
> suggest to look for problems there.

I'm not sure that the dma-mapping code for non-coherent riscv systems
did get sorted. I couldn't find any when looking in 5.17.

I expect the flush of the icache is also implicitly doing a dcache
flush too as from what i've seen it is only being used when code or
tlbs are being modified.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
