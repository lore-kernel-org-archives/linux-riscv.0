Return-Path: <SRS0=kGhb=SS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B58C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 19:04:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB80120663
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 19:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fq8Kv4ds";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mgPgRi+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB80120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o4WtS2de9c6aLwCf27siwyQvI1vcUZpkZt+EDFEMQBI=; b=fq8Kv4dsPy3c1jzI8GEfdbYdQ
	bq0H/h2nDB7TJO9gq4bsEZQEhnf3bkpjzXPqR+SLSksSHLP/HuTpXZHbShuI49g4CnPL2c1nxhmfL
	dvB8J/8ktmber1pOqfFeWiBMxRAuIIhHfbMuqqLj9T1ONOZ+qnKFjXIuP3ALwY33PyDsHfyGgcno+
	e12h6cTE3YYLVCRqJTY/WY3ln00VKkydlBJjwgPrV+mmiNUAnsP7lc3Itzof3x/Z0H+ZUmvk5i2KC
	aw88g+ue1xeBNA3CD+tH3kVOZ1Z+e1MZESCXDD5ZMY8dbUkO0WEsaQPtY11eoY3fXgEzFjsEGWchs
	7RJpGH1Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGTNH-0003lq-GL; Tue, 16 Apr 2019 19:04:07 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTNE-0003l1-5x
 for linux-riscv@lists.infradead.org; Tue, 16 Apr 2019 19:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555441454; x=1586977454;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IJ3fPP63TF8cH0dmKYkBRMkS0543JoINwkzRoG/vzjk=;
 b=mgPgRi+89bJtk76j9BITGMbkCRfRHI8vHRxGkgLzJlRx9KKbNh7f9abR
 tSW7UJPytY64ChnK2DIXMyE1EDj86ytIxWC9hdPsGS/vIbV32aciKu2zQ
 WvtHfp1tU6sewb/IiLALMhZN5rNs62nXF7SHrU8O/wLB0j2SRYRRh+tWE
 Vrcq1qqJB00RUIeJrN4ZE+FD7S2W+U+7N7rlK7eA2MX0XEQp7QGOkyQyh
 /lJ6gip7rmR0OLZi504E2hXGAgW8AzeFfSz7q/DnpXjDGRpMKcikzy6B2
 E3BS4hvM07NkL4aZz6J7rVRlTJeqkCej5Tcpv+rS68FRjsGmC5RDlc6N/ A==;
X-IronPort-AV: E=Sophos;i="5.60,358,1549900800"; d="scan'208";a="205146510"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2019 03:04:10 +0800
IronPort-SDR: ComClDhb+unUfJSJ4X+vHxY015fVVTekZxhzbk9TBEKzoQyHcHYf19OpGgJ+C+7KyFrR6If3AE
 1elWFy4cGOlhx+p9KTSi4RYvfO0Z9wDrVBk2Gfe3Z0M2A3yfbe+ux+IEgmjxlR8rGYOUuW5ts5
 JGtykkbo2ZxTMLs8TDn6y/xAzsSzL6RR1q3+5uOkR4dPwl0YpZVYSnpPtWlR2D6VvkSldNaBo8
 R/E+wQNQSpQo2af1NSSCN/8GSnejjKlrRrrfmjQgKXfF9a7iucxQ73ZqDXA6po+Vlyy2Msyqh+
 6JE81dhSvXKBK89yIQUOb5f3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 16 Apr 2019 11:42:54 -0700
IronPort-SDR: JukLHjcF6xpXlpQepaUzkReDiLDKBO89GrQWwPeRqwPEHreAM8IQNA3uFwcPFVID2ZWZHv1wJF
 +INahz0cT1xzzapPXOwZFf7LisM7AeDoori+lHd1MvpuOHm6StC7l0TDbYYE4eaK4rvJkoVKy6
 egDGHjV57+66zWbSAjxOvuBVbECvSczLrmq+cEO1Zs3zU9ivyTGTo//tCbkVaoYAxybveM2aMn
 DnvobdoSRrXgfH24jgZF/m7zNyGzm7rAqRhl/kuxCJS+rK11PFMRRrfn5lpg/+a+hiITg36RtD
 bHQ=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Apr 2019 12:04:00 -0700
Subject: Re: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
To: Sudeep Holla <sudeep.holla@arm.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-5-atish.patra@wdc.com>
 <20190415153147.GB28623@e107155-lin>
 <41f890e9-3893-9092-bac7-3daca99f181b@wdc.com>
 <20190416130916.GA24669@e107155-lin>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7118dc22-ddd6-d224-733c-fbe160bab28f@wdc.com>
