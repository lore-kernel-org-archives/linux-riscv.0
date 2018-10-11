Return-Path: <SRS0=F3Ra=MX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDCBC32788
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 13:31:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CAFD20658
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 13:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9DW/8zB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CAFD20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxyLEKVwq5eC9L+3QleJqQQaVffeJNAWxJrzSDrNup8=; b=X9DW/8zBb5zIxV
	jmuVYLRKqu3b8qvykJRW4J5bzveuoBTEigzaSMh5traq8ZnUup6QCPjzNIMVyosED1semxUhKwDDj
	L+ArwrSZ4GmbrwBYeWE2mI/OHe5BbJpUd4O2YJAzwZ+SnxxIad+tdnHbiZeTfYQAmTY+b/e07+4RG
	UDq7mif97yv1cBEF2gruF7JNSsFAxaKUD0Ng1fY+XVHaZtp82FAXxIU1B+8SmDy8ZWe0nAFE7tTfQ
	/ao0l/1IXWlvxkZrEIEdbFn8xb72VbFJjNmTEqdiJRahn93fPnC1HV9Y2Gxf9nHoCGFZ/WuJVuqEb
	DUkuCCOXBjiQD3BFt4Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAb3K-0003u5-2A; Thu, 11 Oct 2018 13:30:58 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAb2p-0003Pt-Sp; Thu, 11 Oct 2018 13:30:29 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id AE92B68BF4; Thu, 11 Oct 2018 15:30:09 +0200 (CEST)
Date: Thu, 11 Oct 2018 15:30:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/5] mm/sparse: add common helper to mark all memblocks
 present
Message-ID: <20181011133009.GA7276@lst.de>
References: <20181005161642.2462-1-logang@deltatee.com>
 <20181005161642.2462-2-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181005161642.2462-2-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181011_063028_095459_304BCF37 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, linux-sh@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
 Vlastimil Babka <vbabka@suse.cz>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181011133009.zX0qMC3qcCasXRedHUge2rp0uHd8c2RwoUsFEOZ66yY@z>

> +	for_each_memblock(memory, reg) {
> +		int nid = memblock_get_region_node(reg);
> +
> +		memory_present(nid, memblock_region_memory_base_pfn(reg),
> +			       memblock_region_memory_end_pfn(reg));

Any reason you have a local variable for the node id while you happily
get away without one for the others?  Why not simply:

	for_each_memblock(memory, reg) {
		memory_present(memblock_get_region_node(reg)
			       memblock_region_memory_base_pfn(reg),
			       memblock_region_memory_end_pfn(reg));
	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
