Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4FBE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GnrCTIAN5tThYwIODi+DkeZK8oQ+bJun2zoGPPRqQhA=; b=H6n
	VXz5XAQTMDUyWsDi4yoWwEsaN3mDQ968+BS5IrGPBcKF7uwzq/hpOSnCwsJdpFJWCUDc/LgUPvV5v
	9ZT5P8hFY0cvV0n2efdHbntAEMQFlh7bZ/3TfWHZAg8RXUualieZ91I40RDYMjOIwolOaMLp0XDxc
	gZvwPXFVlvbp0LkPSbZES/lMET05LoSdl7S9fR9rNe41/AaEUxwF0MV9km+7jsaT1LwgzyFaxL8Y7
	11TfkImUixeeIlgzY+dmZ1eoNZkhoxp0KYSngiZw2TQkTwOwzGj8KSoD049VEmhEgs+e2ip5g/++r
	VpWBxlUrj4Y7y7DUAMpFHWaFFPSv5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4yW-0000000C3aZ-1N3C;
	Tue, 24 Dec 2024 13:29:28 +0000
Received: from mail-il1-f207.google.com ([209.85.166.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4yT-0000000C3Zh-3uAJ
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 13:29:27 +0000
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a9d57cff85so98793545ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 05:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735046964; x=1735651764;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joN0KPLwXg0lKzdtgFmFPMIleacQ5Yi3OyPPGpTfGZQ=;
        b=kNmSUiWBV8Gch/Ozhv/PWE7MBwTqiQ42FT3IpQu/24dBPoq1YgzNLngHLtihNscCTf
         yrOZkKj6Ew09QVO08P9QMfgDAynI0e1lh2jRq3zwfX2lddZk3K6bP9Axtfg8eJNaQaBu
         IDnU4lE3Zx2XTCKbwIkZbBrlZJfDOyzCDsthjBLirAQOe1L+aLjeMwclEuatW1gMtZNf
         9AnG2nThCkNmT78lRAnFDswY52AyoWQuwPF130Vwa1QZTOHmDN7V0qIX238DD3WauKnz
         IY4FBHueLnm9Ji98TOoUErGvTdKz9IkVArkFRdscfW4t/UFU6K+d79CxrzgC4ImtlKvQ
         kCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBQbBodYkiaecolWE+UvnIsuhutB78DUGHBmSJN5to9AcN4iDPtLGyqfU9Zbjuj2WmTcllm+hjqCBbZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV5N9g5iPWfegOTx7pEq1r+3ke2qJi4972gm66dYXHx4W6+0KZ
	XCMWR8F8icoVAIHDsZAhxCkpidJRBn5JDmfD3TO5cNH1Zk+zP7tG0yVjNglvh8HA02EQt5EYewF
	R7Uw5uUfw5sisX67U2Ff0z5LP58cL/Iy3Gd+HnVvxC6i5VL1GqVNlH7I=
X-Google-Smtp-Source: AGHT+IFYO5lma8t/EjLTu0ZvEn/g2R0zqWfT+klBZ3nqJ9tSC6uo4NrUfPo9+wBBuOvDd701e/I4x4CO0dehk3Bz6hhv55W2EoCz
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3dc9:b0:3a7:c5ff:e5e2 with SMTP id
 e9e14a558f8ab-3c2cca3e450mr134830085ab.0.1735046964257; Tue, 24 Dec 2024
 05:29:24 -0800 (PST)
Date: Tue, 24 Dec 2024 05:29:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676ab734.050a0220.2f3838.01af.GAE@google.com>
Subject: [syzbot] [riscv?] kernel panic: Kernel stack overflow (3)
From: syzbot <syzbot+f694b8c2ba2919587a3d@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_052925_974747_7BE6C93E 
X-CRM114-Status: UNSURE (   5.55  )
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

HEAD commit:    21f1b85c8912 riscv: mm: Do not call pmd dtor on vmemmap pa..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=14d32adf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90afd41d36b4291d
dashboard link: https://syzkaller.appspot.com/bug?extid=f694b8c2ba2919587a3d
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-21f1b85c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/69f16f8d759e/vmlinux-21f1b85c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1e170e1b7a02/Image-21f1b85c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f694b8c2ba2919587a3d@syzkaller.appspotmail.com

 s11: ff6000001cefcec0 t3 : ff6000001cefd9e0 t4 : 1fec0000039dfb3b
 t5 : 1fec0000039dfba9 t6 : 0000000000000015
status: 0000000200000100 badaddr: ff20000005acff40 cause: 000000000000000f
Kernel panic - not syncing: Kernel stack overflow
CPU: 0 UID: 0 PID: 11449 Comm: syz.2.1759 Not tainted 6.13.0-rc2-syzkaller-g21f1b85c8912 #0
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff80071bae>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:130
[<ffffffff8000325c>] show_stack+0x30/0x3c arch/riscv/kernel/stacktrace.c:136
[<ffffffff8005e1d6>] __dump_stack lib/dump_stack.c:94 [inline]
[<ffffffff8005e1d6>] dump_stack_lvl+0x110/0x1a6 lib/dump_stack.c:120
[<ffffffff8005e288>] dump_stack+0x1c/0x24 lib/dump_stack.c:129
[<ffffffff80003e62>] panic+0x38c/0x86e kernel/panic.c:354
[<ffffffff80071372>] handle_bad_stack+0xd4/0xfc arch/riscv/kernel/traps.c:427
[<ffffffff802b37e2>] mark_usage kernel/locking/lockdep.c:4658 [inline]
[<ffffffff802b37e2>] __lock_acquire+0xaa6/0x8594 kernel/locking/lockdep.c:5180
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
