Return-Path: <SRS0=RTcI=GM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F31C433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 20:51:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6DC23AC4
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 20:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6DC23AC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=leZsreaSZRGauOlS9DuRpc02wo5WR+CYl+ZAMFtWMZc=; b=hWUjoKLB/dlpJPnzZmOYAECAX
	9RXLfumUvC2L/bX/7A/kpKpTdWe97CbFx3zmN1wHqCcZm1/W/mdcS74ZevCWyx2csTAfL/cWTiRV6
	MSzCaZnD0EigOEjZmzrpVF4G5stc3W9IGxuFz9YGWcaB3ygvluwi3myzRwkRCWMAuzvn85VxI3enL
	LpqctfynRHD1Ci9/j6siZa3WS9TXjlpvgDz649TP6DxNR0AczGHnromiTXl7x4IeTPWv9jem6hdt7
	yq2DT4zaPNUzjWX/3LdE7xwnFT7mur8+XmB4E2IGJ8KQ65R7ozWGTN9gB+ozpD8QWCD/pqw5b/hzb
	PEjd1K7rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyLCl-0001aw-Sa; Sat, 09 Jan 2021 20:51:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyLCg-0001ZJ-IS
 for linux-riscv@lists.infradead.org; Sat, 09 Jan 2021 20:51:21 +0000
Received: by mail-pf1-x429.google.com with SMTP id h186so8536174pfe.0
 for <linux-riscv@lists.infradead.org>; Sat, 09 Jan 2021 12:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=62H/x/rByJ7ggse69TMiJJtItRYsUHxpZdki7cQ0WSY=;
 b=DoveRgb7gXjFv1+ebT4gOVEgstLeS7xoNCzngzTIpcb6n9yiwNrt81KUF+6Amd0gkK
 RGOK1gcWgCICsIv/c4SURHsg8OztnlMoRMvJj1dh4E31jGgzNJHrIsngtGwccM9Jsj4C
 9b9CVH3nW16+SldrGzvq9Ba75tpJeOrozHIVJPhC3hmxCisbOwttLLbPBvaOZBFFGKkD
 XktLpcJcbFL6JN2BGMGY4HrfC6+FDi1WDm1zO9/9mJcqnx7TjtgEp766x1eOWP3DZwCH
 F4ZEalrhwuWiTxNFAId3p3wnknrkMI8Qfo8JUy1Va1ajglff2/EfQinLBe74NKFd7CK9
 M6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=62H/x/rByJ7ggse69TMiJJtItRYsUHxpZdki7cQ0WSY=;
 b=j/SfjXFk9z/e0tm2qv4RooACHJ4z4P+bvvXLDL+bv7gdMQIMxkLJ4616G06BW1B8Fg
 OMbk4kK3ovvKUO+UJVb8mGQh/hmsQxs4BZrrJlbGQbvrtljVC/JMiMcmYvyRdzjz+GRV
 Ww+LNlkjxCeuIO+wKSRUSsOC0sPn6zE+C8nWwzpdAKrJClO+TQdUBKiQWwwipLXlcqAf
 eJEmIe71d/ReLAuY4sxF16fTIS+pbDylcnIYLMoPQuphGrgUeHp9VgbOdx34I6zx5Y3R
 Wl+Tc7iyaJU536PBnV4ZP0Bo3zrcqvOO02STr1tMycI+RgEd6S/FnhsFYWEEULSCalv/
 G+Hg==
X-Gm-Message-State: AOAM531FWyKOf7YsGK+A+vDcu87P7+MLKFvGzVtBbtkZ2x40D6g5r2fs
 6MwpIfTuKTBDXSNUf0P3pMadoA==
X-Google-Smtp-Source: ABdhPJzvQxmL/8rMOc/FYAbYs90guGWjhjVKrS4AG8vAK2ohMHxboO5/LTHzyHEKf2KsQsS1OtwLHQ==
X-Received: by 2002:a63:e:: with SMTP id 14mr13053823pga.253.1610225475399;
 Sat, 09 Jan 2021 12:51:15 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z13sm9312972pjt.45.2021.01.09.12.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 12:51:14 -0800 (PST)
Date: Sat, 09 Jan 2021 12:51:14 -0800 (PST)
X-Google-Original-Date: Sat, 09 Jan 2021 12:51:12 PST (-0800)
Subject: Re: [PATCH v5 0/5] Unify NUMA implementation between ARM64 & RISC-V
In-Reply-To: <CAOnJCULPCxhirYH8xCciKDNJ=zfWKwiOOfAoT8QQBOKqTuWuTA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-94c90991-c4e8-49fe-a225-854ae0343d8d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_155118_840763_83EAEF15 
X-CRM114-Status: GOOD (  26.69  )
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
Cc: rafael@kernel.org, catalin.marinas@arm.com, Jonathan.Cameron@huawei.com,
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org,
 liuzhengyuan@tj.kylinos.cn, bhe@redhat.com, anup@brainfault.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, greentime.hu@sifive.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 anshuman.khandual@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 13 Dec 2020 17:02:19 PST (-0800), atishp@atishpatra.org wrote:
