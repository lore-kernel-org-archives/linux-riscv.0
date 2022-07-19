Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84810C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 16:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAmc0lpl0n4HRXSReY2uOtwra1FoeeVmmszO02NXhtI=; b=DmuE1oN9pRcZuM
	i9seTvX9IqZ9S92KeCihvskq9t9qcVIuU0XtiDU3YgprxLtVP5iR5RHR8jPtKKbGeikuH54WfQ5eh
	DpgQcfeS8oVtzUJ++8/QMyF+UGjlhIUzBrp0oaMGEyJmOAivNid7Hl5VbraUmzyXc8Km/bfVHwbli
	cxqp+/bTToaJi5H9G5ULSEhRNl9yebqavoa+/XXDaapwUm3ylzE91saYgPW1VLYc1Rc2PFw6oa9kl
	4Fzjye9fgdPO42kdrjZuNh683vbb7HrSJLeALpM0/eJK9rHnEIOD//vkD40DS0EZ1o+0nFrVcCKOE
	7rPT4Tu7swY0lyXj4NoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDpo6-00APAF-IU; Tue, 19 Jul 2022 16:10:46 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDpo4-00AP8N-HB
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 16:10:45 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2ef5380669cso146062767b3.9
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 09:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5mrUDzdJiCDqXjSbtCKl32u2bj3CMJYrazGdcKxdcx8=;
        b=KV5TaQP8NM7xr+vnCvenpiJbsOrdMVuazodVbVCujR5ddR4eByKFVr4E4NcwyPnv0+
         gvAqVNByVx2a9wiQNKvq+vpF/HZHr1FMY3eOqYC2kpyEEEqnvwjOVR4ISAX8TlMPJ02T
         1sEnw4TOh3qBrX2iJABnhbgd3AG8F2UDHSXes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5mrUDzdJiCDqXjSbtCKl32u2bj3CMJYrazGdcKxdcx8=;
        b=ZAdey85PKJFWN8PA49VzpJ5RCmSBiZgADzxGGey5Q/EwzhPc2gmPni3TRprbaleKKR
         I3MgVaTbsPkZiHbi6dUi1QSF243jrt5pVNd/1O1SRCt5zCjc/s3FtAWHc3psiMx2dSUx
         +4SeLaN7Vg1w/sTv2pqTXs0ehKm1usOLgYxli1ZRnkXcXrd7AOD15ouDvhFXXbcSeL4s
         TyZhE6Y29ylHEOFAm5chTfwRjMJ3likz7chNJ2Z0hISKdhX8t226oA11MX9QRl961ru1
         BtHR7V6yjA8Ai6U9rM7B/NFffbs7eJEJTFt9iwGOxrc1rdmzEniiW2MJ3QdYlfFc39Q7
         2Yzw==
X-Gm-Message-State: AJIora9qPwQRhvLAYy09wVCxzOOr5OpzWtxQLKyg1FLwDZ38Ic6d4KSm
	RIFnBdGBea5fgsHJ7LN1WDC4YsvkyozsAQsKiHbh
X-Google-Smtp-Source: AGRyM1u2hwRecb6c7VNGO1OAE3AxMi86C/e/LX7ads0P/FusP7g7FgOS7YOejcwLWVspUKGcQwUfKHI2iw8XsWE73j4=
X-Received: by 2002:a81:5d55:0:b0:31c:dce7:96c9 with SMTP id
 r82-20020a815d55000000b0031cdce796c9mr36567510ywb.519.1658247042476; Tue, 19
 Jul 2022 09:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220715130330.443363-1-windhl@126.com>
In-Reply-To: <20220715130330.443363-1-windhl@126.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Jul 2022 09:10:31 -0700
Message-ID: <CAOnJCUL=eixyiQYPD_K_jkHA0b0ZiHck8U1icmsxO7B2QgiUjQ@mail.gmail.com>
Subject: Re: [PATCH] perf: RISC-V: Add of_node_put() when breaking out of for_each_of_cpu_node()
To: Liang He <windhl@126.com>
Cc: Anup Patel <anup@brainfault.org>, "will@kernel.org" <will@kernel.org>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_091044_773115_35B81BAF 
X-CRM114-Status: GOOD (  18.00  )
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

On Fri, Jul 15, 2022 at 6:03 AM Liang He <windhl@126.com> wrote:
>
> In pmu_sbi_setup_irqs(), we should call of_node_put() for the 'cpu'
> when breaking out of for_each_of_cput_node() as its refcount will
> be automatically increased and decreased during the iteration.
>
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index dca3537a8dcc..705d249a1b53 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -666,12 +666,15 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
>                 child = of_get_compatible_child(cpu, "riscv,cpu-intc");
>                 if (!child) {
>                         pr_err("Failed to find INTC node\n");
> +                       of_node_put(cpu);
>                         return -ENODEV;
>                 }
>                 domain = irq_find_host(child);
>                 of_node_put(child);
> -               if (domain)
> +               if (domain) {
> +                       of_node_put(cpu);
>                         break;
> +               }
>         }
>         if (!domain) {
>                 pr_err("Failed to find INTC IRQ root domain\n");
> --
> 2.25.1
>

Thanks for catching it.


Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
