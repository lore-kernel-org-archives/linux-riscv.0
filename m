Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D533DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:45:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A99620700
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DK01eAjx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="A/fVKuz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A99620700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVVsENlZZfbym6tIZCLY2Pxf6xW/WZsI7RtJza6lolU=; b=DK01eAjx/Ia0vK
	zHMCJxFCg8Hprj4COgGlL1nytCBx6i2CSjd58zxzQNusEQP9uumKz9dQ4KkqBfAaXuJD3gFzCUYT9
	FcowyLRfm5Qn9pqBT8YMmSeuKBIGT62F23CYf97xth4kkEiCat/Ma+bwkoSCBP2eQxRrzlrSQ4HmV
	ZqLhzAoHn7YHowUVFb7+KMlNLLtvN2BfTOisoiYClpgHf2aZ0V/xtbk+1sRaKICy4oFLcFW/fE9/i
	FOMsboLdQkaXTyPORafqI+UgkYTxcMyhORW6W3SeSaXQy8amd7zT+uQYJrol2WK/PvYhDrCLv6ZCr
	xLoUTwPyVtRxfeJzxMsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9OnQ-0007jo-Jm; Thu, 28 Mar 2019 06:45:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9OnN-0007jP-HG
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 06:45:51 +0000
Received: by mail-wm1-x344.google.com with SMTP id w15so2594766wmc.3
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ohk9809eXib5h1QYV8kDgGg623QAOUrPzbeP4snOK3Q=;
 b=A/fVKuz6tlYbwVbG/JjFJvnqLU1TvYF5gvIjC6CiiAEj5L3GLIjY8xC2m1J9ty2/5h
 BS33us1HT9zZke9Qr0AnD9CaXVh1PHuUfLGuIIZKYCHekUv0H5Mask/yiAylEHWkUUz/
 hp7V8Uedg/+1oEHsd0N/y3p3iuVitqC66jNO/SxcD7OtXcwdSKq2DaOAzAlegGmtO1ZE
 RqoK6wXokYwiomNynoU/z7Cl6lo3gEVcmcPY30CbIuK5hxvEHG+sbxDi6EJQPMoH2Ba5
 d7zb1yOx9bBkDkOoCwvN+v7oX/vuS5a8EuNQP1BT+a3tX0ol+ksOMjFNTSs8e3qwnSpG
 7bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ohk9809eXib5h1QYV8kDgGg623QAOUrPzbeP4snOK3Q=;
 b=VV3tpBZSuWo0On69aQAfWPx5COShslprCl5+IW8waqOlEIISnl8VrwCITC1YFGxqOd
 Y5r7e05PNph//tJcCYA4lDa5EPDpzbte3TaAPZcFSitHSU3uungxKJxPShe2GfvuRR8I
 VqM+LnqQvjXkoyPntA2yGm3kdFKr7GXvk7BFQDANJM/tJ9+NWX6/UxnzxOB7gGDkTEJ6
 7Gqra9BVYAFxW0VQuEwaGZedCMJHZTFoaPfEdkU6I1d3zn3+y7LZ7Ulrmvuhv5t+V6x8
 +buru7WEmaZ4DgCrUy/zL0dLn1fzRHFzoCO44fFBsCrG/8HYa47Tj6KtDPvTHRbFP0mv
 ZNrg==
X-Gm-Message-State: APjAAAWaZub3HuHOpCzmqixCs3C1xUJkKgKyb9V8v99mlVy8/cgAFLzH
 9sVOWXfQIaDgaI8HH/HyIEUAbX7JWlYdkWxRzWLkmTEYssw=
X-Google-Smtp-Source: APXvYqwie6kn5DERfJD2w2trGqMAtWZDoNCjX6MyYZ2b28Buf6rChLlRXGN4PpX826S0AaTIwuseSMtsUPSyRYf0thM=
X-Received: by 2002:a1c:1a46:: with SMTP id a67mr13902585wma.21.1553755547514; 
 Wed, 27 Mar 2019 23:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553647082.git.gary@garyguo.net>
 <d141829022c075172b1410e67299fc29fa95c6cd.1553647082.git.gary@garyguo.net>
