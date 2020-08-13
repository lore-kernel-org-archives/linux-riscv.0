Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286FDC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 05:43:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E85B620639
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 05:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dlqYRikB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="UvMOetG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E85B620639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=amLAUe6QEepG9cIRTclNv0n+3n5fEUpBRooZXGlspEY=; b=dlqYRikBV03ciN8tGvdMErLlF
	vyQfo6Z8eyPhizLF6+XU2KwpO73kqJWxhq4UEeokpuO6eR7x8MP6Il2RgxlJNt5+qTH0lwYjBepV8
	v4BPOuAOQNkRO007nmfV1SbNxyJ5CKz+bIoFb5xlhTlmvFNYkLISlW6mtuDZRp+QZeHm7kUL3MaMV
	MqFiQPpEpn5MsbUJMIxGg2ev4a+U0GMqXe42jfSr7+tThY17Egp9KpHINmt6ziWl/fy9LL6gngyx6
	+gHT6ug45Mz1lCNhj4DjH3kF2OAJu8oju1oAfowxAh65dbUR5EoP6mhEJTDC9NVKPXBRsFdxtBDxE
	lbapTA7Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k660o-0000zB-HV; Thu, 13 Aug 2020 05:42:50 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k660m-0000yU-74
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 05:42:49 +0000
Received: by mail-wm1-x342.google.com with SMTP id c19so5583189wmd.1
 for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2020 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pO83i01MAyD94ySqpQBUGi1TfGYRhwJn4iuYrQxpj8s=;
 b=UvMOetG8xfT+hNTYbhURfXf/xX2xdzUfhZuAo8WFAxQaBFBFQ2j+CJqZ1sTU18QBeo
 ZjNnRLtZwsC8zZqohO/kBjQBYy/KL/a7eSzt3kC3NFACa87pWVcwXrKDu6fvBVDwzY35
 jqzSL3LMijIrfIvVeCxAJJsm8rlpo182KHa/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pO83i01MAyD94ySqpQBUGi1TfGYRhwJn4iuYrQxpj8s=;
 b=bVr7rRqaWsyX4gpW7TTRw44xKyoJQ8uw5Kt08AjILPpYqKVYz8yn45d/hs99kmkQb2
 1o++9ZRCUDuhLqQe/c55/r/ridUrISeLrIwpP4ucRJ9xfPe/zbjvSVo4iT4QwbCwsq8/
 i9SH/mN4wYI9ZkkXOfHhBfP1ZpAKwPJ78+3E2BonO9IUFh1g2rztLW5a7eOj8+bdoFqy
 KtXSIfrgBo5tQ0GCbosMl13m4fCqPuV5ePLiqHQBJpm8SzAZdmjGAAPw33HE48rDI8w4
 b0/DWhrNIPUU6tM/GUyxSxqBJqLXs0f4if+6bCbGacm8vjXDmB4jXacQh/mR4mIiHo9U
 IsJw==
X-Gm-Message-State: AOAM531cfpsKR69saSNLPMlVNngEh4+5LaZ+M7Gdx7cT6rf8sVGm4nKa
 1SXCeqdkKWoAYGVVFhOoa4ocCtPAJ1O6hTgEQ8Yu
X-Google-Smtp-Source: ABdhPJyNBSrjkfumnP0doFOfQZ3WewhpNshS2jsvT1AWk7RGbMk0hLP766JXhK7xK+N9BGMOr9zbixnw3xipzzkJ5kQ=
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr2653434wmh.55.1597297365586; 
 Wed, 12 Aug 2020 22:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200813033807.19556-1-qiuwenbo@phytium.com.cn>
In-Reply-To: <20200813033807.19556-1-qiuwenbo@phytium.com.cn>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 12 Aug 2020 22:42:34 -0700
Message-ID: <CAOnJCUJzLfbMgdyYY58ssQGyJaX9KJJ-MjHKPnOK=gcdRvPk8A@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Setup exception vector for nommu platform
To: Qiu Wenbo <qiuwenbo@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_014248_372822_FBFBD07B 
X-CRM114-Status: GOOD (  17.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 8:40 PM Qiu Wenbo <qiuwenbo@phytium.com.cn> wrote:
>
> Exception vector is missing on nommu platform and that is an issue.
> This patch is tested in Sipeed Maix Bit Dev Board.
>
> Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
> Suggested-by: Anup Patel <anup@brainfault.org>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
> ---
>  arch/riscv/kernel/head.S | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index d0c5c316e9bb..0a4e81b8dc79 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -77,16 +77,10 @@ relocate:
>         csrw CSR_SATP, a0
>  .align 2
>  1:
> -       /* Set trap vector to exception handler */
> -       la a0, handle_exception
> +       /* Set trap vector to spin forever to help debug */
> +       la a0, .Lsecondary_park
>         csrw CSR_TVEC, a0
>
> -       /*
> -        * Set sup0 scratch register to 0, indicating to exception vector that
> -        * we are presently executing in kernel.
> -        */
> -       csrw CSR_SCRATCH, zero
> -
>         /* Reload the global pointer */
>  .option push
>  .option norelax
> @@ -144,9 +138,23 @@ secondary_start_common:
>         la a0, swapper_pg_dir
>         call relocate
>  #endif
> +       call setup_trap_vector
>         tail smp_callin
>  #endif /* CONFIG_SMP */
>
> +.align 2
> +setup_trap_vector:
> +       /* Set trap vector to exception handler */
> +       la a0, handle_exception
> +       csrw CSR_TVEC, a0
> +
> +       /*
> +        * Set sup0 scratch register to 0, indicating to exception vector that
> +        * we are presently executing in kernel.
> +        */
> +       csrw CSR_SCRATCH, zero
> +       ret
> +
>  .Lsecondary_park:
>         /* We lack SMP support or have too many harts, so park this hart */
>         wfi
> @@ -240,6 +248,7 @@ clear_bss_done:
>         call relocate
>  #endif /* CONFIG_MMU */
>
> +       call setup_trap_vector
>         /* Restore C environment */
>         la tp, init_task
>         sw zero, TASK_TI_CPU(tp)
> --
> 2.28.0
>
@palmer: Can you queue this for the next part2 PR ?

Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
