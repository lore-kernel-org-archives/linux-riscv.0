Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CA4CCA479
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8+W48DjL5D52fXnJTfZ6cjdS3TYMPfwDNhFjdk6kn0=; b=P3QBqYE/LpDkaO
	mOKULnZzAtjSCCx2awJwD/X9PGv/ZM7aRDI32kx1P62Alidhc3nuZc9oPThWuabepxMB5Epijx0vn
	DZ8XqtFUQAasL+eKH58MTDJpIyVH5nQ6sK2Nhn0zI9n7NrqIXCh+AjDyO7QEqIhTZQc1onKJymrkg
	yYXOcz5azqsYGk7cZ4eBk0BQK4OTQatti5755UerA9vD60MvoCn4v6N4mZjLnTWlW+x9Mdd8JeVas
	dySyFm3VVCuuPwc8v8clSL4+aqF/ZOG/GN5FCYbZL6xX8yy1jt0NObuMd+3mzD6Jd61GVNwj2FXmZ
	T01EgKKo6WGILP3b6jxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBo-00Gzhn-UI; Mon, 18 Jul 2022 17:05:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBl-00GzdP-BI
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id c3so10270730pfb.13
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGesJ3xfjvEZZZT4415xoctAQUbMYAHu9Vlt5BYorCE=;
        b=5JFtYGglR01I9DhQBYCwoYAMeOZTQ5L8KPmhPGIJtyk5rPeYbL3lmjLJsSbb84p7uH
         NNS434TKXVpsr10GmlK9T3Z57kMKBnRmYmC3RQ7etjgeeoGxZrfyeK8pexveK+5N1GOx
         GIe8eJafDVIRnMXuS2j5QcA92rrI0+7uI387VUsYMNRW3zIJedYiPPzwTlk8uH7x0RhM
         TuDiDsc8jvK3gz191+wq+q6khGXydS2lBedj0NvL1gTMN0vWumOn7hfcv7bAsv7uTHoz
         AQpvXVxFPnNxDCMIOoNVnf6r+YTqCpUro5bxYrH6KGilcyXIAtvAHifx/QmJpX2/QgKV
         Id5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGesJ3xfjvEZZZT4415xoctAQUbMYAHu9Vlt5BYorCE=;
        b=7jGnoSSepyhYdELTFeFO8a8jKMxmCC8uLMnXOYlpJDfUtQbFlXcxS7WwuxtqloiUuT
         +D/4e9u2U8/pz5VLWqQeP01HZ2I31XqWac03/qubMb2ExdVvbIYIidLy5S2JU26RqORf
         NXUdGoI3DwS5UxN+xyZTcN5USKK3dSiq2nY/6YEV7imngTZZkzjWK1Cts6HFAKI2RK4x
         SikHZ1yVNT58c95clzKUn4a+IZ19HXBCayFr54tfXqEu647ae3Ma585RAPbNvZdLQ1A8
         RPBWbPzo0/no7J3jq4I/u+3vW6J0K+dn78p8lQ+sOWFiQxzxTj+GadMDn4wrMrgW5AD2
         NT5w==
X-Gm-Message-State: AJIora/owCWpjzvsclfBQPCGZHt2z0vNvH0O4NfKWcpyGMXEAouG9Rvd
	wxpiaqzd09xD5Q2bk3f10DPBBg==
X-Google-Smtp-Source: AGRyM1sZUAbOKv1l9BvJXO4uJ53bhkJoChfrjodGKmMwMpV0cMcmUqURMqfDyGhsUsFAGT0TeFFbgg==
X-Received: by 2002:a65:4906:0:b0:40d:dd28:448a with SMTP id p6-20020a654906000000b0040ddd28448amr24126209pgs.567.1658163943502;
        Mon, 18 Jul 2022 10:05:43 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [RFC  0/9] KVM perf support 
Date: Mon, 18 Jul 2022 10:01:56 -0700
Message-Id: <20220718170205.2972215-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_100545_635492_1E2FAD0C 
X-CRM114-Status: GOOD (  12.12  )
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
also requires AIA support which is not frozen either.

This series can be found at github[1] as well. It depends Anup's CSR emulation
framework[1] series.

perf stat works in kvm guests with this series. 

Here is example of running perf stat in a guest running in KVM.
===========================================================================
/ # /host/apps/perf stat -e instructions -e cycles -e r8000000000000005 \
> -e r8000000000000006 -e r8000000000000007 -e r8000000000000008 \
> -e r800000000000000a perf bench sched messaging -g 5 -l 15
# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 5 groups == 200 processes run

     Total time: 5.210 [sec] 

 Performance counter stats for 'perf bench sched messaging -g 5 -l 15':

       37209585734      instructions              #    1.00  insn per cycle
       37177435570      cycles 
              2740      r8000000000000005
              3727      r8000000000000006
              3655      r8000000000000007
                10      r8000000000000008
                 0      r800000000000000a

       5.863014800 seconds time elapsed

       0.569373000 seconds user
      10.771533000 seconds sys 

[1] https://github.com/atishp04/linux/tree/kvm_perf_rfc
[2] https://lkml.org/lkml/2022/6/15/389

Atish Patra (9):
RISC-V: Define a helper function to probe number of hardware counters
RISC-V: Define a helper function to return counter width
RISC-V: KVM: Define a probe function for SBI extension data structures
RISC-V: KVM: Improve privilege mode filtering for perf
RISC-V: KVM: Add skeleton support for perf
RISC-V: KVM: Add SBI PMU extension support
RISC-V: KVM: Implement trap & emulate for hpmcounters
RISC-V: KVM: Implement perf support
RISC-V: KVM: Implement firmware events

arch/riscv/include/asm/kvm_host.h     |   3 +
arch/riscv/include/asm/kvm_vcpu_pmu.h | 102 +++++
arch/riscv/include/asm/kvm_vcpu_sbi.h |   3 +
arch/riscv/include/asm/sbi.h          |   2 +-
arch/riscv/kvm/Makefile               |   1 +
arch/riscv/kvm/main.c                 |   3 +-
arch/riscv/kvm/tlb.c                  |   6 +-
arch/riscv/kvm/vcpu.c                 |   5 +
arch/riscv/kvm/vcpu_insn.c            |   4 +-
arch/riscv/kvm/vcpu_pmu.c             | 517 ++++++++++++++++++++++++++
arch/riscv/kvm/vcpu_sbi.c             |  11 +
arch/riscv/kvm/vcpu_sbi_base.c        |  13 +-
arch/riscv/kvm/vcpu_sbi_pmu.c         |  81 ++++
arch/riscv/kvm/vcpu_sbi_replace.c     |   7 +
drivers/perf/riscv_pmu_sbi.c          |  75 +++-
include/linux/perf/riscv_pmu.h        |   7 +
16 files changed, 823 insertions(+), 17 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
create mode 100644 arch/riscv/kvm/vcpu_pmu.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
