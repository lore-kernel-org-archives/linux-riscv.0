Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A709BC5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1YstUCw8Kr7xiPxa3RvIm7e/B+689FSkQeHQ6YKqvI=; b=llgRtvoOPbppts
	m6YhM4dpNsG31Ivg01/MwvUQGRQiccCJGqEmCa9VD3gWQ3dcYjmAruCEsir+iyEy5AfIzVyDd3aiC
	zAraAMWMV+OuoAjjGaqn2KDV26fS0sl/hl3oNtfvXTL2SKJL6nn03q+4DMDev+CpEJlCdjXXdqBKA
	vo841PmPxjkJozJkDMlX8Q84lhdYgMCMUQuMjP1L6h0EKJkaqz3A4Jg82gz2+2JUJmaFrXzR4jTau
	8D6Nx9AOn77MZhpCiClFVUYBwS+yPs71A679wEAUb8WmUBVubPYaNtDYVZOCQwFA/HiIUzNKQj3Hz
	27B3wQRVVQyDwaOodixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErkj-001OQ8-H8; Mon, 09 Jan 2023 12:59:49 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErkf-001ONF-P9
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 12:59:48 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 732823200900;
	Mon,  9 Jan 2023 07:59:39 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 09 Jan 2023 07:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673269179; x=1673355579; bh=QHyVDTSeBQ
	Usc679p5SSBNeodDyOr47mIwbZVEkPd4g=; b=o4U8vEUBt5mELqQoEclx4o57G8
	c6NtloZo+fIDDvqhu76woxJwlxAA5hK+qXOq9HCqyEGUIbdMZdSkCEl2MQH9qlYR
	Q10f2+t5J+TfFPEsqHSPHhQpX7D5jE8Ui0HGGKhEi5EoLDR84BFetU/4Gw4jD6An
	gGzf4n6fsVzbn5RVE+zHAzXGcfX0kG5Rtb42tBcug4k4I+hZ7fQ4QaJmpV7bsa20
	ON0flyNcXfJxXiBp1QSxNrANS5jl+ewa0j5mWjjyA5UuhOvNRc0cMcZc1PWXyCTJ
	xF+8k2rxHksQ/o3Dk9uA4dM8V6fkeKkVKYNMibpl1hFKw4lwYow6904NA1vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673269179; x=1673355579; bh=QHyVDTSeBQUsc679p5SSBNeodDyO
	r47mIwbZVEkPd4g=; b=msd59zkgkATHCZWq0Fg/AW17cXKjoj+KNdUYRUcomfAu
	qOT48jV+a8Cx1m+WoVDVCKLjlDghAkYjRqX7cy12kwmhFhpLf7wt1Q0uVzfeTS0I
	Am7Htw6JHQnsbTI4epRZn9Wz2qp3jSoJ4+nA3T6n6BZV+lvS5Ni/PvoWBWrQtzD/
	DP7KrchYaq8yyebf1vsG9fdoO6MLfDCB7nOax5wVp7fu6u+Vnup4q64IcFEYi726
	EGhNwZc1rAsc/uCxMT+/euXvhHFIl/2vbkzbD5bRamxLj7tS2VTAcYvhw4zVqSGw
	D5I+HaJRqK/0rqdc7rQMp8l0brW6JBEJtCDnbo9FfQ==
X-ME-Sender: <xms:uA-8Y6lLnlIc14O2ih-LfqHwT8g5bydabYMrUxruSvB4ET4evCQpSg>
    <xme:uA-8Yx0pIvsaFYFjgpRZ38exYx1rPDq_by9S3FquiiPRxVoBaEX3a5rizjo1xRhbJ
    s9PU1rwmPhblYu1pnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:uA-8Y4rnl6JJOpyKNg3SM4ka7TBNmJBnokvtaJW79uaemQ6-G0wecw>
    <xmx:uA-8Y-n9zhjmUG4Py202QCNMwapdpuwFJW_-hHuScNuugahoyZFmqQ>
    <xmx:uA-8Y402UeUcdP8DrfTqtJeIoFqCL1XiPxYB0keY-gm6zRrZV-uKBQ>
    <xmx:uw-8YyWWJX4csRKHR1p9dWMu88JOAfiwZx3JGY9OizVxtkEGRmTydg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BCAFBB60086; Mon,  9 Jan 2023 07:59:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com>
In-Reply-To:  <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com>
 <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com>
 <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com>
 <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com>
Date: Mon, 09 Jan 2023 13:59:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>,
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
 "Christoph Hellwig" <hch@lst.de>, "Will Deacon" <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_045946_142236_56BBADC2 
X-CRM114-Status: GOOD (  19.92  )
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

On Mon, Jan 9, 2023, at 13:03, Lad, Prabhakar wrote:
> On Sun, Jan 8, 2023 at 12:08 AM Arnd Bergmann <arnd@arndb.de> wrote:
>> >> > +struct riscv_cache_ops {
>> >> > +     void (*clean_range)(unsigned long addr, unsigned long size);
>> >> > +     void (*inv_range)(unsigned long addr, unsigned long size);
>> >> > +     void (*flush_range)(unsigned long addr, unsigned long size);
>> >> > +     void (*riscv_dma_noncoherent_cmo_ops)(void *vaddr, size_t size,
>> >> > +                                           enum dma_data_direction dir,
>> >> > +                                           enum dma_noncoherent_ops ops);
>> >> > +};
>> >>
>> >> I don't quite see how the fourth operation is used here.
>> >> Are there cache controllers that need something beyond
>> >> clean/inv/flush?
>> >>
>> > This is for platforms that dont follow standard cache operations (like
>> > done in patch 5/6) and there drivers decide on the operations
>> > depending on the ops and dir.
>>
>> My feeling is that the set of operations that get called should
>> not depend on the cache controller but at best the CPU. I tried to
>> enumerate how zicbom and ax45 differ here, and how that compares
>> to other architectures:
>>
>>                   zicbom      ax45,mips,arc      arm           arm64
>> fromdevice      clean/flush   inval/inval   inval/inval   clean/inval
>> todevice        clean/-       clean/-       clean/-       clean/-
>> bidi            flush/flush   flush/inval   clean/inval   clean/inval
>>
>> So everyone does the same operation for DMA_TO_DEVICE, but
>> they differ in the DMA_FROM_DEVICE handling, for reasons I
>> don't quite see:
>>
>> Your ax45 code does the same as arc and mips. arm and
>> arm64 skip invalidating the cache before bidi mappings,
>> but arm has a FIXME comment about that. arm64 does a
>> 'clean' instead of 'inval' when mapping a fromdevice
>> page, which seems valid but slower than necessary.
>>
>> Could the zicbom operations be changed to do the same
>> things as the ax45/mips/arc ones, or are there specific
>> details in the zicbom spec that require this?
>>
> I'll let the RISC-V experts respond here.

Adding Christoph Hellwig and Will Deacon to Cc as well.

I had another look at the arm64 side, which (like the zicbom
variant) uses 'clean' on dma_sync_single_for_device(DMA_FROM_DEVICE),
as that has changed not that long ago, see

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c50f11c6196f45c92ca48b16a5071615d4ae0572

I'm still not sure what the correct set of operations has
to be, but nothing in that patch description sounds ISA
or even microarchitecture specific.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
