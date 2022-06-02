Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159EFC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9AwltB8bQQmTnkRURFZd82pmjLkVDX3iR1NJI5w6wA=; b=LDrkqwFEJ/qmBz
	2wMFQE/TI1nsheZvGdhe9yQumz4aArRB6A1RD8v5QSRevGH3RCJhOK4JE/ypXHg9yn0s5GhW1xlkW
	4IHR5yWTPk16BAvAYidhWK7AJazLhJSZpf31KRBYmrbt5Z4AzrcF01sqa3MnJjkcuWnDLCIn3gjX9
	8DWsZeGdQUld1RcWleoRyXjBZWuZTlf+5PKWYD3sEHzK6PwTAF9QorQETy8WYJ155Hp9hw91Q9vTy
	s7wkcD5cQcfFy6vh5o3v0nvSy1h4e6/Wns0FXewZuQkVKetcClbvJdCAVZw91uetQk+Y8Zrang/h6
	nndikukGjSsn1hyREH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlmR-003YYr-18; Thu, 02 Jun 2022 14:26:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlmE-003YV3-QH; Thu, 02 Jun 2022 14:26:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 969671063;
	Thu,  2 Jun 2022 07:26:12 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 196383F66F;
	Thu,  2 Jun 2022 07:26:10 -0700 (PDT)
Message-ID: <0bf199a0-251d-323c-974a-bfd4e26f4cce@arm.com>
Date: Thu, 2 Jun 2022 16:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 07/16] arch_topology: Use the last level cache
 information from the cacheinfo
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <20220525081416.3306043-4-sudeep.holla@arm.com>
 <20220525081416.3306043-5-sudeep.holla@arm.com>
 <20220525081416.3306043-6-sudeep.holla@arm.com>
 <20220525081416.3306043-7-sudeep.holla@arm.com>
 <20220525081416.3306043-8-sudeep.holla@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20220525081416.3306043-8-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_072618_995270_646BE8F2 
X-CRM114-Status: GOOD (  19.50  )
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

On 25/05/2022 10:14, Sudeep Holla wrote:
> The cacheinfo is now initialised early along with the CPU topology
> initialisation. Instead of relying on the LLC ID information parsed
> separately only with ACPI PPTT elsewhere, migrate to use the similar
> information from the cacheinfo.
> 
> This is generic for both DT and ACPI systems. The ACPI LLC ID information
> parsed separately can now be removed from arch specific code.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 765723448b10..4c486e4e6f2f 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -663,7 +663,8 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
>  		/* not numa in package, lets use the package siblings */
>  		core_mask = &cpu_topology[cpu].core_sibling;
>  	}
> -	if (cpu_topology[cpu].llc_id != -1) {
> +
> +	if (last_level_cache_is_valid(cpu)) {
>  		if (cpumask_subset(&cpu_topology[cpu].llc_sibling, core_mask))
>  			core_mask = &cpu_topology[cpu].llc_sibling;
>  	}
> @@ -694,7 +695,7 @@ void update_siblings_masks(unsigned int cpuid)
>  	for_each_online_cpu(cpu) {
>  		cpu_topo = &cpu_topology[cpu];
>  
> -		if (cpu_topo->llc_id != -1 && cpuid_topo->llc_id == cpu_topo->llc_id) {
> +		if (last_level_cache_is_shared(cpu, cpuid)) {
>  			cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
>  			cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
>  		}

I tested v3 on a Kunpeng920 (w/o CONFIG_NUMA) and it looks
like that last_level_cache_is_shared() isn't working as
expected.

I instrumented cpu_coregroup_mask() like:

const struct cpumask *cpu_coregroup_mask(int cpu)
{
        const cpumask_t *core_mask = cpumask_of_node(cpu_to_node(cpu));

        if (cpumask_subset(&cpu_topology[cpu].core_sibling, core_mask)) {
                core_mask = &cpu_topology[cpu].core_sibling;
                (1)
        }

	(2)

        if (last_level_cache_is_valid(cpu)) {
                if (cpumask_subset(&cpu_topology[cpu].llc_sibling, core_mask))
                        core_mask = &cpu_topology[cpu].llc_sibling;
                        (3)
        }

        if (IS_ENABLED(CONFIG_SCHED_CLUSTER) &&
            cpumask_subset(core_mask, &cpu_topology[cpu].cluster_sibling))
                core_mask = &cpu_topology[cpu].cluster_sibling;
                (4)

        (5)
        return core_mask;
}

and got:

(A) v3 patch-set:

[   11.561133] (1) cpu_coregroup_mask[0]=0-47
[   11.565670] (2) last_level_cache_is_valid(0)=1
[   11.570587] (3) cpu_coregroup_mask[0]=0    <-- llc_sibling=0 (should be 0-23)
[   11.574833] (4) cpu_coregroup_mask[0]=0-3  <-- Altra hack kicks in!
[   11.579275] (5) cpu_coregroup_mask[0]=0-3

# cat /sys/kernel/debug/sched/domains/cpu0/domain*/name
CLS
DIE

# cat /proc/schedstat | awk '{print $1 " " $2 }' | grep ^[cd] | head -3
cpu0 0
domain0 00000000,00000000,0000000f
domain1 ffffffff,ffffffff,ffffffff

So the MC domain is missing.

(B) mainline as reference (cpu_coregroup_mask() slightly different):

[   11.585008] (1) cpu_coregroup_mask[0]=0-47
[   11.589544] (3) cpu_coregroup_mask[0]=0-23 <-- !!!
[   11.594079] (5) cpu_coregroup_mask[0]=0-23

# cat /sys/kernel/debug/sched/domains/cpu0/domain*/name
CLS
MC                                            <-- !!!
DIE

# cat /proc/schedstat | awk '{print $1 " " $2 }' | grep ^[cd] | head -4
cpu0 0
domain0 00000000,00000000,0000000f
domain1 00000000,00000000,00ffffff            <-- !!!
domain2 ffffffff,ffffffff,ffffffff

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
