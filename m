Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCCFC2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 06:59:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C285260E0C
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 06:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C285260E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dEGwyb9u1XNEybSNIaM63zYxWhRYfpuWoNDP8taY1Og=; b=OhF3UADK5fpyBsJcZPM+9rUYwK
	Xx/tGiXS8ZtzwUD/95S55y70PiryRStIQc8LpCR5l1d9N7oO6Ut2EckRcRGKiP7503EGaDFYZo+4m
	r9rRFmDootVbblHi9vOBqpNUTd7X8Y86Bujp6b4/ppQ2s9JqzBo9M+gortbulZeb2LcLbVwRN7yeK
	XICGZ/l0tS81tpocEgbZhHUOc9sP1WNcoNkqqPkywoWsrQXBzN163tv9Ro32RLiwUD30fuZFrs5Xl
	kkvH/xEJ2Ltq9FhTriqALNyUvQ1mQM00KCI7cQuA+8rXc10ZvIOfiV1wAtIlN7bySB/yge+CvqWPR
	RpJiGqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUwX-00GXc8-Nf; Sat, 19 Jun 2021 06:59:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUwI-00GXb4-6e
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 06:58:48 +0000
Received: by mail-pg1-x52f.google.com with SMTP id n12so977345pgs.13
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jun 2021 23:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5Tj5VBfCDbHRxlPn8EtoNBakme15m1U4y437Ov6/kw=;
 b=Zmz0Z57zzTZN7vi+XP62G9zO+kHJ3UaMg5mFKyYQdIyu+26sNfCxPtP67wwyyQRXah
 NFvcbF7aNBAOkwI0T5s9T0LcoblIGAggFwTJBU7O9SztNvJ9ijCzw/c6JzEVUFo7b4lX
 iQ8AkJOcNXj+Pi2vhepIP2cFpbD077ujcNJtgkcfsL7FrGpVxXtdRdPmwCDdh72tuLZ3
 /10HhOoPOO1LzYgcK/hJEYxo8QE+F7VqeiKzRVQ6N/PW2A9OusIcNGgAkZxFLtS1hn/M
 E09LD3JEpUbfE3IlMCZcP7GTpVuqC4QUBd2EYXsSKqh8Kv29EkicGMIEwuumYqRddBhP
 Fgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Y5Tj5VBfCDbHRxlPn8EtoNBakme15m1U4y437Ov6/kw=;
 b=JZHthFnYg7cpUFUBk2jjX5/kYM5fXHbH5eyUi3nczEpG8TNGjtAtkTpJm+5nE2k25a
 DVlAhhVMwcIZ98kGQt1agY5JSs64Y3A8IYrY/6n/l7AeqA8QRQoCx8tT9gxBRnuURV4p
 oKNavOCNHvtkNBL2yBI0Qap/9RgAm/1zDA2+iTqvd79A3Q/QcoVy0iNGrHS7To4c0XiC
 XZXYJW0ow3EmF6xoDCXH4KAUJLaHiTAUyd7oe0Yj2vbzYlo9M8gk7B3QRrFABDqQSmJr
 dnNq9ODmS+2KXqpgNOPcblzKTzw1V+VuG+WzPqgNXTZdh2doUysERWavGRy8GHQ4G1gg
 TFPg==
X-Gm-Message-State: AOAM532OxBuOzQCe7S0T/XXrmVEj31rpsF7mykfcLuauOSDLXgqktttb
 vG06sx+glSY0GVfw537aLj5rxA==
X-Google-Smtp-Source: ABdhPJzPs85UcA/yDB5qZB1bEIJzU2KAQlxMsL2vm1BBiNkWPW/rGjtp8QleDURaiSUBQCMWz6jMDA==
X-Received: by 2002:aa7:83c3:0:b029:2e8:f2ba:3979 with SMTP id
 j3-20020aa783c30000b02902e8f2ba3979mr8852013pfn.8.1624085925610; 
 Fri, 18 Jun 2021 23:58:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b21sm10769551pgj.74.2021.06.18.23.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:58:45 -0700 (PDT)
Date: Fri, 18 Jun 2021 23:58:45 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Jun 2021 23:58:32 PDT (-0700)
Subject: Re: [PATCH v3] riscv: Ensure BPF_JIT_REGION_START aligned with PMD
 size
In-Reply-To: <20210618220913.6fde1957@xhacker>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com, songliubraving@fb.com,
 yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, alex@ghiti.fr,
 linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn, schwab@linux-m68k.org
