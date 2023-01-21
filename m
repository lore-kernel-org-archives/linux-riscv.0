Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C21C004D4
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jan 2023 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxKICdWRzHEk9vYBepfKuY4MH1toA+aAt4LxlG5nCq0=; b=koYHOsLRAzoDe7
	Y4jT0s+vGjttXo052RmpchvkmegIcKHnm4/T4WLUUZJLBakvu42bDgz6r4TjAhYNfoWbM1+QQcJnY
	zv9wtmIxrbYnGZuvKjONQ5+y8/6LKBvHD6anEKY8kj9SGzRCVHBEy9CzlULH3qKDQdAyLaPD9FaHR
	5e4DFS+f3F587DvW1mOjnlYYvKf1ekxMaBi2+VPneF2hR1TFwdf5YNF97HvSzo/IxgGnva78sI2b0
	JVlrbBODqocKuVMaUacnk/rgVofF8lmUT4pnUjHVgS2phGaL/FqQ96FIjA3EpQ59pefFqRT3VVO7w
	HokLKGMZWNXdGVFpV3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJJZl-00ELYu-Kx; Sat, 21 Jan 2023 19:30:53 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJJZi-00ELXI-UK
	for linux-riscv@lists.infradead.org; Sat, 21 Jan 2023 19:30:52 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E1E865C0107;
	Sat, 21 Jan 2023 14:30:44 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 21 Jan 2023 14:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674329444; x=1674415844; bh=+7vn6FJZBW
	3ikBxFe0qPdDLONLsi4C2GNXv/wpFG9m8=; b=EeObT9K0sJ+FiQXaSyOV5ga30V
	vMENd25mxMVpvuqYXP47vEmUcqJ99KsL6t+jqXWWzOGGLK3D4c/P0q7R2wuvQhxS
	/Fpi6CJlO7JZXJjV91rA33MYhRyBo9JD36h8kmluTE7BFX3cOIjN+TUuaX+QV+nm
	v/ARpRV0JeGZBNZwvKAIvUXgfUEdIhTwhMgHU9zT+G9OAbedXljWSZzBJLMdGOr7
	hbrlQLKBUkThiq7CNb4Ilu4xTF1EKFYvIIa0ATWGQ8zP24ddyZFw+pGe9eV6JQuw
	LOlR7Dtte5BgL8lCm3okHwbG1xSFpwsQhm9WM3vHsQPxu8c+DCZnhACQeHuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674329444; x=1674415844; bh=+7vn6FJZBW3ikBxFe0qPdDLONLsi
	4C2GNXv/wpFG9m8=; b=cTR6G7GxX8c4+1ur1pwyc3RbXEnxrgZ8WXRA0PWJtdUS
	YyC72cTt8LmfsOI9awxVYbm0TXCfNQHKuKjNQ5dEewa7VP1PZ/XgIKiTUvqfJCPm
	XFAn2eTyr80TEoqMnIpCPIBnTvy+zuKZTb8p/ZukSpVeNlnmPNFVfspievqoz09V
	qFTKcyuBTPqy61mIH74DEwH52xSnXxm4FgjF1F8Z+j0LctAS7zeUvxKP6hOoFRBd
	PqVXuLizjSMlKzNTX9YWl0R1LgIuxix9fW22FFr+U2Ueje9sjlOEbXnhHFP0HP9H
	/g+niDqrLn/Rrarg94OzjmzuGgNHN4Ly5mpgqC447g==
X-ME-Sender: <xms:Yj3MY-IeHzzr72z__jAaXt87q7ElEjSG7RpYBuepTWUven1PQtvFJg>
    <xme:Yj3MY2JOTUsZ9lfq8nxBq3xGsA6PBxDZcC_q6aMrLN0K6qiW4FrThwVjq-fA16g4_
    Y2eOeS9N5lBq0ZWEvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddugedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Yz3MY-vDDrrJO4JItp5jCY0rb8QUpkDfRjZbEMSFJFbpv2aJCj8HBg>
    <xmx:Yz3MYzb51Se0_tbRh6lxz3SWOLXkxuDEGAt99VlR3WoasegoTaGoUQ>
    <xmx:Yz3MY1ZkDQIWnFL-JVZoxjWmqyPtLXRCWOVjHx-uXkSGvWoPXD1MFQ>
    <xmx:ZD3MY_ZanUXp0GNUT75Y4jRa5hZVWralEsTNPHcoFovr_92-8ykbhA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DC75DB60086; Sat, 21 Jan 2023 14:30:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <6a64b0b5-0ebc-43a5-a3d8-483a845a0b5e@app.fastmail.com>
