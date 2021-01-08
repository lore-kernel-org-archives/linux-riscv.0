Return-Path: <SRS0=xmGS=GL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6A8C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 16:26:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B322238E8
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 16:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B322238E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tZIHwoc/SscDyS/heN3Hegu9B6UbRPLI2MXe9DTC1Mk=; b=DAUpB9iAvNee7YAl6BBQuysqP
	VX74D7xy51nkEtBFF1c9eTBPE+HZEYLozx5JsKSsXiiOPnz3iWvlcfsqLPvuDLFiB2wMG9lcrUtkH
	4cFW5g5wGCRuLrQoAKNbg02eBvdYHdWZ6z2qsHq9Bpg09yVCtZUW1UD2UWJYwKHxwc9MyUdsXcitM
	w8aTi6XrL7/Q24en1OZRd2ua1k6lKI1LshyE8C94dNUktXh+GBr1mXY31H0oSLLLFhgnRPRjUJg3d
	rffysVW21Nm6CRRWMkodzwSI/n416xiVU2SVB9e5V5cIu48YGM32xgPSduRiCpxoM+YwHwBxHxPzY
	RimaIMXog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxuaQ-0006LQ-AV; Fri, 08 Jan 2021 16:26:02 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxuaO-0006J9-6L
 for linux-riscv@lists.infradead.org; Fri, 08 Jan 2021 16:26:01 +0000
Received: by mail-ot1-f50.google.com with SMTP id d8so10153847otq.6
 for <linux-riscv@lists.infradead.org>; Fri, 08 Jan 2021 08:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4P0bI2KySEz7bF1VDbHcM0MRrhKTTvGeuLXsvdhijoA=;
 b=jFGdqnZrhpCIPYg8oYSa0jDrRfqrpgBHIh1y8WXO7Nx6mhDO3254+A9qtk7HxmuOfI
 r9s5CRkDUUqOz6qZU65fBvyIJcD3j2fR/An5B098kRfZFFZK0w2xbrWZr2/vgoyYd6/h
 glMhWrcfjxLgNVquHZ5eKncl5jLqhFmgBY/xEqNrevQLUAELDWWeLrCei0oa/lE0uRJ5
 cj5xVeOtjxMjHa4hGYyTI5D5JOxNL4RxaEm034yPg+dK3WoaJCIQkjgyp38nBpblsF+Q
 PNxO+4yU9SLnnp1bc7N44Cghi2Og5IAj3sj7mRmRJuNvOb5Fx5k8aTE1868Q05PovXc9
 tK2A==
X-Gm-Message-State: AOAM531xUXqoTcXTVmk/tZfipc8XC2M84yTHhEYqKyZI2TxQZ/xcgnJ6
 IjzhzzQhN1DzfetNeeGySyZveVKdCFPlOgHC048=
X-Google-Smtp-Source: ABdhPJy3k6nmCGv0rEESlquxP7okt0veCEhpEnm7rMrWlbYyLr9vLqjY+vBqL0DWfMxahjb4O55awdynuAirNoyHknM=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr3135433oth.250.1610123156661; 
 Fri, 08 Jan 2021 08:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-1-atish.patra@wdc.com>
 <20210107092652.3438696-2-atish.patra@wdc.com>
In-Reply-To: <20210107092652.3438696-2-atish.patra@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jan 2021 17:25:45 +0100
Message-ID: <CAMuHMdWf6K-5y02+WJ6Khu1cD6P0n5x1wYQikrECkuNtAA1pgg@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: Do not allocate memblock while iterating
 reserved memblocks
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_112600_252631_69CCB87E 
X-CRM114-Status: GOOD (  16.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On Thu, Jan 7, 2021 at 10:28 AM Atish Patra <atish.patra@wdc.com> wrote:
> Currently, resource tree allocates memory blocks while iterating on the
> list. It leads to following kernel warning because memblock allocation
> also invokes memory block reservation API.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:795
> __insert_resource+0x8e/0xd0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
> 5.10.0-00022-ge20097fb37e2-dirty #549
> [    0.000000] epc: c00125c2 ra : c001262c sp : c1c01f50
> [    0.000000]  gp : c1d456e0 tp : c1c0a980 t0 : ffffcf20
> [    0.000000]  t1 : 00000000 t2 : 00000000 s0 : c1c01f60
> [    0.000000]  s1 : ffffcf00 a0 : ffffff00 a1 : c1c0c0c4
> [    0.000000]  a2 : 80c12b15 a3 : 80402000 a4 : 80402000
> [    0.000000]  a5 : c1c0c0c4 a6 : 80c12b15 a7 : f5faf600
> [    0.000000]  s2 : c1c0c0c4 s3 : c1c0e000 s4 : c1009a80
> [    0.000000]  s5 : c1c0c000 s6 : c1d48000 s7 : c1613b4c
> [    0.000000]  s8 : 00000fff s9 : 80000200 s10: c1613b40
> [    0.000000]  s11: 00000000 t3 : c1d4a000 t4 : ffffffff
>
> This is also unnecessary as we can pre-compute the total memblocks required
> for each memory region and allocate it before the loop. It save precious
> boot time not going through memblock allocation code every time.
>
> Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Thanks for your patch!

I never saw the warning (on linux-on-litex-vexriscv), but instead I got:

    Failed to add a Kernel code resource at 40001000

after Initmem setup. Adding some debug info to init_resources() showed
that the memblock.reserved list kept on increasing, until memory
corruption happened (pointers started to look like ASCII strings), the
error message above is printed, and after which the boot continued.
Changing L1_CACHE_SHIFT in arch/riscv/include/asm/cache.h to 5 fixed that.

With this patch, the error message above is no longer printed, so
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Noted that the kernel still crashes later, with

    Unable to handle kernel paging request at virtual address 61636473

Again, 0x61636473 looks like ASCII, and your PATCH 3/4 for
L1_CACHE_SHIFT fixes that, too.

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
