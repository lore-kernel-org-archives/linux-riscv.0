Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BCBC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 17:16:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B637664FC6
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 17:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B637664FC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4XqJOZictmtd3My8dYD4yfYhICx/5CoDqnk0hyQPnZs=; b=n9uAAJzUKgrWCaWcRuKEHoJ+s
	pcxX1DanQfQTWNcmvJBxNotgshJq78kapE6bK5wDMHZlgwfuGbvzwOlNhfGYpkO5h3MlA2bCKAPbu
	Z90Gl6SO3Zp2OXhc9V87OVRF0j/xAeps+QTJ9NKrO2vhRjQ71eldOWxSgAjFOnNzKLHq9zPAuRL8i
	b4bAzvWQXsktDUUHJ/xb3bPnSs9vcfU6RfoA4dUUL5uKytRmrZJVH96XcSQ7ThMIimz7O5CYfgdGN
	Jfb+WLzIxc8fKFy7ktKPvHnDLKukzlvRDyJ1GYOqkMOEj0x2mJQ6sRElC/SZsoo7fep6xx1JwkhBx
	Oh+hy/kBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK2Rl-007JOG-2T; Wed, 10 Mar 2021 17:16:35 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK2Rf-007JLZ-U7
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 17:16:30 +0000
Received: by mail-qv1-xf32.google.com with SMTP id h3so1133567qvh.8
 for <linux-riscv@lists.infradead.org>; Wed, 10 Mar 2021 09:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PE9e5r7r4OZKtELp4lLPAYR8o+l784C8Hnnr7StF8Oo=;
 b=M9F/M9CtdFLG72yUgNoHBrgCVJXGyjjTTUlE1Jp0/XFBawk0NymRHXFt6kG3daxWgZ
 cQJyIYPNKZTpTnj263WHyHlyr+/Mg9c1O8bOsn0+KKNuC5QUNXc1GgWxIX20/rsSMU4+
 fClQQyEhdzs/pZgdI9SGLxmdhWLsb5NTD7w3rkyaaBVtLf84vK5bgfa0Kc0RSyW9Z/tn
 /aoBs+OTKQ9JcmPDf93lBjY5Iw/8CYFfDDT3UT4n6kVbjJxQzx+ytsPQ8GoekO+GE9k3
 fWvF1J8AtInA4J7aUqxyneRgBFnIkSz/WAOALfF+wHYuofkNtc7Fdrh73lT5dK6YmPgh
 bYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PE9e5r7r4OZKtELp4lLPAYR8o+l784C8Hnnr7StF8Oo=;
 b=o4yxrIaDt1KX5Krwo0tHkzHR/ydSvho0ElyB/h+scdZjmd7CA52JWogT18ZVk6eH5+
 2G+TTxd64Dz6CjKCEG0T0aSOMjWtETDFj3Z4FILKFoaqSLMNBYBKt2HuFheDucVVSw5s
 JHrrd77nQL+7VNgItquEUWFDsiFOORIELCS5yNByBgZuIMEwtEiaISZQQiv+Da/IeoTU
 6YghRztG00BQf7q1ADpseQnTFl+2wUryzopbY8a57nnWrmsSw7lRdaOSqfRnTFv/uwZC
 vOCLoUQfIaxlEeXgXPSfLkbahatLvG84pocpc7YULPA6YtV755a1hRk2SSRdeuqsSEQE
 HyEw==
X-Gm-Message-State: AOAM531yIu0+80HiGvol/nKINV9fAbM3KSP3+NV+xsvGtF32zl9MD9Yj
 diErYP5Lf7l4f4cW1pCX2rkMNV9v3IquKd2asBj0WQ==
X-Google-Smtp-Source: ABdhPJxcs/PTbq2AZ5JVJpnHnDCbM6bcHSMhk1OFQl5dNkKfLQen3aBGZz5TWxWUxs+gml9o62NFyJpfXB+qyvjZYM0=
X-Received: by 2002:a05:6214:1870:: with SMTP id
 eh16mr3880623qvb.23.1615396584965; 
 Wed, 10 Mar 2021 09:16:24 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b74f1b05bd316729@google.com>
In-Reply-To: <000000000000b74f1b05bd316729@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 10 Mar 2021 18:16:11 +0100
Message-ID: <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: syzbot <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>,
 Benjamin Segall <bsegall@google.com>, dietmar.eggemann@arm.com, 
 Juri Lelli <juri.lelli@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_171628_025068_66C2D860 
X-CRM114-Status: GOOD (  20.40  )
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

On Wed, Mar 10, 2021 at 5:46 PM syzbot
<syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=1212c6e6d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> dashboard link: https://syzkaller.appspot.com/bug?extid=e74b94fe601ab9552d69
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com

+riscv maintainers

This is riscv64-specific.
I've seen similar crashes in put_user in other places. It looks like
put_user crashes in the user address is not mapped/protected (?).


> Unable to handle kernel access to user memory without uaccess routines at virtual address 000000002749f0d0
> Oops [#1]
> Modules linked in:
> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> Hardware name: riscv-virtio,qemu (DT)
> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>  ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>  ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>  gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>  t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>  s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>  a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>  a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>  s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>  s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>  s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>  s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>  t5 : ffffffc4043cafba t6 : 0000000000040000
> status: 0000000000000120 badaddr: 000000002749f0d0 cause: 000000000000000f
> Call Trace:
> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
> [<ffffffe000005570>] ret_from_exception+0x0/0x14
> Dumping ftrace buffer:
>    (ftrace buffer empty)
> ---[ end trace b5f8f9231dc87dda ]---
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
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000b74f1b05bd316729%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
