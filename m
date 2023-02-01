Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D87C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sAPhinv/f0M7rpGsOsXLNvd5JznValTEoqm8ILAgyjY=; b=k8RpDUpY+9UWsI
	kBbyyhbYSbJNbRJE9gHmaioYKTVDv4+YhJR4GPsxwt0dpgqy8fL7ljVsmuOEnFZlLSVltfXBgIDfu
	PyR0a2PscCyv3zZ8HG4XBuIkuyuf2YJIkMyz7b+kKqjE98YlXqYyQcJvRqMAPWRwykMv4rr1NtHUl
	4w2i9nO6ZW227Y/aBI97vmwrX1MapvaKbXsg53nfn67Cdqgi4bucTjneEGRjVV5E+7QabI0zuM8ik
	tgp9+w5STFCZvEAEMr+16422CI2ouGvcmL7pxiCtNyTSm5l9TsCdO68or8WuyqsLMf3qMk15vMJzl
	FPNY1nLrURxFX+n+MJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNGi-00DwkC-Fa; Thu, 02 Feb 2023 00:16:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMHs-00DrKg-DV
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 23:13:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so3891389pjq.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tAtzjeHojtEDtxt65Up2XJCtorJ5dH8vJi//jm5SK8=;
        b=T5Tvgujc1usQ+DzfONjL8+ISjVZg2pmf9LFbeyRSHWmvMSr+3r665WHmzPqgbCnRnK
         PYyz9R9udgjzNstYKj7xREH6oiZmyB8YbcCRHXEgBC74F9KuIbHpHuiwq6m28A08m+To
         bfyGwkqJc8412Q6k2kXjX3YT5KWUns6MZfuGHvzZ53CPEzojRhge1w6k7jlo2w2+XSR1
         SJIeN8cukKxDFLD4Lo8KL6VQ1RjSz3YqSd3qpk8wWkcKW2F+Zk9aSn9KiNFREusHTuTj
         /His0UCRUwS2oNFkhqZkCdi6UzJmECRsgnGqyqxJdfjvrP3F/Bfthrk/mHYEmzG1XOqH
         SoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tAtzjeHojtEDtxt65Up2XJCtorJ5dH8vJi//jm5SK8=;
        b=PJtELJOt2+sgJLJ8ZJJqsc8a2/3inEfkzdX6gmQBcAJOcMTJrVKsEYye5MmgTaWeew
         bj0bmicq8ta/iym/A9vCACwgUsywgMO1sVZEQ25cy0OkQ5Yu2hJrlVgNYHEYQz2NQvb9
         ZqKSVpBNqeudiFwS935i2N2uWNeazYfQtV43AH02lXLvnWufzz3BoedCWCgG9lsBlqXM
         gQDcq3PgeA0N8J4YF35PCL1j5itkZFYrGPdP3+MUpc5txAF8VxZhCIPFLMXvDdKwEv81
         9jzRNnN530+D5+WJ3/NZ6fR9qlu9n6TI3dqAvZ1wLJCAGELSt5e86fKIrE2YLq5zLZrI
         mxYA==
X-Gm-Message-State: AO0yUKWrrZvwAysZZYu4v4ydG5YnkxYYLDsa7Vs4vz+yTmtHj06bHvjD
	RqBuh5I6juXnLJORFxl+UG1+Qw==
X-Google-Smtp-Source: AK7set81x9SFPlR2xt2LL3p/gzp9UDd4QwKeSPV35HuGWe1moKyUrZEQddhquz69J42M/1OcHdR4Nw==
X-Received: by 2002:a17:90b:3ec3:b0:230:3af9:183 with SMTP id rm3-20020a17090b3ec300b002303af90183mr337135pjb.20.1675293172782;
        Wed, 01 Feb 2023 15:12:52 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 00/14] KVM perf support 
Date: Wed,  1 Feb 2023 15:12:36 -0800
Message-Id: <20230201231250.3806412-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_151308_511130_8240973F 
X-CRM114-Status: GOOD (  14.98  )
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

This series extends perf support for KVM. The KVM implementation relies
on the SBI PMU extension and trap n emulation of hpmcounter CSRs.
The KVM implementation exposes the virtual counters to the guest and internally
manage the counters using kernel perf counters. 

This series doesn't support the counter overflow as the Sscofpmf extension
doesn't allow trap & emulation mechanism of scountovf CSR yet. The required
changes to allow that are being under discussions. Supporting overflow interrupt
also requires AIA interrupt filtering support.

1. PATCH 1-5 are generic KVM/PMU driver improvements.
2. PATCH 9 disables hpmcounter for now. It will be enabled to maintain ABI
requirement once the ONE reg interface is settled. 

