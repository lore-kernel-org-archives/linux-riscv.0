Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C665C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idbnDpY+Ej2hSYEo8Sz67MPGb3Oa3o9NJgy5qO4Q+Y8=; b=GbZZc/wmBQiE5q
	fKnT4vcUAdOnp4/8FrVAKM+DJ8TglSM0QhHGILdwHtkFG1JYJSFohqAdnCSRAk5VcUSQ2hUmlpiPd
	fpIzhsZUme00GZgId8zs+gPevs/7X45moMya5+DLy9l5Dqzy19pYUoeAX6Ryv0i6TUbNbAXqMzWkI
	zMXJqe4MRXoknBQKCPqkRH3lFghLv3ts52+r8vjGXOHR6xADxkZWjqh7BaQF9HtcYBfER8VrvHmtA
	f1G1HBBkLH/+goGoK+2FZNZnEzbrYX+xCg6Gk0kLUzTF/e5ICDnHoj6PDndxvglgtZl8yvufdMxTJ
	HS4A5VNSKsxXHClDYFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPDy-005oDW-6d; Tue, 08 Nov 2022 14:05:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPDm-005oA7-9Q; Tue, 08 Nov 2022 14:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667916298; x=1699452298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zLKj7wxtAQEXGdhlBFDAU0UbuQiwlNXT3K61/KLPbGE=;
  b=rtwTT3HF19qfAKLdOH849qcaQZHw0c9+iNPItiQxHP9sPN1p6j30yQuQ
   0/0kOu8GcXSamwVcAPjvLdaYNSwL0Y+XCfJ6JR0/0kyQaz3x8EGxheP/m
   wGP17cR+X6FAlT1kf7dSgcRPob9hNhXDbQcNe8A/n4wxML7o4xfHT0K27
   KuQwyzOW4DF9eSGcsYNiTo/o08aYp/qOdntlrTNzA/QRq9xm3eMllruZl
   PaEXagU3bJiaLCeD0NqJVn81bf9ziKO2bJvBmL/EtJ2Are/alKgRMXXog
   tmDD3RYpr21knSvyRlxD/B8djyFknQSVy2exRgIBvA3H5vGFWaCLuBapp
   w==;
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="188162651"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 07:04:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 07:04:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 07:04:53 -0700
Date: Tue, 8 Nov 2022 14:04:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Pierre Gondois <pierre.gondois@arm.com>
CC: <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sudeep
 Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Gavin Shan <gshan@redhat.com>, SeongJae Park
	<sj@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>
Subject: Re: [PATCH 0/5] arch_topology: Build cacheinfo from primary CPU
Message-ID: <Y2ph9e8dZiJ3QW3b@wendy>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108110424.166896-1-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_060458_356090_96CA2EB1 
X-CRM114-Status: GOOD (  18.98  )
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

On Tue, Nov 08, 2022 at 12:04:16PM +0100, Pierre Gondois wrote:
> [1] and [2] build the CPU topology from the cacheinfo information for
> both DT/ACPI based systems and remove (struct cpu_topology).llc_id
> which was used by ACPI only.
> 
> Creating the cacheinfo for secondary CPUs is done during early boot.
> Preemption and interrupts are disabled at this stage. On PREEMPT_RT
> kernels, allocating memory (and parsing the PPTT table for ACPI based
> systems) triggers a:
>   'BUG: sleeping function called from invalid context' [4]
> 
> To prevent this bug, allocate the cacheinfo from the primary CPU when
> preemption and interrupts are enabled and before booting secondary
> CPUs. The cache levels/leaves are computed from DT/ACPI PPTT information
> only, without relying on the arm64 CLIDR_EL1 register.
> If no cache information is found in the DT/ACPI PPTT, then fallback
> to the current state, triggering [4] on PREEMPT_RT kernels.
> 
> Patches to update the arm64 device trees that have incomplete cacheinfo
> (mostly for missing the 'cache-level' or 'cache-unified' property)
> have been sent at [3].

FWIW checkpatch whinges a bit at your final two patches [a]. The RISC-V
code movement looks okay though, no new warnings and the like.

[a] - https://patchwork.kernel.org/project/linux-riscv/list/?series=693175

> 
> Tested platforms:
> - ACPI + PPTT: Ampere Altra, Ampere eMAG, Cavium ThunderX2,
>   Kunpeng 920, Juno-r2
> - DT: rb5, db845c, Juno-r2
> 
> [1] https://lore.kernel.org/all/20220704101605.1318280-1-sudeep.holla@arm.com/
> [2] https://lore.kernel.org/all/20220720-arch_topo_fixes-v3-0-43d696288e84@arm.com/
> [3] https://lore.kernel.org/all/20221107155825.1644604-1-pierre.gondois@arm.com/
> [4] On an Ampere Altra, with PREEMPT_RT kernel based on v6.0.0-rc4:
> 
> 
> [    7.560791] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
> [    7.560794] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/111
> [    7.560796] preempt_count: 1, expected: 0
> [    7.560797] RCU nest depth: 1, expected: 1
> [    7.560799] 3 locks held by swapper/111/0:
> [    7.560800]  #0: ffff403e406cae98 (&pcp->lock){+.+.}-{3:3}, at: get_page_from_freelist+0x218/0x12c8
> [    7.560811]  #1: ffffc5f8ed09f8e8 (rcu_read_lock){....}-{1:3}, at: rt_spin_trylock+0x48/0xf0
> [    7.560820]  #2: ffff403f400b4fd8 (&zone->lock){+.+.}-{3:3}, at: rmqueue_bulk+0x64/0xa80
> [    7.560824] irq event stamp: 0
> [    7.560825] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    7.560827] hardirqs last disabled at (0): [<ffffc5f8e9f7d594>] copy_process+0x5dc/0x1ab8
> [    7.560830] softirqs last  enabled at (0): [<ffffc5f8e9f7d594>] copy_process+0x5dc/0x1ab8
> [    7.560833] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [    7.560834] Preemption disabled at:
> [    7.560835] [<ffffc5f8e9fd3c28>] migrate_enable+0x30/0x130
> [    7.560838] CPU: 111 PID: 0 Comm: swapper/111 Tainted: G        W          6.0.0-rc4-[...]
> [    7.560841] Call trace:
> [...]
> [    7.560870]  __kmalloc+0xbc/0x1e8
> [    7.560873]  detect_cache_attributes+0x2d4/0x5f0
> [    7.560876]  update_siblings_masks+0x30/0x368
> [    7.560880]  store_cpu_topology+0x78/0xb8
> [    7.560883]  secondary_start_kernel+0xd0/0x198
> [    7.560885]  __secondary_switched+0xb0/0xb4
> 
> Pierre Gondois (5):
>   cacheinfo: Use riscv's init_cache_level() as generic OF implem
>   cacheinfo: Return error code in init_of_cache_level()
>   ACPI: PPTT: Remove acpi_find_cache_levels()
>   ACPI: PPTT: Update acpi_find_last_cache_level() to
>     acpi_get_cache_info()
>   arch_topology: Build cacheinfo from primary CPU
> 
>  arch/arm64/kernel/cacheinfo.c |   9 ++-
>  arch/riscv/kernel/cacheinfo.c |  39 +------------
>  drivers/acpi/pptt.c           |  86 +++++++++++++++++------------
>  drivers/base/arch_topology.c  |  10 +++-
>  drivers/base/cacheinfo.c      | 101 ++++++++++++++++++++++++++++++----
>  include/linux/cacheinfo.h     |  10 +++-
>  6 files changed, 164 insertions(+), 91 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
