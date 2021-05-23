Return-Path: <SRS0=hCbr=KS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52003C4707A
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 07:00:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E0061205
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 07:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E0061205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A9USrOiQQMo0HcU6K2BUpTUpfyXFBoUqxi3yLqMkYuw=; b=WjQVTrY5OUHjuT
	WTq3nZ6lSwvOYkyBRAylbwn9KtVozIdU5JiShJ83I2Iwv94T8ecHRandH39XDrw2CUYFcclYMqu7R
	iTbRUZQiIFbO1iDxZmklDBuy4RctOYE2sU0zM0dLqWY4DibYr5R6zZG+uhlA53VZlywG3wM7IT5+e
	Lp1IpH6MndRqVcZHjU7l+XcK0RaTxL0ekzN+6t1pZPftLLXJRC6BXLK/fTQ7vx28n2A4qJS7TaxFF
	U5y6oepPfANSMbT094lefQTHiZZjYGMnJm+sy+wJ10UYzdVQLZSSx2aQt1gKV9D4R+Eo5Q29G9dyo
	PEgQa4Ls7fH3cZwq+Kbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lki5N-003w8I-F1; Sun, 23 May 2021 06:59:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lki5B-003w6d-SZ
 for linux-riscv@desiato.infradead.org; Sun, 23 May 2021 06:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:From:Subject:
 Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=u0Tmz6VnP41EIbBlF+WkQDt5H0ni5/whGKi6ixczT0k=; b=QnlhQb6eIR5pikVqFx0dKKwlEF
 1qIfflv91xqjAwSmefPtC3DMd3VOvTLsVtqKURpDuDXz0TzaBe5Qs8hbZRFqG/SgF7kRyrFaN3WXA
 nXvLz5dDFnzWLUj9cTM1JanY1dW7NkZpHYKUtWAkXi/xxOA+nVB+YcZIvPE4ElB7feiIV9Iu2GBCn
 +rm+JFghyYZ5LO1kL6AeIfy+2lcq2ODLp+Tt3toYEDZkXEOt7pZkdAeTL4HUy0qUCbBX/+kzuyCNN
 th+DjnYy/APs1E12W6Q5WO13Dis++n68C3vqE8U5zvCGChcVwku2N2BeLGnfilKQr2Ayg+I1n7jtG
 qZEdu4nw==;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lki58-000LWE-AB
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 06:59:28 +0000
Received: by mail-il1-f200.google.com with SMTP id
 g14-20020a926b0e0000b02901bb2deb9d71so26975125ilc.6
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 23:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=u0Tmz6VnP41EIbBlF+WkQDt5H0ni5/whGKi6ixczT0k=;
 b=Gd3aXLbLvzWs/6WBeGAdIqwytRvPNckksIGMT1uQT7ZFasp3fP1KWy+odWh2kJb7Ez
 1XW8NxExoNrfERH5opvmlcTRQGTzxwouSSN16CrZx1zboz6cXg515PvOBYuNI3OM4OUu
 T/FpoXSdSjMOpOW69Q7mSZExgXND9cMKr8OHrJGAqlR7XfArQ+CpHOYOjALUCjgzdQzr
 GF853hOHYyEdtqMtH33k0qhFgQ+1DDXiM1902JlOyFEAztjIlsWMhEZ8UDM+tWs6OxXy
 ttXseV8r5dSl3lb5jGA3MTdpDG84Zoke+j25Ju1dlVswz6qqumSpKNh0Fndm2AHY+U6r
 J5CA==
X-Gm-Message-State: AOAM533SsjT/aZl5l0xE8qHzNypQ+yTH5D+DnaTvc6FIKP3eXMh2F/M8
 nf1c0vJbC+kYUqy9gNPnE5TXsRxZ6Kh8zY9Nu7kilGc7iheV
X-Google-Smtp-Source: ABdhPJxI+cCwj3DbfqfpLhcnRyBGZEDoX41adShLA8Od/sAr6tNC1x/1oMUFMloHvIw6/yLK3qM7suLR/eJ61UepEGQ4VMj5oi5f
MIME-Version: 1.0
X-Received: by 2002:a6b:b4d8:: with SMTP id d207mr7801249iof.152.1621753163480; 
 Sat, 22 May 2021 23:59:23 -0700 (PDT)
Date: Sat, 22 May 2021 23:59:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000039084e05c2f9d507@google.com>
Subject: [syzbot] riscv/fixes boot error: WARNING in
 vmap_small_pages_range_noflush
