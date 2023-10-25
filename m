Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7ECC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYpRpLpEeTLONbRukQj6hcnBOQ+5na//gSvRFJEJ3PM=; b=IReZk/iLEtWRSS
	VP/Um4AypdryeuqQ5YfqC/FXia44FAJV7WVfyOmZgWYuBn+/RUMlVC/6soM8n8x3eVQj2vA5XvpJP
	3Glc4N9h3xybd008Dq6NyCOxr1KhjyaXxNRUb+l6lcdMdLA8sTITnbA7heHrU7HmnB8aScXlV/QFx
	HAWcoGME1B6kiU4XDcth9HOQ4jbpnWawG3rYJpATD9a/fXDqGuCQgKq0iZmvmjsbItv3KKqnU2/KR
	1AKOrpAZcYslggGENcQMiLyB16WJ4SQn3Fvrb5PE2auSMtXhKqCGHMO56VcetzlQx8UUTAHiwlm5F
	QvXVJ0Ge1WUeVDRoAQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcS6-00CErZ-1W;
	Wed, 25 Oct 2023 11:53:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcS4-00CErE-1O;
	Wed, 25 Oct 2023 11:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Iw+hAI2RZyKf3pkny9wI5k8uvYF1PKP6s1iFZu6PRHc=; b=X/M+QWAi63DcW2qYREzSvndZwt
	7X/GeKDC8gewFlEre7f8MPiHWzeV5zv0CdaZCAebgzUIbA8eplVsZ0IzgTNUe2Y2/CYgrCJKgvKfh
	yul1Lx8JtKZwmk0bzufa6faCwQJ6nZb8kg6kdcf4cx45FHJ5JcaA6V7bwMnd4Z1SSaGgRbwmT5mGc
	zZyhiIAv3k99+T1uE1JqCkX6I20Pga7G/rX+pIW76zuCiOPsEHyR7CnBK/cvRRCzvptNwSU1GXd6Q
	1qyuRg9+8ce32XB5Ht4ddRMmc+rvKQ7UkFGGMyp8cniRP6wklfpbEO7pD2cIsmwJf/tnACOgsauPi
	9KX6P0nQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcRw-00GJda-1u;
	Wed, 25 Oct 2023 11:53:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4192C30047C; Wed, 25 Oct 2023 13:53:24 +0200 (CEST)
Date: Wed, 25 Oct 2023 13:53:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
	lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v3 3/6] cpufreq/schedutil: use a fixed reference frequency
Message-ID: <20231025115324.GC31201@noisy.programming.kicks-ass.net>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-4-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018162540.667646-4-vincent.guittot@linaro.org>
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

On Wed, Oct 18, 2023 at 06:25:37PM +0200, Vincent Guittot wrote:

> +static __always_inline
> +unsigned long get_capacity_ref_freq(struct cpufreq_policy *policy)
> +{
> +	unsigned int freq = arch_scale_freq_ref(policy->cpu);
> +
> +	if (freq)
> +		return freq;
> +
> +	if (arch_scale_freq_invariant())
> +		return policy->cpuinfo.max_freq;
> +
> +	return policy->cur;
> +}

Hmm, what should x86 do here? I know it mostly doesn't use these things,
but would it make sense to stick the base frequency in ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