In-Reply-To: <d141829022c075172b1410e67299fc29fa95c6cd.1553647082.git.gary@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 12:15:36 +0530
Message-ID: <CAAhSdy1FQN2VDkZ65Rp+xnE16WqN6vYevOoJ3LDkdddj7MH1jw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] riscv: move flush_icache_{all,mm} to cacheflush.c
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_234549_578549_788A6C91 
X-CRM114-Status: GOOD (  22.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 6:11 AM Gary Guo <gary@garyguo.net> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently, flush_icache_all is macro-expanded into a SBI call, yet no
> asm/sbi.h is included in asm/cacheflush.h. This could be moved to
> mm/cacheflush.c instead (SBI call will dominate performance-wise and
> there is no worry to not have it inlined.
>
> Currently, flush_icache_mm stays in kernel/smp.c, which looks like a
> hack to prevent it from being compiled when CONFIG_SMP=n. It should
> also be in mm/cacheflush.c.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  arch/riscv/include/asm/cacheflush.h |  2 +-
>  arch/riscv/kernel/smp.c             | 49 -----------------------
>  arch/riscv/mm/cacheflush.c          | 61 +++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+), 50 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 8f13074413a7..1f4ba68ab9aa 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -47,7 +47,7 @@ static inline void flush_dcache_page(struct page *page)
>
>  #else /* CONFIG_SMP */
>
> -#define flush_icache_all() sbi_remote_fence_i(NULL)
> +void flush_icache_all(void);
>  void flush_icache_mm(struct mm_struct *mm, bool local);
>
>  #endif /* CONFIG_SMP */
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 0c41d07ec281..17f491e8ed0a 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -199,52 +199,3 @@ void smp_send_reschedule(int cpu)
>         send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
>
> -/*
> - * Performs an icache flush for the given MM context.  RISC-V has no direct
> - * mechanism for instruction cache shoot downs, so instead we send an IPI that
> - * informs the remote harts they need to flush their local instruction caches.
> - * To avoid pathologically slow behavior in a common case (a bunch of
> - * single-hart processes on a many-hart machine, ie 'make -j') we avoid the
> - * IPIs for harts that are not currently executing a MM context and instead
> - * schedule a deferred local instruction cache flush to be performed before
> - * execution resumes on each hart.
> - */
> -void flush_icache_mm(struct mm_struct *mm, bool local)
> -{
> -       unsigned int cpu;
> -       cpumask_t others, hmask, *mask;
> -
> -       preempt_disable();
> -
> -       /* Mark every hart's icache as needing a flush for this MM. */
> -       mask = &mm->context.icache_stale_mask;
> -       cpumask_setall(mask);
> -       /* Flush this hart's I$ now, and mark it as flushed. */
> -       cpu = smp_processor_id();
> -       cpumask_clear_cpu(cpu, mask);
> -       local_flush_icache_all();
> -
> -       /*
> -        * Flush the I$ of other harts concurrently executing, and mark them as
> -        * flushed.
> -        */
> -       cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
> -       local |= cpumask_empty(&others);
> -       if (mm != current->active_mm || !local) {
> -               cpumask_clear(&hmask);
> -               riscv_cpuid_to_hartid_mask(&others, &hmask);
> -               sbi_remote_fence_i(hmask.bits);
> -       } else {
> -               /*
> -                * It's assumed that at least one strongly ordered operation is
> -                * performed on this hart between setting a hart's cpumask bit
> -                * and scheduling this MM context on that hart.  Sending an SBI
> -                * remote message will do this, but in the case where no
> -                * messages are sent we still need to order this hart's writes
> -                * with flush_icache_deferred().
> -                */
> -               smp_mb();
> -       }
> -
> -       preempt_enable();
> -}
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 498c0a0814fe..497b7d07af0c 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -14,6 +14,67 @@
>  #include <asm/pgtable.h>
>  #include <asm/cacheflush.h>
>
> +#ifdef CONFIG_SMP
> +
> +#include <asm/sbi.h>
> +
> +void flush_icache_all(void)
> +{
> +       sbi_remote_fence_i(NULL);
> +}
> +
> +/*
> + * Performs an icache flush for the given MM context.  RISC-V has no direct
> + * mechanism for instruction cache shoot downs, so instead we send an IPI that
> + * informs the remote harts they need to flush their local instruction caches.
> + * To avoid pathologically slow behavior in a common case (a bunch of
> + * single-hart processes on a many-hart machine, ie 'make -j') we avoid the
> + * IPIs for harts that are not currently executing a MM context and instead
> + * schedule a deferred local instruction cache flush to be performed before
> + * execution resumes on each hart.
> + */
> +void flush_icache_mm(struct mm_struct *mm, bool local)
> +{
> +       unsigned int cpu;
> +       cpumask_t others, hmask, *mask;
> +
> +       preempt_disable();
> +
> +       /* Mark every hart's icache as needing a flush for this MM. */
> +       mask = &mm->context.icache_stale_mask;
> +       cpumask_setall(mask);
> +       /* Flush this hart's I$ now, and mark it as flushed. */
> +       cpu = smp_processor_id();
> +       cpumask_clear_cpu(cpu, mask);
> +       local_flush_icache_all();
> +
> +       /*
> +        * Flush the I$ of other harts concurrently executing, and mark them as
> +        * flushed.
> +        */
> +       cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
> +       local |= cpumask_empty(&others);
> +       if (mm != current->active_mm || !local) {
> +               cpumask_clear(&hmask);
> +               riscv_cpuid_to_hartid_mask(&others, &hmask);
> +               sbi_remote_fence_i(hmask.bits);
> +       } else {
> +               /*
> +                * It's assumed that at least one strongly ordered operation is
> +                * performed on this hart between setting a hart's cpumask bit
> +                * and scheduling this MM context on that hart.  Sending an SBI
> +                * remote message will do this, but in the case where no
> +                * messages are sent we still need to order this hart's writes
> +                * with flush_icache_deferred().
> +                */
> +               smp_mb();
> +       }
> +
> +       preempt_enable();
> +}
> +
> +#endif /* CONFIG_SMP */
> +
>  void flush_icache_pte(pte_t pte)
>  {
>         struct page *page = pte_page(pte);
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
