Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D596C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNTxmTrjA3uYuY8HnUt7NzZ0CQGIPt8A0YttYiwOwKw=; b=pzb/DaBlFV2Xfu
	MaykwE3RufrBSUC+4ZuFkF7vQxgK+XdyUu48m4fx/SQv5y3nYmKQvLfuAmRYTXaF9NMFYEy+VTm3R
	dLtIA0uGJzg1G2tSHRIGueHqwD02pWNSjLbAMIYunwyJGqAOHJQ6W+aWChzNtEkr3TIhN7xi72/sJ
	5+g74Z93vd3QqKd9ctobcAa0+H9Tx1WW5N5jIfqLqCDfRWUdDZEpAcGduE8JMz6tztQmPMRtCbkVM
	F+ohgnHWtENM/W7xEf8T0yDYSEhpB+U4UOHOHEj8uzkCKwh1BkOof9rX0HOGtcwfAEtzobdDzo9GW
	/mK4x3RvxpF6cqLA7dRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JZd-008eeG-2m; Fri, 14 Jan 2022 10:12:45 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JZa-008edY-7X
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 10:12:43 +0000
Received: by mail-ua1-f47.google.com with SMTP id c36so15980716uae.13
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 02:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0iNxqWG6KKW3gmatJQgzSgoTuWKZwlECTtaOguELtw=;
 b=jOZX/9Outp7fuV4c6Y70Ek5IbngRWjWPPYZhaKgUu719n/3g+Xli1wRgGhseXmOcrA
 h7aZSI8B7/3NDFfOl7j4iahJJHy13mO5DTiGws/feaVyLT+cnbFCXJ7x3CYAfCLXAwiE
 t6PGc90FstzCUyruDi1xGuoy1hhnxsa2o5ihDpJtMnOL9BsTQp3xNf696RlNZtb84wO0
 8I/nZzoG1s4oX0bmas0db0rHqlqNJBWSGpMWkgQ3sg2cSbJ7O7ypCni/1/d/kKuaKs/Y
 BrYYuDKWT8PMoIroIaUCTYS+S0cNYca34hrNVGv3Yk5XVuRtWPwvJAX6VP7cUegaEdsp
 9j3w==
X-Gm-Message-State: AOAM530MuX6jxn/V8FcJnng2G71oPL08MUV5WLjFxZ/CFWkxIkYW/Tsg
 bChBvOTbngEFeh4RX8YSIQoNSKd4BaQoGg==
X-Google-Smtp-Source: ABdhPJxvNv3oxsdfWlwyNiPdy8nGteS2oAfW9NrZjqzNc32IqHveMNoz/YPdE9syHVKVW4+LfNin8g==
X-Received: by 2002:a67:df0c:: with SMTP id s12mr3692979vsk.10.1642155160949; 
 Fri, 14 Jan 2022 02:12:40 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id e24sm2451440vsk.11.2022.01.14.02.12.39
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 02:12:40 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id u6so16201124uaq.0
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 02:12:39 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr3532550vso.77.1642155159526;
 Fri, 14 Jan 2022 02:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-3-palmer@rivosinc.com>
 <CAMuHMdXQg942-DwDBJANsFiOCqyAwCt_GwW4HuC1nh0_DNmyEQ@mail.gmail.com>
 <aa05f467-efc2-ca66-3485-aa59ba72a730@ghiti.fr>
In-Reply-To: <aa05f467-efc2-ca66-3485-aa59ba72a730@ghiti.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 11:12:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpi7hJwDrcCyzrooJN=gQjmwShD073UwXp7UxghHeMSA@mail.gmail.com>
Message-ID: <CAMuHMdUpi7hJwDrcCyzrooJN=gQjmwShD073UwXp7UxghHeMSA@mail.gmail.com>
Subject: Re: [PATCH 02/12] RISC-V: MAXPHYSMEM_2GB doesn't depend on
 CMODEL_MEDLOW
To: Alexandre ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 heinrich.schuchardt@canonical.com, Atish Patra <atish.patra@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Jens Axboe <axboe@kernel.dk>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_021242_299898_8F094B6A 
X-CRM114-Status: GOOD (  40.34  )
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

Hi Alex,

