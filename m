Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810D8C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iPY/CigHlRg2TcuuW+ZY4SyuvkYkL4gCMGHDJsuDbUQ=; b=Nsk
	hmGcwN0KrPNHga7naTYjllULG9WUc64Z0C/F/gzblVNyGsiT6h9HwjQZvyiGr1eR7n+C1wH7Fh25B
	M4sRy4J90FqNl5BE6AhbubnxKb/JfEdG7qzkOYTqoB92U8RbvEnqHcZ5/2TZjgPb1qvHKz/7OinVO
	DFcQnYAElCvLXgQ4lLVn2hEmb5tPEzJsrFerEnkKCzgkpGfMnl0hLuTe2CE5/VKYu4AvfZWQHY9Qs
	TRdzatcClJDyRFLXx/7zJXkdy0hQoHYSz9fw2v0eHpanVKKQF/na6i9fUReM8mmrW2U8hDwY/+3g/
	niBB58BCbptZikI/gevVxOPxM3WEuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r825Y-005ysu-0d;
	Tue, 28 Nov 2023 17:41:36 +0000
Received: from mail-pj1-f70.google.com ([209.85.216.70])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r825U-005yrc-2e
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 17:41:34 +0000
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-285d331c6f7so3685575a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 09:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193291; x=1701798091;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BkEYdg80n5QmZ9M3sVkj8twe3NdTRbkqBQOuaWs2Wyc=;
        b=KDpZwKOe2WIkrmDrWqc7sJUPqV2Z25sOz2rb86vzMhCsw7aJ5e8bPsP/8v6f6vCa+7
         qg7fGK+6gHl9jLdxcagojWZxwCTnP/JCPOieeDewG3ItEUTJkXwfD5/ja53b2LmRW2cm
         EBT65UAAA5jkSPHOVlA+cDKGXEaJLCOKVVv6QnGOrAkM1G8p7AriPzFoDfgZJssXVxvo
         yX8gPJ7SX7GyrdIgSPu2xPRJQhbsSch2CY6I9igm+QxLLjbhWUzBfSUMJlcNbIaSl5Ni
         qEwLIRpWGQYbWKuwtR3tRfcF00Gq4NQaVEQdztays/Y6winxo41HwgNWD++E4Cp15kkm
         UC/Q==
X-Gm-Message-State: AOJu0YxWYjJhnqPu2Obol3AXxuTN/l9lfQwcRTMTfbtueFNh1HSpHmh1
	uk9H46ecFglkcD14y9ANipfEtS47bB1NbsZvCykONCLejnpl
X-Google-Smtp-Source: AGHT+IE/0vVhrm7fyHGwK+pmdURhkT7cCWDQCOR1WD4Yu7LK1zJK3cQJApu+liKsWPAqS82O0Z1Aim9PtKvcJt16L9wyGcIQIUvi
MIME-Version: 1.0
X-Received: by 2002:a17:90b:23c2:b0:285:67e4:eb3f with SMTP id
 md2-20020a17090b23c200b0028567e4eb3fmr3276518pjb.2.1701193291022; Tue, 28 Nov
 2023 09:41:31 -0800 (PST)
Date: Tue, 28 Nov 2023 09:41:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ce4a27060b39ed34@google.com>
Subject: [syzbot] riscv/fixes boot error: failed to read from qemu: EOF
From: syzbot <syzbot+2c2a76232878c44e0eae@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_094132_860914_21C1838A 
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

HEAD commit:    3ca112b71f35 Merge tag 'probes-fixes-v6.7-rc1' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=172d3d0ce80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4a49b764b9bf9b2
dashboard link: https://syzkaller.appspot.com/bug?extid=2c2a76232878c44e0eae
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-3ca112b7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8564c1899f29/vmlinux-3ca112b7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ee82a338dbc7/Image-3ca112b7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2c2a76232878c44e0eae@syzkaller.appspotmail.com



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
