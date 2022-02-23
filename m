Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4E6C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEkapd6uXo59Fml7Vv1gREe2btsf8rkWL/fso+dJc10=; b=Ibfcr4YXk8hunu
	d6+mX4js6F19G/+Of7VBUxR8nmXG+VUmCKcA8dD9MPMH4X0f8jkKnUtZiOGcDAVZ6CzdHzdMbQkzk
	BGR8VLjVzw7vkXgMxJ5qUnfd9/qGKK7rO98DyNhuzkd9UF8wvrbqt4RtT6H3TYcmT1hAogpX0Gfkk
	aq2gW+iK+izO4ALnRYmpfVHbuOZ0cLRpkw7b3V1t6mocgGvNOPM/DKlQhwBEbGwBHtr2Cg6tLzUdq
	G9RiEWI7Mht6Td/sB/6J5SXUxmemV4KP23V50iFhCEVPWYZCD3BnoI+BsU128LekPNXrXC6MvHQyE
	b3j2zHGNngvWJQk6uTKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrTL-00EPCS-Vu; Wed, 23 Feb 2022 13:14:24 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrQI-00ENiX-TT
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 13:11:21 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C58FD3F1F3
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645621865;
 bh=UXKLKyZvqZuicoDX6WsicwD+NuWstrOluCAJwIKeGTs=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=tMaQvSmSeXv4FtciBqxBRv6hYe0jKOzX+/RfPsvfkmXDWxUOOBBXdUfe3/03saP1z
 v5alKkvvVSxmVftqMhrUIyT8ZD3c1HZyzMuoH3PDTUO3RCVcaunZYV+duVKShz5GhC
 sDFtHux1d746CX7tCS+5bT75p9k06pJFxlmPVrO4wYqp/CHrXAGmY8MHElq3+0KFFE
 k/jMk027cJHyhP4QoIPeJPo8083tcjYpaXyyt4YuKQbNMfpvsz2baXYqX5pd8UTO7Q
 z8hPr0T1RkeVSU79rX0OlB0yF7c6JcgjplqJEzNGbj8BFet27YR83ydYwLzEAF8nXf
 X9f2oMYS0t4Tw==
Received: by mail-ed1-f71.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso13554673edz.14
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 05:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXKLKyZvqZuicoDX6WsicwD+NuWstrOluCAJwIKeGTs=;
 b=yA4rLeQ/sr+GMIgVG4M+O4nJRA/mnrzXciZ6q/z1QMGBJfkcPmGEw+ahECedyQwI91
 18iXv6FIcjI6RjNa4DvW+p0w0MyqXMKlwPGUpHcfNPm1TgHqQBBgjd1FLm51WL/jSGD2
 36sTAFmIG8e/8BPx8jVNnuDMjB9j3OpyvKh6SkExFbwad1p0rdhMzGsxf2JW/KIYUgMp
 goMvRf6TkOARXsXgqbkRzvMhS4onbZEalA+zkFEXbn8g1Rm8avLgdDAPWH0yVg8T5Jyt
 ZqTcHdcV/QtAIn1VI6Xn5hgSrn22wF93gMtkd3LuGwLG71dsfMuYTHYvchAzxIdRRc6B
 HoOQ==
X-Gm-Message-State: AOAM530koSDbTH8gQ9tRqI1oyP//QULgL4Vyy95jFMv5LaGOjZ0GzmbA
 SdhmXIHwXJOM7cpBebtLGeF/x7YPR5GYqeCkhT8EceGuJ/vxUMVB5gU5AajVkebd2DYv9tN2hDV
 XzHjv1MYCRteKr/GtO18gLX67hYTPAHd4+AjTpE/CAGEVeofeW6nS9MOnynWSbQ==
X-Received: by 2002:a17:906:d9db:b0:6ce:8bfb:53c9 with SMTP id
 qk27-20020a170906d9db00b006ce8bfb53c9mr22490686ejb.10.1645621865038; 
 Wed, 23 Feb 2022 05:11:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwfwzNpAYIVgE7reRUJKUajrHRzMqRRe2Abz2bXiKaC8Mok6ZuxByqkcTiP4VdlcCzzvouoi25V+9aste03gA=
