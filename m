Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756E8C433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 08:50:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4032820771
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 08:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SyccNMxq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Ad03R5Sa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4032820771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W1qfvL4nDLNW8Ys/FzlD/mfziVMQAtAbLb30tmKe+5o=; b=SyccNMxqXAr/oNbnnzM4nVNis
	P/JQqGR0prl3cb2OcIFxV3K8gVR21NfKJ3dojVFRxVx3wljuiYaBIOLcZNJPMAgTY5JpZKBh6WaPI
	w3oayiuke08kQ26/YX56GmFWJzRyrrVY3qpHDhouKSdYKoJxWM9Mb3t09ngpZtkn82bw/HgTTlj8a
	nd7iE0s9IEHNXstMtuoLaRjAr+K32/OQH0BYjJ9QFJAWOJK8bXYoAhRUK8///JvzXszquS9fgkJum
	APzOgb0u8f/nfpC/7ft21tw9JqpfOA4dZH6j+ZVP27j6kWyutR7yAJhmrBjGIzmStjguLBUOYFDsS
	675BcWMkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k68vy-0004tv-8e; Thu, 13 Aug 2020 08:50:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k68vv-0004sp-Ig
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 08:50:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id y3so4519306wrl.4
 for <linux-riscv@lists.infradead.org>; Thu, 13 Aug 2020 01:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gA5BB/+6xQCvX9+gmlnfVRPEcDMzoMSPM6EjTizB38A=;
 b=Ad03R5Saypn6P9X1Gr8J7GfoCKcFVoej6TsnRSjGxd8U5Rb4uTQzTPkd2xMUsQ4B/4
 cGfkleKDShOLTjij8QNOz6l/eTLDiOW7q4MbS9NzEHqQrVMO3jxSN9d2FnZPmTH18HHt
 PoYaCyaGChM2zHe9Mrt2JYvs18uJTD0vQm3dsVJg2+7lZ2g7DH1XwAf53jE8TJS6OXZ5
 mRL7xgMNinPPWL8xTtd7Pu9+Gl4xBZvBp+eZ2HSI9Twh1TtF2EYflORFuhGTi1ucT4LZ
 jpxhIWNex1+8aKVw/jNtVKafF1ogzF/Yg08k9X7fa0SAS85DxQggL5YeaHvmG0DnwRxj
 Rmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gA5BB/+6xQCvX9+gmlnfVRPEcDMzoMSPM6EjTizB38A=;
 b=bsSasjLy7uDl3jfhbdUhc7VZ0dzGQfRMAdH54uun+zhrpoauRocYh/uTLQLeElneG1
 Q5BqGSJ3/khqbuEtm4wfEY2Osoi7hEwvSP7kcYPvcnLYw26tpow0WMHFAI8vwujBmUyP
 /z+JxDs47odJNl9ZOYiFU91mLltrmah0AkEHIVcPxRWFMqEzjajwIOMPwTFbjwYBTLrn
 aZ/OK50D1cmUeJDcwdwkrSZTsGk89UADmt3ymj+4FSV06DugWwY6+V2OWSKIzsxKdTwg
 XLG5yUYKAqhp6pbPUdMAC7h+0lB+mqhXZsLljuiqvR+qRt4Z+cz5EVwLjF2cLBBsxEr6
 4f0w==
X-Gm-Message-State: AOAM533nyPsM9w8vujTP9yqCthFwTFbBs2wWhjKYtbG8DAKrkEfzddsD
 +l4TxBfw3LBAzubW4uFpMX0Av1f6v238mChNrhwYYg==
X-Google-Smtp-Source: ABdhPJxe9m0zrVq6TFy9qvEwk+3us03Rs+PvTuX4Rhtblh9UKM18MT2x1MkvcTf3UnJJL0vy7PaKOK69M0GNn/+fsp8=
X-Received: by 2002:adf:f247:: with SMTP id b7mr3217109wrp.128.1597308596480; 
 Thu, 13 Aug 2020 01:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200813033807.19556-1-qiuwenbo@phytium.com.cn>
In-Reply-To: <20200813033807.19556-1-qiuwenbo@phytium.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Aug 2020 14:19:44 +0530
Message-ID: <CAAhSdy1hLAVEHohtuZ6XYxOjWgUmZPXah=tJFrb6tWoRyEiRgA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Setup exception vector for nommu platform
To: Qiu Wenbo <qiuwenbo@phytium.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_044959_744095_F6579C5D 
X-CRM114-Status: GOOD (  17.33  )
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
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2020 at 9:10 AM Qiu Wenbo <qiuwenbo@phytium.com.cn> wrote:
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

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
