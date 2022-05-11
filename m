Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2422C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgzmlpSEyEfLKIuBrU3Xknvdt4L/cQeyNl9j27aOq74=; b=XaH+Ep8C13T103
	SEQnmrsA0QYAIlwN2wzS4lQDMcVHCyiSwbV3CR6HK2y/9ZCdEdKwMImscShxBnfL8JTYX9K4kmwPS
	z+PcD39ul6eYBbU/jPwOC7Rkj5sDbsr0drZeV4vbiRB8cYV9tGU4x10+i5qwb8d/L+uT00+wpKdlF
	3zpeJzbB90evo7yqbUJ1wGcX8cv+vyMp0zl54/rSmM3dTxTOR2z1E2Uj5fZOK+r2fBxDLtK7YmsW0
	+DBA8JcYo1u2Oto5f3pyun8tWW8n4WRYdHM2tVsSsKr5foZovATXOTq2wFqPYmITWwC7Ep/80JGUr
	nfMwI/4eOPYRte6Vqoaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonW5-007Gqn-77; Wed, 11 May 2022 14:40:41 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonW1-007Gng-4U
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 14:40:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 63DE168CFE; Wed, 11 May 2022 16:40:33 +0200 (CEST)
Date: Wed, 11 May 2022 16:40:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Conor.Dooley@microchip.com,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 3
Message-ID: <20220511144033.GA1478@lst.de>
References: <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
 <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
 <20220511123724.GA25121@lst.de> <YnvDdPz4S5IJ7l/5@kernel.org>
 <20220511141034.GA31732@lst.de> <YnvKPu5uQ8rqEcvV@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnvKPu5uQ8rqEcvV@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_074037_399000_71D41EDB 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, May 11, 2022 at 05:37:50PM +0300, Mike Rapoport wrote:
> Presuming that devices see [0x1000200000-0x103fffffff] as
> [0x200000-0x3fffffff] we may try something like
> 
> 	min = memblock_start_of_DRAM();
> 	max = min + 0xffffffff;
> 
> 	if (flags & SWIOTLB_ANY)
> 		max = MEMBLOCK_ALLOC_ACCESSIBLE;
> 
> 	tlb = memblock_alloc_try_nid(bytes, PAGE_SIZE, min, max, NUMA_NO_NODE);

While there is still no guarantee the first 32-bits worth of DRAM
are actually mapped to a usable address, this looks like a much better
default than what we have right now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
