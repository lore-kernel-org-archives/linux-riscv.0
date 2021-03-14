Return-Path: <SRS0=fQzb=IM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9480C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 11:04:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47BFC64E57
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 11:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47BFC64E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5zndoTZGc4baaDDDGPxidem45RhFg5xhqtDYQe5f1fQ=; b=CKFRVtnrslcMvG22jjznV/wku
	zefsKFoJIDQWjm0XBL11Ulp3j8mrbdRDC6CWZE0YQahVhR8CiCJkImgtW4sDrbqWGnVdY2oKwK/P9
	ZPnM1Rh0g94CHJ3dQLlpDRckjqQvDDluv8UN3vKFk8hnUKxXCBbxWBWMqhN8lnkGg//DT8s3UWNwK
	a26i3mIk/J5Xovh7+tAjy2WwMvdWVk4d0UHjxpX9Uj0qdRRZInT2Cq7DLmzmnAnqRs6l1De77KDRz
	zX4DSy16cGM3at1TWBmIjmI/mIfCLvMw6kAm+L//mz21KJ8elqelKboJDNhGyR8Z8/7Hem+q+XTG5
	KmdvLSAhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLOXR-00E91k-I1; Sun, 14 Mar 2021 11:04:01 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLOXM-00E91O-Be
 for linux-riscv@lists.infradead.org; Sun, 14 Mar 2021 11:03:59 +0000
Received: by mail-qk1-x729.google.com with SMTP id f124so28985405qkj.5
 for <linux-riscv@lists.infradead.org>; Sun, 14 Mar 2021 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLrP4l4H65pb8M2x3DmR+dro99lUOubfCFMxCcIwSs8=;
 b=aqFQ0r0ajDoxAzsNxpA6vK0Zdj3ovoLhw+/jMkUZTnXEBFuxuFhCDIVChyina/YdNL
 TiaChHRMrS2bq6ra3/XwlhKAi448hL+T1ODNfJ9v536uUtYf6IVUoVavpUIjrXILA0aQ
 EXE5As5UjV1qrO0Du4u9rcqqtisZ5WumTKmyt4G85Y7rU3m2iEuTiPwyno8gVaViFGW1
 ohQO7ehjYfrWMXVZwOiQfcUyiy56ZWJ+BV0GlxiMD7RFjQFo0jjnzjra3WZ0yO3WmyCP
 wjcshkgQEmEb2OyJmoUhnxUvF48KQt/9Xg5P6UtdJIksT1m727NGOrsTKH6u9a5ucfWx
 9WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLrP4l4H65pb8M2x3DmR+dro99lUOubfCFMxCcIwSs8=;
 b=i5xoQLLOiS/LC4rrfPRYvKPe5Krvx+oaM63okKbKyjR7g+UMSkmcPV/OJCjhWxevES
 vBHMl2EQlBtgV+492lKLCXEHdNjKfHXFZi/Rv7mX4aQ/ezb2+lhbtFybssjHlG+Ph1Wl
 Oi6QgWpI7WwRq6vseLl36InXNG2QoL+2bFFj7vKVo9yHfgz5PJZ4v+rEdVodyUmaSvB9
 Abyuap3+rKj0wb0bSQ7S0E2y4uFj9nJmV7TiNOe89/Pkj+yN5DbQe/yMRMHJP71g1/GE
 rDJSPJ6wulLQdHfgHF9zeslOPQodkH4d6sRl5tgehAseC9LIGkO1iWKIItf6Y1c/8zN9
 ieXw==
X-Gm-Message-State: AOAM530pKwcXz8ynBo7mrUreO/awZiGxnNdGTc/Iic1PkRwAeOYh0CUi
 jGTHXc6rliZBGR3aN69gBlZ10MR+n/+w1ga80vtq4w==
X-Google-Smtp-Source: ABdhPJwEegFcOLhpznys7nGUJ8jy4+601fJsOcZDpPR+EdJcnLdnSVL+p2u/yEUr6V/fvF+FJ96hAtYrDtqWf6oc7wU=
X-Received: by 2002:a37:4743:: with SMTP id u64mr20614742qka.350.1615719834825; 
 Sun, 14 Mar 2021 04:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000096cdaa05bd32d46f@google.com>
 <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
 <CACT4Y+ZjVS+nOxtEByF5-djuhbCYLSDdZ7V04qJ0edpQR0514A@mail.gmail.com>
