Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726E9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYe3QsyU6nw/koR3Pru6SqYOEIvlZgpO3fpqLb69SjU=; b=2n1Lk9rmuEMkuK
	NYuHwNSlrEvfYVdLwHn9CJg7p4/QRrUC+nmF9Uu2q04wAJ5eXStLSKTLdWVhdoyui5CslT0gbSRFB
	NckeTGyrRnv5hYmsmO0P3MkTAJl+6UYdzzOIqv2Gzl5h4x0gcgWTrx3lmUol+BOTaDhjd6nmPtnno
	IJ4ztxx9aSgUgmkTo6vYKb715/P6JyqqNMti/eiAnzFqdFSy/wluF8yyTFkpEjqvGk/2sem0UQ9VS
	5vs7xuLLCavzNJQOIOsZlcROfpbWjPUpSzvU+a3N+CCiAlIZn3lDsPoBVH3oYLb5aS0LzLyILyphs
	aavm7LOZ9SrmHVr2dCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7JdH-00GqfY-3Q; Tue, 11 Jan 2022 16:04:23 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7JdE-00GqeO-45
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 16:04:21 +0000
Received: by mail-vk1-f169.google.com with SMTP id g5so6854937vkg.0
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 08:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RIfSf8RUH0htO7ClMjULi1Y2Og1NiFoaaMK0wKyXP44=;
 b=MaepOShzo0uMyN76PNYmVtdzTt3S+4iBBQ4fGjU7D1aXGkF/ag+vhyuuBfwlx/7Y8t
 399t6LOxyL5Z+KeBH94WYd9TxThL8z5adSSLV6Zn6AKUFwgKWMRofYb5quV4KbO8RQjK
 LC75KRXmPq/0WLuUQitrZYrvMdiTfIAYxNyG72OOwv+DMSHMo37INZWl4AXDqQI6ERd7
 V/VlhO/6RVLg9Q2/B8qI9S5NYWMzJoIX2hkMmmdi6NhRbZCAE20GTbxszh/iQxuXUCtT
 jELbWfR04qI5ul8PVMdYZ/KUaRxArp3mqba1qgpSgmMpnuQBTX00PaGHa5/E0qEkzsjI
 vKiA==
X-Gm-Message-State: AOAM533hLmIaO2U5JFaygcoQoFfjwPMxB1BfCFPAlN8f1RF6OwxTUDdR
 6MJoSzV/nq8H130Wx4KbJ7UEcMnW1CDqWg==
X-Google-Smtp-Source: ABdhPJwx+cbrVP1yzEoR/8t5VjkzDmbIJc7ylJtj0KpwxIjkdIQ6fZZbLkqikJ0iNdjpGUimkw4pTw==
X-Received: by 2002:a1f:fcc9:: with SMTP id a192mr587052vki.1.1641917057822;
 Tue, 11 Jan 2022 08:04:17 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id p187sm584811vke.34.2022.01.11.08.04.16
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 08:04:17 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id i5so30582035uaq.10
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 08:04:16 -0800 (PST)
X-Received: by 2002:ab0:2118:: with SMTP id d24mr2301575ual.78.1641917056493; 
 Tue, 11 Jan 2022 08:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-3-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-3-palmer@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jan 2022 17:04:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQg942-DwDBJANsFiOCqyAwCt_GwW4HuC1nh0_DNmyEQ@mail.gmail.com>
Message-ID: <CAMuHMdXQg942-DwDBJANsFiOCqyAwCt_GwW4HuC1nh0_DNmyEQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] RISC-V: MAXPHYSMEM_2GB doesn't depend on
 CMODEL_MEDLOW
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 heinrich.schuchardt@canonical.com, Atish Patra <atish.patra@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Jens Axboe <axboe@kernel.dk>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_080420_195014_A65D5E26 
X-CRM114-Status: GOOD (  30.23  )
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

Hi Palmer,

