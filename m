Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61J937CqUC1wdqziyuNGOvTc5LErv7Sbk/7R0vjaqT4=; b=yrhtkUHWqEqeJI
	Q6Nk0CHVYo2Bdv4GbI0Wm4Q6ythCjV9dG3Y5ORGveW8haJ2DrMRbGyQ8ksFncj7TexQaWBkTTRwcw
	Mbr6AAzNddTZfaFREh4gUh5fKNcKjIIMYlbSBzwyH1G9gccoAYTV2FAaAlRWYdV7h0ZNrQMoGI/EL
	GpUUWTwaCvgBoBRkmdqOfY6bNBxoJFpu5imnf+/8FMVNYmes7b95DfHnuNBAYE1d7NIxgwZtQ+KGY
	QN885YraAFGOGxdjNcJH4WBZ2aMhjVQEt3AcpZdWOWfu/WAynuk8osfCw+auSgQrCB2a34sr6ijVD
	zR3j5m+u+D8A+hbCbELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqmO-0003QW-Ij; Wed, 23 Nov 2022 14:31:12 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqm7-0003IB-GS; Wed, 23 Nov 2022 14:30:57 +0000
Received: by mail-qv1-f46.google.com with SMTP id cz18so5898849qvb.13;
        Wed, 23 Nov 2022 06:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPqYz53CENoAvpoVCMtaYiYdCQ+z24Prz3+5ZCF25yI=;
        b=QxzSUBVX7GH76ASj4yhVl3ymPMgb7wii3FbnTvMeeMfnLFZVFF5aiVhyIUEJdipWUn
         FTWDNG0k4g5T5D6xECLiLVlWizR157SPTXhuKxu6mcELGo2giWM/I6tF0mrkJE6nkh2i
         VUrKcohiJsWgvyiYGsmkGHDnM32TUh3TMAs4Gue9FmRJbxwDkPg8HbF+lcYWASgz4O5I
         CfxsO548x/8YAFg7l/rK7CRzzEd7qz4mghlw9Ia3IAhX9o4xPQcfNhOkm8PhES3hN/SY
         OcCHVdA4gjwYRxX12Vk4cIjf2aLMPNhy/uMdAFMxRJvhF0y4iDWJns3hkEYVPEcbegVx
         fdFg==
X-Gm-Message-State: ANoB5plG56sHF4xq5i7DvlTI6+81J/SyfE7f6dx2v5SXMJT4NdPgoWh5
	27eMve4BYimN6rU8QUl66nDD4PGo5mGO04yTezQ=
X-Google-Smtp-Source: AA0mqf6qnpTmTFryR7zC/cHKFhWbJw3XtyaIp3+m15iLdslak72lEuPM/k+aCKzeVkEvcTVVvnogkpm9xBii4DFvxw0=
X-Received: by 2002:a0c:ed50:0:b0:4bb:f952:c799 with SMTP id
 v16-20020a0ced50000000b004bbf952c799mr8421203qvq.3.1669213850057; Wed, 23 Nov
 2022 06:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20221121171217.3581004-1-pierre.gondois@arm.com>
In-Reply-To: <20221121171217.3581004-1-pierre.gondois@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Nov 2022 15:30:39 +0100
Message-ID: <CAJZ5v0gbr5D8Qt5t=Y-bQ=B67EEJWsbmpO9BTNxapxQs3yVZiA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] [PATCH 0/5] arch_topology: Build cacheinfo from
 primary CPU
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Ionela.Voinescu@arm.com, Rob.Herring@arm.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jeremy Linton <jeremy.linton@arm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Gavin Shan <gshan@redhat.com>, SeongJae Park <sj@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_063055_595223_55D83990 
X-CRM114-Status: GOOD (  21.49  )
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

On Mon, Nov 21, 2022 at 6:12 PM Pierre Gondois <pierre.gondois@arm.com> wrote:
>
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
>
> --

For the ACPI material in the series:

Acked-by: Rafael J. Wysocki  <rafael.j.wysocki@intel.com>

and I'm assuming that this series will be merged through a different tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
