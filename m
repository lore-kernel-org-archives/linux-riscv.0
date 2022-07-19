Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C344C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOYtNKeTTgLV2WsY5WMPNeOmm8tt1eFutkUJhbPJqH8=; b=o2VWoqPweTLZKB
	dXmpd+e7ae4eQ2193ZJsmqV4kqCGcuPjCFuSzUIMO0n4O13+kFO2NpsytVQ6oU8ue6htwyLLYox5f
	GKqBjCQLHTUWXrmcdMK3XOWklrAAGrgbXH3srTPSltIInotdTB8j+hce37iR2e/LxsJpY/AnYBpBi
	DtX024jUutDx77vCfdItt375svTEgQnCsCunOfbWr9tg6/nFR/8kYXHbGIoHAbllJUlgLcXw97+pK
	ncpOKg4cfAwwj5WnTFieB6sb/fyRlaaPvoYhypUPLR14npLPdFzd/+XVS8kIW6BJtiyvnqBfsgQO7
	ysa2lzxWmBO9ME3h47zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkTy-0080TV-Jv; Tue, 19 Jul 2022 10:29:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkTm-0080Pn-Nu; Tue, 19 Jul 2022 10:29:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AF101424;
	Tue, 19 Jul 2022 03:29:21 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377333F766;
	Tue, 19 Jul 2022 03:29:19 -0700 (PDT)
Date: Tue, 19 Jul 2022 11:29:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux@roeck-us.net, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <20220719102916.xixnvzxnnn5kslnd@bogus>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <20220718174151.GA462603@roeck-us.net>
 <0744c97a-bb4e-0985-7f86-f98965b5d3c1@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0744c97a-bb4e-0985-7f86-f98965b5d3c1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_032926_894273_C92F3A28 
X-CRM114-Status: GOOD (  32.70  )
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

On Mon, Jul 18, 2022 at 05:57:33PM +0000, Conor.Dooley@microchip.com wrote:
> On 18/07/2022 18:41, Guenter Roeck wrote:
> > On Wed, Jul 13, 2022 at 02:33:44PM +0100, Sudeep Holla wrote:
> >> init_cpu_topology() is called only once at the boot and all the cache
> >> attributes are detected early for all the possible CPUs. However when
> >> the CPUs are hotplugged out, the cacheinfo gets removed. While the
> >> attributes are added back when the CPUs are hotplugged back in as part
> >> of CPU hotplug state machine, it ends up called quite late after the
> >> update_siblings_masks() are called in the secondary_start_kernel()
> >> resulting in wrong llc_sibling_masks.
> >>
> >> Move the call to detect_cache_attributes() inside update_siblings_masks()
> >> to ensure the cacheinfo is updated before the LLC sibling masks are
> >> updated. This will fix the incorrect LLC sibling masks generated when
> >> the CPUs are hotplugged out and hotplugged back in again.
> >>
> >> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> >> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> >> ---
> >>  drivers/base/arch_topology.c | 16 ++++++----------
> >>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>
> >> Hi Conor,
> >>
> >> Ionela reported an issue with the CPU hotplug and as a fix I need to
> >> move the call to detect_cache_attributes() which I had thought to keep
> >> it there from first but for no reason had moved it to init_cpu_topology().
> >>
> >> Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
> >> cpu in the secondary CPUs init path while init_cpu_topology executed
> >> detect_cache_attributes() for all possible CPUs much earlier. I think
> >> this might help as the percpu memory might be initialised in this case.
> >>
> >> Anyways give this a try, also test the CPU hotplug and check if nothing
> >> is broken on RISC-V. We noticed this bug only on one platform while
> >>
> > 
> > arm64, with next-20220718:
> > 
> > ...
> > [    0.823405] Detected PIPT I-cache on CPU1
> > [    0.824456] BUG: sleeping function called from invalid context at kernel/locking/semaphore.c:164
> > [    0.824550] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/1
> > [    0.824600] preempt_count: 1, expected: 0
> > [    0.824633] RCU nest depth: 0, expected: 0
> > [    0.824899] no locks held by swapper/1/0.
> > [    0.825035] irq event stamp: 0
> > [    0.825072] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> > [    0.826017] hardirqs last disabled at (0): [<ffff800008158870>] copy_process+0x5e0/0x18e4
> > [    0.826123] softirqs last  enabled at (0): [<ffff800008158870>] copy_process+0x5e0/0x18e4
> > [    0.826191] softirqs last disabled at (0): [<0000000000000000>] 0x0
> > [    0.826764] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.19.0-rc7-next-20220718 #1
> > [    0.827397] Call trace:
> > [    0.827456]  dump_backtrace.part.0+0xd4/0xe0
> > [    0.827574]  show_stack+0x18/0x50
> > [    0.827625]  dump_stack_lvl+0x9c/0xd8
> > [    0.827678]  dump_stack+0x18/0x34
> > [    0.827722]  __might_resched+0x178/0x220
> > [    0.827778]  __might_sleep+0x48/0x80
> > [    0.827833]  down_timeout+0x2c/0xa0
> > [    0.827896]  acpi_os_wait_semaphore+0x68/0x9c
> > [    0.827952]  acpi_ut_acquire_mutex+0x4c/0xb8
> > [    0.828008]  acpi_get_table+0x38/0xbc
> > [    0.828059]  acpi_find_last_cache_level+0x44/0x130
> > [    0.828112]  init_cache_level+0xb8/0xcc
> > [    0.828165]  detect_cache_attributes+0x240/0x580
> > [    0.828217]  update_siblings_masks+0x28/0x270
> > [    0.828270]  store_cpu_topology+0x64/0x74
> > [    0.828326]  secondary_start_kernel+0xd0/0x150
> > [    0.828386]  __secondary_switched+0xb0/0xb4
> > 
> > I know the problem has already been reported, but I think the backtrace
> > above is slightly different.
>

Thanks for the report, I forgot to run with lockdep on ACPI system. This is
trickier. I will take a look at it.

> Aye, I got a different BT on RISC-V + DT - but that should be fixed in
> next-20220718. This is a different problem unfortunately.

Yes, ACPI is bit different flow.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
