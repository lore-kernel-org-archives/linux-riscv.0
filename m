Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380ABC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 08:12:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDF860EB5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 08:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EDF860EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eGFcyxjaPI69BgUFmyerxd7uMv+hSOhwbFOuXFivsw=; b=AK5mF4Udh5M79d
	pXnLZL002R7Nm8uahU8k+wR8c/5aOT06t9RvLcBg2TD2EV8U4mRkdd2pgPkyrFQcTzGRdg5bKWH/4
	f35uZ7V0Tz2MhFYeAlIZUACEZbYZwP6ICVyW3wsXqMtVVgxSLsk+HGOdp9OnqZ3fZli5Ul2kad4sm
	3+45AMrEd3heoZqYO2Kvl1SbhhYzxehIvTlSmM4qIT+8XyYyI3poVmlowiN21BblCafTw03HDDGPl
	A3Ou++w0BSUeHA6ijjxT4QJKNi/Qqw7JYsjVlM1n3n3IUKNcl7DzmDaYcsEsTRdxyZNdyuntZGL2d
	LavGiFA/IPNiqMFHA/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDjLK-0060Et-FG; Wed, 11 Aug 2021 08:12:06 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjL1-006087-NV; Wed, 11 Aug 2021 08:11:49 +0000
Received: by mail-vs1-f41.google.com with SMTP id f6so974230vso.5;
 Wed, 11 Aug 2021 01:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tz0+jEgIobQjuTow/ARUuugSs1kLubTzwy0T9ZLI9hU=;
 b=dbwxQVhwg+bRmjrvhBft1rifFLUEn0eVqg+EKj6OoyxqXvWg/p1vjs+XFVB9oth2vM
 qrtNTD9bKl6RXFTgBtvmq81HhVhMp3CUEHoW+rtdij1d6Aj/ktyGfOMqPS7JpxKv/RKX
 /283SrDndemRp7rCQwy9od+msQPzryZS4RjgPvuV/IDUrgU5FkEhg/XG4JquSClGWHei
 XFX8d42cZ+xjdkmPUwhyrWpLGLG1Z6GAIYBUT7mbxedrEIfTjQfMnIx0drKdc0KNn45d
 /O+/VD37pda+xCv4+6nVmwV/bZeverIU08V/ZQinqHRI3fSHnxCIHoET31+nzcIJ7SZ3
 ztPw==
X-Gm-Message-State: AOAM530vEK/qCITqjkePp3B89yidsyqSutQMxwA4h5Ai4bp6iYlZtDuA
 4hZY0gLel0H+m74DEAhN9QziQhn4DzePwyHIxRU=
X-Google-Smtp-Source: ABdhPJyQYdEzQ87d4q8Gjh5OGWc3XIzYeTLsfNGD+TMt1AWgMT8WjUJws7odP2IIw+RmtCkRDyil2IHyZbu6KAbZAGY=
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr17470575vsk.40.1628669506037; 
 Wed, 11 Aug 2021 01:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org>
In-Reply-To: <20210714135101.GB2441138@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Aug 2021 10:11:34 +0200
Message-ID: <CAMuHMdVRPpHudj2svs_TYP9=GYkWFtJrG_+BHA7A+TVPdQ92aQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, 
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>, 
 Mike Rapoport <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
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
X-CRM114-CacheID: sfid-20210811_011147_811209_DF04A6C8 
X-CRM114-Status: GOOD (  32.70  )
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

On Wed, Jul 14, 2021 at 3:51 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > base address and size, describing a limited region in which memory may
> > be considered available for use by the kernel.  If enabled, memory
> > outside of this range is not available for use.
> >
> > These variables can by filled by firmware-specific code, and used in
> > calls to memblock_cap_memory_range() by architecture-specific code.
> > An example user is the parser of the "linux,usable-memory-range"
> > property in the DT "/chosen" node.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> >
> > Does there exist a suitable place in the common memblock code to call
> > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > have to be done in architecture-specific code?
>
> Can't you just call it from early_init_dt_scan_usablemem? If the
> property is present, you want to call it. If the property is not
> present, nothing happens.

Seems to work fine when called from early_init_dt_scan_nodes().
Hence v5 will no longer need to touch memblock.

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
