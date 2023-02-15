Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F778C05027
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=exw67QbiAkmdCW7xxP0WK5mj/6yq+XNbJ+eOQ9gOf1Y=; b=qkS
	XdAIJCaCia734WjV3NPJlIzfkvKLx52/PE05FPQbPqm0Dp7tZOt3B98TgTnp5On8mKHAb6u8CskO0
	pjdnC2ATOB0pJQ2rXvP4xj0pdQu5HGBHr0attjum8ILuz/3JdGcGQzgHFWJ2YylNjB1/ReJwCSkM5
	3M3NO6V2axNa84dHhbMeQZK4/56EDEiLoj0/vf+f1Cu2438n/DUIK5GLYsIXc/GNS7H0CJgCvzM0+
	8Nm3BwhnK7HS2tpkPncu+hqZmGO0UiYCF9EXzCPU24dWk/nAAbGQ9WKQ1j8u+19OBaHZKFd7gg+f/
	3QhSGohxtA+WoxKrRyYfYzR3euizo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5bN-0043Fs-Ra; Wed, 15 Feb 2023 00:24:49 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5bL-0043FC-8K
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 00:24:48 +0000
Received: by mail-il1-f198.google.com with SMTP id 15-20020a92190f000000b00315509b129aso3580056ilz.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 16:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ro3IO5v8s0ZmI31rZ+/7uZhdNatRdqyjN3Q7MJ9bUDE=;
        b=k/KBHQzG6XQdBmBgugLM9KZLNdG4Ien2eLvf3jWnl1dD8wBU9rXQHjw3yzfw3w1Yxp
         q674wRSehZ7rwhKoDDIikO5bmbrTu67WBovJDmMidz/uJtFI769waHhHrP28jEQpU2zP
         GSbQczGj3zRSuF92X7fvbC8hhsl8GOTNcdu8VesjqYxyHpecfPPaiqUbm0tJtJH7ZVEp
         fesUAWCn8IqrL4s5lrUSzYn3ZgvupMn73fqIrSr8sttyDjS+hon4Axq8Ix4rcr2eIYrZ
         U97JOO6kYZQ8fSoldknqUmnjX9El6KGvFUHcd2+igOhehAB3IfffzWNo6PvlU5x7YRgE
         xPMg==
X-Gm-Message-State: AO0yUKXkM2Mv8sdV/ZWjyJTNA4ZZM/NZgh+QfXCn+6B+gggBuyssMvdZ
	n5C2FLadCibBJNpxvbnuoHZ4t/XK5+FO0dFzhC5nfdgItzPM
X-Google-Smtp-Source: AK7set9GCZdZeaKJmAxT+CSMD13tyiuHxwB3Hc3iPf09iLvoaW1NcFzTRdcnemPgGm6esp4cjSIC+H2OUftu5ThHdq5ub64KHvku
MIME-Version: 1.0
X-Received: by 2002:a92:bd10:0:b0:314:1b0:1cfd with SMTP id
 c16-20020a92bd10000000b0031401b01cfdmr183923ile.0.1676420684954; Tue, 14 Feb
 2023 16:24:44 -0800 (PST)
Date: Tue, 14 Feb 2023 16:24:44 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006bc5be05f4b21b7b@google.com>
Subject: [syzbot] riscv/fixes boot error: INFO: rcu detected stall in corrupted
From: syzbot <syzbot+42670398d6ddb118138f@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, brauner@kernel.org, bristot@redhat.com, 
	bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mgorman@suse.de, mingo@redhat.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, rostedt@goodmis.org, 
	syzkaller-bugs@googlegroups.com, vincent.guittot@linaro.org, 
	vschneid@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_162447_314405_29117557 
X-CRM114-Status: UNSURE (   4.35  )
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

HEAD commit:    950b879b7f02 riscv: Fixup race condition on PG_dcache_clea..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=137aaec0c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b3cd714c8e9a6e01
dashboard link: https://syzkaller.appspot.com/bug?extid=42670398d6ddb118138f
compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+42670398d6ddb118138f@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	0-...0: (1 GPs behind) idle=36ec/1/0x4000000000000000 softirq=6589/6590 fqs=9960
	(detected by 1, t=30504 jiffies, g=14713, q=4 ncpus=2)
Task dump for CPU 0:
task:cmp             state:R  running task     stack:0     pid:2746  ppid:2744   flags:0x00000008
Call Trace:
[<ffffffff834348b8>] context_switch kernel/sched/core.c:5244 [inline]
[<ffffffff834348b8>] __schedule+0x624/0x1254 kernel/sched/core.c:6555
rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	0-...0: (1 GPs behind) idle=36ec/1/0x4000000000000000 softirq=6589/6590 fqs=28261
	(detected by 1, t=122009 jiffies, g=14713, q=4 ncpus=2)
Task dump for CPU 0:
task:cmp             state:R  running task     stack:0     pid:2746  ppid:2744   flags:0x00000008
Call Trace:
[<ffffffff834348b8>] context_switch kernel/sched/core.c:5244 [inline]
[<ffffffff834348b8>] __schedule+0x624/0x1254 kernel/sched/core.c:6555


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
