Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB2CC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUX5ltp4OoX3rJ6b+FnEajksFg2B3XifeJr3KKauiYQ=; b=sb+pIkXIfaPS6j
	ma7Pec79vdL8b++PbGQbKU+j7IwHAejBdJJWrbpziKRTYL4DtygFNIPahaUJcwuL4UhDDA6R0t2V7
	+Djz5iyjDJHcGv2EqYGD56/T8bf8L07e6+URBdW31qFrYbfGSyq5BtVZHjbF3FVTnXNuQQsGeTnLg
	/0EbQvfBnPpVKgCUrjwBXNp9eaDSkwUxsbRMnsm6uEJL31nk/WXNv3jH4YjYzJjT9i6SB9Xv4lq7D
	FbBzDNnueANl87t93b3CcRSTLa0QubZVhLOmu0ONBjnL5z6qcXcH35s6z5t0UwWXNXAYP3GaLxC0O
	zgED5UP/1tsv5nT5dM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0y9-000000062W2-09RJ;
	Tue, 11 Mar 2025 14:52:33 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0p3-000000061PF-3ZbM
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 14:43:11 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6feb0742878so51970747b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741704187; x=1742308987; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8eN7PsSljamLFmL3eAZGuj/XK8vFI8v0YSA3pxuzua8=;
        b=vS8+3yA5Fu5PLfjbAuwbmRsPtteeTqJe06zuaHNuehtEYzFr+mU4SfnNzw9BIyyzVN
         8TLlVqp+QLEqWboTxXzEh8KB80b/0aEQ0X/J1KUGbqA+jkUNndpqiIYd/OuYniW4uLS/
         U0A7iYU+X8K7//FlyMY59zlADhdS7HN39kAlee1FdODBSw/ajinUkQbOIm35Dzlp8FT0
         EEZOTxpu9m6YCXbIcN8zoxP8e7r28gyPKmaleShr7LHORWCBOORg15np1bTNgt2azYPF
         Ps/lCLwzikEsQIx8MO8AArau1tg73m4W7iIUKUMaIfLKTQmm2uBQjJ+wiCO30RzhABt/
         zcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741704187; x=1742308987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eN7PsSljamLFmL3eAZGuj/XK8vFI8v0YSA3pxuzua8=;
        b=wIpb9S96iTmbt0s4p6PxOKD+cemRDEm3w4RVadGUCf4G/AdRznqXIfDaPqtG0U36Vx
         f5Pb4UCegIRrIWT/MD1mcdVo3weJitelWSlEGFsDcd5qG0kz8CVYmolUkSmImwcBLm3v
         B9zgmGPaANE+FbZ3XLljFgjMf4Dwm8KrDDpz/gz9R/y+msotEVrUixHWVXC5WqiWS939
         3o0B2HHmDjN6ZI9hRJL0oEt+NIIYBQoNC9mUt7fXpCboGd9Gqul8XxFStY4gZNnOj480
         bIO2SrJxneC7WzTxhlGj7nvuYA8VFvbaQmc047lZgXkQmOIDm0r9XVwrLkybEGE1YpJg
         z9DA==
X-Forwarded-Encrypted: i=1; AJvYcCWWOTdCfkKJRpqFrujotdUFeZLLOWeNbXOYO0M0qRMc/JxYG+sUZsoy0Ad0Z8ehCi2Z7nT6Gc8j1cBdbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb8z5P4395/0djkBGuEhUYAGHxpdgbvrZZhg9oYsPkYjMBZJsg
	I3F43MZglUjfS92Blf2aNOY0HguRJBWGyy+0hU5N998MBiok5tQdQmGEtjAhBzUNiC2k2p8tOHm
	JEzLsOUHdk2ivtTetkZVnMup0Tz3jFaflBInd/Q==
X-Gm-Gg: ASbGnctDJB8DKRi/1sjAj4Pv2fK53a8TNakeGZvR9lEBOOGrNpEWFCq6ml3/+TRVYkA
	DlEopwoyL2E3MTfK5FriL368YUhOnoKoeRu/BJMIZdlMff/l+FLBKD9giiLl8Nwjbs2SraqvbYB
	qqoiy0AVKsh/Yieu91VrXw59aplLk=
X-Google-Smtp-Source: AGHT+IG/Nkb2MMo911BY6LZyKSsboklHqls3Mfm0CSui2XrmwBdOBouV0yL+jXkPDlFtJivejjAsU40tXjhf+7Ul5/s=
X-Received: by 2002:a05:690c:3706:b0:6fb:a696:b23b with SMTP id
 00721157ae682-6febf3c519dmr225655647b3.33.1741704187487; Tue, 11 Mar 2025
 07:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250307145547.2784821-1-ping.bai@nxp.com>
In-Reply-To: <20250307145547.2784821-1-ping.bai@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Mar 2025 15:42:31 +0100
X-Gm-Features: AQ5f1JpuVnMxrQT-gRgqkxyP6H2nzFhKukp5aY_RBibf6JhIgaCor4IM8qvGE-0
Message-ID: <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
Subject: Re: [PATCH v5] cpuidle: Init cpuidle only for present CPUs
To: rafael@kernel.org, Jacky Bai <ping.bai@nxp.com>
Cc: daniel.lezcano@linaro.org, lpieralisi@kernel.org, sudeep.holla@arm.com, 
	james.morse@arm.com, d-gole@ti.com, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	imx@lists.linux.dev, khilman@baylibre.com, quic_tingweiz@quicinc.com, 
	quic_yuanjiey@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_074309_888100_F9634F37 
