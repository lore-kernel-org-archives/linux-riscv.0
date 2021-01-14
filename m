Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC676C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:22:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9FBB238E7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9FBB238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=O7eVlLzNAdD6cZ2LV4+3HVxEGYZURNezvCN5vQHyUdY=; b=utO7hmrCfJQNv40e2GHQsB8XW
	dakpx5Ns84crYsN0wk7r5hn6JgKuBlU9NAm3kiYhvJEBnfZdPgT9CewznnKRneM6QQkWmPm8xrL/D
	0ncY9Su85c8ZbA+JL/3lPvKvJVqsGKNFuy94K71DfEdLzHuCe8HoH+bWChFwAv29SkCv/h5dAJRVm
	07Z6ZvVfwQGAsT/Iq+puWLrfxgTs6EXS8k0duekjz5F+IoP9Fj5uPXAE/WQG2ZvIprfQ+XkCxtPxv
	q/4MD4pd5nttyCz5aR2gWeFKZUn7mwp95qlhnLWN/mbTjGTVmdcO0vAaQHVErwqWu54L3tyurdLpM
	KsDNBOi5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzv4s-0003sy-Kd; Thu, 14 Jan 2021 05:21:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzv4n-0003rt-FE
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 05:21:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d4so2336561plh.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 21:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dSai6iPBy5GOPDDnJmUw+Dep5lqLN0apCZM1NIECn6w=;
 b=Z9kw/dgGpDfKf6drcfBTl9HA7hYqlue69fbt8q81Hskf1Zt1m+/hcgNtdYUfC9ABGH
 rqjqSbr/e3NOqpzFUiB10YWLn65uTl7/ClX2fIYNDjDmEH/fQ2LowsXdbeOe7OHgIgpu
 w1kwu+nlr51EuFu9rC9YqBpvLSzIqxdlNh+dM269of29OOT/I8/EJ5eY1O80Iy1d84Uf
 jaYuI3NDGsJPEnafqFnxyzYFl+P0/xXCn2rrsJVeRggnLIFMgNboy/7YwnGMcVR308lJ
 CjNNBax0UoSoZQKc8PvGfgoIWzwzHrhBPBJ64iVFVN0Rx9ByqfO4jJGemlZziLtykF/M
 15mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dSai6iPBy5GOPDDnJmUw+Dep5lqLN0apCZM1NIECn6w=;
 b=uFnVv+FavPOcmcTsU0fggJiOK/6p4lZi+6fcvOOnJWI27AMlGTYzmctFcOhPNLSkKK
 4d8mggMWZlXBa9gfmxGQLO1TkPHtxk3FLP8R5S3k12lnuzVn7w/UcZRph/ZWc4lqFHdV
 W/PqZOuJxCy075TGIkfa/5Agjcfkw0vMz2Ug7M8oXQ3GEIdp6qj1YCpTfiqlI+QKzG5K
 EL0NscM3yhafH0s7aqWMfN7oZqUm65JMVnudl877BT7cbEN1GjlmG7MqT15udJPmC6AW
 0tzyNY0/OOho3DWi1lBV7q6KpBln4A4/UBI+OEf4/PxLO5YtZNlDL/tYqgZT+zQDeSFU
 hKMA==
X-Gm-Message-State: AOAM532j/M9CtT+om/P/YY3AxGYxdkdR9VpclKAim7JPJq3r4/f0sA5f
 HhwflX2pEAqmSJwG0KDfnozefg==
X-Google-Smtp-Source: ABdhPJzftb4hm1KpIPbHySW6VDs66gZk4k12vOhzyy3pxiqoAT9//sHcwcXIMGLCNEsyrT3stfkrUg==
X-Received: by 2002:a17:90b:8cb:: with SMTP id
 ds11mr3201447pjb.208.1610601699133; 
 Wed, 13 Jan 2021 21:21:39 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n4sm4009507pfu.150.2021.01.13.21.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 21:21:38 -0800 (PST)
Date: Wed, 13 Jan 2021 21:21:38 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2021 21:21:37 PST (-0800)
Subject: Re: [PATCH v5 0/5] Unify NUMA implementation between ARM64 & RISC-V
In-Reply-To: <CAOnJCUJq5e7W1UXkFFMkKje_BTedekoUT=32ia6t+Sc4UVDhEQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-e9591590-a6e1-41b1-ae48-1987bba7c828@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_002141_572385_20D65FD7 
X-CRM114-Status: GOOD (  32.22  )
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

