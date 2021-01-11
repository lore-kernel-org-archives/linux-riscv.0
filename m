Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AC2C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 19:31:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF6222A84
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 19:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF6222A84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7FQyUAuZgR2I5AJubeH1lMuG0P96rc4C/y43GtHjNKY=; b=yoJA8R5ebS5lJ4TNud+KxV/YM
	iPPCK/EPlbc9fStzMbUvJmZIoAcW/mZkb5pGfwTgqaj3RZY4aKNarQrBkkppQeT7qoLyUb84rEw2Q
	z7c+lIAjmZY4AVFhb3W1EexidBlDXwYyciX/mok2QdYqkHGdMpq7C6SS2H2s9gevauHgE4lHI+EFE
	4gdZbPvKQtiQl5M7UYqIcmbWXuAQfn4zsLCgmGcUb5463dym12gDXzt2UnE93WO3CkcQ2tKHRNB/i
	FcBV35ssx/+nj7B1HJr8UjE7cQd4RyyXNRIG+12xsUmlV/a/cB1Zrf7auU3mJCLx+UVjDxd43ldBh
	R7v9cDfoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz2ub-0002WV-H5; Mon, 11 Jan 2021 19:31:33 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz2uS-0002RH-3c
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 19:31:26 +0000
Received: by mail-io1-xd2c.google.com with SMTP id w18so868537iot.0
 for <linux-riscv@lists.infradead.org>; Mon, 11 Jan 2021 11:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2I4BbShbTu/yJpEZj0PNRRdCnuLwVEUr5DQ9wFpqcE=;
 b=srZzPZyePcV1kAldudiypZ0rRVK8bt8lvJ2u9G/OM6L5wyUuvQJ6iiE7U54MXmR8LI
 8v01ioV782Fz0JH5/1ojhhDjdU3OogkTVx5hoJmg/pcXWDg1H4kM/vPV6FiAKdGSTtfd
 UzFfVK7HotL53AU5ROuFl/mbmJPrAkzBpOqRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2I4BbShbTu/yJpEZj0PNRRdCnuLwVEUr5DQ9wFpqcE=;
 b=d8STTuSXJRI4JNloLZ8QVKKQgwm96a3MNL7D0I4EvYbrzhAgmEg4h7ldmVC7jt5Mql
 m8/5il/vBNMEqcxeRoXWNATG7mM26+HVfij+6j4fxjuKqJrh57cncuiyoasOoCBGXtR1
 TsiZsGpbpG4MJ3FjuVr8kKspZDR/TXtjiN85OnudCtq/XwCFcmtQdqxG8WEoSgVOhk7L
 3rtfJ5bn2BY6zLuG37EkMW3CkHfx2b2Fc1cxhxOLFpnWIJPFS30RbQBUsu7MGtDeSyjt
 D3NdYlgCDivIVs9CA0dteAZMLC4n1fKqgc/amgzOjzc/2KjNMXWnABINSR0KgDDCaxQg
 sEzg==
X-Gm-Message-State: AOAM531KCN4nyokVnEXnAoxNxG+08To+7boheWoI5MUtqcqWAo2Qn9Gc
 qUpP2j5PalFmZ+Ej4hinljORPMq8SjodZgUa7bf1
X-Google-Smtp-Source: ABdhPJzhe7x3UfUvfOZk8hrT4czPh4HNfXiB6nfRWX8ysGPV0CWtXhWKQhiUlsD3i77pSSTTtW+at4ya/ydmJxPk2PA=
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr670195iof.0.1610393482014;
 Mon, 11 Jan 2021 11:31:22 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCULPCxhirYH8xCciKDNJ=zfWKwiOOfAoT8QQBOKqTuWuTA@mail.gmail.com>
 <mhng-94c90991-c4e8-49fe-a225-854ae0343d8d@palmerdabbelt-glaptop>
In-Reply-To: <mhng-94c90991-c4e8-49fe-a225-854ae0343d8d@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 11 Jan 2021 11:31:11 -0800
Message-ID: <CAOnJCUJq5e7W1UXkFFMkKje_BTedekoUT=32ia6t+Sc4UVDhEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Unify NUMA implementation between ARM64 & RISC-V
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_143125_047265_B2850D04 
X-CRM114-Status: GOOD (  33.45  )
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
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>,
 Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 9, 2021 at 12:51 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 13 Dec 2020 17:02:19 PST (-0800), atishp@atishpatra.org wrote:
> > On Wed, Nov 18, 2020 at 4:39 PM Atish Patra <atish.patra@wdc.com> wrote:
> >>
> >> This series attempts to move the ARM64 numa implementation to common
> >> code so that RISC-V can leverage that as well instead of reimplementing
> >> it again.
> >>
> >> RISC-V specific bits are based on initial work done by Greentime Hu [1] but
> >> modified to reuse the common implementation to avoid duplication.
> >>
> >> [1] https://lkml.org/lkml/2020/1/10/233
> >>
> >> This series has been tested on qemu with numa enabled for both RISC-V & ARM64.
> >> It would be great if somebody can test it on numa capable ARM64 hardware platforms.
> >> This patch series doesn't modify the maintainers list for the common code (arch_numa)
> >> as I am not sure if somebody from ARM64 community or Greg should take up the
> >> maintainership. Ganapatrao was the original author of the arm64 version.
> >> I would be happy to update that in the next revision once it is decided.
> >>
> >> # numactl --hardware
> >> available: 2 nodes (0-1)
> >> node 0 cpus: 0 1 2 3
> >> node 0 size: 486 MB
> >> node 0 free: 470 MB
> >> node 1 cpus: 4 5 6 7
> >> node 1 size: 424 MB
> >> node 1 free: 408 MB
> >> node distances:
> >> node   0   1
> >>   0:  10  20
> >>   1:  20  10
> >> # numactl -show
> >> policy: default
> >> preferred node: current
> >> physcpubind: 0 1 2 3 4 5 6 7
> >> cpubind: 0 1
> >> nodebind: 0 1
> >> membind: 0 1
> >>
> >> The patches are also available at
> >> https://github.com/atishp04/linux/tree/5.11_numa_unified_v5
> >>
> >> For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
> >> https://patchwork.kernel.org/project/qemu-devel/list/?series=303313
> >>
> >> Testing:
> >> RISC-V:
> >> Tested in Qemu and 2 socket OmniXtend FPGA.
> >>
> >> ARM64:
> >> 2 socket kunpeng920 (4 nodes around 250G a node)
> >> Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >>
> >> Changes from v4->v5:
> >> 1. Added by Acked-by & Reviewed-by tags.
> >> 2. Swapped patch 1 & 2 in v4 version.
> >>
> >> Changes from v3->v4:
> >> 1. Removed redundant duplicate header.
> >> 2. Added Reviewed-by tags.
> >>
> >> Changes from v2->v3:
> >> 1. Added Acked-by/Reviewed-by tags.
> >> 2. Replaced asm/acpi.h with linux/acpi.h
> >> 3. Defined arch_acpi_numa_init as static.
> >>
> >> Changes from v1->v2:
> >> 1. Replaced ARM64 specific compile time protection with ACPI specific ones.
> >> 2. Dropped common pcibus_to_node changes. Added required changes in RISC-V.
> >> 3. Fixed few typos.
> >>
> >> Atish Patra (4):
> >> arm64, numa: Change the numa init functions name to be generic
> >> numa: Move numa implementation to common code
> >> riscv: Separate memory init from paging init
> >> riscv: Add numa support for riscv64 platform
> >>
> >> Greentime Hu (1):
> >> riscv: Add support pte_protnone and pmd_protnone if
> >> CONFIG_NUMA_BALANCING
> >>
> >> arch/arm64/Kconfig                            |  1 +
> >> arch/arm64/include/asm/numa.h                 | 48 +----------------
> >> arch/arm64/kernel/acpi_numa.c                 | 12 -----
> >> arch/arm64/mm/Makefile                        |  1 -
> >> arch/arm64/mm/init.c                          |  4 +-
> >> arch/riscv/Kconfig                            | 31 ++++++++++-
> >> arch/riscv/include/asm/mmzone.h               | 13 +++++
> >> arch/riscv/include/asm/numa.h                 |  8 +++
> >> arch/riscv/include/asm/pci.h                  | 14 +++++
> >> arch/riscv/include/asm/pgtable.h              | 21 ++++++++
> >> arch/riscv/kernel/setup.c                     | 11 +++-
> >> arch/riscv/kernel/smpboot.c                   | 12 ++++-
> >> arch/riscv/mm/init.c                          | 10 +++-
> >> drivers/base/Kconfig                          |  6 +++
> >> drivers/base/Makefile                         |  1 +
> >> .../mm/numa.c => drivers/base/arch_numa.c     | 27 ++++++++--
> >> include/asm-generic/numa.h                    | 52 +++++++++++++++++++
> >> 17 files changed, 200 insertions(+), 72 deletions(-)
> >> create mode 100644 arch/riscv/include/asm/mmzone.h
> >> create mode 100644 arch/riscv/include/asm/numa.h
> >> rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (96%)
> >> create mode 100644 include/asm-generic/numa.h
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> > Hey Palmer,
> > I did not see this series in for-next. Let me know if you need
> > anything else to be done for this series.
>
> Sorry about that.  It's on for-next, with Randy's comment addressed.  There was
> one merge conflict: we don't have resource_init() in for-next yet (which I
> think means I missed something else).

resource_init is changed to init_resource and moved to setup.c in the
following patch which was merged in 5.11 MW.
00ab027a3b82 RISC-V: Add kernel image sections to the resource tree

IDK if that's necessary for the NUMA
> stuff, I just dropped it.  I haven't tested this yet.



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
