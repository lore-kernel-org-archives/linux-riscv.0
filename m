Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43972C47074
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BaOhvMhs9fIfkHlPq3H001qk18UufA7CIpl01MepcTM=; b=Nlr0dW9nrPiLmV
	Pndn6MFkOtPozISMa0Ma5ngF1yCLyD8KLgJJ356pI1eEVOqbbSNhflCdfPhwwJxDBmPhGhi3dR1cD
	NJ2yGaR9MJFSTzYs1mpFR1coxDqVEM/JkYASiKT5Haf5AuJVdxG9Kyom31YDtagqNXZfxULuYrjDn
	H2xcuslmuxrG1Rl+TDepou1uQ55QStPeTnphL6vVE4JXFj8frOMe3wpn+UGNiwhSxZFKZZB+ReNnU
	sIXr3BDClqx0W8rKNkg1uMBrgbXdb4GCxK0oujjq/3q3u4Q811+7YGOWei9ids80iujQWprIgF6zL
	ZCnOlpAgM8DPByK4CJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk2-001bkA-19;
	Fri, 29 Dec 2023 21:50:06 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKjy-001bhg-1F
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:04 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-58dd3528497so4324561eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886599; x=1704491399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vu5q4X23PA3gtec4TspOf+EMnf830wRQIwKELSXAAlg=;
        b=Z5MZTu4nVmLgHu+1/lltrkMOyBvMOsCX4pObGFVT5LfgHyiWudMJcBpKnf4KjjkiMh
         cpr/FccqsuKepGozASYhoK1tG3G0td5f367BW47qfWDy6MFiDj0L26RFCsmGTaIX5STq
         xPNSJo/YVoDSU7LMNXTOUKBJXsVphR0e13dBm8yuMqMGa0rtmWQCPHaQAeuTTwJAA02f
         qJeId5CaFpImyR/DnPYSsbQTy3F6Pn+OeNBJwWDWFq6R+g2jk1u50GtDwPTPbUy0oiES
         8Vjhl6e/PHkZf0HcpUPJSXp5VOQSXZrBroOU1ayF77o9Q82BZuq6AjjGaMkN2+MToIVn
         e1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886599; x=1704491399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu5q4X23PA3gtec4TspOf+EMnf830wRQIwKELSXAAlg=;
        b=KTc0n0jjK8md8WTu4KCFXPdPxV7rmUMEY5sPw+lQ/r58RqjnyQVf/8gbAbi2PgPUeP
         VnueRSpHSaHqDFFlDt/FlUrAiDw6TKzeOeDK4gCGfHInsOW1hf18gV6P2+lk/3Z5abcl
         1lYZLgg2mn1lGyODeb6+NmCVy1vne9ovDBU6aPQ4QJWkK2jMmGgfzaXPnRluH2WlJ9W7
         CYdsVFoAsDNBfRDpqoaKep+Y3/AHChAzADJrNdKZOGNILjPedKGA0Oq9utj3ezVBjAH9
         pBLFMYj2QmntxejLCLe0wnmiQl0Ix15iTRlhfa6PklzITbov68MrzDT8QyToPRQKcXAh
         QWYw==
X-Gm-Message-State: AOJu0YyEZvJrjwoCCaQ9agTU4twDWprmfKchqCvQqiTgQo6jYJ3vx1m2
	UFrTIjzR5DZ8OWVgxmJleEbw1giipRuvlw==
X-Google-Smtp-Source: AGHT+IE4adQTrYfGl0DW+ARqwiPxecQVrJ4ALqtPDiAPRb/B3Ew7k6CVBZfqktu9JrRBtv0ixr8PrA==
X-Received: by 2002:a4a:5b07:0:b0:595:3fd1:295b with SMTP id g7-20020a4a5b07000000b005953fd1295bmr263275oob.7.1703886599285;
        Fri, 29 Dec 2023 13:49:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:49:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 00/10] RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest
Date: Fri, 29 Dec 2023 13:49:40 -0800
Message-Id: <20231229214950.4061381-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135002_652868_85306EC5 
X-CRM114-Status: GOOD (  17.76  )
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

https://github.com/atishp04/linux/tree/kvm_pmu_snapshot_v2

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
arch/riscv/kvm/main.c                 |   1 +
arch/riscv/kvm/vcpu.c                 |   8 +-
arch/riscv/kvm/vcpu_onereg.c          |   9 +-
arch/riscv/kvm/vcpu_pmu.c             | 246 ++++++++++++++++++++++++--
arch/riscv/kvm/vcpu_sbi_pmu.c         |  15 +-
drivers/perf/riscv_pmu.c              |   1 +
drivers/perf/riscv_pmu_sbi.c          | 228 ++++++++++++++++++++++--
include/linux/perf/riscv_pmu.h        |   6 +
14 files changed, 508 insertions(+), 45 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