On Mon, 11 Jan 2021 11:31:11 PST (-0800), atishp@atishpatra.org wrote:
> On Sat, Jan 9, 2021 at 12:51 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Sun, 13 Dec 2020 17:02:19 PST (-0800), atishp@atishpatra.org wrote:
>> > On Wed, Nov 18, 2020 at 4:39 PM Atish Patra <atish.patra@wdc.com> wrote:
>> >>
>> >> This series attempts to move the ARM64 numa implementation to common
>> >> code so that RISC-V can leverage that as well instead of reimplementing
>> >> it again.
>> >>
>> >> RISC-V specific bits are based on initial work done by Greentime Hu [1] but
>> >> modified to reuse the common implementation to avoid duplication.
>> >>
>> >> [1] https://lkml.org/lkml/2020/1/10/233
>> >>
>> >> This series has been tested on qemu with numa enabled for both RISC-V & ARM64.
>> >> It would be great if somebody can test it on numa capable ARM64 hardware platforms.
>> >> This patch series doesn't modify the maintainers list for the common code (arch_numa)
>> >> as I am not sure if somebody from ARM64 community or Greg should take up the
>> >> maintainership. Ganapatrao was the original author of the arm64 version.
>> >> I would be happy to update that in the next revision once it is decided.
>> >>
>> >> # numactl --hardware
>> >> available: 2 nodes (0-1)
>> >> node 0 cpus: 0 1 2 3
>> >> node 0 size: 486 MB
>> >> node 0 free: 470 MB
>> >> node 1 cpus: 4 5 6 7
>> >> node 1 size: 424 MB
>> >> node 1 free: 408 MB
>> >> node distances:
>> >> node   0   1
>> >>   0:  10  20
>> >>   1:  20  10
>> >> # numactl -show
>> >> policy: default
>> >> preferred node: current
>> >> physcpubind: 0 1 2 3 4 5 6 7
>> >> cpubind: 0 1
>> >> nodebind: 0 1
>> >> membind: 0 1
>> >>
>> >> The patches are also available at
>> >> https://github.com/atishp04/linux/tree/5.11_numa_unified_v5
>> >>
>> >> For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
>> >> https://patchwork.kernel.org/project/qemu-devel/list/?series=303313
>> >>
>> >> Testing:
>> >> RISC-V:
>> >> Tested in Qemu and 2 socket OmniXtend FPGA.
>> >>
>> >> ARM64:
>> >> 2 socket kunpeng920 (4 nodes around 250G a node)
>> >> Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> >>
>> >> Changes from v4->v5:
>> >> 1. Added by Acked-by & Reviewed-by tags.
>> >> 2. Swapped patch 1 & 2 in v4 version.
>> >>
>> >> Changes from v3->v4:
>> >> 1. Removed redundant duplicate header.
>> >> 2. Added Reviewed-by tags.
>> >>
>> >> Changes from v2->v3:
>> >> 1. Added Acked-by/Reviewed-by tags.
>> >> 2. Replaced asm/acpi.h with linux/acpi.h
>> >> 3. Defined arch_acpi_numa_init as static.
>> >>
>> >> Changes from v1->v2:
>> >> 1. Replaced ARM64 specific compile time protection with ACPI specific ones.
>> >> 2. Dropped common pcibus_to_node changes. Added required changes in RISC-V.
>> >> 3. Fixed few typos.
>> >>
>> >> Atish Patra (4):
>> >> arm64, numa: Change the numa init functions name to be generic
>> >> numa: Move numa implementation to common code
>> >> riscv: Separate memory init from paging init
>> >> riscv: Add numa support for riscv64 platform
>> >>
>> >> Greentime Hu (1):
>> >> riscv: Add support pte_protnone and pmd_protnone if
>> >> CONFIG_NUMA_BALANCING
>> >>
>> >> arch/arm64/Kconfig                            |  1 +
>> >> arch/arm64/include/asm/numa.h                 | 48 +----------------
>> >> arch/arm64/kernel/acpi_numa.c                 | 12 -----
>> >> arch/arm64/mm/Makefile                        |  1 -
>> >> arch/arm64/mm/init.c                          |  4 +-
>> >> arch/riscv/Kconfig                            | 31 ++++++++++-
>> >> arch/riscv/include/asm/mmzone.h               | 13 +++++
>> >> arch/riscv/include/asm/numa.h                 |  8 +++
>> >> arch/riscv/include/asm/pci.h                  | 14 +++++
>> >> arch/riscv/include/asm/pgtable.h              | 21 ++++++++
>> >> arch/riscv/kernel/setup.c                     | 11 +++-
>> >> arch/riscv/kernel/smpboot.c                   | 12 ++++-
>> >> arch/riscv/mm/init.c                          | 10 +++-
>> >> drivers/base/Kconfig                          |  6 +++
>> >> drivers/base/Makefile                         |  1 +
>> >> .../mm/numa.c => drivers/base/arch_numa.c     | 27 ++++++++--
>> >> include/asm-generic/numa.h                    | 52 +++++++++++++++++++
>> >> 17 files changed, 200 insertions(+), 72 deletions(-)
>> >> create mode 100644 arch/riscv/include/asm/mmzone.h
>> >> create mode 100644 arch/riscv/include/asm/numa.h
>> >> rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (96%)
>> >> create mode 100644 include/asm-generic/numa.h
>> >>
>> >> --
>> >> 2.25.1
>> >>
>> >>
>> >> _______________________________________________
>> >> linux-riscv mailing list
>> >> linux-riscv@lists.infradead.org
>> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
>> >
>> > Hey Palmer,
>> > I did not see this series in for-next. Let me know if you need
>> > anything else to be done for this series.
>>
>> Sorry about that.  It's on for-next, with Randy's comment addressed.  There was
>> one merge conflict: we don't have resource_init() in for-next yet (which I
>> think means I missed something else).
>
> resource_init is changed to init_resource and moved to setup.c in the
> following patch which was merged in 5.11 MW.
> 00ab027a3b82 RISC-V: Add kernel image sections to the resource tree

Ah, great, for some reason I thought we hadn't merged those yet.

>> IDK if that's necessary for the NUMA
>> stuff, I just dropped it.  I haven't tested this yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
