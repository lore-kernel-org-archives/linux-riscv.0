Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAE7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnaVNPoTKJco3jiMPVpBWFrg55TURtzwtVJPPabkDLs=; b=efU0RIp/z2werO
	8TSVObYw3pZJxlDjoevhcSmT12XecC3bi7XN1cW3zUhXvxY6YwOchN7Fd6fveuYvUWzpx8ccak4Vi
	iATvL7Y1al4tFWi5xlCgFMzkzLYBB1lwldAMce3x7lBSBjUZtLJ9KLppfBkXxRPZYlta8rFlDZfFL
	Q4CH/i+kuEWBX0Qzh/FQlFG8CVfrUIYJ7HciWgF9VVrnFqvEz6gdswmtE8pQTXgyMMPhlTm6M04ZY
	BU+9j+gooXmi8szJ1OjBml1uW4wa/7u124y/tTY3CV5+ztHmjIBhBV0nIVRXagNE0OkPtVXa4HrMo
	3eVQ3qaYddEVpRoKaCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkKSl-009qrQ-RS; Fri, 29 Apr 2022 06:50:47 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkKSh-009qpt-Vq
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 06:50:45 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id
 s12-20020a4aeacc000000b0035ebb6d1a5fso99873ooh.3
 for <linux-riscv@lists.infradead.org>; Thu, 28 Apr 2022 23:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+XC6XJ22D0S1cH5HWUA5JVybXpxIUxsIoXafbiib3Y=;
 b=hCoZTDIK9MHdaFZJjHUovQmzkcH/OG1a9pfOJabjPGfK4LgBp8KEr/gPwaMmIk84E+
 nPkT0d4qOJ/Qm7mz5qpWFvnY4j//b3rzhZypAOfparLMkWEtFgNAZZVNB/HHg/7rjLQT
 cNIFTtfLm9Yge/QDPNZnxQIAEWkXoUKiLzRzRWYksdH0unIifhwWSzu0wI3xqxRly8OE
 MhEK2M0+bS1FxEBWJn17uLzxS/Rk6+XbFnT7SSSdDGxnKT53gRN5X856M63kMiuuLB4U
 G/3Rh3q/B+mIJiMKMjHzrLrCrrZb+iAm44q/s/G4hAoGsIaUxLwDv9d2ZiMHRn884HpA
 21Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+XC6XJ22D0S1cH5HWUA5JVybXpxIUxsIoXafbiib3Y=;
 b=5QGxtm7OABy8okunOm6nKqsxIORc5fBegvh8YNrccD2yy78/OH9vRGHOY8Cf++IMRb
 HQaqj7K0uy/4a8NXf0YjploPDfFDqS2L9Ei1b2bp9xJcPqKAzIaTwypnCZDqcntJGc32
 4ADy5UOPFKKXDDIvBp+0dZ/6DKAPF415aajfLNl2QqLKjA17PtQ+Lis3ge8sAkbe/c4Q
 PvNlpaRIdbUFhLFdO5aHDgy1FtoK99oXU4FJ7NS9FRbUcyT0YGl+k5lfhIvc7wtCsgkg
 A4Ik5hdJAaHuVvtgQxpvxzWxZfi4KvtwC3xuNH8/ghMSyctxUs8OLLA/mC3V++k6bEfO
 2LDg==
X-Gm-Message-State: AOAM531OOnLOS/A8/Ez/hroitRprVxtRdf1/WeL45y17ODS3qS1KiBKd
 oyqQfbfom/VWRgjqnWeisvPs1NayK2MDbfJRpGqZsw==
X-Google-Smtp-Source: ABdhPJxDJgXvFfv5EMw3Jg6MkbEZ1iKwq9S2dgjZGHQgoTY2PhT+EvLpdbq0aBy9XYREWG62rYbwl0YydZUwfE8jRKc=
X-Received: by 2002:a4a:ad0a:0:b0:35e:79da:30c7 with SMTP id
 r10-20020a4aad0a000000b0035e79da30c7mr7353381oon.53.1651215039520; Thu, 28
 Apr 2022 23:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000001044205ddc55870@google.com>