On Tue, Jan 11, 2022 at 5:14 PM Alexandre ghiti <alex@ghiti.fr> wrote:
> On 1/11/22 17:04, Geert Uytterhoeven wrote:
> > On Fri, Nov 19, 2021 at 5:47 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> >> From: Palmer Dabbelt <palmer@rivosinc.com>
> >>
> >> For non-relocatable kernels we need to be able to link the kernel at
> >> approximately PAGE_OFFSET, thus requiring medany (as medlow requires the
> >> code to be linked within 2GiB of 0).  The inverse doesn't apply, though:
> >> since medany code can be linked anywhere it's fine to link it close to
> >> 0, so we can support the smaller memory config.
> >>
> >> Fixes: de5f4b8f634b ("RISC-V: Define MAXPHYSMEM_1GB only for RV32")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Thanks for your patch, which is now commit 9f36b96bc70f9707 ("RISC-V:
> > MAXPHYSMEM_2GB doesn't depend on CMODEL_MEDLOW").
> >
> >> I found this when going through the savedefconfig diffs for the K210
> >> defconfigs.  I'm not entirely sure they're doing the right thing here
> >> (they should probably be setting CMODEL_LOW to take advantage of the
> >> better code generation), but I don't have any way to test those
> >> platforms so I don't want to change too much.
> > I can confirm MAXPHYSMEM_2GB works on K210 with CMODEL_MEDANY.
> >
> > As the Icicle has 1760 MiB of RAM, I gave it a try with MAXPHYSMEM_2GB
> > (and CMODEL_MEDANY), too.  Unfortunately it crashes very early
> > (needs earlycon to see):
> >
> >      OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
> >      Machine model: Microchip PolarFire-SoC Icicle Kit
> >      printk: debug: ignoring loglevel setting.
> >      earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
> >      printk: bootconsole [ns16550a0] enabled
> >      printk: debug: skip boot console de-registration.
> >      efi: UEFI not found.
> >      Unable to handle kernel paging request at virtual address ffffffff87e00001
> >      Oops [#1]
> >      Modules linked in:
> >      CPU: 0 PID: 0 Comm: swapper Not tainted 5.16.0-08771-g85515233477d #56
> >      Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> >      epc : fdt_check_header+0x14/0x208
> >       ra : early_init_dt_verify+0x16/0x94
> >      epc : ffffffff802ddacc ra : ffffffff8082415a sp : ffffffff81203ee0
> >       gp : ffffffff812ec3a8 tp : ffffffff8120cd80 t0 : 0000000000000005
> >       t1 : 0000001040000000 t2 : ffffffff80000000 s0 : ffffffff81203f00
> >       s1 : ffffffff87e00000 a0 : ffffffff87e00000 a1 : 000000040ffffce7
> >       a2 : 00000000000000e7 a3 : ffffffff8080394c a4 : 0000000000000000
> >       a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
> >       s2 : ffffffff81203f98 s3 : 8000000a00006800 s4 : fffffffffffffff3
> >       s5 : 0000000000000000 s6 : 0000000000000001 s7 : 0000000000000000
> >       s8 : 0000000020236c20 s9 : 0000000000000000 s10: 0000000000000000
> >       s11: 0000000000000000 t3 : 0000000000000018 t4 : 00ff000000000000
> >       t5 : 0000000000000000 t6 : 0000000000000010
> >      status: 0000000200000100 badaddr: ffffffff87e00001 cause: 000000000000000d
> >      [<ffffffff802ddacc>] fdt_check_header+0x14/0x208
> >      [<ffffffff8082415a>] early_init_dt_verify+0x16/0x94
> >      [<ffffffff80802dee>] setup_arch+0xec/0x4ec
> >      [<ffffffff80800700>] start_kernel+0x88/0x6d6
> >      random: get_random_bytes called from
> > print_oops_end_marker+0x22/0x44 with crng_init=0
> >      ---[ end trace 903df1a0ade0b876 ]---
> >      Kernel panic - not syncing: Attempted to kill the idle task!
> >      ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> >
> > So the FDT is at 0xffffffff87e00000, i.e. at 0x7e00000 from the start
> > of virtual memory (CONFIG_PAGE_OFFSET=0xffffffff80000000), and thus
> > within the 2 GiB range.
>
>
> I think you have just encountered what I suspected and mentioned in [1]:
> we recently moved the kernel to the PAGE_OFFSET address used with
> MAXPHYSMEM_2GB.
>
> I would try to cherry-pick [1] and see if that works better :)
>
> Alex
>
> [1]
> https://patchwork.kernel.org/project/linux-riscv/patch/20211206104657.433304-6-alexandre.ghiti@canonical.com/

Thanks, works fine with just that patch (needed small changes), or with
the full series.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
