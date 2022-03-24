Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3E1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wocvYvKfDvHLbXwUtossQxlRHqI4KjapZT+jiy1dk5o=; b=KXDIC47JGxoCSI
	5PxcZ6K4nzT8daz6fnyNlVsDh6E3ijKAT8S02N8d7qL5l0wjgqJr4Hpahfog9QCu5pHVSZWAMLBZa
	TsWREY2u1RihohXGuw4Xmq6uH6lgG/1tHVh58jnZJvnLhfYE59kk2PIkk9nuQ2qqKvXsJWGIr7UyT
	MGN4OWcqJnbfTu2t+TAus4mSsmRqpC4tgqYJWsdnNPQR5JgcTFbue+CAh4BhUNVlCLFuUhkTCsA+S
	+j/lE4Wn7CWcQNVVUQHaBH8fxGjo3bRoK8p/vF4nWXSeBXbCEiJXraf/9msgzu2gOi0kQcf+9UlZ1
	i4W1oH2bZihH+7aQTQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXOH3-00Gp25-Cj; Thu, 24 Mar 2022 14:17:13 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXOH0-00Goxx-1B
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 14:17:11 +0000
Received: by mail-oi1-x229.google.com with SMTP id v75so5029982oie.1
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7IwhRmQLD4pp4REKGSz+HZGQaSrUkXBhHYyruYo/qME=;
 b=ENyBI7OHrQ9U1iGH+RFRx4UF+zqisNu3doWA8azwBOYOu3TtAGgBzzB4sXSOK2rTcV
 UewH9o32bIcY3EYoxmDeKl0ESim0eDlKgk35w9KUsPPYIiLqkvTx0C73zmO52gvWYIVg
 9Dg67nyKuYVldVU5tHrxReAXwJ//p0tEg2SGend/NoFPNO2YxKVrzJ35ojxZYYQRvUsa
 LEdn2mSbuBcjbV090AT+oynrbfNjp9w/J1KnAmDztakJT6QWYysSZdw4VHxpvDjyP1iW
 Ky2RXmnVcKuh9NGZlqjS28cuGvFZG5kfsWJGIWmCdc1kS+UoIgrU1gb4hpRnzE5lWQP+
 MXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7IwhRmQLD4pp4REKGSz+HZGQaSrUkXBhHYyruYo/qME=;
 b=s9pbhCW8LrHj5Ie5s+8HkZ/i0Lq7Oob7bNQIJFAP9z0SdA+kT/qF9ICI6147WTdAY4
 bVyjpogVUbJgoulRbYOsLdb/QmlcBAn9APO+jvlZE3KGVJfSCN57ujbFlspdiIRxF2/Z
 JunpkOAW+qXVI6pIC4bsY2tseF9IhxyRItW94QvDAjUGCUKNMv9qEOEK4TyKRG0nx0F8
 HZMJAlov6dnHA6bxAi6heDxv7NBaQ9EFfBc01sGeuNRnXObgv9VMNHTJAnYoMffjrwqb
 1E3EJPX9Ztls4ytudNti46yhV4e4FfUm3xpk5KX9yURbhQ0ecFFcrMLcCw5xC9jLvlNU
 BZPA==
X-Gm-Message-State: AOAM533VawCT2aGwMZyBBfYsCGsSHgTMYxiF45cF7Sea61+77B/y6iV5
 PbfrWx/SAeTsLrXrThLbrc0IuaXGOPDBE6AiXCjzrg==
X-Google-Smtp-Source: ABdhPJw4KMNpkELCzWuWWIZqap4aNQL9WmccQBs/OANy5gYAA71/5r+3JUclC7+zoNhjg/9kJrvMPTk5XJL0sbCLsQI=
X-Received: by 2002:a05:6808:16a4:b0:2f7:1fd1:f48 with SMTP id
 bb36-20020a05680816a400b002f71fd10f48mr1156736oib.163.1648131413996; Thu, 24
 Mar 2022 07:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000644f1a05daf71983@google.com>
In-Reply-To: <000000000000644f1a05daf71983@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 24 Mar 2022 15:16:42 +0100
Message-ID: <CACT4Y+bSazxGmb=F4ouAEK+N=fTrwTpZHasPo2i_E6eqRPfAzg@mail.gmail.com>
Subject: Re: [syzbot] KMSAN: uninit-value in do_user_addr_fault (3)
To: syzbot <syzbot+6684a9d1b4d61d0b8f3e@syzkaller.appspotmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: akpm@linux-foundation.org, elver@google.com, glider@google.com, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_071710_090309_AF61665C 
X-CRM114-Status: GOOD (  13.35  )
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

