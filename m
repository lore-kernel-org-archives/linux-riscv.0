Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131A0C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 11:43:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDEED20656
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 11:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BX1TB2BK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDEED20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOoIAhO2KSB8v1RSVRGMpiR38O7eBlFuCOhyp4RXCgo=; b=BX1TB2BK0ldC0A
	1tywU3cq7tQ7G1Ps88EPbZ+pZJUkWKE+7zTzeB2dwqjdk8V2FiWbIJaOvxpvMC4qwD14V0xnzRUBN
	M1+D2XMRLcxMw2yd87Bl03mwW075TJIpqPDPtag/nwOhKa/YXUrAWAWmkGEdMXfGMIYnfcpvqUmOL
	en8oOb0HAiPt5+UQEzL8Ibt5+xs9I1bb/ZonugGrAQ1ABG+zQT7Pr2q60RU0lCwJh+6A4Od14f8gE
	UHQ4cnyI3kvLg604E8AdGTWZNNEK7hJaIMNREcHvS7uH0mF1EIoD22AkCqIAoO6CEy+GF20NfVxBY
	8fO9av6UXnwTCqdDcT+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSghu-00079j-LO; Mon, 20 May 2019 11:43:54 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hSght-000776-05; Mon, 20 May 2019 11:43:53 +0000
Date: Mon, 20 May 2019 04:43:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v4 2/2] RISC-V: Setup initial page tables in two stages
Message-ID: <20190520114352.GA5372@infradead.org>
References: <20190502050206.23373-1-anup.patel@wdc.com>
 <20190502050206.23373-3-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502050206.23373-3-anup.patel@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

>  void __init parse_dtb(unsigned int hartid, void *dtb)
>  {
> -	if (early_init_dt_scan(__va(dtb)))
> +	dtb = (void *)fix_to_virt(FIX_FDT) + ((uintptr_t)dtb & ~PAGE_MASK);
> +	if (early_init_dt_scan(dtb))

FYI, parse_dtb in mainline now lost the hartid argument and takes a
phys_addr_t for the dtb address.

That being said I find the above way to magic.  So we take the fixmap
address and then only the offset from something passed as a pointer?
This just looks very weird.  The way FIX_FDT is defined to add to my
confusion, which might partially be due to not understanding fixmaps
very well.  But it seems like at very least we should set up an
actual kernel pointer for the dtb in setup_vm based on what that
gets passed and stop passing any arguments to parse_dtb to keep
that magic in one place.  And possibly add some comment.

> +#if MAX_EARLY_MAPPING_SIZE < PGDIR_SIZE

It seems MAX_EARLY_MAPPING_SIZE is defined to a fix constant,
why do we need these conditionals?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
