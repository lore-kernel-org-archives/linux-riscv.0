Return-Path: <SRS0=ZUll=KM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5287BC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 15:43:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D6861108
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 15:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D6861108
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y3QEbzxeMP2YfeQkHjr2dVSjC0wJqhooFTSBPFsugno=; b=VwQ/1WM3iMGNSuJ9BNaoRs87G
	O75SVXb61+Yt+DfqS0eyg8A64VF1QSFOh7Bbz3VrAiv0HQtmP1QOmmP9yKh3c0Xft/Fn7W909Vm6p
	lbuhOEZ9CS/DCzxmsL3C7w5eEx40ynb6SZ0X6kes/WCgpxGO7fhaleXcNgCpDolZN9iianTjg77Ck
	UXH45ftral0uUUy1bNNsOSPtpEz3CehnqDZhN/6vs4Tyyc0VcNUD3fBrhHom3youdOE+8ep9D9zIK
	M06D7muTFfr/MmCC+HGWOFEEZBWmG1fZ9VP9YPj44iwV8LMFLDWjR+UkO/QJouQ3NY3lMg6iYVf9H
	qx+x60CEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lifOg-00FRsX-TN; Mon, 17 May 2021 15:43:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lifOT-00FRnb-0E
 for linux-riscv@desiato.infradead.org; Mon, 17 May 2021 15:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rs8wKGuAJirIeR8pB24GlnuxBoLLyGIXXFMHW4+hs1w=; b=3iEnnKVXi7hK8sbvW46W16BlZS
 M+K+cOIffTWbLVds/P7f2IHeN7FBydR5dQOJyq2bTYnPGg0F9jEHoxxoHZIBbNCmPdCYztOvSh64r
 rE+d+5do6EPMZGxKeOE2N17V7uprNZR0plgfW+u+nxSUaBJPTiIyM0zpKZ/7Z2VnMcSsyM8MdoUb6
 Miy6/ku1rcrYdpOAH9154iZaO3TPg2jmdgL/Qp4PtOoqmO5u0VVwvtND8Db5chkQDTD+1xSOtGbIv
 M0g3rlUTvWTVcxWP1tFm9KiHPpR7kUd5D2YfGfOl+OZx5g98fPI96PztiEgzsonuHKTNs2eJKbuh6
 Rdr4LWbw==;
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lifOP-00DwBB-UY
 for linux-riscv@lists.infradead.org; Mon, 17 May 2021 15:42:55 +0000
Received: by mail-qt1-x82c.google.com with SMTP id t7so5151460qtn.3
 for <linux-riscv@lists.infradead.org>; Mon, 17 May 2021 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rs8wKGuAJirIeR8pB24GlnuxBoLLyGIXXFMHW4+hs1w=;
 b=cAikG+5a+4iynx/4oTqeQfZM8HsfstVIlIpcGDnVS+fZKQ4YAVJJ97MSosr425ij9Y
 ya0pvC4B+sR2TNN0E5G4RKCO4azawWGhbJ1OPpsV4NLVPeXzMv+cTEt6FqiMWKiFzPOQ
 XWfZ9fq+c9yx432zbo136TkkBpCYU1GZkw0J+5MpWa4OXai1udsUHqtVbkSMkNmWwaHb
 tbpKFE+Gkqgkf9xBIAIt05teAOFZhwO8x2VgQZ5SH0mM52qD6I8zs0sTnkHy/M9F1YZ2
 lw4yRHS4EqEUwyiooEFBCSnXvBDGdAwQWltG5hDGcS0Vkt3ScFvXx0lGzOWkmfGld0BK
 /blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rs8wKGuAJirIeR8pB24GlnuxBoLLyGIXXFMHW4+hs1w=;
 b=o0nnV0woB+2smUK2FPFzm7V1DS+xa1mePZ5JSfdBEkyvVP8M6T91/HNPyHqx3P46Sl
 JMsLS3v1T+YOK5H74x+fMGVCYcWvfz6gauDNJmLG/ooq1kF0qKw9CcMzhZ+TuQparMA2
 vyRORhauJK4wlKhDoR39BIYQJ2LSxCyCGbHC2RVDmB9n5whqbsFjuXg/IYnp8H0mO1DZ
 hRadMdblJLXVVLOpbLgmPUeY5knCEdirI3ekRtwUC//gSFRkNuAcZ7bCdwQ/zyoDTXYj
 QnWQqfRqya3MjVjJ8D/d0q8vnOazXTZ3BOG65MtQvWVyD33SDrr05xi41R168ak3lD6+
 aL4w==
X-Gm-Message-State: AOAM5332lHz265kSaieymhYEfswBFCJqmwmM/O5uO15Wg3pjDehO7apk
 Nfzg4AAV9LViX4IuxTNPn8ov3gQoImCt9b9PpFDZSw==
X-Google-Smtp-Source: ABdhPJzBUC2UlgtxIY/TiiqefaCZcOrelPEgUS6Try6RDiLyE67cFdt6W03BqBqHnvhEYKfUBGs0M7Y/ntaiAgUFPJ8=
X-Received: by 2002:ac8:51d6:: with SMTP id d22mr110921qtn.67.1621266172503;
 Mon, 17 May 2021 08:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000e65b5d05c287fddc@google.com>
