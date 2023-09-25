Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DCECE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VgeUgG2QCDfsx3IVrlmcZk91Ii0a1Rk+lnuqq5aX4cQ=; b=nCxtipmFybPQohUyODaSHbcEzx
	nq+dcsHPBl2upTJPeu2S/jhhSQeuo95n5pF0Xb0bpNUtBmkIX/YOF1jTVcm9SvP1UttJNjhXNTrob
	KR8pLJj7Z+Xxiye5ANWiC7kh+g6wJTNfdwRet8gEEpqvrTzUlpMAJlrM0H8A4QKf45wEPzfUycHeg
	eC5FC34i7ZVi7v4KlrkJQcUyyWUBH8/dYqJKtJpBhDRz3ZnzqByEr5b27mMI/sDMVwhyYnqpOYGUv
	arNhxGCrAgBvVRrMjOBJvKiMGnTlrVUfwDIBdEe7GmSKepUakjoSzcjXAxLdGSDctQbYYZww21mkd
	ToOS0GkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgZ-00E9s3-1q;
	Mon, 25 Sep 2023 11:23:31 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgV-00E9rI-0l
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 11:23:29 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3a9b41ffe12so4175005b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695641003; x=1696245803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM8tmxp/i8+GAoJSHqXAfEzrbH7LODspiMyMfX0C05U=;
        b=UJmIeXzpn8Y0fQ7ERvbZJ5El4hJLu80tfCCX7Vh174kit5Vke4OAT4CxBvWFu3Bzgs
         Pr7dxWB12VdTBNSuodhytMxEIhUIFreETH5BbOBaasodj589pqTo6HRKjqTVSNIw1+y5
         xww+M45aA6R9usatGvNT6Ixe0RV8FLcE3CqtebS4wQvg5ylRoq1BRuu998IxHf5BvaXP
         JDvbbVx+rwiDpn4pba2XpzXfW/blr1UoR+uMfvMaakiSxJt68Y96YH5inuafYPj3UPiP
         WMCRJjzaq07cixhyD6k7Ckaga5DJnQ4u+ee1Vqn3JWvbxJUmSfAuI1FrTgJORYjB7ZOh
         rK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695641003; x=1696245803;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM8tmxp/i8+GAoJSHqXAfEzrbH7LODspiMyMfX0C05U=;
        b=mcLKPfvcrsj/5sfpUc3U6iiwHPNr7dp/rbVZjiuf+/kWw0fC918nA3OM6M0Ax5j1XC
         /P4ogmL2J0KiXhS3VDqgeNgBV54aNLznmB89ICT+3VBJfOFtt1PZn7EHGP3JYvX2yhJ7
         kopOv9Dbr4nP/CUTKpk2co/Xq8Xuk+AN3nA3vu/v3yghAFMriCwJpjbDa3Cijk68s6sw
         js/1o0W11OlJftJALYjR8k8OeUiFo9xc0LIPTYN8o0OMIdWo0SjYfNbuOWqIRY4V1NTt
         FaJwQ8hl4rAglLmeLzjvO898aqIB2CFdNcHNe0KiS3uZJcHbsSphA/CNvuDK4zwUENX8
         c6kA==
X-Gm-Message-State: AOJu0YxBsRbSwm2g+xCzs3rkUsk7qkVNn1TqnUN5Tvqd7HEuddmZBF7D
	e6h6iYD2qAcxi4Cfx+KmNvvY4jlYzb9OpG52GHq3NQ==
X-Google-Smtp-Source: AGHT+IEkhsMYT7ai26NYdTKOiAtMwj95cvi5c8nrNANsH5sSqI12IO14c9LOTgan6xIl+qhzCSurPw==
X-Received: by 2002:a05:6808:192a:b0:3a1:db18:401e with SMTP id bf42-20020a056808192a00b003a1db18401emr9794759oib.1.1695641003107;
        Mon, 25 Sep 2023 04:23:23 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79257000000b0068fcb70ccafsm7675259pfp.129.2023.09.25.04.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:23:22 -0700 (PDT)
Date: Mon, 25 Sep 2023 04:23:22 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Sep 2023 04:13:19 PDT (-0700)
Subject: Re: [RFC PATCH 1/5] RISC-V: hwprobe: Clarify cpus size parameter
In-Reply-To: <20230921125518.175428-8-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-0195c377-cfb6-438d-a17b-86da7f14b868@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_042327_504732_39195F3C 
X-CRM114-Status: GOOD (  34.33  )
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

