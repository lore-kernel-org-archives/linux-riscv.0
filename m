Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB03C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YSpasOw653fGiZ67ASW4l0q9JP1gA4+j0jbSSANIiE=; b=qyzs7Sxep036un
	rZOK/ETlZ7C0KCcJlUbIV4m5qkF32gp+5I6xDvfeuvQgHKkBbCZuvw5iAaSIT5Tex0cWIyQYNdgbG
	tLUvf6jKKd6almgkQjD/9F1zGKMOxYF8uGwDk9KhlouLF9TMJeauHznffcT0jLaLxFubzTbSj9j3p
	9Ga4dFrO0hm+2mBfiDQJmzeRVSGJc7pCVHxD45vQM6l4DCZQVqQYVSRf8R39F9lNm3AXUYRu0y0bq
	VJoXNOEu1dEVmRH7K1jAIyHFiMVJJiXQMFf2mxIRQL6/pCAD5cmJGk1UoDo67vIMeBtnLlWm67Gux
	cC+eAkG8F/xwBNKbMtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9S8-000Z0t-SO; Mon, 06 Jun 2022 09:55:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9Rx-000Yxs-Q2; Mon, 06 Jun 2022 09:55:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D501F1596;
	Mon,  6 Jun 2022 02:55:03 -0700 (PDT)
Received: from bogus (unknown [10.57.9.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B21D3F66F;
	Mon,  6 Jun 2022 02:55:02 -0700 (PDT)
Date: Mon, 6 Jun 2022 10:54:15 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Morten Rasmussen <morten.rasmussen@arm.com>,
	Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 07/16] arch_topology: Use the last level cache
 information from the cacheinfo
Message-ID: <20220606095415.n26cugm2bo7d3rud@bogus>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <20220525081416.3306043-4-sudeep.holla@arm.com>
 <20220525081416.3306043-5-sudeep.holla@arm.com>
 <20220525081416.3306043-6-sudeep.holla@arm.com>
 <20220525081416.3306043-7-sudeep.holla@arm.com>
 <20220525081416.3306043-8-sudeep.holla@arm.com>
 <0bf199a0-251d-323c-974a-bfd4e26f4cce@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0bf199a0-251d-323c-974a-bfd4e26f4cce@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_025505_931935_6E747F13 
X-CRM114-Status: GOOD (  22.81  )
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

On Thu, Jun 02, 2022 at 04:26:00PM +0200, Dietmar Eggemann wrote:
> On 25/05/2022 10:14, Sudeep Holla wrote:
> > The cacheinfo is now initialised early along with the CPU topology
> > initialisation. Instead of relying on the LLC ID information parsed
> > separately only with ACPI PPTT elsewhere, migrate to use the similar
> > information from the cacheinfo.
> > 
> > This is generic for both DT and ACPI systems. The ACPI LLC ID information
> > parsed separately can now be removed from arch specific code.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/base/arch_topology.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index 765723448b10..4c486e4e6f2f 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -663,7 +663,8 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
> >  		/* not numa in package, lets use the package siblings */
> >  		core_mask = &cpu_topology[cpu].core_sibling;
> >  	}
> > -	if (cpu_topology[cpu].llc_id != -1) {
> > +
> > +	if (last_level_cache_is_valid(cpu)) {
> >  		if (cpumask_subset(&cpu_topology[cpu].llc_sibling, core_mask))
> >  			core_mask = &cpu_topology[cpu].llc_sibling;
> >  	}
> > @@ -694,7 +695,7 @@ void update_siblings_masks(unsigned int cpuid)
> >  	for_each_online_cpu(cpu) {
> >  		cpu_topo = &cpu_topology[cpu];
> >  
> > -		if (cpu_topo->llc_id != -1 && cpuid_topo->llc_id == cpu_topo->llc_id) {
> > +		if (last_level_cache_is_shared(cpu, cpuid)) {
> >  			cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
> >  			cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
> >  		}
> 
> I tested v3 on a Kunpeng920 (w/o CONFIG_NUMA) and it looks
> like that last_level_cache_is_shared() isn't working as
> expected.
>

Thanks a lot for detailed instrumentation, I am unable to identify why it is
not working though. I will take a deeper look later.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
