Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E9EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/VoCQDR4xHIJTMnntQwjdEinuC8oz5MjjpBsu90Wo0=; b=1db4zHzFwMyqrr
	pOk6+iKYtbLg4xO3q/NJJYA/s39WJgNmDeaOgMIqq9QJVkEh0Kmr99aQM8zW0hti19V6WktDDY38U
	Ca2kM0udZLRYp4N4sSEIAiJIC37c6BZ1U+3zsn7KwIkLD1rmNfdmb4wWJoLgzTcx5rtrYz7GQ+okG
	JpQRJEvr5qDX9N8gfhA7qeyXaYCA3KsUZRzRtbhAh3eAbAMlQxAkrThJ/pt8MoVTtZtW32x1FG3KR
	us6jxSSca8RPe2YMbLgtKC1YuRcIYbWRmK2rttDLbzaweDK7XfIpw8yRu6mKhsiJ5bn8N5V5T+qB4
	USTQ0rOSfwGlrG8x0VXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvGh-00FUgs-7h; Wed, 23 Feb 2022 17:17:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvGe-00FUg0-3g
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 17:17:34 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F19213F1D9
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645636649;
 bh=/ozkhea4bGdkwQyqdllwEcc/DZs+W0S+IsF9ZSOsgS8=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=PxCrqJKH0HKewqV56ON2CC7/q3TNwme2faSvaAICigvW8ibhBBS91O0IKy7SLTPh9
 x/iTwTAssYn7lJFB0esuHs25NtqiQaB0heknBFql2fcuylojBq6xSuUDM8Bn4w6P3B
 SLb29JCHqRV9hX30wcR+MxBeOaqa5aeBlrG53wCqEmgAVeDu3w7QWsnNw5DnPIdF1O
 7jNoyCF+ffrPIhOBHt8x/efflis0o+qR09qAw6lmVWe4tSu+8sk+7QnEDFSmbVWpdk
 v0Lo3veGKWaiM/z4Nt7zE3EVsU8InnLNuuSwUrhDwxwJKoYRxT3WKPqGEg3HRd06aP
 cyq5yNQ5WOKbA==
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402358a00b00410deddea4cso13886319edc.16
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 09:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ozkhea4bGdkwQyqdllwEcc/DZs+W0S+IsF9ZSOsgS8=;
 b=0xnoohaCX4LiEvt6MNKlG+ofNwLX9LRjWsDMJbiA8qBWJuIrw9GdRwYOfDx0vKtLNh
 p/QZJG0wfY1nWtaVW6JT/vWWGgGXwWJZTtQoYeakR36onMLgF1/wP90u0ioZVGTsH44S
 PzLXqX+9oPA+BpfnErjtj14iezaezovD73aLyDWIXy30EVWeV9oMnL0jLWPff7vH01Fy
 cR1g1flawCxds4BCPvlPDX95ewdF63OpwdfN7u7qOyR/ltF8tk4fPx+bI8SqqYgdQdwP
 z5GMPJvmqiJSTqmMOv9KlhasJivLb/CCa7JDJbT+oz6KR0IlG6BBU5ZQtBbJQcBRpyFu
 KjrQ==
X-Gm-Message-State: AOAM532n/t2VbJxg5k/skg09m+PAdLB1/K6Dfe3Q14En0JvRPffMUtTU
 Ew/7JKhXif7hIaBvV9n+1PIAJLPnQMCvr6+9Kpe0gEc9yTAYOn//C/fsvnin1vvodKC7N74jc6+
 OYEtTRA/A6BJZbEcHiTacb7XR5aJLQ+f7NH3ZlGuodOn63NtX1ZdwFSJS+Ge6PQ==
X-Received: by 2002:a17:906:71d5:b0:6a7:fd56:e9ad with SMTP id
 i21-20020a17090671d500b006a7fd56e9admr538253ejk.178.1645636647500; 
 Wed, 23 Feb 2022 09:17:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhQA7b1Bb9csDMI6vP1pWciNvkPbJXaIyGDNBoG0eroJtRI2MW0usYZXj0+NIsR6fmRaZcQ2C5SUg2GBSfpxA=
X-Received: by 2002:a17:906:71d5:b0:6a7:fd56:e9ad with SMTP id
 i21-20020a17090671d500b006a7fd56e9admr538234ejk.178.1645636647224; Wed, 23
 Feb 2022 09:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
 <20220221161232.2168364-5-alexandre.ghiti@canonical.com>
 <CANp29Y7M=wSLBE8m0-CHKtYPkqgcxNiUPEyRNv-VHeR5O2BTYQ@mail.gmail.com>
 <CA+zEjCt02Cx1Q1yDGN9V6Wvgx0+jvcqft6U56M3wsidkW5sMjg@mail.gmail.com>
