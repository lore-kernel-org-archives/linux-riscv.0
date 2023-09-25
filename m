Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C568ACE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s84nxKOnwuqMxsf/yYw+T0aECjPtj3uIppW4husTbJw=; b=B7RPgdoJusoQ5E
	E9gFGqXpvIYT7gzaLhu3q7PW2YOI06yiU3BGZaBdWnEd8iZqoKtiZLEtsvVeTRF+Wv/dagsghNFf7
	7DE3siwZAHCJz6PL0vLinoKgQ3KTrRlDxaoVp3KNufJsS7x1JtbOqw/f3rIKA4fUkaJTx236Fm45t
	hqgNWs/RwXOlU7lzWO+zWS/CFsooo+nTSmt5x2su9Qi1o9oC7tHmVmsG08OSEjEtO9nxThESDtYGl
	nVD6sCxe+rW7I6AJpWhlZnE0DxYeIHpeovoQO2DoBKM2YFODktvihZodwU2e5InnEwgTWz7TYVCv9
	wZzTXh1iC6JUQbHhzhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkTg-00EEWp-1k;
	Mon, 25 Sep 2023 12:14:16 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkTe-00EEWP-02
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 12:14:15 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-533c92e65c9so3854146a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695644052; x=1696248852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9V+Qa8bSSpY2t7qXgNeiVCLu22urxxWjX21Aa7SLwyQ=;
        b=abuH6Y3nA0kxIX1X03PYhURtNBoTQ+8RsgR62s4pztHVq2pRmxk2iXuS+OOKVvvFx7
         Kb1AuUfBZGoml3YvEbQ/3UzGIcUb6cfaNk2gdumYL/+bG+DTQS1ubajveC7pBOXd9Tpa
         zJqB0stUrzCECjdei3XpN2Eqt91KlRz7LuywI8WwRm0gZNGoWop6pKfWGd1mAlTvP6b+
         teC4BvSXadXpO/MmRlBPJAswKN7lhXqC86d4FG7J1ZUNBhyQ8kPmhpex0Eb4T5VRFQ50
         yVhgIizNc9OBOC1GUamrNmYGSJTjBk+2oanZtcp3YF4KyDZ8VRI4MCCcIa7UHiLLM+OH
         6ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695644052; x=1696248852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9V+Qa8bSSpY2t7qXgNeiVCLu22urxxWjX21Aa7SLwyQ=;
        b=RsiUsDtrQlNaG2gHavZKVdBAJnBvdbZ+hG2oxhNBRI4IRtNO1bDIhwoS3kJX+SCN2Z
         qnNgX5kSWHO15r09yMzTEJe8p3hSD8LFe3mB+haxmPNtiCxS8UurbN9KmcLSmztREfBG
         G4DBzInn0rTaMhpKf9omMpCItTNLQmX9AHKSIStpOjBJnvrT0bI+JltI0n91nUk1g/q9
         RqJciF7rqwRRjLsgpcMRhJBj8dfN53EPoMoV1ZF1nexdwuNH75I2zj4Q8ZRhFxM2p+Sw
         vUlHoWWbx+fdI6Fw0k0w2zxeupX8azP+Axoo/mt1t6l81eUgp3g6ROcsBEXfqRq4q6wu
         mOxg==
X-Gm-Message-State: AOJu0Yw+SRkM85BbRbkp7/Z6DOKVurYLRRmIfmOQUw0suoMvzFRrNc5v
	TpZHNK4a6qgRd749qfBR6Gj3Mg==
X-Google-Smtp-Source: AGHT+IEcVeOC2YLfaizwAdoPdJl5l/2r6p/zvypeRroCC2gpIxEU1TcieMGiP5jDdgD6Ze5UIzjlvg==
X-Received: by 2002:a05:6402:619:b0:533:49d2:dc8f with SMTP id n25-20020a056402061900b0053349d2dc8fmr4602089edv.17.1695644052631;
        Mon, 25 Sep 2023 05:14:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m26-20020a056402051a00b00532d2b5126bsm5383431edv.94.2023.09.25.05.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:14:12 -0700 (PDT)
Date: Mon, 25 Sep 2023 14:14:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, apatel@ventanamicro.com
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20230925-07cab17b5699d01946294558@orel>
References: <20230921125518.175428-10-ajones@ventanamicro.com>
 <mhng-6cbe4501-1a87-4ec4-9f80-bcfe256ac1ba@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-6cbe4501-1a87-4ec4-9f80-bcfe256ac1ba@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_051414_052281_40F5C34A 
X-CRM114-Status: GOOD (  46.87  )
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

