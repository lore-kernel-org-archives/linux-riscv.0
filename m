Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605CEC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 01:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+otK+FDwAxOUIYcPqVccHtSIbw9lfQspykWNwNAsJw=; b=l/oLSHTVRMrRU2
	+nrYKzfFkV8VI/DcpnypMzZ/EaKV/989LFjGWzExNPva+9zewdqoqB99Y0RUli6vAzp6HRNx+So+a
	Ypy+l2Hq30XGlbQTajgYp/0YWth3mZhrg6ep81I1Ve3M4850TimaiILb83eqYYS/nVbJ0euMWiids
	VPXR1qnaIH9+V7+B5AmK2ei9H8QWPpewmUXI6C4GruKX5B1ULIHZ/eXqExJ38apDYY7D4bqYlxANw
	BSXCVznTjYOLo/wI7KCUxX1CJ1Fxk571hYvzdo/1sp4rWfS5aoE1ajewH4sfzdoY8ej6R8p3oHqN2
	lFr1Vi5i/9jrFE6qtjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwwyc-00CBj4-Cv; Tue, 14 Dec 2021 01:51:34 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwwyX-00CBhX-CR
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 01:51:31 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id f9so42759745ybq.10
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 17:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p+dWtLIBLgyf5m6vDOvHH1tJV2BCoBwz05I/KJmnKuE=;
 b=DvFWLj+GQaI1l+qs3mCkJtfm275uA3mlNG/rJ3MKC64CXPslooLjSW2IySb6ZbbyX4
 WakmaumR4drgF8FIOsOwjiO0bl4lCNg7l3oSyGyy0tO20GpuvyJwFYluWrSucFy4NRHJ
 8yagRjniAuIDi2AgRQHCOBsakZE0axfKbP9qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+dWtLIBLgyf5m6vDOvHH1tJV2BCoBwz05I/KJmnKuE=;
 b=qpSAMe7Bnf2D9XY0+uHkwFNt6Hk/LVGpd3g0/c7PUnteYAH/C/x/hh1ia7V5KZzGTb
 vwcLFeAOb/yb9W4lCpCXS/GMO3xVn3fWo9XT0Vfklo5prJbGN/VAL6yfkqF4iev2j37W
 mYHwyepRcqvxppu2gQZoFo6KhZwMlSiOdTFP/O9MZNONMzW6gfxuor1Dyy0bdjp0lXMx
 VDU/4gw1x3rfkNgG4hRNhHbN3NdfPIxG97bPirWNhPLokdJ6Twi4xkmE1mGWE1tx9quM
 0YF32oA+GVY8dQjPHGIuHPleqBum0+JFPWsEwSPyjWExAdR95ktGVJWw0cCK4htqQJmh
 KrCg==
X-Gm-Message-State: AOAM533cAp67TqjxRNzRsmK55NXqsZCUcM3YiwU5uN2wqewJSYUbBUIM
 6K0dU+Fdl2Q9WicB1qa8oRcOZRARfAAXYk4dcSHy
X-Google-Smtp-Source: ABdhPJxHzd4+EPUZtXUvL0GWI90tGFXbdfycif0Ag2i1gAVrb5q6B7nsd/r3q9M+hc1HPeciYyvnw+bw5t6Pw1eD/s0=
X-Received: by 2002:a5b:b90:: with SMTP id l16mr2473159ybq.632.1639446687827; 
 Mon, 13 Dec 2021 17:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20211213112034.2896536-1-heiko@sntech.de>
In-Reply-To: <20211213112034.2896536-1-heiko@sntech.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Dec 2021 17:51:17 -0800
Message-ID: <CAOnJCUJ9YBOrNEj-nxAWctGPSTj6yUVOkiwQEpFELuf8B6SqLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
To: Heiko Stuebner <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_175129_469224_1FA260EE 
X-CRM114-Status: GOOD (  33.30  )
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

