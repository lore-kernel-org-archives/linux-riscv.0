Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67616CE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 11:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2/N2SHrq7Z7dyBR5xoyYYykgRHv+8CLtGK7W8rwAKAQ=; b=sELjhJXuxPGu/70m59KASLYUoT
	nxZEjMIiPSfaQads/W8egHYTatJXw+/8K42+tkTwGHlE9iLwC2etfnsrhq/42aBZe9omfI0j6Jgcn
	o45ZgBu0Z16D9q36nbFVcQLzTNkizEMSFIYo1Virspqwape75cFJShYhV+tAeDso97cYo+vslYj1Q
	R5FH++QOIvq2APMCULfhb7LCb9GqV7f4TC8ZDYc/5uOKI2ayvk/Oy3h8ClSYXNG1KuTv4+EOMdiaR
	wGGj3t+kx6lSwtY1PoiSfBxpDWvt5CpUI5IdZcVLGKKpPgRc5hJoCAliDhhxJwat64odIS62mss49
	Dj4hLxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgf-00E9tO-2g;
	Mon, 25 Sep 2023 11:23:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgb-00E9s1-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 11:23:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c5cd27b1acso54314265ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 04:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695641010; x=1696245810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VCKSWuHRGGMefd3y5VmXT3UYjLkmvjBhpNYW23/5mk=;
        b=Pla/swEPH2D1A/UuEOjXS2JzQE7SFaEzWdAX/0WwxkZNsXbws3VGLyCAzuc7ldJMVW
         MulpKRjVA9b3WsNzdjatxVKppKKDz7U8k8ddeERnVXCpGDlucEH97jo0uFxhwWlgP/vH
         FT6IIrWlIUqUvgGCiBBAJg3LyrAmPk3AF6FVCKUCOFsG1bMY8rS9qnY2m5mZoWCkzr2D
         1UMmjKSR82qwgmda1hSrbJSJ0/dbSRQOJsbm1Esfd70eg2Qrj9lJBD2X2pbkwHMQ6UDS
         oz8LHpoSCwxbLzkmWSLI57GTSUMCETTf7uf12GW11HtRjK480zxiWVDsUy2dWraTiR9m
         0upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695641010; x=1696245810;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VCKSWuHRGGMefd3y5VmXT3UYjLkmvjBhpNYW23/5mk=;
        b=aCT87UTolJtLrfte34ESVbDbZOa8xaQQmHQ0nkf1ZZwMwti6Tyu/i3GCJ4qd80KMj0
         sNaEYoYCErN65/rVvKA/QR6PkCaPJ5Khad97/+mNBYKiznnkObo5WlI1HIVZ4fpXHqma
         rjZogtyNOg9mZAf0t6fCJbG2RO9FMGowPe22r+Udhu69ynVIVMib32QY0jLak+ERPjcu
         8WaDsHQYVreaoQfWOicaEk+mlS1oqX7BOfnXUDP5WMfQHxsOmQTspzfMOFDGiFiFJLd9
         vKiMDQZ56nRclaCQvJz6+l1cbebGcNqYIc4BUZsnjf0O3vePyWkic0DfqUgvp4iyu9zG
         N97Q==
X-Gm-Message-State: AOJu0YwGtULjx1iBfXZlv6PI2GN1mVNx6roWiaUycfcXr3kH6IzNfXbD
	h0jUYeFwb6YdO9/nJePJ9mtdEv8y1B4GvgK5rqtB6g==
X-Google-Smtp-Source: AGHT+IGGZKLjaALSE0r4eHjK4fvsun1bPj8M6E8sXI9aL2SN/mHIV5zfttu7xDWRjyv0ME9uDzolqw==
X-Received: by 2002:a17:902:c409:b0:1b8:954c:1f6 with SMTP id k9-20020a170902c40900b001b8954c01f6mr8838184plk.36.1695641009695;
        Mon, 25 Sep 2023 04:23:29 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id jh5-20020a170903328500b001bba7aab822sm8656479plb.5.2023.09.25.04.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:23:29 -0700 (PDT)
Date: Mon, 25 Sep 2023 04:23:29 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Sep 2023 04:18:05 PDT (-0700)
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
In-Reply-To: <20230921125518.175428-10-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-7c3d5229-a87c-47f3-8a7c-4db3de333ff1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_042333_218763_C572CB4B 
X-CRM114-Status: GOOD (  40.91  )
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

