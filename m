Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1620C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rgp3H71hjzoaWv27PkeRx2O7MiHD1BxQGRefymZQSo0=; b=4VG
	PJ1VJwxHgWFIuifN71iL605/FdwkvJK21EbVdJRTlzF06OXso2MkUMQqdykBf4VpzHGvwynpsyl0t
	+dJRi9L/4+X2QyTmTk7OvgYhylA/FnzvDw8h7qGNWCTzTu8SpRLftfo5CttQUJw8hjhcjOaqRL2Ga
	OCuujl7JPsLnj+qb86WGzN5s9Y3PUK76nqt/agq1Jj4AcrgG3pQ5nMaHLoirG3vkHWJFeaMT27oKM
	qMxf8J17JicAkeH7oz1bN6eG1g2m4zCy6fzYzLmggzdEVrOS0J8LqeQDwPX6M10i283eQJM/gZBi6
	ZYs5EhcgF0c8c1hWd/61f94yFleV7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sezDy-0000000DT57-06gi;
	Fri, 16 Aug 2024 15:50:46 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez2y-0000000DQf8-20QN
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 15:39:26 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-39d10b6da2dso20007715ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 08:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822762; x=1724427562;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8JJez+0p2S8btQve7w0Pep7EZa2y6dLItyWBelrZsk=;
        b=TtA5jDByFxoRFfrqDIUsIDf+YSaNCCg9sv3biGQ8I9fkdpZkOKAaQXCQYX3EfaxOcC
         qLE4CicORLb4AcQeDsxC7PezOF6pG5UGVzeJ2eb9UbnR2M81NwSoKZJzslC9engjrj6H
         IwuXTqhkK/AYpjRIfQtaIV2aY00jhYTg8lOhFEYM4ItnQZrX35GELT3wJi/pCI+Dz6H4
         yMyoIzEVRMlaPFovjydp5ylhgcOtafS3qvztB/vyXvIrOtfiMHYmNkzCg2pHPZoa7Bp0
         eaj9L8TTt3sqDqm+SlGiOY5FPmYUOSIP5QdBsyh3G1hGcxHyNl0ThNU/P3mIsl0iXMx9
         KS4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkXlRUTvXH9LShgEUcksmVlmtHPvxDAtZRpNNnJJunzW7KvfvP/IJ01iWOtdVDIegy1wyB+WEzi6lIISB15laaLFEr/wbPAlTWUi9OeThK
X-Gm-Message-State: AOJu0YwXhmX/p8oiwpIxKjnsbUVFdKRzYSA5tozE8C/YhpdgYgfDMK25
	5PIS4mtOpvsuJWo6l9T9tZFbFdlSQICA1ObSixjd3s2vEH0PuhGAvs2Rt3MPjDFtwrm5q2RVrt7
	G9XK9gvRZ9DkhBv6+R/rqkqPQSo7hbxWz8tXGUflhSi9quYUjGCz07CQ=
X-Google-Smtp-Source: AGHT+IH+DNxcyVYu22+wS8Im7fRACul9MEEKcf/DaaIOWxOiPuPbKbPyVxVJwl69AVkF5DZTBZA4g3tZks/5IibMJpW6Uxz9Tdtz
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:170e:b0:39a:eb4d:23c5 with SMTP id
 e9e14a558f8ab-39d26c36cfamr3092675ab.0.1723822762159; Fri, 16 Aug 2024
 08:39:22 -0700 (PDT)
Date: Fri, 16 Aug 2024 08:39:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000065062c061fcec37b@google.com>
Subject: [syzbot] riscv/fixes test error: can't ssh into the instance
From: syzbot <syzbot+cfbcb82adf6d7279fd35@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083924_551859_094EF636 
X-CRM114-Status: UNSURE (   4.61  )
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

HEAD commit:    32d5f7add080 Merge patch series "RISC-V: hwprobe: Misalign..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=10e639f3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e12019db89cebcd1
dashboard link: https://syzkaller.appspot.com/bug?extid=cfbcb82adf6d7279fd35
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-32d5f7ad.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/360b3f269693/vmlinux-32d5f7ad.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c6ef680b5e89/Image-32d5f7ad.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cfbcb82adf6d7279fd35@syzkaller.appspotmail.com



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
