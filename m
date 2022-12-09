Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C0FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=S2RFNWimPUEKNAnTUyKMV4cDBkMFcqXYXlCE5VMt7OA=; b=RHGX7lKY33m0XottULqB4U9Jb3
	CpQfSXKXw6vtQZIxXVqoaCLcPYeIenk0fs67MTuGaybW3n99IQT9GMMvEpPYxG+EI8lGalUG+Z9+E
	BC1WQ3ExfGaYqmEl46p3qjyVwBCljCbknshsF+Q5ObpfWj9C4LcHV0bKDvK0EV12xOFnlwSu7Xzl7
	l7PXVnkSWqG+LQPvG+jYI9XYAwqb+pYdPlTTYD+k6em33Y0oGBdHqvTEiQAzsSwN/mYV+biBiU6la
	BS7MJY7Vp2CVP9DuORPbwmfIEvUoF2+ypM4F1FMUdwsZp8aliHtCrqjtNbX4kCRdbtPEPTgkl/D1C
	eHKu82Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7h-00HZDa-Uv; Fri, 09 Dec 2022 01:24:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7Y-00HZ0w-Q1
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:24:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d3so3288839plr.10
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 17:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHIhaHkuEJIAxmUXEDjqr1glufGPUbdGVtsXv10PSDk=;
        b=XCz3NE1t8wtQn7i1rcNEXlDw/EXi2cZ3/qKOEP+76cf1LeLd/PZAQOGz59i9dP1Lwa
         UNfzBy8lHpVCGaZV70uEWIiJJJBK7qlvyoGXKiMm4pMbm1o8lDrdchx9AMNP3JDhciLh
         6zi4xEwZtZflufR5JIpDHUvDpcAtTmcJEAADfEMc0VHmKSfQ91gQLa82Gc3nnnrzLXOp
         xG3Tfiii7lp6IAxkQscXt4PuCSYTHC2j9BDTCLfMlPu8PS0lD2zYHLN8mk53gYnnHobn
         r6pGTd9D2+B8vnVAbNxMr7TKH/8L9NsINoTTdPdDEi4nuOeNOGo1soowYpmMt6lL/Xag
         hEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHIhaHkuEJIAxmUXEDjqr1glufGPUbdGVtsXv10PSDk=;
        b=GQbQFI+SlUYt3ChAn8Fzu2F3nQun8gE4Ygf1hkQW+RL2ZkWcrEMKzOoViBkiQgt9KY
         hLicmQQRu4ugo1wohdfdhgRvEPQ5r6X9fcz41U8aP6kNfQFGHqXT5WSfjhfaIExqMRnb
         RWmsAPPiCVepwGxdQK5lnFUcEOyjKyp1A8VioQMU2JaxUIz9MYSXwrA9dc4UOh1LRRN2
         CTJh0S7g1wkiyOYf5wkQ/8gXTnsa6RB4j14dPj+LxrguCZlsyRg3hmZ/YPhOHVykz6IG
         8b3vRZjX7c/17gRj/do2SyQ4ap8aF5De/68yaArI5COn4wkAynWJ0htHuxIRHOS3iths
         +W1Q==
X-Gm-Message-State: ANoB5pm0jNgjmhV68C6M4vwUrGzMg29nlbNtJKVEg5AzpT0NYRJ53b8r
	f5iAIEU2rMmk4UZujef2Y0d7jg==
X-Google-Smtp-Source: AA0mqf5NtW5gG5tfTHG3NmhX8uJRY7s8A3O6ilTpb+qOfAfAlePlkUtFp74zQnjEkEnifOn98iqXvg==
X-Received: by 2002:a17:903:555:b0:188:8cfc:6ba7 with SMTP id jo21-20020a170903055500b001888cfc6ba7mr3331093plb.68.1670549049478;
        Thu, 08 Dec 2022 17:24:09 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902ea0d00b00179e1f08634sm57671plg.222.2022.12.08.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 17:24:09 -0800 (PST)
Date: Thu, 08 Dec 2022 17:24:09 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 16:06:07 PST (-0800)
Subject: Re: [PATCH v2 0/5] [PATCH 0/5] arch_topology: Build cacheinfo from primary CPU
In-Reply-To: <20221121171217.3581004-1-pierre.gondois@arm.com>
CC: linux-kernel@vger.kernel.org, Ionela.Voinescu@arm.com, Rob.Herring@arm.com,
  pierre.gondois@arm.com, catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, rafael@kernel.org, lenb@kernel.org,
  sudeep.holla@arm.com, Greg KH <gregkh@linuxfoundation.org>, jeremy.linton@arm.com,
  Conor Dooley <conor.dooley@microchip.com>, gshan@redhat.com, sj@kernel.org, kuba@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: pierre.gondois@arm.com
Message-ID: <mhng-b3f28c39-37ea-4197-b02f-b52fa41373c6@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_172412_909875_A8E74C71 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, 21 Nov 2022 09:12:08 PST (-0800), pierre.gondois@arm.com wrote:
> v2:
>  - Applied renaming/formatting comments from v1.
>  - Check CACHE_TYPE_VALID flag in pppt.c.
>
> Note:
> This patchset requires the following patch to be applied first in
> order to avoid the same bug described in the commit message:
> https://lore.kernel.org/all/20221116094958.2141072-1-pierre.gondois@arm.com/
>
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
>   cacheinfo: Use RISC-V's init_cache_level() as generic OF
>     implementation
>   cacheinfo: Return error code in init_of_cache_level()
>   ACPI: PPTT: Remove acpi_find_cache_levels()
>   ACPI: PPTT: Update acpi_find_last_cache_level() to
>     acpi_get_cache_info()
>   arch_topology: Build cacheinfo from primary CPU
>
>  arch/arm64/kernel/cacheinfo.c |   9 ++-
>  arch/riscv/kernel/cacheinfo.c |  39 +------------
>  drivers/acpi/pptt.c           |  93 +++++++++++++++++-------------
>  drivers/base/arch_topology.c  |  10 +++-
>  drivers/base/cacheinfo.c      | 104 ++++++++++++++++++++++++++++++----
>  include/linux/cacheinfo.h     |  10 +++-
>  6 files changed, 170 insertions(+), 95 deletions(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
