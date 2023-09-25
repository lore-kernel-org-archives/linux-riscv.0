Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC01CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMA4Xwp3JRA4S0VzmKsV0bpL/EKvnlNdvBB7u9KaW5s=; b=wiEtm4iIXMYSJT
	SiJFQb8f2ZONmZMxZdqtx463GEd40g+Y2/Y3ZKZ9rdTs1LviqmS6jw+PCJ6/uzKBIzhkAmCGhmPeH
	jcvMkyY6sijxhz7JoChKBJkiEGLnx1LmobOGfR8dVjpk+aQHS6HM233vwJ1LHm1rBzU6jrN82iB6j
	8fXtkY9itwpbnVyGz8q8McbpSav2HPrcmmjypBhKcUF7foGSZqWHDOSFJCtdTUG3RtJHndqytFkgL
	aKjYjF/pYkZV7SQusdebHZ0HbliLb65Xq6BLpiC/Bij79qUOxpj5/DUrEvgS7KJ5cc6Qvs/JrrEfX
	1Nz+Ehx6WfqPoWnziJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkNb-00EDwC-0h;
	Mon, 25 Sep 2023 12:07:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkNY-00EDv8-17
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 12:07:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99357737980so760570766b.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695643672; x=1696248472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy47Y7ucPAOY0vxF3jqnu2jXoTD8DX+ZMWH30iPD+8g=;
        b=cEVv2WqrFxu4qJD3bA52fMtrnz4VDTIXsVDydVjHeiItThF+8/2PxxJUFH6+5rnYzL
         WIPCKdd35+s2iHAeq8q7T+FWiGzOd3CMWYIBvXR8UaLUhf6qg+emdMITQ6OZEh9nLfmI
         S+NOAMB3MJI3InJ7L5MrbnawgJtaNIyAl+vnotR0omEix18pKuSLRdp/ZimkMp8h14cs
         uK5PwAdE7tF4dpxAdw9oaEDmPA9qaJt/w7QUkjNy0hrVh77cRUU5v7645YMexGBrh9K2
         Fvc9rHa5Z22VvEKemm/Rk+GQJmoLvL37va4dbqmxEIc7tsbqONr01JXUfDhtLxEjEZ3m
         TI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695643672; x=1696248472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy47Y7ucPAOY0vxF3jqnu2jXoTD8DX+ZMWH30iPD+8g=;
        b=gvP7Z8IADoAqrUAPBS75E/F5Uda04IFZL6sd+1mVd/bxhYrmTQD2WHztHHOzuXfdaH
         QiJUrPXZzWR+cuxSHFvkpn/f+wUbwltkmZW3g0lBnTJRfdNH+dFWyTDFuq9iqOvjiTje
         PsB1U/+WTU5IIqb9XlN7nsPz0g3Lo0PJLJC9kPM/4SGdnrsXpriGH0zRMsLayTMTRlKO
         /wIaCvJTOYHy8t0dNbF1AIpHwua+OodmDu0L7xYmLriATFQ+uaTRSg3rYsthAgh6YP51
         4NI5ZiiTvXcfrQrHr5+bLMv9v7KYiOlSFhyfi06cuMSkx0UjEKxNMaTrDHB28UWhOLaQ
         XlzA==
X-Gm-Message-State: AOJu0YygQXxkJyVa2Fmb7vxPa9EvBqGFsZRGToH9sqRzwJdqIk5I9M35
	7fFhLAqX9e3EAXryjZseMp+4yw==
X-Google-Smtp-Source: AGHT+IEh7iCaxWxFHovkcNm5uQwnk5vWfgBaV95do79jlX/HgQdfJmIIQSlk2403ZWWhnWDpxMtaZA==
X-Received: by 2002:a17:907:b10:b0:9ae:62ec:e897 with SMTP id h16-20020a1709070b1000b009ae62ece897mr5115624ejl.4.1695643671955;
        Mon, 25 Sep 2023 05:07:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ep14-20020a1709069b4e00b009a168ab6ee2sm5673066ejc.164.2023.09.25.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:07:51 -0700 (PDT)
