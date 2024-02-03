Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3EAC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ugc7IKoGzPOr1wv2qWkIlMxyb4g2l0+s/Qv93ZEmpV8=; b=co/eOv4+mLthKQ
	2+snQdOwBxWclQE6l+Yz7ale+HJoConSC2nTt+v0Xwfh08CqzPzCdRWruEp8pa5+fM/MBg23PRwKL
	FTqPGEXjjN9Yb9zc02L/eXdvVjLaOkOdvI4UmrRM7KaczOv3mdBxUk76DCLSWqB7cYD4fHyzN+Z7z
	1S78DD5L4ckzpYDJtzZgRrp62jPzupC4OlsWOhTDGvaZD7KmkIHYqf2ZlZpeVcXXkJZQPr3e2mjO3
	sAqN3Q/9W7pJIodPG3DIOAV3TN/vk4g8uKObyCzKJ07xNMkDVdtk+7f2fPIe3QBmlRI8OoZDgOwfc
	zcVKOlya6YnwMkuDLV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWKLX-0000000GzHZ-2Kss;
	Sat, 03 Feb 2024 18:02:31 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWKLU-0000000GzGv-2J7W
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 18:02:29 +0000
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-363b1386195so4393005ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Feb 2024 10:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706983345; x=1707588145;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8BIMaJkzTu28fgRsqkRky1lvWyIrpmgdUG1PvF/ySk=;
        b=aaxAo2k+0wjzI/AG8k92x0Ir/DZIIiEyMa3Ft3I6EtZHO0FyVVju6aOeo1GGz6xdNz
         HSuoM4R6iP0vRD4RBuLFGf/CD/gYOWuNPtvjM5+12sQHEdKKda4VnQ+A+EuUPcWc0RQF
         Za0t/ntrmy2PefQSkxT7BmLvZY0aC1QOzHyzWfaQpEoDC7NPr3oqAb81rvsLegD1IFqI
         4rik849jfCwP51AyG8ZQTGuE5Jwmpzu87MX6xYvRk/iwwh4nbiJbwDjG5P3tx47eNcmw
         Mn5sYDY71b3sujo5RXD3pWRNVo/KWlCFKDfm1ObMVtUquTch9uJTK5biRP+WzVlx0ubL
         kH0Q==
X-Gm-Message-State: AOJu0YzI4+wTQBX946OiNmRpIdYmUk9Mv7rVytONlR5NM6gTxN/IR0Qe
	q9baGyJ1FNaJiQuG2w1O7nFm3SUQScvh+5P54RPZIBOfhLKdADwyiXy3ZFVuyGkGw8JrahHpQ1r
	xgmMnfwwIwfEZxiXIaGW+jFaEQTD/KiN9jiORElc8wqtf0GlSvazy8kY=
X-Google-Smtp-Source: AGHT+IFVH57x8djBTsWSbkgJpBPmul6zpkIYvLlGOKoSGp7EJ0VvzJhUZeG2pWp0ummMPOfUlSPC209EyFmq81ZT3+GYIcNZ2Opk
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e7:b0:363:9ffd:beca with SMTP id
 l7-20020a056e0212e700b003639ffdbecamr493499iln.5.1706983345171; Sat, 03 Feb
 2024 10:02:25 -0800 (PST)
Date: Sat, 03 Feb 2024 10:02:25 -0800
In-Reply-To: <000000000000cb54de060d2cc266@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ed365206107e0783@google.com>
Subject: Re: [syzbot] [riscv?] kernel panic: Kernel stack overflow (2)
From: syzbot <syzbot+5c1ebfe49c5e8e998e75@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_100228_610427_DAFDD5CA 
X-CRM114-Status: UNSURE (   4.37  )
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    6613476e225e Linux 6.8-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=144ac160180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=877e61347079aad5
dashboard link: https://syzkaller.appspot.com/bug?extid=5c1ebfe49c5e8e998e75
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c57b90180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d369ffe80000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-6613476e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/33ea806d02dd/vmlinux-6613476e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/33195f72f823/Image-6613476e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c1ebfe49c5e8e998e75@syzkaller.appspotmail.com

 s11: ff60000011241a00 t3 : 0000000000000004 t4 : 1fec00000224849b
 t5 : 0000000000000002 t6 : 1fec0000022484c6
status: 0000000200000100 badaddr: ff2000000493ffc0 cause: 000000000000000f
Kernel panic - not syncing: Kernel stack overflow
CPU: 1 PID: 3859 Comm: kworker/1:3 Not tainted 6.8.0-rc1-syzkaller #0
Hardware name: riscv-virtio,qemu (DT)
Workqueue: usb_hub_wq hub_event
Call Trace:
[<ffffffff80010868>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:121
[<ffffffff858a9b60>] show_stack+0x34/0x40 arch/riscv/kernel/stacktrace.c:127
[<ffffffff85904e9c>] __dump_stack lib/dump_stack.c:88 [inline]
[<ffffffff85904e9c>] dump_stack_lvl+0xe8/0x154 lib/dump_stack.c:106
[<ffffffff85904f24>] dump_stack+0x1c/0x24 lib/dump_stack.c:113
[<ffffffff858aa5b2>] panic+0x33c/0x77a kernel/panic.c:344
[<ffffffff80010396>] handle_bad_stack+0xe0/0xf4 arch/riscv/kernel/traps.c:412
[<ffffffff80214a26>] mark_usage kernel/locking/lockdep.c:4599 [inline]
[<ffffffff80214a26>] __lock_acquire+0xaa8/0x784c kernel/locking/lockdep.c:5091
SMP: stopping secondary CPUs
Rebooting in 86400 seconds..


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
