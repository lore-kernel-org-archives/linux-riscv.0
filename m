Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD48C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqNl4nKTRWngJ2tSo+3qW2A2nOOY5WA3n6q0vdlvkj4=; b=2ABG2H+KJ95PdJ
	S9XleI5GeW16Ouvv3+f+FyCsX8bV5i6q18UFPbHkIDqKTXNFBqNNLgiE2DJp7zoVqGqqYdqoOS+U5
	j2N7OpOx/Keop8rs21gcfE3UfRWxvun7Gt6HzzDWNPGAdjSssl8hDaUFAaG2To+zYD03fiTc5n/D2
	X5QMmFhHU3RqTKIbnDGTkDUH8N7x+v5hUmftSdGZlDYVq3J7FvlZH0RxSCIsrl2kyggiemRlzOsKk
	CvrWNta9LkIYX2PVhu2OwfJiIqvqT83SXPzkG3SQBrtNXI/D1vTXXlkMrugT57dohIBx0NFyYuIpo
	437A1cVbILVcE2T3loUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yx1-00EzEV-Pf; Wed, 21 Dec 2022 13:16:03 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yut-00EyHi-Ln
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 13:13:53 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1433ef3b61fso19073940fac.10
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 05:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtO9wDg8hJUBUQLaiwbIVAo5mfbNL2fVZzLLZezJ9QQ=;
        b=tdnjA/5PXpLbV2h4/LVz0eHHrk3fPY2VmbkazutmwZogNrS41rkgbySWaKIFWmZCLJ
         i9SdHw9xyb/HsyIZIBwypHdzlYWDcxg5yBKLjJ4Qyw8iUyQpy2l7GOK92iArImyL1Hay
         w8GQbEBIm1YU0BlcxRI0fv/Mu3+0kGoTUHNCnWoYhQkmLDoDECDNln3BcMz2JumGgKRG
         tbhhS/lvRkBS5q7mslBMMW0rzXKq9Wccn+YWaMNV4uyXEyjrEdvv8LaddoRILTF9K6Qa
         msweVuTk4ZNIBpUEhmrnt7cvkjIDtjPjyxXzbGM7zPppb8NeH7ykwrt1/3LaGlu783sx
         tS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtO9wDg8hJUBUQLaiwbIVAo5mfbNL2fVZzLLZezJ9QQ=;
        b=tJs3HwEc/LSoRUrEmmYdRjFUfIW3oznzIwHFgJnPqMtLq6Xkv+Sm8e/0Y8lwhHEvWG
         nwnZmBrGY0R05P14C46wZnqdiuUQwfiF2hUtLOQwK12sLHgsAIgZ+pIxGMki1IUgcL1+
         qiz1Cs0Zv10DGkOPY9u09OyjCWluHl8Ut94TTUWOUxA3Y9BRH6k94wwXU2ovwhchfLGk
         uB4wI7oAD61aItvAwjSLTtxIEToFhWtfKdsaOXVCUnXRaxgPdVrl7BwFpUC08MiwnxB+
         XPq3mK4n+MapLnAPs2C1aVcwXUDEcOjT4fv4nI+1clthRi0rg2ik4uCPjwFZq/REnGQq
         5kAQ==
X-Gm-Message-State: AFqh2kp6rBRywjdlPsEkNAXQDnrKeuudi7Br9zJ0wOju7A9NBcRA/oe4
	PX/IChpQn9jQR51k7EOgt8dqd3TIrh7ZEu/trZOdPA==
X-Google-Smtp-Source: AMrXdXsyxYuopd3Pilvwcm9RqZRo8uJMyPihyDIVvk58KoFpPnsoD5+9K1a55cKZ9tJrnhz35XcMw96wlhr9vbI+Xjk=
X-Received: by 2002:a05:6870:bb0c:b0:144:8c6d:33b9 with SMTP id
 nw12-20020a056870bb0c00b001448c6d33b9mr78974oab.190.1671628425203; Wed, 21
 Dec 2022 05:13:45 -0800 (PST)
