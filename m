Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C746C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 05:52:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A404F608FC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 05:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A404F608FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m8rBXrDQEdBOzTlfFT9/mzNm4Nfclr768cnsi2trk4A=; b=N9Vtc+nV+0G5Wl
	X56pqmIqu34xO0Xr8hlU7vwXItpvyfBlWmNrW0eHQD+ejfwopdzobtEIgFFcllTgt0wtecgFS4a/I
	twAMU7HAZ3XWtTWlc7bMx1yFpJHwcwJ/h/jnqQAnPITsBYUocYR2WAGQbLq78tyWWwRhYbgE2/fCB
	SaAQOcFsaJjbkHuR9fnsDpZSidHk9UJANQQ/u4pJ4br8IzsQREdUPQHGTcnaRzm3Cu1uN0t7Dd95f
	r+SyBqc/+9swVOV1wdDJCEvUK+E6TF/kNYaXJ6tJLx9C4lQU2YNtK4GKIRJZvU7aP2T4f59kAQ+rX
	8lgP55WFk2+bNxiJsnmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYRy-00BaFT-6E; Wed, 14 Apr 2021 05:52:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYRt-00BaE5-MH
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 05:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:From:Subject:
 Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+m0E+t8NZADjC4EINZ+KB+2NMPsqESMoZ/gOC8zfLP4=; b=HE0jtgcW2U/IoSgbTya1lOygyt
 VH/GpXMo9qCulfbvgHnhUaRn8HOrUK+NvyHgq76w0vB1ABVdHnAG19X7EqgStmtwj09u5qlC5+xdf
 GdvUlJTs54/MBsKaaFAflNBGhyLHlP+DSTP7S3onstns2iSjDd0qISp5ZEGgHh1OlBRktNiXNX3kh
 oitv2kneoB0HGKRU4MQgGWmXHWy+Eb52qu6Ar2rdlIyO3B9u14xYrcWDQUxE2usP9+5grbXRplCh4
 VxUatJIuYkbJj6Z9Zw6/IOWuYvlmDmncFbcZR7/kIkaKxwbiqOZ2AdJ8Xffzwh1VammDcAalwpFFQ
 UCTU/Ljw==;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYRq-007VT7-Rc
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 05:52:24 +0000
Received: by mail-il1-f200.google.com with SMTP id
 v3-20020a056e0213c3b029016165a33c15so589205ilj.6
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 22:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=+m0E+t8NZADjC4EINZ+KB+2NMPsqESMoZ/gOC8zfLP4=;
 b=IINtMj0tlTREsr6PJRrPBFe9bnEScQF6QZ9iEYlexXZbG1dJbCPKmXRvcaDMO3dx4S
 bsm1FvwRfiP/n/KKKmDKwg+hMKFW/H4g+irbfLOI6C9WKmXGsXAzy2hKi07oM5OGEvCY
 gzNi+C1TNCPr7cB5b+vpZFO5SYTZXsNN0FuxA5zskTsvwZHfWF2jc4o/bt+c8yQs3QbD
 2Q7yGxa5bKwq/1DwqaKmyYAU0HgTuSzYz7UeuRmzopn+q/Rn9sNpDlhculgRm+b9u0fL
 1Xuap90raATTulKqXChyERIYPtLNmATRDYkp9ljw9XrNvbACdAw3WS0pTOHc9y5KD7kA
 RpSQ==
X-Gm-Message-State: AOAM531DBPXwKbYToE3hjqfsanxe3ZdzIsGEmFX5PoU2GZI8Dd3OvpE0
 l6RhM7oiVzColqsfBFfPDiEbXhMOeBgyxxySWcusQ3NAeyXn
X-Google-Smtp-Source: ABdhPJxhbk1xPLzGBuG8XeMEJVetZJW23+svXclqHEp0/RGeO8JYQM02hhRXPijmk6lEGf952Q2njMqLuqp6yGDHAB79j9D4ttPV
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1da:: with SMTP id
 w26mr30130358iot.170.1618379540028; 
 Tue, 13 Apr 2021 22:52:20 -0700 (PDT)