On Mon, Dec 13, 2021 at 3:21 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The callback used inside sbi_remote_fence_i is set at sbi probe time
> to the needed variant. Before that it is a NULL pointer.
>
> The selection between using sbi_remote_fence_i or ipi_remote_fence_i
> right now is solely done on the presence of the RISCV_SBI config option.
>
> On a multiplatform kernel, SBI will probably always be built in, but
> in the future not all machines using that kernel may have SBI
> on them, so in some cases this setup can lead to NULL pointer dereferences.
>

I didn't quite understand this. The only platforms without SBI are
M-mode Linux based platforms.
All other platforms will require SBI if the kernel is running on
supervisor mode.

They may not need SBI IPI or SBI RFENCE extensions if an alternate
mechanism(ACLINT SSWI or AIA IMSIC)
is already available in hardware. IIRC, Anup's aclint & aia series
already takes care of that.

> Also if in future one of the flush_icache_all / flush_icache_mm functions
> gets called earlier in the boot process - before sbi_init - this would
> trigger the issue.
>

sbi_init is called before setup_smp. Do you think there is a use case where
flush_icache_xxx can be called before smp initialization ?

> To prevent this, add a default __sbi_rfence_none returning an error code
> and adapt the callers to check for an error from the remote fence
> to then fall back to the other method.
>

Having said that, it is always good to have guards to avoid NULL
pointer dereferences.
However, the commit text may be updated based on the above questions.

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/sbi.c    | 10 +++++++++-
>  arch/riscv/mm/cacheflush.c | 25 +++++++++++++++++--------
>  2 files changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 7402a417f38e..69d0a96b97d0 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -14,11 +14,19 @@
>  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>  EXPORT_SYMBOL(sbi_spec_version);
>
> +static int __sbi_rfence_none(int fid, const unsigned long *hart_mask,
> +                            unsigned long start, unsigned long size,
> +                            unsigned long arg4, unsigned long arg5)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
>  static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
>  static int (*__sbi_send_ipi)(const unsigned long *hart_mask) __ro_after_init;
>  static int (*__sbi_rfence)(int fid, const unsigned long *hart_mask,
>                            unsigned long start, unsigned long size,
> -                          unsigned long arg4, unsigned long arg5) __ro_after_init;
> +                          unsigned long arg4, unsigned long arg5)
> +                          __ro_after_init = __sbi_rfence_none;
>
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>                         unsigned long arg1, unsigned long arg2,
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 89f81067e09e..128e23c094ea 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -16,11 +16,15 @@ static void ipi_remote_fence_i(void *info)
>
>  void flush_icache_all(void)
>  {
> +       int ret = -EINVAL;
> +
>         local_flush_icache_all();
>
>         if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               sbi_remote_fence_i(NULL);
> -       else
> +               ret = sbi_remote_fence_i(NULL);
> +
> +       /* fall back to ipi_remote_fence_i if sbi failed or not available */
> +       if (ret)
>                 on_each_cpu(ipi_remote_fence_i, NULL, 1);
>  }
>  EXPORT_SYMBOL(flush_icache_all);
> @@ -66,13 +70,18 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>                  * with flush_icache_deferred().
>                  */
>                 smp_mb();
> -       } else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
> -               cpumask_t hartid_mask;
> -
> -               riscv_cpuid_to_hartid_mask(&others, &hartid_mask);
> -               sbi_remote_fence_i(cpumask_bits(&hartid_mask));
>         } else {
> -               on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
> +               int ret = -EINVAL;
> +
> +               if (IS_ENABLED(CONFIG_RISCV_SBI)) {
> +                       cpumask_t hartid_mask;
> +
> +                       riscv_cpuid_to_hartid_mask(&others, &hartid_mask);
> +                       ret = sbi_remote_fence_i(cpumask_bits(&hartid_mask));

This API is removed in sparse hartid series[1]. You may want to rebase
on top of it.

[1] https://patchwork.kernel.org/project/linux-riscv/list/?series=590195

> +               }
> +
> +               if (ret)
> +                       on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
>         }
>
>         preempt_enable();
> --
> 2.30.2
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
