Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95F4CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=w+TFRdxUy4pYH/BF4Sa61tE8yGK3rtYp7p5COJcoLNY=; b=mpP
	xMDItgcPzwdn8ybWDPDDVdwWGrCIEIHe0LJeD2wcW9EkQlajafEK4wJGquV7Gk3DpYpD70gadwMNy
	moElgr9krtf4Q2r+BIGDXcaMvUQhb7TvpBIVLxtmxhCE1SY2uQ2u0fiSwb59oxJg0YyWt6c8Xez2I
	OJwhbOj0v/X3QrsMTpGXZ9YR3maBaJUYNbGfTidUngxZ4g9OpRkXUWqkWeBw9Lg0vL3BZdWryPdTg
	3Q/ojCR1hOXbp/VJ6YWLPNgx6wWgVwqgvhFmu10zSR9t94V4E7CYtg3O8nEAIISfEp2PPD/D3hMFU
	uDSfO7Ihqp/+Z9yvp+/Q23TGNkFY5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZOq-00000003t9Z-3zU0;
	Tue, 29 Sep 2026 15:05:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZOp-00000003t82-3OHR
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=x0E20vkleRcsIAY0DG+XyTdUOXRLfM9oM468YAjqXhU=; b=HOGVxl8cc/M9IKZFMzIZN8yaDd
	gKX8r2D/XE4mhaUnNCiM8oUmBjRy45/b9fpSo0vNH7g6AvCGAM27iuiTCy+XKialjdKEzWcovQD87
	XZIGm4dJ/2kOQ54RBIpoTc685FbJTLD4tCqWUd5Vn/tBF1nak/WdgesiyoWmHXSIc2SLyKZ9Fx6v1
	6H+UnCfqwYO1t0WCTozgfllqOx18ZjvZbR4dlWJUhDbXMh5bo8j8rcFLPba8ti3NJ3B4Xj5fcqz/5
	8ifZ1+6cBKylyrIdJFhIWbPXCIReMqZBlBukED6wSkk3DMzemD18HHAFECZd4gvP6ZBzRM47WShBu
	hXb5g8nw==;
Received: from mail-oi1-f197.google.com ([209.85.167.197])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBZOl-00000002lx6-36Gc
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 15:05:42 +0000
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso6911923b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694336; x=1791299136;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0E20vkleRcsIAY0DG+XyTdUOXRLfM9oM468YAjqXhU=;
        b=q98fqW3bxSsiKJQdsjWOD74DCF8GwtEmHsiudrxXtp8NpVo+N2sFUafCmx/f1J2TbW
         wJh5O+hH1umr4Ox9lQf7h5WWDXrvf5f67JBM7+ya2EFIoGM71wORVfl0CFPYYUjPSgnf
         gVozFdHxwaK8644GYP2hhVL8V8xc4yt+W+F0O3xhcL/x4V1tMqiPSPTUqLz2ZW3fr5Rj
         DKu52JkasIaJQS7/Ok5XmoY5D+vkaYfTtEn8vrAs7qEUampEj6gAOT8CFQtiSIHwQ8lh
         a5+G3bSuhmjZFQHNzpXEgtY6SUjbrkNhXQpyQEgoxW0Xtai9GvPsKKbR3lJSYh5S1Yue
         AwNw==
X-Forwarded-Encrypted: i=1; AKwUvBxGEecYfTvrHN5OY56xopIP1FLT2kLHeCAHegc2D22Z52oXuitNJQTnruDZn/WdfaZllzLYmU8ifkJs3w==@lists.infradead.org
X-Gm-Message-State: AFuF++k1wZhSDCVrcDqx7tzAtJUyPMWUB/yALl5SbqcjMwFizmT5BPt5
	mB4jzyF+lP4qWg/j6Zlea90Fz37rBFKvMcL6j1Sjqe3MyR8JXm1n41nyIFh/HM2+AXBP3Sw/QHt
	JN7FsR3TnWT6tRs30NolV7HMqrYXuIimO3CLwEM4r2HU3CcgVy5m890tZq6A=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a9:b0:4d7:22cd:51cc with SMTP id
 5614622812f47-4d72aa5b173mr20199852b6e.35.1790694336530; Tue, 29 Sep 2026
 08:05:36 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:05:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abbd3c0.80e1c6cc.1e8e5f.0079.GAE@google.com>
Subject: [syzbot] riscv/for-next build error (2)
From: syzbot <syzbot+bb34359d01d7e695c1b7@syzkaller.appspotmail.com>
To: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_160540_171584_D7160CD0 
X-CRM114-Status: UNSURE (   7.09  )
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

HEAD commit:    a06776565b9e riscv: process: Use str_supported_unsupported..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=177d9325580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1c1b9a4a89432905
dashboard link: https://syzkaller.appspot.com/bug?extid=bb34359d01d7e695c1b7
compiler:       riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bb34359d01d7e695c1b7@syzkaller.appspotmail.com

arch/riscv/kernel/process.c:138:17: error: implicit declaration of function 'str_supported_unsupported' [-Wimplicit-function-declaration]

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
