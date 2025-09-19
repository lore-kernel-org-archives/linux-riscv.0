Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9468CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oUGNUI9OEDTgD+ZgLA2JLG+uf62d6+Sp1+m7Cse8vMw=; b=trK
	8wCHbW2URUGznL1Cv1lJU143uxi1L+HohIbaKyAAt07y42zA+9zaD9ow9PyGbv9KF/sobyDpf4rat
	iE/PAMkvVHQJRKwUUaN4iysQbbAvXZsbxJTN0DgRZ5ZrUD0zPLVPH0cDplF9t7T5SNYVGLEy/fHrC
	jPUYgMmom/vuUO+An2aGBP/+EBqvRY3fIy3Xql2VW3V63FgacBwJ6GwpfDmeYJRd/GLI6ttKaQpIF
	vdBFvdhWssOOdC2P6OPI9cKz/SG4/3S/jy7/+8RRssfXGSXMLGzsvxysk6K7HgibuckiHgyo29F5L
	lrvjyFtyb78sYlxsiShQO6TgHxj4B4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcJo-00000003Beq-1n5B;
	Fri, 19 Sep 2025 14:42:36 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcJm-00000003BdG-0MdI
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 14:42:35 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-423f9d1ea61so43514815ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 07:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758292952; x=1758897752;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAMs2+dv285mVlWJA8sr/wQEoMByjVHUfh3jerhKeq8=;
        b=WOoUNhJAR71hcI+ktBmcefWAhp7RpPafRyQlEXzfz2Yw3Glw+I7BAL1DACSjyU1OBe
         lgei502uRfAD92dFWOXjYI0xQX8vXxNatoa4xlnCO/NvSPP3RfuX2OEHw1YUQv4GQrbT
         8Zb6TqZk9iKI66N/q27RgJH+YUlUZL9VoYkFyFBng8YOMyshRUT07rkW3XDj7KAP5dWX
         w/YJRYFX1q7bq6lZVnkMMgAf/Q3EJRPldFPi114fPRaoNn5TP6LsDzcmRhosq1o90bpA
         m22fiw1ZhjkyCEQYsXH4rhD0WT104edt2Tu2+8eyvGniX3YOJLNfqb1qzV2OJl/zKP7j
         k1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVJzSZK5R1wTa5MFEX8HpVIrG7pLD0hclawzLYNVgguka+XN4Tdw3ERQ25X2UDM4JSYeWHAjS7dGneaiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxA6SUo3Knw9VbRecdn/1pO6EmDJjkzPfvnBWfN/t3GLhNQQau
	Fr/8yB9In2vr3aHYFXgnG+JEHhMg2lF9dV6sNkJT9Qmyqwg0v+EjPC3haf6F5v8U0/6xmVI3GpM
	AgXw0oJdPKf5tuefY07nwXs1JxZlTvaPaUltQMSuumiMoRZFPKVrDpVORJkY=
X-Google-Smtp-Source: AGHT+IFL69chW45OJ+YdbOPP4b6VMa0jjV3dnzR4T5WW/fF7ucF7RSBtGHHzwyJ4vvYtui8tXLhb/VNVwBVichO/CcPDUZWGGx0d
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:258a:b0:424:7f6c:78c5 with SMTP id
 e9e14a558f8ab-4248190b437mr48957965ab.7.1758292952511; Fri, 19 Sep 2025
 07:42:32 -0700 (PDT)
Date: Fri, 19 Sep 2025 07:42:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68cd6bd8.a00a0220.37dadf.001b.GAE@google.com>
Subject: [syzbot] riscv/for-next build error
From: syzbot <syzbot+8ea9d12facf13c334f88@syzkaller.appspotmail.com>
To: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_074234_122305_0C5946B1 
X-CRM114-Status: UNSURE (   4.78  )
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

HEAD commit:    a054965b36af riscv: errata: Fix the PAUSE Opcode for MIPS ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=150c1858580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6ae75a6b3af4c52
dashboard link: https://syzkaller.appspot.com/bug?extid=8ea9d12facf13c334f88
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8ea9d12facf13c334f88@syzkaller.appspotmail.com

arch/riscv/kernel/entry.S:78: Error: unrecognized opcode `alternative("sfence.vma", "nop",0,86,1)'
arch/riscv/kernel/entry.S:446: Error: unrecognized opcode `alternative(".dword do_trap_insn_fault", ".dword sifive_cip_453_insn_fault_trp",0x489,0,1)'
arch/riscv/kernel/entry.S:458: Error: unrecognized opcode `alternative(".dword do_page_fault", ".dword sifive_cip_453_page_fault_trp",0x489,0,1)'

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