In-Reply-To: <CACT4Y+ZjVS+nOxtEByF5-djuhbCYLSDdZ7V04qJ0edpQR0514A@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 14 Mar 2021 12:03:43 +0100
Message-ID: <CACT4Y+YXifnCtEvLu3ps8JLCK9CBLzEuUAozfNR9v1hsGWspOg@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 sock_ioctl
To: syzbot <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: andrii@kernel.org, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, David Miller <davem@davemloft.net>, 
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 kpsingh@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>, Song Liu <songliubraving@fb.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Yonghong Song <yhs@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_110357_052928_AF87C6C5 
X-CRM114-Status: GOOD (  20.91  )
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

On Sun, Mar 14, 2021 at 11:01 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > On Wed, Mar 10, 2021 at 7:28 PM syzbot
> > <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=122c343ad00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=c23c5421600e9b454849
> > > userspace arch: riscv64
> > >
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com
> >
> > +riscv maintainers
> >
> > Another case of put_user crashing.
>
> There are 58 crashes in sock_ioctl already. Somehow there is a very
> significant skew towards crashing with this "user memory without
> uaccess routines" in schedule_tail and sock_ioctl of all places in the
> kernel that use put_user... This looks very strange... Any ideas
> what's special about these 2 locations?

I could imagine if such a crash happens after a previous stack
overflow and now task data structures are corrupted. But f_getown does
not look like a function that consumes way more than other kernel
syscalls...



> > > Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000020000300
> > > Oops [#1]
> > > Modules linked in:
> > > CPU: 1 PID: 4488 Comm: syz-executor.0 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> > > Hardware name: riscv-virtio,qemu (DT)
> > > epc : sock_ioctl+0x424/0x6ac net/socket.c:1124
> > >  ra : sock_ioctl+0x424/0x6ac net/socket.c:1124
> > > epc : ffffffe002aeeb3e ra : ffffffe002aeeb3e sp : ffffffe023867da0
> > >  gp : ffffffe005d25378 tp : ffffffe007e116c0 t0 : 0000000000000000
> > >  t1 : 0000000000000001 t2 : 0000003fb8035e44 s0 : ffffffe023867e30
> > >  s1 : 0000000000040000 a0 : 0000000000000000 a1 : 0000000000000007
> > >  a2 : 1ffffffc00fc22d8 a3 : ffffffe003bc1d02 a4 : 0000000000000000
> > >  a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
> > >  s2 : 0000000000000000 s3 : 0000000000008902 s4 : 0000000020000300
> > >  s5 : ffffffe005d2b0d0 s6 : ffffffe010facfc0 s7 : ffffffe008e00000
> > >  s8 : 0000000000008903 s9 : ffffffe010fad080 s10: 0000000000000000
> > >  s11: 0000000000020000 t3 : 982de389919f6300 t4 : ffffffc401175688
> > >  t5 : ffffffc401175691 t6 : 0000000000000007
> > > status: 0000000000000120 badaddr: 0000000020000300 cause: 000000000000000f
> > > Call Trace:
> > > [<ffffffe002aeeb3e>] sock_ioctl+0x424/0x6ac net/socket.c:1124
> > > [<ffffffe0003fdb6a>] vfs_ioctl fs/ioctl.c:48 [inline]
> > > [<ffffffe0003fdb6a>] __do_sys_ioctl fs/ioctl.c:753 [inline]
> > > [<ffffffe0003fdb6a>] sys_ioctl+0x5c2/0xd56 fs/ioctl.c:739
> > > [<ffffffe000005562>] ret_from_syscall+0x0/0x2
> > > Dumping ftrace buffer:
> > >    (ftrace buffer empty)
> > > ---[ end trace a5f91e70f37b907b ]---
> > >
> > >
> > > ---
> > > This report is generated by a bot. It may contain errors.
> > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > >
> > > syzbot will keep track of this issue. See:
> > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
