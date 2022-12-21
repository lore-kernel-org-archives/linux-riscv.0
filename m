Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019ECC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=uullSJQW4KEsagprnHQUGxTC/CyMk1AjqUZB6CjYlFA=; b=2FJ
	L2H8xWvlD/AkHmKoEeDf4oNbELS8EmQx9Kx7BNxkjEIuH1JeczeRfoqx06JpMkEeMkY3iFPcAXzXA
	5rja1fql2lwbH638RjnA0C5oErLG6aWVPRb9QLBWMmFGb9FE/MFY8V2PX2uLPmfvyeI/hGq7p5QBx
	Lm4C55FdYKttyECi1aujSV9+Iml+5muNMghi/eh3EE0LP4h31iVGqdF7WHuOqTtUwagPl2s4xqO+5
	1RomwsweEehMwlN9fC47L6cXlqWz5D3mTsbVzfOu4lXq/+Zd1HpJRTMBsyaWdyyxJVgs4aPurncP3
	/q/ARwixFKGdavPL24OfS15trqkpBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7u8M-00BxJN-Rl; Wed, 21 Dec 2022 08:07:26 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7u4q-00BurQ-Nz
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 08:03:52 +0000
Received: by mail-il1-f200.google.com with SMTP id g3-20020a056e021a2300b00305e3da9585so9716878ile.16
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 00:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcpYeLe28CqPmFqlo0JZbFBlBQjAkRrx+VpXaCL5upY=;
        b=LF8WfhmsKzEcoZz4SVt7CVD/ykcu9xpKN80jYyN3CDMUCErdaTdcgdkJX6rbM/sQiE
         5yOsLY1WD5Ot1ekmau6Zqz8btChAJQCANSOCeZ8J1+BcYX86+DQr1u4JHXantUe+cPdI
         7IIyqaGqQcX98boS8F64wK3L4RUX+OVT0RuDhGRRCG0psK1w1N4rTmmOae5pmXPHO7pl
         zs+X42SnRWtDncGTKAILQlXuxZ9FHaMQbM2G/RzpG0PdqsX2vyvdZ7W33VnaNcKX3vst
         Wrgng/rPlDqnqKQSba0Cf9kVpSCFPJ6vPYEoF62ovmz/jLtmOuELWUrkgl9kLrHy6GEr
         +JVQ==
X-Gm-Message-State: AFqh2koguUwZTfr1yhMmAXhzAHY/lMYjaYnnFbVWfmupE7hvlZ6yGffs
	gpzqX6P4BuSiOuc1HuKkZgzfBVG5eJ/8pPcP09RHzY3LfjIn
X-Google-Smtp-Source: AMrXdXt/V+efK9DnSiMUcUwxMyt9SpO2bacPrJu9U2geyQJAhySb/bEGvNsgFb01hq7PqH0K9F1ExtaWhI7Qn4cMt7vahzGqvg+G
MIME-Version: 1.0
X-Received: by 2002:a92:d94e:0:b0:303:27a5:b9d7 with SMTP id
 l14-20020a92d94e000000b0030327a5b9d7mr114126ilq.12.1671609826570; Wed, 21 Dec
 2022 00:03:46 -0800 (PST)
Date: Wed, 21 Dec 2022 00:03:46 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ea7a5c05f051fd00@google.com>
Subject: [syzbot] riscv/fixes boot error: WARNING in __apply_to_page_range (2)
From: syzbot <syzbot+5702f46b5b22bdb38b7e@syzkaller.appspotmail.com>
To: andrii@kernel.org, aou@eecs.berkeley.edu, ast@kernel.org, bjorn@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luke.r.nels@gmail.com, martin.lau@linux.dev, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, xi.wang@gmail.com, yhs@fb.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_000350_330236_393B5BEC 
X-CRM114-Status: UNSURE (   5.13  )
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

HEAD commit:    eb67d239f3aa Merge tag 'riscv-for-linus-6.2-mw1' of git://..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=16672680480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be108b5bcf4ef832
dashboard link: https://syzkaller.appspot.com/bug?extid=5702f46b5b22bdb38b7e
compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5702f46b5b22bdb38b7e@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 apply_to_pmd_range mm/memory.c:2637 [inline]
WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 apply_to_pud_range mm/memory.c:2680 [inline]
WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 apply_to_p4d_range mm/memory.c:2716 [inline]
WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 __apply_to_page_range+0x988/0x1212 mm/memory.c:2750
Modules linked in:
CPU: 0 PID: 2760 Comm: dhcpcd Not tainted 6.1.0-syzkaller-13662-geb67d239f3aa #0
Hardware name: riscv-virtio,qemu (DT)
epc : apply_to_pmd_range mm/memory.c:2637 [inline]
epc : apply_to_pud_range mm/memory.c:2680 [inline]
epc : apply_to_p4d_range mm/memory.c:2716 [inline]
epc : __apply_to_page_range+0x988/0x1212 mm/memory.c:2750
 ra : apply_to_pmd_range mm/memory.c:2637 [inline]
 ra : apply_to_pud_range mm/memory.c:2680 [inline]
 ra : apply_to_p4d_range mm/memory.c:2716 [inline]
 ra : __apply_to_page_range+0x988/0x1212 mm/memory.c:2750
