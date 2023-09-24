Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8817CE7A8A
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=88OCr/ltC9ZvTatjwv1jzFL/spuPO/AAHwinOOKZYhE=; b=ylo
	iZP9hpaaBjQKCQS1Sopz+PWeDf10E4HMhwXf471+e1Mdcq039wnoFBvALX7tOkgF4MP1/jnypeNxO
	MV/5g1HCq4A3OSw6HMm/3vPhE68XmsAr5jtBB9UaGadHDsn5zbhTpFHDJHrmnrVGQthhm8oXN2gQv
	Sc6OXZOMGLrQZoI9tOGQ27tCG5tRQlv2Q6qn9FbefOgdScvFsDY+WSUrCjfUad5rXWVkWDZZYK0Py
	ZITECq99/BT96z7eKhsAFgZ+40dxdlB/f/IvKzmIAer5MEASjUZ2FLo7mw0ZFLAlBccpLtslue7zE
	70uYA9IXx5EnBLLJ6LYXeu9wFYpTA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkPso-00CLp3-2J;
	Sun, 24 Sep 2023 14:14:50 +0000
Received: from mail-oi1-f207.google.com ([209.85.167.207])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkPsl-00CLoi-0p
	for linux-riscv@lists.infradead.org;
	Sun, 24 Sep 2023 14:14:48 +0000
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-3adb6858aaaso10846945b6e.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 07:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695564885; x=1696169685;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRsRZUAIMv4FuhiK6PMD9AshJLltQTCldVEy4Ubn5U8=;
        b=a2YlFLUlEc/GTtGnD409EDi9zAtn62WivCFxdxHucUtm29hq6pqttsHz4DNPYTKR8t
         Rcf7dVDC0/kg9RNv4JnPx2H/pMc1Hf9fB1RnN2P7nlCnZNRzdXvVp3KtDKEQ8fRoG6zA
         zw/b5WtVxbO3joneDWytl6m5y3pAmtijb06FcgFzOJ6Sixe0sjIervb1Q0dmN7tlcQVt
         9A5UjFqG76Xb8QAnXjsnd+j5ZS3bIqRuhQmo+uo6zbTXBkh9yjoKITqZcM1P415ElwFi
         kfStAbvVB1zQ4a9Ep1I1n0yArw6un4XphYBro/r1CBe2L+aqgpWQCNDPwUUZwwxM9KNm
         37Gg==
X-Gm-Message-State: AOJu0YwWjSaMhc7Xb430U7OrMKhoztM5sghAaQ+GxSsGfNciCrwFhYkF
	upUl6AJJdzTw+iAZnOxN5C3z05xKkk8mp25+7XxEH/YFdUiv
X-Google-Smtp-Source: AGHT+IG5OyaMel7wuQNCLuRrNrdfchiE3XRhmAnZzCL/0CReIr6zw1DVVsdtPeWqAcETeaW+OFzGNUmtSTTrKH+shN8E6+WIFjqo
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a2:b0:3ae:2024:837d with SMTP id
 bj34-20020a05680819a200b003ae2024837dmr2549189oib.8.1695564884924; Sun, 24
 Sep 2023 07:14:44 -0700 (PDT)
Date: Sun, 24 Sep 2023 07:14:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8df0406061b76e6@google.com>
Subject: [syzbot] riscv/fixes test error: BUG: got no coverage: (3)
From: syzbot <syzbot+2ecff9714d050e3c3a88@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_071447_311809_83169FC4 
X-CRM114-Status: UNSURE (   4.57  )
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

HEAD commit:    b06fab003ae1 riscv: kselftests: Fix mm build by removing t..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=16388918680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89f0a88d4bc7f0f4
dashboard link: https://syzkaller.appspot.com/bug?extid=2ecff9714d050e3c3a88
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-b06fab00.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d751d3ead63f/vmlinux-b06fab00.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d72380bd99cc/Image-b06fab00.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2ecff9714d050e3c3a88@syzkaller.appspotmail.com

executing program
executing program
executing program
executing program
1970/01/01 00:05:53 SYZFATAL: BUG: got no coverage:
loop exited with status 11


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