On Mon, Sep 25, 2023 at 04:23:32AM -0700, Palmer Dabbelt wrote:
> On Thu, 21 Sep 2023 05:55:22 PDT (-0700), ajones@ventanamicro.com wrote:
> > Introduce the first flag for the hwprobe syscall. The flag basically
> > reverses its behavior, i.e. instead of populating the values of keys
> > for a given set of cpus, the set of cpus after the call is the result
> > of finding a set which supports the values of the keys. In order to
> > do this, we implement pair merge and pair compare functions which
> > take the type of value (a single value vs. a bitmap of booleans) into
> > consideration. The flow for the which-cpus syscall variant is as
> > follows:
> > 
> >   1. Merge pairs into a set of pairs with unique keys
> >   2. If any unknown keys are seen, return an empty set of cpus
> >   3. If the platform is homogeneous, then check all the pairs
> >      against the "all cpu" values and return early
> >   4. Otherwise, check all the pairs against each cpu individually
> 
> IIRC we talked about this in the patchwork call at some point, but IMO this
> feature makes sense and you weren't the first person to bring up having
> something like this.  So I think at a high level it's completely reasonable,
> some implementation comments follow.
> 
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  Documentation/riscv/hwprobe.rst       |  16 ++-
> >  arch/riscv/include/uapi/asm/hwprobe.h |   3 +
> >  arch/riscv/kernel/sys_riscv.c         | 148 +++++++++++++++++++++++++-
> >  3 files changed, 163 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> > index 132e9acaa8f4..97b1e97e7dd2 100644
> > --- a/Documentation/riscv/hwprobe.rst
> > +++ b/Documentation/riscv/hwprobe.rst
> > @@ -25,8 +25,20 @@ arch, impl), the returned value will only be valid if all CPUs in the given set
> >  have the same value. Otherwise -1 will be returned. For boolean-like keys, the
> >  value returned will be a logical AND of the values for the specified CPUs.
> >  Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
> > -all online CPUs. There are currently no flags, this value must be zero for
> > -future compatibility.
> > +all online CPUs. The currently supported flags are:
> > +
> > +* :c:macro:`RISCV_HWPROBE_WHICH_CPUS`: This flag basically reverses the behavior
> > +  of sys_riscv_hwprobe().  Instead of populating the values of keys for a given
> > +  set of CPUs, the set of CPUs is initially all unset and the values of each key
> > +  are given.  Upon return, the CPUs which all match each of the given key-value
> > +  pairs are set in ``cpus``.  How matching is done depends on the key type.  For
> 
> Kind of a meta-comment here, but we should add the key type to each key
> number in the docs.  I suppose maybe it should be obvious which is which
> from the meaning of the keys, but can't hurt to be explicit about it.

I'll add for v1.

