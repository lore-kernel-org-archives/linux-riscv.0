Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4E6C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:38:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD82613F6
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AD82613F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=atn0fELCp1bhsRovZy9KCclr8d/3b1W1TDrnUj2cawU=; b=EcSER2Kn/CC16nhHqzMBKjNU2
	FarNQ1q8l30FDMCrcqIclq/jIZkPp0Twc5yTL/P4l3fIrcnuiLUI/gGLAGUyw7s7SvkqMnZOVFYso
	Hkx5otE15CIvRYcpoSsB/COYgvpUob2ElvXYnhHYLJhRMfD2eVKDKeJPlZ/j+fW301qDwS2fb/PuM
	Ximngp05L+4pLTlmXnna7mOFRyqIbjfULx0XY0Uokf2QbM50FVZphd17lowM1+tnrB7rWHUTXZUC4
	3581rJwOb6OpVUga+qmjbNSM2C45C4EzfrETWJY6xeuK/7djEbMYvjgSHVM9L+99wHB1MCXjyPCup
	l9Sisx8jQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXei-003NJS-9x; Thu, 06 May 2021 06:38:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXec-003NIN-P3
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 06:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=4pB76DI3Wkv2k+3Ah6E6o80wVVbTYgSMN4+zljmic/s=; b=SMDu+Rof+YXNmirXnfkTvIf6st
 uimGATS838MZ5bdc7nBRCdBCufzBf11vvbpqAnvp/o0xzIpuuHJM+rt8vSJigGdows3376b0Ita/G
 lq+Wat27RQnakXMV9+PaHZFy3i0/V8EvpmtgxlyxO5xwwYR9KhUB7BHUWzKfccdlLezggBUwntqUJ
 YS6Tgc0FOjm8tPl9V328SZLRsngEI0YwJcpOUIdYwRzfwtmF1ES1rdO49VcbjyFW2dgpQO6CeS1UK
 1BQifpDTPHtD/N6XuVPwmzxSyCbwlctxxu/k5hxHexb9/9toZPsgVYoxWzBXdYYVzFB2afQlonY6B
 hGjFi1AQ==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXeZ-005dlU-N1
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 06:38:33 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so2907077pjz.0
 for <linux-riscv@lists.infradead.org>; Wed, 05 May 2021 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4pB76DI3Wkv2k+3Ah6E6o80wVVbTYgSMN4+zljmic/s=;
 b=F3VwvTrhJqDf7jP0FJSLtwO120b7Mf8vKLXOH2MJocvZQJMphG+bHlfFJe8MPPcKHO
 YXhVQS6DfmJyJMCgM5LZnWZHyG3tQt73DRmd3ICxYECMLEo/MYOVZKOhyVCKR5CmgVac
 9BR3mf5u2IkbAbcbOvELUusMbfM/jhczAPgMkHd2w/aGpc0p8K0Vuxj3LWqwo2iX8jGI
 MsxPvwddQr+NARZBgN3sZbiYBaLwj3bT3PgPVbSg76PuRiKfStkZqyepZPwhBo/42lIC
 0hYWSeF4bbbeFe5P4gvik60dLfaeaauTh5PqFNC4gy2nxGwOHNtgJO0V2wLUTmC+shqQ
 pD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4pB76DI3Wkv2k+3Ah6E6o80wVVbTYgSMN4+zljmic/s=;
 b=WHdF2dPajoqxql/d4ZhrxrXabt5hIJeqUJjcfcBUG8t9z9vdcRMs7aF/BNmgpXOWRK
 +s36tiZVNyooidcdluzMU3dyX2YFl+/UmVeeIc4CEX29SGa/pOALiUVm8Y7kY06/GDx4
 Oz7p9ZByjhIjIwMfhpn7n5mzF6MklhxJD51hGR8PoBNdxARFRRKxkHTEskYtvJnIXa/S
 zdgcV/hnH/CJW3ezMJygZO9yGaVkPkdYXnO10QOlTJXJUM3WWvsmHOWHsQ6MxV2o8/Jn
 pPXFvDowcyALd1fxus2KEJwxINVMbfoeLH+bxkhhyLKcOLIjwv5NLz52yT3nG92uvocD
 VhWg==
X-Gm-Message-State: AOAM530DH6b/9jduJvzz0cMS82n5ADsQGJtSOd11DpliqsT8FjXDO14X
 0M6m1F77/XFJC+mXpo5patkuUg==
