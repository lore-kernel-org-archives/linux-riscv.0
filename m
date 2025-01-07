Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABD2E77198
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbEv6qI7Z5YOdtP7RZG2rcF9eYjL18O7zs507bEBJtA=; b=JZD5oAksPqiI+T
	6ufSAq1JdBLHu0sTrEvXzsnv1nccWcireuLP278Big2EREe23m4YtnEU/tqBWyCYd+cklPP+nKxKg
	Mj1hegJo1fdakrOEcyvN9sJ6cfnr31K3GatF4r6g+zanBRaJpiXUl4j1EFCqnXFS6DV8KLiz71O2d
	i+Bf3n0043DTrTELrsoc2wyhWKTsTd0c/Af2jSgQYhH/mVu6rX66n3UeqpNY4PCu4UFQyl0OShIeT
	jt1Qtj1mAKs3wMtGRmZy49whD6tvXj7C9T2KrgbjafhyBJow9JedgL1ns3Ox0Ak1A/Fg/jygyU3Fm
	nz/9XQMa1FHFM+U4z04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9wx-000000053Zl-3wQB;
	Tue, 07 Jan 2025 13:48:51 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9ws-000000053Wv-1xFC
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 13:48:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72C854000B;
	Tue,  7 Jan 2025 13:48:37 +0000 (UTC)
Message-ID: <6c0aa43d-fdbd-472e-944d-e3a9a070d5ae@ghiti.fr>
Date: Tue, 7 Jan 2025 14:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [riscv?] kernel panic: Kernel stack overflow (3)
To: syzbot <syzbot+f694b8c2ba2919587a3d@syzkaller.appspotmail.com>,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, syzkaller-bugs@googlegroups.com
References: <676ab734.050a0220.2f3838.01af.GAE@google.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org
In-Reply-To: <676ab734.050a0220.2f3838.01af.GAE@google.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_054846_768995_856831C9 
X-CRM114-Status: GOOD (  16.47  )
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

On 24/12/2024 14:29, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    21f1b85c8912 riscv: mm: Do not call pmd dtor on vmemmap pa..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=14d32adf980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=90afd41d36b4291d
> dashboard link: https://syzkaller.appspot.com/bug?extid=f694b8c2ba2919587a3d
> compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-21f1b85c.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/69f16f8d759e/vmlinux-21f1b85c.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/1e170e1b7a02/Image-21f1b85c.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+f694b8c2ba2919587a3d@syzkaller.appspotmail.com
>
>   s11: ff6000001cefcec0 t3 : ff6000001cefd9e0 t4 : 1fec0000039dfb3b
>   t5 : 1fec0000039dfba9 t6 : 0000000000000015
> status: 0000000200000100 badaddr: ff20000005acff40 cause: 000000000000000f
> Kernel panic - not syncing: Kernel stack overflow
> CPU: 0 UID: 0 PID: 11449 Comm: syz.2.1759 Not tainted 6.13.0-rc2-syzkaller-g21f1b85c8912 #0
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
> [<ffffffff80071bae>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:130
> [<ffffffff8000325c>] show_stack+0x30/0x3c arch/riscv/kernel/stacktrace.c:136
> [<ffffffff8005e1d6>] __dump_stack lib/dump_stack.c:94 [inline]
> [<ffffffff8005e1d6>] dump_stack_lvl+0x110/0x1a6 lib/dump_stack.c:120
> [<ffffffff8005e288>] dump_stack+0x1c/0x24 lib/dump_stack.c:129
> [<ffffffff80003e62>] panic+0x38c/0x86e kernel/panic.c:354
> [<ffffffff80071372>] handle_bad_stack+0xd4/0xfc arch/riscv/kernel/traps.c:427
> [<ffffffff802b37e2>] mark_usage kernel/locking/lockdep.c:4658 [inline]
> [<ffffffff802b37e2>] __lock_acquire+0xaa6/0x8594 kernel/locking/lockdep.c:5180
> SMP: stopping secondary CPUs
> Rebooting in 86400 seconds..
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
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


We have the same stack size as x86 and arm64, which is 32KB. Given the 
fault address (ff20000005acff40), we indeed overflow the kernel stack:

[ 5560.063329][T11449] Task stack:     [0xff20000005ad0000..0xff20000005ad8000]

I noticed the following warning right before we lack space on the stack 
(which in the comments indicate a "recursion"):

[ 5560.055175][T11449] Dead loop on virtual device ipvlan1, fix it urgently!

Can the overflow be explained by this? Or should we again increase stack space? Or could this be a riscv specific issue?

I have no idea, so +cc netdev in case they can explain this.

Thanks for your help,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