epc : ffffffff8042aac8 ra : ffffffff8042aac8 sp : ff20000004d57290
 gp : ffffffff85cdd280 tp : ff6000000e206200 t0 : ff60000010988a00
 t1 : 00000000000f0000 t2 : ffffffff804616b4 s0 : ff20000004d57380
 s1 : 0000000000000006 a0 : 0000000000000007 a1 : 00000000000f0000
 a2 : ffffffff8042aac8 a3 : 0000000000000002 a4 : ff6000000e207200
 a5 : 0000000000000000 a6 : 0000000000000003 a7 : 0000000000000000
 s2 : fffffffeef001000 s3 : 00000000371000e7 s4 : ff6000007a660bc0
 s5 : 0000000000001000 s6 : fffffffeef001000 s7 : 0000000000000001
 s8 : ffffffff804d8484 s9 : 0000000000000000 s10: fffffffeef000000
 s11: 0000000000000000 t3 : fffffffff3f3f300 t4 : fffffffef0a07c70
 t5 : fffffffef0a07c71 t6 : ff6000000ebcccb8
status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
[<ffffffff8042b386>] apply_to_page_range+0x34/0x46 mm/memory.c:2769
[<ffffffff804d872a>] kasan_populate_vmalloc+0x52/0x5e mm/kasan/shadow.c:315
[<ffffffff804619e0>] alloc_vmap_area+0x4a6/0x1636 mm/vmalloc.c:1647
[<ffffffff80462de2>] __get_vm_area_node+0x272/0x3b0 mm/vmalloc.c:2515
[<ffffffff8046917c>] __vmalloc_node_range+0x280/0xdb8 mm/vmalloc.c:3187
[<ffffffff800192c0>] bpf_jit_alloc_exec+0x46/0x52 arch/riscv/net/bpf_jit_core.c:190
[<ffffffff80282f10>] bpf_jit_binary_alloc+0x96/0x13c kernel/bpf/core.c:1027
[<ffffffff8001904c>] bpf_int_jit_compile+0x87a/0xa8c arch/riscv/net/bpf_jit_core.c:112
[<ffffffff80284d76>] bpf_prog_select_runtime+0x1a2/0x22e kernel/bpf/core.c:2191
[<ffffffff828a6840>] bpf_migrate_filter+0x258/0x2be net/core/filter.c:1298
[<ffffffff828acbec>] bpf_prepare_filter+0x10e/0x1b4 net/core/filter.c:1346
[<ffffffff828acfbc>] __get_filter+0x148/0x1a0 net/core/filter.c:1515
[<ffffffff828b3e7c>] sk_attach_filter+0x22/0x11a net/core/filter.c:1530
[<ffffffff827f1af4>] sk_setsockopt+0x144e/0x270c net/core/sock.c:1297
[<ffffffff827f2dfa>] sock_setsockopt+0x48/0x58 net/core/sock.c:1549
[<ffffffff827dfcc8>] __sys_setsockopt+0x3f0/0x418 net/socket.c:2242
[<ffffffff827dfd2a>] __do_sys_setsockopt net/socket.c:2257 [inline]
[<ffffffff827dfd2a>] sys_setsockopt+0x3a/0x4c net/socket.c:2254
[<ffffffff80005ff6>] ret_from_syscall+0x0/0x2
irq event stamp: 940
hardirqs last  enabled at (939): [<ffffffff833903b0>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (939): [<ffffffff833903b0>] _raw_spin_unlock_irqrestore+0x68/0x98 kernel/locking/spinlock.c:194
hardirqs last disabled at (940): [<ffffffff800105e0>] __trace_hardirqs_off+0x18/0x20 arch/riscv/kernel/trace_irq.c:25
softirqs last  enabled at (888): [<ffffffff8339107a>] softirq_handle_end kernel/softirq.c:414 [inline]
softirqs last  enabled at (888): [<ffffffff8339107a>] __do_softirq+0x640/0x930 kernel/softirq.c:600
softirqs last disabled at (883): [<ffffffff80069192>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
softirqs last disabled at (883): [<ffffffff80069192>] invoke_softirq kernel/softirq.c:452 [inline]
softirqs last disabled at (883): [<ffffffff80069192>] __irq_exit_rcu+0x154/0x1ea kernel/softirq.c:650
---[ end trace 0000000000000000 ]---


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
