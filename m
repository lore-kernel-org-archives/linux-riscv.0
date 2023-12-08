Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96260C10F05
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RyzJjmv4pifmYDRY4eq9lR6XWjE7JmY496yJda4FE+I=; b=3H2
	EyPTn47sTBWiAplDwYKItcO/p1MYcd/ai6y0AeeD/DFNVWKpE1PggwBI5z1+ArApoWp8b8WmZKvMv
	QdSBCwpUqnvIYDQXHo25Fw0a4/2SzOvtBG6nyM1/CoykMkgZVxr0LYqrg2DYGZyx0Bgstr0kLJB43
	obobioaF3sUKmM/l/IpVQnSexSOgV7k/YzelZ3S2GBAk4kk5q6h0IzQXQUAak4bCEJ6rp1im4yxtN
	uwNXbJGWSWolpnpToubRMaBYbrK6vxjpgJ6tQGGM1uR9ddD/USXa+RuWe5dA4e9yPx79Dv/4+oVl4
	oA6Ex4wT9YF+vCsl4wZ3m/kAueg48Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeUb-00G9kC-24;
	Fri, 08 Dec 2023 17:18:25 +0000
Received: from mail-oi1-f200.google.com ([209.85.167.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeUZ-00G9jd-1K
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:18:25 +0000
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b9dab0f163so3042007b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 09:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702055901; x=1702660701;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJ+3R9IxKbkmcTJ74HwTcQdvvH3YUoXYS6y2KZcmboM=;
        b=MGWTT2TNl19kg+QASN0qq1yhhGzT1jnAL7tKVIpyGDi7I9Z8SXC/b5OPJfosfpdDoK
         l49WYMigvVjIfUhscMo+PurR4Irq6GuvHHm/lsi6r5x4QmUPen6dsupNuMIcxMKrZmRU
         8Xo2+m6IBoIuZpoOnA/kY094rhtB0z9KxEQogML12cPVt0vHFjTsCyzq8+8GE7jhUrtc
         nWCoyoK5UZBiz4VmwkfcGCEwS4zClKWu2cT6rzgGIB7ZpZoM141rbIkcv6fPPrZXhp2x
         LPzLJdN5jXM6/VtYTIC8HpZZU67PZa4jtkxbvtIvcMX2KJuuzI2GB0oJdIr+LIZERjR9
         smSA==
X-Gm-Message-State: AOJu0YyGsB3FCDNCDCfJIarEyFV5YtNi5g8COLZkM5TnAIDjSndSh5uN
	EMxeheZT9TmO/lULpcXfAFQjvruWVX1NRuI6oyzT3aac3MEz
X-Google-Smtp-Source: AGHT+IEaGM8IrISOsncjNqQeBWc5L4m00L5pN75slobOFbwt/DyBySK4kH6Tmip4lZAW2Dp//bRk6iuMAdSNo1mN7aJXQv3Qa4mZ
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1924:b0:3b8:b1e2:f631 with SMTP id
 bf36-20020a056808192400b003b8b1e2f631mr421305oib.0.1702055901267; Fri, 08 Dec
 2023 09:18:21 -0800 (PST)
Date: Fri, 08 Dec 2023 09:18:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000620dd0060c02c5e1@google.com>
Subject: [syzbot] [riscv?] riscv/fixes boot error: kernel BUG in __phys_addr_symbol
From: syzbot <syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_091823_470908_AA3F59BD 
X-CRM114-Status: UNSURE (   6.01  )
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

HEAD commit:    eb46a0076501 riscv: Check if the code to patch lies in the..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=14aa707ae80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5c1ede998d7cef2
dashboard link: https://syzkaller.appspot.com/bug?extid=afb726d49f84c8d95ee1
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-eb46a007.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/472c8c5dc639/vmlinux-eb46a007.xz
kernel image: https://storage.googleapis.com/syzbot-assets/21ee09184ba1/Image-eb46a007.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at arch/riscv/mm/physaddr.c:31!
Kernel BUG [#1]
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc1-syzkaller-geb46a0076501 #0
Hardware name: riscv-virtio,qemu (DT)
epc : __phys_addr_symbol+0x144/0x150 arch/riscv/mm/physaddr.c:31
 ra : __phys_addr_symbol+0x144/0x150 arch/riscv/mm/physaddr.c:31
epc : ffffffff800200b4 ra : ffffffff800200b4 sp : ff20000000013d10
 gp : ffffffff861f60a0 tp : ff6000000b260000 t0 : 26747970652d3e69
 t1 : fffffffef0a8ad5d t2 : 0000000000000000 s0 : ff20000000013d40
 s1 : ff60000003a00000 a0 : 0000000000000006 a1 : ffffffff80000000
 a2 : 0000000000000002 a3 : ffffffff800200b4 a4 : 0000000000000000
 a5 : ff6000000b261000 a6 : 0000000000000003 a7 : ffffffff85456aef
 s2 : ffffffff8816d000 s3 : ffffffff80000000 s4 : ffffffff84e6f2b0
 s5 : ff60000003a00000 s6 : 0000000000000000 s7 : 0000000000000000
 s8 : ffffffff861f5c40 s9 : 0000000000000000 s10: 0000000000000000
 s11: 0000000000000000 t3 : ffffffffffffffff t4 : fffffffef0a8ad5d
 t5 : fffffffef0a8ad5e t6 : ff60000013e80c70
status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[<ffffffff800200b4>] __phys_addr_symbol+0x144/0x150 arch/riscv/mm/physaddr.c:31
[<ffffffff80019ede>] __set_memory+0x1c0/0x762 arch/riscv/mm/pageattr.c:308
[<ffffffff8001a4a4>] set_memory_rw_nx+0x24/0x30 arch/riscv/mm/pageattr.c:346
[<ffffffff80008778>] set_kernel_memory arch/riscv/include/asm/set_memory.h:27 [inline]
[<ffffffff80008778>] free_initmem+0x52/0x8c arch/riscv/kernel/setup.c:323
[<ffffffff837334e6>] kernel_init+0x44/0x21e init/main.c:1450
[<ffffffff83745cb2>] ret_from_fork+0xe/0x1c arch/riscv/kernel/entry.S:221
Code: 84b3 4124 b745 4985 1996 bf65 7097 0025 80e7 ecc0 (9002) 7097 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	412484b3          	sub	s1,s1,s2
   4:	b745                	j	0xffffffffffffffa4
   6:	4985                	li	s3,1
   8:	1996                	sll	s3,s3,0x25
   a:	bf65                	j	0xffffffffffffffc2
   c:	00257097          	auipc	ra,0x257
  10:	ecc080e7          	jalr	-308(ra) # 0x256ed8
* 14:	9002                	ebreak <-- trapping instruction
  16:	97 70             	Address 0x16 is out of bounds.


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
