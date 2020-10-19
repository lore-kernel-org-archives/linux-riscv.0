Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EACC433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 21:29:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5909C2231B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 21:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chRuPDQK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="IIzfpDad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5909C2231B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iuRrhGa4ugE5Z8F7ETpfQHtU7K6oMD8n2Yo7tHCtFUk=; b=chRuPDQKiMCMZOT6ndl6CdDul
	jCICVf39AtgSmkjK+lxfud6sys0A9KIDPhC2wqKDaPM0ZY+StaQBbpHFERTRx6pS1Zp+nMnslmt52
	e27NC/gR9/eU1Ct1S6I0AjGOUHwg1cKgKBnFO6v42ONBDU3x6gmj/pLumnmv5n/Baap6FxZQQxM5T
	tYnxZei8921qaJmiwXXfpR4QgDIMB30uJxaVfioy2+4CfAs7ycabRR6Hh2SLtTKlM1cplizky2tGd
	4dNs/txpI++SF8zjGuMc9u0+Nh3JeVuAZkMvO6976tTrsHAsxyiUqjoFM2/Mj5kOjQzc7fvbgo76w
	ks9Se6jrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUcih-0000nY-31; Mon, 19 Oct 2020 21:29:31 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUcid-0000mg-Lt
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 21:29:29 +0000
Received: by mail-pl1-x643.google.com with SMTP id o9so467211plx.10
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZfDVboFUi3PL20oeahZURT/wAnBCLrU/u8rK/q4mNM4=;
 b=IIzfpDadzNjwKyZ5cvtnhOoML0jGSc4vEqrP+U3PY2m/SaTdm71GVeNequFbvKgRqG
 R1HDGwHlE2x4D6ZN+qrYkllFLT/Uv1+xCZhAbo001dGropx1jl9T4PAFsIwWYTgSRzqJ
 cYdb+6l58JjznjXjuVtb3msoZ0nHhnscoaZRa/jAb1y9QU6IqIO/qnADwyjkbUHTKh11
 JqAT31AjB+RRopsIChKWzeBjdO1DI0Sn4uxlOdhoVLaTQOzcEHlt1gqTqT5QK63AqXf+
 e2y7xwogZ3kbRGF5MbtFLvufZTnQVBnLLlk3leJqxGX165FfHcsnyUYECj2C5CTVcB6E
 qTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZfDVboFUi3PL20oeahZURT/wAnBCLrU/u8rK/q4mNM4=;
 b=HaSeO8fNv8M62oQiXEVdWFh7nAHIiYttjODxzPs7t+9ghh3zZsfwAdkOs5JevFFsG6
 uX9QY5wMtz0a7XZpnqNfoQSDJZ8EbeMrKU833QAEPIPOA7zkLeM3DONtpmvAOCnFgsgU
 BaEzIUUDH73+traE0axH3mXsVq/XU+X2UJG+4hfQl8v58IYz4Grr9Uy9NzQjJFyEwDEE
 XTbHD5RFYY6+1wPB5t6ZqTgQkkQjIy8dJvN0d/Y62g+kIhxMpiyLOECT5KgBW7mpzUpA
 VLDLavOI9L6BDM6/Rz43qoILnHg3Z2hp7fz6WmVtqNZHpWSJwk39Y6mg66iqV35kekAj
 bO/w==
X-Gm-Message-State: AOAM532hCKWEzLZWbvOVPlM+KZYp5ca4Qh13HAj7lr4kP+YOsRqe9Fon
 fXfZHUrS0fGLlslRGzku7Zjs+Q==
X-Google-Smtp-Source: ABdhPJzVaGDA6wX2KJ6cd/pzhLTg3CGDeACAttfyO3vDd6Mgdnf5ad6gmSm7BQSW4xbE8phWqISXyQ==
X-Received: by 2002:a17:902:6845:b029:d4:d1d5:2139 with SMTP id
 f5-20020a1709026845b02900d4d1d52139mr1779774pln.53.1603142965213; 
 Mon, 19 Oct 2020 14:29:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j23sm478919pgh.31.2020.10.19.14.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:29:24 -0700 (PDT)
Date: Mon, 19 Oct 2020 14:29:24 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 14:29:23 PDT (-0700)
Subject: Re: [PATCH v4 0/5] Unify NUMA implementation between ARM64 & RISC-V
In-Reply-To: <CAOnJCULba4qEO-8MmTDw5rWBep9mPUdq-iA-UpBN=-SXB13nmg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-c28b83e1-43b5-4798-8f9e-da7292fa8d12@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_172927_800477_2ED2CEF8 
X-CRM114-Status: GOOD (  26.98  )
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
Cc: wangkefeng.wang@huawei.com, david@redhat.com, catalin.marinas@arm.com,
 Jonathan.Cameron@huawei.com, Atish Patra <Atish.Patra@wdc.com>,
 zong.li@sifive.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arch@vger.kernel.org, justin.he@arm.com, anup@brainfault.org,
 rafael@kernel.org, steven.price@arm.com, greentime.hu@sifive.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 anshuman.khandual@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, nsaenzjulienne@suse.de,
 akpm@linux-foundation.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 13:19:35 PDT (-0700), atishp@atishpatra.org wrote:
> On Mon, Oct 5, 2020 at 5:18 PM Atish Patra <atish.patra@wdc.com> wrote:
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
>> https://github.com/atishp04/linux/tree/5.10_numa_unified_v4
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
>> There may be some minor conflicts with Mike's cleanup series [2] depending on the
>> order in which these two series are being accepted. I can rebase on top his series
>> if required.
>>
>> [2] https://lkml.org/lkml/2020/8/18/754
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
>> numa: Move numa implementation to common code
>> arm64, numa: Change the numa init functions name to be generic
>> riscv: Separate memory init from paging init
>> riscv: Add numa support for riscv64 platform
>>
>> Greentime Hu (1):
>> riscv: Add support pte_protnone and pmd_protnone if
>> CONFIG_NUMA_BALANCING
>>
>> arch/arm64/Kconfig                            |  1 +
>> arch/arm64/include/asm/numa.h                 | 45 +----------------
>> arch/arm64/kernel/acpi_numa.c                 | 13 -----
>> arch/arm64/mm/Makefile                        |  1 -
>> arch/arm64/mm/init.c                          |  4 +-
>> arch/riscv/Kconfig                            | 31 +++++++++++-
>> arch/riscv/include/asm/mmzone.h               | 13 +++++
>> arch/riscv/include/asm/numa.h                 |  8 +++
>> arch/riscv/include/asm/pci.h                  | 14 ++++++
>> arch/riscv/include/asm/pgtable.h              | 21 ++++++++
>> arch/riscv/kernel/setup.c                     | 11 ++++-
>> arch/riscv/kernel/smpboot.c                   | 12 ++++-
>> arch/riscv/mm/init.c                          | 10 +++-
>> drivers/base/Kconfig                          |  6 +++
>> drivers/base/Makefile                         |  1 +
>> .../mm/numa.c => drivers/base/arch_numa.c     | 30 ++++++++++--
>> include/asm-generic/numa.h                    | 49 +++++++++++++++++++
>> 17 files changed, 199 insertions(+), 71 deletions(-)
>> create mode 100644 arch/riscv/include/asm/mmzone.h
>> create mode 100644 arch/riscv/include/asm/numa.h
>> rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
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
> Ping ?

This has been at the top of my inbox for a week or two now, I just haven't
gotten around to taking a look yet because of all the other fires going on.
Sorry.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