In-Reply-To: <CA+zEjCt02Cx1Q1yDGN9V6Wvgx0+jvcqft6U56M3wsidkW5sMjg@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 23 Feb 2022 18:17:16 +0100
Message-ID: <CA+zEjCsDPqg1YwS_z4pCnP4GvwYd6Dhr6xwz51G4B8qvsUHqKQ@mail.gmail.com>
Subject: Re: [PATCH -fixes v2 4/4] riscv: Fix config KASAN && DEBUG_VIRTUAL
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_091732_316635_A870418C 
X-CRM114-Status: GOOD (  41.39  )
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

On Wed, Feb 23, 2022 at 2:10 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> Hi Aleksandr,
>
> On Tue, Feb 22, 2022 at 11:28 AM Aleksandr Nogikh <nogikh@google.com> wrote:
> >
> > Hi Alexandre,
> >
> > Thanks for the series!
> >
> > However, I still haven't managed to boot the kernel. What I did:
> > 1) Checked out the riscv/fixes branch (this is the one we're using on
> > syzbot). The latest commit was
> > 6df2a016c0c8a3d0933ef33dd192ea6606b115e3.
> > 2) Applied all 4 patches.
> > 3) Used the config from the cover letter:
> > https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
> > 4) Built with `make -j32 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-`
> > 5) Ran with `qemu-system-riscv64 -m 2048 -smp 1 -nographic -no-reboot
> > -device virtio-rng-pci -machine virt -device
> > virtio-net-pci,netdev=net0 -netdev
> > user,id=net0,restrict=on,hostfwd=tcp:127.0.0.1:12529-:22 -device
> > virtio-blk-device,drive=hd0 -drive
> > file=~/kernel-image/riscv64,if=none,format=raw,id=hd0 -snapshot
> > -kernel ~/linux-riscv/arch/riscv/boot/Image -append "root=/dev/vda
> > console=ttyS0 earlyprintk=serial"` (this is similar to how syzkaller
> > runs qemu).
> >
> > Can you please hint at what I'm doing differently?
>
> A short summary of what I found to keep you updated:
>
> I compared your command line and mine, the differences are that I use
> "smp=4" and I add "earlycon" to the kernel command line. When added to
> your command line, that allows it to boot. I understand why it helps
> but I can't explain what's wrong...Anyway, I fixed a warning that I
> had missed and that allows me to remove the "smp=4" and "earlycon".
>
> But this is not over yet...Your command line still does not allow to
> reach userspace, it fails with the following stacktrace:
>
> [   11.537817][    T1] Unable to handle kernel paging request at
> virtual address fffff5eeffffc800
> [   11.539450][    T1] Oops [#1]
> [   11.539909][    T1] Modules linked in:
> [   11.540451][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.17.0-rc1-00007-ga68b89289e26-dirty #28
> [   11.541364][    T1] Hardware name: riscv-virtio,qemu (DT)
> [   11.542032][    T1] epc : kasan_check_range+0x96/0x13e
> [   11.542654][    T1]  ra : memset+0x1e/0x4c
> [   11.543388][    T1] epc : ffffffff8046c312 ra : ffffffff8046ca16 sp
> : ffffaf8007337b70
> [   11.544037][    T1]  gp : ffffffff85866c80 tp : ffffaf80073d8000 t0
> : 0000000000046000
> [   11.544637][    T1]  t1 : fffff5eeffffc9ff t2 : 0000000000000000 s0
> : ffffaf8007337ba0
> [   11.545409][    T1]  s1 : 0000000000001000 a0 : fffff5eeffffca00 a1
> : 0000000000001000
> [   11.546072][    T1]  a2 : 0000000000000001 a3 : ffffffff8039ef24 a4
> : ffffaf7ffffe4000
> [   11.546707][    T1]  a5 : fffff5eeffffc800 a6 : 0000004000000000 a7
> : ffffaf7ffffe4fff
> [   11.547541][    T1]  s2 : ffffaf7ffffe4000 s3 : 0000000000000000 s4
> : ffffffff8467faa8
> [   11.548277][    T1]  s5 : 0000000000000000 s6 : ffffffff85869840 s7
> : 0000000000000000
> [   11.548950][    T1]  s8 : 0000000000001000 s9 : ffffaf805a54a048
> s10: ffffffff8588d420
> [   11.549705][    T1]  s11: ffffaf7ffffe4000 t3 : 0000000000000000 t4
> : 0000000000000040
> [   11.550465][    T1]  t5 : fffff5eeffffca00 t6 : 0000000000000002
> [   11.551131][    T1] status: 0000000000000120 badaddr:
> fffff5eeffffc800 cause: 000000000000000d
> [   11.551961][    T1] [<ffffffff8039ef24>] pcpu_alloc+0x84a/0x125c
> [   11.552928][    T1] [<ffffffff8039f994>] __alloc_percpu+0x28/0x34
> [   11.553555][    T1] [<ffffffff83286954>] ip_rt_init+0x15a/0x35c
> [   11.554128][    T1] [<ffffffff83286d24>] ip_init+0x18/0x30
> [   11.554642][    T1] [<ffffffff8328844a>] inet_init+0x2a6/0x550
> [   11.555428][    T1] [<ffffffff80003220>] do_one_initcall+0x132/0x7e4
> [   11.556049][    T1] [<ffffffff83201f7a>] kernel_init_freeable+0x510/0x5b4
> [   11.556771][    T1] [<ffffffff831424e4>] kernel_init+0x28/0x21c
> [   11.557344][    T1] [<ffffffff800056a0>] ret_from_exception+0x0/0x14
> [   11.585469][    T1] ---[ end trace 0000000000000000 ]---
>
> 0xfffff5eeffffc800 is a KASAN address that points to the very end of
> vmalloc address range, which is weird since KASAN_VMALLOC is not
> enabled.
> Moreover my command line does not trigger the above bug, and I'm
> trying to understand why:

When I read this email I saw that I did not use the same qemu version:
I have a locally built version that disables sv48, which is the one
that works so the problem came from the sv48 support.

In a nutshell, the issue comes from the fact that kasan inner regions
are not aligned on PGDIR_SIZE when sv48 (which is 4-level page table)
is on, and then when populating the kasan linear mapping region, that
clears the kasan vmalloc region which is in the same PGD: the fix is
to copy its content before initializing the linear mapping entries.
This issue only happens when KASAN_VMALLOC is disabled. I had fixed
this already for kasan_shallow_populate_pud, but missed
kasan_populate_pud.

Tomorrow I'll push the v3. It still does not fix the issue I describe
in the cover letter though, so still more work to do. At least, I was
able to reach userspace with your *exact* qemu command :)

Alex


>
> /home/alex/work/qemu/build/riscv64-softmmu/qemu-system-riscv64 -M virt
> -bios /home/alex/work/opensbi/build/platform/generic/firmware/fw_dynamic.bin
> -kernel /home/alex/work/kernel-build/riscv_rv64_kernel/arch/riscv/boot/Image
> -netdev user,id=net0 -device virtio-net-device,netdev=net0 -drive
> file=/home/alex/work/kernel-build/rootfs.ext2,format=raw,id=hd0
> -device virtio-blk-device,drive=hd0 -nographic -smp 4 -m 16G -s
> -append "rootwait earlycon root=/dev/vda ro earlyprintk=serial"
>
> I'm looking into all of this and will get back with a v3 soon :)
>
> Thanks,
>
> Alex
>
>
>
>
>
>
> >
> > A simple config with KASAN, KASAN_OUTLINE and DEBUG_VIRTUAL now indeed
> > leads to a booting kernel, which was not the case before.
> > make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > ./scripts/config -e KASAN -e KASAN_OUTLINE -e DEBUG_VIRTUAL
> > make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> >
> > --
> > Best Regards,
> > Aleksandr
> >
> > On Mon, Feb 21, 2022 at 5:17 PM Alexandre Ghiti
> > <alexandre.ghiti@canonical.com> wrote:
> > >
> > > __virt_to_phys function is called very early in the boot process (ie
> > > kasan_early_init) so it should not be instrumented by KASAN otherwise it
> > > bugs.
> > >
> > > Fix this by declaring phys_addr.c as non-kasan instrumentable.
> > >
> > > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > > ---
> > >  arch/riscv/mm/Makefile | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > > index 7ebaef10ea1b..ac7a25298a04 100644
> > > --- a/arch/riscv/mm/Makefile
> > > +++ b/arch/riscv/mm/Makefile
> > > @@ -24,6 +24,9 @@ obj-$(CONFIG_KASAN)   += kasan_init.o
> > >  ifdef CONFIG_KASAN
> > >  KASAN_SANITIZE_kasan_init.o := n
> > >  KASAN_SANITIZE_init.o := n
> > > +ifdef CONFIG_DEBUG_VIRTUAL
> > > +KASAN_SANITIZE_physaddr.o := n
> > > +endif
> > >  endif
> > >
> > >  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
> > > --
> > > 2.32.0
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