Message-ID: <mhng-3008635e-9a78-413a-8b99-d20a14c5494b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_235846_298444_8DB2A9F2 
X-CRM114-Status: GOOD (  30.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jun 2021 07:09:13 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Andreas reported commit fc8504765ec5 ("riscv: bpf: Avoid breaking W^X")
> breaks booting with one kind of defconfig, I reproduced a kernel panic
> with the defconfig:
>
> [    0.138553] Unable to handle kernel paging request at virtual address ffffffff81201220
> [    0.139159] Oops [#1]
> [    0.139303] Modules linked in:
> [    0.139601] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5-default+ #1
> [    0.139934] Hardware name: riscv-virtio,qemu (DT)
> [    0.140193] epc : __memset+0xc4/0xfc
> [    0.140416]  ra : skb_flow_dissector_init+0x1e/0x82
> [    0.140609] epc : ffffffff8029806c ra : ffffffff8033be78 sp : ffffffe001647da0
> [    0.140878]  gp : ffffffff81134b08 tp : ffffffe001654380 t0 : ffffffff81201158
> [    0.141156]  t1 : 0000000000000002 t2 : 0000000000000154 s0 : ffffffe001647dd0
> [    0.141424]  s1 : ffffffff80a43250 a0 : ffffffff81201220 a1 : 0000000000000000
> [    0.141654]  a2 : 000000000000003c a3 : ffffffff81201258 a4 : 0000000000000064
> [    0.141893]  a5 : ffffffff8029806c a6 : 0000000000000040 a7 : ffffffffffffffff
> [    0.142126]  s2 : ffffffff81201220 s3 : 0000000000000009 s4 : ffffffff81135088
> [    0.142353]  s5 : ffffffff81135038 s6 : ffffffff8080ce80 s7 : ffffffff80800438
> [    0.142584]  s8 : ffffffff80bc6578 s9 : 0000000000000008 s10: ffffffff806000ac
> [    0.142810]  s11: 0000000000000000 t3 : fffffffffffffffc t4 : 0000000000000000
> [    0.143042]  t5 : 0000000000000155 t6 : 00000000000003ff
> [    0.143220] status: 0000000000000120 badaddr: ffffffff81201220 cause: 000000000000000f
> [    0.143560] [<ffffffff8029806c>] __memset+0xc4/0xfc
> [    0.143859] [<ffffffff8061e984>] init_default_flow_dissectors+0x22/0x60
> [    0.144092] [<ffffffff800010fc>] do_one_initcall+0x3e/0x168
> [    0.144278] [<ffffffff80600df0>] kernel_init_freeable+0x1c8/0x224
> [    0.144479] [<ffffffff804868a8>] kernel_init+0x12/0x110
> [    0.144658] [<ffffffff800022de>] ret_from_exception+0x0/0xc
> [    0.145124] ---[ end trace f1e9643daa46d591 ]---
>
> After some investigation, I think I found the root cause: commit
> 2bfc6cd81bd ("move kernel mapping outside of linear mapping") moves
> BPF JIT region after the kernel:
>
> | #define BPF_JIT_REGION_START	PFN_ALIGN((unsigned long)&_end)
>
> The &_end is unlikely aligned with PMD size, so the front bpf jit
> region sits with part of kernel .data section in one PMD size mapping.
> But kernel is mapped in PMD SIZE, when bpf_jit_binary_lock_ro() is
> called to make the first bpf jit prog ROX, we will make part of kernel
> .data section RO too, so when we write to, for example memset the
> .data section, MMU will trigger a store page fault.
>
> To fix the issue, we need to ensure the BPF JIT region is PMD size
> aligned. This patch acchieve this goal by restoring the BPF JIT region
> to original position, I.E the 128MB before kernel .text section. The
> modification to kasan_init.c is inspired by Alexandre.
>
> Fixes: fc8504765ec5 ("riscv: bpf: Avoid breaking W^X")
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Since v2:
>  - Split the local vars rename modification into another patch per Alexandre
>    suggestion
>  - Add Fixes tag
>
> Since v1:
>  - Fix early boot hang when kasan is enabled
>  - Update Documentation/riscv/vm-layout.rst
>
>  Documentation/riscv/vm-layout.rst | 4 ++--
>  arch/riscv/include/asm/pgtable.h  | 5 ++---
>  arch/riscv/mm/kasan_init.c        | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index 329d32098af4..b7f98930d38d 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -58,6 +58,6 @@ RISC-V Linux Kernel SV39
>                                                                |
>    ____________________________________________________________|____________________________________________________________
>                      |            |                  |         |
> -   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules
> -   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel, BPF
> +   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
> +   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
>    __________________|____________|__________________|_________|____________________________________________________________
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9469f464e71a..380cd3a7e548 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -30,9 +30,8 @@
>
>  #define BPF_JIT_REGION_SIZE	(SZ_128M)
>  #ifdef CONFIG_64BIT
> -/* KASLR should leave at least 128MB for BPF after the kernel */
> -#define BPF_JIT_REGION_START	PFN_ALIGN((unsigned long)&_end)
> -#define BPF_JIT_REGION_END	(BPF_JIT_REGION_START + BPF_JIT_REGION_SIZE)
> +#define BPF_JIT_REGION_START	(BPF_JIT_REGION_END - BPF_JIT_REGION_SIZE)
> +#define BPF_JIT_REGION_END	(MODULES_END)
>  #else
>  #define BPF_JIT_REGION_START	(PAGE_OFFSET - BPF_JIT_REGION_SIZE)
>  #define BPF_JIT_REGION_END	(VMALLOC_END)
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 9daacae93e33..55c113345460 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -201,7 +201,7 @@ void __init kasan_init(void)
>
>  	/* Populate kernel, BPF, modules mapping */
>  	kasan_populate(kasan_mem_to_shadow((const void *)MODULES_VADDR),
> -		       kasan_mem_to_shadow((const void *)BPF_JIT_REGION_END));
> +		       kasan_mem_to_shadow((const void *)MODULES_VADDR + SZ_2G));
>
>  	for (i = 0; i < PTRS_PER_PTE; i++)
>  		set_pte(&kasan_early_shadow_pte[i],

Thanks, this is on fixes.  With the previous fix also applied it still 
boots for me.

Andreas: I saw you indicate that a subset of this (without the kasan 
chunk, which was breaking for me) fixed your boot issue, but I don't see 
a direct confirmation of that.  LMK if there's still an issue on your 
end, otherwise I'm going to assume this is solved.

Thanks for sorting this out!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
