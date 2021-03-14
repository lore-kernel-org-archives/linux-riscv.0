Return-Path: <SRS0=fQzb=IM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2565AC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 10:48:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B670964E27
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 10:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B670964E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZXjIwv/V7LPkTeaCd30zykQXkaH6KeidI3pzJe3NVs0=; b=kK3pKcVX334xPiJBxr4xXjkF5
	KgARqXb+P+aGYyDpPAm52gXsTSMH9uyCr0DaYiuA3n3vPZ/C/APMh4i5S4E4snhPBzWivq0cVjuiK
	jTKujrE403rIGEdFmP8ddg2zv6ZCzSAhwrXFvLOiyJ3T6kKW0qFPOEDqYbLTMonHB5fy4LHdtFxwY
	aU8gnPtCBBn3v69tmUyWIBFZGSTy73Bl326JXMU8VDd23jpjLQjn7u7bLcDViVUR5IfKvcgQCiqwK
	3s/QRYoWD45aDWI1XzYoO8wi5QTkrpxS0rJrUFVCsq7yfLo8ygPD8AGnFDkBRpRRjgz/AZRjvjG6n
	J/97wy5QA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLOHx-00E8AA-1R; Sun, 14 Mar 2021 10:48:01 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLOHt-00E89m-84
 for linux-riscv@lists.infradead.org; Sun, 14 Mar 2021 10:47:59 +0000
Received: by mail-qt1-x836.google.com with SMTP id h7so420779qtx.3
 for <linux-riscv@lists.infradead.org>; Sun, 14 Mar 2021 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=APzrxQX+FzPfXXkGr8hxSnz1WxlxJpxhKBOC7gjL59s=;
 b=o4BZB17HMe9OwEw3R+O2FYyHfo21hw2ByOEvDboFlIl/bHGLCJBKNDDVqlRd2w4rp1
 AbfSjfrO3mqnHQcv+QTo6KCjJNVgm245cij5RDHzncvTkYhpLQ1SidEYXlggF1BP8+YL
 AV8uyiz+DUo9Wo0uy+Wa6LUt5l05SK/izc703gVy6MjhQ9RlBjIew+sckQrY9MwPspaP
 eGBYpwUmjt8Uz61Ok1Ps2hHLl1W0OlUuIfs4b9UtlWr7TDFaaSXLhTWQYkXA+gRyCv2O
 P5/Wp0d9G9RPOFIJRo4GZLFcg/Ts95O7BBvKEECCJIrAnWhMurikz6TkHp/rhRWD1ADV
 NDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=APzrxQX+FzPfXXkGr8hxSnz1WxlxJpxhKBOC7gjL59s=;
 b=aT43ivGKUSfgxKq2t0UOBKKLAoY+RkNI1peUxZJbbvg3P738EzQvY3Sa4h8SeIzFGV
 eQxWiMdK6P6HIrckvcqLeAKNbPIc9B9QKgFe7dn3jTPqXknPA4pTRuctzND37pXn1byI
 H4BUeZ9AqjrucJYfS88if9+hgCEeggogbNQpyz9AqhtkJ4KCz3Zrzwe46XjUkewwuIEW
 /DhntUT+5oHsJy3hNOqOFvMpSHLQ74AlPaUaNtxi0TSFWGTbxVUzmuhKaXEfFTw2aO1d
 gvThTINWhQmveyO0sT2FRa71U7lzrr/+riUX0cohx/XgUXC5dk+q/PzfX28dftK+OJwf
 +aiQ==
X-Gm-Message-State: AOAM531S5hymikm6CpbqAezylLNFt/x/uMgNVRpEKZViPp0gYDJbo0qs
 Fn9gbmR16uZ0EdZeQ8qT8J2AXJe19l0QHFzNMwREtw==
X-Google-Smtp-Source: ABdhPJyRX04yIsh90Cq8nnQ+xPWdMKERp7iAtizAgFy4UBnpsOWgsD0hvVNg2jtDnf7KLH0SCK0Z+tkAo5zMCoPBh6g=
X-Received: by 2002:ac8:5847:: with SMTP id h7mr18274879qth.43.1615718875783; 
 Sun, 14 Mar 2021 03:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000056b18b05bd7c6511@google.com>
In-Reply-To: <00000000000056b18b05bd7c6511@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 14 Mar 2021 11:47:44 +0100
Message-ID: <CACT4Y+brvecfGUk7H7-mcJ82NxbEuETv+js0nRxpV7zc1AZH5w@mail.gmail.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in riscv_intc_irq
To: syzbot <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_104757_628777_56F7936D 
X-CRM114-Status: GOOD (  15.46  )
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

On Sun, Mar 14, 2021 at 11:14 AM syzbot
<syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=15a35756d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=81c0b708b31626cc
> dashboard link: https://syzkaller.appspot.com/bug?extid=005654dd9b8f26bd4c07
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in riscv_intc_irq+0x24/0xcc drivers/irqchip/irq-riscv-intc.c:24
> Read of size 8 at addr ffffffe00c963bd0 by task kworker/1:1/4388
>
> CPU: 1 PID: 4388 Comm: kworker/1:1 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> Hardware name: riscv-virtio,qemu (DT)
> Workqueue: events nsim_dev_trap_report_work
> Call Trace:
> [<ffffffe0000096c0>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
>
> Allocated by task 76347056:
> (stack is not available)
>
> Last potentially related work creation:

There seems to be some issue with riscv stack unwinder.
This does not have stacks.
"BUG: unable to handle kernel access to user memory in schedule_tail"
does not have proper stacks:
https://syzkaller.appspot.com/bug?id=9de8c24d24004fd5e482555f5ad8314da2fb1cee

I also found 2 riscv reports in "KASAN: use-after-free Read in
idr_for_each (2)":
https://syzkaller.appspot.com/bug?id=7f84dfc3902878befc22e52eb5c7298d0ad70cf3

both don't have any stacks:

==================================================================
BUG: KASAN: use-after-free in radix_tree_next_slot
include/linux/radix-tree.h:422 [inline]
BUG: KASAN: use-after-free in idr_for_each+0xf4/0x160 lib/idr.c:202
Read of size 8 at addr ffffffe010c00878 by task syz-executor.1/4828

CPU: 0 PID: 4828 Comm: syz-executor.1 Not tainted
5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffe0000096c0>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201

Allocated by task 4828:
(stack is not available)

Freed by task 4473:
(stack is not available)


> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
