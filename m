Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C91C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 19:59:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEDE64F68
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 19:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCEDE64F68
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nhk4/nyomgzLijwtIDf9m4occrEuppmfn0FGeYojixs=; b=dRWBR1V++ji829BbdSJLglO+o
	IRb2EsL+qTgpJOhH6IYjYj7ehuOZtoi7Op4WF5iN23mtfYLo4tknA9dxq17saFoMVlWOIk+mOY1AZ
	YcxOU8Hypc6yv5HS50KGKuJFwLOxN1567ZCQ3T2IQQII9De0yq3oZyFHssGUo6YcVgcswvDHFNItk
	hcJ+uRAQvmnz/WW9cyt/69+y6sokshGhfbbpzKTlUlvnVNRESQoz5AOV/RQVld7mtF5TSizcXLQID
	xeGi+3iOMLm7yYak2hQmVVWznFTJTqwLlv/WO+W96zcHqeEWOKU5SK4QaXTKdSDPa1s+V8gRxVTAy
	dAALlqjgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7OJT-00045L-KR; Wed, 03 Feb 2021 19:59:43 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7OJQ-00044s-UY
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 19:59:42 +0000
Received: by mail-il1-x136.google.com with SMTP id q9so438323ilo.1
 for <linux-riscv@lists.infradead.org>; Wed, 03 Feb 2021 11:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8wBF4byGd+5E5RDbtRZawGnYXYpJKJhfC8tVLt9zM8w=;
 b=a2wkcb/4QfG25qaZwMQxxvix0HyxSs4FEaOOAbuBCzA1qJh53X4e9amlvPQQMSacx2
 LojD1MKa5DQgo9iAwXwQC9LtrNulf831ymnBu7n9peNHieAbMpeUu7FHUkpBFU1dPlHx
 I7NXa4gWorr3JQVVsjCiuuT4p60uN/WS8LQPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wBF4byGd+5E5RDbtRZawGnYXYpJKJhfC8tVLt9zM8w=;
 b=EpOo4Q2bNLiX84d/4RZ3ASNJxFgDMVsKI3itr+074DPxahcPb8I23EHmLpp44wEFMg
 /i7n9OZwrj1KoEdw8h5lY7stdJ5dJ61GPD0nXVzDQL0WHWwdMzitydKsKZvYIDTvpzeW
 j+I8t2v1vQWbT4z4UNenlEen7Yrs3fXPAjzZT9leOlrzUzfHv2V4CTiRVY0S0xmWCk30
 +WhHAwPd/E3JA8avxqkVe0TS3TFelewweivhxZ4MaD9M2DR5WZpO6gyYgakPjWlfbwGI
 Lqp+imEEPr280x2i7AxxzJPG3h1I/UV29O9x/+BMHxBZTDfnfX4hlTxbbPAFheII/KI6
 pvbw==
X-Gm-Message-State: AOAM530DE5+sPfISUQ75UQ/9TV/wF3QUMVmcZ4npspcHEU/r7UuzfdYz
 NX8s2C/+kgrLDgmD77r+wunO5pn9tK8pf2vNKu1C
X-Google-Smtp-Source: ABdhPJwLt1oJOjkGGy63nTsaaj7bj6cUqa2ptsl23PUfXbwNgsfCvM8mzR1Mg558w2izIlRiHyzUG88wh07IktBk5Sc=
X-Received: by 2002:a05:6e02:1608:: with SMTP id
 t8mr3922687ilu.79.1612382378741; 
 Wed, 03 Feb 2021 11:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203142343.59781-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210203142343.59781-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 3 Feb 2021 11:59:27 -0800
Message-ID: <CAOnJCULd0=FoQjorjmz6EVB7_YphjGBwUCuY+ntOP6JiUb4P6w@mail.gmail.com>
Subject: Re: [PATCH -next] RISCV: Add some depends for NUMA
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_145941_131537_117F8AA6 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 3, 2021 at 6:20 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> The numa feature is useless for riscv32 platform(MAXPHYSMEM_1GB if 32bit),
> and it should depends on SMP feature, this also fix the build error,
>
>   riscv64-buildroot-linux-gnu-ld: mm/page_alloc.o: in function `.L0 ':
>   page_alloc.c:(.text+0x4808): undefined reference to `node_reclaim_distance'
>

Thanks for the fix. The commit text is a bit ambiguous. The
compilation issue error is due to SMP.
RV32 dependency is just another fix  as NUMA is not very useful for RV32.

> Fixes: 4f0e8eef772e ("riscv: Add numa support for riscv64 platform")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 22fa17898d29..ac7f5801bd82 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -312,6 +312,8 @@ endchoice
>  # Common NUMA Features
>  config NUMA
>         bool "NUMA Memory Allocation and Scheduler Support"
> +       depends on SMP
> +       depends on 64BIT
>         select GENERIC_ARCH_NUMA
>         select OF_NUMA
>         select ARCH_SUPPORTS_NUMA_BALANCING
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