On Fri, Nov 19, 2021 at 5:47 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> For non-relocatable kernels we need to be able to link the kernel at
> approximately PAGE_OFFSET, thus requiring medany (as medlow requires the
> code to be linked within 2GiB of 0).  The inverse doesn't apply, though:
> since medany code can be linked anywhere it's fine to link it close to
> 0, so we can support the smaller memory config.
>
> Fixes: de5f4b8f634b ("RISC-V: Define MAXPHYSMEM_1GB only for RV32")
> Cc: stable@vger.kernel.org
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks for your patch, which is now commit 9f36b96bc70f9707 ("RISC-V:
MAXPHYSMEM_2GB doesn't depend on CMODEL_MEDLOW").

> I found this when going through the savedefconfig diffs for the K210
> defconfigs.  I'm not entirely sure they're doing the right thing here
> (they should probably be setting CMODEL_LOW to take advantage of the
> better code generation), but I don't have any way to test those
> platforms so I don't want to change too much.

I can confirm MAXPHYSMEM_2GB works on K210 with CMODEL_MEDANY.

As the Icicle has 1760 MiB of RAM, I gave it a try with MAXPHYSMEM_2GB
(and CMODEL_MEDANY), too.  Unfortunately it crashes very early
(needs earlycon to see):

    OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
    Machine model: Microchip PolarFire-SoC Icicle Kit
    printk: debug: ignoring loglevel setting.
    earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
    printk: bootconsole [ns16550a0] enabled
    printk: debug: skip boot console de-registration.
    efi: UEFI not found.
    Unable to handle kernel paging request at virtual address ffffffff87e00001
    Oops [#1]
    Modules linked in:
    CPU: 0 PID: 0 Comm: swapper Not tainted 5.16.0-08771-g85515233477d #56
    Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
    epc : fdt_check_header+0x14/0x208
     ra : early_init_dt_verify+0x16/0x94
    epc : ffffffff802ddacc ra : ffffffff8082415a sp : ffffffff81203ee0
     gp : ffffffff812ec3a8 tp : ffffffff8120cd80 t0 : 0000000000000005
     t1 : 0000001040000000 t2 : ffffffff80000000 s0 : ffffffff81203f00
     s1 : ffffffff87e00000 a0 : ffffffff87e00000 a1 : 000000040ffffce7
     a2 : 00000000000000e7 a3 : ffffffff8080394c a4 : 0000000000000000
     a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
     s2 : ffffffff81203f98 s3 : 8000000a00006800 s4 : fffffffffffffff3
     s5 : 0000000000000000 s6 : 0000000000000001 s7 : 0000000000000000
     s8 : 0000000020236c20 s9 : 0000000000000000 s10: 0000000000000000
     s11: 0000000000000000 t3 : 0000000000000018 t4 : 00ff000000000000
     t5 : 0000000000000000 t6 : 0000000000000010
    status: 0000000200000100 badaddr: ffffffff87e00001 cause: 000000000000000d
    [<ffffffff802ddacc>] fdt_check_header+0x14/0x208
    [<ffffffff8082415a>] early_init_dt_verify+0x16/0x94
    [<ffffffff80802dee>] setup_arch+0xec/0x4ec
    [<ffffffff80800700>] start_kernel+0x88/0x6d6
    random: get_random_bytes called from
print_oops_end_marker+0x22/0x44 with crng_init=0
    ---[ end trace 903df1a0ade0b876 ]---
    Kernel panic - not syncing: Attempted to kill the idle task!
    ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

So the FDT is at 0xffffffff87e00000, i.e. at 0x7e00000 from the start
of virtual memory (CONFIG_PAGE_OFFSET=0xffffffff80000000), and thus
within the 2 GiB range.

> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -280,7 +280,7 @@ choice
>                 depends on 32BIT
>                 bool "1GiB"
>         config MAXPHYSMEM_2GB
> -               depends on 64BIT && CMODEL_MEDLOW
> +               depends on 64BIT
>                 bool "2GiB"
>         config MAXPHYSMEM_128GB
>                 depends on 64BIT && CMODEL_MEDANY

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