X-Received: by 2002:a17:906:d9db:b0:6ce:8bfb:53c9 with SMTP id
 qk27-20020a170906d9db00b006ce8bfb53c9mr22490660ejb.10.1645621864802; Wed, 23
 Feb 2022 05:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
 <20220221161232.2168364-5-alexandre.ghiti@canonical.com>
 <CANp29Y7M=wSLBE8m0-CHKtYPkqgcxNiUPEyRNv-VHeR5O2BTYQ@mail.gmail.com>
In-Reply-To: <CANp29Y7M=wSLBE8m0-CHKtYPkqgcxNiUPEyRNv-VHeR5O2BTYQ@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 23 Feb 2022 14:10:53 +0100
Message-ID: <CA+zEjCt02Cx1Q1yDGN9V6Wvgx0+jvcqft6U56M3wsidkW5sMjg@mail.gmail.com>
Subject: Re: [PATCH -fixes v2 4/4] riscv: Fix config KASAN && DEBUG_VIRTUAL
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>, 
 linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_051115_168218_E50C612E 
X-CRM114-Status: GOOD (  29.84  )
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

Hi Aleksandr,

On Tue, Feb 22, 2022 at 11:28 AM Aleksandr Nogikh <nogikh@google.com> wrote:
>
> Hi Alexandre,
>
> Thanks for the series!
>
> However, I still haven't managed to boot the kernel. What I did:
> 1) Checked out the riscv/fixes branch (this is the one we're using on
> syzbot). The latest commit was
> 6df2a016c0c8a3d0933ef33dd192ea6606b115e3.
> 2) Applied all 4 patches.
> 3) Used the config from the cover letter:
> https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
> 4) Built with `make -j32 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-`
> 5) Ran with `qemu-system-riscv64 -m 2048 -smp 1 -nographic -no-reboot
> -device virtio-rng-pci -machine virt -device
> virtio-net-pci,netdev=net0 -netdev
> user,id=net0,restrict=on,hostfwd=tcp:127.0.0.1:12529-:22 -device
> virtio-blk-device,drive=hd0 -drive
> file=~/kernel-image/riscv64,if=none,format=raw,id=hd0 -snapshot
> -kernel ~/linux-riscv/arch/riscv/boot/Image -append "root=/dev/vda
> console=ttyS0 earlyprintk=serial"` (this is similar to how syzkaller
> runs qemu).
>
> Can you please hint at what I'm doing differently?

A short summary of what I found to keep you updated:

I compared your command line and mine, the differences are that I use
"smp=4" and I add "earlycon" to the kernel command line. When added to
your command line, that allows it to boot. I understand why it helps
but I can't explain what's wrong...Anyway, I fixed a warning that I
had missed and that allows me to remove the "smp=4" and "earlycon".

But this is not over yet...Your command line still does not allow to
reach userspace, it fails with the following stacktrace:

