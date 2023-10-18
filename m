Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED5FCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ogOL1NTml/Hq38ZnopeoBsbi+Na4WqNK6tAjorGPYg=; b=M8ttwhxtXn9TM9
	pHVeZtMFwCRtLuHKj4PYwO0CU9vqfH1n8W2Pe/sPdAGk2OK23g6gLpV0PA0L908mVzB9q1PyZj0tS
	NXLa0MZvoMCMd9/dYz8Rpw4C0j/IQBCbYw09g7eFhkCF7Hd5+qagC3QI0us7rRECrkvjZUwXBZoLj
	mIuJel1XbPBzBJo/h5udDKE0JnpftvBwjfwO01k2bz0ufECZ2zfW1KaXcgBzXhvbM1MTqCeoAqemC
	M/oFFixQcz6e35KWbOTAVTnxjDwSRF7fk6tk7LpouyjH20RRefPrwjeLKRbVbwHGiq0NMX1xIi5KH
	kX/1VMxqg2HBZoETjdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4N0-00EVVA-23;
	Wed, 18 Oct 2023 11:05:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4Mw-00EVU9-2N;
	Wed, 18 Oct 2023 11:05:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36F462F4;
	Wed, 18 Oct 2023 04:06:21 -0700 (PDT)
Received: from [10.57.81.189] (unknown [10.57.81.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA1F93F762;
	Wed, 18 Oct 2023 04:05:35 -0700 (PDT)
Message-ID: <db2ba48c-f1f4-41ca-99e6-4cb756a8ac00@arm.com>
Date: Wed, 18 Oct 2023 12:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] topology: add a new arch_scale_freq_reference
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: conor.dooley@microchip.com, will@kernel.org, ionela.voinescu@arm.com,
 vschneid@redhat.com, mgorman@suse.de, bsegall@google.com,
 dietmar.eggemann@arm.com, peterz@infradead.org, sudeep.holla@arm.com,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, pierre.gondois@arm.com,
 paul.walmsley@sifive.com, catalin.marinas@arm.com, linux@armlinux.org.uk,
 suagrfillet@gmail.com, ajones@ventanamicro.com, juri.lelli@redhat.com,
 lftan@kernel.org, mingo@redhat.com, rafael@kernel.org,
 gregkh@linuxfoundation.org, rostedt@goodmis.org, bristot@redhat.com,
 viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-3-vincent.guittot@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20231009103621.374412-3-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_040542_870209_A9284F76 
X-CRM114-Status: GOOD (  22.52  )
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



On 10/9/23 11:36, Vincent Guittot wrote:
> Create a new method to get a unique and fixed max frequency. Currently
> cpuinfo.max_freq or the highest (or last) state of performance domain are
> used as the max frequency when computing the frequency for a level of
> utilization but:
> - cpuinfo_max_freq can change at runtime. boost is one example of
>    such change.
> - cpuinfo.max_freq and last item of the PD can be different leading to
>    different results between cpufreq and energy model.
> 
> We need to save the reference frequency that has been used when computing
> the CPUs capacity and use this fixed and coherent value to convert between
> frequency and CPU's capacity.
> 
> In fact, we already save the frequency that has been used when computing
> the capacity of each CPU. We extend the precision to save khZ instead of
> Mhz currently and we modify the type to be aligned with other variables
> used when converting frequency to capacity and the other way.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   arch/arm/include/asm/topology.h   |  1 +
>   arch/arm64/include/asm/topology.h |  1 +
>   arch/riscv/include/asm/topology.h |  1 +
>   drivers/base/arch_topology.c      | 29 ++++++++++++++---------------
>   include/linux/arch_topology.h     |  7 +++++++
>   5 files changed, 24 insertions(+), 15 deletions(-)

[snip]

> @@ -170,9 +172,9 @@ DEFINE_PER_CPU(unsigned long, thermal_pressure);
>    * operating on stale data when hot-plug is used for some CPUs. The
>    * @capped_freq reflects the currently allowed max CPUs frequency due to
>    * thermal capping. It might be also a boost frequency value, which is bigger
> - * than the internal 'freq_factor' max frequency. In such case the pressure
> - * value should simply be removed, since this is an indication that there is
> - * no thermal throttling. The @capped_freq must be provided in kHz.
> + * than the internal 'capacity_ref_freq' max frequency. In such case the
> + * pressure value should simply be removed, since this is an indication that
> + * there is no thermal throttling. The @capped_freq must be provided in kHz.
>    */
>   void topology_update_thermal_pressure(const struct cpumask *cpus,
>   				      unsigned long capped_freq)
> @@ -183,10 +185,7 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
>   
>   	cpu = cpumask_first(cpus);
>   	max_capacity = arch_scale_cpu_capacity(cpu);
> -	max_freq = per_cpu(freq_factor, cpu);
> -
> -	/* Convert to MHz scale which is used in 'freq_factor' */
> -	capped_freq /= 1000;

I do like this small speed-up and I'm happy that it's possible with this
new design. (IIRC some of your platforms can update the thermal
pressure quite many time per sec - that might be the reason why
you see some speed-ups mentioned in the cover letter)

> +	max_freq = arch_scale_freq_ref(cpu);
>   


LGTM

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
