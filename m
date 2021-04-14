Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DE0C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 05:56:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4DC600CD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 05:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A4DC600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oUR8CudOl2UFFqe/FA7TDed4vy1svr/fwr38vgL+FFg=; b=Jf7MHaGhiBmxNAXTBeSRKv8v7
	4/QsWUyJmwVEtDqkE6UNim1gFcl8CF1CLZQFwVOIT8d5cXbO8QGFcG6Ax/SOL+C0eLJ2j9Vaxq1Xi
	8aG/CBe9qsiK4BCo8V7Csjgb7axqJHrOx6nGh8FSRdMqL2nkodlDPxRfDGbrDtioG3grhxAsOV+1V
	MHvlLEEvfIYzwTliBaP/JNOwu1o5ZVK2A4Jm5peQh9qeLacKYbQzvEWA99J8fjnljeXyXAFkttLDh
	918H9nUik1x3kMul9j5dACwwxbJQP8rbyswpvzre0co9AjTKTfVsAPX5qGiUoSw9AQD65TPzgqsKI
	15lQpu4Wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYVw-00Bavw-KY; Wed, 14 Apr 2021 05:56:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYVr-00BavY-Nx
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 05:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rpmBcb5+riYcQ09lMoWDWD17po/qBOnbM3ovsGdVcCI=; b=1p+mEkmVo9DGVE7pACNRqF/8w+
 AXB8mR4/FutuDnP76IX5+5T7saS0rMa3mVynCtMdrB7/5o0T/D38FpcxDKbLwbbuFzUU74NUXEU2N
 /89Gyu2J85BBgqJSeVUivuNq+Vt0kq/E1TyfELLi4Sq7pkO63A/oSxURT9iXXyw+JBR4KM2UqRI2N
 BM/2P4zBMi205bk073eMH/H4xSuA6NndlpUtJ3jt4ck/8/cN2UNdpcqKV83881ZSTFx721CF9yOX5
 Kzk1oDOn/hRdiZ9cmUa9dEbx6h23Y13uCYZeahbOu2SZ3/y1VxJM4HI5Jkq5S7wrg8DedKGdMydaE
 /iDz1Ypg==;
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYVo-007Vda-Pq
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 05:56:30 +0000
Received: by mail-qk1-x732.google.com with SMTP id o17so11907907qkl.13
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 22:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpmBcb5+riYcQ09lMoWDWD17po/qBOnbM3ovsGdVcCI=;
 b=CZGYoCfV6X3u4WS3IyOIPOIfaLqdtwbBfhzw1cLbiY63OqV49QsU/vkWzpUSDypmdM
 JSg2VMRQ1G1SjOVn9LdYZBy3CBd6DjDFRx+62xU+/TOiAByV5nPCp/MxFKRhPT4pc4Bg
 GkcxC80nzLq4eXDE+uKZ1K593Od7H8vZcdL1XxRZ/8C8r9mUcJG1DhQTO79byTgAlYWH
 jmA3GzX66p9Wwg1AT4xyJTg6DhbbzVGRS4afb52z/E4R/ubku1WllHwHFCqYH/xAVysJ
 QeVgtRmUMvDR0AaJBC/uJEaCJBIeqC3BkB6Vo6ALVX6AFtM6aBP17HrANXe6nbTgRUlx
 Wl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpmBcb5+riYcQ09lMoWDWD17po/qBOnbM3ovsGdVcCI=;
 b=jkRB46qnqYseCUktk/WezeCyHnqj71mOGdl/4Y1wVUi753iE6dTGIAfv+Is3Yy6DGn
 Dv/jxqWmVKNvr7fVuzH+JP56wyttV/Mccx5sZVLe/5Xe2EOBRhRESLErzeOcBgVXAT7F
 ie1iPwI+o7iINUD422nYORqPWB9OjoUH1dPFY3l7hSQZX6wQALOA2nmejY58PvMi9s8W
 9xdXVTb9ylzBOsSCC5WUlaIEe3OiJWBb5Z1I8FKpnEEJTxaI/fR7q9g21ZYuf7I8fCS/
 rOH271Q1cF5k89ThHiRDqTBGDg3L3I6Rm57eY5v6PLPJmfk/P6pfxKiJ8F/gB0sbIX7M
 vBpQ==
X-Gm-Message-State: AOAM533+Jfx+OKrKG3VyalkKbZn0oUIXbWgzl93ZY0PTKzJoJk86CTQU
 QGeh5PAxilQfKWinQeL/F4YbJXkyWOL+Wq/L658C+Q==