X-CRM114-Status: GOOD (  28.28  )
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

On Fri, 7 Mar 2025 at 15:54, Jacky Bai <ping.bai@nxp.com> wrote:
>
> for_each_possible_cpu() is currently used to initialize cpuidle
> in below cpuidle drivers:
>   drivers/cpuidle/cpuidle-arm.c
>   drivers/cpuidle/cpuidle-big_little.c
>   drivers/cpuidle/cpuidle-psci.c
>   drivers/cpuidle/cpuidle-qcom-spm.c
>   drivers/cpuidle/cpuidle-riscv-sbi.c
>
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
>
> With nosmp or maxcpus=0, only the boot CPU is present, lead
> to the failure:
>
>   |  Failed to register cpuidle device for cpu1
>
> Then rollback to cancel all CPUs' cpuidle registration.
>
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> above cpuidle drivers to ensure it only registers cpuidle devices
> for CPUs that are actually present.
>
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Rafael, I assume you will pick these up? Or let me know if you want me
to take them via my pmdomain tree.

Kind regards
Uffe

> ---
>  - v5 changes:
>    - add changes for cpuidle-qcom-spm
>
>  - v4 changes:
>   - add changes for other cpuidle driver that has the similar issue
>     as cpuidle-pcsi driver.
>
>  - v3 changes:
>   - improve the changelog as suggested by Sudeep
> ---
>  drivers/cpuidle/cpuidle-arm.c        | 8 ++++----
>  drivers/cpuidle/cpuidle-big_little.c | 2 +-
>  drivers/cpuidle/cpuidle-psci.c       | 4 ++--
>  drivers/cpuidle/cpuidle-qcom-spm.c   | 2 +-
>  drivers/cpuidle/cpuidle-riscv-sbi.c  | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-arm.c b/drivers/cpuidle/cpuidle-arm.c
> index caba6f4bb1b7..e044fefdb816 100644
> --- a/drivers/cpuidle/cpuidle-arm.c
> +++ b/drivers/cpuidle/cpuidle-arm.c
> @@ -137,9 +137,9 @@ static int __init arm_idle_init_cpu(int cpu)
>  /*
>   * arm_idle_init - Initializes arm cpuidle driver
>   *
> - * Initializes arm cpuidle driver for all CPUs, if any CPU fails
> - * to register cpuidle driver then rollback to cancel all CPUs
> - * registration.
> + * Initializes arm cpuidle driver for all present CPUs, if any
> + * CPU fails to register cpuidle driver then rollback to cancel
> + * all CPUs registration.
>   */
>  static int __init arm_idle_init(void)
>  {
> @@ -147,7 +147,7 @@ static int __init arm_idle_init(void)
>         struct cpuidle_driver *drv;
>         struct cpuidle_device *dev;
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = arm_idle_init_cpu(cpu);
>                 if (ret)
>                         goto out_fail;
> diff --git a/drivers/cpuidle/cpuidle-big_little.c b/drivers/cpuidle/cpuidle-big_little.c
> index 74972deda0ea..4abba42fcc31 100644
> --- a/drivers/cpuidle/cpuidle-big_little.c
> +++ b/drivers/cpuidle/cpuidle-big_little.c
> @@ -148,7 +148,7 @@ static int __init bl_idle_driver_init(struct cpuidle_driver *drv, int part_id)
>         if (!cpumask)
>                 return -ENOMEM;
>
> -       for_each_possible_cpu(cpu)
> +       for_each_present_cpu(cpu)
>                 if (smp_cpuid_part(cpu) == part_id)
>                         cpumask_set_cpu(cpu, cpumask);
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index dd8d776d6e39..b46a83f5ffe4 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -403,7 +403,7 @@ static int psci_idle_init_cpu(struct device *dev, int cpu)
>  /*
>   * psci_idle_probe - Initializes PSCI cpuidle driver
>   *
> - * Initializes PSCI cpuidle driver for all CPUs, if any CPU fails
> + * Initializes PSCI cpuidle driver for all present CPUs, if any CPU fails
>   * to register cpuidle driver then rollback to cancel all CPUs
>   * registration.
>   */
> @@ -413,7 +413,7 @@ static int psci_cpuidle_probe(struct platform_device *pdev)
>         struct cpuidle_driver *drv;
>         struct cpuidle_device *dev;
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = psci_idle_init_cpu(&pdev->dev, cpu);
>                 if (ret)
>                         goto out_fail;
> diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
> index 3ab240e0e122..5f386761b156 100644
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -135,7 +135,7 @@ static int spm_cpuidle_drv_probe(struct platform_device *pdev)
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret, "set warm boot addr failed");
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = spm_cpuidle_register(&pdev->dev, cpu);
>                 if (ret && ret != -ENODEV) {
>                         dev_err(&pdev->dev,
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 0c92a628bbd4..0fe1ece9fbdc 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -529,8 +529,8 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> -       /* Initialize CPU idle driver for each CPU */
> -       for_each_possible_cpu(cpu) {
> +       /* Initialize CPU idle driver for each present CPU */
> +       for_each_present_cpu(cpu) {
>                 ret = sbi_cpuidle_init_cpu(&pdev->dev, cpu);
>                 if (ret) {
>                         pr_debug("HART%ld: idle driver init failed\n",
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