In-Reply-To: <20230121143733.GA7415@lst.de>
References: <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com>
 <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com>
 <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com>
 <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com>
 <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com>
 <20230110070144.GG10289@lst.de>
 <02988e70-b099-46fd-b260-2d537c50543a@app.fastmail.com>
 <20230113054807.GA23179@lst.de>
 <ea4cb121-97e9-4365-861a-b3635fd34721@app.fastmail.com>
 <20230121143733.GA7415@lst.de>
Date: Sat, 21 Jan 2023 20:30:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christoph Hellwig" <hch@lst.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Philipp Tomsich" <philipp.tomsich@vrull.eu>,
 "Nathan Chancellor" <nathan@kernel.org>, "Atish Patra" <atishp@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Tsukasa OI" <research_trasio@irq.a4lg.com>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 "Will Deacon" <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_113051_081839_7C8EC6AA 
X-CRM114-Status: GOOD (  24.76  )
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

On Sat, Jan 21, 2023, at 15:37, Christoph Hellwig wrote:
> On Fri, Jan 20, 2023 at 06:04:37PM +0100, Arnd Bergmann wrote:
>> Having looked at this some more, I see that the powerpc
>> version is a bit problematic here as well: this one
>> flushes the partial cache lines before and after the
>> DMA transfer, while only invalidating the full
>> cache lines.
>
> That feels really odd, and might be worth a bug report to the
> PPC maintainers.

Right, my first step would be to change all of the current
outliers to use the same set of operations where possible.

>> Aside from the question for how to handle flush vs invalidate
>> on DMA_FROM_DEVICE, I'm still trying to figure out how to
>> best handle highmem with architecture specific cache management
>> operations. The easy approach would be to leave that up
>> to the architecture, passing only a physical address to
>> the flush function.
>
> I suspect that is a good enough first step.  Especially as I remember
> that some architectures have physical address based cache management
> anyway (unless we removed them in the meantime).

ok

>> A nicer interface might be to move the
>> loop over highmem pages out into common code, flush
>> lowmem pages by virtual addresss, and have a separate
>> callback for highmem pages that takes a page pointer,
>> like
>
> I'd rather avoid multiple callbacks if we can.  But maybe solve
> the simple problem first and just pass the paddr and then
> iterate from there.

Ok, fair enough. This means we can't easily put the kmap_atomic()
into common code for highmem, though the per-page loop would
still work.

>> struct dma_cache_ops {
>>         void (*dma_cache_wback_inv)(void *start, unsigned long sz);
>>         void (*dma_cache_inv)(void *start, unsigned long sz);
>>         void (*dma_cache_wback)(void *start, unsigned long sz);
>> #ifdef CONFIG_HIGHMEM
>>         void (*dma_cache_wback_inv_high_page)(struct page *, size_t start, unsigned long sz);
>>         void (*dma_cache_inv_high_page)(struct page *, size_t start, unsigned long sz);
>>         void (*dma_cache_wback_high_page)(struct page *, size_t start, unsigned long sz);
>
> Btw, I really don't think these should be indirect calls.  
> For sane architectures there should be exactly one way to call them,
> and the onces that have different implementations really should be
> using alternatives instead of expensive indirect calls.

I was thinking of using STATIC_CALL() as an optimization here, which
I find easier to read and understand than alternatives. One advantage
here is that this allows the actual cache operations to be declared
locally in the architecture without letting drivers call them,
but still update the common code to work without indirect branches.

The main downside is that this is currently only optimized on
powerpc and x86, both of which don't actually need CPU specific
callbacks. ARC, ARM, and MIPS on the other hand already
have indirect function pointers, RISC-V would likely benefit the
most from either alternatives or static_call, as it already
uses alternatives and has one implementation that is clearly
preferred over the others.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
