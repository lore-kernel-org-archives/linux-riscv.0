Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5171BC001DC
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 20:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLNJNl9GMWa2hzsueH+m+t3xOJAkm6D8LVHfJWYPxIM=; b=QAQVaTw9YoVIft
	Z9L2cdy+3XNjq2ABU3Mb3X6xBmvdqcogr+h1I2MVdQCRLM8tCzqIpUrqpFJ1W2uV9IMkj+OABMZTT
	HjfPQ3FUL7vyt5kIN7JeVQ+xZRr/rhNe+Cp6m/TVZWZ+2dPIOp4IDp4ooY/z/OcIB7nx1q/Y9Uyzd
	WweOTwxlm3HJdfs77nFD20OoLk7XUnspWXrL2e3KrYlwLzh48pirVQc6Ijrw7poxlf/lGQyw5X0V9
	1MQ4gr4Ia6IdfN21xTIxQbKwMlJYIr6tWnJ4eZHtUVEyFFHPhDT2+MMlEmMvXWyjcsQBT+0KS+Yr4
	Di6j0Ch08K7rSli5aOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQD9K-00Ch2T-1Y;
	Sun, 30 Jul 2023 20:36:22 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQD9G-00Ch1H-33
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 20:36:20 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B20255C006F;
	Sun, 30 Jul 2023 16:36:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 30 Jul 2023 16:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1690749374; x=1690835774; bh=KX
	x1odTZH/+yyu8Xceytmb1rqrk/nlaenTURJ0pY3Bo=; b=NQKMjRqK0xMvMTQNgv
	iAifdPQ+ZfrI0rGu+Tehf2cN9P+75cBZV6qyzBYP9/cl0PHGmqm6D3P3gGsHyjTr
	S+M01OnB33J0JWjZoMc0jMNJnhSg43s3buwdvZdNLJYHa0COx9rFsTwyhtyf5mqK
	NJW9QUOXXmG0Z9EzwhiMtxS4QgxBdp8xap1LxOkuq9Zb2EZuqssgNmFGJDZf+5bk
	HBQKSKmtlBKcbh1KKJZiO7E7T+o0npHKaC4caulAihNpGQxJiSeTORNjbSRhCeaN
	wE8t5NkRIbej9ACZdOTCghDpu5+KMPDIpm7Qb6pQ4C3cfN80fV9S7OkVzILJRu1B
	c7Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690749374; x=1690835774; bh=KXx1odTZH/+yy
	u8Xceytmb1rqrk/nlaenTURJ0pY3Bo=; b=XcK3hl6SNRH0FRh9ZhQSBQTC2hpgR
	vq2D9BxSc+T5kyXofL/I9FfYKkXcYXYi6Uzn8I/zmHoE6oJZmYJudIm7laFKa3qc
	xPK1Y4tG20hJmgV2Qb4pGN6P18rvadmomk7IhK01sbV3nX79RwmztK8qMELzUjEA
	dl/A4O9h1e+2FTVRK0B6gHMyeiSKYtYShFR/WvubRtIGtlYD7Yk6FtTvRjXvjeOB
	/XMcctI6ix6rtUsy9/5eVkApBzt9uix73Hl70me3ZsSKXCQxsasDti4oYn4/lhB0
	gM0jJ8EhZB9LtAHuPknm2xoxRbBGFuXhlY7GayIUtMNNCUd1fx4DAd0nA==
X-ME-Sender: <xms:vMnGZDd90uJ1foq-grnJmtBlmUsF17Rbz69CrSheZjp5lLqE-hMUTA>
    <xme:vMnGZJPWyBhIPsbwpjdLFzApjvx0sybQ9b-Op_BuP0Tgg6_Xm8wYzJmbvKEmZjK1f
    U_T5vcRI4tIspQLMx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjedugdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:vMnGZMjGLz8XJmZOJKPjTD4r_uiTFXyKaJgtjAFWjT2TOoDAEs7bzA>
    <xmx:vMnGZE-_MsmlnFKJh2aZb_O-mAyWEsd_OKjQMJPxwe_SI1jZf1d4Og>
    <xmx:vMnGZPsylF0bgytZ9CtTuyWfA1QtygVBzKfwzcVMbNUiIHQ2j1aZfA>
    <xmx:vsnGZLRVyn53NbhgDOMKWCn6oF1H6ZMi2YyuD2rlHQj1YZ8ErcNjdw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 25B5BB60089; Sun, 30 Jul 2023 16:36:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <92c00ddb-e956-4861-af80-5f5558c9a8f5@app.fastmail.com>
In-Reply-To: <CAJM55Z8vF8_xq0QyByLUGM2W-8m6R-_6SdOFdLETV7J-yo5DMQ@mail.gmail.com>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZMZ6XB6gX2kFd/Nt@xhacker>
 <CAJM55Z8vF8_xq0QyByLUGM2W-8m6R-_6SdOFdLETV7J-yo5DMQ@mail.gmail.com>
Date: Sun, 30 Jul 2023 22:35:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>,
 "Jisheng Zhang" <jszhang@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, guoren <guoren@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Samuel Holland" <samuel@sholland.org>, linux-riscv@lists.infradead.org,
 "Christoph Hellwig" <hch@infradead.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache operations
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_133619_462837_AEC36EED 
X-CRM114-Status: GOOD (  14.15  )
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

On Sun, Jul 30, 2023, at 17:42, Emil Renner Berthing wrote:
> On Sun, 30 Jul 2023 at 17:11, Jisheng Zhang <jszhang@kernel.org> wrote:

>> > +
>> >  static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>> >  {
>> >       void *vaddr = phys_to_virt(paddr);
>> >
>> > +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
>> > +     if (unlikely(noncoherent_cache_ops.wback)) {
>>
>> I'm worried about the performance impact here.
>> For unified kernel Image reason, RISCV_NONSTANDARD_CACHE_OPS will be
>> enabled by default, so standard CMO and T-HEAD's CMO platform's
>> performance will be impacted, because even an unlikely is put
>> here, the check action still needs to be done.
>
> On IRC I asked why not use a static key so the overhead is just a
> single nop when the standard CMO ops are available, but the consensus
> seemed to be that the flushing would completely dominate this branch.
> And on platforms with the standard CMO ops the branch be correctly
> predicted anyway.

Not just the flushing, but also loading back the invalidated
cache lines afterwards is just very expensive. I don't think
you would be able to measure a difference between the static
key and a correctly predicted branch on any relevant usecase here.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
