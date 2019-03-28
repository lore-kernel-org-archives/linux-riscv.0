Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307E6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:36:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C2E206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z6qcjyqN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C2E206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8xdEgWlHybePhDDTXY/aP/jhO4p0vhcYIgAeBuj27Y=; b=Z6qcjyqNF+iWjd
	pYh1e3/EHX3MsOlDOfe5eLmKG4FGD4drQ0okibeWhqmH4ZAN/UFzrrVmUGBb5+Ahxab80l4svAqlV
	nvd8PqChugxxugYbi9ujr/15fTeBCbmgsnlL6Mm3VI4hsUZtwh+6+V565fAn+H24yJQb+z4ev7pav
	2evFHCah9bOvLtBnM+u7AHnH8TndJpMLF5Ag02D0ChoIMDCC1z01f63vIDGXvt9bw13DU8yttMP89
	Syq2pTM8ERIIFEsOCT9q5s4KS0mGpxsozQ2UUeYgo06u/fWr1GEWU504YHIGgKhQtkVsNcw2WJ0gy
	5Z7wbj8HiY7nb2zXVnKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Y1K-00032v-1x; Thu, 28 Mar 2019 16:36:50 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h9Y1H-00032P-HC; Thu, 28 Mar 2019 16:36:47 +0000
Date: Thu, 28 Mar 2019 09:36:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Message-ID: <20190328163647.GA6577@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
 <20190327073131.GA4519@infradead.org>
 <be4911ab-9234-132d-1421-f0a06c2038d4@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be4911ab-9234-132d-1421-f0a06c2038d4@garyguo.net>
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> > 
> > I think Anup now fixes OpenSBI.  Do you have benchmarks vs BBL,
> > old OpenSBI and new OpenSBI?
> > 
> See the cover letter. OpenSBI's code hasn't been made into stable, and 
> it has race conditions now.

Well, I'd still like to know numbers.  That is how people generally
justify more complex code that claims to be more optimal :)

> > local_flush_tlb_range?
> > 
> We don't have the VMA structures now so no. This is related to future 
> ASID patch as well.

Well, sprinkling inline assembly all over is generally not a good idea,
so I'd like to have some helper.  And as pointed out before, IFF we pass
an asid instead of the vma to local_flush_tlb_page once ASID support
is added local_flush_tlb_page would nicely do that job.  If we really
want another indirection it could be local_flush_tlb_page_asid instead,
but I don't really see the point.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
