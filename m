Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751EAC4725D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iOd9Nnzn+FWagX8+GVAZRfxDHzqYIS5fO7iPNA7i5PU=; b=uTt4ygnxfW8gho
	/uEswaKHJxPzanJSrAk763+HBrl+0DJb51RGWfBQakEi5kjF0iAT9T+zNhZmCRjfuripI7SziFjCC
	HKBBSxZ5CC/8jGII8cnF+iSBjm0WLZVcxcEbiR610KWONa9GdhCr3pIvLaS8Cdq3YUm9XeLdQn4TL
	eFviuIPRVEP8pbm3A4z3wwqte73gPPxhWdLhk2yo/rCz16lmAM7RWAivk5PurUHVEvzfF8qSBHZFk
	1hBGn7f0QEcm/bkjPPmoqloN0MTI1FDOASxEVpP0RiFsaPk/Z/Dj0wYLXwXvkEipNTi0Mp88PsiW9
	yuUZRjs6h85U8ijY3XlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmY-00EdRo-1H;
	Wed, 10 Jan 2024 23:14:46 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmS-00EdNF-2T
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:44 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7bbec1d1c9dso245394839f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928478; x=1705533278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WUFVAAbHF+PmWAuLnMrVx+kQTLQoDfgHSLNtKZiPo8=;
        b=SW9OQ9sf/+ECApLOTupwQB5RHD/e+tckL4WMYmVMS/3IacQOLiXq/vhA1vKD7DhkVh
         b0ffULZ58fe/vu8pDhs/GjQ/YKlPS2Fb1CxWTJp/jPofW/yJflfhudf4lPigl4e6J70h
         yIY1RTsLFoCjVieYgSN+RCkLQXWz+TTW7f1WheU0P+RMsnNXtTNnjIuVny77CY4cCzMr
         bQk73JK9XpILHS4uLSSUs0x2+Io7NbjZCYnxroarvUmmQ86OemONq3FZr4hWmJlOApAg
         YbDzBWV/BY8RxtTgIO8ABH0QYrW60hgnVyCRW1n8TdRglxVLh7CkV/xV+nfS5iPGMHzK
         yiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928478; x=1705533278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WUFVAAbHF+PmWAuLnMrVx+kQTLQoDfgHSLNtKZiPo8=;
        b=GZ4Tr23FGuqHJ9gtnyUMRn7v79t5bx6xi3NoSDGYIrB3we5CxgY/DE45AapkhftB5t
         yRv0iynz26fKkhn9KrkBVvV6HDj3vviiT3r6J2FsJUa7qmlmjcZOras56Jcjlc4+PNCk
         QfoaCmPJ9Szzh4pNY24Pd4/C7iWVYIO0t8nU935l5iRdH0oWqsr2egRiVndrlHTKj27O
         oUzrrf2ScrsSLZkGnmnoPZMBdzszpD3N5ZMfjWG4aYzakI/Zxhv0nJqowD7ZmxQP4glW
         6eXVg1PmmhQ+883KyxpE8YunCiAdBa9veku58RMzRGiyVyv9cDJatNDS49GCQXz/O1ma
         Xd+A==
X-Gm-Message-State: AOJu0YxfN76NPcFACNeKmYDHejj1QhcNYkUeHv6DutSnP2SUeVKJv32t
	EuvinGtf6mxgF0R88W/E8n0KffkXdO+nRQ==
X-Google-Smtp-Source: AGHT+IEp7thazljNeY9OzBk4iTp5bRzzo1Z7xTD3TDakP3AoXQn9uFVbKsFgyO4lZsLq96YzbsUb8A==
X-Received: by 2002:a6b:ea07:0:b0:7ba:95fc:5dd0 with SMTP id m7-20020a6bea07000000b007ba95fc5dd0mr400839ioc.18.1704928478620;
        Wed, 10 Jan 2024 15:14:38 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:38 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 00/10] RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest
Date: Wed, 10 Jan 2024 15:13:49 -0800
Message-Id: <20240110231359.1239367-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151440_850881_D7C836A3 
X-CRM114-Status: GOOD (  17.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series implements SBI PMU improvements done in SBI v2.0[1] i.e. PMU snapshot
and fw_read_hi() functions. 

SBI v2.0 introduced PMU snapshot feature which allows the SBI implementation
to provide counter information (i.e. values/overflow status) via a shared
memory between the SBI implementation and supervisor OS. This allows to minimize
the number of traps in when perf being used inside a kvm guest as it relies on
SBI PMU + trap/emulation of the counters. 

The current set of ratified RISC-V specification also doesn't allow scountovf
to be trap/emulated by the hypervisor. The SBI PMU snapshot bridges the gap
in ISA as well and enables perf sampling in the guest. However, LCOFI in the
guest only works via IRQ filtering in AIA specification. That's why, AIA
has to be enabled in the hardware (at least the Ssaia extension) in order to
use the sampling support in the perf. 

Here are the patch wise implementation details.

PATCH 1,6,7 : Generic cleanups/improvements.
PATCH 2,3,10 : FW_READ_HI function implementation
PATCH 4-5: Add PMU snapshot feature in sbi pmu driver
PATCH 6-7: KVM implementation for snapshot and sampling in kvm guests

The series is based on kvm-next and is available at:

https://github.com/atishp04/linux/tree/kvm_pmu_snapshot_v3

The kvmtool patch is also available at:
https://github.com/atishp04/kvmtool/tree/sscofpmf

It also requires Ssaia ISA extension to be present in the hardware in order to
get perf sampling support in the guest. In Qemu virt machine, it can be done
by the following config.

```
-cpu rv64,sscofpmf=true,x-ssaia=true
```

There is no other dependencies on AIA apart from that. Thus, Ssaia must be disabled
for the guest if AIA patches are not available. Here is the example command.

```
./lkvm-static run -m 256 -c2 --console serial -p "console=ttyS0 earlycon" --disable-ssaia -k ./Image --debug 
```

The series has been tested only in Qemu.
Here is the snippet of the perf running inside a kvm guest.

===================================================
$ perf record -e cycles -e instructions perf bench sched messaging -g 5
...
$ Running 'sched/messaging' benchmark:
...
[   45.928723] perf_duration_warn: 2 callbacks suppressed
[   45.929000] perf: interrupt took too long (484426 > 483186), lowering kernel.perf_event_max_sample_rate to 250
$ 20 sender and receiver processes per group
$ 5 groups == 200 processes run

     Total time: 14.220 [sec]
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.117 MB perf.data (1942 samples) ]
$ perf report --stdio
$ To display the perf.data header info, please use --header/--header-only optio>
$
$
$ Total Lost Samples: 0
$
$ Samples: 943  of event 'cycles'
$ Event count (approx.): 5128976844
$
$ Overhead  Command          Shared Object                Symbol               >
$ ........  ...............  ...........................  .....................>
$
     7.59%  sched-messaging  [kernel.kallsyms]            [k] memcpy
     5.48%  sched-messaging  [kernel.kallsyms]            [k] percpu_counter_ad>
     5.24%  sched-messaging  [kernel.kallsyms]            [k] __sbi_rfence_v02_>
     4.00%  sched-messaging  [kernel.kallsyms]            [k] _raw_spin_unlock_>
     3.79%  sched-messaging  [kernel.kallsyms]            [k] set_pte_range
     3.72%  sched-messaging  [kernel.kallsyms]            [k] next_uptodate_fol>
     3.46%  sched-messaging  [kernel.kallsyms]            [k] filemap_map_pages
     3.31%  sched-messaging  [kernel.kallsyms]            [k] handle_mm_fault
     3.20%  sched-messaging  [kernel.kallsyms]            [k] finish_task_switc>
     3.16%  sched-messaging  [kernel.kallsyms]            [k] clear_page
     3.03%  sched-messaging  [kernel.kallsyms]            [k] mtree_range_walk
     2.42%  sched-messaging  [kernel.kallsyms]            [k] flush_icache_pte

===================================================

[1] https://github.com/riscv-non-isa/riscv-sbi-doc

Changes from v2->v3:
1. Fixed a patchwork warning on patch6.
2. Fixed a comment formatting & nit fix in PATCH 3 & 5.
3. Moved the hvien update and sscofpmf enabling to PATCH 9 from PATCH 8.

Changes from v1->v2:
1. Fixed warning/errors from patchwork CI.
2. Rebased on top of kvm-next.
3. Added Acked-by tags.

Changes from RFC->v1:
1. Addressed all the comments on RFC series.
2. Removed PATCH2 and merged into later patches.
3. Added 2 more patches for minor fixes.
4. Fixed KVM boot issue without Ssaia and made sscofpmf in guest dependent on
   Ssaia in the host.

Atish Patra (10):
RISC-V: Fix the typo in Scountovf CSR name
RISC-V: Add FIRMWARE_READ_HI definition
drivers/perf: riscv: Read upper bits of a firmware counter
RISC-V: Add SBI PMU snapshot definitions
drivers/perf: riscv: Implement SBI PMU snapshot function
RISC-V: KVM: No need to update the counter value during reset
RISC-V: KVM: No need to exit to the user space if perf event failed
RISC-V: KVM: Implement SBI PMU Snapshot feature
RISC-V: KVM: Add perf sampling support for guests
RISC-V: KVM: Support 64 bit firmware counters on RV32

arch/riscv/include/asm/csr.h          |   5 +-
arch/riscv/include/asm/errata_list.h  |   2 +-
arch/riscv/include/asm/kvm_vcpu_pmu.h |  14 +-
arch/riscv/include/asm/sbi.h          |  12 ++
arch/riscv/include/uapi/asm/kvm.h     |   1 +
arch/riscv/kvm/aia.c                  |   5 +
arch/riscv/kvm/vcpu.c                 |   8 +-
arch/riscv/kvm/vcpu_onereg.c          |   9 +-
arch/riscv/kvm/vcpu_pmu.c             | 244 ++++++++++++++++++++++++--
arch/riscv/kvm/vcpu_sbi_pmu.c         |  15 +-
drivers/perf/riscv_pmu.c              |   1 +
drivers/perf/riscv_pmu_sbi.c          | 229 ++++++++++++++++++++++--
include/linux/perf/riscv_pmu.h        |   6 +
13 files changed, 507 insertions(+), 44 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
