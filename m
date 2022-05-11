Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69945C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3r5WfPryzoWMsQ498zOn6NueGDbxo45Q5CaPX1bRZfY=; b=Xf1c1qiqpn3J5b
	DPz/hswd33T3zsxgWJpkCiFa5LeM+M63HphZjttDEGvGR0zx38+XyJE+8z8JLbJlOMJDTCrO58rPv
	e7dfBS1pZyCaF0bNTMBR4PVttIFQeIo5Z7wNR5wD6UgjF5XXyd//KdpQc7csaYmTJM5uYxlh5VeYb
	pF2neddXigvrh8bUlutsTH5hrpi17uqJMBzRYozKhA91sxGh763EkBBpxLOKV+54p7n9cP4wF6bSF
	i5e726iJ98VL72VaR8NdB+XfVS4XGkyhu22gS4r0jH+VtLEziQa1VXeGQYY7tFrN8/PBrhdqchNpR
	FHmLpvO0u6C+WnjCv4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1non1T-00775u-KX; Wed, 11 May 2022 14:09:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1non1Q-00774q-QA
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 14:09:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C4B761D18;
 Wed, 11 May 2022 14:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C47C34113;
 Wed, 11 May 2022 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652278139;
 bh=o5xX6sJ490PzLKK/fZ+dg3ieCtWuIK0BIN2ZYglmcSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/+LK5uTuasJGcDXqcF0GVH52u8hAaFrbSlhBgleKlgPB7qeqLE8MUdP/dRazvxAj
 fJO7MaZY7xv0y+UW3ku69aRzDb9DOLILNqSNj2vSSCgm5YnH7PUqFDFncN7BAYnkcg
 c+DkyByzeTdpz75jqmSzoLs5Vknvl9nlTD9hAvL592nLUO6vVeGr+ODWqZC/cSmp0Y
 qdJsQvy++Rkw+C0A7IzSXvCYG6CCRBcaabzK+f8zFhtiTU4THNb2IllRWRMUxiHPbt
 ZTDup+yr2W2r41FyAeLLayyfwMxHnxVXlgAN0ThDChpyafU9H11iaw4ZcjSufwgQfW
 eQ/2qxMLDcPVQ==
Date: Wed, 11 May 2022 17:08:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Conor.Dooley@microchip.com, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 3
Message-ID: <YnvDdPz4S5IJ7l/5@kernel.org>
References: <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
 <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
 <20220511123724.GA25121@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511123724.GA25121@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_070900_927160_212A1C64 
X-CRM114-Status: GOOD (  20.24  )
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

On Wed, May 11, 2022 at 02:37:24PM +0200, Christoph Hellwig wrote:
> On Wed, May 11, 2022 at 10:10:40AM +0000, Conor.Dooley@microchip.com wrote:
> > Without even trying the patch, I double checked the boot log from
> > 3f70356edf56 and I get a "software IO TLB: Cannot allocate buffer"
> > With the patch its a "software IO TLB: swiotlb_init_remap: failed
> > to allocate tlb structure". So spot on & I feel like an idiot for
> > not spotting that before!
> > 
> > Is failing being fatal valid, or should it fail gracefully like it
> > used to do? To me, blissfully unaware about swiotlb, the "current"
> > behaviour of failing gracefully makes more sense.
> 
> Given that we're at -rc6 I think the most important thing for now is to
> avoid a regression and restore the old behavior.  I'll send out a
> series with this and the nslab related fixes for Xen today.
> 
> But we should look into why allocating the memory fails for your
> plaforms.  Does it have very little memory?  I can't really think
> of why else the memblock allocation for swiotlb would fail.

I guess the default to use memblock_alloc_low() backfires on system with
physical memory living at 0x1000200000:

[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000001000200000-0x000000103fffffff]

The default limit for "low" memory is 0xffffffff and there is simply no
memory there.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
