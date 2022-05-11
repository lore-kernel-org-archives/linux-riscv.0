Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3445DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyFOwmpvq5kn8g2INv1TQkDkWlr0xIZ0FmtXognGF0Y=; b=Z4neFYz7pRSfUa
	Dn3VF0m+m11TB8sm2i74y7tBX85wRkS2v3pBLHfZhHziu5wCVrLSyID9nQ/G8dj1Riu9nHKb1GzAv
	wE4uwTUTj3oKHlJs+F3vd1he49WeMN9ZbdvOezyv3yjBFHke3ZhmZAN7Fx5KwcLPRgaLzKs5b8iEJ
	Z+3StA9URY3TyIh/jkWb6aRFWQRtVIBQgB3xP197Kec81yaxLpJnPOxVjg2oS+4xgnTX+xF3xFBh0
	3Elbx2lwla82AN2NOk4uaJUGdJt3IhTCcsXjZ/dJOZmtBGyXhl6l2sufJf8RpGhTf+kcakngsKvTV
	2QH15UCrWkRjbPb81RfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonTj-007FqF-81; Wed, 11 May 2022 14:38:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonTT-007FiG-Ig
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 14:38:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 184F1612EA;
 Wed, 11 May 2022 14:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4790FC34114;
 Wed, 11 May 2022 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652279878;
 bh=+EwM9/Fo/mYHUrlVBMU+VRCENMG+agU2bXee/mgnCV8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oivTdHg0ETsFfYJ3nLcAkKMxQ0DDelY3MOQqxmOwu5Xuv22ns3iZdX45d3cAK7+gA
 Drnv1xYGqunk1VYAvfQrEnWxX7yE2xkTN9e1KfddBiCN3mAwL3f6DfrJaK6WQu1ULj
 R+yHyy8Jwl4ab3b5AxKaHsVWivIS8vlYpjD1fX6ud5I8IPbdqvKya+zboCzBQO9+CC
 FkWxj+PybERog6k6gyAWL+OGBO5AQ59i5DWruA/S8fs1QdRO0+mqbP5ngzmYGyk/nM
 Jowgp9Xe/3mCaMVPGsw7O1QHK+cJV9R0BBGohbDBjcvMUwyp/hYsgYwMruZRMuv0pC
 bePN1FXBaE7DA==
Date: Wed, 11 May 2022 17:37:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Conor.Dooley@microchip.com, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 3
Message-ID: <YnvKPu5uQ8rqEcvV@kernel.org>
References: <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
 <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
 <20220511123724.GA25121@lst.de> <YnvDdPz4S5IJ7l/5@kernel.org>
 <20220511141034.GA31732@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511141034.GA31732@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_073759_671593_2EFB6278 
X-CRM114-Status: GOOD (  16.89  )
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

On Wed, May 11, 2022 at 04:10:34PM +0200, Christoph Hellwig wrote:
> On Wed, May 11, 2022 at 05:08:52PM +0300, Mike Rapoport wrote:
> > I guess the default to use memblock_alloc_low() backfires on system with
> > physical memory living at 0x1000200000:
> > 
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000001000200000-0x000000103fffffff]
> > 
> > The default limit for "low" memory is 0xffffffff and there is simply no
> > memory there.
> 
> Is there any way to ask memblock for a specific address limit?
> swiotlb just wants <= 32-bit by default.  With the little caveat
> that it should be 32-bit addressable for all devices, and we don't
> know the physical to dma address mapping at time of allocation.

There is 

void *memblock_alloc_try_nid(phys_addr_t size, phys_addr_t align,
			     phys_addr_t min_addr, phys_addr_t max_addr,
			     int nid);

that lets caller to specify min and max limits

Presuming that devices see [0x1000200000-0x103fffffff] as
[0x200000-0x3fffffff] we may try something like

	min = memblock_start_of_DRAM();
	max = min + 0xffffffff;

	if (flags & SWIOTLB_ANY)
		max = MEMBLOCK_ALLOC_ACCESSIBLE;

	tlb = memblock_alloc_try_nid(bytes, PAGE_SIZE, min, max, NUMA_NO_NODE);

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
