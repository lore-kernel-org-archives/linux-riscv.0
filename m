Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0199C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:09:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D28861056
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D28861056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=shhYGrXVtD9KESgFILbxTd0vgGrVtUy5nSwviJHOtO8=; b=VUtqrgHzCeNtRrmGaQ0i/YkQs
	t7g6p9sKIg+MochDsK09FhHoD+OusHNx//BrnbBvPkAsSyz+nLuXL9DJ/9RdvHphJMcsGObsaVNis
	ivZnOOGx29DVdPC8XTe4b9U60VNnbzAiNaKOq4Y9SuOEe8joeFNBYz3XA6ffLeeF/xO86H3IjhJ0Y
	y8mmvG0DZ/vcmAgxnP32gx2b5uDrfhrj31pQTpccTL027AFx9Byca1c6KAu1eOY/XhZFr+hKp5oMn
	hXBQP2FfK+iPl9lZunAnFWFNbu+0X0FBrPlzu8ZRy+d/qKN2aXz4IM9vs4fz/ruN3qdyuGcUwGs0I
	8hE94gNkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSB82-00BtsQ-Kh; Fri, 02 Apr 2021 04:09:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSB7w-00Bts3-FD
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:09:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j7so3686932wrd.1
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=meCY3g4ZddcaVFsiixJeKxINO9meMOC/HmZiu7pSnis=;
 b=JbBObYJHzVzwWjRYrtVEvwWuBeATrp4It6u7NUrI90LOdM+HfoHmV+3Cvi1sb96OPI
 D21x4RUhRG7GTbRhJYZBSUERMEl5wYrQteEPDtOz8xReUQwRPvrq956//qiakIsVMpjE
 GuLs/mIehb/szAS4EHzdm089SS4+pgmwOJX0XG4qSmZU+qMtvrJkQ8/i8EsJyqZBeYj3
 mSNZOrkFdJE4wskQEjbVErZtcpMueMUg/RsR35auYUwjCIwe1iu0aL+Dy4e34WVban3h
 OduQYY0kFjCT1ETwZQgfn0o5ZeDeDbiAOgNHue6+HuvvRkuKfN5NM3fq+4p392TL+Cu4
 sr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=meCY3g4ZddcaVFsiixJeKxINO9meMOC/HmZiu7pSnis=;
 b=DYpxm8yH2aF5ThjiWVsjPcDNJrIjNcaWMS6Wl8tu0q+GPbmOSbetuaJ3TLE1jitvyI
 KXQSlzpbY5ugUjqO2QvTAHA54wA0T7JovuM1JZkjZjAVxON0KiHh9uxH6EM8jzqDcl5i
 5r0y5u4S7WMIIMrdLKwcj3wg1nng+SZWuw4Zr7edmowcrmKsyL0kfKpvImxYyvveEuqj
 aVAEE56gggbByWKfi49Y6FbosGAq5fekLFM5wXsR6kQi2fWFgE2bRbMfDBdFkDykIPny
 FkBEmeRhMyOzfndMAGVV9Okljk6Is9OgBeNBk6n5h34g3nBf7rJ40xDvi7kXv3127dZ4
 bC2A==
X-Gm-Message-State: AOAM5307YdDibBkj1zb9tKMcQL8y1w9KIZVBufcix++41WUdmHTnZ4q5
 9TM9+D9snXMa8cJrw7E5BISDLb+TZoqKNEkqfgFSEQ==
X-Google-Smtp-Source: ABdhPJxDjcPeZhhqphDAJyUV6xkBRwIEwREpi6+dv9r+XRHq/ftq4auQOWCKv0PCii8iWP0QH2ZDPwnwZjAUlOUXv9M=
X-Received: by 2002:adf:9544:: with SMTP id 62mr12946985wrs.128.1617336583795; 
 Thu, 01 Apr 2021 21:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210401002442.2fe56b88@xhacker> <20210401002551.0ddbacf9@xhacker>
In-Reply-To: <20210401002551.0ddbacf9@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Apr 2021 09:39:32 +0530
Message-ID: <CAAhSdy0N427hw6sK5NEbrs_bb2N9y6aDOrCLO+mcpysLvaaoPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] riscv: Mark some global variables __ro_after_init
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_050944_921023_BFFAA3E8 
X-CRM114-Status: GOOD (  19.95  )
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

On Wed, Mar 31, 2021 at 10:01 PM Jisheng Zhang
<jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> All of these are never modified after init, so they can be
> __ro_after_init.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/sbi.c  | 8 ++++----
>  arch/riscv/kernel/smp.c  | 4 ++--
>  arch/riscv/kernel/time.c | 2 +-
>  arch/riscv/kernel/vdso.c | 4 ++--
>  arch/riscv/mm/init.c     | 6 +++---
>  5 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index d3bf756321a5..cbd94a72eaa7 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -11,14 +11,14 @@
>  #include <asm/smp.h>
>
>  /* default SBI version is 0.1 */
> -unsigned long sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
> +unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>  EXPORT_SYMBOL(sbi_spec_version);
>
> -static void (*__sbi_set_timer)(uint64_t stime);
> -static int (*__sbi_send_ipi)(const unsigned long *hart_mask);
> +static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
> +static int (*__sbi_send_ipi)(const unsigned long *hart_mask) __ro_after_init;
>  static int (*__sbi_rfence)(int fid, const unsigned long *hart_mask,
>                            unsigned long start, unsigned long size,
> -                          unsigned long arg4, unsigned long arg5);
> +                          unsigned long arg4, unsigned long arg5) __ro_after_init;
>
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>                         unsigned long arg1, unsigned long arg2,
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index ea028d9e0d24..504284d49135 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -30,7 +30,7 @@ enum ipi_message_type {
>         IPI_MAX
>  };
>
> -unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
> +unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
>         [0 ... NR_CPUS-1] = INVALID_HARTID
>  };
>
> @@ -85,7 +85,7 @@ static void ipi_stop(void)
>                 wait_for_interrupt();
>  }
>
> -static struct riscv_ipi_ops *ipi_ops;
> +static struct riscv_ipi_ops *ipi_ops __ro_after_init;
>
>  void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
>  {
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 1b432264f7ef..8217b0f67c6c 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -11,7 +11,7 @@
>  #include <asm/processor.h>
>  #include <asm/timex.h>
>
> -unsigned long riscv_timebase;
> +unsigned long riscv_timebase __ro_after_init;
>  EXPORT_SYMBOL_GPL(riscv_timebase);
>
>  void __init time_init(void)
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index 3f1d35e7c98a..25a3b8849599 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -20,8 +20,8 @@
>
>  extern char vdso_start[], vdso_end[];
>
> -static unsigned int vdso_pages;
> -static struct page **vdso_pagelist;
> +static unsigned int vdso_pages __ro_after_init;
> +static struct page **vdso_pagelist __ro_after_init;
>
>  /*
>   * The vDSO data page.
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 76bf2de8aa59..719ec72ef069 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -149,11 +149,11 @@ void __init setup_bootmem(void)
>  }
>
>  #ifdef CONFIG_MMU
> -static struct pt_alloc_ops pt_ops;
> +static struct pt_alloc_ops pt_ops __ro_after_init;
>
> -unsigned long va_pa_offset;
> +unsigned long va_pa_offset __ro_after_init;
>  EXPORT_SYMBOL(va_pa_offset);
> -unsigned long pfn_base;
> +unsigned long pfn_base __ro_after_init;
>  EXPORT_SYMBOL(pfn_base);
>
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> --
> 2.31.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
