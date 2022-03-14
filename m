Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EABAC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ra+P0YqpWXpyv2nP6101EY2EKe7Xf8d0O6JPkjNM2I=; b=hUqRPmSo9K4oOt
	6AdZ15970L07zDMutoWMoPe0RNcq385RBOH5CYRZPOrlBpPdvHzgL2N2/2YimgmIbqluhFCQ26Wo6
	Ihz5WPLiD2g5ubGLhLmRvp0AQiRPc0XMBQ9svdTl4qOBcUxaybK/xg0BGaXOW8nkfX1Q1A14Uexrw
	Q1YC7Cez8Ou7TEF1RaSnMtgZGcj2Of/cfTNYzMWsnRzxrB4Q9LSTzLaDVl56bFr/87D76Ho6ZZBN/
	g+dAPafj6EnqrNTxNgUClU622T6wspxQSGzDKn/yDhvKHqErI0RA6ZxRtg6Etvz/PmQjbsliHvDB5
	GFY2jum5Egzj7j6f3RCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTghD-004jaL-0W; Mon, 14 Mar 2022 09:08:55 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTgh6-004jX1-59
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 09:08:53 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso11337086otj.0
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7L4tRwmudVzaAjJ5P/9MN0ubQAqAip621yV/qGq8zec=;
 b=eRaAQ0up37gGM8HzGQyCV1BVfxWB5FY6IugGNSDPOVEqLB6rDQlFOEbzEX9K8CJQYh
 zI29PtYrs7AjAgvJc9XAH6nZt+vOEwRWPTc2caH4rhhmxI7i2+rMPBjWFZ6WoGyo/AlB
 tpEhHXKF9Th/U9IPNsCBx5T+oz3TOxRoAuEwdQPh6r6UxGrz8mfbo5ycP2QlPR0zY2/w
 xkAcNThM3Qe57yymSZPteg3zFodncRlSFYXKfJEL0B8T61k/LRR/eRCVtwUoitm/VKKz
 5Pkilkut3mS9oGByGvYIV26bqjU3/XczoNFE7rKDp3k545iQqWJ4dCsTFA/b3V9aUnX0
 1I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7L4tRwmudVzaAjJ5P/9MN0ubQAqAip621yV/qGq8zec=;
 b=1PF4ptkwUIgPgVLu6ECjYI7koQzDQ3c1R/WAEONZ4PS2tkACecCrAL1yigj1ZIQoYM
 TgbPilHucHTgBGFev7ICdOM0XBPp8v4pPsHu2FA0Oy7t//LcBmpOXQXqPEkyZfzg0Gip
 NMLumbffwvHorB7+0HObRJz1yBnwRI8QZ8b1laRPJivW1jWcwZBQgyBnWkww/YGHea+f
 0nsSZBHz61H7kQJGnCrZ+bavxiCWGL0dPFpJ+hmVNIAlTjXiX/2iAud16nxUChqKO5Yb
 GIin+6H7nW0vU03ZY0y1NYHThk2iCncU3/sQPCerWc+BqRE7JMLuM8H4DXKhrMM9VheH
 /mHg==
X-Gm-Message-State: AOAM533JsSCtxOtAU/7C4IZy5fVDyD0mzri9qAojYsKN+c2WE4P/JAis
 TMJd9TDkIVTrqJOZyJ/CgI+hqTyysdGdOEnTmzwSbw==
X-Google-Smtp-Source: ABdhPJzusmfsy31XXwZr0enc9EwQ5x3gvzAK3tB1xpoGNE+yK9VfzsD7tcH259xRn/f/gZoq29hi+RY7FKq0hvK7CFQ=
X-Received: by 2002:a05:6830:23b6:b0:5b2:4ac0:9130 with SMTP id
 m22-20020a05683023b600b005b24ac09130mr10630968ots.196.1647248926852; Mon, 14
 Mar 2022 02:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008ec53005da294fe9@google.com>
 <CACT4Y+YXzBGuj4mn2fnBWw4szbb4MsAvNScbyNXi1S21MXm8ig@mail.gmail.com>
