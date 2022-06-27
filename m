Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05495C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 06:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pi4sDBlynZvdFwYp7u7SXB0q5m49CS1rg9hHj2QJOk=; b=lH0LaVhF3XDJes
	mmI4ENvnbnSEsVYarZKAvf0nwJhSkRYGqbwyi/3DOdiFHKCJm6VN0GMsCOqA6Roc5NzuGYFhwhGZC
	zYiomCcFqBSri1+NWRnNO/Vu5uy7LST566f6SGzzq3JKWSyvohh4pmdK3TS1LAy8nSAHmqlwoen32
	uv2kDRCZnd+bzOsnbHTkuq2ihmEUniybbQ2XvU9lcarjPTO9wD97BwW3k+11e/XD8Lv5ljfhAf+aC
	xUZtQjUt06Yt1rL1N8J1jrnayBxEQyMeNoX4AMoBUD3kAhATSRrJC7Dzupau8rfs6tT72Kgy/t1w4
	CSCzAkKtIZQiEdgQWZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iXJ-00GArF-DK; Mon, 27 Jun 2022 06:47:53 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iXD-00GAmB-Ce
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 06:47:49 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-317a66d62dfso75763927b3.7
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jun 2022 23:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RpPnU8MehDqKJsWHhgDuy79jEz+vPYFTumDLAwjvYYg=;
        b=RUqSR0AqJhPJccEkPVRsXBIORnaIWurSVpDAsnsLojT+BrSq0i7i6VSA1pzQU6nDpC
         V+/vbPBlZcDdIu+glOlIQ++1GKFFKf2lflSnelKokqQPSzOtT2UU/1eTkKF0hovJ50lp
         HYv/S3eXnanC4YfB53eUXnMjTOR8I1GXbb38g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RpPnU8MehDqKJsWHhgDuy79jEz+vPYFTumDLAwjvYYg=;
        b=H7YQcrsn2ZzIgnwkQ5UJz5G4BFuQqw0/7+tkHnhV5Tjmtm4Fg3J+Of8eg5Na1bvvEY
         UzFQO7m5O6aCS8C6xhmpblCC/3MO0PX11ofb7xIcVOM6z47K2YFIMHtA9zwXKeHODmEj
         eo1y1HlgtnMxpdPFbf9VjEC/qZJcCBbOc1gOkTF4zqzsoplquY+sQz3LbPNQmiRb0uBT
         Q/Wc3DDZUR0mpbQZAkxiiR9BsFmqYtnSWSjkuk73FQPmOYIGaGGS8VHG6Q7dDZxtLYbh
         ybldTcF5kW6ipf7OxLrr+6r2YMx8wuQtSM2T1csF6dj3/EQ1ixzesCI5+Xn41eEw9v8T
         MsTQ==
X-Gm-Message-State: AJIora92Gzzq0P2wOZpbslDrP1qtIV2S0JDGnMP5ljSzQ4g/MFDrMdef
	aYBzB+a0niHETWDi90GaDp83lPP4jGyChnQVHnFs
X-Google-Smtp-Source: AGRyM1t5v9aY9PoJBRWj5wgnpnt/ae8HBGaoYD5GxB91TGwS4Xv3J1jWoSlEf92zESgNMmpi7up5ktRa4dhWz8LGWRA=
X-Received: by 2002:a81:6ad7:0:b0:31b:a0f1:c093 with SMTP id
 f206-20020a816ad7000000b0031ba0f1c093mr6336295ywc.400.1656312465509; Sun, 26
 Jun 2022 23:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220521143456.2759-1-jszhang@kernel.org> <20220521143456.2759-2-jszhang@kernel.org>
 <CAAhSdy2yT26QournxS4Zf6L8oMj5Bs6BEjuW56NHapq=cXOEww@mail.gmail.com>
In-Reply-To: <CAAhSdy2yT26QournxS4Zf6L8oMj5Bs6BEjuW56NHapq=cXOEww@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 26 Jun 2022 23:47:34 -0700
Message-ID: <CAOnJCU+2QXdCkf7g_cnQ+yMoFABc7bfKZ8=5sOJk2uQhS8+Uww@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] riscv: move sbi_init() earlier before jump_label_init()
To: Anup Patel <anup@brainfault.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_234747_705996_BA49321E 
X-CRM114-Status: GOOD (  25.80  )
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

