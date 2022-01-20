Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC04C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m6lfNwie/fOc22pGGUFTD2v3zaDNB5t3phfm1B5mCS8=; b=2jghYRYcJJc08y
	pJnjQFWwsLCdKmehqmYvhZhQj6tGXNkgcQSgNyJckTBAc32Lz/sOmyiZoa8Wt/RK9OLlbXIMx6npV
	yYECfYWRE1fvI2yqsFugBrlDiCU6dQhqsCXeeA2Ai0qhe5AHh5oMRGsIhJlg+EOPidtY5CPyb4JDI
	xvKZguI+vdFRlaZ6A5j7hEDTv/CAQfqXkORcf4+uWZFMAqiY9RK2Jsr/Szjdidfmb79aVFq14Ovso
	rDo/13Q/vuNGaDi5wiA9YnoF6XhtlPsPgkUKMdGbYojOpeCIiAJujVt5TJxyWecIC84uC+/S8zGiy
	tRh/HZmEJy33v6ZsrHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATSc-00A5fc-PS; Thu, 20 Jan 2022 09:10:26 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATSY-00A5dm-QL
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 09:10:24 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so6730243oti.9
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 01:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHsT6WU5wb4MziMiJ3VGwy7dqSevPYGSnNhHfaodUms=;
 b=I5rb+NhYWFZ7Fzmy4flOQ8JZzx+qkh3oGptms1l/cTcefFRXfaBwLWITtx4Byx6Whj
 c/YVvpk0L5G+H3vyJPrx8jVP+ZTJ7EAhN3tWmci2QjwYLCzFL1O0M4U0asae5Ts0u0TZ
 ofkFTCZ3K8gHZAG+0s5yGWgPvp/o73Dp5IWKHQ7oYi/smVo+lL5z/yYtazFEJcu6ltQ5
 dm8wqAwwULQYDxo41IgEne4/wRAhyLMauLPI5HR2HraUnOBNyB6BOYjl4TyMSjqHRq2/
 9I8eNu3irQkccsdtqaLuUaEVcnVLug0TWL1TGj9JegF1raF2izRIdtfOSUntczRoYEGt
 vgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHsT6WU5wb4MziMiJ3VGwy7dqSevPYGSnNhHfaodUms=;
 b=0Qmkbp24IOJRZgWEa4HUrPks8GNUvgDQjx55XfP212HIqCNMHYfR3VyzbaWSsLiBN1
 rm4la0PDvZmlaLkseHLJtLeqEsdtLvVen2mPA2+lUNrodJvUpy2wpSuxWfO3Edc1wZo5
 Oab93zsYwBLHaS59LXPO8Ii7QLEtvliTNAocO4xvlCUl0UOaKHCmfyN/V4iWPrRh1QqB
 NsmQetcCBUZVjerDLMhG9tQ1Gm5f0tEKNQwdPmvfnfOA1HdlMpmpzzpcQpH0s0Pg3w74
 Dk4ju1b8Pqf2eKJJmoQk+PNknNsy23sDqtaeYtvDsL3Ch+cITIzqG5W+RnFMA1PJQ+XG
 lmLw==
X-Gm-Message-State: AOAM532VcTTcQYVFRCtFAsiDwFs1UxSqxO2xDszrOGMdZLoXSAnoGNVo
 vo6+oacN+ZGJiKHGzr+R/I+CXA==
X-Google-Smtp-Source: ABdhPJz+hTMueXdXEZpcJ7Njw3ByUf9uV+Yqx5G/hZgLqP+6hxIUvAJj2dSHEr9rdNtBn9B5Vuxq/w==
X-Received: by 2002:a05:6830:1389:: with SMTP id
 d9mr23071815otq.114.1642669821318; 
 Thu, 20 Jan 2022 01:10:21 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i12sm944766oot.25.2022.01.20.01.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 01:10:20 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/6] Sparse HART id support 
Date: Thu, 20 Jan 2022 01:09:12 -0800
Message-Id: <20220120090918.2646626-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_011022_955864_B4A20E51 
X-CRM114-Status: GOOD (  22.69  )
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

Currently, sparse hartid is not supported for Linux RISC-V for the following
reasons.
1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
   which is an array size of NR_CPUs.
2. During early booting, any hartid greater than NR_CPUs are not booted at all.
3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
   generating hartmask.

In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
which was logically incorrect anyways. NR_CPUs represent the maximum logical|
CPU id configured in the kernel while the hartid represent the physical hartid
stored in mhartid CSR defined by the privilege specification. Thus, hartid
can have much greater value than logical cpuid.

