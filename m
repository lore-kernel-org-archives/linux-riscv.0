Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2ACC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+358NEtqXK/T9iVAXUy0s4l0Pb/ZSgaGRE93inVa45Q=; b=1lnRoMzRNxwYZV
	D0Qm1pZ7M9b9VqLBISqD0YUyQecxyD1jyhjCd2GwgzHqH7OOrEkZQRroyHcmedTrA0r7F7YGLTKVx
	xYfhjtpBcGTWjn++Q920qi5pl9doc7Y9ibl6VdfIM56u/HftqLUdgV/xfxABg4dGBRHjMuEVyCAA/
	PF71xmAmxo1nIs8j0kYpSr+l0ZBpEC7hkOw5WpEMnnmoxhnlqDPY5y6jWxg+FiFFPme2KwBONFCZY
	eTqFzGHE6/RHwEG0f0bwbunoJIGG7h0IrNJ4UYcHAWDMwXXsy5aB2Ft8g3N7FXrnIM2fulUZoFX8B
	bCOeED6uU4d+6WFXngHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3p-009rGA-2t;
	Mon, 18 Dec 2023 10:41:21 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3m-009rEK-04
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:20 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-59082c4aadaso2086072eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896077; x=1703500877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAExNJX/YhcccIuIFbir4pLgBR3qGdMXJeV+rbaaqC4=;
        b=Ldtsq5BI8Ge3+wlIybLQLQvMxGPcVcZ8eOOvHpQWsdiNQ2D8BePJtCKqrIQViju+lG
         HiVZxbbP1Z5zrFhMB1yMmesbJZ3whA+hjaX5Of0sEDkVRSdwgb5k6AJop4W/LyN17JqF
         qP/4wgovxITJ8hvoUVL0YES6p9j8hG7hsg++NvQk4gDBQpIgrSq0I+Ef474NbGOGs2o/
         EGKyhZJPAzC2WqaVjtvPTDK5r43WtrIZDCHDExQx9QWDTVxrG0XNNGXt9KSSjzi1nIyq
         iOtgegS6tKNX/3u+YdAWi4IzwlVoBPBMH03apLRJmBrmmk2b6Kmvfl8gcJZDOAWVLS51
         psEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896077; x=1703500877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAExNJX/YhcccIuIFbir4pLgBR3qGdMXJeV+rbaaqC4=;
        b=UEKlJVcAEzADmytrs+iFH43Rah0dv/m70H9Ojo+SrlUCpG9F+EeMZySQhImOsEw921
         AB+PmWJAFyfUxGJgicKSO13Foy3FVlvrO4PfgW1nt3EAmrWXs1zv2aAXdkZ4L+14oL+x
         4GvhpweRqUsoOG7G5LKWm7u3ilx6BYUZCjElyJHNKDZRU0W+FoSFesMPsteN7zcYZBs6
         krNrUhyS+Kqzq+n3SDqjqObFFiKLi41yfl9dVLW4+9TS4ObT2DnK1lgcvjFqgSZfgTuO
         diISp4/QhkobalogQwsxf+Zc3HK/AL1wBc+XpqwkJBc94/sNuMzJ0XP0vucI3cozOEKc
         NB9Q==
X-Gm-Message-State: AOJu0Yxa2tzHYgR6Eiv18q6C16pKUO/ILVRkh2bieFPJf06NbRDCuEWg
	hTZm7X4umBbNNrtDzO/qO/qPpQ==
X-Google-Smtp-Source: AGHT+IGDKrqtxtZbZ8QYlYUWKhg2x8cwPY4Y/RPNofta2lY7xmBPtEBlNRLdIG8f3YPqu7ksXNPzqA==
X-Received: by 2002:a05:6820:607:b0:590:2df8:1bc7 with SMTP id e7-20020a056820060700b005902df81bc7mr12054984oow.1.1702896076749;
        Mon, 18 Dec 2023 02:41:16 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 00/10] RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest
Date: Mon, 18 Dec 2023 02:40:57 -0800
Message-Id: <20231218104107.2976925-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024118_362324_3371964F 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series implements SBI PMU improvements done in SBI v2.0[1] i.e. PMU snapshot
and fw_read_hi() functions. 

SBI v2.0 introduced PMU snapshot feature which allows the SBI implementation
to provide counter information (i.e. values/overlfow status) via a shared
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

The series is based on v6.70-rc3 and is available at:

https://github.com/atishp04/linux/tree/kvm_pmu_snapshot_v1

The kvmtool patch is also available at:
https://github.com/atishp04/kvmtool/tree/sscofpmf

It also requires Ssaia ISA extension to be present in the hardware in order to
get perf sampling support in the guest. In Qemu virt machine, it can be done
by the following config.

```
-cpu rv64,sscofpmf=true,x-ssaia=true
```

There is no other dependancies on AIA apart from that. Thus, Ssaia must be disabled
for the guest if AIA patches are not available. Here is the example command.

```
./lkvm-static run -m 256 -c2 --console serial -p "console=ttyS0 earlycon" --disable-ssaia -k ./Image --debug 
```

The series has been tested only in Qemu.
Here is the snippet of the perf running inside a kvm guest.

===================================================
# perf record -e cycles -e instructions perf bench sched messaging -g 5
...
# Running 'sched/messaging' benchmark:
...
[   45.928723] perf_duration_warn: 2 callbacks suppressed
[   45.929000] perf: interrupt took too long (484426 > 483186), lowering kernel.perf_event_max_sample_rate to 250
# 20 sender and receiver processes per group
# 5 groups == 200 processes run

     Total time: 14.220 [sec]
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.117 MB perf.data (1942 samples) ]
# perf report --stdio
# To display the perf.data header info, please use --header/--header-only optio>
#
#
# Total Lost Samples: 0
#
# Samples: 943  of event 'cycles'
# Event count (approx.): 5128976844
#
# Overhead  Command          Shared Object                Symbol               >
# ........  ...............  ...........................  .....................>
#
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

Changes from RFC->v1:
1. Addressed all the comments on RFC series.
2. Removed PATCH2 and merged into later patches.
3. Added 2 more patches for minor fixes.
4. Fixed KVM boot issue without Ssaia and made sscofpmf in guest dependant on
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
arch/riscv/kvm/main.c                 |   1 +
arch/riscv/kvm/vcpu.c                 |   8 +-
arch/riscv/kvm/vcpu_onereg.c          |   9 +-
arch/riscv/kvm/vcpu_pmu.c             | 246 ++++++++++++++++++++++++--
arch/riscv/kvm/vcpu_sbi_pmu.c         |  15 +-
drivers/perf/riscv_pmu.c              |   1 +
drivers/perf/riscv_pmu_sbi.c          | 230 ++++++++++++++++++++++--
include/linux/perf/riscv_pmu.h        |   6 +
14 files changed, 510 insertions(+), 45 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
