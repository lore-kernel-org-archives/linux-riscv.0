Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5628DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ML93KzBFqQT73edDXJoi9c6Wcm6N39h7gnD8XvrEZNg=; b=dWRIRFTKGQN36j
	/jpgdg8SEHAr0qegLTXQlMI1iWmJiwAtrMF7GxQdYjQsqAot1qUg0aj1iVygvAXHNoFEpp0T11Qbp
	zha/GL61kpztzCvmXjAXVUZ42uSTDVQIqiKJfnvaYEWh12OAFDs8bg6/fUqAcdS7GgSRowDXNABh4
	07GQHW3l4Oj4o3bNqdVqTO6RgVx/yiI8+h/RK3bnR4vUAr46NOIXg/9HmRs1s0kQVl/70+CHI9J+k
	9V83klasWF9CjCC6KhlI6h6b0lX6WQtKCYg3gX/vRALfaagQkunyZv6VwlTJ7jXGbpSXBEE2HZ8tW
	uKEnB/gEatfudL4A/r2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuMQa-00GBHj-Mt; Thu, 26 May 2022 22:58:00 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuMQY-00GBHC-GP
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 22:57:59 +0000
Received: by mail-yb1-xb36.google.com with SMTP id x2so5191353ybi.8
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 15:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=crKPSGDJKfnUdG+gm5l2KnuVS7sAoP6uY2tKjSUMZ2o=;
        b=WHEuN7/hDtTnk2+JJaq1pWNHdktvZgcJCi7SMH5Y9ZtBLirdjsDnD8vBte/Sib9mzk
         1pcf/WyhmFV8V8BVSEWrD2929KDCgUWNe5OdhSqTkPPxnQzIpaVjfEkviRf4wBrFI2cf
         Rhx4fIW/jbFBKMs6Yggm3GZl7qq+9TcyuF48A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=crKPSGDJKfnUdG+gm5l2KnuVS7sAoP6uY2tKjSUMZ2o=;
        b=Ygez4AXRrdCq6lFNlk/xv/OGD2ACPMzVJUhV+wqlYy6kZ+mztNd2zN0t9OjM2PvwL5
         m1gTUs85y+V8o/f6hxMekRxm6cIyWRpibqTudUB4Om0A4gXon0tPy6MibRGev33ogCF5
         CtlEzxOBPf9rZcEU5qJmAXrASdXd/zNUKCQDYjQZZ765on/8GuEqNTycyamS6HzdrkRr
         gjLgnsjp+o8uShmZ9sW4pimcXBRyMZU4xTL9FzT8Sroap8GhJVGw3Ec+157xmPcgI0TC
         7wIffGXzJjaTGpBjZ/jNOvnUaNY2MSBAGVPvIlFZsb+05ysGTHXdgiBM3OLYc/43z1kw
         AZZw==
X-Gm-Message-State: AOAM53135LYo8DrpvaL+LlQJ1OqbdHnAn0c/DFBy2u8l14tXAsGiCWYe
	FtRBgO2gVWOrkClgxauLt/B6CWGnaFQ7o1OSjB9P
X-Google-Smtp-Source: ABdhPJzsws8jicrHpjr6bHiEqv2dgDSKQK0dYjmPXCEAu0Z7hbn36wyd1eSHZivz4nw8pkoLqqqclSIkRQtmTiy+0OU=
X-Received: by 2002:a25:be82:0:b0:64a:20f1:94fc with SMTP id
 i2-20020a25be82000000b0064a20f194fcmr35405041ybk.538.1653605877125; Thu, 26
 May 2022 15:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com> <20220526101131.2340729-4-sunilvl@ventanamicro.com>
In-Reply-To: <20220526101131.2340729-4-sunilvl@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 26 May 2022 15:57:46 -0700
Message-ID: <CAOnJCU+a7fHisvS55Kj2=4pGapxtf8SvaPZmcnvy16M32tRztw@mail.gmail.com>
Subject: Re: [PATCH V2 3/5] riscv: smp: Support for 64bit hartid
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, 
	Sunil V L <sunil.vl@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_155758_582288_E2196C9B 
X-CRM114-Status: GOOD (  17.49  )
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

On Thu, May 26, 2022 at 3:12 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> The hartid can be a 64bit value on RV64 platforms. This patch
> modifies the hartid parameter in riscv_hartid_to_cpuid() as
> unsigned long so that it can hold 64bit value on RV64 platforms.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/include/asm/smp.h | 4 ++--
>  arch/riscv/kernel/smp.c      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 23170c933d73..d3443be7eedc 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -42,7 +42,7 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
>  /* Hook for the generic smp_call_function_single() routine. */
>  void arch_send_call_function_single_ipi(int cpu);
>
> -int riscv_hartid_to_cpuid(int hartid);
> +int riscv_hartid_to_cpuid(unsigned long hartid);
>
>  /* Set custom IPI operations */
>  void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
> @@ -70,7 +70,7 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
>  {
>  }
>
> -static inline int riscv_hartid_to_cpuid(int hartid)
> +static inline int riscv_hartid_to_cpuid(unsigned long hartid)
>  {
>         if (hartid == boot_cpu_hartid)
>                 return 0;
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index b5d30ea92292..018e7dc45df6 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -47,7 +47,7 @@ static struct {
>         unsigned long bits ____cacheline_aligned;
>  } ipi_data[NR_CPUS] __cacheline_aligned;
>
> -int riscv_hartid_to_cpuid(int hartid)
> +int riscv_hartid_to_cpuid(unsigned long hartid)
>  {
>         int i;
>
> @@ -55,7 +55,7 @@ int riscv_hartid_to_cpuid(int hartid)
>                 if (cpuid_to_hartid_map(i) == hartid)
>                         return i;
>
> -       pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
> +       pr_err("Couldn't find cpu id for hartid [%lu]\n", hartid);
>         return -ENOENT;
>  }
>
> --
> 2.25.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
