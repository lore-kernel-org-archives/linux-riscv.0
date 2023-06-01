Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0031AC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=umSZk9NRipCZn5/9JKutm/PYkL+Nh6hBSfo1oldiJM8=; b=ca6
	9yHMp9aAc+pMQM09dA2lpBc69rsnQyHqL36zz/w+CePpGFkx7lm8Emhy1QAibxIpNCz3KVjam/uj5
	yKUJezKx2Q1+UleR4fGZHbeuCgocFnE46xHtYh4blU3xrVjWmHd9O94s98dTSuMQm9vJrdajyid09
	rqMEc99ErIwLAL1oqYlBDmazasqy1Nh8PkWfHtdqDHkuP4W+pnLBPSSdkDxvJIkc2pceCa+2JCtDp
	mabc5bYNU7/Z3oqjV9rXkiONHpQwSt08zRt2TYeK94wkSVJrJC0hICtK+V3ZflLLTpcDno+ax64wx
	SswO0Ib1+K+/J/wSS+tS9GPLbQXF/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kmZ-0049Ar-1J;
	Thu, 01 Jun 2023 16:04:11 +0000
Received: from mail-io1-f78.google.com ([209.85.166.78])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kmW-00499i-31
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 16:04:10 +0000
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-7773997237cso2598439f.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 09:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685635445; x=1688227445;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55Qx5kJRxbiEIYR74fVJASiFy4phiSzeNgwjI65yaJc=;
        b=GWzmt5WX4d1SIxUrxzw/O9/LKSIxvwiXH26+skl2xvqw3Ev6t1rlPwQo97u5CcR7if
         6ZCSdHKTQXOoLlqqcaykLIKYUkhY4k9TFxXEf7/f/90XmPH9ZEXLJzAter+1TrQkRZEp
         3qNCqzIDonw1cTWUvpLzRwpcz6X5fP+z7KmZjZDzgdhvRf7oBuZ9470fh/9ZsGCOfmd0
         Ois4iCuHecNdoa9nf40IvlOT+PFsv6cC+F9+kK/yznJneuN6dPDT+EAeLqjoQXitOnsu
         JJZmwXV75L+b09zvuI9jJ0DUhD96yitPMBymuOv6zcqzcTvc8PgCQ3Uj+vih5e+TF3Mu
         zCfQ==
X-Gm-Message-State: AC+VfDx9g8eJgozXa9RqsUdUQiuCOCNz5bN1TvD4w+T+8Kv+UxmMttCz
	vE2IihJCMduxjbdp4Gzv+Ss7OREUmNfNGOSeyyRUePZcyfyU
X-Google-Smtp-Source: ACHHUZ5242TaAx1gTXBcqCfbAoHBIoWspvMUprpaoGArgkEA2ZZJkTHXb1A9ulhBM0VSgQ4WUH3qQMr7VDKZEZKnHCxP1eV5UbmN
MIME-Version: 1.0
X-Received: by 2002:a02:8669:0:b0:41a:b094:c5b8 with SMTP id
 e96-20020a028669000000b0041ab094c5b8mr3809522jai.2.1685635445777; Thu, 01 Jun
 2023 09:04:05 -0700 (PDT)
Date: Thu, 01 Jun 2023 09:04:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f76bf505fd139515@google.com>
Subject: [syzbot] riscv/fixes boot error: can't ssh into the instance (2)
From: syzbot <syzbot+a74d57bddabbedd75135@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_090408_975255_26EC2275 
X-CRM114-Status: UNSURE (   5.52  )
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

HEAD commit:    8dc2a7e8027f riscv: Fix relocatable kernels with early alt..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=17e9fbcd280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b4bf01bbb07f945
dashboard link: https://syzkaller.appspot.com/bug?extid=a74d57bddabbedd75135
compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-8dc2a7e8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/822e3cbe29ad/vmlinux-8dc2a7e8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7bda24abf1c2/Image-8dc2a7e8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a74d57bddabbedd75135@syzkaller.appspotmail.com



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to change bug's subsystems, reply with:
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