MIME-Version: 1.0
References: <000000000000ea7a5c05f051fd00@google.com> <07f9fa58-097f-f14e-b07a-c94deed898eb@ghiti.fr>
In-Reply-To: <07f9fa58-097f-f14e-b07a-c94deed898eb@ghiti.fr>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 21 Dec 2022 14:13:33 +0100
Message-ID: <CACT4Y+YcJqcEFSq-AJQpmps7po7qyBA4Vyts3ku9b=d18O65YA@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: WARNING in __apply_to_page_range (2)
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: syzbot <syzbot+5702f46b5b22bdb38b7e@syzkaller.appspotmail.com>, 
	andrii@kernel.org, aou@eecs.berkeley.edu, ast@kernel.org, bjorn@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luke.r.nels@gmail.com, martin.lau@linux.dev, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, xi.wang@gmail.com, yhs@fb.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_051351_793261_097310F2 
X-CRM114-Status: GOOD (  17.56  )
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

On Wed, 21 Dec 2022 at 13:45, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi,
>
> On 12/21/22 09:03, syzbot wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    eb67d239f3aa Merge tag 'riscv-for-linus-6.2-mw1' of git://..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=16672680480000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=be108b5bcf4ef832
> dashboard link: https://syzkaller.appspot.com/bug?extid=5702f46b5b22bdb38b7e
> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: riscv64
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+5702f46b5b22bdb38b7e@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 apply_to_pmd_range mm/memory.c:2637 [inline]
>
>
> This leads to the following:
>
> if (WARN_ON_ONCE(pmd_leaf(*pmd)))
>     return -EINVAL;
>
>
> WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 apply_to_pud_range mm/memory.c:2680 [inline]
> WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 apply_to_p4d_range mm/memory.c:2716 [inline]
> WARNING: CPU: 0 PID: 2760 at mm/memory.c:2637 __apply_to_page_range+0x988/0x1212 mm/memory.c:2750
> Modules linked in:
> CPU: 0 PID: 2760 Comm: dhcpcd Not tainted 6.1.0-syzkaller-13662-geb67d239f3aa #0
> Hardware name: riscv-virtio,qemu (DT)
> epc : apply_to_pmd_range mm/memory.c:2637 [inline]
> epc : apply_to_pud_range mm/memory.c:2680 [inline]
> epc : apply_to_p4d_range mm/memory.c:2716 [inline]
> epc : __apply_to_page_range+0x988/0x1212 mm/memory.c:2750
>  ra : apply_to_pmd_range mm/memory.c:2637 [inline]
>  ra : apply_to_pud_range mm/memory.c:2680 [inline]
>  ra : apply_to_p4d_range mm/memory.c:2716 [inline]
>  ra : __apply_to_page_range+0x988/0x1212 mm/memory.c:2750
> epc : ffffffff8042aac8 ra : ffffffff8042aac8 sp : ff20000004d57290
>  gp : ffffffff85cdd280 tp : ff6000000e206200 t0 : ff60000010988a00
>  t1 : 00000000000f0000 t2 : ffffffff804616b4 s0 : ff20000004d57380
>  s1 : 0000000000000006 a0 : 0000000000000007 a1 : 00000000000f0000
>  a2 : ffffffff8042aac8 a3 : 0000000000000002 a4 : ff6000000e207200
>  a5 : 0000000000000000 a6 : 0000000000000003 a7 : 0000000000000000
>  s2 : fffffffeef001000 s3 : 00000000371000e7 s4 : ff6000007a660bc0
>  s5 : 0000000000001000 s6 : fffffffeef001000 s7 : 0000000000000001
>  s8 : ffffffff804d8484 s9 : 0000000000000000 s10: fffffffeef000000
>  s11: 0000000000000000 t3 : fffffffff3f3f300 t4 : fffffffef0a07c70
>  t5 : fffffffef0a07c71 t6 : ff6000000ebcccb8
> status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> [<ffffffff8042b386>] apply_to_page_range+0x34/0x46 mm/memory.c:2769
> [<ffffffff804d872a>] kasan_populate_vmalloc+0x52/0x5e mm/kasan/shadow.c:315
> [<ffffffff804619e0>] alloc_vmap_area+0x4a6/0x1636 mm/vmalloc.c:1647
> [<ffffffff80462de2>] __get_vm_area_node+0x272/0x3b0 mm/vmalloc.c:2515
> [<ffffffff8046917c>] __vmalloc_node_range+0x280/0xdb8 mm/vmalloc.c:3187
> [<ffffffff800192c0>] bpf_jit_alloc_exec+0x46/0x52 arch/riscv/net/bpf_jit_core.c:190
>
>
> Here we can see that we are allocating the shadow memory for a BPF region which is *vmalloc-backed*: but the current upstream implementation does populate the BPF region at initialization, it does not shallow populate it. And we try to use huge pages when possible so that can trigger this warning here.
>
> This is something that I fixed in the following series: https://patchwork.kernel.org/project/linux-riscv/list/?series=705150 :)

