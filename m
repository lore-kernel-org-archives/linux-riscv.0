Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15077C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 00:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+yLrisJXET9V6ahJDPst7ZmzyUQIkd45ezng2EwBtTE=; b=FCVXtnerqKD8CV
	OC1ydUp836chICJdDgWa7QDQb8FviYFDLegat+izitUsxm/6afhXfdN4Siu0bFaHDLYifbbfJJvDi
	YPiXSMNqz8YM663c45L6TUbkcsCOE60lBYdbXT8Yuys8WQIGfSGngxs3gZpazGpZARihJkaZIhA33
	OvOQnE901KSWC5srONFaEPPlDt5tl7U8ZVrti5G2JkdDqAwYboQNjGQGd3ae354K+nyXDprvILAMm
	LPTOrWI2ZgeizJq1Szc2DRXuA4MKAIAwAWQ/87JTTiHljL43CP6fgzzor1WvcmR7wKm0fPxvpEuYm
	5z52BDS2E6jOZLnJU1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohJtt-00EfDK-1k; Sun, 09 Oct 2022 00:10:37 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohJtq-00EfD1-2j
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 00:10:35 +0000
Received: by mail-io1-xd2f.google.com with SMTP id d142so209521iof.7
        for <linux-riscv@lists.infradead.org>; Sat, 08 Oct 2022 17:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=15oc9m8n2xwY6xpL8a57e3IzKuUTIHwFjT6itr66zac=;
        b=tE/os1UiuXq/C8ayyuX+EArJiQvaPN4EzEb7w38rLcTlyRduUMjIwpU7DY9ontsitp
         5dtzhRjNMIligqEcF4sEgT9oL5PfoO1tsNX5ChYp2Jn6Qz75kKITqOpWiWwXuemqB8NL
         yp4HI6YSrwXol8qliF/BMGpm163FHkUWbxUYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15oc9m8n2xwY6xpL8a57e3IzKuUTIHwFjT6itr66zac=;
        b=lAUsqWzsOV33VP3MjI9YIob5xSBJtb/dxUrQciVs+jnQaIj5GOVYVfdtoRzsDDB8xZ
         VYdFHf0yLMxbjPXLXHvBwpGjgZ+xaZZ3attATcukdH+dKYrKORXFEQp2ELqSJPZzkydt
         8czQtCy5rDivVZn2BnSXpG/8Qnpmtcp/CjgO56rcJehJZu6KGjnyyQwDTt00PEwPPOS3
         MfBV7qAyjAs5+oYtsf4pz6WcWxDLGphWogiYqJ7puCMI4rPUbrOINkPG7oMvB2ZOdDSr
         d71GIdRBBQ+mUdQErPkeqjCtH1bdwNIihE6IjZ4SxAWvXddfzvtHE58svUMuNUpCGHhz
         7AKA==
X-Gm-Message-State: ACrzQf04XBVjdLkRLY8tZAtL43mIZTNfA71BqYbhnHPYn5ivWI9PeRqU
	L38yzHDxrxfAbCSo0NzLqXksDKkPT1k+adbBrhjiIXInwEFM
X-Google-Smtp-Source: AMsMyM6iOOm3u6L0Z165Qjt3AzMz92halW/7pfz0wuQEn8//96mDr4v8/S2jcbdpF8UMNC/hggCWguJ06h1idvHAPgI=
X-Received: by 2002:a05:6638:2602:b0:35a:66ec:8d99 with SMTP id
 m2-20020a056638260200b0035a66ec8d99mr6349188jat.170.1665274228774; Sat, 08
 Oct 2022 17:10:28 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 8 Oct 2022 17:10:18 -0700
Message-ID: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
Subject: KASAN/pcpu_alloc related panics on v6.0
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_171034_368809_6286284A 
X-CRM114-Status: UNSURE (   8.38  )
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

Hi All,
Palmer reported some KASAN/pcpu_alloc related panics on v6.0. Here is
one of them

