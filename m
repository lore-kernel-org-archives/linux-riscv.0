Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8CCC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqrGHR9HhHC1oU9HqWc4cc0x6lVf+8EVdH4vYl0HkWc=; b=WgW0SBWuhFJ8gB
	6P3Fs6Phpm7Lkc0PBVtJ2bKM3G4DPq7wJUxEr1rm6oPi5BZElfYRtia53YnfSmRxSwpLb3ATNKzDk
	lzfEB4qaBEo1dOpS1+Ny0AmA5EMhCNN5VmyxEXJA/6rZGQ8Ddvpl9439p8YEvLlKZTgYn8bv9DcI+
	s7Il4Z/Gt2kIq8uptl96u8nr632xrw6gsgn9j2aGtPMc0eCH8IpqyjeFi8TbJbuRGCI1wrsJtYVmA
	xURWYoVV6kx5CTPLU4wch1l3VXhbM3WB21Q7eU55UTnngW5URYGA9hKNE7hFAwJljdCtBLU9yohFE
	EWARbyHl6x1uXn2T9MAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph427-00DWFV-1o;
	Tue, 28 Mar 2023 07:46:19 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph424-00DWEU-0W
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 07:46:18 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1ph41q-0003r6-00; Tue, 28 Mar 2023 09:46:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2C9BFC1C6A; Tue, 28 Mar 2023 09:45:11 +0200 (CEST)
Date: Tue, 28 Mar 2023 09:45:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
	Rob Herring <robh+dt@kernel.org>, m.szyprowski@samsung.com,
	Robin Murphy <robin.murphy@arm.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
Message-ID: <20230328074511.GA6188@alpha.franken.de>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230323072944.GA18524@lst.de>
 <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
 <20230323213930.GA7730@lst.de>
 <CB41D3AF-20F6-42F3-9168-C0D6E716431A@flygoat.com>
 <20230328011812.GA21977@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230328011812.GA21977@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_004616_355857_E4824A5B 
X-CRM114-Status: GOOD (  15.19  )
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

On Tue, Mar 28, 2023 at 03:18:12AM +0200, Christoph Hellwig wrote:
> On Fri, Mar 24, 2023 at 09:17:38AM +0000, Jiaxun Yang wrote:
> > > 
> > > Is patch a 6.3 candidate or should all of it go into 6.4?
> > 
> > Please leave it for 6.4, as corresponding MIPS arch part will be a part of 6.4.
> 
> Ok.  I'll really need review from the MIPS and drivers/of/ maintainers,
> through.

I don't see any MIPS changes in the series besides the ifdef CONFIG_MIPS
part in patch 1, which gets removed again in patch 4 (chance to drop
that completely ?).

I've merged the corresponding MIPS patches into mips-next last week.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
