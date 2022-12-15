Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6292C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TeWi+rV/6auKLP3yMDaU5PysakcQ1HPsf18Agk1VxVI=; b=0BOiVZO9E03R8m
	8UBab1dqixV6dmwnUjJwaswAceRfGgWcK0bPogHATI8OSRGhAWO9v0kc8O9H/BSi5TCqwVhJxpdwM
	J4CAvaOgkGxF6G+vSJzHcR1kvHXjMx/EDybIL3bXmyAAk6bhwHI/M7DPQnLv8EQDYDiFDopa4TCXa
	Bqi3u6TyTrwT1hBLhtr+mzs8t/L6HJOPgPwWE+bpGjPl9GEWtAnOulrrjlac5j58X9imLuqTAE5UQ
	eiqudHn0kFolcY9sNq1U4CNVEu4Y4LE9Ku8X5/ZC9SMIhO2V7vivoYquTzyKvQaCLs/5EvIPbtrT6
	D7RYAgMUVdI81wiHKYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbu-00ARad-Up; Thu, 15 Dec 2022 17:01:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbf-00ARQK-FO
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d15so7503913pls.6
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qx+V0HqoGlECsFSjn8+kKGYij8Unq8RFOTIoeLkQqAQ=;
        b=WZQXttZyILm2FtfOQTdSxF4+l7eAT9OOLhvMed/ku0pv/3kGzRZB4o8NNG2v02zWFN
         fagBkxAG6+UvXOnYtV8Jgm7HB8xik9lQ+iJAncmqh2VjKjrieJMFXPagnVPu8dnzqbr+
         0eAx2hqQe3Y/tbMeBggbIPePlmUu8ApFm+/hCgi+FBpmlFlyVvlEKTrGbBa727FdLn2f
         UFCBwNTAonW6bcQXv6dc0+G4xpmoj5YzygeHPlRXo1xx3eKosznF7obEewjhjocmxrPl
         vmt/2erJr3c8CrnPGS3R/FoejHxONTpgeuVvPa+B3CGqPdxjnr6NC5BByjCQOmRiSpVF
         MhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qx+V0HqoGlECsFSjn8+kKGYij8Unq8RFOTIoeLkQqAQ=;
        b=p16/FYX3PGH8ZSZlGclvvWZDtdn29kmyTpcFGy5a73RtG3KxzEx+tjOxsWhSVwFr4l
         tSF5uzDuq7DImIU0Gr7SSstsWF7n4ukg5xkb+9NsNR8AMhpl9mS8oh8o+qzFwWhGyEML
         68u3+QqPpf+6RbwBxWVbn3ARgczsOauieMISmsZWUVWtu3pkmD+xTtxAHC0gt7OT/7R9
         NfBjAqNcpWX0p+0J0olebZW2nM0QU0bPb5dlRbeyWiRnFxGapMryzNxoGQ1XRvOA+lXZ
         b/LvFBi7BFDVokiIO1vrwf32P4ePL+vVhSMcxL89tJTrul24MpX7QiVMq8uFXSI7XX0V
         ZbPQ==
X-Gm-Message-State: ANoB5pm1QCq1ve8OnoBGTQAo4kTHke4ETdO75HlROD1bPN0jdwEoaQ07
	6pg89mDZilsXADmahVSK2xraog==
X-Google-Smtp-Source: AA0mqf5TkLz3QZ1wHVXjlDJpRXfvkaXq+tzppq0b/+DN8W04g5Gzmus0QFBMg0gMnAl+4LQ8Y6HeMg==
X-Received: by 2002:a17:902:b083:b0:18c:d9df:a4b5 with SMTP id p3-20020a170902b08300b0018cd9dfa4b5mr26407596plr.7.1671123673271;
        Thu, 15 Dec 2022 09:01:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:12 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 00/11] KVM perf support 
Date: Thu, 15 Dec 2022 09:00:35 -0800
Message-Id: <20221215170046.2010255-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090115_822569_4F8F4008 
X-CRM114-Status: GOOD (  12.50  )
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

1. PATCH1-4 are generic KVM/PMU driver improvements.
2. PATCH8 disables hpmcounter for now. It will be enabled to maintain ABI
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
https://github.com/atishp04/linux/tree/kvm_perf_v2

TODO:
1. Add sscofpmf support.
2. Add One reg interface for the following operations:
	1. Enable/Disable PMU (should it at VM level rather than vcpu ?)
	2. Number of hpmcounter and width of the counters
	3. Init PMU
	4. Allow guest user to access cycle & instret without trapping

Changes from v1->v2:
1. Addressed comments from Andrew.
2. Removed kvpmu sanity check.
3. Added a kvm pmu init flag and the sanity check to probe function.
4. Improved the linux vs sbi error code handling.
 

Atish Patra (11):
RISC-V: Define helper functions expose hpm counter width and count
RISC-V: KVM: Define a probe function for SBI extension data structures
RISC-V: KVM: Return correct code for hsm stop function
RISC-V: KVM: Modify SBI extension handler to return SBI error code
RISC-V: KVM: Improve privilege mode filtering for perf
RISC-V: KVM: Add skeleton support for perf
RISC-V: KVM: Add SBI PMU extension support
RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
RISC-V: KVM: Implement trap & emulate for hpmcounters
RISC-V: KVM: Implement perf support without sampling
RISC-V: KVM: Implement firmware events

arch/riscv/include/asm/kvm_host.h     |   3 +
arch/riscv/include/asm/kvm_vcpu_pmu.h | 108 +++++
arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
arch/riscv/include/asm/sbi.h          |   2 +-
arch/riscv/kvm/Makefile               |   1 +
arch/riscv/kvm/main.c                 |   3 +-
arch/riscv/kvm/tlb.c                  |   6 +-
arch/riscv/kvm/vcpu.c                 |   5 +
arch/riscv/kvm/vcpu_insn.c            |   4 +-
arch/riscv/kvm/vcpu_pmu.c             | 585 ++++++++++++++++++++++++++
arch/riscv/kvm/vcpu_sbi.c             |  56 ++-
arch/riscv/kvm/vcpu_sbi_base.c        |  45 +-
arch/riscv/kvm/vcpu_sbi_hsm.c         |  22 +-
arch/riscv/kvm/vcpu_sbi_pmu.c         |  86 ++++
arch/riscv/kvm/vcpu_sbi_replace.c     |  51 ++-
drivers/perf/riscv_pmu_sbi.c          |  62 ++-
include/linux/perf/riscv_pmu.h        |   5 +
17 files changed, 963 insertions(+), 94 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
create mode 100644 arch/riscv/kvm/vcpu_pmu.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
