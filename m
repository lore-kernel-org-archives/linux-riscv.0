Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87AEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KYhbpq89yxzqgLUgQB5yJAKcKOJEPaPAY/aIY5Ifuc0=; b=Mgl
	BwSWvWYb57QvdznGa+8HsXa9T34l9XtQkAyrNV5tbh/jCZazP1AZj2OFCtEmFszMsuFoUMZagFFYh
	pI13R0aLb8AHlfpAVn+/qnM78q/SQrsKwhnxItFs1RmUbAQ/eh3uZ8bCZJps2/NbVARj27gvLQwx4
	8CHBeU8Thptx1iA+MYNmXXo77sXpn6wBdxYBm58fUZtmjLdgi0IRFDfsYVk3AeMQBrkvsaGGocDml
	lPn8Yi/zaif25727RR6nnaAqk0MpDHzlAU0DKvPfOs1hz8NBrdEDPCC5GM/NuYPCnIuYt61PtDWAn
	82MyaZ7S4IdbruaGaeY9pEIRVt0OZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhev-002dDx-5E; Thu, 02 Jun 2022 10:02:29 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhes-002dAZ-Qc
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 10:02:28 +0000
Received: by mail-io1-f69.google.com with SMTP id y12-20020a5e920c000000b006657a63c653so2442225iop.11
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jun 2022 03:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=PlXyMH9yroMr86joJkDazD6M1cZkidX1eo+3QNu0Ks0=;
        b=8AwSQPGYe9bgACyc1YyKJFHxkWYpnZqG64jRk6bOdLic/VVmTBlygnVQF2zOoNU+bQ
         sCi/xPz8QVB3pZF7CsbklTmnhdQdiWz4S09VpglQo2Sg6JkMr6lNrn23ZVISxW9CNWjw
         S7+U6LOHZTSoVqn+9k+TtKTOfsCvRYvkdF9YAKl03FAV2szW/Mcvo0F2YpndO93ax4uK
         0xgFabtl1n0MwehI4Y2ieM5hKhsfzM7DakQifCDAeSbS47vWoGkBNk+rABEgHOvWzVZr
         KQWsr6k2YmMtKc8Wjbbj7aCjtAm1VOJYqF/LGTZG1djrDxYj8CCbfNwa6VJa7YMgR+HW
         AVcg==
X-Gm-Message-State: AOAM530tsn8O+tVv+xPPKZQCIAx2Qtb8Pt/ZCqds44sCQog1XgkuOvoC
	k0hnztMZgRADMVh3KnWEGF59kajVi+Jcb8hPv5/7mwCmDQTK
X-Google-Smtp-Source: ABdhPJzqQ55gAWfuzGONGd07P+o5i1tRB1eL/ZTHM2UomwBl6hJUahKq1mY2x/7hMV7bcfDVutkx1vrRegtJpg7tHboJ8hR+5wdk
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d14:b0:2d3:a75e:140b with SMTP id
 i20-20020a056e021d1400b002d3a75e140bmr2599005ila.61.1654164140868; Thu, 02
 Jun 2022 03:02:20 -0700 (PDT)
Date: Thu, 02 Jun 2022 03:02:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000044cc505e0741a4b@google.com>
Subject: [syzbot] riscv/fixes boot error: BUG: soft lockup in corrupted
From: syzbot <syzbot+1d1952c211a38ac43f10@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, axboe@kernel.dk, justin@coraid.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_030226_899158_7AE23E79 
X-CRM114-Status: UNSURE (   4.49  )
X-CRM114-Notice: Please train this message.
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

Hello,

syzbot found the following issue on:

HEAD commit:    c932edeaf6d6 riscv: dts: microchip: fix gpio1 reg property..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=14de11edf00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa6b5702bdf14a17
dashboard link: https://syzkaller.appspot.com/bug?extid=1d1952c211a38ac43f10
compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1d1952c211a38ac43f10@syzkaller.appspotmail.com

watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:1]
Modules linked in:
irq event stamp: 410297
hardirqs last  enabled at (410296): [<ffffffff8000ee74>] __trace_hardirqs_on+0x18/0x20 arch/riscv/kernel/trace_irq.c:19
hardirqs last disabled at (410297): [<ffffffff8000ee94>] __trace_hardirqs_off+0x18/0x20 arch/riscv/kernel/trace_irq.c:25
softirqs last  enabled at (405886): [<ffffffff83207a08>] softirq_handle_end kernel/softirq.c:401 [inline]
softirqs last  enabled at (405886): [<ffffffff83207a08>] __do_softirq+0x618/0x8fc kernel/softirq.c:587
softirqs last disabled at (405891): [<ffffffff8006164a>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
softirqs last disabled at (405891): [<ffffffff8006164a>] invoke_softirq kernel/softirq.c:439 [inline]
softirqs last disabled at (405891): [<ffffffff8006164a>] __irq_exit_rcu+0x142/0x1f8 kernel/softirq.c:637
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-syzkaller #0
Hardware name: riscv-virtio,qemu (DT)
epc : arch_static_branch arch/riscv/include/asm/jump_label.h:20 [inline]
epc : kfence_alloc include/linux/kfence.h:120 [inline]
epc : slab_alloc_node mm/slub.c:3135 [inline]
epc : kmem_cache_alloc_node+0xa0/0x3c6 mm/slub.c:3267
 ra : slab_pre_alloc_hook mm/slab.h:724 [inline]
 ra : slab_alloc_node mm/slub.c:3131 [inline]
 ra : kmem_cache_alloc_node+0x66/0x3c6 mm/slub.c:3267
epc : ffffffff8047df56 ra : ffffffff8047df1c sp : ff200000002273b0
 gp : ffffffff85a76440 tp : ff60000007430000 t0 : 0000000000046000
 t1 : ffebffff014d10b7 t2 : ffffffff80668f62 s0 : ff20000000227450
 s1 : ff600000075a93c0 a0 : 0000000000000000 a1 : 0000000000000007
 a2 : 1ffffffff09c876c a3 : ffffffff80bec434 a4 : 0000000000000000
 a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ff6000000a6885bb
 s2 : 0000000000000a20 s3 : 0000000000000000 s4 : 0000000000000a20
 s5 : ffffffffffffffff s6 : ffffffff8271f756 s7 : ffffffff85a9c780
 s8 : 00000000000000e8 s9 : ffffffff85a7c2c0 s10: 00000000000000ff
 s11: ffffffffffffa288 t3 : fffffffff3f3f300 t4 : ffebffff014d10b7
 t5 : ffebffff014d10b8 t6 : ff6000001239fc00
status: 0000000000000120 badaddr: 0000000000000000 cause: 8000000000000005
[<ffffffff8271f756>] __alloc_skb+0x234/0x2e4 net/core/skbuff.c:414
[<ffffffff81a42954>] alloc_skb include/linux/skbuff.h:1300 [inline]
[<ffffffff81a42954>] new_skb+0x2c/0xcc drivers/block/aoe/aoecmd.c:66
[<ffffffff81a48ab2>] aoecmd_cfg_pkts drivers/block/aoe/aoecmd.c:425 [inline]
[<ffffffff81a48ab2>] aoecmd_cfg+0x1f6/0x5c6 drivers/block/aoe/aoecmd.c:1362
[<ffffffff81a4bdfc>] discover_timer+0x4a/0x54 drivers/block/aoe/aoemain.c:24
[<ffffffff8016c084>] call_timer_fn+0x164/0x694 kernel/time/timer.c:1421
[<ffffffff8016ca9a>] expire_timers kernel/time/timer.c:1466 [inline]
[<ffffffff8016ca9a>] __run_timers.part.0+0x4e6/0x76e kernel/time/timer.c:1734
[<ffffffff8016cda8>] __run_timers kernel/time/timer.c:1715 [inline]
[<ffffffff8016cda8>] run_timer_softirq+0x86/0x100 kernel/time/timer.c:1747
[<ffffffff83207664>] __do_softirq+0x274/0x8fc kernel/softirq.c:558
[<ffffffff8006164a>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
[<ffffffff8006164a>] invoke_softirq kernel/softirq.c:439 [inline]
[<ffffffff8006164a>] __irq_exit_rcu+0x142/0x1f8 kernel/softirq.c:637
[<ffffffff80061958>] irq_exit+0x10/0x7a kernel/softirq.c:661
[<ffffffff831f7c8e>] generic_handle_arch_irq+0x48/0x54 kernel/irq/handle.c:240
[<ffffffff800057b2>] ret_from_exception+0x0/0x10
[<ffffffff8047df1c>] slab_pre_alloc_hook mm/slab.h:724 [inline]
[<ffffffff8047df1c>] slab_alloc_node mm/slub.c:3131 [inline]
[<ffffffff8047df1c>] kmem_cache_alloc_node+0x66/0x3c6 mm/slub.c:3267


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
