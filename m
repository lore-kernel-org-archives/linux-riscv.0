Return-Path: <SRS0=dKKk=FS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B87C4361B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 01:02:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D00F82388A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 01:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D00F82388A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bh7ugd6sK1318ZX9aNQiBklm+7xJOqVN7ZHIFUs5AKw=; b=c2a9KaPyIaJGyhS061gh+4oES
	v440TY74Usal0LUpiaRRhgZJYTu05T+a7plKQRmGj6hYBSXTMFApbdoWWKLMe2DpfO4kwVOQvDeS1
	nnpk4ZHfSfx9mHU+MNT9SqgQW1r9EHK2/QoOhcQJMuFY1Je6OmOSzhSQxuqhtLvKAmtDuCK3P/rwF
	uOkNqa9B4Kai5H+gJK5bMl23ons+c9DgY3GwHpgNZk3GTgqhkCMIPIYn0qnRm8DbyW6jplThd7oa2
	5b7pbCoL73IfvJ3TWPCnvnkT2W+lZf2unFl50dnXT3enhm2S40Ex0apIHtGV/FYQzEkNoPW3SE5Ez
	fiUk3qrdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kocG6-0007FB-4o; Mon, 14 Dec 2020 01:02:38 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kocG2-0007EW-MO
 for linux-riscv@lists.infradead.org; Mon, 14 Dec 2020 01:02:36 +0000
Received: by mail-il1-x143.google.com with SMTP id c18so14304767iln.10
 for <linux-riscv@lists.infradead.org>; Sun, 13 Dec 2020 17:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pwoZAstNyItowRl75/JkfYhPz9GxjpG8UKmIVeiIkU4=;
 b=jg1VAG8Y9spbeNPm0HqZQYyzZbUThDGajQczBhxopY/eZ0ZfZOy1rtNtMpfTcUJN2e
 hcTDkndVSeCSv8XfUkk1ct333kRwrfVXn1wJ8rT8VTHfhE4vDaikBJeJ50nbAEiSjdAH
 Tc+fFmMLY5KDmELT+OGUNcqBKacXiC7mJb8ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pwoZAstNyItowRl75/JkfYhPz9GxjpG8UKmIVeiIkU4=;
 b=TjkeQpM0vxaUTmO9ZnrP10FAfuRiqNYsBEFX0NvxtbU8ChWJbZ33ckT8z6Pwrn5dgv
 mvFlZZj4qVsDIgd0pc1nBVW7qPTcmffQjzd4lyJWptRhNccJjvFp8tBB+89m8ogwxHwO
 pGYMibxhfSYHWPNiJTsof9OvGucx8xyPqbE+23LbbE6Mr2Nkx/0/1e28r0VDTpthr6CI
 +7ysCN6NPgPUnHMXqZbfd1Hs8DkoSaKwFGgwQXdGBdwXd4Gtx5cw0BnejQlCHhB7jATY
 u4vQL54kR4ZdGIImhugdgu7i+GVnQSqml0XTEG83HLuE2XQjDieg2Bru2rf6HRr/quwn
 K/DA==
X-Gm-Message-State: AOAM533lwHkdp3ixPMEQfb3aRz2lsxqYm3HgEFOxnMEMrbk27CYvRqDS
 CqUup4Rs/oj6TOH/i9PJt+cR4rWd9YIIMco7KWTu
X-Google-Smtp-Source: ABdhPJxwGY4W0ZwhqdX57uqaRtOvyYqqWikXmuAUulNParGeFaU61YIkG4qfuzXaAXRgstDfVpPKylEyEQP/pDhhDt0=
X-Received: by 2002:a92:6410:: with SMTP id y16mr31116431ilb.126.1607907750716; 
 Sun, 13 Dec 2020 17:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20201119003829.1282810-1-atish.patra@wdc.com>
