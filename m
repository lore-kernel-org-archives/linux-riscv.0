Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39198C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 07:20:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816136138B
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 07:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 816136138B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EW7baa6YuIuRDedx083BQxOxXVxyzr7iohmd+5Gc1XA=; b=PH+A9SrNhXxlMuuOHsC0vwgiE
	x8fIbkxdeNjl/rbsy2ovVcZlgHFKX++4eDMTzo0JJhuxDLe6X3VrVjCWh67i1OmQmxKO/mRVt/5Qr
	vbvJjouBClyfXNn46dKgB0oO0NwNPCp9FvG4eDuFTPOvdi6OyKkbjExyjwWCx3GCX4wpP/ud3sYhu
	WJnnJJusIUg/1/ca+CdcpXLDz5B8aFkteEGYbVg0NzqT95SYBJRvgZd4Bh3hUegwdIvcuNgQ0MUDu
	JdR3tifSGmxvhVuaplx6CFtZHB9WuZbdL9qSPAP0dyA9kzkk1bOAPgoKhUwphg7C64a13uMKlCU5p
	bY7iwKg8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTg0X-001kjQ-7q; Tue, 06 Apr 2021 07:20:17 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTg0M-001kgu-L4
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 07:20:10 +0000
Received: by mail-vs1-f42.google.com with SMTP id 2so6329335vsh.4
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 00:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WfE4/UxR9aMUAyVI/W893Z6O1V5sOJWf9p5n5uxKnHc=;
 b=KFZqcsjwmglHG0uIY0uB0YOQNJWdzbO2ir5tgNY529kbqgsSZ+r7+XCIlK5KIU3DqG
 73UW2HkKgnkJt5gpBbRdFNndVDCtMuRWLKyWJXZUUkN9gCU43ItwejyJGddeVV9ZKt9A
 LvYOFdaGS8Eiwtm/l6x5jYdGQpB7BU68tTqnl3ogusNEazm3ahvMrBxrrrERovtWHrPa
 4DDXKGcJ4o6u5ihnuZwK228r2BWV+3KbvJ4EL3uvyBVZt2zKUXOSh2EvVlXMLxme7dHS
 eR7+/ZYKoDf981iU/hDg05ayS4tMJm9pRFXp0cOob18aUQUtZtbRCOsPkOChH+ZBN4ZO
 lt8A==
X-Gm-Message-State: AOAM531MkZ0MCWIiiihNUNtsDmpSQ3murkSmNvNUquEY23FUl14Mpb5m
 PXg9gplqiEyivInABFsFOvvkt/N30kxMsjWsGzxeQqTF4D0=
X-Google-Smtp-Source: ABdhPJz5iGk9TYXXhbRbt8SfpyWATxxhwF3T6eZB/PEOC74t/cVwJX7WeRFS1pweG5WpuYrw9WstMrMcrIB5u0W04bg=
X-Received: by 2002:a67:f5ca:: with SMTP id t10mr9234571vso.40.1617693604829; 
 Tue, 06 Apr 2021 00:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210405085712.1953848-4-mick@ics.forth.gr>
In-Reply-To: <20210405085712.1953848-4-mick@ics.forth.gr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Apr 2021 09:19:52 +0200
Message-ID: <CAMuHMdWi+wo0+PCR6B1wyXVesG-kL9NQt8XFBuWhZ3SdVUaLZg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Improve init_resources
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_082006_953093_49AF5735 
X-CRM114-Status: GOOD (  25.99  )
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

Hi Nick,

Thanks for your patch!

On Mon, Apr 5, 2021 at 10:57 AM Nick Kossifidis <mick@ics.forth.gr> wrote:
> * Kernel region is always present and we know where it is, no
> need to look for it inside the loop, just ignore it like the
> rest of the reserved regions within system's memory.
>
> * Don't call memblock_free inside the loop, if called it'll split
> the region of pre-allocated resources in two parts, messing things
> up, just re-use the previous pre-allocated resource and free any
> unused resources after both loops finish.
>
> * memblock_alloc may add a region when called, so increase the
> number of pre-allocated regions by one to be on the safe side
> (reported and patched by Geert Uytterhoeven)
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Where does this SoB come from?

> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>

> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c

> @@ -129,53 +139,42 @@ static void __init init_resources(void)
>         struct resource *res = NULL;
>         struct resource *mem_res = NULL;
>         size_t mem_res_sz = 0;
> -       int ret = 0, i = 0;
> -
> -       code_res.start = __pa_symbol(_text);
> -       code_res.end = __pa_symbol(_etext) - 1;
> -       code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> -
> -       rodata_res.start = __pa_symbol(__start_rodata);
> -       rodata_res.end = __pa_symbol(__end_rodata) - 1;
> -       rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> -
> -       data_res.start = __pa_symbol(_data);
> -       data_res.end = __pa_symbol(_edata) - 1;
> -       data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +       int num_resources = 0, res_idx = 0;
> +       int ret = 0;
>
> -       bss_res.start = __pa_symbol(__bss_start);
> -       bss_res.end = __pa_symbol(__bss_stop) - 1;
> -       bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +       /* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
> +       num_resources = memblock.memory.cnt + memblock.reserved.cnt + 1;
> +       res_idx = num_resources - 1;
>
> -       mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt) * sizeof(*mem_res);

Oh, you incorporated my commit ce989f1472ae350e ("RISC-V: Fix out-of-bounds
accesses in init_resources()") (from v5.12-rc4) into your patch.
Why? This means your patch does not apply against upstream.

> +       mem_res_sz = num_resources * sizeof(*mem_res);
>         mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
>         if (!mem_res)
>                 panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);

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