On Thu, 21 Sep 2023 05:55:20 PDT (-0700), ajones@ventanamicro.com wrote:
> The "count" parameter associated with the 'cpus' parameter of the
> hwprobe syscall is the size in bytes of 'cpus'. Naming it 'cpu_count'
> may mislead users (it did me) to think it's the number of CPUs that
> are or can be represented by 'cpus' instead. This is particularly
> easy (IMO) to get wrong since 'cpus' is documented to be defined by
> CPU_SET(3) and CPU_SET(3) also documents a CPU_COUNT() (the number
> of CPUs in set) macro. CPU_SET(3) refers to the size of cpu sets
> with 'setsize'. Adopt 'cpusetsize' for the hwprobe parameter and
> specifically state it is in bytes in Documentation/riscv/hwprobe.rst
> to clarify.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/riscv/hwprobe.rst  | 15 ++++++++-------
>  arch/riscv/kernel/sys_riscv.c    | 14 +++++++-------
>  arch/riscv/kernel/vdso/hwprobe.c | 10 +++++-----
>  3 files changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 7b2384de471f..132e9acaa8f4 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -12,7 +12,7 @@ is defined in <asm/hwprobe.h>::
>      };
>
>      long sys_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -                           size_t cpu_count, cpu_set_t *cpus,
> +                           size_t cpusetsize, cpu_set_t *cpus,
>                             unsigned int flags);
>
>  The arguments are split into three groups: an array of key-value pairs, a CPU
> @@ -20,12 +20,13 @@ set, and some flags. The key-value pairs are supplied with a count. Userspace
>  must prepopulate the key field for each element, and the kernel will fill in the
>  value if the key is recognized. If a key is unknown to the kernel, its key field
>  will be cleared to -1, and its value set to 0. The CPU set is defined by
> -CPU_SET(3). For value-like keys (eg. vendor/arch/impl), the returned value will
> -be only be valid if all CPUs in the given set have the same value. Otherwise -1
> -will be returned. For boolean-like keys, the value returned will be a logical
> -AND of the values for the specified CPUs. Usermode can supply NULL for cpus and
> -0 for cpu_count as a shortcut for all online CPUs. There are currently no flags,
> -this value must be zero for future compatibility.
> +CPU_SET(3) with size ``cpusetsize`` bytes. For value-like keys (eg. vendor,

So the only difference is just "with size ``cpusetsize`` bytes" and a 
bunch of line wrap changes?  That always makes these doc updates hard to 
read, as I go a bit cross-eyed trying to diff it manually.  I don't know 
of a better way to do it, though.

> +arch, impl), the returned value will only be valid if all CPUs in the given set
> +have the same value. Otherwise -1 will be returned. For boolean-like keys, the
> +value returned will be a logical AND of the values for the specified CPUs.
> +Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
> +all online CPUs. There are currently no flags, this value must be zero for
> +future compatibility.
>
>  On success 0 is returned, on failure a negative error code is returned.
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index d7266a9abc66..14b6dfaa5d9f 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -246,7 +246,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  }
>
>  static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> -			    size_t pair_count, size_t cpu_count,
> +			    size_t pair_count, size_t cpusetsize,
>  			    unsigned long __user *cpus_user,
>  			    unsigned int flags)
>  {
> @@ -264,13 +264,13 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>  	 * 0 as a shortcut to all online CPUs.
>  	 */
>  	cpumask_clear(&cpus);
> -	if (!cpu_count && !cpus_user) {
> +	if (!cpusetsize && !cpus_user) {
>  		cpumask_copy(&cpus, cpu_online_mask);
>  	} else {
> -		if (cpu_count > cpumask_size())
> -			cpu_count = cpumask_size();
> +		if (cpusetsize > cpumask_size())
> +			cpusetsize = cpumask_size();
>
> -		ret = copy_from_user(&cpus, cpus_user, cpu_count);
> +		ret = copy_from_user(&cpus, cpus_user, cpusetsize);
>  		if (ret)
>  			return -EFAULT;
>
> @@ -347,10 +347,10 @@ arch_initcall_sync(init_hwprobe_vdso_data);
>  #endif /* CONFIG_MMU */
>
>  SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
> -		size_t, pair_count, size_t, cpu_count, unsigned long __user *,
> +		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
>  		cpus, unsigned int, flags)
>  {
> -	return do_riscv_hwprobe(pairs, pair_count, cpu_count,
> +	return do_riscv_hwprobe(pairs, pair_count, cpusetsize,
>  				cpus, flags);
>  }
>
> diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
> index d40bec6ac078..3000e9fc0569 100644
> --- a/arch/riscv/kernel/vdso/hwprobe.c
> +++ b/arch/riscv/kernel/vdso/hwprobe.c
> @@ -8,21 +8,21 @@
>  #include <vdso/helpers.h>
>
>  extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -			 size_t cpu_count, unsigned long *cpus,
> +			 size_t cpusetsize, unsigned long *cpus,
>  			 unsigned int flags);
>
>  /* Add a prototype to avoid -Wmissing-prototypes warning. */
>  int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -			 size_t cpu_count, unsigned long *cpus,
> +			 size_t cpusetsize, unsigned long *cpus,
>  			 unsigned int flags);
>
>  int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -			 size_t cpu_count, unsigned long *cpus,
> +			 size_t cpusetsize, unsigned long *cpus,
>  			 unsigned int flags)
>  {
>  	const struct vdso_data *vd = __arch_get_vdso_data();
>  	const struct arch_vdso_data *avd = &vd->arch_data;
> -	bool all_cpus = !cpu_count && !cpus;
> +	bool all_cpus = !cpusetsize && !cpus;
>  	struct riscv_hwprobe *p = pairs;
>  	struct riscv_hwprobe *end = pairs + pair_count;
>
> @@ -33,7 +33,7 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>  	 * masks.
>  	 */
>  	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
> -		return riscv_hwprobe(pairs, pair_count, cpu_count, cpus, flags);
> +		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
>
>  	/* This is something we can handle, fill out the pairs. */
>  	while (p < end) {

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
