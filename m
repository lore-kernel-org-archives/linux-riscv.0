Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC098CEACC5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6YPQDiuRUN8i1RaAARsdTMWSD3wscMVxJsXHU9vheE=; b=LLi6JyPLQc1fNjz6jmXmP32PxC
	s4Vuo72s9786LNL60cDguBLTzs1hEN4ow3hobzxHcoa40vGFLcZxrj4UOtupAmci/JREMwiDuAhRh
	MDO7IOC+VW8lEh4LVEP3lZgAVwD+IC/NtXUNqgY3x+maSK7A6Xan2c1crNwGJVHytHluQbF2oIGMJ
	TY+iZ32FLXDNdmv6kE9NKvUISvp0GaFKQKwBBs7D4s5qwkzW29zJ5aGYzoNvTAwrSa0Nhd6A3FQaY
	wVisjgQOMOZsmtuqVzNueGapybQI5TAQNbO3m53fFga3EOPH8crLFNRugwgqoBUlMpbjRI6mG3S73
	MsGorjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svdcQ-000000035gs-1ZkU;
	Tue, 01 Oct 2024 14:12:50 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svdQB-000000032jR-1Yxb
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 14:00:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7541E20003;
	Tue,  1 Oct 2024 14:00:06 +0000 (UTC)
Message-ID: <87666751-24c3-4c91-a2ce-689731526539@ghiti.fr>
Date: Tue, 1 Oct 2024 16:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [riscv?] riscv/fixes test error: kernel panic: Kernel
 stack overflow
Content-Language: en-US
To: syzbot <syzbot+ba9eac24453387a9d502@syzkaller.appspotmail.com>,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, syzkaller-bugs@googlegroups.com
References: <000000000000eb301906222aadc2@google.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <000000000000eb301906222aadc2@google.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_070011_751695_5AFABD2B 
X-CRM114-Status: GOOD (  13.36  )
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

On 15/09/2024 18:09, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    7c1e5b9690b0 riscv: Disable preemption while handling PR_R..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=1618e900580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c79e90d7b2f5b364
> dashboard link: https://syzkaller.appspot.com/bug?extid=ba9eac24453387a9d502
> compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: riscv64
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-7c1e5b96.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/71b65c326093/vmlinux-7c1e5b96.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4110f50eed32/Image-7c1e5b96.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ba9eac24453387a9d502@syzkaller.appspotmail.com
>
>   s11: ff60000011ee5b20 t3 : ffffffffffffffff t4 : fffffffef12c91f0
>   t5 : ffffffff89655e40 t6 : 1fec0000023dcb6d
> status: 0000000200000100 badaddr: ff20000000087fe8 cause: 000000000000000f
> Kernel panic - not syncing: Kernel stack overflow
> CPU: 0 UID: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.11.0-rc2-syzkaller-g7c1e5b9690b0 #0
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
> [<ffffffff80010216>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:130
> [<ffffffff85edbd86>] show_stack+0x34/0x40 arch/riscv/kernel/stacktrace.c:136
> [<ffffffff85f3735e>] __dump_stack lib/dump_stack.c:93 [inline]
> [<ffffffff85f3735e>] dump_stack_lvl+0x108/0x196 lib/dump_stack.c:119
> [<ffffffff85f37408>] dump_stack+0x1c/0x24 lib/dump_stack.c:128
> [<ffffffff85edc94a>] panic+0x388/0x806 kernel/panic.c:348
> [<ffffffff8000fcee>] handle_bad_stack+0xe4/0x10c arch/riscv/kernel/traps.c:427
> [<ffffffff8022b788>] __bfs_backwards kernel/locking/lockdep.c:1843 [inline]
> [<ffffffff8022b788>] check_irq_usage+0x1d6/0x1466 kernel/locking/lockdep.c:2803
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


So this one should be fixed by 
https://lore.kernel.org/all/20240917150328.59831-1-alexghiti@rivosinc.com/T/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