[   11.537817][    T1] Unable to handle kernel paging request at
virtual address fffff5eeffffc800
[   11.539450][    T1] Oops [#1]
[   11.539909][    T1] Modules linked in:
[   11.540451][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.17.0-rc1-00007-ga68b89289e26-dirty #28
[   11.541364][    T1] Hardware name: riscv-virtio,qemu (DT)
[   11.542032][    T1] epc : kasan_check_range+0x96/0x13e
[   11.542654][    T1]  ra : memset+0x1e/0x4c
[   11.543388][    T1] epc : ffffffff8046c312 ra : ffffffff8046ca16 sp
: ffffaf8007337b70
[   11.544037][    T1]  gp : ffffffff85866c80 tp : ffffaf80073d8000 t0
: 0000000000046000
[   11.544637][    T1]  t1 : fffff5eeffffc9ff t2 : 0000000000000000 s0
: ffffaf8007337ba0
[   11.545409][    T1]  s1 : 0000000000001000 a0 : fffff5eeffffca00 a1
: 0000000000001000
[   11.546072][    T1]  a2 : 0000000000000001 a3 : ffffffff8039ef24 a4
: ffffaf7ffffe4000
[   11.546707][    T1]  a5 : fffff5eeffffc800 a6 : 0000004000000000 a7
: ffffaf7ffffe4fff
[   11.547541][    T1]  s2 : ffffaf7ffffe4000 s3 : 0000000000000000 s4
: ffffffff8467faa8
[   11.548277][    T1]  s5 : 0000000000000000 s6 : ffffffff85869840 s7
: 0000000000000000
[   11.548950][    T1]  s8 : 0000000000001000 s9 : ffffaf805a54a048
s10: ffffffff8588d420
[   11.549705][    T1]  s11: ffffaf7ffffe4000 t3 : 0000000000000000 t4
: 0000000000000040
[   11.550465][    T1]  t5 : fffff5eeffffca00 t6 : 0000000000000002
[   11.551131][    T1] status: 0000000000000120 badaddr:
fffff5eeffffc800 cause: 000000000000000d
[   11.551961][    T1] [<ffffffff8039ef24>] pcpu_alloc+0x84a/0x125c
[   11.552928][    T1] [<ffffffff8039f994>] __alloc_percpu+0x28/0x34
[   11.553555][    T1] [<ffffffff83286954>] ip_rt_init+0x15a/0x35c
[   11.554128][    T1] [<ffffffff83286d24>] ip_init+0x18/0x30
[   11.554642][    T1] [<ffffffff8328844a>] inet_init+0x2a6/0x550
[   11.555428][    T1] [<ffffffff80003220>] do_one_initcall+0x132/0x7e4
[   11.556049][    T1] [<ffffffff83201f7a>] kernel_init_freeable+0x510/0x5b4
[   11.556771][    T1] [<ffffffff831424e4>] kernel_init+0x28/0x21c
[   11.557344][    T1] [<ffffffff800056a0>] ret_from_exception+0x0/0x14
[   11.585469][    T1] ---[ end trace 0000000000000000 ]---

0xfffff5eeffffc800 is a KASAN address that points to the very end of
vmalloc address range, which is weird since KASAN_VMALLOC is not
enabled.
Moreover my command line does not trigger the above bug, and I'm
trying to understand why:

/home/alex/work/qemu/build/riscv64-softmmu/qemu-system-riscv64 -M virt
-bios /home/alex/work/opensbi/build/platform/generic/firmware/fw_dynamic.bin
-kernel /home/alex/work/kernel-build/riscv_rv64_kernel/arch/riscv/boot/Image
-netdev user,id=net0 -device virtio-net-device,netdev=net0 -drive
file=/home/alex/work/kernel-build/rootfs.ext2,format=raw,id=hd0
-device virtio-blk-device,drive=hd0 -nographic -smp 4 -m 16G -s
-append "rootwait earlycon root=/dev/vda ro earlyprintk=serial"

I'm looking into all of this and will get back with a v3 soon :)

Thanks,

Alex






>
> A simple config with KASAN, KASAN_OUTLINE and DEBUG_VIRTUAL now indeed
> leads to a booting kernel, which was not the case before.
> make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> ./scripts/config -e KASAN -e KASAN_OUTLINE -e DEBUG_VIRTUAL
> make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
>
> --
> Best Regards,
> Aleksandr
>
> On Mon, Feb 21, 2022 at 5:17 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > __virt_to_phys function is called very early in the boot process (ie
> > kasan_early_init) so it should not be instrumented by KASAN otherwise it
> > bugs.
> >
> > Fix this by declaring phys_addr.c as non-kasan instrumentable.
> >
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > ---
> >  arch/riscv/mm/Makefile | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > index 7ebaef10ea1b..ac7a25298a04 100644
> > --- a/arch/riscv/mm/Makefile
> > +++ b/arch/riscv/mm/Makefile
> > @@ -24,6 +24,9 @@ obj-$(CONFIG_KASAN)   += kasan_init.o
> >  ifdef CONFIG_KASAN
> >  KASAN_SANITIZE_kasan_init.o := n
> >  KASAN_SANITIZE_init.o := n
> > +ifdef CONFIG_DEBUG_VIRTUAL
> > +KASAN_SANITIZE_physaddr.o := n
> > +endif
> >  endif
> >
> >  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
> > --
> > 2.32.0
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