From: syzbot <syzbot+06b228c6b9c37dcd3d79@syzkaller.appspotmail.com>
To: andrii@kernel.org, aou@eecs.berkeley.edu, ast@kernel.org, bjorn@kernel.org,
 bpf@vger.kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
 kafai@fb.com, kpsingh@kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, luke.r.nels@gmail.com, 
 netdev@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
 songliubraving@fb.com, syzkaller-bugs@googlegroups.com, xi.wang@gmail.com, 
 yhs@fb.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_235926_387397_6CF44F8B 
X-CRM114-Status: UNSURE (   4.78  )
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

HEAD commit:    bab0d47c riscv: kexec: Fix W=1 build warnings
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=10f59535d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e610cd256ee3a8
dashboard link: https://syzkaller.appspot.com/bug?extid=06b228c6b9c37dcd3d79
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+06b228c6b9c37dcd3d79@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:448 vmap_pages_pte_range mm/vmalloc.c:448 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:448 vmap_pages_pmd_range mm/vmalloc.c:471 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:448 vmap_pages_pud_range mm/vmalloc.c:489 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:448 vmap_pages_p4d_range mm/vmalloc.c:507 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:448 vmap_small_pages_range_noflush+0x2fa/0x38e mm/vmalloc.c:529
Modules linked in:
CPU: 1 PID: 2996 Comm: dhcpcd Not tainted 5.13.0-rc1-syzkaller-00629-gbab0d47c0ebb #0
Hardware name: riscv-virtio,qemu (DT)
epc : vmap_pages_pte_range mm/vmalloc.c:448 [inline]
epc : vmap_pages_pmd_range mm/vmalloc.c:471 [inline]
epc : vmap_pages_pud_range mm/vmalloc.c:489 [inline]
epc : vmap_pages_p4d_range mm/vmalloc.c:507 [inline]
epc : vmap_small_pages_range_noflush+0x2fa/0x38e mm/vmalloc.c:529
 ra : vmap_pages_pte_range mm/vmalloc.c:448 [inline]
 ra : vmap_pages_pmd_range mm/vmalloc.c:471 [inline]
 ra : vmap_pages_pud_range mm/vmalloc.c:489 [inline]
 ra : vmap_pages_p4d_range mm/vmalloc.c:507 [inline]
 ra : vmap_small_pages_range_noflush+0x2fa/0x38e mm/vmalloc.c:529
epc : ffffffff8036c3e4 ra : ffffffff8036c3e4 sp : ffffffe00984b900
 gp : ffffffff845906e0 tp : ffffffe007d817c0 t0 : ffffffe008f1d000
 t1 : ffffffc4011e39ff t2 : 0000004000010015 s0 : ffffffe00984b9b0
 s1 : ffffffcf02244700 a0 : 0000000000000000 a1 : 00000000000f0000
 a2 : 0000000000000002 a3 : ffffffff8036c3e4 a4 : ffffffe007d827c0
 a5 : 0000000000000000 a6 : 0000000000f00000 a7 : f310d86cfc0c1a00
 s2 : ffffffe005a00a28 s3 : ffffffff85b45000 s4 : ffffffff85b46000
 s5 : 0000000000000000 s6 : 0000000000000200 s7 : ffffffe07fdfd168
 s8 : ffffffe00e09f528 s9 : 0000003100000000 s10: ffffffe008eb8fa0
 s11: 00000000000000c7 t3 : 0000000000000000 t4 : 0000000000000040
 t5 : ffffffc4011e3a00 t6 : ffffffd00067e2d0
