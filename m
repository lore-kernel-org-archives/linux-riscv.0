Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F45CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+y/ZpJ+NXrfuXXT8nqbp8cqa2c/1GRFeZxfUsRyI0s=; b=CnhmkT+4oTz9Ti
	Wjg0NwfPc/GQxMrqO8Rh/eNzP7vgCGDC7lY0f4K3MW4r9Q/MudFCQnPjgNLi8MPKQ9EG93BWqMa89
	NPaxKjlUSEIBrLQ9QFdWfVyIAaix12QQdI/6zZwDwoDBouA7uxCeIsU6ngVn39dt25UL52juK01zG
	ArK92EBiPrsAOsthphsdmJJZ+l6DLn+WemwjnoKD4M3vXCpaO9az3fXZywQnp1kXHJ61UOyJT/teM
	5zoUCdMjEmsFUpujtDc3gQBeWy1SRjIMuJQShwU31Cn/G7QLgQzHuzE6uWWOOtA5SZKfO6WdYysx6
	gP67q2OC0VElGkf88Qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1non36-0077Pn-E6; Wed, 11 May 2022 14:10:44 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1non33-0077OA-Od
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 14:10:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id D48C468C4E; Wed, 11 May 2022 16:10:34 +0200 (CEST)
Date: Wed, 11 May 2022 16:10:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Conor.Dooley@microchip.com,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 3
Message-ID: <20220511141034.GA31732@lst.de>
References: <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
 <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
 <20220511123724.GA25121@lst.de> <YnvDdPz4S5IJ7l/5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnvDdPz4S5IJ7l/5@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_071041_970217_FE54A447 
X-CRM114-Status: GOOD (  12.41  )
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

On Wed, May 11, 2022 at 05:08:52PM +0300, Mike Rapoport wrote:
> I guess the default to use memblock_alloc_low() backfires on system with
> physical memory living at 0x1000200000:
> 
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000001000200000-0x000000103fffffff]
> 
> The default limit for "low" memory is 0xffffffff and there is simply no
> memory there.

Is there any way to ask memblock for a specific address limit?
swiotlb just wants <= 32-bit by default.  With the little caveat
that it should be 32-bit addressable for all devices, and we don't
know the physical to dma address mapping at time of allocation.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