Good!
Let's tell syzbot so that it reports similar bugs in future:

#syz fix: riscv: Rework kasan population functions


> Glad to see syzbot running again, thanks
>
> Alex
>
>
> [<ffffffff80282f10>] bpf_jit_binary_alloc+0x96/0x13c kernel/bpf/core.c:1027
> [<ffffffff8001904c>] bpf_int_jit_compile+0x87a/0xa8c arch/riscv/net/bpf_jit_core.c:112
> [<ffffffff80284d76>] bpf_prog_select_runtime+0x1a2/0x22e kernel/bpf/core.c:2191
> [<ffffffff828a6840>] bpf_migrate_filter+0x258/0x2be net/core/filter.c:1298
> [<ffffffff828acbec>] bpf_prepare_filter+0x10e/0x1b4 net/core/filter.c:1346
> [<ffffffff828acfbc>] __get_filter+0x148/0x1a0 net/core/filter.c:1515
> [<ffffffff828b3e7c>] sk_attach_filter+0x22/0x11a net/core/filter.c:1530
> [<ffffffff827f1af4>] sk_setsockopt+0x144e/0x270c net/core/sock.c:1297
> [<ffffffff827f2dfa>] sock_setsockopt+0x48/0x58 net/core/sock.c:1549
> [<ffffffff827dfcc8>] __sys_setsockopt+0x3f0/0x418 net/socket.c:2242
> [<ffffffff827dfd2a>] __do_sys_setsockopt net/socket.c:2257 [inline]
> [<ffffffff827dfd2a>] sys_setsockopt+0x3a/0x4c net/socket.c:2254
> [<ffffffff80005ff6>] ret_from_syscall+0x0/0x2
> irq event stamp: 940
> hardirqs last  enabled at (939): [<ffffffff833903b0>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
> hardirqs last  enabled at (939): [<ffffffff833903b0>] _raw_spin_unlock_irqrestore+0x68/0x98 kernel/locking/spinlock.c:194
> hardirqs last disabled at (940): [<ffffffff800105e0>] __trace_hardirqs_off+0x18/0x20 arch/riscv/kernel/trace_irq.c:25
> softirqs last  enabled at (888): [<ffffffff8339107a>] softirq_handle_end kernel/softirq.c:414 [inline]
> softirqs last  enabled at (888): [<ffffffff8339107a>] __do_softirq+0x640/0x930 kernel/softirq.c:600
> softirqs last disabled at (883): [<ffffffff80069192>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
> softirqs last disabled at (883): [<ffffffff80069192>] invoke_softirq kernel/softirq.c:452 [inline]
> softirqs last disabled at (883): [<ffffffff80069192>] __irq_exit_rcu+0x154/0x1ea kernel/softirq.c:650
> ---[ end trace 0000000000000000 ]---
>
>
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
