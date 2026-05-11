Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBD7CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2bcw9zWUpBNI+AOs2kK+FJ86gju/DR+zhzt4IxySdH8=; b=w+0IfAQwe5e3WR
	JgrsroFuzs7l0wct+dvBlv7J1+ivdbPwBOhtS8MamzucrZcG+EzgzsToeYHW84Tw9LsIKkIHJCdda
	TkwJckR2t8ljixmwBFWGfDwKMSKwcCxj5YZGlsPAnG4fyAn2MtHMFq86BeCNaMKOA9Tn4AQgA9F1r
	CBcUES+OTC4fQdyKDPO35QLW01X7qnlUhqztebwLskNE98O7xmN64vTulK8257VnkeL3nNsn2TvVL
	h/l4Ts1Rx+GE7BkFAFQd/XaUCIDC0icJLPWvQgEjTiVEJ536Jug4Gr0vclVpS7KnH6q651cLDZyc6
	eUVmks1B92QPMg+AwCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN02-0000000CwPa-3K6G;
	Mon, 11 May 2026 09:32:30 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMzz-0000000CwOU-2QKN
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 09:32:29 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a9076813bso1591930e0c.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 02:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491945; x=1779096745;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Nrzls/aY5F/88Jsnwy7xDyfA7Q7OHE0DPx4RzZ5fDw=;
        b=m0NH+Be4l+3L7FrAKEtqMigh8tErsoSbDAJPpDfkZND/2ovzbAiPeCNv5PpANCK7m9
         VzyoJ8vUDOmXteInPlYMPHqqlXQrjD2vrx+yRjNbkXk4DBQgXyqWI7uBcmJmd8JsC8oI
         WQDbJU3rmAlSPJ6Fj+o/YKjvJESL7eARIywABCdzeD2SqNAnyqq4JnTH/O/DNmYiL/zI
         TlqiBmk4OaaXZ31RsKuLIMwC2Ro6wve0xw26bl9LTNPt9ckG3HRjciCPddK3K2JrWGht
         Y3jDCYiHqoSis4IatRN13rDvcOb+ITj4wIRlSi4Y8njMNPDpronhcDZm5I12fV3nU/Ad
         WTwA==
X-Gm-Message-State: AOJu0Yx1iA6F4xRaAtrE+Gxt3LayHFaJC+9VY4CECNMsRM4949/2H5h1
	OGMMCupwJPiSAV9U+co8QfZvHFRSQPi2XKVKjDjlBDQDP9fYZcVVjcPG7fNDFoW6
X-Gm-Gg: Acq92OEfJz7j8aJPR4tBL96bc0x80TJMQhVZFpB7vVHtAE9AVXIu7/H1YRSR8YWx+0O
	HHVjWhrmDjbLNqkQHNIa8nwcqICNRWnJlplY08KnU9FLQddxNFDHvSet75AcIxtpMuXOpzyupa8
	Q2RiSVFGjHXZoGnpjyvNRjzsfGufLSwkuV3zMNWX7/eoT+pGCvJc6P4sTw4qYazNBo3L5pcT2eA
	kbgjhEoQK0qQ81PqGP7oL22+9VWgaVePKe89VvMfK95tseE6HgFxVOKeiGRVcSFpdNWfUPR8e+I
	DnrlPG3JEC27NXiJY0hJn90Q9lzzdVQwWEdkriTpf//5tLEdeKr3ZlP6t2c3QcHz+S1hTE/Ac1y
	5xVyULAuxZf6zviUND2/8yPSQRncfBCFq0mxPDipt9A2M+UGi5ccMQ9PiRSW17LL/ZT/TdMu0tb
	ggTI1MAfdJiBiRQBllEyMzM5b/eIcg8zyVPUUaxr7ZG9Zijoy5HiDFQaegeo2hyTNo
X-Received: by 2002:a05:6122:3d08:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-575864d866dmr5663915e0c.9.1778491945279;
        Mon, 11 May 2026 02:32:25 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm19692212e0c.18.2026.05.11.02.32.24
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:32:25 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57513a91514so1214564e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 02:32:24 -0700 (PDT)
X-Received: by 2002:a05:6122:3d08:b0:56f:2609:cd95 with SMTP id
 71dfb90a1353d-575864d866dmr5663907e0c.9.1778491944525; Mon, 11 May 2026
 02:32:24 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 11:32:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_Y6Sis7776SEjoPZP2NQ8sO7dUbWLF4oCZnWOWQy5vQ@mail.gmail.com>
X-Gm-Features: AVHnY4J6wptwE4Y5YbQ0RNvAcYZuakxv9GbDOHanQCgeHqKHbSOCIBpnNysMsU8
Message-ID: <CAMuHMdX_Y6Sis7776SEjoPZP2NQ8sO7dUbWLF4oCZnWOWQy5vQ@mail.gmail.com>
Subject: Unable to handle kernel NULL pointer dereference in percpu_ref_get()
To: cgroups@vger.kernel.org, netdev <netdev@vger.kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023227_631944_CCD2C0AB 
X-CRM114-Status: GOOD (  14.17  )
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

Hi all,

After merging v7.1-rc3, booting the kernel on RZ/Five hung.
When retrying with "earlycon keep_bootcon", I managed to catch the
crash report below.  Unfortunately I could not reproduce it after that,
hence no bisection result, but perhaps this rings a bell?

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000000
    Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x00000000494f7000
    [0000000000000000] pgd=0000000000000000, p4d=0000000000000000,