X-Google-Smtp-Source: ABdhPJyh9eOCRNmyeCJlLv8tMlSLBvToq5IFa6Z6IO7DjEqb5ZELI1ItA7hEiaKTPf0Qqn1qTFhbFdXl7omzzhO68Jk=
X-Received: by 2002:a05:620a:243:: with SMTP id
 q3mr16596179qkn.501.1618379784650; 
 Tue, 13 Apr 2021 22:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000009862e005bfe859c8@google.com>
In-Reply-To: <0000000000009862e005bfe859c8@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 14 Apr 2021 07:56:13 +0200
Message-ID: <CACT4Y+YxAC3uV8UFKFn3mDiCGdo=z9xwSKS_SK+rRA+8=4RpuQ@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in get_wchan
To: syzbot <syzbot+0806291048161061627c@syzkaller.appspotmail.com>
Cc: Dmitry Safonov <0x7f454c46@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, chenhuang5@huawei.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_225628_865377_A4CE59BA 
X-CRM114-Status: GOOD (  20.08  )
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

On Wed, Apr 14, 2021 at 7:52 AM syzbot
<syzbot+0806291048161061627c@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    b2b3d18f riscv: Make NUMA depend on MMU
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=12b59d16d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=81b3e7c68dad6e
> dashboard link: https://syzkaller.appspot.com/bug?extid=0806291048161061627c
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+0806291048161061627c@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in walk_stackframe arch/riscv/kernel/stacktrace.c:60 [inline]
> BUG: KASAN: use-after-free in get_wchan+0x156/0x196 arch/riscv/kernel/stacktrace.c:136
> Read of size 8 at addr ffffffe0058e3d90 by task syz-executor.0/4667
>
> CPU: 1 PID: 4667 Comm: syz-executor.0 Not tainted 5.12.0-rc5-syzkaller-00721-gb2b3d18fc20e #0
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
> [<ffffffe000009706>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
> [<ffffffe002a5f182>] dump_backtrace+0x40/0x4e arch/riscv/kernel/stacktrace.c:113
> [<ffffffe002a5f1b2>] show_stack+0x22/0x2e arch/riscv/kernel/stacktrace.c:118
> [<ffffffe002a68a3e>] __dump_stack lib/dump_stack.c:79 [inline]
> [<ffffffe002a68a3e>] dump_stack+0x148/0x1d8 lib/dump_stack.c:120
> [<ffffffe0003bc802>] print_address_description.constprop.0+0x52/0x31e mm/kasan/report.c:232
> [<ffffffe0003bcd24>] __kasan_report mm/kasan/report.c:399 [inline]
> [<ffffffe0003bcd24>] kasan_report+0x16e/0x18c mm/kasan/report.c:416
> [<ffffffe0003bd588>] check_region_inline mm/kasan/generic.c:180 [inline]
> [<ffffffe0003bd588>] __asan_load8+0x6e/0x80 mm/kasan/generic.c:253
> [<ffffffe000009a98>] walk_stackframe arch/riscv/kernel/stacktrace.c:60 [inline]

If it's walking the stack of another task, then it needs to use
READ_ONCE_NOCHECK. See x86/arm64/s390 for examples:
https://elixir.bootlin.com/linux/v5.12-rc7/A/ident/READ_ONCE_NOCHECK

> [<ffffffe000009a98>] get_wchan+0x156/0x196 arch/riscv/kernel/stacktrace.c:136
> [<ffffffe000553364>] proc_pid_wchan+0x48/0xa4 fs/proc/base.c:390
> [<ffffffe000554458>] proc_single_show+0x9c/0x13c fs/proc/base.c:774
> [<ffffffe00045000c>] seq_read_iter+0x2e0/0x8f2 fs/seq_file.c:227
> [<ffffffe00045081e>] seq_read+0x200/0x298 fs/seq_file.c:159
> [<ffffffe0003f9210>] vfs_read+0x108/0x2ac fs/read_write.c:494
> [<ffffffe0003f9724>] ksys_read+0xb4/0x1b8 fs/read_write.c:634
> [<ffffffe0003f9850>] __do_sys_read fs/read_write.c:644 [inline]
> [<ffffffe0003f9850>] sys_read+0x28/0x36 fs/read_write.c:642
> [<ffffffe000005572>] ret_from_syscall+0x0/0x2
>
> The buggy address belongs to the page:
> page:ffffffcf0216b8c0 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x85ae3
> flags: 0xffe000000000000()
> raw: 0ffe000000000000 ffffffcf0216b8c8 ffffffcf0216b8c8 0000000000000000
> raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  ffffffe0058e3c80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>  ffffffe0058e3d00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> >ffffffe0058e3d80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>                          ^
>  ffffffe0058e3e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>  ffffffe0058e3e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ==================================================================
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
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000009862e005bfe859c8%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
