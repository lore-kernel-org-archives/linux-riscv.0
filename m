Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364B8C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 07:24:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC4896113A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 07:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC4896113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrEf28eX9SkXK5/til9r6nLGEtIXffTlUzw+3xotuA4=; b=efFGfdqHa5jAtO
	pBqtuBRIcLO3nCt8SCw2TqnXIZJNZ+WELgPguGn8ybSQphG+XSJdjPpKKHYSaWV9yRcNxb0Qc819z
	T1qSJmcNtFLDDafG3nNdwdPXkRfwYtp9+AYWTOxD16LXkALjDnDLekQImonmZemtpk0ArSr42RiCY
	CyT8hzkf3j2/aCjf2JgCpYts8cAAMn0y/F9Jcwdkb9JkCL/yfdtI9FAiGlMvtGzNgR+wcKnysHnmP
	LhnpFTzEmNWF69Y02arJdGvuIfru1Es+id0yt/9HMytagla21zzOCMvNQTAZeVKUlmsuNQr8434Kx
	NJYoF408iZxB8g+PqUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5k6q-00C5Yz-KW; Tue, 20 Jul 2021 07:24:08 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5k6c-00C5XM-Uu; Tue, 20 Jul 2021 07:23:56 +0000
Received: by mail-vk1-f180.google.com with SMTP id m23so1973862vko.4;
 Tue, 20 Jul 2021 00:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oHPiE5WIZuBAQynBajx7q1K/yloXb10bOcX9t96Cp50=;
 b=WntFfebSlVKLgqqZ7M7KdJPo9JwrAY3jkPp8BTsu5qu4y/3Oe1UuWoE4kGaJ0ZOuLM
 +Pnacn2e4A3ri3xHXFmZud7uh6kCIVe6YFvgkXlmFy9gd01g2ZdmtlpF2EtEZz8xjgYm
 u0/8FgVmve4zvsNrtE16+mwuPyYRu21uSur52n4C5VCvZ9JzHl44aBlhN8tMM6yDNdd7
 KHbVxk2JG1en+RHurrbnh3I70DFgmVbCsfFiDOjMzs+ByH3DEw5DIyI6VKEpgXRbzDIt
 IIR3ac6QKQldCpZYQGvRueZ6Kza+IoLME9TaoKCR06IwC4GT2BaEIfaOuVPrHfVQPGdD
 wQEg==
X-Gm-Message-State: AOAM530CcCsVA/H3lxk6mUcLzTejSYIPJHnf2o8OiDwt7WZLVxNwgm6m
 wrZBcfA2kPlBTn/P/A1rgeIsxgrgU3V8kjjwS9s=
X-Google-Smtp-Source: ABdhPJxf33tE/UC6sAZ53pbsOTH+XynQf1vrWzPcAah8VYz4w/NMs8y9Z6qAKLx4GP83D3FxP9bWIDXUegsSRZB+qCI=
X-Received: by 2002:a1f:2746:: with SMTP id n67mr24782587vkn.5.1626765832884; 
 Tue, 20 Jul 2021 00:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org> <YPP06QG7hfypZgYg@kernel.org>
 <CAMuHMdXfFhzm48U2Hvjz8yrjPsQbagW4aC_L-QE_Q6yx1Lo=tA@mail.gmail.com>
 <YPZh/IawtmwaYccQ@kernel.org>
In-Reply-To: <YPZh/IawtmwaYccQ@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 09:23:41 +0200
Message-ID: <CAMuHMdXO2nYY252s-tOWANF4x2ch+adDx=GO5gwV6Jfw28drgA@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
To: Mike Rapoport <rppt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand <frowand.list@gmail.com>, 
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, kexec@lists.infradead.org, 
 Linux MM <linux-mm@kvack.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_002355_040737_89798FF8 
X-CRM114-Status: GOOD (  47.09  )
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

Hi Mike,

On Tue, Jul 20, 2021 at 7:41 AM Mike Rapoport <rppt@kernel.org> wrote:
> On Mon, Jul 19, 2021 at 08:59:03AM +0200, Geert Uytterhoeven wrote:
> > On Sun, Jul 18, 2021 at 11:31 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > On Wed, Jul 14, 2021 at 07:51:01AM -0600, Rob Herring wrote:
> > > > On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > > > > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > > > > base address and size, describing a limited region in which memory may
> > > > > be considered available for use by the kernel.  If enabled, memory
> > > > > outside of this range is not available for use.
> > > > >
> > > > > These variables can by filled by firmware-specific code, and used in
> > > > > calls to memblock_cap_memory_range() by architecture-specific code.
> > > > > An example user is the parser of the "linux,usable-memory-range"
> > > > > property in the DT "/chosen" node.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > > > > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> > > > >
> > > > > Does there exist a suitable place in the common memblock code to call
> > > > > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > > > > have to be done in architecture-specific code?
> > > >
> > > > Can't you just call it from early_init_dt_scan_usablemem? If the
> > > > property is present, you want to call it. If the property is not
> > > > present, nothing happens.
> >
> > I will have a look...
> >
> > > For memblock_cap_memory_range() to work properly it should be called after
> > > memory is detected and added to memblock with memblock_add[_node]()
> > >
> > > I'm not huge fan of adding more globals to memblock so if such ordering can
> > > be implemented on the DT side it would be great.
> >
> > Me neither ;-)
> >
> > > I don't see a way to actually enforce this ordering, so maybe we'd want to
> > > add warning in memblock_cap_memory_range() if memblock.memory is empty.

Sorry, I misread "if memblock.memory is empty" as "if capmem is empty".

> > "linux,usable-memory-range" is optional, and typically used only in
> > crashdump kernels, so it would be a bad idea to add such a warning.
>
> If I remember correctly, memblock_cap_memory_range() was added to support
> "linux,usable-memory-range" for crasdump kernels on arm64 and if it would
> be called before memory is registered we may silently corrupt the memory
> because the crash kernel will see all the memory as available.
>"
> So while WARN() maybe too much a pr_warn() seems to me quite appropriate.

Yes, makes perfect sense now.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
