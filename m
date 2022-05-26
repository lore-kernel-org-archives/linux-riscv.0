Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CF5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 22:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFCb9DEj1mhrQHe9VwZNjzzTdY0jqs0g3wsYudYKDpc=; b=g7GAeXDdIFdssC
	nrP+haaRq9ov4ecxYXLOgHQxvNRpqXfW3mgE7cC9BpL0cQ5r/GrP3SB4lHSaWIyjhOfvafR61TE9t
	/ribQlAh9BoQFyMFJJ9YnkQwRenQGLPlipr/HZLYx1MQ7Ririd/Rj6JeNXZElGtlFE7kIPNJbVTf/
	G/i5qV16v68f1lYfAGt5YuW1gEZ3rR2ccn06BZhGhu9T3X3MYBhuH7hK1QQp9FMIETWY6v2Ln5Qg5
	Dlaq3OHHDUIxlobs48dpTVx9Furg4sVuWdfARFwz6q7SNT6sXJ3mCS0afnTZTui8i3aKYYfIepu/c
	ES/fWB7Ej9Se2JPRmRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuMPR-00GB5l-UX; Thu, 26 May 2022 22:56:49 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuMPO-00GB51-Rb
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 22:56:48 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id i187so5210507ybg.6
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 15:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vKYNDqC9qWTlcvuwdXl4ysmwh+YcbKwkfLj+t7mZ4iw=;
        b=K4dMTaMxYQKW9sKocetoR2WRTdDWY7vZPBKIYSFx2XGnx99IONWdnQKt1XDaFoXVoC
         cC4kRN05mz8zTfCSiHIxzanymip691LiyHFfIhv1Qpc6/FSxJoQGB2TnMsHDzMJnKpFU
         BAt+bjgjVqGqSOZrCnbSmAPCwlAuIQOmL9yKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vKYNDqC9qWTlcvuwdXl4ysmwh+YcbKwkfLj+t7mZ4iw=;
        b=05+7TkMeSdnBMk+ka/FOBsv2eiHgZ2wnzFIlYF1Mf4bcTVKC5kjL8k7RHg6jjzBNSs
         ENK7lBmp9SKqxNkltxle956bpFmowck2xt8vrFefoLv8j8VfZhjRcIga89+zqCnaV6dy
         07ZKrANPEDBwhscNhkGZJSl8fYEzgM9XScMYLRfK9HdoeUJSOTEntjAGfe30Dk3mdFp1
         gJvy/TO0i3VNHtPrvvaGpbdkkwbLM+/GwLTcEsJ1vHY6h8W9Fs+AJql9CwWCJQMd1Szx
         ccNnPmB4y3pfsIMyJRfRALiUY1T4w6yAwRc/bLiQmYltB2j44dHbkYagdKefKGAbu16V
         NrkQ==
X-Gm-Message-State: AOAM5325VfIepAj48qZ9JK1CPr/1N8bugeCYJ8VNHxzM6y3iIr8fTp5z
	TiXDkJxjV8EiPjdapyZTQGgtQZKM1a77tFl39WPm
X-Google-Smtp-Source: ABdhPJx/k9rpN/zIvs2TbHiEfM32NHM3fIQ9BswQdZnVHjx3E3n4/Depq0LAf9Vecr/BjxkODsjSubzrM9NeLTq/Y8M=
X-Received: by 2002:a25:c0d2:0:b0:657:952e:e4a6 with SMTP id
 c201-20020a25c0d2000000b00657952ee4a6mr3344832ybf.143.1653605805035; Thu, 26
 May 2022 15:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com> <20220526101131.2340729-3-sunilvl@ventanamicro.com>
In-Reply-To: <20220526101131.2340729-3-sunilvl@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 26 May 2022 15:56:34 -0700
Message-ID: <CAOnJCUK5i0HpU-=h41Z9PcOHWwndB7iX6ePb2kyuEf1qaSKytA@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] riscv: spinwait: Fix hartid variable type
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, 
	Sunil V L <sunil.vl@gmail.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_155646_934336_55A75F68 
X-CRM114-Status: GOOD (  19.21  )
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
> The hartid variable is of type int but compared with
> ULONG_MAX(INVALID_HARTID). This issue is fixed by changing
> the hartid variable type to unsigned long.
>
> Fixes: c78f94f35cf6 ("RISC-V: Use __cpu_up_stack/task_pointer only for spinwait method")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpu_ops_spinwait.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
> index 346847f6c41c..3ade9152a3c7 100644
> --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> @@ -18,7 +18,7 @@ void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
>  static void cpu_update_secondary_bootdata(unsigned int cpuid,
>                                    struct task_struct *tidle)
>  {
> -       int hartid = cpuid_to_hartid_map(cpuid);
> +       unsigned long hartid = cpuid_to_hartid_map(cpuid);
>
>         /*
>          * The hartid must be less than NR_CPUS to avoid out-of-bound access
> @@ -27,7 +27,7 @@ static void cpu_update_secondary_bootdata(unsigned int cpuid,
>          * spinwait booting is not the recommended approach for any platforms
>          * booting Linux in S-mode and can be disabled in the future.
>          */
> -       if (hartid == INVALID_HARTID || hartid >= NR_CPUS)
> +       if (hartid == INVALID_HARTID || hartid >= (unsigned long) NR_CPUS)
>                 return;
>
>         /* Make sure tidle is updated */
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
