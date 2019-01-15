Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61965C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2513820657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZXJ/DikA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2513820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cB69g/cRbSgokA+J/LvbYQpDMDifVg1ucjlF+ohqamA=; b=ZXJ/DikAegGYDq
	rK4TdWU5zm5lYWlz+WMBQ38SnJPUCXpesOdXv9ZAFCBVvchgtdBIwKlY7UgH0dLfx0jr2ZkB9XXgx
	PCKkvLp0eKCbAG6DOyc+6qC9PZ2HJQIg3WqDbAAH+fneBZtZNIQOoWOjg64X4sT7toZYp0nukP4m9
	HtTMVNzd+I/SF/fgJzp/NTmbdxnMStszK/KBHF0TVbUb7AqOlJno9xNipZPHeT4xsOZBgDyKT6Dql
	guIMkKlACOL5mUJHhF/kSoWmrhglvLnAOny1dhxcpzWv6cv7fBIEGV22RmZJvD8WdGHyuTzcPYXf+
	S5f/gq4izbq1mjCZtf3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRKi-00053c-QY; Tue, 15 Jan 2019 16:12:56 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjRKg-00053I-Jy; Tue, 15 Jan 2019 16:12:54 +0000
Date: Tue, 15 Jan 2019 08:12:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: fixup max_low_pfn with PFN_DOWN.
Message-ID: <20190115161254.GA19081@infradead.org>
References: <1547280987-7630-1-git-send-email-guoren@kernel.org>
 <20190115153613.GC26443@infradead.org>
 <20190115161000.GA22705@guoren-Inspiron-7460>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115161000.GA22705@guoren-Inspiron-7460>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, Mao Han <mao_han@c-sky.com>,
 Christoph Hellwig <hch@infradead.org>, Guo Ren <ren_guo@c-sky.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 16, 2019 at 12:10:00AM +0800, Guo Ren wrote:
> > >  	set_max_mapnr(PFN_DOWN(mem_size));
> > > -	max_low_pfn = memblock_end_of_DRAM();
> > > +	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
> > 
> > I know it is used just above, but can we please just switch this
> > code to use >> PAGE_SHIFT instead of PFN_DOWN, which just horribly
> > obsfucates what is going on?
> ???
> #define PFN_DOWN(x)	((x) >> PAGE_SHIFT)
> 
> phys_addr_t __init_memblock memblock_end_of_DRAM(void)
> {
> 	int idx = memblock.memory.cnt - 1;
> 
> 	return (memblock.memory.regions[idx].base + memblock.memory.regions[idx].size);
> }
> 
> What's the problem? PFN_DOWN() couldn't be used with function call?

PFN_DOWN gives you the correct result.  But I think it actually
drastically reduces readability over just opencoding it.

> My patch just want to point out that max_low_pfn is PFN not size. In fact
> there is no error for running without my patch :P

No, I think your patch is correct.  I just wonder if we could make
the code easier to read.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
