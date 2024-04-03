Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96243CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvejMZijf+z2bOtLlmYlGqwW3sJapgbwXvYquQEtIpE=; b=nCfSS16rMKPYgu
	2lkZ3DJbaoBr83f0TTY/M2Sq0GUdeSKno44SBm2HtCyQtcwDZVMrthVY3Ayu8X2P8ZF13jQG4Qpky
	1woHlMtSE76B1nrdEN4oVpknfkiSL4cfogNhRckCe4iVnySk6QJb9HSwp9S7H7XPW09MfYPffPCxH
	x7ajtCfzUwJ0t/T/MIFqvPr2pZhoEfXL/tc96/qUYJnI/eHZIuriAwT5VYg6ntMZspWku7szJak7v
	Ciy0WBBUUJRfn3QrIOf08wnXxEAutQNUqadtMCl/P6RIkVr9YHqCBA7lm7391r/MngII73g5gO52k
	OT3mmnreX07izIulpo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwls-0000000FAAp-0TqS;
	Wed, 03 Apr 2024 09:19:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcQ-0000000EiSG-0kp6
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e6b22af648so543529b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131512; x=1712736312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAQb6AgU0TNkegozu248Es6j4yjx/+ZT77t1PbS0odQ=;
        b=HcXKiKnWrZzwJ3cEaaZU7tx5fzdUXDBzn4TsfgWflQdhz+UeMUR2NaEBrWOko7yYHF
         3YSiSnGGsTr/mN12ompdeikejdHpg3yqAo7Jt0G7Dfl46kWfzA4NCDBcj5e1BVb6eDMX
         gD8IMs+nd4peCQNTh+4vLMKdg8/+QF6I01UpQMXo8LXdWX5yBkGyDjc2GyR1+5gpp2bz
         qHi5L7ctVLlOSS2Hy9uD4yUoAt0caVzbsl90Xrq23vLfa0K7CCUt3G8kV6CpVeLl2CI0
         acbAd7+nNhkMGFbqyIJP4NCRBb1ym/Qq4+IU/tK1NamGdLinoD+bqGda1WYc+pvSEcTE
         0lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131512; x=1712736312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAQb6AgU0TNkegozu248Es6j4yjx/+ZT77t1PbS0odQ=;
        b=vfUFkPN01t6Mg1wYE8X/D9cqzp6V7/sqqY0v3iKway1akkVifC89F2381opsXGm9tI
         InC4R7OlWzyuJN1I22qcDBokV8B7isKU1u0MX9gr4mnucMqFwy1MOY1BYSR/mgnXAZLI
         8Sr6JuYuBWfA1EwBytPgma+Z+O4tQsI/oauCKIr7NSiMLfktnZGwTx236RpbeKLyQ7DT
         ueiG49kEuwZOVJNVRSAayt9ZJnYwPTEzWgak5rRTsZPjMg3H0RX6KJztzoRF1S9dtuPs
         s3tO1aMxVLNJSZMHiaFK2mIn0AKMIa0sG7UdOmRRQLZcQLYW3J90zDrExlYAMATVLARG
         +0eg==
X-Forwarded-Encrypted: i=1; AJvYcCXRc5Az3bN9IIQA1GXcKPWuCneXweepocGL3gbJ8TW7ozwJmrlLGBdW2SykMhE8fVZdESIMmDJHi2R8W1U6dfbdkZd9J4EdltEYX6ak3OkE
X-Gm-Message-State: AOJu0YyHte7T/fB2WZ/jtVVDJ92p9TTk8Bib4db9Z2orS5B90/pdtO6y
	zs8PF8m0R02P7mX4MwDRb8nVbSKPHEh+cSnO4xm9etqkgrj4OXuCro8JBf06GgQ=
X-Google-Smtp-Source: AGHT+IH1ObGbJnOylUIYtPaKxPQX/e31jRX6757UC1CCyrEGxin9M/CZPd6LYiKaCl4kIApu3re5ig==
X-Received: by 2002:a17:902:d48d:b0:1de:f571:837c with SMTP id c13-20020a170902d48d00b001def571837cmr2453328plg.28.1712131512011;
        Wed, 03 Apr 2024 01:05:12 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 00/22] RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest
Date: Wed,  3 Apr 2024 01:04:29 -0700
Message-Id: <20240403080452.1007601-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010514_335490_BEF3B0CC 
X-CRM114-Status: GOOD (  22.46  )
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

PATCH 1,4,7,8,9,10,11,15 : Generic cleanups/improvements.
PATCH 2,3,14 : FW_READ_HI function implementation
PATCH 5-6: Add PMU snapshot feature in sbi pmu driver
PATCH 12-13: KVM implementation for snapshot and sampling in kvm guests
PATCH 16-17: Generic improvements for kvm selftests 
PATCH 18-22: KVM selftests for SBI PMU extension

The series is based on v6.9-rc1 and is available at:

https://github.com/atishp04/linux/tree/kvm_pmu_snapshot_v5

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

Changes from v4->v5:
1. Moved sbi related definitions to its own header file from processor.h
2. Added few helper functions for selftests.
3. Improved firmware counter read and RV32 start/stop functions.
4. Converted all the shifting operations to use BIT macro
5. Addressed all other comments on v4.  

Changes from v3->v4:
1. Added selftests.
2. Fixed an issue to clear the interrupt pending bits.
3. Fixed the counter index in snapshot memory start function.

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

Atish Patra (22):
RISC-V: Fix the typo in Scountovf CSR name
RISC-V: Add FIRMWARE_READ_HI definition
drivers/perf: riscv: Read upper bits of a firmware counter
drivers/perf: riscv: Use BIT macro for shifting operations
RISC-V: Add SBI PMU snapshot definitions
drivers/perf: riscv: Implement SBI PMU snapshot function
drivers/perf: riscv: Fix counter mask iteration for RV32
RISC-V: KVM: Fix the initial sample period value
RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic name
RISC-V: KVM: No need to update the counter value during reset
RISC-V: KVM: No need to exit to the user space if perf event failed
RISC-V: KVM: Implement SBI PMU Snapshot feature
RISC-V: KVM: Add perf sampling support for guests
RISC-V: KVM: Support 64 bit firmware counters on RV32
RISC-V: KVM: Improve firmware counter read function
KVM: riscv: selftests: Move sbi definitions to its own header file
KVM: riscv: selftests: Add helper functions for extension checks
KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
KVM: riscv: selftests: Add SBI PMU extension definitions
KVM: riscv: selftests: Add SBI PMU selftest
KVM: riscv: selftests: Add a test for PMU snapshot functionality
KVM: riscv: selftests: Add a test for counter overflow

arch/riscv/include/asm/csr.h                  |   5 +-
arch/riscv/include/asm/kvm_vcpu_pmu.h         |  16 +-
arch/riscv/include/asm/sbi.h                  |  34 +-
arch/riscv/include/uapi/asm/kvm.h             |   1 +
arch/riscv/kernel/paravirt.c                  |   6 +-
arch/riscv/kvm/aia.c                          |   5 +
arch/riscv/kvm/vcpu.c                         |  15 +-
arch/riscv/kvm/vcpu_onereg.c                  |   5 +
arch/riscv/kvm/vcpu_pmu.c                     | 260 +++++++-
arch/riscv/kvm/vcpu_sbi_pmu.c                 |  17 +-
arch/riscv/kvm/vcpu_sbi_sta.c                 |   4 +-
drivers/perf/riscv_pmu.c                      |   1 +
drivers/perf/riscv_pmu_sbi.c                  | 264 +++++++-
include/linux/perf/riscv_pmu.h                |   6 +
tools/testing/selftests/kvm/Makefile          |   1 +
.../selftests/kvm/include/riscv/processor.h   |  49 +-
.../testing/selftests/kvm/include/riscv/sbi.h | 141 +++++
.../selftests/kvm/include/riscv/ucall.h       |   1 +
.../selftests/kvm/lib/riscv/processor.c       |  12 +
.../testing/selftests/kvm/riscv/arch_timer.c  |   2 +-
.../selftests/kvm/riscv/get-reg-list.c        |   4 +
.../selftests/kvm/riscv/sbi_pmu_test.c        | 581 ++++++++++++++++++
tools/testing/selftests/kvm/steal_time.c      |   4 +-
23 files changed, 1322 insertions(+), 112 deletions(-)
create mode 100644 tools/testing/selftests/kvm/include/riscv/sbi.h
create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
