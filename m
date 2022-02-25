Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC1EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 03:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=C8x/T+gx4iDeCCY/RIANDbZ3D8tBv8Ooo8II64Fqy68=; b=Bad98ywbAJv49bFdnqWfmmGQNj
	Rtp8Xds766DAqoff1Jp4xAF3g3MWxYitsc0lzig6eew0NE409fdztTABYan0bM5+/jLoeZrNAwooF
	1fCJLjE+Fh7YCsuhEeGbr4ix/c7YWU1S7aIe1EmFZ5TccSJ0JXnkPzt1R8wBnoHETb+PtbEVlL6dU
	EHif75wVSUHUzBiaRt+So53UL3mIsCVcXLes65uDG8kLysOwzT//ko/IOdVfcuvkI9ECeMu0tBdOF
	3YnPM1ZsrDmKpsLXeNOz+5mjsPKk/iYrgT2ISZkyOya5j/ROgtcI4585p/qQs0r87VmzZi2AKtOmC
	Cmi8scRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNRju-003Dzo-Ch; Fri, 25 Feb 2022 03:57:54 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNRjm-003DuE-Le
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 03:57:48 +0000
Received: by mail-pf1-x435.google.com with SMTP id z16so3647607pfh.3
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 19:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iDFAzQ7oWupo/um69ebEfgZLXtbKoa51CUofPSlUDVo=;
 b=IyvZ7Y0OTN/yxFu3Jpam5godVEzq6jCD4h77x9yx5U7vC7AOukTgKtqMFfkznFRorT
 ZRpjauTq7Qb69f+ozGYOkdCtKBkgRlPohu9JZp7hI5cix3BDF0O1CLIXgfQpz17hacD4
 1Few9OA9Qf21N+DCKxLSkQGz6Bf7HsGqkBlJZZYi+2KET6GYBjR1elZ6uT+BSRoJ/b8g
 vdKK69Pu2cDBy4ooyhXQBsKarz4fHjXbnejfaKNuKoLV8NWyQKhhdKS1AUaxkfnZr75f
 VLo0534kgQfgjdi4lbkLL75vO5Pw0MrXPn5jPFBHjzYejxs+bgqs/4c5dHlilw+dkqGq
 k0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iDFAzQ7oWupo/um69ebEfgZLXtbKoa51CUofPSlUDVo=;
 b=ql+KOhAe0OvOeIgFNIANquSS1y+THFbHuB2ktP9+B2RYNUyBRnTxTPt0t5ye19jyQH
 h0ZOF27mMra21gPQ5g5ksWg2VOyI1HSwURQYY/L74ve2hRqY4Kh7Lv+yzcOlo91C/uSA
 kNXsvHxXyrKoVga/uE9Jg8Rr51ikgFMC6H8iMo/8tfUGspsaofZXEtrhJP5AsptSz3SG
 XRzksmgj6hVr4p1elhTPW9YSckCkCOBeOtZ8yOo1JDXTB5EcPcam9IHUO7RoN/yDO7Wk
 h7C22opfdcFIZUMSsQ58W1J2pvyxJiGh5CfeXgAamcLlsvHmYT5JKqzZxWDPQYjjh3mz
 DLCQ==
X-Gm-Message-State: AOAM5339t+qaYqTgWC+DG66pXWV+0BbQzbyZVkg3L46cOfWn9o+dC8dD
 dbVeA7BDtcB2AcQsWvNVdRPRUA==
X-Google-Smtp-Source: ABdhPJxMwhk/jL1dXnhliYk/bcWywbzMwZ7haLapvVCg/2O+mqcwCOC7DbOTZZ0I+gILsUOcJaxKkg==
X-Received: by 2002:a05:6a00:244f:b0:4cc:a2ba:4cd8 with SMTP id
 d15-20020a056a00244f00b004cca2ba4cd8mr5890382pfj.74.1645761465519; 
 Thu, 24 Feb 2022 19:57:45 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 lx7-20020a17090b4b0700b001b7d5b6d10asm745325pjb.48.2022.02.24.19.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 19:57:45 -0800 (PST)
