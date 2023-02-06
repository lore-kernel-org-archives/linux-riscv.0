Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4036AC636D3
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dydg2WZ8xBRGjs4+BusZGuWwUXTwHPtDaNBAidTVduM=; b=DWweIc7U3+0hy5
	uvNEdL9fqoI4upfvotywjcMIHkvBismadT3McW7q6S0IrdvcA/7mmk3oyX8P4pRsqj77GphDZ8sen
	LCxOmPIAa4kPkqL3CQgEMJILuxF3NU2dcdvkGSw1HLmfTtj9aGr+qboIoC1pi4DFMRSf9tiSiVq0/
	01lVwelf6vVRcUqvGLMtdjp1k8bYV4gkeJPNZns4kUV4Vqr4WRMNXUHr2JVvaG7EQiGo2j+Yb/2/W
	NmLB2lAcVFJ9RBp80w1+L1D5M8FfFW0psypFlzgtK2FJIvntooVqLVztCD2POgaKOPuXpLuTH/wsu
	DBTvEfOTvZzXELWL8MqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP50f-009PpT-67; Mon, 06 Feb 2023 17:10:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP50c-009PoH-4w
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 17:10:27 +0000
Received: by mail-ej1-x62d.google.com with SMTP id mf7so36150201ejc.6
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 09:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s+7Z2cOA9b/F6NBgvxsrcP4ZS7u9jEZz7dS0YggiAC8=;
        b=klRJCUB3P8jvqG1L4PMKVvOqYsS3ZL0aav/DUYxRDN9vC/Z7eMeNmA+4mKPkNolFi4
         31NWphbtNJEmXTfksusWa0Y1Rd/6Z6wlk5LsdZDBYr6aqp42FFwOE9FH3BtNyIwZGIUT
         6bnjyHzW01Mpnj36PY7gXFKetFHKu+fy8mC3MDQAQFPbFq01d4mz3/HD2iOjpWKpouCD
         6p+X2CQIL5YdagBuKABInsUTjHPal/zxL7R6Qt9iHGDFsnQVRKSFSxztufOMR7aaCSD/
         qVrMdZVI+JE3bzj9kTO9TwLBP8uwHwqRXTQWzbAt3xeqkCL0UarUj6th2QlpKvsxIuQW
         EU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+7Z2cOA9b/F6NBgvxsrcP4ZS7u9jEZz7dS0YggiAC8=;
        b=tIoezXNMhk5uHQNu+JhnGjYMs7vKUeqP/iKhPpoUdWyTnGtAytsFfGbgym470NlGaG
         thlenBKI4twGRptJnfr9Opf3wcJ1xjhujRGoVN/PMX7odeqjneGFQVj66r6vizreLwT1
         EG0kuUTKYyxEzm4IXxAYRg9C/l2FVm7t3oz9RwHFwZdVHFjVtc4/oIAKwlvscDHLKhi2
         Xx13CFM4hcJ7Hb4XMqYcJXmo8a2JVhSJrXg3PM353mYhjEUcRE0WMjLvzx08c8xGFk9L
         c5CTx82RAcqMPNJ3igj/8y4qwFsplbHqH85Kec6K5Iysdy8sdqDG80PcD3sZSj5lKYPe
         WuHQ==
X-Gm-Message-State: AO0yUKVnOxidtUhQuNVlUm8jr659GO11hPCkDNwL6jTIXjsmK1XRIK9b
	Zbks2MJxoZYuYJbz1OvGIYp7/Nptx32IwkyEclgYvg==
X-Google-Smtp-Source: AK7set8wMWGnXKm11wWHAFvKfD+LEwczk3Y5c/GytIWCTrE9WAGT3bSIDM5CqHjptGQ/5sn+yXsmmwoOVKL6iiEjV4U=
X-Received: by 2002:a17:906:5945:b0:884:8380:20db with SMTP id
 g5-20020a170906594500b00884838020dbmr5153447ejr.301.1675703423313; Mon, 06
 Feb 2023 09:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20230205011515.1284674-1-atishp@rivosinc.com>
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Feb 2023 22:40:12 +0530
Message-ID: <CAAhSdy1ABfu_=-9NB7C1Pb9NzBpg7D+GA-W3XGLFRO2w=d6bkw@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] KVM perf support
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_091026_217254_96AF3E53 
X-CRM114-Status: GOOD (  24.74  )
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

