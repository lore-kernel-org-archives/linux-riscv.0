Return-Path: <SRS0=01Py=JY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EA9C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 06:44:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA473610A5
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 06:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA473610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fO711iwl8XawHZTqfODn0FvU0hOpxYlSRxqIa9yXkDg=; b=S/myyh1VGTY8Vn+slqnFeTJLF
	PZX36BYmhczhldwRC9L5W4+Y2cs98T46uGRvixiBRUfSImKiUKjzI9R3GbMUWFk1iMBdphrZrjE1e
	OZeSzAfsAzX/J++JdP0kfKRiqnO/ELLeWT5lGB0D063rLY6Fq4ItgIy9Dsb7B63ZaZvWHiRVMTA+1
	hK5mz8E8vmXocpdqp40gYcYdNPJq+gWn286WTEgl0gfhBCI5FOTDOw7aHq6MxAo2ZJnGTF2r0/8SR
	pRmxDuP90TPzCX5RacXzeA8sVHvZOeyCdr+IV4ptAITQDhlvW69TQ9wfndrylkgHZm6hU1Xfzkdu0
	dW5dtBLXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHSP-000t0y-8G; Tue, 27 Apr 2021 06:44:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHSK-000t0i-6B
 for linux-riscv@desiato.infradead.org; Tue, 27 Apr 2021 06:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=qX8XoVDFV9zM92+v+Mcotb4X6xQJFvPhVLnMuS5VXTU=; b=Kj75ADFyKoWNekTgQv+/tgYBCe
 n03kI9lWB0x+GlIbx4X7Dt7JetfPuY4E491szkSqHsknu11pQGYmPZow05SjoHiV7v5PIlgbIbpgm
 cAW3nqJMYUNULLb8dB1WyCHE0jbWQCQbQdq+19naGTtoXNnT8Pn8yIPEUdKDvrDeRUKIZXa9HRbg3
 6fwJmmxqyedNL5rpLVKplxl4IT/fk5NccNDhVQv+ya6mXFm1fYHU3QNWEn1nraY4q2ni+3crP1cys
 vgVXXeUGewUuuHVsA1djMBBjCmJRaE2SRpK7wlAGbi8VOJhFXoNu+syJQH+ykrPBUDAOm/Jzigl0o
 D1t7fVjQ==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHSF-00GTqP-UC
 for linux-riscv@lists.infradead.org; Tue, 27 Apr 2021 06:44:21 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4272660007;
 Tue, 27 Apr 2021 06:44:11 +0000 (UTC)
Subject: Re: [PATCH v8] RISC-V: enable XIP
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, vitaly.wool@konsulko.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 lkft-triage@lists.linaro.org
References: <CAM4kBBJChiqkarKwn3roe+BLotsGDptfmYKKDxE45AnFZNUoPw@mail.gmail.com>
 <mhng-08bcf932-3a06-43cf-b0b0-9614d09aa17d@palmerdabbelt-glaptop>
 <CA+G9fYv4y+n6PoYf1jOPZbjPxY7rTi+Ajc89zsNzTS0_uL+RJw@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <3b6ff653-f29f-3230-201d-8ca756346792@ghiti.fr>
Date: Tue, 27 Apr 2021 02:44:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYv4y+n6PoYf1jOPZbjPxY7rTi+Ajc89zsNzTS0_uL+RJw@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_234420_272917_07D93D89 
X-CRM114-Status: GOOD (  19.49  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 4/26/21 =E0 12:46 PM, Naresh Kamboju a =E9crit=A0:
> my two cents,
> =

> The riscv build failed on Linux -next 20210426 tag kernel due to
> below warnings / errors.
> Following builds failed.
>   - riscv (tinyconfig) with gcc-8
>   - riscv (allnoconfig) with gcc-8
>   - riscv (tinyconfig) with gcc-9
>   - riscv (allnoconfig) with gcc-9
>   - riscv (tinyconfig) with gcc-10
>   - riscv (allnoconfig) with gcc-10
> =

>>>>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>>>>> index 30e4af0fd50c..2ddf654c72bb 100644
>>>>> --- a/arch/riscv/kernel/setup.c
>>>>> +++ b/arch/riscv/kernel/setup.c
>>>>> @@ -50,7 +50,11 @@ struct screen_info screen_info __section(".data") =
=3D {
>>>>>    * This is used before the kernel initializes the BSS so it can't b=
e in the
>>>>>    * BSS.
>>>>>    */
>>>>> -atomic_t hart_lottery __section(".sdata");
>>>>> +atomic_t hart_lottery __section(".sdata")
>>>>> +#ifdef CONFIG_XIP_KERNEL
>>>>> +=3D ATOMIC_INIT(0xC001BEEF)
>>>>> +#endif
>>>>> +;
>>>>>   unsigned long boot_cpu_hartid;
>>>>>   static DEFINE_PER_CPU(struct cpu, cpu_devices);
>>>>>
>>>>> @@ -254,7 +258,7 @@ void __init setup_arch(char **cmdline_p)
>>>>>   #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>>>>>        unflatten_and_copy_device_tree();
>>>>>   #else
>>>>> -     if (early_init_dt_verify(__va(dtb_early_pa)))
>>>>> +     if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
> =

> arch/riscv/kernel/setup.c: In function 'setup_arch':
> arch/riscv/kernel/setup.c:284:32: error: implicit declaration of
> function 'XIP_FIXUP' [-Werror=3Dimplicit-function-declaration]
>    if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
>                                  ^~~~~~~~~
> arch/riscv/include/asm/page.h:112:62: note: in definition of macro
> 'linear_mapping_pa_to_va'
>   #define linear_mapping_pa_to_va(x) ((void *)((unsigned long)(x) +
> va_pa_offset))
>                                                                ^
> arch/riscv/include/asm/page.h:156:27: note: in expansion of macro
> '__pa_to_va_nodebug'
>   #define __va(x)  ((void *)__pa_to_va_nodebug((phys_addr_t)(x)))
>                             ^~~~~~~~~~~~~~~~~~
> arch/riscv/kernel/setup.c:284:27: note: in expansion of macro '__va'
>    if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
>                             ^~~~
> cc1: some warnings being treated as errors
> =

> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> =

> =

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
> =

> =

> tuxmake --runtime podman --target-arch riscv --toolchain gcc-8
> --kconfig allnoconfig
>


Thank you Naresh for the report, I will fix that today.

Thanks again,

Alex

> --
> Linaro LKFT
> https://lkft.linaro.org
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
