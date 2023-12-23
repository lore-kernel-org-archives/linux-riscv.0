Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5101C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 12:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=W5EhFW6r1FbHL769U6WvN0MSZ3/a6egTrWkQ9h8CRyk=; b=MdM
	cXuUZ25NtFR5t5vteOE6ba5wPlL4i5rQH8A6KB/MzmH8iKMNXYXS5Tbtu2B1bVwNNlrMZ7AEoRN9N
	1TYWy0v1fDuXJ7j4AbFueYm2DtcEdLIg+PJ4SpWRXGPBMG6CPyrfmHq3z1tOJYVD8agteUbQMXNMs
	KScAdbB7qBKWOJq0OE2bS3wWnfdF7kWENTOx57BrZ/jP/8x0RoML09hZmgpj7KplGsHGJkdcuAeY4
	ybyPKz+X0TIcucJzQbovBBj1FjenCggurw9JB/ioZqz1ey4J30C6pg/GUK8fMsd6Yv8YDbs4DHjDk
	jzftRTgR5HlLxb5p3HXq7u+tp769ObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH1RT-007v20-0n;
	Sat, 23 Dec 2023 12:49:23 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH1RQ-007v1Z-1V
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 12:49:22 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-35fa6908f7bso29009015ab.3
        for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 04:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703335758; x=1703940558;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jPlsN7Ml/+XR4qokePSVPYK/NjAAU4vFSo45xfBkHM=;
        b=cEqPb9tEUdDqWodJhnzqcpwG1mQcwl/fdjPyUrXpnWngzt1Iq6ZBqEknO1+YTrNK5X
         PilV9QpqYOVE5n+BiFgD1g0Sc3x5tJ6L9zsjDq5rcNSWvFTVgPhkk8Ui4Vs2vz/yj4Wx
         IVghwWnHqYzJnvuSTs2TvuOEXnUtkatkxXAAIm7XrsowNudrB7/3u6uNiHX4BN542TCx
         SGwF0SF0s939YIoC1Da/YAfDPbLtz3muiLHaFgWj8bIe05Ufd+TAup+m8l4beMNg1cwu
         bxm3dn3S4NzDCxsT2Z6TwB+DzWl1PnL8RlRowDK4+DiIy5ELTikwo5pnhjyxvMIdB6cG
         s7bA==
X-Gm-Message-State: AOJu0YzxFabEDQapDkE6kDTwOjbW1AywJufaL7bAsFft/+LqYGdqU0kq
	Por2rNmwtW4U5K1lsIKwxL+hxgfei2AhK34cHZ0qBWnjT5aW
X-Google-Smtp-Source: AGHT+IGKjtDVv/BwNjkyahYD1ta4x0QVryvLbcYlokVC/ReU3y+mA3PBbk7B3gA+dsjpbiDflxKoXE4BFahG5lO+JqFcrt4j7CMo
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174c:b0:35f:c187:ea04 with SMTP id
 y12-20020a056e02174c00b0035fc187ea04mr354022ill.3.1703335758089; Sat, 23 Dec
 2023 04:49:18 -0800 (PST)
Date: Sat, 23 Dec 2023 04:49:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cb54de060d2cc266@google.com>
Subject: [syzbot] [riscv?] kernel panic: Kernel stack overflow (2)
From: syzbot <syzbot+5c1ebfe49c5e8e998e75@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_044920_510337_12F4F7C7 
X-CRM114-Status: UNSURE (   5.36  )
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

HEAD commit:    3b5c14361d61 riscv: Fix set_direct_map_default_noflush() t..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=16d5ffd6e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5c1ede998d7cef2
dashboard link: https://syzkaller.appspot.com/bug?extid=5c1ebfe49c5e8e998e75
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-3b5c1436.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/11e6a4fa8d50/vmlinux-3b5c1436.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6570c8642590/Image-3b5c1436.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c1ebfe49c5e8e998e75@syzkaller.appspotmail.com

 s11: ff60000008bd0a9c t3 : ff20000002078140 t4 : ffffffff80159674
 t5 : 1fe400000040f028 t6 : ff6000000f44c1b8
status: 0000000200000100 badaddr: ff20000002077f60 cause: 000000000000000f
Kernel panic - not syncing: Kernel stack overflow
CPU: 1 PID: 5612 Comm: kworker/1:4 Not tainted 6.7.0-rc1-syzkaller-g3b5c14361d61 #0
Hardware name: riscv-virtio,qemu (DT)
Workqueue: usb_hub_wq hub_event
Call Trace:
[<ffffffff8000c1e6>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:121
[<ffffffff836ee406>] show_stack+0x34/0x40 arch/riscv/kernel/stacktrace.c:127
[<ffffffff8372f66a>] __dump_stack lib/dump_stack.c:88 [inline]
[<ffffffff8372f66a>] dump_stack_lvl+0xe8/0x154 lib/dump_stack.c:106
[<ffffffff8372f6f2>] dump_stack+0x1c/0x24 lib/dump_stack.c:113
[<ffffffff836eef04>] panic+0x2ae/0x67a kernel/panic.c:344
[<ffffffff8000be62>] walk_stackframe+0x0/0x2f2 arch/riscv/kernel/traps.c:412
[<ffffffff8015a3b2>] mark_usage kernel/locking/lockdep.c:4586 [inline]
[<ffffffff8015a3b2>] __lock_acquire+0xd3e/0x310a kernel/locking/lockdep.c:5090
SMP: stopping secondary CPUs
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
