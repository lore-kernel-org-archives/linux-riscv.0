Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767C3C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 14:23:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4651B218FC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 14:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u6NLpVc6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4651B218FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Twlh2f1s2EMdYvOSN3doaoSu3PuVA4U1L95Ehq2SY98=; b=u6NLpVc6wTUwBi
	QgPjawt/UWzSHT2BVJgpVj6ee0ApEjCMEGAIcN/ldZQbeT4b7BRHdviSMyLzXKT0HaljnONlbyZZ1
	zltZh0RiJLZ3myRKKcRdqf0UVezgsShhCRGMx6bKYSLRbJRzPWEpWOPCdnTFVwDpa0pCQJQSfJseT
	V4j/lLfspQZ7UAnttN30+w5n10/EUCsU5jdozkWxpuGPW5eMBW2D7R7fpTU3RW0Yunayvzjq83Ze4
	DoIskgbjwFCuMhg12iY9xZEGB7jz9U1yBPnM67kJDoIBH5dUt3nqxoGd9vZ+7JRyjzkhBEZnSRICS
	l8M4ANuP0ki13RH+bgpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJIo8-0003KX-Lg; Wed, 24 Apr 2019 14:23:32 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJIo4-0003Jc-8Q
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 14:23:30 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 1B95967358; Wed, 24 Apr 2019 16:23:07 +0200 (CEST)
Date: Wed, 24 Apr 2019 16:23:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Message-ID: <20190424142306.GB20974@lst.de>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de> <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de> <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
 <20190424020803.GA27332@guoren-Inspiron-7460>
 <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190424055703.GA3417@guoren-Inspiron-7460>
 <4e6b0816-3fe9-8c0b-a749-f7f6ef7e5742@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e6b0816-3fe9-8c0b-a749-f7f6ef7e5742@garyguo.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_072328_469975_3F3FD804 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Andrew Waterman <andrew@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@sifive.com>,
 Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincentc@andestech.com>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 "ren_guo@c-sky.com" <ren_guo@c-sky.com>, Scott Wood <swood@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "tech-privileged@lists.riscv.org" <tech-privileged@lists.riscv.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 12:45:56PM +0000, Gary Guo wrote:
> The RISC-V privileged spec is explicitly designed to allow the 
> techniques described above (this is the sole purpose of MSTATUS.TVM). It 
> might be as high performance as a hardware with H-extension, but is 
> definitely a legit use case. In fact, it is vital for use cases like 
> recursive virtualization.
> 
> Also, I believe the PTE format of RISC-V is already frozen -- therefore 
> it is impossible now to merge GLOBAL and USER bit, nor to replace RSW 
> bit with another bit.

Yes, I do not think we can just repurpose a bit.  Even using a currently
unused one would require some gymnastics.

That being said IFF we want to support non-coherent DMA (and I think we
do as people glue together their SOCs using shoestring and paper clips,
as already demonstrated by Andes and C-SKY in RISC-V space, and most
arm, mips and ppc SOCs) we need something like this flag.  The current
RISC-V method that only allows M-mode to set up such attributes on
a small number or PMP regions just doesn't work well with the way how
Linux and most non-trivial OSes implement DMA memory allocations.

Note that I said well - in theory we can have a firmware provided
uncached pool - that is what Linux does on most nommu (that is without
pagetables) ports, but the fixed sized pool really does suck and will
make users very unhappy.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
