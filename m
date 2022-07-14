Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5E8C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXRU29YN+QaEgAHMmeJeYe9ggJc36Hg/HoyA8w8u5GQ=; b=XbiKwohE9f1fg3
	iWvpml8xiibwEBTl/Q9Dyujo4iW29STNeSAjps9Hw6KW4xDoNNI55Mwr+tKmcCOnlQc0r1rgUQVwl
	cFvFEVgFq/pb3kRq5g2787wT1PiOIhwqhTGd8awfuWCt+ZRpHMHp9DiFVsb6pzWl0lkfIK88tE+ZP
	eiSxCgKqzqO7kkyiuSA8yaTGJj/0Fo2SWWsLc8Z1TgCShHJnm2ADWyL0764J9rcO2X3zg9lhuDwrV
	RDiEdjlUEau2iJAmGLDBeg4Ta8y5tVBXDzK38GFMoPCzQ5EVGc8SaSFGRf1mevN9wT2j8FhPnUHDP
	RKAn8feubyciwlhNsQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0LE-00FSa5-6t; Thu, 14 Jul 2022 15:01:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0Kz-00FSNH-Gl; Thu, 14 Jul 2022 15:01:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47EEB1D13;
	Thu, 14 Jul 2022 08:01:04 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B6263F70D;
	Thu, 14 Jul 2022 08:01:02 -0700 (PDT)
Date: Thu, 14 Jul 2022 16:01:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <20220714150100.aqvmdgjkymc2dr5t@bogus>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_080109_681039_65892C1D 
X-CRM114-Status: GOOD (  37.24  )
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

On Thu, Jul 14, 2022 at 02:17:33PM +0000, Conor.Dooley@microchip.com wrote:
> On 13/07/2022 14:33, Sudeep Holla wrote:
> 
> Hey Sudeep,
> I could not get this patch to actually apply, tried a couple
> different versions of -next :/
>

That's strange.

> It is in -next already though, which I suspect might be part of why
> it does not apply.. 

Ah that could be the case.

> Surely you can fast forward your arch_topology
> for-next branch to gregs merge commit rather than generating this
> from the premerge branch & re-merging into your branch that Stephen
> picks up?
>

Greg has merged my branch and all those commits are untouched, so it shouldn't
cause any issue as the hash remains same in both the trees, I just added just
this one patch on the top. Did you see any issues with the merge, or are you
just speculating based on your understanding. As I said if Greg had picked
up patches directly, then I would have definitely based on his -next branch
to avoid duplicate hash, but that is not the case here.

> Either way, I tested it directly in -next since that's back to
> booting for me today and ...
>

Thanks.

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
> >   drivers/base/arch_topology.c | 16 ++++++----------
> >   1 file changed, 6 insertions(+), 10 deletions(-)
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
> 
> Actually, we are now worse off than before:
>      0.009813] smp: Bringing up secondary CPUs ...
> [    0.011530] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:274
> [    0.011550] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
> [    0.011566] preempt_count: 1, expected: 0
> [    0.011580] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.19.0-rc6-next-20220714-dirty #1
> [    0.011599] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> [    0.011608] Call Trace:
> [    0.011620] [<ffffffff80005070>] dump_backtrace+0x1c/0x24
> [    0.011661] [<ffffffff8066b0c4>] show_stack+0x2c/0x38
> [    0.011699] [<ffffffff806704a2>] dump_stack_lvl+0x40/0x58
> [    0.011725] [<ffffffff806704ce>] dump_stack+0x14/0x1c
> [    0.011745] [<ffffffff8002f42a>] __might_resched+0x100/0x10a
> [    0.011772] [<ffffffff8002f472>] __might_sleep+0x3e/0x66
> [    0.011793] [<ffffffff8014d774>] __kmalloc+0xd6/0x224
> [    0.011825] [<ffffffff803d631c>] detect_cache_attributes+0x37a/0x448
> [    0.011855] [<ffffffff803e8fbe>] update_siblings_masks+0x24/0x246
> [    0.011885] [<ffffffff80005f32>] smp_callin+0x38/0x5c
> [    0.015990] smp: Brought up 1 node, 4 CPUs
>

Interesting, need to check if it is not in atomic context on arm64.
Wonder if some configs are disabled and making this bug hidden. Let me
check.

One possible solution is to add GFP_ATOMIC to the allocation but I want
to make sure if it is legal to be in atomic context when calling
update_siblings_masks.

> > 
> > Anyways give this a try, also test the CPU hotplug and check if nothing
> > is broken on RISC-V. We noticed this bug only on one platform while
> 
> So, our system monitor that runs openSBI does not actually support
> any hotplug features yet, so:

OK, we can ignore hotplug on RISC-V for now then. We have tested on multiple
arm64 platforms(DT as well as ACPI).

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
