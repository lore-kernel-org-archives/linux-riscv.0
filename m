Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7E9C3ABA0
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WFcbgLV9ZeLc4PBZ1ic6xzaYzf1c6fQqd9W0flxGaHQ=; b=Tah
	+vkKmFbJ4RiykC4+CdkDZhZ8XfkKl6XOGsJ/deYqeWKgFoJ63YZei2CVa00gow2EZD1olS44cAbU/
	DDpod5F2ET2wC2VRP4Lh2iwPJvSoX+XCJ7jk1hWNxzRKF/Gwmf88feeP+evWqOv7jR6uRGmv3eiKq
	xWXiN2bPMtN4zr+mvfbq/FeiO5nWmBms2E+69JwM20JinxdsXK8che9igot+q0dLS28UKYoJ7ZvXD
	fAlEmvJxOEWfanj4xFFugsyGkm4+cAKfpgMxP6gnStj9RhNOnk/Zdn9p0l51iz42E38cLVNVmZyY9
	aosNlh06dlqHcAJmfsalsyqntvvVXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sproU-00000002Kfq-3dtN;
	Sun, 15 Sep 2024 16:09:26 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sproR-00000002KfW-3Dzn
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 16:09:25 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a0980547efso35837445ab.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Sep 2024 09:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726416562; x=1727021362;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIJdMEW9d9P8+jXupHV5746h78yBKydFnCBaG1bjO80=;
        b=hhWXXtMy8tOgIvp7psjKqi5MoNyOJtbK/0VSkIKx//55rc5kv8YVsGhFO6MYuF20D7
         hWoOdzwYR12Td1Bj5TLL5BMbked9oe7DlRsJZdwLtatqjQZNEw5WZVczk5TQMYN8e/Rv
         //AQtIvqItsMda/8Gw80Y4raIf0AINSXGx0Fnft2Z4kBVf/xngqz9JyUmTIgUb9Vavsl
         3STSF4TeK4YQzn1wG+UVBAxCLkGoRjWg6LBRH7Fvz6OxwjM4YpQbzvLvn9hZYoM46D+r
         56mOj42VTY0RW3Srl0oGnVjSo5QWvN8fJnlz7zf+QzeD0SzH0aKI5du2X9hMAQtoEoFr
         izZg==
X-Forwarded-Encrypted: i=1; AJvYcCWG/fTux9qZOVM/XtBhL9OqsnL9ypIpoItZdwoOf1G/gzi+dJkBIIKS8BoxZP0tAt1jW3iXiTZ0OUyAiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yypw6zG7O1wCZYqb5OxydacUMz4ZzFH12m3TvfhWmkfhoPJMabL
	3+duk3vH/Ewv6MM9BST+eUEzOrF1WGWGFXFH5M5mXb8KMDr24ZWpIQrORF4ycIlTyP4Fs20fB5E
	mMy+EI0XHPQAixnWdqKyAwKGgcs3r0TssaiFzz6M4Y0eRdLqGxLE75nQ=
X-Google-Smtp-Source: AGHT+IH2EijF+rbtzm6hg1J64j3GP4Ad3aROxxr8n6TJwsvP5N88AQeTBVYkGaNq4cjQl6e+GpPbUgp0MYNzIuzZEXyjLAjAo1ft
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13a6:b0:398:39f:8b4d with SMTP id
 e9e14a558f8ab-3a0848e54afmr128757555ab.5.1726416562101; Sun, 15 Sep 2024
 09:09:22 -0700 (PDT)
Date: Sun, 15 Sep 2024 09:09:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000eb301906222aadc2@google.com>
Subject: [syzbot] [riscv?] riscv/fixes test error: kernel panic: Kernel stack overflow
From: syzbot <syzbot+ba9eac24453387a9d502@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_090923_833890_7B77F0CB 
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

HEAD commit:    7c1e5b9690b0 riscv: Disable preemption while handling PR_R..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=1618e900580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c79e90d7b2f5b364
dashboard link: https://syzkaller.appspot.com/bug?extid=ba9eac24453387a9d502
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-7c1e5b96.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/71b65c326093/vmlinux-7c1e5b96.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4110f50eed32/Image-7c1e5b96.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ba9eac24453387a9d502@syzkaller.appspotmail.com

 s11: ff60000011ee5b20 t3 : ffffffffffffffff t4 : fffffffef12c91f0
 t5 : ffffffff89655e40 t6 : 1fec0000023dcb6d
status: 0000000200000100 badaddr: ff20000000087fe8 cause: 000000000000000f
Kernel panic - not syncing: Kernel stack overflow
CPU: 0 UID: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.11.0-rc2-syzkaller-g7c1e5b9690b0 #0
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff80010216>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:130
[<ffffffff85edbd86>] show_stack+0x34/0x40 arch/riscv/kernel/stacktrace.c:136
[<ffffffff85f3735e>] __dump_stack lib/dump_stack.c:93 [inline]
[<ffffffff85f3735e>] dump_stack_lvl+0x108/0x196 lib/dump_stack.c:119
[<ffffffff85f37408>] dump_stack+0x1c/0x24 lib/dump_stack.c:128
[<ffffffff85edc94a>] panic+0x388/0x806 kernel/panic.c:348
[<ffffffff8000fcee>] handle_bad_stack+0xe4/0x10c arch/riscv/kernel/traps.c:427
[<ffffffff8022b788>] __bfs_backwards kernel/locking/lockdep.c:1843 [inline]
[<ffffffff8022b788>] check_irq_usage+0x1d6/0x1466 kernel/locking/lockdep.c:2803
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