In-Reply-To: <00000000000001044205ddc55870@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 29 Apr 2022 08:50:28 +0200
Message-ID: <CACT4Y+Z=+u_HdmJUcRJ6e0srvqh4pk273CC2C3AmfH9B1Z=o+A@mail.gmail.com>
Subject: Re: [syzbot] possible deadlock in do_page_fault
To: syzbot <syzbot+f8181becdab66ab4b181@syzkaller.appspotmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: ebiederm@xmission.com, keescook@chromium.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_235044_061642_ED918E92 
X-CRM114-Status: GOOD (  18.82  )
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

On Fri, 29 Apr 2022 at 08:42, syzbot
<syzbot+f8181becdab66ab4b181@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    0966d385830d riscv: Fix auipc+jalr relocation range checks
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=1128ae72f00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6295d67591064921
> dashboard link: https://syzkaller.appspot.com/bug?extid=f8181becdab66ab4b181
> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+f8181becdab66ab4b181@syzkaller.appspotmail.com
>
> ============================================
> WARNING: possible recursive locking detected
> 5.17.0-rc1-syzkaller-00002-g0966d385830d #0 Not tainted
> --------------------------------------------
> dhcpcd-run-hook/3780 is trying to acquire lock:
> ffffaf8010608d18 (&mm->mmap_lock){++++}-{3:3}, at: mmap_read_lock include/linux/mmap_lock.h:117 [inline]
> ffffaf8010608d18 (&mm->mmap_lock){++++}-{3:3}, at: do_page_fault+0x24e/0xa3c arch/riscv/mm/fault.c:285
>
> but task is already holding lock:
> ffffaf8010608d18 (&mm->mmap_lock){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:87 [inline]
> ffffaf8010608d18 (&mm->mmap_lock){++++}-{3:3}, at: setup_arg_pages+0x1aa/0x4b8 fs/exec.c:793
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(&mm->mmap_lock);
>   lock(&mm->mmap_lock);
>
>  *** DEADLOCK ***
>
>  May be due to missing lock nesting notation
>
> 1 lock held by dhcpcd-run-hook/3780:
>  #0: ffffaf8010608d18 (&mm->mmap_lock){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:87 [inline]
>  #0: ffffaf8010608d18 (&mm->mmap_lock){++++}-{3:3}, at: setup_arg_pages+0x1aa/0x4b8 fs/exec.c:793
>
> stack backtrace:
> CPU: 1 PID: 3780 Comm: dhcpcd-run-hook Not tainted 5.17.0-rc1-syzkaller-00002-g0966d385830d #0
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
> [<ffffffff8000a228>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:113
> [<ffffffff831668cc>] show_stack+0x34/0x40 arch/riscv/kernel/stacktrace.c:119
> [<ffffffff831756ba>] __dump_stack lib/dump_stack.c:88 [inline]
> [<ffffffff831756ba>] dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:106
> [<ffffffff83175742>] dump_stack+0x1c/0x24 lib/dump_stack.c:113
> [<ffffffff8011404e>] print_deadlock_bug kernel/locking/lockdep.c:2956 [inline]
> [<ffffffff8011404e>] check_deadlock kernel/locking/lockdep.c:2999 [inline]
> [<ffffffff8011404e>] validate_chain kernel/locking/lockdep.c:3788 [inline]
> [<ffffffff8011404e>] __lock_acquire+0x1dcc/0x333e kernel/locking/lockdep.c:5027
> [<ffffffff80116582>] lock_acquire.part.0+0x1d0/0x424 kernel/locking/lockdep.c:5639
> [<ffffffff8011682a>] lock_acquire+0x54/0x6a kernel/locking/lockdep.c:5612
> [<ffffffff831ab656>] down_read+0x3c/0x54 kernel/locking/rwsem.c:1461
> [<ffffffff800117d4>] mmap_read_lock include/linux/mmap_lock.h:117 [inline]
> [<ffffffff800117d4>] do_page_fault+0x24e/0xa3c arch/riscv/mm/fault.c:285

+riscv maintainers
this looks riscv related

> [<ffffffff80005724>] ret_from_exception+0x0/0x10
> [<ffffffff80c0069a>] __stack_depot_save+0x40/0x4b2 lib/stackdepot.c:360
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000001044205ddc55870%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
