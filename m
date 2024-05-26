Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E4FC25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 26 May 2024 23:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eLsQVfOQBIi56pFVGhUbbufMIKOn48/LftM3lsWNOaA=; b=FUW
	U3KmZeNZsOTmsLXeSSfQx6yAGK561NmsZ9+sJQR8kqlfzQ9UqQJcYTO5mj8LcwLK0RWbYjdr9dSCu
	a9B4g6cr0F4Dja3PEiWEZb4oU+qM3l6a9P06EhQym7rKF27IYBfyZQm+78vYPhYaKx/G+byKKDXdi
	UCx6K/SPL5spsvJ/ambeZPRoCKpZxKs6cZ4oDzoRJYQSHCbk1kJ3vKmjsndaW2/uVvxI4ImH99g8+
	niqyzg39cuBa/xA1DzrXb1sSLQ/AilesotOaj+qcox63+ChpZFQ44isthpQjO6NKHkes+TXDnSEvT
	Sm94eAaDMIXLBChhXJa6iw2aLFjzGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBN6P-0000000DOWv-2MoL;
	Sun, 26 May 2024 23:16:33 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBN6L-0000000DOVL-26oO
	for linux-riscv@lists.infradead.org;
	Sun, 26 May 2024 23:16:31 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3738836578aso21593625ab.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 16:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716765383; x=1717370183;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oC8x2Dny6NMl03OjByychK0bgBBN5LCFjldcNIPARlc=;
        b=bZyNn3fXjikBqBZIRwMQ4+rlHC3UmVdNvLfrt/bM6Y4bKAC0UH3EfCc/EJmKBuCaCF
         MwuOZdduXjTwFfdid2dEfz3WtLtqRx+mgfBecHw5Q69sb9+13ksbTQdVAIt/zE+qasI3
         NxaWlRq3HUKEdiKrHb5/h9v6g9Nyq/hrpadQ6aLxHFqDP1qnWd72cWjPOGAB7KOXcpbK
         SxpumEUmDhi5zeJjlogyXcK2mwzoCCmKzyZOoxXrl0Mg18qiSPXRkisq1BFyTJiH3DVN
         jW7j25mYTvmN4Oz12WKyVnyBRMlVKD7kz7KK6a6yA64iDEV7yjJQ3uvP7tN1iWXa2Qdw
         9iNg==
X-Forwarded-Encrypted: i=1; AJvYcCXIaDoDQO3SSIUONycpQER5qJrUCpz31sWXmTUt5D2kfEhZVzKa82ImwhOfjoJzhEr3NUD5k9K3xI/i5yneafyDAbDxsvRZ396V5eOWsvAG
X-Gm-Message-State: AOJu0YyQNQPJXnDP52A2NPrukbelkujOCqFyXg0GkLq/j+NPY5UgPkWI
	Q2nbW9puheSQsV7/ove6MMhBlLRUcwgTRGM+gEj3R5yw+4vcDi9NyghaFFioFApdp7Ljwx01HM4
	KdKxnd80BIcU95Pcfrh2/q1Jgr+XCkV7xQ0AImE4Bl6XgZNJkAH3icw4=
X-Google-Smtp-Source: AGHT+IFi8sbn2Y2eQ+ZWTIDbmXh9+hc3xfhZvQ/D/UMAgjOfQHiJed5gSvuonfPxn/POpRN/+WvhIYkvC+nvzIMbcv6LnufCv8KR
MIME-Version: 1.0
X-Received: by 2002:a92:ca0d:0:b0:36d:c039:a51a with SMTP id
 e9e14a558f8ab-3737b3ed18cmr9312675ab.5.1716765383294; Sun, 26 May 2024
 16:16:23 -0700 (PDT)
Date: Sun, 26 May 2024 16:16:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d58eb306196396c1@google.com>
Subject: [syzbot] riscv/fixes build error (2)
From: syzbot <syzbot+55235599b5a8c657dac8@syzkaller.appspotmail.com>
To: anup@brainfault.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_161629_584994_066F669A 
X-CRM114-Status: UNSURE (   4.68  )
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

HEAD commit:    0bfbc914d943 Merge tag 'riscv-for-linus-6.10-mw1' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=1471118a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c599cb5e39a20f2
dashboard link: https://syzkaller.appspot.com/bug?extid=55235599b5a8c657dac8
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+55235599b5a8c657dac8@syzkaller.appspotmail.com

drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many arguments to function 'riscv_ipi_set_virq_range'

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
