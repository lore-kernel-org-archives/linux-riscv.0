Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF28C10DC1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1dH/p8z7aaFMNMNFk2uS5w4by3NYEQP6wQCnF13BfGU=; b=pZeR0vyVBJMstd
	u+4rpW4IIyU5TbuJ0Sa6zQsN3Ac7HCQhxMVRbjzrw1sH/I937JIxQ/ObUE1mflAt6OmTbSs7Mc4KN
	V3Hx39VziPupYkVXD9fJLKf7gJkmC4GQTcD0YR8jDQj58echqCtnfkrPhxJjjAlE5KmVdyteZnacv
	8sQI+KLqPULJKUIrdn7WgxaHfxg4jMY39TwDhLL/FfySrRHp9ihWYGvIizToL59bxCWuztpsaR6eu
	t3PKhmqYUQf7yREEyHGYNXKXJZ+RttdWuwIDFJLwYvydhV1oN1jgzJs0ZcxwpLcGXliZYyAbS1PUH
	wWVCJVS6OeHS58iDMtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPN-0063uz-27;
	Tue, 05 Dec 2023 02:43:37 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPI-0063sE-0i
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:34 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6d8751c8e7eso2244850a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744209; x=1702349009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8shb2vOgFxVQBulBoS+RFCfV8Kg5/sOHgmT3prY59dw=;
        b=NHH0u3udwEQTJxm3qGx/R4T1mpD1GmRGtXN0OBQ/CBkcNek6LzdpBhdDMTZ74ajBws
         yMk9C6lNqRRZgN02E2Uf/vEu3q8hud4n36ljKnV7X6K6a5vpCDI9LlXZl1br/JS8pTTj
         gHbKVBf6rPFDdbiiVKuatcKWHXG2JwQsgOB6T7/DKPZekU2rKbDfXbkn6Llyb3//Xnrh
         +GUGBz2PvizieH8/3/V+Mv0JR9uLepXCzPqOv3sTdBlRIihR+hzIXhYIlzq4ajSPohQm
         hGdzTDWlELZdXa5Mm+wrl3cgASNmv0V/4KJyh9w2tLA8F1Y5ikkwOW1awRC0SAFBKDnu
         iccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744209; x=1702349009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8shb2vOgFxVQBulBoS+RFCfV8Kg5/sOHgmT3prY59dw=;
        b=K6kaQPwkCRgz8UsmUIxTnv+obGXa4/c0nkRspAt1+eK8OwuP18M0IxkdL5c57wKUBo
         0xOxjk/+ltba8DZvp5YuggBQCRO3US10b3Pq7/zCFLRFJ9cXKZSxW2B+e7tQLKPMn0YW
         oM0uyv2nMyZu0crwSrp+v074qIcxXV3fJ2TjrRMX8kubNw/sxehkU2Ap3qFD3yT3IMUi
         zt2WjkA3qWtdvxEev8JWh1vGDQ97Zqs+SLrruFAkUGmokCyCxLfgcDYvJc81z//0pbxl
         2jh/oHAnWaAvZTm3coNSX6tVcXJwFU0li0OpKqJZmnKuL+2DRut4pqJWzQ8Fij3LwUrx
         v4vg==
X-Gm-Message-State: AOJu0YwutOZks7ElNtxwauXLOrX9btzH9+SE44Q2FuHg1IbbnUzhotUi
	vcethFUdBNWcfs2HGIab2YZSWw==
X-Google-Smtp-Source: AGHT+IERJeMapF5PThubupdp2gUedh1EYiqTSK4UR98xxgpusphnbq2HPdJsCgSUiJ59GqUNJjyTkQ==
X-Received: by 2002:a9d:75cd:0:b0:6d8:8053:af56 with SMTP id c13-20020a9d75cd000000b006d88053af56mr3847989otl.39.1701744209114;
        Mon, 04 Dec 2023 18:43:29 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:28 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 0/9] RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest
Date: Mon,  4 Dec 2023 18:43:01 -0800
Message-Id: <20231205024310.1593100-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184332_310797_98DDD8CE 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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

PATCH 1-2 : Generic cleanups/improvements.
PATCH 3,4,9 : FW_READ_HI function implementation
PATCH 5-6: Add PMU snapshot feature in sbi pmu driver
PATCH 7-8: KVM implementation for snapshot and sampling in kvm guests

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

Atish Patra (9):
RISC-V: Fix the typo in Scountovf CSR name
drivers/perf: riscv: Add a flag to indicate SBI v2.0 support
RISC-V: Add FIRMWARE_READ_HI definition
drivers/perf: riscv: Read upper bits of a firmware counter
RISC-V: Add SBI PMU snapshot definitions
drivers/perf: riscv: Implement SBI PMU snapshot function
RISC-V: KVM: Implement SBI PMU Snapshot feature
RISC-V: KVM: Add perf sampling support for guests
RISC-V: KVM: Support 64 bit firmware counters on RV32

arch/riscv/include/asm/csr.h          |   5 +-
arch/riscv/include/asm/errata_list.h  |   2 +-
arch/riscv/include/asm/kvm_vcpu_pmu.h |  16 +-
arch/riscv/include/asm/sbi.h          |  11 ++
arch/riscv/include/uapi/asm/kvm.h     |   1 +
arch/riscv/kvm/main.c                 |   1 +
arch/riscv/kvm/vcpu.c                 |   8 +-
arch/riscv/kvm/vcpu_onereg.c          |   1 +
arch/riscv/kvm/vcpu_pmu.c             | 232 ++++++++++++++++++++++++--
arch/riscv/kvm/vcpu_sbi_pmu.c         |  10 ++
drivers/perf/riscv_pmu.c              |   1 +
drivers/perf/riscv_pmu_sbi.c          | 219 ++++++++++++++++++++++--
include/linux/perf/riscv_pmu.h        |   6 +
13 files changed, 478 insertions(+), 35 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