On Thu, 24 Mar 2022 at 14:48, syzbot
<syzbot+6684a9d1b4d61d0b8f3e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    724946410067 x86: kmsan: enable KMSAN builds for x86
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=1734f916700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=76f99026248b24e4
> dashboard link: https://syzkaller.appspot.com/bug?extid=6684a9d1b4d61d0b8f3e
> compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14b1cbf2700000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=131d38a6700000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+6684a9d1b4d61d0b8f3e@syzkaller.appspotmail.com

+linux-riscv as there are some riscv bugs bucketed here as well:

BUG: KASAN: slab-out-of-bounds in walk_stackframe+0x11c/0x260
arch/riscv/kernel/stacktrace.c:57
Read of size 8 at addr ffffaf800bd53d60 by task syz-executor.0/2044

CPU: 0 PID: 2044 Comm: syz-executor.0 Not tainted
5.17.0-rc1-syzkaller-00002-g0966d385830d #0
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff8000a228>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:113
[<ffffffff831668cc>] show_stack+0x34/0x40 arch/riscv/kernel/stacktrace.c:119
[<ffffffff831756ba>] __dump_stack lib/dump_stack.c:88 [inline]
[<ffffffff831756ba>] dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:106
[<ffffffff8047479e>] print_address_description.constprop.0+0x2a/0x330
mm/kasan/report.c:255
[<ffffffff80474d4c>] __kasan_report mm/kasan/report.c:442 [inline]
[<ffffffff80474d4c>] kasan_report+0x184/0x1e0 mm/kasan/report.c:459
[<ffffffff80475b20>] check_region_inline mm/kasan/generic.c:183 [inline]
[<ffffffff80475b20>] __asan_load8+0x6e/0x96 mm/kasan/generic.c:256
[<ffffffff8000a052>] walk_stackframe+0x11c/0x260
arch/riscv/kernel/stacktrace.c:57
[<ffffffff8000a4a4>] arch_stack_walk+0x2c/0x3c
arch/riscv/kernel/stacktrace.c:146
[<ffffffff80162ac8>] stack_trace_save+0xa6/0xd8 kernel/stacktrace.c:122
[<ffffffff80473abe>] kasan_save_stack+0x2c/0x58 mm/kasan/common.c:38

If risc-v stack walking is intentionally imprecise, then it needs
kasan annotations as other arches do for async stack walking. Or
otherwise it looks like a stack walking precision bug.





> =====================================================
> BUG: KMSAN: uninit-value in arch_stack_walk+0x1ad/0x3c0 arch/x86/kernel/stacktrace.c:21
>  arch_stack_walk+0x1ad/0x3c0 arch/x86/kernel/stacktrace.c:21
>  stack_trace_save+0x43/0x60 kernel/stacktrace.c:122
>  kmsan_save_stack_with_flags mm/kmsan/core.c:80 [inline]
>  kmsan_internal_chain_origin+0xa9/0x110 mm/kmsan/core.c:217
>  kmsan_internal_memmove_metadata+0x1f2/0x2e0 mm/kmsan/core.c:165
>  __msan_memcpy+0x65/0x90 mm/kmsan/instrumentation.c:127
>  sock_write_iter+0x605/0x690 net/socket.c:1062
>  do_iter_readv_writev+0xa7f/0xc70
>  do_iter_write+0x52c/0x1500 fs/read_write.c:851
>  vfs_writev fs/read_write.c:924 [inline]
>  do_writev+0x645/0xe00 fs/read_write.c:967
>  __do_sys_writev fs/read_write.c:1040 [inline]
>  __se_sys_writev fs/read_write.c:1037 [inline]
>  __x64_sys_writev+0xe5/0x120 fs/read_write.c:1037
>  do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>  do_syscall_64+0x54/0xd0 arch/x86/entry/common.c:82
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> Local variable regs created at:
>  __bpf_prog_run32+0x84/0x180 kernel/bpf/core.c:1796
>  bpf_dispatcher_nop_func include/linux/bpf.h:785 [inline]
>  __bpf_prog_run include/linux/filter.h:626 [inline]
>  bpf_prog_run include/linux/filter.h:633 [inline]
>  __bpf_prog_run_save_cb+0x168/0x580 include/linux/filter.h:756
>
> CPU: 1 PID: 3474 Comm: syz-executor178 Not tainted 5.17.0-rc4-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> =====================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