Date: Mon, 25 Sep 2023 14:07:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, apatel@ventanamicro.com
Subject: Re: [RFC PATCH 1/5] RISC-V: hwprobe: Clarify cpus size parameter
Message-ID: <20230925-fad87a4bcd9df339280c35e9@orel>
References: <20230921125518.175428-8-ajones@ventanamicro.com>
 <mhng-0195c377-cfb6-438d-a17b-86da7f14b868@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-0195c377-cfb6-438d-a17b-86da7f14b868@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_050756_384729_D5CD9352 
X-CRM114-Status: GOOD (  38.75  )
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

On Mon, Sep 25, 2023 at 04:23:22AM -0700, Palmer Dabbelt wrote:
> On Thu, 21 Sep 2023 05:55:20 PDT (-0700), ajones@ventanamicro.com wrote:
> > The "count" parameter associated with the 'cpus' parameter of the
> > hwprobe syscall is the size in bytes of 'cpus'. Naming it 'cpu_count'
> > may mislead users (it did me) to think it's the number of CPUs that
> > are or can be represented by 'cpus' instead. This is particularly
> > easy (IMO) to get wrong since 'cpus' is documented to be defined by
> > CPU_SET(3) and CPU_SET(3) also documents a CPU_COUNT() (the number
> > of CPUs in set) macro. CPU_SET(3) refers to the size of cpu sets
> > with 'setsize'. Adopt 'cpusetsize' for the hwprobe parameter and
> > specifically state it is in bytes in Documentation/riscv/hwprobe.rst
> > to clarify.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  Documentation/riscv/hwprobe.rst  | 15 ++++++++-------
> >  arch/riscv/kernel/sys_riscv.c    | 14 +++++++-------
> >  arch/riscv/kernel/vdso/hwprobe.c | 10 +++++-----
> >  3 files changed, 20 insertions(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> > index 7b2384de471f..132e9acaa8f4 100644
> > --- a/Documentation/riscv/hwprobe.rst
> > +++ b/Documentation/riscv/hwprobe.rst
> > @@ -12,7 +12,7 @@ is defined in <asm/hwprobe.h>::
> >      };
> > 
> >      long sys_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> > -                           size_t cpu_count, cpu_set_t *cpus,
> > +                           size_t cpusetsize, cpu_set_t *cpus,
> >                             unsigned int flags);
> > 
> >  The arguments are split into three groups: an array of key-value pairs, a CPU
> > @@ -20,12 +20,13 @@ set, and some flags. The key-value pairs are supplied with a count. Userspace
> >  must prepopulate the key field for each element, and the kernel will fill in the
> >  value if the key is recognized. If a key is unknown to the kernel, its key field
> >  will be cleared to -1, and its value set to 0. The CPU set is defined by
> > -CPU_SET(3). For value-like keys (eg. vendor/arch/impl), the returned value will
> > -be only be valid if all CPUs in the given set have the same value. Otherwise -1
> > -will be returned. For boolean-like keys, the value returned will be a logical
> > -AND of the values for the specified CPUs. Usermode can supply NULL for cpus and
> > -0 for cpu_count as a shortcut for all online CPUs. There are currently no flags,
> > -this value must be zero for future compatibility.
> > +CPU_SET(3) with size ``cpusetsize`` bytes. For value-like keys (eg. vendor,
> 
> So the only difference is just "with size ``cpusetsize`` bytes" and a bunch
> of line wrap changes?  That always makes these doc updates hard to read, as
> I go a bit cross-eyed trying to diff it manually.  I don't know of a better
> way to do it, though.

After applying the patch we can use 'git show --word-diff=color' on it.
In this case, we'll see the "with size ``cpusetsize``" change, and that I
also changed "vendor/arch/impl" to "vendor, arch, impl", dropped the first
'be' from "will be only be" and added `` around cpus.

> 
> > +arch, impl), the returned value will only be valid if all CPUs in the given set
> > +have the same value. Otherwise -1 will be returned. For boolean-like keys, the
> > +value returned will be a logical AND of the values for the specified CPUs.
> > +Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
> > +all online CPUs. There are currently no flags, this value must be zero for
> > +future compatibility.
> > 
> >  On success 0 is returned, on failure a negative error code is returned.
> > 
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index d7266a9abc66..14b6dfaa5d9f 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -246,7 +246,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >  }
> > 
> >  static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> > -			    size_t pair_count, size_t cpu_count,
> > +			    size_t pair_count, size_t cpusetsize,
> >  			    unsigned long __user *cpus_user,
> >  			    unsigned int flags)
> >  {
> > @@ -264,13 +264,13 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> >  	 * 0 as a shortcut to all online CPUs.
> >  	 */
> >  	cpumask_clear(&cpus);
> > -	if (!cpu_count && !cpus_user) {
> > +	if (!cpusetsize && !cpus_user) {
> >  		cpumask_copy(&cpus, cpu_online_mask);
> >  	} else {
> > -		if (cpu_count > cpumask_size())
> > -			cpu_count = cpumask_size();
> > +		if (cpusetsize > cpumask_size())
> > +			cpusetsize = cpumask_size();
> > 
> > -		ret = copy_from_user(&cpus, cpus_user, cpu_count);
> > +		ret = copy_from_user(&cpus, cpus_user, cpusetsize);
> >  		if (ret)
> >  			return -EFAULT;
> > 
> > @@ -347,10 +347,10 @@ arch_initcall_sync(init_hwprobe_vdso_data);
> >  #endif /* CONFIG_MMU */
> > 
> >  SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
> > -		size_t, pair_count, size_t, cpu_count, unsigned long __user *,
> > +		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
> >  		cpus, unsigned int, flags)
> >  {
> > -	return do_riscv_hwprobe(pairs, pair_count, cpu_count,
> > +	return do_riscv_hwprobe(pairs, pair_count, cpusetsize,
> >  				cpus, flags);
> >  }
> > 
> > diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
> > index d40bec6ac078..3000e9fc0569 100644
> > --- a/arch/riscv/kernel/vdso/hwprobe.c
> > +++ b/arch/riscv/kernel/vdso/hwprobe.c
> > @@ -8,21 +8,21 @@
> >  #include <vdso/helpers.h>
> > 
> >  extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> > -			 size_t cpu_count, unsigned long *cpus,
> > +			 size_t cpusetsize, unsigned long *cpus,
> >  			 unsigned int flags);
> > 
> >  /* Add a prototype to avoid -Wmissing-prototypes warning. */
> >  int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> > -			 size_t cpu_count, unsigned long *cpus,
> > +			 size_t cpusetsize, unsigned long *cpus,
> >  			 unsigned int flags);
> > 
> >  int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> > -			 size_t cpu_count, unsigned long *cpus,
> > +			 size_t cpusetsize, unsigned long *cpus,
> >  			 unsigned int flags)
> >  {
> >  	const struct vdso_data *vd = __arch_get_vdso_data();
> >  	const struct arch_vdso_data *avd = &vd->arch_data;
> > -	bool all_cpus = !cpu_count && !cpus;
> > +	bool all_cpus = !cpusetsize && !cpus;
> >  	struct riscv_hwprobe *p = pairs;
> >  	struct riscv_hwprobe *end = pairs + pair_count;
> > 
> > @@ -33,7 +33,7 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> >  	 * masks.
> >  	 */
> >  	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
> > -		return riscv_hwprobe(pairs, pair_count, cpu_count, cpus, flags);
> > +		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
> > 
> >  	/* This is something we can handle, fill out the pairs. */
> >  	while (p < end) {
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
