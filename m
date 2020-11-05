Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF7BC4741F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:07:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF3A20709
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:07:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KyhjZV8N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="cvZYUkjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF3A20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=m2RPdrv+7bvXgevG+cT8o4eAtDfUyPKjUJ/jxc2m/+4=; b=KyhjZV8Nw3yb+2Nbqp+DPFWip
	syAGpn73CIXBmjwbkx8xiZcs1obDY8WsXaS6lX00uRH3RN0/ER+sSMCJfIr7vJ9xI07v+tWEFxYf/
	YUhbDpym4OhwsO443A+vX4bx+0meBMsvyORR+lMvniTE3G9EhjOLRCTvrfYGSk5H1cDt9hUHoowR5
	NBMLTO4VPCl1Q6nNVTF0/dOTf6oHifuXdMOCvUL9BUE+JLBMugy5COkKl+VRZCMWxx/0CFxetSEUs
	YXyLb+gvHcTZ/QPir/Ry00LvW++aMok1I1tRHV4+5ZlaimqL78jirTS2di1hXmuMLWu+Gzxf6vtdZ
	MQgr7Zhmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kajf9-0005BV-IW; Thu, 05 Nov 2020 18:07:07 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kajf5-00059Q-Mq
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 18:07:05 +0000
Received: by mail-pg1-x543.google.com with SMTP id f38so1901281pgm.2
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=evErAM+3R8POckj6BoWNfzcQKezQH3REiwTi+k5Ke30=;
 b=cvZYUkjBWInIl2l1mjIWf1vI7V8s6znitGQb6c5FeaYxHv0JPbh4k6w9pz9IC9AVgi
 gDivP8WJC+El0KFshMutO5n1YhCRHEIxrqzYwu6bCUnrciwL9E/9tGm25eHqZdW/XI91
 T59XUK3EUSN6RVDl9mXW4WPshbsdGRiNI8znzVKFYGQbhx9IrGxgBTrOhued5XD/a+Rl
 jGfmJLxTf7oGVAKBpYdYB481ef3UnuDvjfFSwTdh0stV94i0MsDhYbrVvvmy+VsOz+Ip
 B26F8d2w0VLVBJD8zghUyljlnVXk+Mse1xJEVITFTDvRgVup52j0H2KEoatpkwDS97+8
 tARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=evErAM+3R8POckj6BoWNfzcQKezQH3REiwTi+k5Ke30=;
 b=jD/+Q8WuZRqEeA3rRLmg3BIcjP3UXkIN3pfns98Bxx7eRloVQKdAF7I4XYlJUu/ydJ
 CzDNi/xJ6sercVmQWkkVk3xoTo/p0dCdYZGrwtje9Wr693E7JvY5AAENWv+L90H/+wWd
 4NyBkb9BS9NzPyZyHEhEhwSUuiW8KAFIdwMZibeghk7bgMWCjOGQqNkOJ/GR9yNxhrnm
 AmeYMp48Xaw8tXubEBLI5W9tyKjhtHZu2yJWSvV16z/d7BMm7owYSW9ghC+HT9b6HQ5G
 XwusAY8EsOiqlFuHEv4L/2YPPfODPzz9IBwbVqudiXYJJkj7ExrzVbT3KVsXVkJT9bLR
 HqPw==
X-Gm-Message-State: AOAM532UlPgi7z/Uwo5l+x3l25mrjOqIzSHubtYJFbaoVfGMpHqco4uV
 eLjVI4igAuYerNmzZgZtjxJKcw==
X-Google-Smtp-Source: ABdhPJyRc3dpCSILr1s7f7biptBWJz9+L1an7mUZwA/tps7uFu35JlM1E3LkORf3mPe7ALBUxC60+A==
X-Received: by 2002:aa7:9607:0:b029:155:2b85:93f5 with SMTP id
 q7-20020aa796070000b02901552b8593f5mr3642353pfg.36.1604599621026; 
 Thu, 05 Nov 2020 10:07:01 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b16sm3180544pju.16.2020.11.05.10.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:07:00 -0800 (PST)
Date: Thu, 05 Nov 2020 10:07:00 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 09:33:55 PST (-0800)
Subject: Re: [PATCH v4 0/5] Unify NUMA implementation between ARM64 & RISC-V
In-Reply-To: <20201006001752.248564-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>, Will Deacon <willdeacon@google.com>,
 maz@kernel.org
Message-ID: <mhng-6971ba28-0cea-42bc-a26c-c23b9ba2af9e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_130703_766722_AC59EF0F 
X-CRM114-Status: GOOD (  36.20  )
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
 linux-kernel@vger.kernel.org, rppt@kernel.org, akpm@linux-foundation.org,
 nsaenzjulienne@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 17:17:47 PDT (-0700), Atish Patra wrote:
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
> https://github.com/atishp04/linux/tree/5.10_numa_unified_v4
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
> There may be some minor conflicts with Mike's cleanup series [2] depending on the
> order in which these two series are being accepted. I can rebase on top his series
> if required.
>
> [2] https://lkml.org/lkml/2020/8/18/754
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
> numa: Move numa implementation to common code
> arm64, numa: Change the numa init functions name to be generic
> riscv: Separate memory init from paging init
> riscv: Add numa support for riscv64 platform
>
> Greentime Hu (1):
> riscv: Add support pte_protnone and pmd_protnone if
> CONFIG_NUMA_BALANCING
>
> arch/arm64/Kconfig                            |  1 +
> arch/arm64/include/asm/numa.h                 | 45 +----------------
> arch/arm64/kernel/acpi_numa.c                 | 13 -----
> arch/arm64/mm/Makefile                        |  1 -
> arch/arm64/mm/init.c                          |  4 +-
> arch/riscv/Kconfig                            | 31 +++++++++++-
> arch/riscv/include/asm/mmzone.h               | 13 +++++
> arch/riscv/include/asm/numa.h                 |  8 +++
> arch/riscv/include/asm/pci.h                  | 14 ++++++
> arch/riscv/include/asm/pgtable.h              | 21 ++++++++
> arch/riscv/kernel/setup.c                     | 11 ++++-
> arch/riscv/kernel/smpboot.c                   | 12 ++++-
> arch/riscv/mm/init.c                          | 10 +++-
> drivers/base/Kconfig                          |  6 +++
> drivers/base/Makefile                         |  1 +
> .../mm/numa.c => drivers/base/arch_numa.c     | 30 ++++++++++--
> include/asm-generic/numa.h                    | 49 +++++++++++++++++++
> 17 files changed, 199 insertions(+), 71 deletions(-)
> create mode 100644 arch/riscv/include/asm/mmzone.h
> create mode 100644 arch/riscv/include/asm/numa.h
> rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
> create mode 100644 include/asm-generic/numa.h

Sorry it took me a while to get around to this, I had some work stuff to deal
with and have managed to get buried in email.  This all looks fine to me, but
the way it's structured make it kind of hard to apply -- essentially I can't
take the first two without at least some Acks from the arm64 folks, and it
smells to me like it'd be better to have those go through the arm64 tree.  The
RISC-V stuff isn't that heavywight, but I'd like it to at least land in my
for-next at some point as otherwise it'll be completely untested.

arm64 guys: do you want to try and do some sort of shared base tag sort of
thing for these, or do you want me to refactor this such that it adds the
generic stuff before removing the arm64 stuff so we can decouble that way?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