> On Wed, Nov 18, 2020 at 4:39 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> This series attempts to move the ARM64 numa implementation to common
>> code so that RISC-V can leverage that as well instead of reimplementing
>> it again.
>>
>> RISC-V specific bits are based on initial work done by Greentime Hu [1] but
>> modified to reuse the common implementation to avoid duplication.
>>
>> [1] https://lkml.org/lkml/2020/1/10/233
>>
>> This series has been tested on qemu with numa enabled for both RISC-V & ARM64.
>> It would be great if somebody can test it on numa capable ARM64 hardware platforms.
>> This patch series doesn't modify the maintainers list for the common code (arch_numa)
>> as I am not sure if somebody from ARM64 community or Greg should take up the
>> maintainership. Ganapatrao was the original author of the arm64 version.
>> I would be happy to update that in the next revision once it is decided.
>>
>> # numactl --hardware
>> available: 2 nodes (0-1)
>> node 0 cpus: 0 1 2 3
>> node 0 size: 486 MB
>> node 0 free: 470 MB
>> node 1 cpus: 4 5 6 7
>> node 1 size: 424 MB
>> node 1 free: 408 MB
>> node distances:
>> node   0   1
>>   0:  10  20
>>   1:  20  10
>> # numactl -show
>> policy: default
>> preferred node: current
>> physcpubind: 0 1 2 3 4 5 6 7
>> cpubind: 0 1
>> nodebind: 0 1
>> membind: 0 1
>>
>> The patches are also available at
>> https://github.com/atishp04/linux/tree/5.11_numa_unified_v5
>>
>> For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
>> https://patchwork.kernel.org/project/qemu-devel/list/?series=303313
>>
>> Testing:
>> RISC-V:
>> Tested in Qemu and 2 socket OmniXtend FPGA.
>>
>> ARM64:
>> 2 socket kunpeng920 (4 nodes around 250G a node)
>> Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>
>> Changes from v4->v5:
>> 1. Added by Acked-by & Reviewed-by tags.
>> 2. Swapped patch 1 & 2 in v4 version.
>>
>> Changes from v3->v4:
>> 1. Removed redundant duplicate header.
>> 2. Added Reviewed-by tags.
>>
>> Changes from v2->v3:
>> 1. Added Acked-by/Reviewed-by tags.
>> 2. Replaced asm/acpi.h with linux/acpi.h
>> 3. Defined arch_acpi_numa_init as static.
>>
>> Changes from v1->v2:
>> 1. Replaced ARM64 specific compile time protection with ACPI specific ones.
>> 2. Dropped common pcibus_to_node changes. Added required changes in RISC-V.
>> 3. Fixed few typos.
>>
>> Atish Patra (4):
>> arm64, numa: Change the numa init functions name to be generic
>> numa: Move numa implementation to common code
>> riscv: Separate memory init from paging init
>> riscv: Add numa support for riscv64 platform
>>
>> Greentime Hu (1):
>> riscv: Add support pte_protnone and pmd_protnone if
>> CONFIG_NUMA_BALANCING
>>
>> arch/arm64/Kconfig                            |  1 +
>> arch/arm64/include/asm/numa.h                 | 48 +----------------
>> arch/arm64/kernel/acpi_numa.c                 | 12 -----
>> arch/arm64/mm/Makefile                        |  1 -
>> arch/arm64/mm/init.c                          |  4 +-
>> arch/riscv/Kconfig                            | 31 ++++++++++-
>> arch/riscv/include/asm/mmzone.h               | 13 +++++
>> arch/riscv/include/asm/numa.h                 |  8 +++
>> arch/riscv/include/asm/pci.h                  | 14 +++++
>> arch/riscv/include/asm/pgtable.h              | 21 ++++++++
>> arch/riscv/kernel/setup.c                     | 11 +++-
>> arch/riscv/kernel/smpboot.c                   | 12 ++++-
>> arch/riscv/mm/init.c                          | 10 +++-
>> drivers/base/Kconfig                          |  6 +++
>> drivers/base/Makefile                         |  1 +
>> .../mm/numa.c => drivers/base/arch_numa.c     | 27 ++++++++--
>> include/asm-generic/numa.h                    | 52 +++++++++++++++++++
>> 17 files changed, 200 insertions(+), 72 deletions(-)
>> create mode 100644 arch/riscv/include/asm/mmzone.h
>> create mode 100644 arch/riscv/include/asm/numa.h
>> rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (96%)
>> create mode 100644 include/asm-generic/numa.h
>>
>> --
>> 2.25.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Hey Palmer,
> I did not see this series in for-next. Let me know if you need
> anything else to be done for this series.

Sorry about that.  It's on for-next, with Randy's comment addressed.  There was
one merge conflict: we don't have resource_init() in for-next yet (which I
think means I missed something else).  IDK if that's necessary for the NUMA
stuff, I just dropped it.  I haven't tested this yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