Date: Tue, 13 Apr 2021 22:52:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009862e005bfe859c8@google.com>
Subject: [syzbot] KASAN: use-after-free Read in get_wchan
From: syzbot <syzbot+0806291048161061627c@syzkaller.appspotmail.com>
To: 0x7f454c46@gmail.com, akpm@linux-foundation.org, aou@eecs.berkeley.edu, 
 chenhuang5@huawei.com, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
 syzkaller-bugs@googlegroups.com, wangkefeng.wang@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_225222_920361_97BF1311 
X-CRM114-Status: UNSURE (   4.86  )
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

HEAD commit:    b2b3d18f riscv: Make NUMA depend on MMU
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=12b59d16d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=81b3e7c68dad6e
dashboard link: https://syzkaller.appspot.com/bug?extid=0806291048161061627c
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0806291048161061627c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in walk_stackframe arch/riscv/kernel/stacktrace.c:60 [inline]
BUG: KASAN: use-after-free in get_wchan+0x156/0x196 arch/riscv/kernel/stacktrace.c:136
Read of size 8 at addr ffffffe0058e3d90 by task syz-executor.0/4667

CPU: 1 PID: 4667 Comm: syz-executor.0 Not tainted 5.12.0-rc5-syzkaller-00721-gb2b3d18fc20e #0
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffe000009706>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
[<ffffffe002a5f182>] dump_backtrace+0x40/0x4e arch/riscv/kernel/stacktrace.c:113
[<ffffffe002a5f1b2>] show_stack+0x22/0x2e arch/riscv/kernel/stacktrace.c:118
[<ffffffe002a68a3e>] __dump_stack lib/dump_stack.c:79 [inline]
[<ffffffe002a68a3e>] dump_stack+0x148/0x1d8 lib/dump_stack.c:120
[<ffffffe0003bc802>] print_address_description.constprop.0+0x52/0x31e mm/kasan/report.c:232
[<ffffffe0003bcd24>] __kasan_report mm/kasan/report.c:399 [inline]
[<ffffffe0003bcd24>] kasan_report+0x16e/0x18c mm/kasan/report.c:416
[<ffffffe0003bd588>] check_region_inline mm/kasan/generic.c:180 [inline]
[<ffffffe0003bd588>] __asan_load8+0x6e/0x80 mm/kasan/generic.c:253
[<ffffffe000009a98>] walk_stackframe arch/riscv/kernel/stacktrace.c:60 [inline]
[<ffffffe000009a98>] get_wchan+0x156/0x196 arch/riscv/kernel/stacktrace.c:136
[<ffffffe000553364>] proc_pid_wchan+0x48/0xa4 fs/proc/base.c:390
[<ffffffe000554458>] proc_single_show+0x9c/0x13c fs/proc/base.c:774
[<ffffffe00045000c>] seq_read_iter+0x2e0/0x8f2 fs/seq_file.c:227
[<ffffffe00045081e>] seq_read+0x200/0x298 fs/seq_file.c:159
[<ffffffe0003f9210>] vfs_read+0x108/0x2ac fs/read_write.c:494
[<ffffffe0003f9724>] ksys_read+0xb4/0x1b8 fs/read_write.c:634
[<ffffffe0003f9850>] __do_sys_read fs/read_write.c:644 [inline]
[<ffffffe0003f9850>] sys_read+0x28/0x36 fs/read_write.c:642
[<ffffffe000005572>] ret_from_syscall+0x0/0x2

The buggy address belongs to the page:
page:ffffffcf0216b8c0 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x85ae3
flags: 0xffe000000000000()
raw: 0ffe000000000000 ffffffcf0216b8c8 ffffffcf0216b8c8 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffffffe0058e3c80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffffffe0058e3d00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffffffe0058e3d80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                         ^
 ffffffe0058e3e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffffffe0058e3e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


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
