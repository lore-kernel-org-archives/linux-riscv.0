Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E4BC2D0CD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=z+lozsEi9jslfUrqHuceZGpW2Xa6HJTbhtudCWeF9oE=; b=U+x
	d2zBS5F7u+cEBf49FaN8YmIEMjsRd74IBh1tAwz5ZnBa2wcEE64+v1y95BtfyYjDDLppCLoTlgzaJ
	a9yP9w4Bf8BRNkWcolgVidHdXtB8sYpoxL2fOchBOCs/BLaX69mbCcn1tNGyVW2XgSUz/xX+W7fYf
	qWoAzQhoj84tS1lCbLR+U7JMXF1SOkAEp7q+koia7tbB5Vfsh7x0VCVx4rbo70qEJIo8zxROZpwgl
	QW9WKtz4RH4vjMS1b2BOWM1uDPXz70frv+F0ZyCdsksgbaU/f7PJ7ejP5BIgkQgw734S1lPPYq22r
	JmXG/mmo1jtInLi4M7gL0EZT7fWjyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxU6-00000008kRt-3BLb;
	Mon, 19 May 2025 10:12:38 +0000
Received: from mail-io1-f77.google.com ([209.85.166.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxU4-00000008kRP-14vM
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 10:12:37 +0000
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-8610d7ec4d3so680960039f.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 03:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649554; x=1748254354;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Uzz1AxszAO+PF9ibC0zz8xp6JcJ1BC5ZEytJhZFUKk=;
        b=bGg56T1JCom0VHlR+tv0FX+ySdt+g2L0DP/PgUI2hjjuu2zAZhndlHc/qbXszkUYLZ
         K0Lgc2M6Wy+KgGpUDoqjw8ZbZPjKZOO4liRHYla6d5bXTi2LqidoDXmfHjQWKKHXYdyb
         cFHPtFY/pGt2jjg3Z0ZiBiyB04Rps+LKs7IOf9hr6G8JVhXQC5iCTDa8pr/xa6++cGE6
         s9pVZT4u5D1BbS6Zt8s8mGEJKsQup5dp5MEBc5KFIvLjqCU5iFo3XAros0h6DemmqaEC
         kb2VBhXqm4ZP/Rxw/JAGOLH/c+iwCkhwSq7UeZc+87AwMTzWbUBgXPk7pKe7wVJwDRUT
         MuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8g9e8QobQz9GJzaaOdfcWpKjnhr9Mv6GtXyPbQB/jci+zgb1r4IO/qKkLShql6/u9jwlf6LNfA5m+pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl7AJIkiSO24nScQ+K6Y5UzLBQTa1F7XDZVbMLChDMS3Cvydfv
	wPiRlfWPXsQAJVuQTVVuxS+mPT5QNrC7zXK8HmudmhRbipBAOSH6VHcU62PP2rqN74nZvayLxkj
	C3jJxi4wfiumjfSxgSNbkCzx28XNV1xEev439Ge+9/Ire1tahSAtR95yH3ko=
X-Google-Smtp-Source: AGHT+IG2Y0u+RSiUdq+RUnS4edusSPDCIYfX3VwkA1by3DVqjfO2+y5isVYDZPvl5V2L2cxYCnKf2XMjBzdmiPaSH+d7VoQfjBzJ
MIME-Version: 1.0
X-Received: by 2002:a05:6602:380d:b0:864:4aa2:d796 with SMTP id
 ca18e2360f4ac-86a231e19e9mr1507000039f.8.1747649554248; Mon, 19 May 2025
 03:12:34 -0700 (PDT)
Date: Mon, 19 May 2025 03:12:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682b0412.a70a0220.3849cf.00b1.GAE@google.com>
Subject: [syzbot] riscv/fixes test error: can't ssh into the instance (2)
From: syzbot <syzbot+2cae92ded758083f5bde@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_031236_292800_1CC08645 
X-CRM114-Status: UNSURE (   5.03  )
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

HEAD commit:    01534f3e0dd7 Merge tag 'riscv-fixes-6.15-rc6' of ssh://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=158796f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c32351e59d854b7
dashboard link: https://syzkaller.appspot.com/bug?extid=2cae92ded758083f5bde
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-01534f3e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4ca1cbb891a9/vmlinux-01534f3e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5fb1db315d47/Image-01534f3e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2cae92ded758083f5bde@syzkaller.appspotmail.com



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