In-Reply-To: <CACT4Y+YXzBGuj4mn2fnBWw4szbb4MsAvNScbyNXi1S21MXm8ig@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 14 Mar 2022 10:08:35 +0100
Message-ID: <CACT4Y+a1AvU4ZA3BXPpQMQ15A2T0CT_mrNTXv0NttJ0B06fH=w@mail.gmail.com>
Subject: Re: [syzbot] kernel panic: corrupted stack end in rtnl_newlink
To: syzbot <syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, yoshfuji@linux-ipv6.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_020848_267928_CB76EC76 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon, 14 Mar 2022 at 09:22, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, 14 Mar 2022 at 09:17, syzbot
> <syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    0966d385830d riscv: Fix auipc+jalr relocation range checks
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > console output: https://syzkaller.appspot.com/x/log.txt?x=17fe80c5700000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=6295d67591064921
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0600986d88e2d4d7ebb8
> > compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > userspace arch: riscv64
>
> +linux-riscv
>
> Riscv needs to increase stack size under KASAN.
> I will send a patch.

FTR proposed fix:
https://lore.kernel.org/linux-riscv/20220314090652.1607915-1-dvyukov@google.com/T/#u

> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com
> >
> > Kernel panic - not syncing: corrupted stack end detected inside scheduler
> > CPU: 0 PID: 2049 Comm: syz-executor.0 Not tainted 5.17.0-rc1-syzkaller-00002-g0966d385830d #0
> > Hardware name: riscv-virtio,qemu (DT)
> > Call Trace:
> > [<ffffffff8000a228>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:113
> > [<ffffffff831668cc>] show_stack+0x34/0x40 arch/riscv/kernel/stacktrace.c:119
> > [<ffffffff831756ba>] __dump_stack lib/dump_stack.c:88 [inline]
> > [<ffffffff831756ba>] dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:106
> > [<ffffffff83175742>] dump_stack+0x1c/0x24 lib/dump_stack.c:113
> > [<ffffffff83166fa8>] panic+0x24a/0x634 kernel/panic.c:233
> > [<ffffffff831a688a>] schedule_debug kernel/sched/core.c:5541 [inline]
> > [<ffffffff831a688a>] schedule+0x0/0x14c kernel/sched/core.c:6187
> > [<ffffffff831a6b00>] preempt_schedule_common+0x4e/0xde kernel/sched/core.c:6462
> > [<ffffffff831a6bc4>] preempt_schedule+0x34/0x36 kernel/sched/core.c:6487
> > [<ffffffff831afd78>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
> > [<ffffffff831afd78>] _raw_spin_unlock_irqrestore+0x8c/0x98 kernel/locking/spinlock.c:194
> > [<ffffffff80b09fdc>] __debug_check_no_obj_freed lib/debugobjects.c:1002 [inline]
> > [<ffffffff80b09fdc>] debug_check_no_obj_freed+0x14c/0x24a lib/debugobjects.c:1023
> > [<ffffffff80410994>] free_pages_prepare mm/page_alloc.c:1358 [inline]
> > [<ffffffff80410994>] free_pcp_prepare+0x24e/0x45e mm/page_alloc.c:1404
> > [<ffffffff804142fe>] free_unref_page_prepare mm/page_alloc.c:3325 [inline]
> > [<ffffffff804142fe>] free_unref_page+0x6a/0x31e mm/page_alloc.c:3404
> > [<ffffffff8041471e>] free_the_page mm/page_alloc.c:706 [inline]
> > [<ffffffff8041471e>] __free_pages+0xe2/0x112 mm/page_alloc.c:5474
> > [<ffffffff8046d728>] __free_slab+0x122/0x27c mm/slub.c:2028
> > [<ffffffff8046d8ce>] free_slab mm/slub.c:2043 [inline]
> > [<ffffffff8046d8ce>] discard_slab+0x4c/0x7a mm/slub.c:2049
> > [<ffffffff8046deec>] __unfreeze_partials+0x16a/0x18e mm/slub.c:2536
> > [<ffffffff8046e006>] put_cpu_partial+0xf6/0x162 mm/slub.c:2612
> > [<ffffffff8046d0ec>] __slab_free+0x166/0x29c mm/slub.c:3378
> > [<ffffffff8047258c>] do_slab_free mm/slub.c:3497 [inline]
> > [<ffffffff8047258c>] ___cache_free+0x17c/0x354 mm/slub.c:3516
> > [<ffffffff8047692e>] qlink_free mm/kasan/quarantine.c:157 [inline]
> > [<ffffffff8047692e>] qlist_free_all+0x7c/0x132 mm/kasan/quarantine.c:176
> > [<ffffffff80476ed4>] kasan_quarantine_reduce+0x14c/0x1c8 mm/kasan/quarantine.c:283
> > [<ffffffff804742b2>] __kasan_slab_alloc+0x5c/0x98 mm/kasan/common.c:446
> > [<ffffffff8046fa8a>] kasan_slab_alloc include/linux/kasan.h:260 [inline]
> > [<ffffffff8046fa8a>] slab_post_alloc_hook mm/slab.h:732 [inline]
> > [<ffffffff8046fa8a>] slab_alloc_node mm/slub.c:3230 [inline]
> > [<ffffffff8046fa8a>] slab_alloc mm/slub.c:3238 [inline]
> > [<ffffffff8046fa8a>] __kmalloc+0x156/0x318 mm/slub.c:4420
> > [<ffffffff82bde908>] kmalloc include/linux/slab.h:586 [inline]
> > [<ffffffff82bde908>] kzalloc include/linux/slab.h:715 [inline]
> > [<ffffffff82bde908>] fib_create_info+0xade/0x2d8e net/ipv4/fib_semantics.c:1464
> > [<ffffffff82becedc>] fib_table_insert+0x1a0/0xebe net/ipv4/fib_trie.c:1224
> > [<ffffffff82bd1222>] fib_magic+0x3f4/0x438 net/ipv4/fib_frontend.c:1087
> > [<ffffffff82bd6178>] fib_add_ifaddr+0xd2/0x2e2 net/ipv4/fib_frontend.c:1109
> > [<ffffffff82bd66ea>] fib_netdev_event+0x362/0x4b0 net/ipv4/fib_frontend.c:1466
> > [<ffffffff800aac84>] notifier_call_chain+0xb8/0x188 kernel/notifier.c:84
> > [<ffffffff800aad7e>] raw_notifier_call_chain+0x2a/0x38 kernel/notifier.c:392
> > [<ffffffff8271d086>] call_netdevice_notifiers_info+0x9e/0x10c net/core/dev.c:1919
> > [<ffffffff827422c8>] call_netdevice_notifiers_extack net/core/dev.c:1931 [inline]
> > [<ffffffff827422c8>] call_netdevice_notifiers net/core/dev.c:1945 [inline]
> > [<ffffffff827422c8>] __dev_notify_flags+0x108/0x1fa net/core/dev.c:8179
> > [<ffffffff827436f6>] dev_change_flags+0x9c/0xba net/core/dev.c:8215
> > [<ffffffff82767e16>] do_setlink+0x5d6/0x21c4 net/core/rtnetlink.c:2729
> > [<ffffffff8276a6a2>] __rtnl_newlink+0x99e/0xfa0 net/core/rtnetlink.c:3412
> > [<ffffffff8276ad04>] rtnl_newlink+0x60/0x8c net/core/rtnetlink.c:3527
> > [<ffffffff8276b46c>] rtnetlink_rcv_msg+0x338/0x9a0 net/core/rtnetlink.c:5592
> > [<ffffffff8296ded2>] netlink_rcv_skb+0xf8/0x2be net/netlink/af_netlink.c:2494
> > [<ffffffff827624f4>] rtnetlink_rcv+0x26/0x30 net/core/rtnetlink.c:5610
> > [<ffffffff8296cbcc>] netlink_unicast_kernel net/netlink/af_netlink.c:1317 [inline]
> > [<ffffffff8296cbcc>] netlink_unicast+0x40e/0x5fe net/netlink/af_netlink.c:1343
> > [<ffffffff8296d29c>] netlink_sendmsg+0x4e0/0x994 net/netlink/af_netlink.c:1919
> > [<ffffffff826d264e>] sock_sendmsg_nosec net/socket.c:705 [inline]
> > [<ffffffff826d264e>] sock_sendmsg+0xa0/0xc4 net/socket.c:725
> > [<ffffffff826d7026>] __sys_sendto+0x1f2/0x2e0 net/socket.c:2040
> > [<ffffffff826d7152>] __do_sys_sendto net/socket.c:2052 [inline]
> > [<ffffffff826d7152>] sys_sendto+0x3e/0x52 net/socket.c:2048
> > [<ffffffff80005716>] ret_from_syscall+0x0/0x2
> > SMP: stopping secondary CPUs
> > Rebooting in 86400 seconds..
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