pud=0000000000000000
    Oops [#1]
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
7.1.0-rc3-rzfive-02022-ge48a16cf2dd1 #515 PREEMPT
    Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    epc : percpu_ref_get+0x32/0x40
     ra : percpu_ref_get+0x10/0x40
    epc : ffffffff80089562 ra : ffffffff80089540 sp : ffffffc60000bb10
     gp : ffffffff812ea908 tp : ffffffd6018c9a00 t0 : ffffffd601997800
     t1 : ffffffff80df6a2f t2 : 69676552203a5445 s0 : ffffffc60000bb30
     s1 : ffffffff81291f18 a0 : ffffffff81291f18 a1 : 0000000000000002
     a2 : 0000000000000000 a3 : 0000000000000001 a4 : 0000000000000000
     a5 : 0000000200000022 a6 : 0000000000000508 a7 : 0000000000000038
     s2 : ffffffff8128f4f8 s3 : 0000000000001000 s4 : ffffffff812c9978
     s5 : 0000000000000010 s6 : 0000000000000000 s7 : ffffffff812ee3f8
     s8 : ffffffff80a21e58 s9 : 0000000000000008 s10: ffffffff808000aa
     s11: 0000000000000000 t3 : ffffffff812fd06f t4 : ffffffff812fd06f
     t5 : ffffffff812fd070 t6 : ffffffd6018aaa7c ssp : 0000000000000000
    status: 0000000200000100 badaddr: 0000000000000000 cause: 000000000000000d
    [<ffffffff80089562>] percpu_ref_get+0x32/0x40
    [<ffffffff8008eac8>] cgroup_sk_alloc+0x40/0x6e
    [<ffffffff8055ae8a>] sk_alloc+0xb4/0xdc
    [<ffffffff805b7718>] __netlink_create+0x32/0x8a
    [<ffffffff805b984a>] __netlink_kernel_create+0x60/0x182
    [<ffffffff80584492>] rtnetlink_net_init+0x4e/0x7a
    [<ffffffff8056aacc>] ops_init+0xc6/0xf8
    [<ffffffff8056bc3c>] register_pernet_operations+0xd0/0x148
    [<ffffffff8056bce2>] register_pernet_subsys+0x2e/0x48
    [<ffffffff8082ccb4>] rtnetlink_init+0x18/0x54
    [<ffffffff8082d27c>] netlink_proto_init+0x11c/0x140
    [<ffffffff8080100a>] do_one_initcall+0x70/0x13c
    [<ffffffff808013b2>] kernel_init_freeable+0x274/0x276
    [<ffffffff806bda22>] kernel_init+0x1e/0x12a
    [<ffffffff8000d368>] ret_from_fork_kernel+0x10/0xa2
    [<ffffffff806c37f6>] ret_from_fork_kernel_asm+0x16/0x18
    Code: 00e7 20ef d9fe 60e2 6442 64a2 6105 8082 77f3 1001 (6314) 8b89
    ---[ end trace 0000000000000000 ]---
    note: swapper/0[1] exited with irqs disabled
    BUG: sleeping function called from invalid context at
include/linux/percpu-rwsem.h:51
    in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
    preempt_count: 0, expected: 0
    RCU nest depth: 2, expected: 0
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G      D
7.1.0-rc3-rzfive-02022-ge48a16cf2dd1 #515 PREEMPT
    Tainted: [D]=DIE
    Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    Call Trace:
    [<ffffffff8000fab6>] dump_backtrace+0x1c/0x24
    [<ffffffff80001226>] show_stack+0x2a/0x34
    [<ffffffff8000b57a>] dump_stack_lvl+0x32/0x4a
    [<ffffffff8000b5a6>] dump_stack+0x14/0x1c
    [<ffffffff8003861a>] __might_resched+0x110/0x11a
    [<ffffffff80038678>] __might_sleep+0x54/0x60
    [<ffffffff8002382e>] exit_signals+0x1e/0x140
    [<ffffffff80019858>] do_exit+0x14a/0x642
    [<ffffffff80019e24>] __riscv_sys_exit+0x0/0x1c
    [<ffffffff8000f50a>] die+0xdc/0xea
    [<ffffffff800015d4>] die_kernel_fault+0x1da/0x1e6
    [<ffffffff80012d20>] no_context+0x38/0x40
    [<ffffffff80012db2>] handle_page_fault+0x5e/0x23c
    [<ffffffff806bc9f8>] do_page_fault+0x1e/0x36
    [<ffffffff806c36da>] handle_exception+0x15e/0x16a
    [<ffffffff80089562>] percpu_ref_get+0x32/0x40
    [<ffffffff8008eac8>] cgroup_sk_alloc+0x40/0x6e
    [<ffffffff8055ae8a>] sk_alloc+0xb4/0xdc
    [<ffffffff805b7718>] __netlink_create+0x32/0x8a
    [<ffffffff805b984a>] __netlink_kernel_create+0x60/0x182
    [<ffffffff80584492>] rtnetlink_net_init+0x4e/0x7a
    [<ffffffff8056aacc>] ops_init+0xc6/0xf8
    [<ffffffff8056bc3c>] register_pernet_operations+0xd0/0x148
    [<ffffffff8056bce2>] register_pernet_subsys+0x2e/0x48
    [<ffffffff8082ccb4>] rtnetlink_init+0x18/0x54
    [<ffffffff8082d27c>] netlink_proto_init+0x11c/0x140
    [<ffffffff8080100a>] do_one_initcall+0x70/0x13c
    [<ffffffff808013b2>] kernel_init_freeable+0x274/0x276
    [<ffffffff806bda22>] kernel_init+0x1e/0x12a
    [<ffffffff8000d368>] ret_from_fork_kernel+0x10/0xa2
    [<ffffffff806c37f6>] ret_from_fork_kernel_asm+0x16/0x18
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
    ---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b ]---

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