X-Google-Smtp-Source: ABdhPJwjlJoVmo+6a8XDUXjGWJK6yuc+LZUn/I5j2bvw1wuEzN68RA3bmZmY0Echj2/a31sOJGD7bg==
X-Received: by 2002:a17:902:7081:b029:ed:5f:20af with SMTP id
 z1-20020a1709027081b02900ed005f20afmr3082620plk.60.1620283110274; 
 Wed, 05 May 2021 23:38:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n129sm1143567pfn.54.2021.05.05.23.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 23:38:29 -0700 (PDT)
Date: Wed, 05 May 2021 23:38:29 -0700 (PDT)
X-Google-Original-Date: Wed, 05 May 2021 23:38:26 PDT (-0700)
Subject: Re: [PATCH v8] RISC-V: enable XIP
In-Reply-To: <CA+G9fYv4y+n6PoYf1jOPZbjPxY7rTi+Ajc89zsNzTS0_uL+RJw@mail.gmail.com>
CC: alex@ghiti.fr, vitaly.wool@konsulko.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 lkft-triage@lists.linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: naresh.kamboju@linaro.org
Message-ID: <mhng-1125f9ca-cd05-4183-8c0e-e33922bc9add@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_233831_779815_A952D7B4 
X-CRM114-Status: GOOD (  23.16  )
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

On Mon, 26 Apr 2021 09:46:16 PDT (-0700), naresh.kamboju@linaro.org wrote:
> my two cents,
>
> The riscv build failed on Linux -next 20210426 tag kernel due to
> below warnings / errors.
> Following builds failed.
>  - riscv (tinyconfig) with gcc-8
>  - riscv (allnoconfig) with gcc-8
>  - riscv (tinyconfig) with gcc-9
>  - riscv (allnoconfig) with gcc-9
>  - riscv (tinyconfig) with gcc-10
>  - riscv (allnoconfig) with gcc-10
>
>> >> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> >> > index 30e4af0fd50c..2ddf654c72bb 100644
>> >> > --- a/arch/riscv/kernel/setup.c
>> >> > +++ b/arch/riscv/kernel/setup.c
>> >> > @@ -50,7 +50,11 @@ struct screen_info screen_info __section(".data") = {
>> >> >   * This is used before the kernel initializes the BSS so it can't be in the
>> >> >   * BSS.
>> >> >   */
>> >> > -atomic_t hart_lottery __section(".sdata");
>> >> > +atomic_t hart_lottery __section(".sdata")
>> >> > +#ifdef CONFIG_XIP_KERNEL
>> >> > += ATOMIC_INIT(0xC001BEEF)
>> >> > +#endif
>> >> > +;
>> >> >  unsigned long boot_cpu_hartid;
>> >> >  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>> >> >
>> >> > @@ -254,7 +258,7 @@ void __init setup_arch(char **cmdline_p)
>> >> >  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>> >> >       unflatten_and_copy_device_tree();
>> >> >  #else
>> >> > -     if (early_init_dt_verify(__va(dtb_early_pa)))
>> >> > +     if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
>
> arch/riscv/kernel/setup.c: In function 'setup_arch':
> arch/riscv/kernel/setup.c:284:32: error: implicit declaration of
> function 'XIP_FIXUP' [-Werror=implicit-function-declaration]
>   if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
>                                 ^~~~~~~~~
> arch/riscv/include/asm/page.h:112:62: note: in definition of macro
> 'linear_mapping_pa_to_va'
>  #define linear_mapping_pa_to_va(x) ((void *)((unsigned long)(x) +
> va_pa_offset))
>                                                               ^
> arch/riscv/include/asm/page.h:156:27: note: in expansion of macro
> '__pa_to_va_nodebug'
>  #define __va(x)  ((void *)__pa_to_va_nodebug((phys_addr_t)(x)))
>                            ^~~~~~~~~~~~~~~~~~
> arch/riscv/kernel/setup.c:284:27: note: in expansion of macro '__va'
>   if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
>                            ^~~~
> cc1: some warnings being treated as errors
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
>
> steps to reproduce:
> ---------------------------
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
>
>
> tuxmake --runtime podman --target-arch riscv --toolchain gcc-8
> --kconfig allnoconfig

Sorry, I didn't notice this as it went by but I think I've already fixed 
this one up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
