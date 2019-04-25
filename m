Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97747C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B8D217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWv215ii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B8D217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLQSiK12Jl3Lm5NXOf3Gk8CFJ+Frsus/4MoFA1ciCEM=; b=PWv215iiGyNJd+
	ojgXgGR5plXmR1hkDWof7cdROxsuURj/pZ7rY5N14fJAEr5GWq3Q7yoLAzIgPUWNvZCzacxjBzmJj
	InUi6deLoS8YwUolYDyHwphI9+EU7VsUG0cfU3BwgvUlBA/5JV/5YSKlSGnS6asEMLsCBhVXj6H2C
	86HsCDFurluFdS+j8Bm1jGImCNdqRmFDV1p7NHEd/qDa4bcEykjVbAsXeMDGa6+5lj2qzcYDIsv9t
	A5l2SBdHRq/jUn7sN0fXen8ykJKVuoSXTnceduKAlpkWewUh0lyk1Blbbd4HrAKjnUPJtoySb9L9e
	zBKlMnXQ04VxANZhl+bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZJm-0002jM-Ml; Thu, 25 Apr 2019 08:01:18 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJZJl-0002j3-9m; Thu, 25 Apr 2019 08:01:17 +0000
Date: Thu, 25 Apr 2019 01:01:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Message-ID: <20190425080117.GA3575@infradead.org>
References: <20190425055015.45487-1-anup.patel@wdc.com>
 <20190425055015.45487-3-anup.patel@wdc.com>
 <20190425055757.GA30545@infradead.org>
 <CAAhSdy36q1R8HQRG3kXDqj5JoJbO_drignvO7wCHJ3-6wkE5rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy36q1R8HQRG3kXDqj5JoJbO_drignvO7wCHJ3-6wkE5rw@mail.gmail.com>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 12:46:52PM +0530, Anup Patel wrote:
> On Thu, Apr 25, 2019 at 11:28 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > > +#ifdef CONFIG_64BIT
> > > +#define SCAUSE_IRQ_FLAG              _AC(0x8000000000000000, UL)
> > > +#else
> > > +#define SCAUSE_IRQ_FLAG              _AC(0x80000000, UL)
> > > +#endif
> >
> > Please keep the existing defintion that doesn't need an ifdef..
> 
> Sure, will do.

While we're at it: I don't think we need both INTERRUPT_CAUSE_FLAG and
SCAUSE_IRQ_FLAG.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
