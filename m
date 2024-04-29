Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E33C19F53
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmUUSKDwp54bFSCSoDe8oUbJW7MvNG8OTbfK+VDxb4M=; b=es8no98ThkUCJv
	znVgY1XVELd3Wcg1P3/YZe9bT/XQo64uJ98hpjI5pDyG43lDYHSYfZj1H0RJNBHkgY3FcTKGkmjQv
	ughRO4L/9LwaFcVlaeKrJ7PHbkxqxb2urW2/b0qAgYBRxFItGv7sJoXeW14x/B0U75YthkcrwIufK
	Q12vXYQlCn2gxomCl4IGzfH+nh9zI9b306fA8ZoEvtoJKwpCG0mPNyxri2YVlD9wEAN5L2csYtmjv
	F6aHzcnbZlbybhCTNVSNiBcshEI4Jlm5HFowuDIiUl4paoSmo4eze/Xd3C67kqipNke0ORS0Ar03h
	xyy5zNaoX2XHuSFcBEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1S3p-000000038A4-3mys;
	Mon, 29 Apr 2024 14:32:53 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1S3n-0000000389I-0Cle
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 14:32:52 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3887150276.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714401168; x=1715005968; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EVa516LbuT5UPv0iKw28ApHoF3832BvwsWW0h9ARp8c=;
        b=u6ImNL39d07rUmVw83PxOseuz/QgFyJCYeGgXOwTgVl+gSJ5Qq1VNCUblgqDWvLvtt
         NBzX/IPNDTMFWwOSsIHj/tSAXRqZ/zLP71OEnwEzbUa9TbgeEKYswE6GAYMmF7jL5qLu
         Ro4wNvrtMX6OLmLgsO11BQ0XLL+EPFirECrDwWHS/ac7aAx11oSs9C31kNrHEWWpJYnS
         cu3pnWtbrsSWJY0ymkaR0mbJ/6ju0VntFrw+nyh57Sme0fJ0XJ+twhchaN1O60LjykBG
         tDCie033uyIdgaU/7yT7tk6XjJPEwRRLNKI/tYbnrcfAFg079xLFxShCZBTcwxo4dDPU
         8wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714401168; x=1715005968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVa516LbuT5UPv0iKw28ApHoF3832BvwsWW0h9ARp8c=;
        b=FK+0VvH/icYOc5kZvNIt36hzwuE13xz0Bj5kktnfU4D+b5X0lulJa1hsIvN0ik2E8/
         KPVgfuKSfz0r+twM04cxD43kvfK97iMbkNVigrDj/oDjEW5oAE3yrJ1GTmyBaZogdgEC
         GB98ebk+VRmtbBwYJZs3d5m9OjbGi/OGltau2WtJSg6PjQAS8hn7QumTcZh3Nu+ZQ4cP
         OEZXu8AAsdbDMeF7qA6YTuxLQduqsWy+N9BYFoSOsFXTpmX+ZljhNBVAPrsDJGhf2Izi
         pF2d5AKPr+6X+lZ1rwfV12ZbZ7OiPdngbVDHDal11Y12kvNjWy3LCtuLjtuXtIsQrU5n
         mPCg==
X-Forwarded-Encrypted: i=1; AJvYcCUIn6RbDXck7kcw+ZQXBU0XWrUyarTfYz9/9M4NyUFlsbmDlPXz9NVXd3z5ydZxeZA7+8btFfBuKwCeELo9F7tt6PpjlMiyfGycxJzfrvVo
X-Gm-Message-State: AOJu0YxoNRG1MOCyLLfDtDglvZrfJiwKs1INckGA2dAE2Vdv5DaM4yV7
	PdeK7F/Xqfpx8AU5YlDUwgve+tunBN6Dai+q8XAnaq8XMJTSUTchS7hMBew1vmRgH1wavWvmdBX
	ELs4562zADEo+bBCfB6Xsa/hRFYeJtiw/5KJsZkyfE274qH1k
X-Google-Smtp-Source: AGHT+IEBhQrtCQ31Q1yBqSjyByUL2jVr1xrFTj8kOrfHtAdw8Xnv7g9ncuR5kGy6Y4r51HFP6z0R1OWCL4HGDGIqLfs=
X-Received: by 2002:a05:6902:2788:b0:ddd:7a62:59b0 with SMTP id
 eb8-20020a056902278800b00ddd7a6259b0mr5454757ybb.15.1714401168659; Mon, 29
 Apr 2024 07:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com>
In-Reply-To: <20240226065113.1690534-1-nick.hu@sifive.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Apr 2024 16:32:12 +0200
Message-ID: <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Nick Hu <nick.hu@sifive.com>, palmer@dabbelt.com
Cc: anup@brainfault.org, rafael@kernel.org, daniel.lezcano@linaro.org, 
	paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_073251_107182_C5ED8A73 
X-CRM114-Status: GOOD (  18.03  )
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

On Mon, 26 Feb 2024 at 07:51, Nick Hu <nick.hu@sifive.com> wrote:
>
> When the cpus in the same cluster are all in the idle state, the kernel
> might put the cluster into a deeper low power state. Call the
> cluster_pm_enter() before entering the low power state and call the
> cluster_pm_exit() after the cluster woken up.
>
> Signed-off-by: Nick Hu <nick.hu@sifive.com>

I was not cced this patch, but noticed that this patch got queued up
recently. Sorry for not noticing earlier.

If not too late, can you please drop/revert it? We should really move
away from the CPU cluster notifiers. See more information below.

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index e8094fc92491..298dc76a00cf 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -394,6 +394,7 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
>  {
>         struct genpd_power_state *state = &pd->states[pd->state_idx];
>         u32 *pd_state;
> +       int ret;
>
>         if (!state->data)
>                 return 0;
> @@ -401,6 +402,10 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
>         if (!sbi_cpuidle_pd_allow_domain_state)
>                 return -EBUSY;
>
> +       ret = cpu_cluster_pm_enter();
> +       if (ret)
> +               return ret;

Rather than using the CPU cluster notifiers, consumers of the genpd
can register themselves to receive genpd on/off notifiers.

In other words, none of this should be needed, right?

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