Date: Tue, 16 Apr 2019 12:04:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416130916.GA24669@e107155-lin>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_120404_259239_77125741 
X-CRM114-Status: GOOD (  26.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Otto Sabart <ottosabart@seberm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/16/19 6:09 AM, Sudeep Holla wrote:
> On Mon, Apr 15, 2019 at 02:16:43PM -0700, Atish Patra wrote:
>> On 4/15/19 8:31 AM, Sudeep Holla wrote:
>>> On Wed, Mar 20, 2019 at 04:48:05PM -0700, Atish Patra wrote:
>>>> Currently, ARM32 and ARM64 uses different data structures to
>>>> represent their cpu toplogies. Since, we are moving the ARM64
>>>> topology to common code to be used by other architectures, we
>>>> can reuse that for ARM32 as well.
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> ---
>>>>    arch/arm/include/asm/topology.h | 22 +---------------------
>>>>    arch/arm/kernel/topology.c      | 10 +++++-----
>>>>    include/linux/arch_topology.h   | 10 +++++++++-
>>>>    3 files changed, 15 insertions(+), 27 deletions(-)
>>>>
>>>
>>> [...]
>>>
>>>> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
>>>> index d4e76e0a..7c850611 100644
>>>> --- a/include/linux/arch_topology.h
>>>> +++ b/include/linux/arch_topology.h
>>>> @@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
>>>>    struct cpu_topology {
>>>>    	int thread_id;
>>>>    	int core_id;
>>>> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
>>>> +	int socket_id;
>>>
>>> Sorry, but I can't find any reason why we need to do this ifdef dance
>>> here, especially for socket_id vs package_id ?
>>
>> I was not sure if we can rename socket_id to package_id from a semantic
>> point of view. If you are okay with it, I will change it to package_id and
>> send a v4.
>>
> 
> Thanks, all make sure to cc linux-arm-kernel@lists.infradead.org,
> just noticed that's missing and you are asking for testing on ARM
> platforms :)
> 

My bad!! I didn't realize that linux-arm-kernel is not included. Thanks 
for pointing that out.

>> Other's I can understand
>>> as there are new, but I am sure we can find a way and get away with
>>> #ifdefery here completely.
>>>
>> That would be good. Any suggestions on how to do that?
>>
> 
> Do you see any issues having extra structure members for ARM ?
> Something like below seem to compile + boot fine on my 32-bit TC2 with
> proper topology info on top of your series. Of course, more testing is
> better, but I don't see any issue keeping llc_{id,sibling} around for
> ARM eliminating the need for #ifdefs
> 

I thought adding unused members for ARM32 might be unacceptable :).
I will update my v4 with this.

Regards,
Atish
> Let me know if I am missing something.
> 
> -->8
> 
> diff --git i/arch/arm/kernel/topology.c w/arch/arm/kernel/topology.c
> index 0ddb24c76c17..f2aa942e0cfa 100644
> --- i/arch/arm/kernel/topology.c
> +++ w/arch/arm/kernel/topology.c
> @@ -206,7 +206,7 @@ void update_siblings_masks(unsigned int cpuid)
>   	for_each_possible_cpu(cpu) {
>   		cpu_topo = &cpu_topology[cpu];
>   
> -		if (cpuid_topo->socket_id != cpu_topo->socket_id)
> +		if (cpuid_topo->package_id != cpu_topo->package_id)
>   			continue;
>   
>   		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
> @@ -250,12 +250,12 @@ void store_cpu_topology(unsigned int cpuid)
>   			/* core performance interdependency */
>   			cpuid_topo->thread_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
>   			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> -			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 2);
> +			cpuid_topo->package_id = MPIDR_AFFINITY_LEVEL(mpidr, 2);
>   		} else {
>   			/* largely independent cores */
>   			cpuid_topo->thread_id = -1;
>   			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
> -			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> +			cpuid_topo->package_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
>   		}
>   	} else {
>   		/*
> @@ -265,7 +265,7 @@ void store_cpu_topology(unsigned int cpuid)
>   		 */
>   		cpuid_topo->thread_id = -1;
>   		cpuid_topo->core_id = 0;
> -		cpuid_topo->socket_id = -1;
> +		cpuid_topo->package_id = -1;
>   	}
>   
>   	update_siblings_masks(cpuid);
> @@ -275,7 +275,7 @@ void store_cpu_topology(unsigned int cpuid)
>   	pr_info("CPU%u: thread %d, cpu %d, socket %d, mpidr %x\n",
>   		cpuid, cpu_topology[cpuid].thread_id,
>   		cpu_topology[cpuid].core_id,
> -		cpu_topology[cpuid].socket_id, mpidr);
> +		cpu_topology[cpuid].package_id, mpidr);
>   }
>   
>   static inline int cpu_corepower_flags(void)
> @@ -306,7 +306,7 @@ void __init init_cpu_topology(void)
>   
>   		cpu_topo->thread_id = -1;
>   		cpu_topo->core_id =  -1;
> -		cpu_topo->socket_id = -1;
> +		cpu_topo->package_id = -1;
>   		cpumask_clear(&cpu_topo->core_sibling);
>   		cpumask_clear(&cpu_topo->thread_sibling);
>   	}
> diff --git i/include/linux/arch_topology.h w/include/linux/arch_topology.h
> index 7c850611986d..8e82389c2bed 100644
> --- i/include/linux/arch_topology.h
> +++ w/include/linux/arch_topology.h
> @@ -36,13 +36,9 @@ unsigned long topology_get_freq_scale(int cpu)
>   struct cpu_topology {
>   	int thread_id;
>   	int core_id;
> -#ifdef CONFIG_ARM_CPU_TOPOLOGY
> -	int socket_id;
> -#else
>   	int package_id;
>   	int llc_id;
>   	cpumask_t llc_sibling;
> -#endif
>   	cpumask_t thread_sibling;
>   	cpumask_t core_sibling;
>   };
> @@ -50,11 +46,7 @@ struct cpu_topology {
>   #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>   extern struct cpu_topology cpu_topology[NR_CPUS];
>   
> -#ifdef CONFIG_ARM_CPU_TOPOLOGY
> -#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
> -#else
>   #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
> -#endif
>   #define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
>   #define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
>   #define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
