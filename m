Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51D6C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 11:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHiFDFbkWYh+wF1BzIrYZWT2uMCIRn7318SlADA2RDs=; b=FFEv8h3o4s0low
	2bPDVWcd4J0LrC9O5+dA6m3bEPhNC/q59cJvKpbCq2Z+DKGY3GDbSyqTKt0QmpGaz6L8W05aftAA7
	b+n4oEtfLLth66qA+UV5iQYHcpsP4dCzWUUN4INxZUb5QJfYDTOLamkYJSmbrSw7x7kVLVMu7MJi/
	ioQ6EJ7PMn/1D1KM4ayIsadFA2bif833UqCGaUVjavMFVcOxrYQNMy28Dwz97AswDhbgg6W22ixxv
	pEBEI1pAt02un4AddMQI8+a+pHYJHqKYuwYJ429poGPc56lYEW4fMiHGtNshz9rKgNgkdFOxNNEh/
	ZrXwzfVHEpQvbx2HUPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM45o-00000002VIA-0w7F;
	Tue, 25 Jun 2024 11:12:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM45k-00000002VHb-2K90
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 11:12:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-424a3199302so4892315e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719313922; x=1719918722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNSvJYQ84Lpo91/CHZiCcfBSDNWg96rwdJh6THLplUc=;
        b=OWSKalfb5ewfM4NvotTKkECwx4XNN4VV7SUCpj2GQpWiVg1WFrj3uzQr+/Iqrjxh50
         pH0Wj5qCZFeNMj3+Wo5NUW1NI1bMn5YAcByFFS3iJVq6zYmon8PfP8PkqPig/7jWmG3X
         Oqv67aNFllYM07we4CCbf3ek7AZgMUdQhiFO7Ps5CEQs7dIkReYHBsrUZQFgc56sZq8m
         agUbi+TOSPGiWwl0ZgLHmZzNy+KS7bQ93M6o/evZYgsMX4SltkL1Zm6V8wu3jHdzP+uU
         RsL9GdjJuQFTTPY42UMqL99PGLQl68WceFPRYvEPNIyERchPskkj5aBZ73FrkDOWc9hD
         D+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719313922; x=1719918722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNSvJYQ84Lpo91/CHZiCcfBSDNWg96rwdJh6THLplUc=;
        b=O/pkmzMTgt90sZtRMI6QYD2ShY/y/IW2aUH9PPwtxMyjB7a47swi+ly1eD9Kh947AW
         PiaVGmm6oRn2d3t2YRqE3TUmwl7sTuTfEydCpc9V8at4n2H6e7lbYSjdbZhMPhEOSv9A
         WRdEtDYzUFZj75DopH2BYRdG3ivVjKxxgClp9Yb23T67PGWgM++IqDULPzCyZ6B9fk9s
         OewxquyffRx2YI3AJcYuj4VKi7s8hEuCe5/i8f9Mo272m6rt4wVdSbvcEvWDfXnsFNhj
         t04/OONektZ9XUXvsHvvtkZyoMhTu4g0PKd2fDWGoC81zFTwcMjkPIf+lx01Ygyf5Alv
         PV5A==
X-Gm-Message-State: AOJu0YzRrkMlZ/36QO+tbqBIE6hb/yz4OgTBF+hZT55GKwn8VJmRACnr
	bqiZgWZTFnA0RPNr8j2xTh3iznFhPVyfze23CKRGcIzyQnO3hNF7WMLjoWFduA4=
X-Google-Smtp-Source: AGHT+IGOs8W4dqBLPwVmEQpe8KBAzt7p9Tyv8qL9RalgDqyktsyQVdOw7/ZJpWLQpvL7uzLTru39qw==
X-Received: by 2002:a5d:6584:0:b0:360:7c17:5936 with SMTP id ffacd0b85a97d-366e965297fmr5500858f8f.58.1719313921757;
        Tue, 25 Jun 2024 04:12:01 -0700 (PDT)
Received: from localhost ([185.71.170.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6f0csm12669975f8f.75.2024.06.25.04.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:12:01 -0700 (PDT)
Date: Tue, 25 Jun 2024 13:11:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH] RISC-V: Dynamically allocate cpumasks and further
 increase range and default value of NR_CPUS
Message-ID: <20240625-c1c3b9fcb6ee148294d4ceb4@orel>
References: <20240614075306.357861-1-liuyuntao12@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614075306.357861-1-liuyuntao12@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_041204_643903_7A5EFE68 
X-CRM114-Status: GOOD (  27.71  )
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

On Fri, Jun 14, 2024 at 07:53:06AM GMT, Yuntao Liu wrote:
> Currently default NR_CPUS is 64 for riscv64, since the latest QEMU virt
> machine supports up to 512 CPUS, so set default NR_CPUS 512 for riscv64.
> 
> Under the promotion of RISC-V International and related chip
> manufacturers, RISC-V has also begun to enter the server market, which
> demands higher performance. Other major architectures (such as ARM64,
> x86_64, MIPS, etc) already have a higher range, so further increase
> this range up to 4096 for riscv64.
> 
> Due to the fact that increasing NR_CPUS enlarges the size of cpumasks,
> there is a concern that this could significantly impact stack usage,
> especially for code that allocates cpumasks on the stack. To address
> this, we have the option to enable CPUMASK_OFFSTACK, which prevents
> cpumasks from being allocated on the stack. we choose to enable this
> feature only when NR_CPUS is greater than 512, why 512, since then
> the kernel size with offstack is smaller.

This isn't the reason why Arm decided to start at 512, afaict. The reason
for Arm was because hackbench did better with onstack for 256. What are
the hackbench results for riscv?

> 
> vmlinux size comparison(difference to vmlinux_onstack_NR_CPUS baseline):
> 
> NR_CPUS     256         512         1024        2048        4096
> onstack     19814536    19840760    19880584    19969672    20141704
> offstack    19819144    19840936    19880480    19968544    20135456
> difference  +0.023%     +0.001%     -0.001%     -0.001      -0.031%
> is_smaller  n           n           y           y           y

Since the savings are almost nothing we must not have too many global
cpumasks. But I'm in favor of ensuring stack depths stay under control,
so turning on CPUMASK_OFFSTACK sounds good to me in general.

> 
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  arch/riscv/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0525ee2d63c7..5960713b3bf9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -77,6 +77,7 @@ config RISCV
>  	select CLINT_TIMER if RISCV_M_MODE
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
> +	select CPUMASK_OFFSTACK if NR_CPUS > 512
>  	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>  	select EDAC_SUPPORT
>  	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
> @@ -428,11 +429,11 @@ config SCHED_MC
>  config NR_CPUS
>  	int "Maximum number of CPUs (2-512)"
>  	depends on SMP
> -	range 2 512 if !RISCV_SBI_V01
> +	range 2 4096 if !RISCV_SBI_V01
>  	range 2 32 if RISCV_SBI_V01 && 32BIT
>  	range 2 64 if RISCV_SBI_V01 && 64BIT
>  	default "32" if 32BIT
> -	default "64" if 64BIT
> +	default "512" if 64BIT

This is somewhat reasonable, even if nothing is going to use this for
quite a while, since it'll help avoid bugs popping up when NR_CPUS gets
bumped later, but it feels excessive right now for riscv, so I'm a bit
on the fence about it. Maybe if hackbench doesn't show any issues we
could turn CPUMASK_OFFSTACK on for a smaller NR_CPUS and also select
a smaller default?

Thanks,
drew

>  
>  config HOTPLUG_CPU
>  	bool "Support for hot-pluggable CPUs"
> -- 
> 2.34.1
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