Date: Thu, 24 Feb 2022 19:57:45 -0800 (PST)
X-Google-Original-Date: Thu, 24 Feb 2022 19:56:44 PST (-0800)
Subject: Re: [PATCH -fixes v2 4/4] riscv: Fix config KASAN && DEBUG_VIRTUAL
In-Reply-To: <CA+zEjCsDPqg1YwS_z4pCnP4GvwYd6Dhr6xwz51G4B8qvsUHqKQ@mail.gmail.com>
CC: nogikh@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, ryabinin.a.a@gmail.com, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-ed033018-ce9a-4b4c-b154-bd761639131d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_195746_772109_D25A62D8 
X-CRM114-Status: GOOD (  41.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Feb 2022 09:17:16 PST (-0800), alexandre.ghiti@canonical.com wrote:
> On Wed, Feb 23, 2022 at 2:10 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
>>
>> Hi Aleksandr,
>>
>> On Tue, Feb 22, 2022 at 11:28 AM Aleksandr Nogikh <nogikh@google.com> wrote:
>> >
>> > Hi Alexandre,
>> >
>> > Thanks for the series!
>> >
>> > However, I still haven't managed to boot the kernel. What I did:
>> > 1) Checked out the riscv/fixes branch (this is the one we're using on
>> > syzbot). The latest commit was
>> > 6df2a016c0c8a3d0933ef33dd192ea6606b115e3.
>> > 2) Applied all 4 patches.
>> > 3) Used the config from the cover letter:
>> > https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
>> > 4) Built with `make -j32 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-`
>> > 5) Ran with `qemu-system-riscv64 -m 2048 -smp 1 -nographic -no-reboot
>> > -device virtio-rng-pci -machine virt -device
>> > virtio-net-pci,netdev=net0 -netdev
>> > user,id=net0,restrict=on,hostfwd=tcp:127.0.0.1:12529-:22 -device
>> > virtio-blk-device,drive=hd0 -drive
>> > file=~/kernel-image/riscv64,if=none,format=raw,id=hd0 -snapshot
>> > -kernel ~/linux-riscv/arch/riscv/boot/Image -append "root=/dev/vda
>> > console=ttyS0 earlyprintk=serial"` (this is similar to how syzkaller
>> > runs qemu).
>> >
>> > Can you please hint at what I'm doing differently?
>>
>> A short summary of what I found to keep you updated:
>>
>> I compared your command line and mine, the differences are that I use
>> "smp=4" and I add "earlycon" to the kernel command line. When added to
>> your command line, that allows it to boot. I understand why it helps
>> but I can't explain what's wrong...Anyway, I fixed a warning that I
>> had missed and that allows me to remove the "smp=4" and "earlycon".
>>
>> But this is not over yet...Your command line still does not allow to
>> reach userspace, it fails with the following stacktrace:
>>
>> [   11.537817][    T1] Unable to handle kernel paging request at
>> virtual address fffff5eeffffc800
>> [   11.539450][    T1] Oops [#1]
>> [   11.539909][    T1] Modules linked in:
>> [   11.540451][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 5.17.0-rc1-00007-ga68b89289e26-dirty #28
>> [   11.541364][    T1] Hardware name: riscv-virtio,qemu (DT)
>> [   11.542032][    T1] epc : kasan_check_range+0x96/0x13e
>> [   11.542654][    T1]  ra : memset+0x1e/0x4c
>> [   11.543388][    T1] epc : ffffffff8046c312 ra : ffffffff8046ca16 sp
>> : ffffaf8007337b70
>> [   11.544037][    T1]  gp : ffffffff85866c80 tp : ffffaf80073d8000 t0
>> : 0000000000046000
>> [   11.544637][    T1]  t1 : fffff5eeffffc9ff t2 : 0000000000000000 s0
>> : ffffaf8007337ba0
>> [   11.545409][    T1]  s1 : 0000000000001000 a0 : fffff5eeffffca00 a1
>> : 0000000000001000
>> [   11.546072][    T1]  a2 : 0000000000000001 a3 : ffffffff8039ef24 a4
>> : ffffaf7ffffe4000
>> [   11.546707][    T1]  a5 : fffff5eeffffc800 a6 : 0000004000000000 a7
>> : ffffaf7ffffe4fff
>> [   11.547541][    T1]  s2 : ffffaf7ffffe4000 s3 : 0000000000000000 s4
>> : ffffffff8467faa8
>> [   11.548277][    T1]  s5 : 0000000000000000 s6 : ffffffff85869840 s7
>> : 0000000000000000
>> [   11.548950][    T1]  s8 : 0000000000001000 s9 : ffffaf805a54a048
>> s10: ffffffff8588d420
>> [   11.549705][    T1]  s11: ffffaf7ffffe4000 t3 : 0000000000000000 t4
>> : 0000000000000040
>> [   11.550465][    T1]  t5 : fffff5eeffffca00 t6 : 0000000000000002
>> [   11.551131][    T1] status: 0000000000000120 badaddr:
>> fffff5eeffffc800 cause: 000000000000000d
>> [   11.551961][    T1] [<ffffffff8039ef24>] pcpu_alloc+0x84a/0x125c
>> [   11.552928][    T1] [<ffffffff8039f994>] __alloc_percpu+0x28/0x34
>> [   11.553555][    T1] [<ffffffff83286954>] ip_rt_init+0x15a/0x35c
>> [   11.554128][    T1] [<ffffffff83286d24>] ip_init+0x18/0x30
>> [   11.554642][    T1] [<ffffffff8328844a>] inet_init+0x2a6/0x550
>> [   11.555428][    T1] [<ffffffff80003220>] do_one_initcall+0x132/0x7e4
>> [   11.556049][    T1] [<ffffffff83201f7a>] kernel_init_freeable+0x510/0x5b4
>> [   11.556771][    T1] [<ffffffff831424e4>] kernel_init+0x28/0x21c
>> [   11.557344][    T1] [<ffffffff800056a0>] ret_from_exception+0x0/0x14
>> [   11.585469][    T1] ---[ end trace 0000000000000000 ]---
>>
>> 0xfffff5eeffffc800 is a KASAN address that points to the very end of
>> vmalloc address range, which is weird since KASAN_VMALLOC is not
>> enabled.
>> Moreover my command line does not trigger the above bug, and I'm
>> trying to understand why:
>
> When I read this email I saw that I did not use the same qemu version:
> I have a locally built version that disables sv48, which is the one
> that works so the problem came from the sv48 support.
>
> In a nutshell, the issue comes from the fact that kasan inner regions
> are not aligned on PGDIR_SIZE when sv48 (which is 4-level page table)
> is on, and then when populating the kasan linear mapping region, that
> clears the kasan vmalloc region which is in the same PGD: the fix is
> to copy its content before initializing the linear mapping entries.
> This issue only happens when KASAN_VMALLOC is disabled. I had fixed
> this already for kasan_shallow_populate_pud, but missed
> kasan_populate_pud.
>
> Tomorrow I'll push the v3. It still does not fix the issue I describe
> in the cover letter though, so still more work to do. At least, I was
> able to reach userspace with your *exact* qemu command :)

I can't find a v3.

>
> Alex
>
>
>>
>> /home/alex/work/qemu/build/riscv64-softmmu/qemu-system-riscv64 -M virt
>> -bios /home/alex/work/opensbi/build/platform/generic/firmware/fw_dynamic.bin
>> -kernel /home/alex/work/kernel-build/riscv_rv64_kernel/arch/riscv/boot/Image
>> -netdev user,id=net0 -device virtio-net-device,netdev=net0 -drive
>> file=/home/alex/work/kernel-build/rootfs.ext2,format=raw,id=hd0
>> -device virtio-blk-device,drive=hd0 -nographic -smp 4 -m 16G -s
>> -append "rootwait earlycon root=/dev/vda ro earlyprintk=serial"
>>
>> I'm looking into all of this and will get back with a v3 soon :)
>>
>> Thanks,
>>
>> Alex
>>
>>
>>
>>
>>
>>
>> >
>> > A simple config with KASAN, KASAN_OUTLINE and DEBUG_VIRTUAL now indeed
>> > leads to a booting kernel, which was not the case before.
>> > make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
>> > ./scripts/config -e KASAN -e KASAN_OUTLINE -e DEBUG_VIRTUAL
>> > make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
>> >
>> > --
>> > Best Regards,
>> > Aleksandr
>> >
>> > On Mon, Feb 21, 2022 at 5:17 PM Alexandre Ghiti
>> > <alexandre.ghiti@canonical.com> wrote:
>> > >
>> > > __virt_to_phys function is called very early in the boot process (ie
>> > > kasan_early_init) so it should not be instrumented by KASAN otherwise it
>> > > bugs.
>> > >
>> > > Fix this by declaring phys_addr.c as non-kasan instrumentable.
>> > >
>> > > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>> > > ---
>> > >  arch/riscv/mm/Makefile | 3 +++
>> > >  1 file changed, 3 insertions(+)
>> > >
>> > > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
>> > > index 7ebaef10ea1b..ac7a25298a04 100644
>> > > --- a/arch/riscv/mm/Makefile
>> > > +++ b/arch/riscv/mm/Makefile
>> > > @@ -24,6 +24,9 @@ obj-$(CONFIG_KASAN)   += kasan_init.o
>> > >  ifdef CONFIG_KASAN
>> > >  KASAN_SANITIZE_kasan_init.o := n
>> > >  KASAN_SANITIZE_init.o := n
>> > > +ifdef CONFIG_DEBUG_VIRTUAL
>> > > +KASAN_SANITIZE_physaddr.o := n
>> > > +endif
>> > >  endif
>> > >
>> > >  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
>> > > --
>> > > 2.32.0
>> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
