Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E789C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 14:11:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257BF64EF9
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 14:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257BF64EF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ySGmF2zWl12VrfjwdGU2WVQ9Ru/COWyD8UeaMJTQlCw=; b=elKCLH8HX5VlXf8/Juhdov/Q/
	EY7rI4sukqqhRTk05VKe1+nY5Mjiy2k1pkfEWjdeAqVdunUqEIbWoajpYbEJX9Uo56PA4os/38vib
	ptkC6uGWRaDLzdvSwLZdADLiLQHiFBqYrhc1RA1RG9tOW7qT+dAobvztRiR8V1K/pnKtVQc+Hlxsy
	Gqj3XDeVN3RJII3098PICQ3wuxKJAtAweyahRLP59T7BRzH5/esQbkZVQIn9kHE0kEnhHvtoCrkeF
	riorIu90tBAryz3GPC0jdpA8ocqvQRT6+M+uMXSZDtgDDPqdlozz1enT+mIozKyR2zeU0HW1Bkqbz
	wUanAu0PQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMtMy-005Rjg-2r; Thu, 18 Mar 2021 14:11:24 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMtMr-005RiV-A7
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 14:11:19 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id h3so3214253qvh.8
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VEx9o4c2jWWVchbL2AkKVWv1VcFgkP2+bgAk/sGCWD4=;
 b=JQ162sdoGuFTE+QF9UcdIDnpdC7nkNI1UetAhcbrkPL1a+Jhn5bEV8JcjV0AUxa5ux
 gU+ZAtXOUI6pIxClTVNK7tXsr1uGVzfWGm646EUUIqDz2S9zmIyXCI5U8rK1Ak9Pl687
 TiZ7R6m5oO93WPTa91FTv0qZVEjFHf1ZVPRPRWIfrDwCDbn+mHUQLl0d3l4IHCeJ9iaJ
 loIEwx0/TDNuQIk3RDjP7UXFAFCjGJ3WuX411nxaFUWikDJNf2YScDR/C8uwu4W3HswT
 Y7R6aQ0ZmKGRrKEXOWMbAvOaEjxwgtD+GXaFFjSAq0VY8F6Q1ppCCbmzNb34C5V/gvwR
 CMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VEx9o4c2jWWVchbL2AkKVWv1VcFgkP2+bgAk/sGCWD4=;
 b=HGRkYTFK8bQ7DgiAJTxu9WJHRxSa8jLLRL3oDBdruYf6Qc+CEiosLbJMefT+MSg93Z
 17rT3IHNPUkYZtxocmSJcHzIxScKMHvcX4D8/DGv4T/cCxgy/UJkr6Q2Hnd7/nFfYUXb
 YthbCfkAjFvGIYec5c03NVrr3egoCeWdjXW9AcGzNb/aHAMt2X0mFk43RGclaWv6G+yC
 KZaZWkYv7kJSCCOU5/ijLfKPewXiJaNIdodWoZpDJoXtx55qnJ85pjjlqE5SgWwX9wnh
 z0glzcLibeQr5nTNcQ0Om8UHKRb4HSWbckyuzQMQdDiHem+VUlPM4+3r1J4voNUBrvPz
 JOEQ==
X-Gm-Message-State: AOAM53158snZDtaOd3nm4OmtZVfLhWfrfkzlNvp85IxQtIQUb/Sp152B
 q2aENeKaef8R0Kp+5IqjKHYk8XTYyEY8P6SE9ROFBg==
X-Google-Smtp-Source: ABdhPJxj14kq/t5j4tmmrlTeySSXI1kh5zll/tbCuXiwWUDWY4WHq08TGj8USqzoT2acp4GD5/yCXcHErUVNKtQzYjU=
X-Received: by 2002:a05:6214:326:: with SMTP id
 j6mr4498301qvu.13.1616076674645; 
 Thu, 18 Mar 2021 07:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000056b18b05bd7c6511@google.com>
 <CACT4Y+brvecfGUk7H7-mcJ82NxbEuETv+js0nRxpV7zc1AZH5w@mail.gmail.com>
 <c82390e5-33f6-75f6-6b93-c618537413e5@huawei.com>
