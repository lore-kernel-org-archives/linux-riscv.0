Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D0FC61DB3
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 18:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IrD3GPWbEgoFYp/btzUHvSKriMCtf3saXuk82vlwKf4=; b=zZn0JE2M2i4EU3
	HuireydwqlOrhdNLFSGJb2xFRoxxpWoclCt79mfnY0m4+UNsVHeWOkqjD585XK51kThRETxoM0eel
	M4uYfzSnzIsb1xh8hfqrKjFA8cBnKvbBMzovpi1x5eIybfdOeU2wUmVQAQNP7Q1BsjLJoEBPE4Vam
	mc6GQ6v8rFaTLaYtpFpb2BSYt/zH95R6vM7WpMbkXzVOxNZJFTqUQOMKRsutO6X9/KW5WBqqN+beg
	sJEBjzbj6Hw+dbqI2tyhYCZJ5UMr1/TUeeEDdMbEYiJW0RGvBGogH5wdFN3qtF+zYiEPSx9TOHzXI
	vBCPPyp8KV6GFYLwVrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQb-00G2eC-2K; Fri, 27 Jan 2023 18:26:21 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQX-00G2aN-MH
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 18:26:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso5506673pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsftkojp5OXA0h6KtHV2q16vdLIZZMWoH0UyNcPXsv0=;
        b=tsBPO9VAaqsZisDSonZd6v6hy07NN4UbbIBWkgD0TSZIq1Joh7A9ADhF9Jl7mk6CK/
         0n/usPnqbrZQpvKHTk3GCZkIdNWIoK70ZiucBN5PGZiXNkp7BinDUg0Ml81xbycIfbng
         uL5lEvnVlxiXPddALd9L9yMrF+EztuZJPeC0YseiJr91O4qdBOCCBOs7uWRl8LUnOJzF
         yw3rgSEWO9YEltz6i00/h3UP37QhnncYlVD/mtDiCbrPccZ8qqft/ZQZYuUuNmpRldQN
         xkvgMptsr2EBcIh4RcustE/+CjnrgGL07Dmt+aDPX6TluPxfvl6JqG9Tr1kNxpJR+hWb
         RpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsftkojp5OXA0h6KtHV2q16vdLIZZMWoH0UyNcPXsv0=;
        b=WlkYAuE9k8cBxM8134cfn/aYxkFZO8Pfq3v6QU4Nq5oZZCOHAzqAB9A64SpGlsy/kK
         0lpgklO0XtLnfVOMROx6a10ggx3YA0PrNR3yela01LUeXMBKWnpV0mdtyd+OLCiiJjuC
         RUKGTyZ7G2tXDvXS6AOg3pAexFhSzLikK/VtncE2OaPHweR7l/wJ7LGy+6QFgeJgSbZa
         GwFIxy65roVkFH52u5rf5KasEpj4gB+i0FnJtuccpEgdyq4NZhZD5jr1EGf4BOlY3rEL
         n3h4PUV+FtFj3Kydz3T82oEsu/Bhp4bZA4pUTD70/jvsjEuY7bu4jNvPQ2qDA3vn5K3N
         3FEQ==
X-Gm-Message-State: AFqh2kqj41RRVo2IJLZthnMO3n+QwOQ87p7IYieWUYizjU/YxOvzQYzi
	sPynyeWCFr4DcGDSCDh8RiPFug==
X-Google-Smtp-Source: AMrXdXtmuMmbKkrnzKek9F1A8FnyuRvs7M9kcnyacbUaIv8D3BbicW4370yvpt3ia7QOLkL/u3kxLQ==
X-Received: by 2002:a17:902:e882:b0:195:e9d4:5380 with SMTP id w2-20020a170902e88200b00195e9d45380mr32563156plg.56.1674843973701;
        Fri, 27 Jan 2023 10:26:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 00/14] KVM perf support 
Date: Fri, 27 Jan 2023 10:25:44 -0800
Message-Id: <20230127182558.2416400-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_102617_746586_D0AD329E 
X-CRM114-Status: GOOD (  13.09  )
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
https://github.com/atishp04/linux/tree/kvm_perf_v3

TODO:
1. Add sscofpmf support.
2. Add One reg interface for the following operations:
	1. Enable/Disable PMU (should it at VM level rather than vcpu ?)
	2. Number of hpmcounter and width of the counters
	3. Init PMU
	4. Allow guest user to access cycle & instret without trapping

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

arch/riscv/include/asm/kvm_host.h     |   3 +
arch/riscv/include/asm/kvm_vcpu_pmu.h | 108 +++++
arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
arch/riscv/include/asm/sbi.h          |   5 +-
arch/riscv/kvm/Makefile               |   1 +
arch/riscv/kvm/main.c                 |   3 +-
arch/riscv/kvm/tlb.c                  |   4 +
arch/riscv/kvm/vcpu.c                 |   5 +
arch/riscv/kvm/vcpu_insn.c            |   4 +-
arch/riscv/kvm/vcpu_pmu.c             | 622 ++++++++++++++++++++++++++
arch/riscv/kvm/vcpu_sbi.c             |  57 ++-
arch/riscv/kvm/vcpu_sbi_base.c        |  45 +-
arch/riscv/kvm/vcpu_sbi_hsm.c         |  29 +-
arch/riscv/kvm/vcpu_sbi_pmu.c         |  86 ++++
arch/riscv/kvm/vcpu_sbi_replace.c     |  54 ++-
arch/riscv/kvm/vcpu_sbi_v01.c         |  11 +-
drivers/perf/riscv_pmu_sbi.c          |  64 ++-
include/linux/perf/riscv_pmu.h        |   5 +
18 files changed, 1013 insertions(+), 106 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
create mode 100644 arch/riscv/kvm/vcpu_pmu.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
