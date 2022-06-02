Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D766C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muCsFs16tgeD11d6uRQYe4wL0zspjn97qRBCt+1rZko=; b=rRZDvFCgj6aa8y
	JNxG8+Yhz7Vso+wApTBfJUioZcfj1OxikmRXzAzNrslHQQ++8zeeuTYdHoP/QZXR1+Vvrebs+wSSU
	bDLm164JEq0sV5cCvprgLB3VT1FE7GqIfvRzbqBKIWmCHFAJOG+cOMSY6xNO0Ukf3SArjvQgwjh9l
	Y/Z4AilFf/K+2cx7zTYsTyn/kwjwV/jpDdOwCNdvaBRqq7YRCDGrjayCvBD9xet3eyrNcj1FuGcXf
	VZYi0231p5MZ28t47jxs+Qd/J8u4waAsXnd0fEbeu6Oo6eMQ5M8N19KgahCXhbdVgILmIxNI8ezKf
	+OMvU9tfYf5/g3VGelLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwiWS-002rjA-AR; Thu, 02 Jun 2022 10:57:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwiWO-002rhC-Nw
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 10:57:46 +0000
Received: by mail-lf1-x12e.google.com with SMTP id a17so256825lfs.11
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jun 2022 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x+CytCKlX79rhtBNDGo+eN/Csfz4tGbSW706glfcV3s=;
        b=IrBYH2atiRJTij4OLkL2McNzaoMR3RqF5IQNxPWSS4MKmKEZwVfo766LNbSjF5dRWW
         cXFMBvyydlUCOY5FUNClP3TU0KNiwEN3SZzoW/65g1Pm+DmVX3C8nvtlRiP3KA7teXx6
         ThGTHny9ze7dy+BMT4LA6doHWH7JqDtK33XtP2NkYcyLx0NC/nEI5L89L4ZSs0/CXrct
         CcTH8POG8oZpMV8ORMcHbE/H7LriMVrPMKQ4M+UJjJABi9RQ8a3bHWLowlT+KQqHYC4z
         EyW1W7L5bVRmR5ijb7kU/SlZMCNH572BPtAKMyOEGJd6xN6Wz/gBnbVK5UrRQSwpE1mk
         KnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+CytCKlX79rhtBNDGo+eN/Csfz4tGbSW706glfcV3s=;
        b=TaFjC4iFgmhhQ/AYFSvTeoc5G5ttX7MTDNJwhMuUOue4eZj1CUTxgvsqAVjpkHJSTh
         aZ0QbilQi9R5Dvq2kgCgPnWUTrzA5OwC+b7hvPsvzKPeRFUhE34L0viKEmPiHKLDdx+i
         QZecVVkDtDNVq3dzJDLYfv0+wncz8xLmsF9fZExP/9arT2MdnBoAIuiPZ4Ne83gxVQkP
         KR1zSd900ad3ILuO4u6cXJJyKiAeFngTAehLwo/wLi5iRNP4PWXM5L+/Oaa9ZzAXUiEo
         FkuTRnIz+bP9GrGHOBXd4kJZpbGWeMdLVoGgOvu+af2rv0N9t0FisFgzkgJQ6G3hJ/r7
         jz6Q==
X-Gm-Message-State: AOAM532s51z0JJzytiUh1CSl092pQjKUoFOlvrJtjbPK7WkiQrYMbDtu
	55JFxGWI+j6bhC5WtTlMVNq30QU48k8KFUZhE4akJw==
X-Google-Smtp-Source: ABdhPJyRW4SMizmg/2yd0bFF1lI+Tau+09O/qHPkI3ruuPazvFnilXmy/61Dibd6p0qtuaD+W+P4LBZ7Y/pFJQAK4jA=
X-Received: by 2002:a05:6512:1156:b0:478:79b1:583c with SMTP id
 m22-20020a056512115600b0047879b1583cmr3211435lfg.206.1654167458543; Thu, 02
 Jun 2022 03:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000044cc505e0741a4b@google.com>
In-Reply-To: <000000000000044cc505e0741a4b@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 2 Jun 2022 12:57:27 +0200
Message-ID: <CACT4Y+ay0SQiiu2MwanpYEGmybHZc-nuqOxWOz1hC0PgLRRhuQ@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: BUG: soft lockup in corrupted
To: syzbot <syzbot+1d1952c211a38ac43f10@syzkaller.appspotmail.com>
Cc: aou@eecs.berkeley.edu, axboe@kernel.dk, justin@coraid.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_035744_818299_47B3BAF6 
X-CRM114-Status: GOOD (  17.74  )
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

On Thu, 2 Jun 2022 at 12:02, syzbot
<syzbot+1d1952c211a38ac43f10@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    c932edeaf6d6 riscv: dts: microchip: fix gpio1 reg property..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=14de11edf00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=aa6b5702bdf14a17
> dashboard link: https://syzkaller.appspot.com/bug?extid=1d1952c211a38ac43f10
> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: riscv64
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+1d1952c211a38ac43f10@syzkaller.appspotmail.com


This is the issue with riscv command line length we discussed in the
other thread:
https://lore.kernel.org/all/CACT4Y+bP+U2Co67SJG4qri=qHqCk38cq_JwGmo7m0s-8hCF8ww@mail.gmail.com/


> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:1]
> Modules linked in:
> irq event stamp: 410297
> hardirqs last  enabled at (410296): [<ffffffff8000ee74>] __trace_hardirqs_on+0x18/0x20 arch/riscv/kernel/trace_irq.c:19
> hardirqs last disabled at (410297): [<ffffffff8000ee94>] __trace_hardirqs_off+0x18/0x20 arch/riscv/kernel/trace_irq.c:25
> softirqs last  enabled at (405886): [<ffffffff83207a08>] softirq_handle_end kernel/softirq.c:401 [inline]
> softirqs last  enabled at (405886): [<ffffffff83207a08>] __do_softirq+0x618/0x8fc kernel/softirq.c:587
> softirqs last disabled at (405891): [<ffffffff8006164a>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
> softirqs last disabled at (405891): [<ffffffff8006164a>] invoke_softirq kernel/softirq.c:439 [inline]
> softirqs last disabled at (405891): [<ffffffff8006164a>] __irq_exit_rcu+0x142/0x1f8 kernel/softirq.c:637
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-syzkaller #0
> Hardware name: riscv-virtio,qemu (DT)
> epc : arch_static_branch arch/riscv/include/asm/jump_label.h:20 [inline]
> epc : kfence_alloc include/linux/kfence.h:120 [inline]
> epc : slab_alloc_node mm/slub.c:3135 [inline]
> epc : kmem_cache_alloc_node+0xa0/0x3c6 mm/slub.c:3267
>  ra : slab_pre_alloc_hook mm/slab.h:724 [inline]
>  ra : slab_alloc_node mm/slub.c:3131 [inline]
>  ra : kmem_cache_alloc_node+0x66/0x3c6 mm/slub.c:3267
> epc : ffffffff8047df56 ra : ffffffff8047df1c sp : ff200000002273b0
>  gp : ffffffff85a76440 tp : ff60000007430000 t0 : 0000000000046000
>  t1 : ffebffff014d10b7 t2 : ffffffff80668f62 s0 : ff20000000227450
>  s1 : ff600000075a93c0 a0 : 0000000000000000 a1 : 0000000000000007
>  a2 : 1ffffffff09c876c a3 : ffffffff80bec434 a4 : 0000000000000000
>  a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ff6000000a6885bb
>  s2 : 0000000000000a20 s3 : 0000000000000000 s4 : 0000000000000a20
>  s5 : ffffffffffffffff s6 : ffffffff8271f756 s7 : ffffffff85a9c780
>  s8 : 00000000000000e8 s9 : ffffffff85a7c2c0 s10: 00000000000000ff
>  s11: ffffffffffffa288 t3 : fffffffff3f3f300 t4 : ffebffff014d10b7
>  t5 : ffebffff014d10b8 t6 : ff6000001239fc00
> status: 0000000000000120 badaddr: 0000000000000000 cause: 8000000000000005
> [<ffffffff8271f756>] __alloc_skb+0x234/0x2e4 net/core/skbuff.c:414
> [<ffffffff81a42954>] alloc_skb include/linux/skbuff.h:1300 [inline]
> [<ffffffff81a42954>] new_skb+0x2c/0xcc drivers/block/aoe/aoecmd.c:66
> [<ffffffff81a48ab2>] aoecmd_cfg_pkts drivers/block/aoe/aoecmd.c:425 [inline]
> [<ffffffff81a48ab2>] aoecmd_cfg+0x1f6/0x5c6 drivers/block/aoe/aoecmd.c:1362
> [<ffffffff81a4bdfc>] discover_timer+0x4a/0x54 drivers/block/aoe/aoemain.c:24
> [<ffffffff8016c084>] call_timer_fn+0x164/0x694 kernel/time/timer.c:1421
> [<ffffffff8016ca9a>] expire_timers kernel/time/timer.c:1466 [inline]
> [<ffffffff8016ca9a>] __run_timers.part.0+0x4e6/0x76e kernel/time/timer.c:1734
> [<ffffffff8016cda8>] __run_timers kernel/time/timer.c:1715 [inline]
> [<ffffffff8016cda8>] run_timer_softirq+0x86/0x100 kernel/time/timer.c:1747
> [<ffffffff83207664>] __do_softirq+0x274/0x8fc kernel/softirq.c:558
> [<ffffffff8006164a>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
> [<ffffffff8006164a>] invoke_softirq kernel/softirq.c:439 [inline]
> [<ffffffff8006164a>] __irq_exit_rcu+0x142/0x1f8 kernel/softirq.c:637
> [<ffffffff80061958>] irq_exit+0x10/0x7a kernel/softirq.c:661
> [<ffffffff831f7c8e>] generic_handle_arch_irq+0x48/0x54 kernel/irq/handle.c:240
> [<ffffffff800057b2>] ret_from_exception+0x0/0x10
> [<ffffffff8047df1c>] slab_pre_alloc_hook mm/slab.h:724 [inline]
> [<ffffffff8047df1c>] slab_alloc_node mm/slub.c:3131 [inline]
> [<ffffffff8047df1c>] kmem_cache_alloc_node+0x66/0x3c6 mm/slub.c:3267
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000044cc505e0741a4b%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
