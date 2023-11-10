Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82852C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29YExunbKNnmihdCFmPseWaSuvK3/w7Zcb0nPLkTQqI=; b=2qfXZY3liUxceL
	K9SthSG4K5Ooy6Q3Obs0VaDqBQtNJfHQ8QvSRfS63CMmKXRLTsc4trQANdY5b8KBUytO2NCK9WKoY
	pbxmhDtlVwoHTV96tF8hS/Bdr5v8EJ+UHvjbavnp7Ula4k0rf3GirNxtUvvHlz3L0BbUt+QQjdVZk
	/nejEbi6mSDcjno+xqAUiyE7039NkA5FlKzseoZ8mBYhqBOedgdZsujn29EIndu2F62+wZrynIBE1
	BoT73dou3qt2a27Zp3vv88IoBU5tHWMilhonkEt9scvZ8X0gQhbYtzpy7gnC3MQMl82FFBFmzvEVw
	xa899hHIkDG0GZxJ72Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Mv0-0085yE-1j;
	Fri, 10 Nov 2023 08:31:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Muu-0085wg-2e;
	Fri, 10 Nov 2023 08:31:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73B9B106F;
	Fri, 10 Nov 2023 00:31:43 -0800 (PST)
Received: from [192.168.1.25] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 221603F6C4;
	Fri, 10 Nov 2023 00:30:51 -0800 (PST)
Message-ID: <00ce01bf-1612-46cd-926d-ac283cfddff9@arm.com>
Date: Fri, 10 Nov 2023 09:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] consolidate and cleanup CPU capacity
To: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
 lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
 ionela.voinescu@arm.com, beata.michalska@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-acpi@vger.kernel.org
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 ajones@ventanamicro.com, lftan@kernel.org
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20231109101438.1139696-1-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_003104_976951_DBBAA5F7 
X-CRM114-Status: GOOD (  25.40  )
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

For a CPPC platform + EM/EAS (but without AMU):
Tested-by: Pierre Gondois <pierre.gondois@arm.com>

On 11/9/23 11:14, Vincent Guittot wrote:
> This is the 1st part of consolidating how the max compute capacity is
> used in the scheduler and how we calculate the frequency for a level of
> utilization.
> 
> Fix some unconsistancy when computing frequency for an utilization. There
> can be a mismatch between energy model and schedutil.
> 
> Next step will be to make a difference between the original
> max compute capacity of a CPU and what is currently available when
> there is a capping applying forever (i.e. seconds or more).
> 
> Changes since v5:
> - remove useless return in freq_inv_set_max_ratio()
> - Add tags
> 
> Changes since v4:
> - Capitalize the verb in subject
> - Remove usless parentheses in cppc_get_dmi_max_khz()
> - Use freq_ref pattern everywhere
> - Fix MHz / kHz units conversion for cppc_cpufreq
> - Move default definition of arch_scale_freq_ref() in
>    include/linux/sched/topology.h beside arch_scale_cpu_capacity
>    which faces similar default declaration behavior. This location covers
>    all cases with arch and CONFIG_* which was not the case with previous
>    attempts.
> 
> Changes since v3:
> - Split patch 5 cpufreq/cppc
> - Fix topology_init_cpu_capacity_cppc()
> - Fix init if AMU ratio
> - Added some tags
> 
> Changes since v2:
> - Remove the 1st patch which has been queued in tip
> - Rework how to initialize the reference frequency for cppc_cpufreq and
>    change topology_init_cpu_capacity_cppc() to also set capacity_ref_freq
> - Add a RFC to convert AMU to use arch_scale_freq_ref and move the config
>    of the AMU ratio to be done when intializing cpu capacity and
>    capacity_ref_freq
> - Added some tags
> 
> Changes since v1:
> - Fix typos
> - Added changes in cpufreq to use arch_scale_freq_ref() when calling
>    arch_set_freq_scale (patch 3).
> - arch_scale_freq_ref() is always defined and returns 0 (as proposed
>    by Ionela) when not defined by the arch. This simplifies the code with
>    the addition of patch 3.
> - Simplify Energy Model which always uses arch_scale_freq_ref(). The
>    latter returns 0 when not defined by arch instead of last item of the
>    perf domain. This is not a problem because the function is only defined
>    for compilation purpose in this case and we don't care about the
>    returned value. (patch 5)
> - Added changes in cppc cpufreq to set capacity_ref_freq (patch 6)
> - Added reviewed tag for patch 1 which got a minor change but not for
>    others as I did some changes which could make previous reviewed tag
>    no more relevant.
> 
> Vincent Guittot (7):
>    topology: Add a new arch_scale_freq_reference
>    cpufreq: Use the fixed and coherent frequency for scaling capacity
>    cpufreq/schedutil: Use a fixed reference frequency
>    energy_model: Use a fixed reference frequency
>    cpufreq/cppc: Move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}
>    cpufreq/cppc: Set the frequency used for computing the capacity
>    arm64/amu: Use capacity_ref_freq to set AMU ratio
> 
>   arch/arm/include/asm/topology.h   |   1 +
>   arch/arm64/include/asm/topology.h |   1 +
>   arch/arm64/kernel/topology.c      |  26 +++---
>   arch/riscv/include/asm/topology.h |   1 +
>   drivers/acpi/cppc_acpi.c          | 104 ++++++++++++++++++++++
>   drivers/base/arch_topology.c      |  56 ++++++++----
>   drivers/cpufreq/cppc_cpufreq.c    | 139 ++++--------------------------
>   drivers/cpufreq/cpufreq.c         |   4 +-
>   include/acpi/cppc_acpi.h          |   2 +
>   include/linux/arch_topology.h     |   8 ++
>   include/linux/cpufreq.h           |   1 +
>   include/linux/energy_model.h      |   6 +-
>   include/linux/sched/topology.h    |   8 ++
>   kernel/sched/cpufreq_schedutil.c  |  26 +++++-
>   14 files changed, 224 insertions(+), 159 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