Currently, we have two methods of booting. Ordered booting where the booting
hart brings up each non-booting hart one by one using SBI HSM extension.
The spinwait booting method relies on harts jumping to Linux kernel randomly
and boot hart is selected by a lottery. All other non-booting harts keep
spinning on __cpu_up_stack/task_pointer until boot hart initializes the data.
Both these methods rely on __cpu_up_stack/task_pointer to setup the stack/
task pointer. The spinwait method is mostly used to support older firmwares
without SBI HSM extension and M-mode Linux.  The ordered booting method is the
preferred booting method for booting general Linux because it can support
cpu hotplug and kexec.

The first patch modified the ordered booting method to use an opaque parameter
already available in HSM start API to setup the stack/task pointer. The third
patch resolves the issue #1 by limiting the usage of
__cpu_up_stack/task_pointer to spinwait specific booting method. The fourth 
and fifth patch moves the entire hart lottery selection and spinwait method
to a separate config that can be disabled if required. It solves the issue #2.
The 6th patch solves issue #3 and #4 by removing riscv_cpuid_to_hartid_mask
completely. All the SBI APIs directly pass a pointer to struct cpumask and
the SBI implementation takes care of generating the hart bitmap from the
cpumask.

It is not trivial to support sparse hartid for spinwait booting method and
there are no usecases to support sparse hartid for spinwait method as well.
Any platform with sparse hartid will probably require more advanced features
such as cpu hotplug and kexec. Thus, the series supports the sparse hartid via
ordered booting method only. To maintain backward compatibility, spinwait
booting method is currently enabled in defconfig so that M-mode linux will
continue to work. Any platform that requires to sparse hartid must disable the
spinwait method.

This series also fixes the out-of-bounds access error[1] reported by Geert.
The issue can be reproduced with SMP booting with NR_CPUS=4 on platforms with
discontiguous hart numbering (HiFive unleashed/unmatched & polarfire).
Spinwait method should also be disabled for such configuration where NR_CPUS
value is less than maximum hartid in the platform. 

[1] https://lore.kernel.org/lkml/CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com/#t

The series is based on queue branch on kvm-riscv as it has kvm related changes
as well. I have tested it on HiFive Unmatched and Qemu.

Changes from v2->v3:
1. Rebased on linux-next
2. Removed the redundant variable in PATCH 1.
3. Added the reviewed-by/acked-by tags.

Changes from v1->v2:
1. Fixed few typos in Kconfig.
2. Moved the boot data structure offsets to a asm-offset.c
3. Removed the redundant config check in head.S

Atish Patra (6):
RISC-V: Avoid using per cpu array for ordered booting
RISC-V: Do not print the SBI version during HSM extension boot print
RISC-V: Use __cpu_up_stack/task_pointer only for spinwait method
RISC-V: Move the entire hart selection via lottery to SMP
RISC-V: Move spinwait booting method to its own config
RISC-V: Do not use cpumask data structure for hartid bitmap

arch/riscv/Kconfig                   |  14 ++
arch/riscv/include/asm/cpu_ops.h     |   2 -
arch/riscv/include/asm/cpu_ops_sbi.h |  25 ++++
arch/riscv/include/asm/sbi.h         |  19 +--
arch/riscv/include/asm/smp.h         |   2 -
arch/riscv/kernel/Makefile           |   3 +-
arch/riscv/kernel/asm-offsets.c      |   3 +
arch/riscv/kernel/cpu_ops.c          |  26 ++--
arch/riscv/kernel/cpu_ops_sbi.c      |  26 +++-
arch/riscv/kernel/cpu_ops_spinwait.c |  27 +++-
arch/riscv/kernel/head.S             |  35 ++---
arch/riscv/kernel/head.h             |   6 +-
arch/riscv/kernel/sbi.c              | 189 +++++++++++++++------------
arch/riscv/kernel/setup.c            |  10 --
arch/riscv/kernel/smpboot.c          |   2 +-
arch/riscv/kvm/mmu.c                 |   4 +-
arch/riscv/kvm/vcpu_sbi_replace.c    |  11 +-
arch/riscv/kvm/vcpu_sbi_v01.c        |  11 +-
arch/riscv/kvm/vmid.c                |   4 +-
arch/riscv/mm/cacheflush.c           |   5 +-
arch/riscv/mm/tlbflush.c             |   9 +-
21 files changed, 253 insertions(+), 180 deletions(-)
create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
