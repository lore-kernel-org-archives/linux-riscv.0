Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D2C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBNQBY3934liM2lIhfj1XbtGXOAyf211rtMPDj+fAAE=; b=LchRSjbYNtuu03
	9t70VCho7ExJTrVfdeoEVHH/VP1ZUYYYUq5EhW6fyOiA/9ABtqd8BbJt0uec1L4MPu0hazCW9/Gqd
	kWHWAoOiZHCj9YEdpKiux4fNYLtGdhTfq5k6Uk7KFHsHQCzHhPUa6tVaqaaB8TRqlqaWxNZVNUtEN
	VK3A3brkGZoxsWDLnRZ1sKiTtx1pN6DnoBwXipdCBBZJGAHeHMNHPGVnb9Z9esJUBbsM1JPzixMw6
	shh8p+98mVZbfir+2FoGsh7Q9vNsIhY4RW1HH7HXMgg15y0U4sFdRcsrJH7XEMt873tJXeHdg6sO6
	5wZuPA04r/1DljG6sFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBcyL-004DJW-Fm; Wed, 13 Jul 2022 14:04:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBcyA-004DFI-KT; Wed, 13 Jul 2022 14:04:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55BA9B81FE9;
	Wed, 13 Jul 2022 14:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5C2C34114;
	Wed, 13 Jul 2022 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657721039;
	bh=9IGH4MQdi/KGvLaBbSpVE1u3UFTp0yNqx8UIwCBrNzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N41phYccyuE63ABZmUcfr3okC4jpwzGUm6l59osfsReDlNcsLoQqadbj6yYHvKIEc
	 CTHf8yXBLNGIsUZbTiOGA9CPSrUtf2EQ/O4BKi9wy8tw++1A3LCCK/1RScJ0nvGRB4
	 0iiS5yJURy2dzfKYlYx/pNYrE0vxjZ09F+qdWmTM=
Date: Wed, 13 Jul 2022 16:03:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <Ys7QzJ14brtz23XY@kroah.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713133344.1201247-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_070402_866655_0D6E4F04 
X-CRM114-Status: GOOD (  26.79  )
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

On Wed, Jul 13, 2022 at 02:33:44PM +0100, Sudeep Holla wrote:
> init_cpu_topology() is called only once at the boot and all the cache
> attributes are detected early for all the possible CPUs. However when
> the CPUs are hotplugged out, the cacheinfo gets removed. While the
> attributes are added back when the CPUs are hotplugged back in as part
> of CPU hotplug state machine, it ends up called quite late after the
> update_siblings_masks() are called in the secondary_start_kernel()
> resulting in wrong llc_sibling_masks.
> 
> Move the call to detect_cache_attributes() inside update_siblings_masks()
> to ensure the cacheinfo is updated before the LLC sibling masks are
> updated. This will fix the incorrect LLC sibling masks generated when
> the CPUs are hotplugged out and hotplugged back in again.
> 
> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> Hi Conor,
> 
> Ionela reported an issue with the CPU hotplug and as a fix I need to
> move the call to detect_cache_attributes() which I had thought to keep
> it there from first but for no reason had moved it to init_cpu_topology().
> 
> Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
> cpu in the secondary CPUs init path while init_cpu_topology executed
> detect_cache_attributes() for all possible CPUs much earlier. I think
> this might help as the percpu memory might be initialised in this case.
> 
> Anyways give this a try, also test the CPU hotplug and check if nothing
> is broken on RISC-V. We noticed this bug only on one platform while
> 
> Regards,
> Sudeep
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 441e14ac33a4..0424b59b695e 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -732,7 +732,11 @@ const struct cpumask *cpu_clustergroup_mask(int cpu)
>  void update_siblings_masks(unsigned int cpuid)
>  {
>  	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
> -	int cpu;
> +	int cpu, ret;
> +
> +	ret = detect_cache_attributes(cpuid);
> +	if (ret)
> +		pr_info("Early cacheinfo failed, ret = %d\n", ret);

No erroring out?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
