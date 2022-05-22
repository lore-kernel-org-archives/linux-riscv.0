Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD429C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqNkDOSYQp2EJ+cEEzb/7vwJMfVe0cy7F2ryTh7BhIs=; b=WVTfgxUSq8w2H3
	xPcEIiZCufkqKHj++NTQrGBzjW30Tz5wcW3fmLOgsuZhDKHisuIDYPPbaxNrIiPCiDtb2iaAJRj+x
	A8RP07AVPUKxQRrdMw3QF5+jB5FpKH+Xnu0/ICnq9U4mFTBrJyioRfN4vKEbnVH/+MJeJgKnOxLLu
	BonQeLg+5nAXSsFNiv+yVrbRqH4YwsImgE31IF4nsPc7blcUy9rjgndkrVgGo3yY4TuSCsuR8wyIx
	eG+o4HW/2ck4tRmSs90+o1Hqq+DP8k56lrx82jSATBnBPQbojZISSlq0iLg/6dDNGTvanJczN3CQU
	jlQk2D9I31+c0NUHNH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsgXK-000qSN-6m; Sun, 22 May 2022 08:02:02 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsgXH-000qRA-Eb
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 08:02:01 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id x2so20188024ybi.8
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iTR4F6Zdd5GmGSK+3VogNeE1cHs24uCXuHYRDacHFH0=;
 b=MBJcy6x7M7Ay+fMd3UCpbOdofujh5V0wLWk1jvv1/hY7Oa7ImjQ8OgaAtQePnZ/aLq
 U/EAPeSLh3jD4fmffjn2cDZZXRrNIaLJk3YuZbQpPT/o9BzjUzvSc6MVy3ZSz/ZjOl1E
 pG2ZoltJ4iKhV+27FTcEy3PdUAAnSoPfHIWXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTR4F6Zdd5GmGSK+3VogNeE1cHs24uCXuHYRDacHFH0=;
 b=PxJQZB7QUkqGiC/5NzTA7XZWr1gE0348Lh+rYxfxKWC2wXMuj0YBxkYBCEbr0kfdjQ
 RHs8tjQCjk3DAC5pSKnx0nR/kwLvKnJOr6dFmmDXN6KWuNxQBS/HI/gTCX0UYQk/Mjdw
 so04hvzUFMmomv0DGVZrUIIjo6EwpgItyCnKC6ySeeyEJLL3LwG4J2nDiDIoxcKAxeuj
 Ch5PUmn965zwIg9+dGgwymKP6HG9IfoeZY6Ls8CiEH+UHY7DZZR/K4iEJsL0F78JeIUQ
 rJsrbAl76UMVgyLyYTFa/UBftRqJr45ADdGSJTKxqJZ4SUjxtl0KFYzmXoEwEXhPFf3h
 wSZQ==
X-Gm-Message-State: AOAM530keUq5cdCl76qq2xWoo0VY5D4VfWgPh6DLSH2ybnBDrYWGduaQ
 UHudhM2MUpu+l46fphCICKud76VGqg3BmJpdXNt5
X-Google-Smtp-Source: ABdhPJytDIb72jnNAMvfjSVmqzrgWgR7LpO0kXNlntJZ5fXhvFnznaUNWXyONquMGqObNerCg+NKW/O3se66hI+ZDgQ=
X-Received: by 2002:a25:941:0:b0:64d:da87:62ff with SMTP id
 u1-20020a250941000000b0064dda8762ffmr16707944ybm.459.1653206518170; Sun, 22
 May 2022 01:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220521143456.2759-1-jszhang@kernel.org>
 <20220521143456.2759-2-jszhang@kernel.org>
In-Reply-To: <20220521143456.2759-2-jszhang@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 22 May 2022 01:01:47 -0700
Message-ID: <CAOnJCU+peNAHCWGvNhHV30h0t9oM5f3f_5=AtbHae=S8SrDAVA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] riscv: move sbi_init() earlier before
 jump_label_init()
To: Jisheng Zhang <jszhang@kernel.org>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_010159_508458_43B9429C 
X-CRM114-Status: GOOD (  21.92  )
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

On Sat, May 21, 2022 at 7:44 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> We call jump_label_init() in setup_arch() is to use static key
> mechanism earlier, but riscv jump label relies on the sbi functions,
> If we enable static key before sbi_init(), the code path looks like:
>   static_branch_enable()
>     ..
>       arch_jump_label_transform()
>         patch_text_nosync()
>           flush_icache_range()
>             flush_icache_all()
>               sbi_remote_fence_i() for CONFIG_RISCV_SBI case
>                 __sbi_rfence()
>

@Alexandre Ghiti : Is this the root cause of the panic you were seeing ?

IIRC, you mentioned in your last email that you don't see the issue
anymore. May be you avoided the issue because alternatives usage
was moved but root case remains as it is ?

> Since sbi isn't initialized, so NULL deference! Here is a typical
> panic log:
>
> [    0.000000] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    0.000000] Oops [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc7+ #79
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] epc : 0x0
> [    0.000000]  ra : sbi_remote_fence_i+0x1e/0x26
> [    0.000000] epc : 0000000000000000 ra : ffffffff80005826 sp : ffffffff80c03d50
> [    0.000000]  gp : ffffffff80ca6178 tp : ffffffff80c0ad80 t0 : 6200000000000000
> [    0.000000]  t1 : 0000000000000000 t2 : 62203a6b746e6972 s0 : ffffffff80c03d60
> [    0.000000]  s1 : ffffffff80001af6 a0 : 0000000000000000 a1 : 0000000000000000
> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.000000]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000080200
> [    0.000000]  s2 : ffffffff808b3e48 s3 : ffffffff808bf698 s4 : ffffffff80cb2818
> [    0.000000]  s5 : 0000000000000001 s6 : ffffffff80c9c345 s7 : ffffffff80895aa0
> [    0.000000]  s8 : 0000000000000001 s9 : 000000000000007f s10: 0000000000000000
> [    0.000000]  s11: 0000000000000000 t3 : ffffffff80824d08 t4 : 0000000000000022
> [    0.000000]  t5 : 000000000000003d t6 : 0000000000000000
> [    0.000000] status: 0000000000000100 badaddr: 0000000000000000 cause: 000000000000000c
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
>
> Fix this issue by moving sbi_init() earlier before jump_label_init()
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 834eb652a7b9..d150cedeb7e0 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -268,6 +268,7 @@ void __init setup_arch(char **cmdline_p)
>         *cmdline_p = boot_command_line;
>
>         early_ioremap_setup();
> +       sbi_init();
>         jump_label_init();
>         parse_early_param();
>
> @@ -284,7 +285,6 @@ void __init setup_arch(char **cmdline_p)
>         misc_mem_init();
>
>         init_resources();
> -       sbi_init();
>
>  #ifdef CONFIG_KASAN
>         kasan_init();
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