In-Reply-To: <000000000000e65b5d05c287fddc@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 17 May 2021 17:42:41 +0200
Message-ID: <CACT4Y+b2CzUxXyNJti=+7vbmQQg6=Ryjxp6orfrqvD8dmkhfGw@mail.gmail.com>
Subject: Re: [syzbot] WARNING in task_ctx_sched_out
To: syzbot <syzbot+30189c98403be62bc05a@syzkaller.appspotmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andrii Nakryiko <andrii@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Jiri Olsa <jolsa@redhat.com>, Martin KaFai Lau <kafai@fb.com>,
 KP Singh <kpsingh@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 netdev <netdev@vger.kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Song Liu <songliubraving@fb.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Yonghong Song <yhs@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_084254_007297_D64319E2 
X-CRM114-Status: GOOD (  20.85  )
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

On Mon, May 17, 2021 at 5:10 PM syzbot
<syzbot+30189c98403be62bc05a@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    18a3c5f7 Merge tag 'for_linus' of git://git.kernel.org/pub..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=1569c027d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b8ac1fe5995f69d7
> dashboard link: https://syzkaller.appspot.com/bug?extid=30189c98403be62bc05a
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+30189c98403be62bc05a@syzkaller.appspotmail.com

Another perf warning on riscv64:

WARNING in __perf_install_in_context
https://syzkaller.appspot.com/bug?id=ca4bae83abaaa2be86e4dc7925343fae9abb6056
https://groups.google.com/g/syzkaller-bugs/c/sc87fhg7Vhg/m/7_cuuqu9BAAJ


> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 8711 at kernel/events/core.c:2668 task_ctx_sched_out+0x5c/0x60 kernel/events/core.c:2668
> Modules linked in:
> CPU: 0 PID: 8711 Comm: syz-executor.0 Not tainted 5.12.0-rc8-syzkaller-00011-g18a3c5f7abfd #0
> Hardware name: riscv-virtio,qemu (DT)
> epc : task_ctx_sched_out+0x5c/0x60 kernel/events/core.c:2668
>  ra : task_ctx_sched_out+0x5c/0x60 kernel/events/core.c:2668
> epc : ffffffe00027ccf0 ra : ffffffe00027ccf0 sp : ffffffe0067abb80
>  gp : ffffffe0045883c0 tp : ffffffe00db797c0 t0 : ffffffc400b23834
>  t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe0067abbb0
>  s1 : ffffffe066d59e00 a0 : ffffffe066d59fa8 a1 : 00000000000f0000
>  a2 : 0000000000000002 a3 : ffffffe00027ccf0 a4 : ffffffe00db7a7c0
>  a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe00028fc4c
>  s2 : ffffffe00877e400 s3 : 0000000000000003 s4 : ffffffe00df38800
>  s5 : ffffffe00db7ab48 s6 : ffffffe00db7aab8 s7 : ffffffe00877e408
>  s8 : 0000000000000000 s9 : 0000000000000025 s10: ffffffe00db797c0
>  s11: ffffffe0067abe30 t3 : 1ef9635ec2383300 t4 : ffffffc404c957b2
>  t5 : ffffffc404c957ba t6 : 0000000000040000
> status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
> Call Trace:
> [<ffffffe00027ccf0>] task_ctx_sched_out+0x5c/0x60 kernel/events/core.c:2668
> [<ffffffe00028fc98>] perf_event_exit_task_context kernel/events/core.c:12483 [inline]
> [<ffffffe00028fc98>] perf_event_exit_task+0x214/0x708 kernel/events/core.c:12541
> [<ffffffe000031fc4>] do_exit+0x77a/0x1846 kernel/exit.c:834
> [<ffffffe00003319a>] do_group_exit+0xa0/0x198 kernel/exit.c:922
> [<ffffffe00004c558>] get_signal+0x31e/0x14ba kernel/signal.c:2781
> [<ffffffe000007e06>] do_signal arch/riscv/kernel/signal.c:271 [inline]
> [<ffffffe000007e06>] do_notify_resume+0xa8/0x930 arch/riscv/kernel/signal.c:317
> [<ffffffe000005586>] ret_from_exception+0x0/0x14
> irq event stamp: 3704
> hardirqs last  enabled at (3703): [<ffffffe002a9a784>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160 [inline]
> hardirqs last  enabled at (3703): [<ffffffe002a9a784>] _raw_spin_unlock_irqrestore+0x68/0x98 kernel/locking/spinlock.c:191
> hardirqs last disabled at (3704): [<ffffffe002a9a41c>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:126 [inline]
> hardirqs last disabled at (3704): [<ffffffe002a9a41c>] _raw_spin_lock_irq+0x5c/0x5e kernel/locking/spinlock.c:167
> softirqs last  enabled at (3672): [<ffffffe002a9b578>] __do_softirq+0x5e0/0x8c4 kernel/softirq.c:372
> softirqs last disabled at (3667): [<ffffffe00003507e>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
> softirqs last disabled at (3667): [<ffffffe00003507e>] invoke_softirq kernel/softirq.c:228 [inline]
> softirqs last disabled at (3667): [<ffffffe00003507e>] __irq_exit_rcu kernel/softirq.c:422 [inline]
> softirqs last disabled at (3667): [<ffffffe00003507e>] irq_exit+0x1a0/0x1b6 kernel/softirq.c:446
> ---[ end trace 2de0fbf815e6ece8 ]---
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
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000e65b5d05c287fddc%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
