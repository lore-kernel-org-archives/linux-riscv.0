Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26E7C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 05:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CF861164
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 05:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9CF861164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2vVlpCXBS7YXvsByh10xNm0eoW2d2fG9VcY7qa7eXs=; b=N1OSxfNJQ0G0jT
	N7TIvUfj4Eme2b5JXnX6SIbD7jqM686w5LFRx9dw8K8vJSMcZ0zDhDO2L1c6zR1mgj9j72Em8mqyf
	GABWfBXJUol8657wJPGt0Epx90JlMbKoEqvtWuKOYfG0b+G14rv+tksjyG/1P6hJc0jsVlEMwr5of
	v/R9Fglnx7HgZuQKZ9o2Hn4xBfh6ZxyeFmPnqbam7WRsy2NgGoT1Jt1wsYF+Y/dddsc5rG22Ipwql
	kAMrJsLePVfm9TUEB912AOmq2th7vQN+g95Tt88nZqhNFxtqzV5/5gFHr8ZmkKsP46EwWrh97CbVw
	4POx8j0cqXutzqRGvubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5iVm-00BvG6-VU; Tue, 20 Jul 2021 05:41:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5iVV-00BvDz-Id; Tue, 20 Jul 2021 05:41:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F8BA6113A;
 Tue, 20 Jul 2021 05:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626759688;
 bh=2GuyoMxAkXwIEuz4kB/1FJuahjlvs/F+Am1H8l4oZ6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LRXfAAm56gnQU5zTzJQzg6qkcSv7yw0kl4yYFk/21Z9WHHCS/YfSY1upoAtwKv5bT
 V2O7oZHWj0fOK1IGM3v79BAcuYxOjoQhqUOKopcwlgQBrVFYG0G449b4T5r51t4r2s
 npYhouHieUp13RGQWPuxEopMBsodExxP0CTY5MFrJgxjN/YwdfA01vcaOtK+AEq1Yd
 ORUPos0vJHv62sSB0+yra/zR5L77thXGC2iAERObefhp+jMpFNa8tjsBcsiHoIdhtY
 VF31HzwBbHUtc22fybXpvdYc58q6NvDcq/5I5KrSiYstSR+a3kuydNUqoSMsfU84YV
 3qV/JLV27J/DQ==
Date: Tue, 20 Jul 2021 08:41:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 kexec@lists.infradead.org, Linux MM <linux-mm@kvack.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
Message-ID: <YPZh/IawtmwaYccQ@kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org>
 <YPP06QG7hfypZgYg@kernel.org>
 <CAMuHMdXfFhzm48U2Hvjz8yrjPsQbagW4aC_L-QE_Q6yx1Lo=tA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfFhzm48U2Hvjz8yrjPsQbagW4aC_L-QE_Q6yx1Lo=tA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_224129_691869_DC5C24C8 
X-CRM114-Status: GOOD (  36.66  )
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

Hi Geert,

On Mon, Jul 19, 2021 at 08:59:03AM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Sun, Jul 18, 2021 at 11:31 AM Mike Rapoport <rppt@kernel.org> wrote:
> > On Wed, Jul 14, 2021 at 07:51:01AM -0600, Rob Herring wrote:
> > > On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > > > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > > > base address and size, describing a limited region in which memory may
> > > > be considered available for use by the kernel.  If enabled, memory
> > > > outside of this range is not available for use.
> > > >
> > > > These variables can by filled by firmware-specific code, and used in
> > > > calls to memblock_cap_memory_range() by architecture-specific code.
> > > > An example user is the parser of the "linux,usable-memory-range"
> > > > property in the DT "/chosen" node.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > > > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> > > >
> > > > Does there exist a suitable place in the common memblock code to call
> > > > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > > > have to be done in architecture-specific code?
> > >
> > > Can't you just call it from early_init_dt_scan_usablemem? If the
> > > property is present, you want to call it. If the property is not
> > > present, nothing happens.
> 
> I will have a look...
> 
> > For memblock_cap_memory_range() to work properly it should be called after
> > memory is detected and added to memblock with memblock_add[_node]()
> >
> > I'm not huge fan of adding more globals to memblock so if such ordering can
> > be implemented on the DT side it would be great.
> 
> Me neither ;-)
> 
> > I don't see a way to actually enforce this ordering, so maybe we'd want to
> > add warning in memblock_cap_memory_range() if memblock.memory is empty.
> 
> "linux,usable-memory-range" is optional, and typically used only in
> crashdump kernels, so it would be a bad idea to add such a warning.

If I remember correctly, memblock_cap_memory_range() was added to support
"linux,usable-memory-range" for crasdump kernels on arm64 and if it would
be called before memory is registered we may silently corrupt the memory
because the crash kernel will see all the memory as available.

So while WARN() maybe too much a pr_warn() seems to me quite appropriate.
 
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
