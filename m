Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DC9C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nPwMX0zvs0dg1ckmPfR/7gxq8JKpZj2/iz0EheU3B18=; b=A8A
	ZR84b7mqicDeSExVMHKa6o0NHJMrRtll/+km/IkkZjrHycryMMzqsX9O5lXfyfS/mFz+yCeenC/jd
	hoj0vbJRZiAr0NeZe62e9B8dMkAhqzpLoB3MiaVniewu3MwRnr/vqFu+USnnHBn+jh+jDGlWxxa9v
	5fvEzONr48teHhKNSbFpV6yHY9f0H0ynTnWwmlsuVqktro+NTpJbL+/Fzgjf+6G8TcYR39bJRI/3y
	3ssBjqw6cSnEkE/qPSisOpKLhYDT83R+K2HSfBQM/AWD+Mb++lO+hq9b99syH/uSYIjTVaGVn1Xkg
	diGRgMhRTqYvJez6Kak5OfT045+Ig+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpl6a-0000000D5ZK-1Epi;
	Thu, 28 Mar 2024 08:27:24 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpl6W-0000000D5Wx-3lDc
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 08:27:22 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3689d047f4eso6314865ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 01:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711614437; x=1712219237;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7LtcZu6Gv0nqzHmczcIx7im5xvOcwCAJaiKZxY9O5s=;
        b=axw6nRNkU9NP2kb/D38VC6A3jEZgc4Fl0pp73IyHpeqTHELcHZUhaue2RYYJtoLS/6
         ITOj4Rukg6tcmQzXQIArIXc+EBZn+wH+NSWdVkGbhJ2GxzgkIZT4w89fIorpTfJ3K3XG
         DXoOijlutquvGbQj6Q3IUeZF4L9KFKMYFKFKFCumykGV8Ys3J1oHWaYytz58G4VBQek8
         6faqZXuDEjwvy8LB/FL1nPs/GTGdhTkFptbS88n1wytEASvrljrJrw07B5dgZFkVKWWm
         btdd3f+yHwl+IaSCDdzEoZH/UntyVmI54mo1NHhE3yIgkbRNnb6VOOn4WiqCHycCoKY8
         NXgg==
X-Forwarded-Encrypted: i=1; AJvYcCW19ideTjc6Pzd9ZUWsjrS2gJFBJudLL7VW0g+2kiira1qTMvW/8GPc/HI6NVXdYcUpr4+gMzD63NQ+q2/U8elKKk5B6sDpdnGyx/eq589n
X-Gm-Message-State: AOJu0YzEhI7KQQUpvJCFBRHYqz9XjxdOEpCvRjcd6FF+o+m1DFyKEldK
	jNVe4ZeSzcwce834OQqqd6p76Y+50WUmQbIBQAILMCfvQL5MJUJ2TUMoA2ZBREHNMUaohA6vxQE
	q1G63SzImv6xf8Hf28MKZX7FX3ZhUFxZXCXnKBGWV7CSo9CHR4ldN1Yk=
X-Google-Smtp-Source: AGHT+IEhu7EBwQJO0RH9od2MbxlSRSn5WV0Htc17+GWpseaHZK88iV4am8mKtxYsKyoKbDnAx0eBTUSQzgoOX1AFHB2d6EiqfiL0
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198c:b0:368:b289:38bb with SMTP id
 g12-20020a056e02198c00b00368b28938bbmr110263ilf.3.1711614437515; Thu, 28 Mar
 2024 01:27:17 -0700 (PDT)
Date: Thu, 28 Mar 2024 01:27:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008a75510614b44af1@google.com>
Subject: [syzbot] riscv/fixes boot error: can't ssh into the instance (3)
From: syzbot <syzbot+620209d95a0e9fde702f@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_012720_961689_A80A9546 
X-CRM114-Status: UNSURE (   4.63  )
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

HEAD commit:    653650c468be riscv: Mark __se_sys_* functions __used
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=1110f1e6180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=88360569be845301
dashboard link: https://syzkaller.appspot.com/bug?extid=620209d95a0e9fde702f
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-653650c4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2701bf6276c4/vmlinux-653650c4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aed54fe6b3d5/Image-653650c4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+620209d95a0e9fde702f@syzkaller.appspotmail.com



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
