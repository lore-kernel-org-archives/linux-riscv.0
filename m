Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FD5C83F2C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCWD06gxq2KYzTIJV1GqqUJTuX2pjZp/fERVom8mCsU=; b=pCEpgjGxNIGwHw
	1NL9I6VtjXa1trq63dPZoHzErqtjcxVeVRGwqx3jUGyEZ+jbbhgO/e46vTXJr7EqEbbi0Jb4tO2H+
	2TNAYAv6HCxtBDs+D0pvHrrjKIGhv9n/b1quUeM3KHZfsp6eqi00HMHlmrRjpq5FqSapei5MfswjH
	nR5IgNmpbtaufJqMnwSsViO2+gtihWjDm2fCBBb1UVoOaOx3qxOu+2toFK7MrrWvtrbb4tjswWjEL
	slsJyvvPeWYa9Q6qloi9LSG1Utup57seWm2R3Efsdb3UvdyPVruXYuQBc5ZJ92m6qKRYpaeoOinoj
	qn7TMC2KDOqtIcilem/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUB4-005too-2P;
	Tue, 05 Sep 2023 11:25:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUB2-005toG-2G;
	Tue, 05 Sep 2023 11:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jPdY00euY8J+TZ+gfMJOomJioLJ2A7fsibzKqzqSliw=; b=S8qjyM1AKzFNJQWjk8hguQd6AR
	9Sc6ZcYYLGctPBhpFl6oyPYCVXcm5P3A5PQoVecUlntjO+Vjm3ZVB0KCkIhnvW1ZU9PRlppQUNJ/3
	fxAxBaRKBEW7YVIC7xCW1AHK5krY06krL1X58jJnpPLS0KhzTJUHmLPWXAKDY3flMkNZ4UhurEspC
	uSFBmJj4bCiA6sePSK291Nn7S/hvMxiSJW7ohZPyfKC4tXQXrMyV9j0cU4zYHvR58njDSkbN3eLpD
	F7UN27WEZ6HZjWpIXKc1Ust8Ov9ua6K9NDyJHjByBK2iyQn0n9sPTJp9qGcdQ+RTTf3ngPWu/2m29
	sGFFfK5Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qdUAy-0097Sa-2K; Tue, 05 Sep 2023 11:24:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B53A3300687; Tue,  5 Sep 2023 13:24:55 +0200 (CEST)
Date: Tue, 5 Sep 2023 13:24:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH 3/4] cpufreq/schedutil: use a fixed reference frequency
Message-ID: <20230905112455.GD28319@noisy.programming.kicks-ass.net>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-4-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901130312.247719-4-vincent.guittot@linaro.org>
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

On Fri, Sep 01, 2023 at 03:03:11PM +0200, Vincent Guittot wrote:

> +#ifdef arch_scale_freq_ref
> +/**
> + * arch_scale_freq_ref_policy - get the reference frequency of a given CPU that
> + * has been used to correlate frequency and compute capacity.
> + * @cpu: the CPU in question.
> + *
> + * Return: the reference CPU frequency.
> + */
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
> +{
> +	return arch_scale_freq_ref(policy->cpu);
> +}
> +#else
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)

double space    ^^

> +{
> +	if (arch_scale_freq_invariant())
> +		return policy->cpuinfo.max_freq;
> +
> +

superfluous whitespace there.

> +	return policy->cur;
> +}
> +#endif

static __always_inline
unsigned long arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
{
#ifdef arch_scale_freq_ref
	return arch_scale_freq_ref(policy->cpu);
#endif

	if (arch_scale_freq_invariant())
		return policy->cpuinfo.max_freq;

	return policy->cur;
}

Would have the lot in a single function and possibly easier to read?

> +
>  /**
>   * get_next_freq - Compute a new frequency for a given cpufreq policy.
>   * @sg_policy: schedutil policy object to compute the new frequency for.
> @@ -139,11 +164,11 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
>  static unsigned int get_next_freq(struct sugov_policy *sg_policy,
>  				  unsigned long util, unsigned long max)
>  {
> +	unsigned int freq;
>  	struct cpufreq_policy *policy = sg_policy->policy;
> -	unsigned int freq = arch_scale_freq_invariant() ?
> -				policy->cpuinfo.max_freq : policy->cur;

Leave the variable below per the inverse christmas thing.

>  
>  	util = map_util_perf(util);
> +	freq = arch_scale_freq_ref_policy(policy);
>  	freq = map_util_freq(util, freq, max);
>  
>  	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