On Sat, Jun 25, 2022 at 9:33 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, May 21, 2022 at 8:13 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > We call jump_label_init() in setup_arch() is to use static key
> > mechanism earlier, but riscv jump label relies on the sbi functions,
> > If we enable static key before sbi_init(), the code path looks like:
> >   static_branch_enable()
> >     ..
> >       arch_jump_label_transform()
> >         patch_text_nosync()
> >           flush_icache_range()
> >             flush_icache_all()
> >               sbi_remote_fence_i() for CONFIG_RISCV_SBI case
> >                 __sbi_rfence()
> >
> > Since sbi isn't initialized, so NULL deference! Here is a typical
> > panic log:
> >
> > [    0.000000] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> > [    0.000000] Oops [#1]
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc7+ #79
> > [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> > [    0.000000] epc : 0x0
> > [    0.000000]  ra : sbi_remote_fence_i+0x1e/0x26
> > [    0.000000] epc : 0000000000000000 ra : ffffffff80005826 sp : ffffffff80c03d50
> > [    0.000000]  gp : ffffffff80ca6178 tp : ffffffff80c0ad80 t0 : 6200000000000000
> > [    0.000000]  t1 : 0000000000000000 t2 : 62203a6b746e6972 s0 : ffffffff80c03d60
> > [    0.000000]  s1 : ffffffff80001af6 a0 : 0000000000000000 a1 : 0000000000000000
> > [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> > [    0.000000]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000080200
> > [    0.000000]  s2 : ffffffff808b3e48 s3 : ffffffff808bf698 s4 : ffffffff80cb2818
> > [    0.000000]  s5 : 0000000000000001 s6 : ffffffff80c9c345 s7 : ffffffff80895aa0
> > [    0.000000]  s8 : 0000000000000001 s9 : 000000000000007f s10: 0000000000000000
> > [    0.000000]  s11: 0000000000000000 t3 : ffffffff80824d08 t4 : 0000000000000022
> > [    0.000000]  t5 : 000000000000003d t6 : 0000000000000000
> > [    0.000000] status: 0000000000000100 badaddr: 0000000000000000 cause: 000000000000000c
> > [    0.000000] ---[ end trace 0000000000000000 ]---
> > [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> > [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> >
> > Fix this issue by moving sbi_init() earlier before jump_label_init()
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>
> We are seeing a similar crash when booting kernel via EDK2 with RNG enabled.
>
> Shell> fs0:\Image root=/dev/vda2 rootwait console=ttyS0
> earlycon=uart8250,mmio,0x10000000 initrd=\initramfs.cp
> EFI stub: Booting Linux Kernel...
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services...
> [    0.000000] Linux version 5.19.0-rc3 (oe-user@oe-host)
> (riscv64-unknown-linux-gnu-gcc (Ventana-2022.05.16) 12.1.0, GNU ld
> (Ventana-2022.05.16) 2.37.90.20220201) #1 SMP Thu Jun 23 05:33:13 UTC
> 2022
> [    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x81200000
> [    0.000000] earlycon: uart8250 at MMIO 0x0000000010000000 (options '')
> [    0.000000] printk: bootconsole [uart8250] enabled
> [    0.000000] efi: EFI v2.70 by EDK II
> [    0.000000] efi: RNG=0xff94fd98 MEMRESERVE=0xfe658f18
> [    0.000000] efi: seeding entropy pool
> [    0.000000] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    0.000000] Oops [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc3 #1
> [    0.000000] epc : 0x0
> [    0.000000]  ra : sbi_remote_fence_i+0x1e/0x26
> [    0.000000] epc : 0000000000000000 ra : ffffffff800080f8 sp :
> ffffffff81203cd0
> [    0.000000]  gp : ffffffff812f1d40 tp : ffffffff8120da80 t0 :
> 0000000000cb8266
> [    0.000000]  t1 : 000000006d5e5146 t2 : 0000000058000000 s0 :
> ffffffff81203ce0
> [    0.000000]  s1 : ffffffff8047586a a0 : 0000000000000000 a1 :
> 0000000000000000
> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 :
> 0000000000000000
> [    0.000000]  a5 : 0000000000000000 a6 : 0000000000000000 a7 :
> 0000000000000000
> [    0.000000]  s2 : ffffffff80dea320 s3 : ffffffff80deabb0 s4 :
> ffffffff81353d48
> [    0.000000]  s5 : 0000000000000001 s6 : 00000000fffde848 s7 :
> 0000000000000004
> [    0.000000]  s8 : 0000000081021714 s9 : 000000008101e6f0 s10:
> 00000000fffde780
> [    0.000000]  s11: 0000000000000004 t3 : 000000001467a415 t4 :
> 0000000000000000
> [    0.000000]  t5 : 00000000007627e0 t6 : ffffffffbc865574
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000
> cause: 000000000000000c
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill
> the idle task! ]---
>
> This patch fixes the above crash as well.
>

Thanks for the confirmation.

> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Thanks,
> Anup
>
> > ---
> >  arch/riscv/kernel/setup.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 834eb652a7b9..d150cedeb7e0 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -268,6 +268,7 @@ void __init setup_arch(char **cmdline_p)
> >         *cmdline_p = boot_command_line;
> >
> >         early_ioremap_setup();
> > +       sbi_init();
> >         jump_label_init();
> >         parse_early_param();
> >
> > @@ -284,7 +285,6 @@ void __init setup_arch(char **cmdline_p)
> >         misc_mem_init();
> >
> >         init_resources();
> > -       sbi_init();
> >
> >  #ifdef CONFIG_KASAN
> >         kasan_init();
> > --
> > 2.34.1
> >
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