On Sun, Feb 5, 2023 at 6:45 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This series extends perf support for KVM. The KVM implementation relies
> on the SBI PMU extension and trap n emulation of hpmcounter CSRs.
> The KVM implementation exposes the virtual counters to the guest and internally
> manage the counters using kernel perf counters.
>
> This series doesn't support the counter overflow as the Sscofpmf extension
> doesn't allow trap & emulation mechanism of scountovf CSR yet. The required
> changes to allow that are being under discussions. Supporting overflow interrupt
> also requires AIA interrupt filtering support.
>
> 1. PATCH 1-5 are generic KVM/PMU driver improvements.
> 2. PATCH 9 disables hpmcounter for now. It will be enabled to maintain ABI
> requirement once the ONE reg interface is settled.
>
> perf stat works in kvm guests with this series.
>
> Here is example of running perf stat in a guest running in KVM.
>
> ===========================================================================
> / # /host/apps/perf stat -e instructions -e cycles -e r8000000000000005 \
> > -e r8000000000000006 -e r8000000000000007 -e r8000000000000008 \
> > -e r800000000000000a perf bench sched messaging -g 10 -l 10
>
> # Running 'sched/messaging' benchmark:
> # 20 sender and receiver processes per group
> # 10 groups == 400 processes run
>
>      Total time: 7.769 [sec]
>
>  Performance counter stats for 'perf bench sched messaging -g 10 -l 10':
>
>        73556259604      cycles
>        73387266056      instructions              #    1.00  insn per cycle
>                  0      dTLB-store-misses
>                  0      iTLB-load-misses
>                  0      r8000000000000005
>               2595      r8000000000000006
>               2272      r8000000000000007
>                 10      r8000000000000008
>                  0      r800000000000000a
>
>       12.173720400 seconds time elapsed
>
>        1.002716000 seconds user
>       21.931047000 seconds sys
>
>
> Note: The SBI_PMU_FW_SET_TIMER (eventid : r8000000000000005) is zero
> as kvm guest supports sstc now.
>
> This series can be found here as well.
> https://github.com/atishp04/linux/tree/kvm_perf_v5
>
> TODO:
> 1. Add sscofpmf support.
> 2. Add One reg interface for the following operations:
>         1. Enable/Disable PMU (should it at VM level rather than vcpu ?)
>         2. Number of hpmcounter and width of the counters
>         3. Init PMU
>         4. Allow guest user to access cycle & instret without trapping
> 3. Move counter mask to a bitmask instead of unsigned long so that it can work
>    for RV32 systems where number of total counters are more than 32.
>    This will also accomodate future systems which may define maximum counters
>    to be more than 64.
>
> Changes from v4->v5:
> 1. Few checkpatch --strict error fixes.
> 2. Some other minor nit comment addressed.
> 3. Fixed an issue around counter indexing.
>
> Changes from v3->v4:
> 1. Addressed all the comments on v3.
> 2. Modified the vcpu_pmu_init to void return type.
> 3. Redirect illegal instruction trap to guest for invalid hpmcounter access
>    instead of exiting to the userpsace.
> 4. Got rid of unecessary error messages.
>
> Changes v2->v3:
> 1. Changed the exported functions to GPL only export.
> 2. Addressed all the nit comments on v2.
> 3. Split non-kvm related changes into separate patches.
> 4. Reorgainze the PATCH 11 and 10 based on Drew's suggestions.
>
> Changes from v1->v2:
> 1. Addressed comments from Andrew.
> 2. Removed kvpmu sanity check.
> 3. Added a kvm pmu init flag and the sanity check to probe function.
> 4. Improved the linux vs sbi error code handling.
>
>
> Atish Patra (14):
> perf: RISC-V: Define helper functions expose hpm counter width and
> count
> perf: RISC-V: Improve privilege mode filtering for perf
> RISC-V: Improve SBI PMU extension related definitions
> RISC-V: KVM: Define a probe function for SBI extension data structures
> RISC-V: KVM: Return correct code for hsm stop function
> RISC-V: KVM: Modify SBI extension handler to return SBI error code
> RISC-V: KVM: Add skeleton support for perf
> RISC-V: KVM: Add SBI PMU extension support
> RISC-V: KVM: Make PMU functionality depend on Sscofpmf
> RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
> RISC-V: KVM: Implement trap & emulate for hpmcounters
> RISC-V: KVM: Implement perf support without sampling
> RISC-V: KVM: Support firmware events
> RISC-V: KVM: Increment firmware pmu events

I have queued PATCH1-to-PATCH6 for Linux-6.3

Please send v6 based on riscv_kvm_queue.

Regards,
Anup

>
> arch/riscv/include/asm/kvm_host.h     |   4 +
> arch/riscv/include/asm/kvm_vcpu_pmu.h | 111 +++++
> arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
> arch/riscv/include/asm/sbi.h          |   7 +-
> arch/riscv/kvm/Makefile               |   1 +
> arch/riscv/kvm/main.c                 |   3 +-
> arch/riscv/kvm/tlb.c                  |   4 +
> arch/riscv/kvm/vcpu.c                 |   7 +
> arch/riscv/kvm/vcpu_insn.c            |   4 +-
> arch/riscv/kvm/vcpu_pmu.c             | 627 ++++++++++++++++++++++++++
> arch/riscv/kvm/vcpu_sbi.c             |  72 ++-
> arch/riscv/kvm/vcpu_sbi_base.c        |  27 +-
> arch/riscv/kvm/vcpu_sbi_hsm.c         |  28 +-
> arch/riscv/kvm/vcpu_sbi_pmu.c         |  87 ++++
> arch/riscv/kvm/vcpu_sbi_replace.c     |  50 +-
> arch/riscv/kvm/vcpu_sbi_v01.c         |  17 +-
> drivers/perf/riscv_pmu_sbi.c          |  64 ++-
> include/linux/perf/riscv_pmu.h        |   5 +
> 18 files changed, 1021 insertions(+), 110 deletions(-)
> create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
> create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
