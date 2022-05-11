Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AB6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBs3pq1lLMQhb1IjjO0iqcQ6K+AyYTtSuMFW9aBzZgo=; b=CmLLMa3K2igNIO
	jBE1K2OOOtC+2XlftLBxxkIUAjEkIUOFuXPmYQ154+ymnebLa80xWV07fswTvuTcGQ7tfCHdqiWqU
	+1DM+Jy8L+sbir8xWGXl1Ep1sETzq3tchy2C8BRToICFLEPdd5R1CxSB0KcdJ8qmLSM4ZST3nWwvi
	jdwQGcOetfNU6MubtCy1E+yzjJ7NtW/nTN9uuNkvsI6WpAjThEXJHzbnkdDFNlnjdLpNX09yOdAkX
	qkcfqKdX7SzpECfSRHQyIpxkgRgdqqS0gZ0vPIulYO44CIUBaCFptznbfZzhIqWDDxFm4JQVIrW9M
	MvF7jQaBlPj0cAwLptgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nolax-006nbS-Al; Wed, 11 May 2022 12:37:35 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nolau-006nZ6-9i
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 12:37:34 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id CA5BC68C7B; Wed, 11 May 2022 14:37:24 +0200 (CEST)
Date: Wed, 11 May 2022 14:37:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Conor.Dooley@microchip.com
Cc: hch@lst.de, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@kernel.org>
Subject: Re: linux-next: Tree for May 3
Message-ID: <20220511123724.GA25121@lst.de>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
 <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_053732_523966_2679EA02 
X-CRM114-Status: GOOD (  13.77  )
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

On Wed, May 11, 2022 at 10:10:40AM +0000, Conor.Dooley@microchip.com wrote:
> Without even trying the patch, I double checked the boot log from
> 3f70356edf56 and I get a "software IO TLB: Cannot allocate buffer"
> With the patch its a "software IO TLB: swiotlb_init_remap: failed
> to allocate tlb structure". So spot on & I feel like an idiot for
> not spotting that before!
> 
> Is failing being fatal valid, or should it fail gracefully like it
> used to do? To me, blissfully unaware about swiotlb, the "current"
> behaviour of failing gracefully makes more sense.

Given that we're at -rc6 I think the most important thing for now is to
avoid a regression and restore the old behavior.  I'll send out a
series with this and the nslab related fixes for Xen today.

But we should look into why allocating the memory fails for your
plaforms.  Does it have very little memory?  I can't really think
of why else the memblock allocation for swiotlb would fail.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