> 
> > +  value-like keys, matching means to be the exact same as the value.  For
> > +  boolean-like keys, matching means the result of a logical AND of the pair's
> > +  value with the CPU's value is exactly the same as the pair's value.  ``cpus``
> > +  may also initially have set bits, in which case the bits of any CPUs which do
> > +  not match the pairs will be cleared, but no other bits will be set.
> > +
> > +All other flags are reserved for future compatibility and must be zero.
> > 
> >  On success 0 is returned, on failure a negative error code is returned.
> > 
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > index 86d08a0e617b..36683307c3e4 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -40,4 +40,7 @@ struct riscv_hwprobe {
> >  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> > 
> > +/* Flags */
> > +#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
> > +
> >  #endif
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index 14b6dfaa5d9f..c70a72fe6aee 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -245,14 +245,145 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >  	}
> >  }
> > 
> > +static bool hwprobe_key_is_map(__s64 key)
> > +{
> > +	switch (key) {
> > +	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> > +	case RISCV_HWPROBE_KEY_IMA_EXT_0:
> > +	case RISCV_HWPROBE_KEY_CPUPERF_0:
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static int hwprobe_pair_merge(struct riscv_hwprobe *to,
> > +			      struct riscv_hwprobe *from)
> > +{
> > +	if (to->key != from->key)
> > +		return -EINVAL;
> > +
> > +	if (hwprobe_key_is_map(to->key)) {
> > +		to->value |= from->value;
> > +		return 0;
> > +	}
> > +
> > +	return to->value == from->value ? 0 : -EINVAL;
> > +}
> > +
> > +static bool hwprobe_pair_cmp(struct riscv_hwprobe *pair,
> > +			     struct riscv_hwprobe *other_pair)
> > +{
> > +	if (pair->key != other_pair->key)
> > +		return false;
> > +
> > +	if (hwprobe_key_is_map(pair->key))
> > +		return (pair->value & other_pair->value) == other_pair->value;
> > +
> > +	return pair->value == other_pair->value;
> > +}
> > +
> > +static int hwprobe_which_cpus(struct riscv_hwprobe __user *pairs_user,
> > +			      size_t pair_count, size_t cpusetsize,
> > +			      cpumask_t *cpus)
> > +{
> > +	struct riscv_hwprobe pairs[RISCV_HWPROBE_MAX_KEY + 1] = {
> > +		[0 ... RISCV_HWPROBE_MAX_KEY] = (struct riscv_hwprobe){ .key = -1 }
> > +	};
> > +	struct riscv_hwprobe pair;
> > +	struct vdso_data *vd = __arch_get_k_vdso_data();
> > +	struct arch_vdso_data *avd = &vd->arch_data;
> > +	bool clear_all = false;
> > +	cpumask_t one_cpu;
> > +	int cpu, ret;
> > +	size_t i;
> > +
> > +	for (i = 0; i < pair_count; i++) {
> > +		ret = copy_from_user(&pair, &pairs_user[i], sizeof(pair));
> > +		if (ret)
> > +			return -EFAULT;
> > +
> > +		if (pair.key >= 0 && pair.key <= RISCV_HWPROBE_MAX_KEY) {
> > +			if (pairs[pair.key].key == -1) {
> > +				pairs[pair.key] = pair;
> > +			} else {
> > +				ret = hwprobe_pair_merge(&pairs[pair.key], &pair);
> > +				if (ret)
> > +					return ret;
> > +			}
> > +		} else {
> > +			pair.key = -1;
> > +			pair.value = 0;
> > +			ret = copy_to_user(&pairs_user[i], &pair, sizeof(pair));
> > +			if (ret)
> > +				return -EFAULT;
> > +			clear_all = true;
> > +		}
> > +	}
> > +
> > +	if (clear_all) {
> > +		cpumask_clear(cpus);
> > +		return 0;
> > +	}
> > +
> > +	if (avd->homogeneous_cpus) {
> > +		for (i = 0; i <= RISCV_HWPROBE_MAX_KEY; i++) {
> > +			if (pairs[i].key == -1)
> > +				continue;
> > +
> > +			pair.key = pairs[i].key;
> > +			pair.value = avd->all_cpu_hwprobe_values[pairs[i].key];
> > +
> > +			if (!hwprobe_pair_cmp(&pair, &pairs[i])) {
> > +				cpumask_clear(cpus);
> > +				return 0;
> > +			}
> > +		}
> > +
> > +		return 0;
> > +	}
> > +
> > +	cpumask_clear(&one_cpu);
> > +
> > +	for_each_cpu(cpu, cpus) {
> > +		cpumask_set_cpu(cpu, &one_cpu);
> > +
> > +		for (i = 0; i <= RISCV_HWPROBE_MAX_KEY; i++) {
> > +			if (pairs[i].key == -1)
> > +				continue;
> > +
> > +			pair.key = pairs[i].key;
> > +			pair.value = 0;
> > +			hwprobe_one_pair(&pair, &one_cpu);
> > +
> > +			if (!hwprobe_pair_cmp(&pair, &pairs[i])) {
> > +				cpumask_clear_cpu(cpu, cpus);
> > +				break;
> > +			}
> > +		}
> > +
> > +		cpumask_clear_cpu(cpu, &one_cpu);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> >  			    size_t pair_count, size_t cpusetsize,
> >  			    unsigned long __user *cpus_user,
> >  			    unsigned int flags)
> >  {
> > +	bool which_cpus = false;
> > +	cpumask_t cpus;
> >  	size_t out;
> >  	int ret;
> > -	cpumask_t cpus;
> > +
> > +	if (flags & RISCV_HWPROBE_WHICH_CPUS) {
> > +		if (!cpusetsize || !cpus_user)
> > +			return -EINVAL;
> > +		flags &= ~RISCV_HWPROBE_WHICH_CPUS;
> > +		which_cpus = true;
> > +	}
> > 
> >  	/* Check the reserved flags. */
> >  	if (flags != 0)
> > @@ -274,11 +405,24 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> >  		if (ret)
> >  			return -EFAULT;
> > 
> > +		cpumask_and(&cpus, &cpus, cpu_online_mask);
> > +
> > +		if (which_cpus) {
> > +			if (cpumask_empty(&cpus))
> > +				cpumask_copy(&cpus, cpu_online_mask);
> > +			ret = hwprobe_which_cpus(pairs, pair_count, cpusetsize, &cpus);
> > +			if (ret)
> > +				return ret;
> > +			ret = copy_to_user(cpus_user, &cpus, cpusetsize);
> > +			if (ret)
> > +				return -EFAULT;
> > +			return 0;
> > +		}
> > +
> >  		/*
> >  		 * Userspace must provide at least one online CPU, without that
> >  		 * there's no way to define what is supported.
> >  		 */
> > -		cpumask_and(&cpus, &cpus, cpu_online_mask);
> >  		if (cpumask_empty(&cpus))
> >  			return -EINVAL;
> >  	}

I think the rest of the comments ended up in a separate mail. Hopefully
none got lost.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
