Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D61C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:50:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC78F64F72
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC78F64F72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xU56ofUelPH0eexs90qgDmQBuo78xM/GchuswnNysts=; b=GC5MYd/G6mwwcbipJ/JIRoi+r
	g9UNWTr4GKevayB3jSlcIBglQqjInvFftQW5IuhjxaDwR3N+6p2DiJxrlt2J8Ox9n/yHArT4LGdjI
	R6S9ZUZvTRAa0o63RKaSVLq8aJQ+eMMxujXs1Qh5p3GhP3pUPjrLSU9+eE2iN//G/fWpYVVG/SjrH
	C18aa7gKly79+NElCAORdsA2JtzhuBvvIkJmN6mJxPADxHktS2UdlIipohbNArZ4YNGuofd9ay+0j
	XgAAicCiNyy44VUWH1WD0IzeFJ8syPKwMjJhRMJ1llRcZNHgbd0QP62yEzu4FWkzPY8r3G+nhMnF+
	Mr25ypfjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKk3f-00BruD-4V; Fri, 12 Mar 2021 15:50:35 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKk3Z-00Brsv-55; Fri, 12 Mar 2021 15:50:33 +0000
Received: by mail-vk1-f172.google.com with SMTP id o4so1340528vka.12;
 Fri, 12 Mar 2021 07:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCfkIhb98hO8prK8G14q0f8cJZYCOLvGnWWBybf+4M4=;
 b=L2p/5PSrhltvRuBZlC1gcJvFRyvVpHmTteKOWY3QAMjjv6YSBFS9uC5MUoKRq+kJ9o
 hRH4cuHP4nK2YLWyUWKc1uVCoA6Xr4HCj7Chfa+NSZpfSaWu7gMDNRCBhZG6FNI9vjMC
 zqDG56K+AgKZqKmkB1Nb5SpfFaoEcmt0c1lAJsoRGYWzjg5qP3iey8NAkix+f2VAgE2h
 t0yCll+vNpA3OocdfH2fpBm4dxWpA29mfWZOYcKpzH9L1vYliHUSsGRy92ICHhhxScsv
 Mt8aPa87NK3D5GdIljaZ0ABisTZP7DKastqE3bJ6hCxQwBd2fF9987mXGIQxFcDRIYGq
 thgg==
X-Gm-Message-State: AOAM533Bq1b2DzHnKgbW09LCRiO6gdspidT1BPszxQ7lBuL1lwl15g0A
 GtCZnYFnrVivIeIBpL3CiS7dApz+IRg1ER161Qo=
X-Google-Smtp-Source: ABdhPJwsMcqnQfXHsxIHY91a/cjGAOuKpduZxiaHjuntYgfG+B2bSXLd5roumZI4ThaBStcLstXBt5hqmJwMf4W7HfQ=
X-Received: by 2002:a1f:e543:: with SMTP id c64mr4486729vkh.2.1615564227436;
 Fri, 12 Mar 2021 07:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20201119003829.1282810-1-atish.patra@wdc.com>
 <20201119003829.1282810-4-atish.patra@wdc.com>
 <CAMuHMdUjh9znKTLZ+bST6aDUFdZzvmv2SGVy=sRQ6+D=pYM9cg@mail.gmail.com>
In-Reply-To: <CAMuHMdUjh9znKTLZ+bST6aDUFdZzvmv2SGVy=sRQ6+D=pYM9cg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Mar 2021 16:50:16 +0100
Message-ID: <CAMuHMdUfQCSyuHxf+TjuOGDtLMAv30x2LazvO8BQwE1=B1kzVg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] riscv: Separate memory init from paging init
To: Atish Patra <atish.patra@wdc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, 
 Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_155031_271398_700DB36C 
X-CRM114-Status: GOOD (  27.81  )
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

Hi Atish,

On Wed, Mar 10, 2021 at 5:41 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Nov 19, 2020 at 1:40 AM Atish Patra <atish.patra@wdc.com> wrote:
> > Currently, we perform some memory init functions in paging init. But,
> > that will be an issue for NUMA support where DT needs to be flattened
> > before numa initialization and memblock_present can only be called
> > after numa initialization.
> >
> > Move memory initialization related functions to a separate function.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> This is now commit cbd34f4bb37d62d8 in v5.12-rc1, breaking the boot on
> Vexriscv:
>
> [    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
> [    0.000000] printk: bootconsole [sbi0] enabled
> [    0.000000] printk: debug: ignoring loglevel setting.
> [    0.000000] Initial ramdisk at: 0x(ptrval) (8388608 bytes)
> [    0.000000] Unable to handle kernel paging request at virtual
> address c8000008

> Note that I have "[PATCH v2 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32"[1]
> applied, to avoid another crash (7c4fc8e3e982 = v5.11 + [1] +
> cherry-picked commits from the riscv-for-linus-5.12-mw0 pull request).
>
> If I revert the L1_CACHE_BYTES change, the boot continues, but I'm back
> to the old issue fixed by [1]:
>
> [   22.126687] Freeing initrd memory: 8192K
> [   22.321811] workingset: timestamp_bits=30 max_order=15 bucket_order=0
> [   29.001509] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 253)
> [   29.021555] io scheduler mq-deadline registered
> [   29.033692] io scheduler kyber registered
> [   29.141294] Unable to handle kernel paging request at virtual
> address 69726573

> Will have a deeper look later...

I found the core issue, and sent a fix: "[PATCH] RISC-V: Fix
out-of-bounds accesses in init_resources()"
https://lore.kernel.org/linux-riscv/20210312154634.3541844-1-geert@linux-m68k.org/

It works now with either value of L1_CACHE_SHIFT, so patch "[PATCH v2
3/4] RISC-V: Fix L1_CACHE_BYTES for RV32" is no longer needed.

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