[   39.350391] Unable to handle kernel paging request at virtual
address ffebfffeffff3000
[   39.354419] Oops [#1]
[   39.355081] Modules linked in:
[   39.356203] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0 #36
[   39.357621] Hardware name: riscv-virtio,qemu (DT)
[   39.358773] epc : kasan_check_range+0x9e/0x14e
[   39.361299]  ra : memset+0x1e/0x4c
[   39.362118] epc : ffffffff8030c1f8 ra : ffffffff8030c936 sp :
ff60000003367a80
[   39.363114]  gp : ffffffff82388b40 tp : ff60000003358000 t0 :
ffebffff009d977c
[   39.364264]  t1 : ffebfffeffff301f t2 : ffffffff80783bf6 s0 :
ff60000003367ab0
[   39.365584]  s1 : 0000000000000100 a0 : ffebfffeffff3020 a1 :
0000000000000100
[   39.366538]  a2 : 0000000000000001 a3 : ffffffff802954bc a4 :
ff5ffffffff98000
[   39.367493]  a5 : ffebfffeffff3000 a6 : 0000000400000000 a7 :
ff5ffffffff980ff
[   39.368864]  s2 : ff5ffffffff98000 s3 : 0000000000000000 s4 :
ff6000003fdf1b00
[   39.370208]  s5 : ff600000041b9b38 s6 : ffffffff8238b600 s7 :
0000000000000008
[   39.371168]  s8 : ffffffff823a4060 s9 : 0000000000000000 s10:
ff5ffffffff98000
[   39.372330]  s11: 0000000000000100 t3 : 0000000000000000 t4 :
0000000000000004
[   39.373444]  t5 : ffebfffeffff3020 t6 : 0000000000000003
[   39.374205] status: 0000000200000120 badaddr: ffebfffeffff3000
cause: 000000000000000d
[   39.375783] [<ffffffff802954bc>] pcpu_alloc+0x4c8/0xac4
[   39.377520] [<ffffffff80295ae4>] __alloc_percpu+0x14/0x1c
[   39.378336] [<ffffffff806b30f8>] blk_mq_init_allocated_queue+0xfc/0x87c
[   39.379294] [<ffffffff806b4b00>] __blk_mq_alloc_disk+0x62/0xbc
[   39.380397] [<ffffffff808e03ec>] loop_add+0x24a/0x4fa
[   39.381472] [<ffffffff81033e26>] loop_init+0xfe/0x122
[   39.382394] [<ffffffff80002e2a>] do_one_initcall+0xda/0x460
[   39.383369] [<ffffffff8100166c>] kernel_init_freeable+0x39c/0x404
[   39.384722] [<ffffffff80e7b890>] kernel_init+0x20/0x122
[   39.385605] [<ffffffff8000492e>] ret_from_exception+0x0/0x10
[   39.389031] ---[ end trace 0000000000000000 ]---


This one is easily reproducible with the following additional config enabled.

$ cat configs/linux/kasan_provelock
CONFIG_PROVE_LOCKING=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_KASAN=y
# CONFIG_KASAN_VMALLOC is not set
CONFIG_STRICT_KERNEL_RWX=y

This issue has been there since v5.18. v5.17 works fine though.
Git bisection pointed to a wrong powerpc commit probably because of
the following reason.

RISC-V v5.18 merge window PR was based on v5.17-rc1 which had other
similar kasan issues w.r.to sv48
which confused the bisect. But v5.17 works fine because the issues
were fixed as a part of late PR on top of v5.17-rc7
(https://lore.kernel.org/lkml/164642532157.24805.457490534031372221.pr-tracker-bot@kernel.org/T/)

Inspecting the RISC-V commits manually on 5.18-rc1(also fails) seems
to indicate that there is probably a cause.

Enabling sv57 with kasan triggers this panic. I verified that in two ways.

1. Reverted the below sv57 patches from 5.18-rc1 and it boots fine.

8fbdccd2b173 riscv: mm: Support kasan for sv57
011f09d12052 riscv: mm: Set sv57 on defaultly
677b9eb8810e riscv: mm: Prepare pt_ops helper functions for sv57
d10efa21a937 riscv: mm: Control p4d's folding by pgtable_l5_enabled

2. Disabled sv57 in Qemu on v6.0 and it boots fine.

I am yet to find out the exact fix that would solve the panic pointed
out by Kasan on sv57 though.
@Alexandre Ghiti Is it possible for you to take a look ?

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