perf stat works in kvm guests with this series. 

Here is example of running perf stat in a guest running in KVM.

===========================================================================
/ # /host/apps/perf stat -e instructions -e cycles -e r8000000000000005 \
> -e r8000000000000006 -e r8000000000000007 -e r8000000000000008 \
> -e r800000000000000a perf bench sched messaging -g 10 -l 10

# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 10 groups == 400 processes run

     Total time: 7.769 [sec]
                 
 Performance counter stats for 'perf bench sched messaging -g 10 -l 10':

       73556259604      cycles
       73387266056      instructions              #    1.00  insn per cycle
                 0      dTLB-store-misses
                 0      iTLB-load-misses
                 0      r8000000000000005
              2595      r8000000000000006
              2272      r8000000000000007
                10      r8000000000000008
                 0      r800000000000000a

      12.173720400 seconds time elapsed

       1.002716000 seconds user
      21.931047000 seconds sys


Note: The SBI_PMU_FW_SET_TIMER (eventid : r8000000000000005) is zero
as kvm guest supports sstc now. 

This series can be found here as well.
https://github.com/atishp04/linux/tree/kvm_perf_v4

TODO:
1. Add sscofpmf support.
2. Add One reg interface for the following operations:
	1. Enable/Disable PMU (should it at VM level rather than vcpu ?)
	2. Number of hpmcounter and width of the counters
	3. Init PMU
	4. Allow guest user to access cycle & instret without trapping
3. Move counter mask to a bitmask instead of unsigned long so that it can work
   for RV32 systems where number of total counters are more than 32.
   This will also accomodate future systems which may define maximum counters
   to be more than 64. 

Changes from v3->v4:
1. Addressed all the comments on v3.
2. Modified the vcpu_pmu_init to void return type.
3. Redirect illegal instruction trap to guest for invalid hpmcounter access
   instead of exiting to the userpsace.
4. Got rid of unecessary error messages.

Changes v2->v3:
1. Changed the exported functions to GPL only export.
2. Addressed all the nit comments on v2.
3. Split non-kvm related changes into separate patches.
4. Reorgainze the PATCH 11 and 10 based on Drew's suggestions.

Changes from v1->v2:
1. Addressed comments from Andrew.
2. Removed kvpmu sanity check.
3. Added a kvm pmu init flag and the sanity check to probe function.
4. Improved the linux vs sbi error code handling.
 

Atish Patra (14):
perf: RISC-V: Define helper functions expose hpm counter width and
count
perf: RISC-V: Improve privilege mode filtering for perf
RISC-V: Improve SBI PMU extension related definitions
RISC-V: KVM: Define a probe function for SBI extension data structures
RISC-V: KVM: Return correct code for hsm stop function
RISC-V: KVM: Modify SBI extension handler to return SBI error code
RISC-V: KVM: Add skeleton support for perf
RISC-V: KVM: Add SBI PMU extension support
RISC-V: KVM: Make PMU functionality depend on Sscofpmf
RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
RISC-V: KVM: Implement trap & emulate for hpmcounters
RISC-V: KVM: Implement perf support without sampling
RISC-V: KVM: Support firmware events
RISC-V: KVM: Increment firmware pmu events

arch/riscv/include/asm/kvm_host.h     |   4 +
arch/riscv/include/asm/kvm_vcpu_pmu.h | 110 +++++
arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
arch/riscv/include/asm/sbi.h          |   7 +-
arch/riscv/kvm/Makefile               |   1 +
arch/riscv/kvm/main.c                 |   3 +-
arch/riscv/kvm/tlb.c                  |   4 +
arch/riscv/kvm/vcpu.c                 |   7 +
arch/riscv/kvm/vcpu_insn.c            |   4 +-
arch/riscv/kvm/vcpu_pmu.c             | 627 ++++++++++++++++++++++++++
arch/riscv/kvm/vcpu_sbi.c             |  72 ++-
arch/riscv/kvm/vcpu_sbi_base.c        |  43 +-
arch/riscv/kvm/vcpu_sbi_hsm.c         |  28 +-
arch/riscv/kvm/vcpu_sbi_pmu.c         |  85 ++++
arch/riscv/kvm/vcpu_sbi_replace.c     |  50 +-
arch/riscv/kvm/vcpu_sbi_v01.c         |  18 +-
drivers/perf/riscv_pmu_sbi.c          |  64 ++-
include/linux/perf/riscv_pmu.h        |   5 +
18 files changed, 1029 insertions(+), 116 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
create mode 100644 arch/riscv/kvm/vcpu_pmu.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
