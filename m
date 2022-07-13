Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C487EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfxIFEYPy78KCLuCgYQIQZWdMWTNjDa5rG7SBOtHApk=; b=cMyiIzROl3+nrt
	Roa5nGTw0O23qOlukHUirylwbDfe+hSvnwTWuSnNFLFc4C+PglA+tt8U/CM4umP0nmhq2moXKr9+6
	QiTCsBR9K/vTYYX3/XfFDGfVyzn4v01OoCxy3GzR8J23fcdz0pO6e6HTonRxKDkvA0+FIu8tjgKvw
	KO+cdTgFKcg4tDqwkicov9BDWeG9th8n/cZyckQURm9MEqvqfymyFVI5yQvhNMBBBy/G0UVnbquAQ
	JUXcQPo7syvGDeeCsR5w1xgm8siL1z7IPBVYYDzxnyIySl0jX89rnQjPAE3mHj0SDzUX3tGirgxa/
	Yvbfu0RNALjpb8tcMmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdDA-004NhU-2L; Wed, 13 Jul 2022 14:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdCh-004NOz-JN; Wed, 13 Jul 2022 14:19:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1FFD1424;
	Wed, 13 Jul 2022 07:19:02 -0700 (PDT)
Received: from bogus (unknown [10.57.7.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74EBE3F73D;
	Wed, 13 Jul 2022 07:19:00 -0700 (PDT)
Date: Wed, 13 Jul 2022 15:18:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <20220713141857.p3ruapm6b4in574j@bogus>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <Ys7QzJ14brtz23XY@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ys7QzJ14brtz23XY@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_071903_769889_E6E50B50 
X-CRM114-Status: GOOD (  33.74  )
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

On Wed, Jul 13, 2022 at 04:03:56PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 13, 2022 at 02:33:44PM +0100, Sudeep Holla wrote:
> > init_cpu_topology() is called only once at the boot and all the cache
> > attributes are detected early for all the possible CPUs. However when
> > the CPUs are hotplugged out, the cacheinfo gets removed. While the
> > attributes are added back when the CPUs are hotplugged back in as part
> > of CPU hotplug state machine, it ends up called quite late after the
> > update_siblings_masks() are called in the secondary_start_kernel()
> > resulting in wrong llc_sibling_masks.
> > 
> > Move the call to detect_cache_attributes() inside update_siblings_masks()
> > to ensure the cacheinfo is updated before the LLC sibling masks are
> > updated. This will fix the incorrect LLC sibling masks generated when
> > the CPUs are hotplugged out and hotplugged back in again.
> > 
> > Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/base/arch_topology.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> > 
> > Hi Conor,
> > 
> > Ionela reported an issue with the CPU hotplug and as a fix I need to
> > move the call to detect_cache_attributes() which I had thought to keep
> > it there from first but for no reason had moved it to init_cpu_topology().
> > 
> > Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
> > cpu in the secondary CPUs init path while init_cpu_topology executed
> > detect_cache_attributes() for all possible CPUs much earlier. I think
> > this might help as the percpu memory might be initialised in this case.
> > 
> > Anyways give this a try, also test the CPU hotplug and check if nothing
> > is broken on RISC-V. We noticed this bug only on one platform while
> > 
> > Regards,
> > Sudeep
> > 
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index 441e14ac33a4..0424b59b695e 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -732,7 +732,11 @@ const struct cpumask *cpu_clustergroup_mask(int cpu)
> >  void update_siblings_masks(unsigned int cpuid)
> >  {
> >  	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
> > -	int cpu;
> > +	int cpu, ret;
> > +
> > +	ret = detect_cache_attributes(cpuid);
> > +	if (ret)
> > +		pr_info("Early cacheinfo failed, ret = %d\n", ret);
> 
> No erroring out?
> 

No, this is optional as not all platforms have cacheinfo in the DT and also
the scheduler must work even without the cache information. It may not produce
optimal performance but it must work.

Also we have seen on one RISC-V platform with probably low percpu allocation,
the early detection fails, but it works just fine later device_initcall().
That was the main reason for adding error log, but the idea is to continue
building the information for the scheduler domains even if the LLC information
can't be obtained. In case of failure, we assume all CPUs have only private
caches and no shared LLC.

Hope that makes sense. Let me know if you prefer to drop the error log or
anything else. I just added as we found cases of -ENOMEM on RISC-V and we
want to highlight that.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