In-Reply-To: <20201119003829.1282810-1-atish.patra@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 13 Dec 2020 17:02:19 -0800
Message-ID: <CAOnJCULPCxhirYH8xCciKDNJ=zfWKwiOOfAoT8QQBOKqTuWuTA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Unify NUMA implementation between ARM64 & RISC-V
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_200234_883082_CFC8B9E5 
X-CRM114-Status: GOOD (  28.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org,
 Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>, Baoquan He <bhe@redhat.com>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 4:39 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> This series attempts to move the ARM64 numa implementation to common
> code so that RISC-V can leverage that as well instead of reimplementing
> it again.
>
> RISC-V specific bits are based on initial work done by Greentime Hu [1] but
> modified to reuse the common implementation to avoid duplication.
>
> [1] https://lkml.org/lkml/2020/1/10/233
>
> This series has been tested on qemu with numa enabled for both RISC-V & ARM64.
> It would be great if somebody can test it on numa capable ARM64 hardware platforms.
> This patch series doesn't modify the maintainers list for the common code (arch_numa)
> as I am not sure if somebody from ARM64 community or Greg should take up the
> maintainership. Ganapatrao was the original author of the arm64 version.
> I would be happy to update that in the next revision once it is decided.
>
> # numactl --hardware
> available: 2 nodes (0-1)
> node 0 cpus: 0 1 2 3
> node 0 size: 486 MB
> node 0 free: 470 MB
> node 1 cpus: 4 5 6 7
> node 1 size: 424 MB
> node 1 free: 408 MB
> node distances:
> node   0   1
>   0:  10  20
>   1:  20  10
> # numactl -show
> policy: default
> preferred node: current
> physcpubind: 0 1 2 3 4 5 6 7
> cpubind: 0 1
> nodebind: 0 1
> membind: 0 1
>
> The patches are also available at
> https://github.com/atishp04/linux/tree/5.11_numa_unified_v5
>
> For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
> https://patchwork.kernel.org/project/qemu-devel/list/?series=303313
>
> Testing:
> RISC-V:
> Tested in Qemu and 2 socket OmniXtend FPGA.
>
> ARM64:
> 2 socket kunpeng920 (4 nodes around 250G a node)
> Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> Changes from v4->v5:
> 1. Added by Acked-by & Reviewed-by tags.
> 2. Swapped patch 1 & 2 in v4 version.
>
> Changes from v3->v4:
> 1. Removed redundant duplicate header.
> 2. Added Reviewed-by tags.
>
> Changes from v2->v3:
> 1. Added Acked-by/Reviewed-by tags.
> 2. Replaced asm/acpi.h with linux/acpi.h
> 3. Defined arch_acpi_numa_init as static.
>
> Changes from v1->v2:
> 1. Replaced ARM64 specific compile time protection with ACPI specific ones.
> 2. Dropped common pcibus_to_node changes. Added required changes in RISC-V.
> 3. Fixed few typos.
>
> Atish Patra (4):
> arm64, numa: Change the numa init functions name to be generic
> numa: Move numa implementation to common code
> riscv: Separate memory init from paging init
> riscv: Add numa support for riscv64 platform
>
> Greentime Hu (1):
> riscv: Add support pte_protnone and pmd_protnone if
> CONFIG_NUMA_BALANCING
>
> arch/arm64/Kconfig                            |  1 +
> arch/arm64/include/asm/numa.h                 | 48 +----------------
> arch/arm64/kernel/acpi_numa.c                 | 12 -----
> arch/arm64/mm/Makefile                        |  1 -
> arch/arm64/mm/init.c                          |  4 +-
> arch/riscv/Kconfig                            | 31 ++++++++++-
> arch/riscv/include/asm/mmzone.h               | 13 +++++
> arch/riscv/include/asm/numa.h                 |  8 +++
> arch/riscv/include/asm/pci.h                  | 14 +++++
> arch/riscv/include/asm/pgtable.h              | 21 ++++++++
> arch/riscv/kernel/setup.c                     | 11 +++-
> arch/riscv/kernel/smpboot.c                   | 12 ++++-
> arch/riscv/mm/init.c                          | 10 +++-
> drivers/base/Kconfig                          |  6 +++
> drivers/base/Makefile                         |  1 +
> .../mm/numa.c => drivers/base/arch_numa.c     | 27 ++++++++--
> include/asm-generic/numa.h                    | 52 +++++++++++++++++++
> 17 files changed, 200 insertions(+), 72 deletions(-)
> create mode 100644 arch/riscv/include/asm/mmzone.h
> create mode 100644 arch/riscv/include/asm/numa.h
> rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (96%)
> create mode 100644 include/asm-generic/numa.h
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Hey Palmer,
I did not see this series in for-next. Let me know if you need
anything else to be done for this series.

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
