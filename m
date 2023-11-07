Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E039AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eZz6J1v/Bd2gSp5Y+D55cct0aHcF1fEqg4UTtedCVYY=; b=m0k4/U6k6qfQXCIKCnCibyR02D
	P6CN26/smYi+N1FILofhRZKLWb2fhzxhH6n0DJSjocsxA5Tf/PYT0sVbEoGr9ZQVKUxy168YgOJ4o
	XgzAhbpmmqrICJmxXW0lpsM2eiR5J8Ov3L8DXD0kIvezI8J/foEGiygg4ZTEjqr2lPsxa18Mu8Mly
	ma6OdA1tjFsOHHzy4jQ+Fs9hLkGO1TOtkEvXgs7lzHf4+BrzmRFdv7310icCvdhGW6jkB6g5PVQg2
	ozI5R1JqkmbS+MlJpnAhmZ/u3wSP4IR8ZMB3xvuYR8QBtt4pC33jpOw+CGlcR/myQxhraezaRqXb2
	UJF323SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0QBS-0027Uc-2t;
	Tue, 07 Nov 2023 17:48:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0QBP-0027SD-1H
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 17:48:12 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cc30bf9e22so47050965ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 09:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699379288; x=1699984088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywd9froD7aOGJqc09ImjtHrARMhZvSCpgT2M8r3eM5I=;
        b=IJk+BGWhiYxd7SfTRl+GvTpkHbW5hNd9/hE7N6QuJVkMC4521JLyRVO7fqTE6FVwnX
         u1X74VtIdkowGNEjfgrBlwa8FzDaCuCph7O2V1yrQlarJM9Luxc0s54wSq6lIJn7toSK
         Dp+MgeasJwx+ygIvYH1hAbapXUq7h424p6/P4sxCOrkVBrDghuqu0VDptQozmYKHJXZU
         WEALDWnkj1RoT4/Ye1Pi4yEOeiI6xea3CdbbIm4Bdg+9gdGfNw2ebaXXGGNRN1ZmCROg
         h7sJjGf/ErZrSVZ5IMfRK92Dcmfja9aYz2EIFswh+iPJp8q9NN/Y7RPJvjU3GUVgUdTH
         8jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379288; x=1699984088;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywd9froD7aOGJqc09ImjtHrARMhZvSCpgT2M8r3eM5I=;
        b=K0U5yJEnhmi59OdFK0AtHGjfHAfLbKmbbOkeuzj3f34JVlzLy8BlKitNY//5Anyq60
         mYiIxgosIIWJkWI6Wpyet+CM2JNwUEzdCUBjqC6lOL/Hm4Mg4g7YbnyVCou5IDm2AcQl
         18aPirDiD1zFgj57eVPKCzC0aExUedqzLHwQiZHfJbGHhrtGqtHepSMxvjtxYZOkrnNH
         c5fHkqPuGlPZCtRjeJUlC7+nONEkWFPu9nZbkAILPCTlkHZ5I6178pp+egdOiY0HtE3l
         OAe4/6Jcj0K1fSnyoJf+RcEYOmH338P9lDUbWma3c8JHpIg7C1Mt35+e94XCtarFEE2b
         saRg==
X-Gm-Message-State: AOJu0YwxMPCuT6XgdpZyAKUnRIo4XTx7UOw614e+EEnGp9HHbCRW7e/X
	j6lotPNlV6oM1UkrefAipBC7NQ==
X-Google-Smtp-Source: AGHT+IE1O0IZeedx9DdABfISL9vUc/qLEJImXP8G88Ji0nXKSIqNVitCPYUEuOTU6Qgy+/VgBOwBhA==
X-Received: by 2002:a17:902:d4ce:b0:1cc:32df:8ebd with SMTP id o14-20020a170902d4ce00b001cc32df8ebdmr5416391plg.25.1699379288440;
        Tue, 07 Nov 2023 09:48:08 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id iy3-20020a170903130300b001c9dac0fbbasm115552plb.63.2023.11.07.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 09:48:07 -0800 (PST)
Date: Tue, 07 Nov 2023 09:48:07 -0800 (PST)
X-Google-Original-Date: Tue, 07 Nov 2023 09:47:58 PST (-0800)
Subject: Re: [PATCH RFC 21/22] riscv: Switch over to GENERIC_CPU_DEVICES
In-Reply-To: <E1r0JMQ-00CTyb-Ee@rmk-PC.armlinux.org.uk>
CC: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
  linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, linux-csky@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
  salil.mehta@huawei.com, jean-philippe@linaro.org, jianyong.wu@arm.com, justin.he@arm.com,
  james.morse@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rmk+kernel@armlinux.org.uk
Message-ID: <mhng-6d9a28af-d626-410e-913f-33bc01890537@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_094811_447402_43A497E5 
X-CRM114-Status: GOOD (  25.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 07 Nov 2023 02:31:06 PST (-0800), rmk+kernel@armlinux.org.uk wrote:
> From: James Morse <james.morse@arm.com>
>
> Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> overridden by the arch code, switch over to this to allow common code
> to choose when the register_cpu() call is made.
>
> This allows topology_init() to be removed.
>
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
>
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC v2:
>  * Add note about initialisation order change.
> ---
>  arch/riscv/Kconfig        |  1 +
>  arch/riscv/kernel/setup.c | 19 ++++---------------
>  2 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index eaa15a20e6ae..264aa466aec3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -69,6 +69,7 @@ config RISCV
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_ATOMIC64 if !64BIT
>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> +	select GENERIC_CPU_DEVICES
>  	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_ENTRY
>  	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 0624f44d43ec..f8875ae1b0aa 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -50,7 +50,6 @@ atomic_t hart_lottery __section(".sdata")
>  #endif
>  ;
>  unsigned long boot_cpu_hartid;
> -static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
>  /*
>   * Place kernel memory regions on the resource tree so that
> @@ -295,23 +294,13 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_set_dma_cache_alignment();
>  }
>
> -static int __init topology_init(void)
> +int arch_register_cpu(int cpu)
>  {
> -	int i, ret;
> +	struct cpu *c = &per_cpu(cpu_devices, cpu);
>
> -	for_each_possible_cpu(i) {
> -		struct cpu *cpu = &per_cpu(cpu_devices, i);
> -
> -		cpu->hotpluggable = cpu_has_hotplug(i);
> -		ret = register_cpu(cpu, i);
> -		if (unlikely(ret))
> -			pr_warn("Warning: %s: register_cpu %d failed (%d)\n",
> -			       __func__, i, ret);
> -	}
> -
> -	return 0;
> +	c->hotpluggable = cpu_has_hotplug(cpu);
> +	return register_cpu(c, cpu);
>  }
> -subsys_initcall(topology_init);
>
>  void free_initmem(void)
>  {

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