On Thu, 21 Sep 2023 05:55:22 PDT (-0700), ajones@ventanamicro.com wrote:
> Introduce the first flag for the hwprobe syscall. The flag basically
> reverses its behavior, i.e. instead of populating the values of keys
> for a given set of cpus, the set of cpus after the call is the result
> of finding a set which supports the values of the keys. In order to
> do this, we implement pair merge and pair compare functions which
> take the type of value (a single value vs. a bitmap of booleans) into
> consideration. The flow for the which-cpus syscall variant is as
> follows:
>
>   1. Merge pairs into a set of pairs with unique keys
>   2. If any unknown keys are seen, return an empty set of cpus
>   3. If the platform is homogeneous, then check all the pairs
>      against the "all cpu" values and return early
>   4. Otherwise, check all the pairs against each cpu individually
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/riscv/hwprobe.rst       |  16 ++-
>  arch/riscv/include/uapi/asm/hwprobe.h |   3 +
>  arch/riscv/kernel/sys_riscv.c         | 148 +++++++++++++++++++++++++-
>  3 files changed, 163 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 132e9acaa8f4..97b1e97e7dd2 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -25,8 +25,20 @@ arch, impl), the returned value will only be valid if all CPUs in the given set
>  have the same value. Otherwise -1 will be returned. For boolean-like keys, the
>  value returned will be a logical AND of the values for the specified CPUs.
>  Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
> -all online CPUs. There are currently no flags, this value must be zero for
> -future compatibility.
> +all online CPUs. The currently supported flags are:
> +
> +* :c:macro:`RISCV_HWPROBE_WHICH_CPUS`: This flag basically reverses the behavior
> +  of sys_riscv_hwprobe().  Instead of populating the values of keys for a given
> +  set of CPUs, the set of CPUs is initially all unset and the values of each key
> +  are given.  Upon return, the CPUs which all match each of the given key-value
> +  pairs are set in ``cpus``.  How matching is done depends on the key type.  For
> +  value-like keys, matching means to be the exact same as the value.  For
> +  boolean-like keys, matching means the result of a logical AND of the pair's
> +  value with the CPU's value is exactly the same as the pair's value.  ``cpus``
> +  may also initially have set bits, in which case the bits of any CPUs which do
> +  not match the pairs will be cleared, but no other bits will be set.
> +
> +All other flags are reserved for future compatibility and must be zero.
>
>  On success 0 is returned, on failure a negative error code is returned.
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 86d08a0e617b..36683307c3e4 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -40,4 +40,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
> +/* Flags */
> +#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
> +
>  #endif
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 14b6dfaa5d9f..c70a72fe6aee 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -245,14 +245,145 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  	}
>  }
>
> +static bool hwprobe_key_is_map(__s64 key)
> +{
> +	switch (key) {
> +	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> +	case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +	case RISCV_HWPROBE_KEY_CPUPERF_0:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int hwprobe_pair_merge(struct riscv_hwprobe *to,
> +			      struct riscv_hwprobe *from)
> +{
> +	if (to->key != from->key)
> +		return -EINVAL;
> +
> +	if (hwprobe_key_is_map(to->key)) {
> +		to->value |= from->value;
> +		return 0;
> +	}
> +
> +	return to->value == from->value ? 0 : -EINVAL;
> +}
> +
> +static bool hwprobe_pair_cmp(struct riscv_hwprobe *pair,
> +			     struct riscv_hwprobe *other_pair)
> +{
> +	if (pair->key != other_pair->key)
> +		return false;
> +
> +	if (hwprobe_key_is_map(pair->key))
> +		return (pair->value & other_pair->value) == other_pair->value;
> +
> +	return pair->value == other_pair->value;
> +}
> +
> +static int hwprobe_which_cpus(struct riscv_hwprobe __user *pairs_user,
> +			      size_t pair_count, size_t cpusetsize,
> +			      cpumask_t *cpus)
> +{
> +	struct riscv_hwprobe pairs[RISCV_HWPROBE_MAX_KEY + 1] = {
> +		[0 ... RISCV_HWPROBE_MAX_KEY] = (struct riscv_hwprobe){ .key = -1 }
> +	};
> +	struct riscv_hwprobe pair;
> +	struct vdso_data *vd = __arch_get_k_vdso_data();
> +	struct arch_vdso_data *avd = &vd->arch_data;
> +	bool clear_all = false;
> +	cpumask_t one_cpu;
> +	int cpu, ret;
> +	size_t i;
> +
> +	for (i = 0; i < pair_count; i++) {
> +		ret = copy_from_user(&pair, &pairs_user[i], sizeof(pair));
> +		if (ret)
> +			return -EFAULT;
> +
> +		if (pair.key >= 0 && pair.key <= RISCV_HWPROBE_MAX_KEY) {
> +			if (pairs[pair.key].key == -1) {
> +				pairs[pair.key] = pair;
> +			} else {
> +				ret = hwprobe_pair_merge(&pairs[pair.key], &pair);
> +				if (ret)
> +					return ret;
> +			}
> +		} else {
> +			pair.key = -1;
> +			pair.value = 0;
> +			ret = copy_to_user(&pairs_user[i], &pair, sizeof(pair));
> +			if (ret)
> +				return -EFAULT;
> +			clear_all = true;
> +		}
> +	}
> +
> +	if (clear_all) {
> +		cpumask_clear(cpus);
> +		return 0;
> +	}
> +
> +	if (avd->homogeneous_cpus) {
> +		for (i = 0; i <= RISCV_HWPROBE_MAX_KEY; i++) {
> +			if (pairs[i].key == -1)
> +				continue;
> +
> +			pair.key = pairs[i].key;
> +			pair.value = avd->all_cpu_hwprobe_values[pairs[i].key];
> +
> +			if (!hwprobe_pair_cmp(&pair, &pairs[i])) {
> +				cpumask_clear(cpus);
> +				return 0;
> +			}
> +		}
> +
> +		return 0;
> +	}
> +
> +	cpumask_clear(&one_cpu);
> +
> +	for_each_cpu(cpu, cpus) {
> +		cpumask_set_cpu(cpu, &one_cpu);
> +
> +		for (i = 0; i <= RISCV_HWPROBE_MAX_KEY; i++) {
> +			if (pairs[i].key == -1)
> +				continue;
> +
> +			pair.key = pairs[i].key;
> +			pair.value = 0;
> +			hwprobe_one_pair(&pair, &one_cpu);
> +
> +			if (!hwprobe_pair_cmp(&pair, &pairs[i])) {
> +				cpumask_clear_cpu(cpu, cpus);
> +				break;
> +			}
> +		}
> +
> +		cpumask_clear_cpu(cpu, &one_cpu);
> +	}
> +
> +	return 0;
> +}
> +
>  static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>  			    size_t pair_count, size_t cpusetsize,
>  			    unsigned long __user *cpus_user,
>  			    unsigned int flags)
>  {
> +	bool which_cpus = false;
> +	cpumask_t cpus;
>  	size_t out;
>  	int ret;
> -	cpumask_t cpus;
> +
> +	if (flags & RISCV_HWPROBE_WHICH_CPUS) {
> +		if (!cpusetsize || !cpus_user)
> +			return -EINVAL;
> +		flags &= ~RISCV_HWPROBE_WHICH_CPUS;
> +		which_cpus = true;
> +	}
>
>  	/* Check the reserved flags. */
>  	if (flags != 0)
> @@ -274,11 +405,24 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>  		if (ret)
>  			return -EFAULT;
>
> +		cpumask_and(&cpus, &cpus, cpu_online_mask);
> +
> +		if (which_cpus) {
> +			if (cpumask_empty(&cpus))
> +				cpumask_copy(&cpus, cpu_online_mask);
> +			ret = hwprobe_which_cpus(pairs, pair_count, cpusetsize, &cpus);
> +			if (ret)
> +				return ret;
> +			ret = copy_to_user(cpus_user, &cpus, cpusetsize);
> +			if (ret)
> +				return -EFAULT;
> +			return 0;

So this is now essentailly two syscalls.  IMO it'd be cleaner to split 
out the implementations into two functions (ie, 
hwprobe_{which_cpus,which_featurs}() or whatever) rather than have an 
early out and the rest inline.

Also: maybe we want a whole hwprobe file?  It's sort of its own thing 
now, and it's only going to get bigger...

> +		}
> +
>  		/*
>  		 * Userspace must provide at least one online CPU, without that
>  		 * there's no way to define what is supported.
>  		 */
> -		cpumask_and(&cpus, &cpus, cpu_online_mask);
>  		if (cpumask_empty(&cpus))
>  			return -EINVAL;
>  	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
