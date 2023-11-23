Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB97C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Es/yF2IR21cwKsRNYuaXoHUlNWPBnbfjKGeCt91p+xM=; b=3LmDl1cM0bbZv2
	/6X/QQPUk4PYCsuqF6ntTqyQ9eUJykuDDW3mG7KOGxRyLOvAjeLuieoWZ3f7dCtRQoIU01j/PqLKE
	JvaSfkJzI0vRC7dzfQbQm8TEGi8+nZ3tEXsuc7kYcSkS/y2Y8fKmjvrsmyk3ygXJaUgkhElOQUhDn
	zNQDUGvfDXrlJCrsjriHURpGYiG4fm6LRtgp1es+Dx74NLydC8e6CnmCoFvGjYwtjZOKelEjk7RYj
	gz2s4KKc/w9F7dbB7WKMgZmBJW1e5maz+v+VlbE1ejEgJEA6tT1TvY/YgMAchlUpexuP5561dL9wM
	nvR33IxPfOmclh0oANdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r661z-004G0r-1z;
	Thu, 23 Nov 2023 09:29:55 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r661w-004Fxi-2V
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 09:29:54 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 207155C019E;
	Thu, 23 Nov 2023 04:29:46 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 23 Nov 2023 04:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1700731786; x=1700818186; bh=/6
	Jewe6s2lAA53NpQQ339J2KIqQZoaHRGTOK/DO562w=; b=3BjGUXa7ROSW9+KBsE
	ZZDOV4JJt2L9vwcvIIRKpNKreGCXVGdmwdV1Rs/fhD15Y1mbHF5HWRVZ2QBKLnVW
	yxChHrPogs9t3GaU1pYmIVHH9fvHpinULn2rlx3tY5U28HQv9LxihlKfysK3Ujxj
	kH02DXm65Biede94fZu4User/nUeC17TLw0f5c5cDx5GkkXZk+0fb+mi6ECbP5NT
	eA4sufiZOa7LGoDymo2lw44xXaJCqxY1uvNb1ODOyEsddsW4QTRCXK5bgMjZU5IX
	DaoK5WWpDp42FG0qVTshqj7NzMimScDVkDVx1mQQdiG2ZAjFRq7R10l3ybnsTaqh
	DvFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700731786; x=1700818186; bh=/6Jewe6s2lAA5
	3NpQQ339J2KIqQZoaHRGTOK/DO562w=; b=kcmgiuMjPl/BWEwHRyPDYEXyzCYRt
	nV3+mrn3JcvHMyhpk/JCuUPKmDMfj4MsDjJehrnPAOjENPji1JzlkmWTXr/A0BgY
	aeSCtZERd/1ogaqNAFQe8Wh0BFQldTDPnps9/6mTogVcYjpKBcRnM+FfvRLm0Dps
	esEsvQO2J8wyUVrHW7p76QEoo4EtSD8PN8U0gpE36NNjybyfYJehoiPhx7m1Fwk4
	xP0P/JIG7bfjskm3o8tbqVFSMx3ADENQliRTuPGJgiYbcsUcPY2mOWnac6qoAQNE
	CBn1qgNFwnty0UhZmyNwDFD7TdvfVss0Z22Ep0FNEYbVl2kJgKXaF4nTQ==
X-ME-Sender: <xms:iBtfZSMKEECZwEV9ZP714va0nu9yPvN4wqWi2Z10Y_JmoFp53VyYPw>
    <xme:iBtfZQ_fKaq-MDHU4A5YEoDeML--aa0XFc5VkuHf_tvGjNr25wDoy1DJpZpvUIVzD
    bL7PgoEHrimzzljx18>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehfedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvdefjeevfefhvdevjeeuheefieetvdduheeludevtdefhfekleduhfdvjedt
    ieeinecuffhomhgrihhnpehlfihnrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:iBtfZZTLb62AFDmmzt1LLsbLUMqjHHPGJFVBNYRxtHR23WcODO3ESQ>
    <xmx:iBtfZSsS1JLCn9alYL7IEG6k2UnbCKJThpNQ7oWgxw8rmuiO4-ZzMw>
    <xmx:iBtfZacihlKgYNoAaUoOrfEYQDXPxZeWej67eDumLlhl_NKLiplaMQ>
    <xmx:ihtfZW0vPOCMKWwZTX17dJQF7MJabXP9p2oVv4e1g1g2IZpHTDtJjw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CF1F9B60089; Thu, 23 Nov 2023 04:29:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <94c2e04c-4c62-4ee1-8ae7-cbd675c5064e@app.fastmail.com>
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
Date: Thu, 23 Nov 2023 10:29:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Xu Lu" <luxu.kernel@bytedance.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>
Cc: dengliang.1214@bytedance.com, "Xie Yongji" <xieyongji@bytedance.com>,
 lihangjing@bytedance.com, "Muchun Song" <songmuchun@bytedance.com>,
 punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH V1 00/11] riscv: Introduce 64K base page
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_012953_234366_1DF8C794 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, Nov 23, 2023, at 07:56, Xu Lu wrote:
> Some existing architectures like ARM supports base page larger than 4K
> as their MMU supports more page sizes. Thus, besides hugetlb page and
> transparent huge page, there is another way for these architectures to
> enjoy the benefits of fewer TLB misses without worrying about cost of
> splitting and merging huge pages. However, on architectures with only
> 4K MMU, larger base page is unavailable now.
>
> This patch series attempts to break through the limitation of MMU and
> supports larger base page on RISC-V, which only supports 4K page size
> now.
>
> The key idea to implement larger base page based on 4K MMU is to
> decouple the MMU page from the base page in view of kernel mm, which we
> denote as software page. In contrary to software page, we denote the MMU
> page as hardware page. Below is the difference between these two kinds
> of pages.

We have played with this on arm32, but the conclusion is that it's
almost never worth the memory overhead, as most workloads end up
using several times the amount of physical RAM after each small
file in the page cache and any sparse populated anonymous memory
area explodes to up to 16 times the size.

On ppc64, using 64KB pages was way to get around limitations in
their hashed MMU design, which had a much bigger performance impact
because any page table access ends up being a cache miss. On arm64,
there are some CPUs like the Fujitsu A64FX that are really bad at
4KB pages and don't support 16KB pages, so this is the only real
option.

You will see a notable performance benefit in synthetic benchmarks
like speccpu with 64KB pages, or on specific computational
workloads that have large densely packed memory chunks, but for
real workloads, the usual answer is to just use transparent
hugepages for larger mappings and a page size of no more than
16KB for the page cache.

With the work going into using folios in the kernel (see e.g.
https://lwn.net/Articles/932386/), even the workloads that
benefit from 64KB base pages should be better off with 4KB
pages and just using the TLB hints for large folios.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