status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
[<ffffffff8036c3e4>] vmap_pages_pte_range mm/vmalloc.c:448 [inline]
[<ffffffff8036c3e4>] vmap_pages_pmd_range mm/vmalloc.c:471 [inline]
[<ffffffff8036c3e4>] vmap_pages_pud_range mm/vmalloc.c:489 [inline]
[<ffffffff8036c3e4>] vmap_pages_p4d_range mm/vmalloc.c:507 [inline]
[<ffffffff8036c3e4>] vmap_small_pages_range_noflush+0x2fa/0x38e mm/vmalloc.c:529
[<ffffffff80375a7a>] vmap_pages_range_noflush mm/vmalloc.c:558 [inline]
[<ffffffff80375a7a>] vmap_pages_range mm/vmalloc.c:592 [inline]
[<ffffffff80375a7a>] __vmalloc_area_node mm/vmalloc.c:2829 [inline]
[<ffffffff80375a7a>] __vmalloc_node_range+0x396/0x582 mm/vmalloc.c:2915
[<ffffffff80013c06>] bpf_jit_alloc_exec+0x46/0x52 arch/riscv/net/bpf_jit_core.c:171
[<ffffffff801f3d2a>] bpf_jit_binary_alloc+0xac/0x172 kernel/bpf/core.c:872
[<ffffffff80013a3a>] bpf_int_jit_compile+0x754/0x8da arch/riscv/net/bpf_jit_core.c:108
[<ffffffff801f59e0>] bpf_prog_select_runtime+0x258/0x2e4 kernel/bpf/core.c:1867
[<ffffffff821f9af2>] bpf_migrate_filter+0x1d6/0x23c net/core/filter.c:1294
[<ffffffff82201854>] bpf_prepare_filter net/core/filter.c:1342 [inline]
[<ffffffff82201854>] __get_filter+0x1d6/0x2d0 net/core/filter.c:1511
[<ffffffff82202992>] sk_attach_filter+0x22/0x11a net/core/filter.c:1526
[<ffffffff82154d82>] sock_setsockopt+0x18c4/0x1c2c net/core/sock.c:1068
[<ffffffff82145172>] __sys_setsockopt+0x2de/0x33c net/socket.c:2113
[<ffffffff8214520a>] __do_sys_setsockopt net/socket.c:2128 [inline]
[<ffffffff8214520a>] sys_setsockopt+0x3a/0x4c net/socket.c:2125
[<ffffffff8000562c>] ret_from_syscall+0x0/0x2
irq event stamp: 946
hardirqs last  enabled at (945): [<ffffffff8037e5e4>] rmqueue_pcplist mm/page_alloc.c:3506 [inline]
hardirqs last  enabled at (945): [<ffffffff8037e5e4>] rmqueue mm/page_alloc.c:3529 [inline]
hardirqs last  enabled at (945): [<ffffffff8037e5e4>] get_page_from_freelist+0xc50/0xf66 mm/page_alloc.c:3991
hardirqs last disabled at (946): [<ffffffff80005570>] _save_context+0x80/0x90
softirqs last  enabled at (942): [<ffffffff82b272a0>] softirq_handle_end kernel/softirq.c:402 [inline]
softirqs last  enabled at (942): [<ffffffff82b272a0>] __do_softirq+0x5e0/0x8c4 kernel/softirq.c:588
softirqs last disabled at (921): [<ffffffff80036760>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
softirqs last disabled at (921): [<ffffffff80036760>] invoke_softirq kernel/softirq.c:440 [inline]
softirqs last disabled at (921): [<ffffffff80036760>] __irq_exit_rcu kernel/softirq.c:637 [inline]
softirqs last disabled at (921): [<ffffffff80036760>] irq_exit+0x1a0/0x1b6 kernel/softirq.c:661
---[ end trace f164002e4a3f575f ]---
------------[ cut here ]------------
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:305 vunmap_pte_range mm/vmalloc.c:305 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:305 vunmap_pmd_range mm/vmalloc.c:329 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:305 vunmap_pud_range mm/vmalloc.c:354 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:305 vunmap_p4d_range mm/vmalloc.c:377 [inline]
WARNING: CPU: 1 PID: 2996 at mm/vmalloc.c:305 vunmap_range_noflush+0x206/0x308 mm/vmalloc.c:408
Modules linked in:
CPU: 1 PID: 2996 Comm: dhcpcd Tainted: G        W         5.13.0-rc1-syzkaller-00629-gbab0d47c0ebb #0
Hardware name: riscv-virtio,qemu (DT)
epc : vunmap_pte_range mm/vmalloc.c:305 [inline]
epc : vunmap_pmd_range mm/vmalloc.c:329 [inline]
epc : vunmap_pud_range mm/vmalloc.c:354 [inline]
epc : vunmap_p4d_range mm/vmalloc.c:377 [inline]
epc : vunmap_range_noflush+0x206/0x308 mm/vmalloc.c:408
 ra : vunmap_pte_range mm/vmalloc.c:305 [inline]
 ra : vunmap_pmd_range mm/vmalloc.c:329 [inline]
 ra : vunmap_pud_range mm/vmalloc.c:354 [inline]
 ra : vunmap_p4d_range mm/vmalloc.c:377 [inline]
 ra : vunmap_range_noflush+0x206/0x308 mm/vmalloc.c:408
epc : ffffffff80372b18 ra : ffffffff80372b18 sp : ffffffe00984b820
 gp : ffffffff845906e0 tp : ffffffe007d817c0 t0 : ffffffe008f1d000
 t1 : 0000000000000001 t2 : 0000004000010015 s0 : ffffffe00984b8b0
 s1 : ffffffe005a00a28 a0 : 0000000000000000 a1 : 00000000000f0000
 a2 : 0000000000000002 a3 : ffffffff80372b18 a4 : ffffffe007d827c0
 a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffff80374a74
 s2 : ffffffff85b45000 s3 : ffffffff85b47000 s4 : 0000000000000000
 s5 : ffffffe07fdfd168 s6 : 0000000000001000 s7 : ffffffff85b47000
 s8 : ffffffff85b46fff s9 : 0000000000000000 s10: 0000000000000200
 s11: ffffffff83858890 t3 : f310d86cfc0c1a00 t4 : 0000000000000040
 t5 : ffffffc4011e3a00 t6 : ffffffd00067e2d0
status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
[<ffffffff80372b18>] vunmap_pte_range mm/vmalloc.c:305 [inline]
[<ffffffff80372b18>] vunmap_pmd_range mm/vmalloc.c:329 [inline]
[<ffffffff80372b18>] vunmap_pud_range mm/vmalloc.c:354 [inline]
[<ffffffff80372b18>] vunmap_p4d_range mm/vmalloc.c:377 [inline]
[<ffffffff80372b18>] vunmap_range_noflush+0x206/0x308 mm/vmalloc.c:408
[<ffffffff80372c4a>] free_unmap_vmap_area+0x30/0x68 mm/vmalloc.c:1722
[<ffffffff80374b82>] remove_vm_area+0x150/0x152 mm/vmalloc.c:2462
[<ffffffff80374dce>] vm_remove_mappings mm/vmalloc.c:2491 [inline]
[<ffffffff80374dce>] __vunmap+0x24a/0x616 mm/vmalloc.c:2556
[<ffffffff8037525a>] __vfree+0x70/0xf8 mm/vmalloc.c:2613
[<ffffffff80375b9c>] __vmalloc_area_node mm/vmalloc.c:2840 [inline]
[<ffffffff80375b9c>] __vmalloc_node_range+0x4b8/0x582 mm/vmalloc.c:2915
[<ffffffff80013c06>] bpf_jit_alloc_exec+0x46/0x52 arch/riscv/net/bpf_jit_core.c:171
[<ffffffff801f3d2a>] bpf_jit_binary_alloc+0xac/0x172 kernel/bpf/core.c:872
[<ffffffff80013a3a>] bpf_int_jit_compile+0x754/0x8da arch/riscv/net/bpf_jit_core.c:108
[<ffffffff801f59e0>] bpf_prog_select_runtime+0x258/0x2e4 kernel/bpf/core.c:1867
[<ffffffff821f9af2>] bpf_migrate_filter+0x1d6/0x23c net/core/filter.c:1294
[<ffffffff82201854>] bpf_prepare_filter net/core/filter.c:1342 [inline]
[<ffffffff82201854>] __get_filter+0x1d6/0x2d0 net/core/filter.c:1511
[<ffffffff82202992>] sk_attach_filter+0x22/0x11a net/core/filter.c:1526
[<ffffffff82154d82>] sock_setsockopt+0x18c4/0x1c2c net/core/sock.c:1068
[<ffffffff82145172>] __sys_setsockopt+0x2de/0x33c net/socket.c:2113
[<ffffffff8214520a>] __do_sys_setsockopt net/socket.c:2128 [inline]
[<ffffffff8214520a>] sys_setsockopt+0x3a/0x4c net/socket.c:2125
[<ffffffff8000562c>] ret_from_syscall+0x0/0x2
irq event stamp: 964
hardirqs last  enabled at (963): [<ffffffff82b264ac>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160 [inline]
hardirqs last  enabled at (963): [<ffffffff82b264ac>] _raw_spin_unlock_irqrestore+0x68/0x98 kernel/locking/spinlock.c:191
hardirqs last disabled at (964): [<ffffffff80005570>] _save_context+0x80/0x90
softirqs last  enabled at (956): [<ffffffff82b272a0>] softirq_handle_end kernel/softirq.c:402 [inline]
softirqs last  enabled at (956): [<ffffffff82b272a0>] __do_softirq+0x5e0/0x8c4 kernel/softirq.c:588
softirqs last disabled at (949): [<ffffffff80036760>] do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
softirqs last disabled at (949): [<ffffffff80036760>] invoke_softirq kernel/softirq.c:440 [inline]
softirqs last disabled at (949): [<ffffffff80036760>] __irq_exit_rcu kernel/softirq.c:637 [inline]
softirqs last disabled at (949): [<ffffffff80036760>] irq_exit+0x1a0/0x1b6 kernel/softirq.c:661
---[ end trace f164002e4a3f5760 ]---


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