In-Reply-To: <c82390e5-33f6-75f6-6b93-c618537413e5@huawei.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 18 Mar 2021 15:11:03 +0100
Message-ID: <CACT4Y+ZpfAiQKagp5xr0HY85SRr2h6pe10emm4_B5RLfVraN9A@mail.gmail.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in riscv_intc_irq
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: syzbot <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_141117_840548_7ED7277E 
X-CRM114-Status: GOOD (  27.26  )
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

On Thu, Mar 18, 2021 at 1:21 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> On 2021/3/14 18:47, Dmitry Vyukov wrote:
> > On Sun, Mar 14, 2021 at 11:14 AM syzbot
> > <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com> wrote:
> >> Hello,
> >>
> >> syzbot found the following issue on:
> >>
> >> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> >> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=15a35756d00000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=81c0b708b31626cc
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=005654dd9b8f26bd4c07
> >> userspace arch: riscv64
> >>
> >> Unfortunately, I don't have any reproducer for this issue yet.
> >>
> >> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> Reported-by: syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com
> >>
> >> ==================================================================
> >> BUG: KASAN: slab-out-of-bounds in riscv_intc_irq+0x24/0xcc drivers/irqchip/irq-riscv-intc.c:24
> >> Read of size 8 at addr ffffffe00c963bd0 by task kworker/1:1/4388
> >>
> >> CPU: 1 PID: 4388 Comm: kworker/1:1 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> >> Hardware name: riscv-virtio,qemu (DT)
> >> Workqueue: events nsim_dev_trap_report_work
> >> Call Trace:
> >> [<ffffffe0000096c0>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
> >>
> >> Allocated by task 76347056:
> >> (stack is not available)
> >>
> >> Last potentially related work creation:
> > There seems to be some issue with riscv stack unwinder.
> > This does not have stacks.
>
> Hi, could you test with the following  patch about the no stack
> issue(from v5.11-rc4), I made a mistake when do some cleanup...
>
> https://lore.kernel.org/linux-riscv/ce5b3533-b75d-c31c-4319-9d29769bbbd5@huawei.com/T/#t

Hi Kefeng,

Please see:
http://bit.do/syzbot#no-custom-patches

Is a unit-test for this possible? Fuzzing is not a replacement for unit testing.

> > "BUG: unable to handle kernel access to user memory in schedule_tail"
> > does not have proper stacks:
> > https://syzkaller.appspot.com/bug?id=9de8c24d24004fd5e482555f5ad8314da2fb1cee
> >
> > I also found 2 riscv reports in "KASAN: use-after-free Read in
> > idr_for_each (2)":
> > https://syzkaller.appspot.com/bug?id=7f84dfc3902878befc22e52eb5c7298d0ad70cf3
> >
> > both don't have any stacks:
> >
> > ==================================================================
> > BUG: KASAN: use-after-free in radix_tree_next_slot
> > include/linux/radix-tree.h:422 [inline]
> > BUG: KASAN: use-after-free in idr_for_each+0xf4/0x160 lib/idr.c:202
> > Read of size 8 at addr ffffffe010c00878 by task syz-executor.1/4828
> >
> > CPU: 0 PID: 4828 Comm: syz-executor.1 Not tainted
> > 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> > Hardware name: riscv-virtio,qemu (DT)
> > Call Trace:
> > [<ffffffe0000096c0>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
> >
> > Allocated by task 4828:
> > (stack is not available)
> >
> > Freed by task 4473:
> > (stack is not available)
> >
> >
> >> ---
> >> This report is generated by a bot. It may contain errors.
> >> See https://goo.gl/tpsmEJ for more information about syzbot.
> >> syzbot engineers can be reached at syzkaller@googlegroups.com.
> >>
> >> syzbot will keep track of this issue. See:
> >> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
