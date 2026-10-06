Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F612CA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=poCR2Fitt57waW3lwyEK/BNf0a10hkpYtRyWGQjFH4M=; b=cgmC3VYKiRbUtn
	3bGiaI8RtnCNbvarPgqrNARYO8Xnjs3cqqBRnjF4fML/m5Gi1yO8cZcBxTWhe4OLrZuPPpJZCT542
	feZzsQPZ2xjo6bgw7fZv7YjzbQNAFKHUQiZ9iO3rb6mzj73OriomN0wJ9B8XgexuK565K2hD3TdU5
	ICMY7iM9/TJRxNUDS2hhRfR3yl3va1ayXsd5XWq/qrZ1JNDeRZg9zC/NsJDPLEJ1gxHKBNiFgoT7E
	UsccZeZSXZmZbjNJbhus9/U1esms2CXIz/1W7FOSsoLng3hCmntt9xe/dZD7A8N42j3rg6mBcr85l
	MxaIoP2Vhfam5rjjYNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE15F-00000000Kzk-0oua;
	Tue, 06 Oct 2026 09:03:37 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE15B-00000000Kyp-3moA
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 09:03:35 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-154e9d2d979so1046021c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791277412; x=1791882212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9sHs8q4lscucI4vPZxD+59Nx1PieeXin2JvWxO3G7Kw=;
        b=hOfY+2F90wOj7f8jx46/BHmxwjT4YZE1iWT0ygr8NlVt0bvFxI6Kxvp3X2dp3N/tFb
         AevDI7D/w4JZUlTswIKK62c8MHHDCjjhCJnFpqWbDSZwHYrmsUKj0seMJi6j0FAsL2jy
         udTN/oxWoGa20kD/RXMGD5/Q7fuy3G2rOueSpSd+KhWi4lDycMWsLqFX2T/cPQfPoY5W
         tgz963MlAaqIXei4MM8CtrOHc9p6bUq3HQdhJ7+5De1JEDPN8+N17i9TRFWygQdZ99DH
         YuoCEoqCPCCV2wYabFT7TFOhj9DHWgzxlwhYwoAtPHAVXa0EuxmopC/7cZV9QJ68rjhz
         F9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277412; x=1791882212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sHs8q4lscucI4vPZxD+59Nx1PieeXin2JvWxO3G7Kw=;
        b=n5lnqj8wxO33bGi0pykSowCGm5uO83iRLHqriPCawUEduH7ErITzFWmyg1cTBbRLeE
         pqFyto3ONm++ZucBw7UPW6Cm6zICBk7dFRB+7r0sjcv6QSgjKhps+/Bkxg2RWdQ9Xchm
         rEBl+lcsi9bBpuBb3I0XK/i6rzdNec/002gv+o6L7nCK/0OocXt8PyJnOAajnuPHUJ8e
         NmCBXdcjnO1TkfgcEDo2x0Fq8gMP7tWldorxaKvDhXz19TINP8leparQxF2Krybm0Cj4
         58XIkABo47ZZAycbTfm3Sst0/PWpyoqrXbLQ3JG41P+arA3S5lXevnVn8gSaZBEg851M
         xJUg==
X-Forwarded-Encrypted: i=1; AKwUvBz4uj95TnEhMxiKByPhh0Lx5eoJ6RyOtN14IJywdKTZQXwDIFV+wzLnzMKTULA7yzOaJsMHtxcNs4ulYA==@lists.infradead.org
X-Gm-Message-State: AFuF++kdvjaMktxPeQitdegVGmj1xx144zTrDODcsxQQCbfCV/2v+BhM
	UuWo5kDvhSlZIZUtmN9fe1UTgkzbjGVSWfqLOsVHqLw6zajmqJFUgHCCnzRuCUK3T2Y=
X-Gm-Gg: AYBFou33Y5ZJIIc/TaVUJptiR1dARedqfBmkiUREC79vF8dPa7hzt74VXwXE5O/eVIC
	34NvTJ0Ts1cH1z+fp9ENOlCnIsFu9FxwMEHgdSu/SWYrW5fzTY1yAc9wiovsJYhgRBNsWqpAqdm
	4s4dk+UZCnsPGC0na1UQ051OF9F9lbkhx4p3YbVwiFJU8zfD0qzZf0Pz0JL85rdcDOO+GFY6PS9
	+gKAgRmGG2k326yEKOo6MOIs9baTa8agazFCqY6R+pjWraXsyCzIN5WSvX0l+zpm5B+WPJfkRNJ
	Zfirv3pO5+hqQcPDy8dqdI0L43Ua8JT7p0fPmgnrerGYRrc5ieLCImq1AtS5ay9IOUawIit01uf
	0Ux33WTsbsvl4nd8rmOd5scuoxiB7kJRrJYCAh+S0ichuAj4IJ57751vtIelXgJmMb5WkftUiD8
	OZcIGPPv1MwLsXwPRKfJg1DTs8eKHBAI8W0chUbHsl0mQHWAvZvXGJeutUvXf8Eh3FdaMmgotd9
	FArT7i9pYg=
X-Received: by 2002:a05:7022:4086:b0:151:7831:e403 with SMTP id a92af1059eb24-15ec7727b08mr1026954c88.13.1791277412387;
        Tue, 06 Oct 2026 02:03:32 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d82d04c31sm5891353c88.7.2026.10.06.02.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:03:31 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	nutty.liu@hotmail.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v16 0/2] RISC-V IOMMU HPM support
Date: Tue,  6 Oct 2026 02:03:23 -0700
Message-ID: <20261006090327.309550-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_020333_956087_9C57B070 
X-CRM114-Status: GOOD (  22.51  )
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

This series implements support for the RISC-V IOMMU hardware performance
monitor.

The RISC-V IOMMU PMU driver is implemented as an auxiliary device driver
created by the parent RISC-V IOMMU driver. Therefore, the child driver
can obtain resources and information from the parent device, such as
the MMIO base address and IRQ number.

It seems sashiko-bot is giving conflicting advice about whether to add
a lock to ->read(). No matter if we add it or not, the sashiko-bot always
suggests the opposite. Looking at no lock case again, sashiko-bot
concerns about a BPF program calling bpf_perf_event_read() from NMI
context and self-deadlocking against the IRQ handler, but that scenario
cannot occur here:

  - bpf_perf_event_read() goes through perf_event_read_local(), which
    refuses to call ->read() unless event_cpu == smp_processor_id()
    (kernel/events/core.c). All events on this PMU are CPU-bound and
    non-task-bound (->event_init() forces event->cpu = pmu->on_cpu and
    rejects sampling events), so PERF_ATTACH_TASK is never set.
  - More fundamentally, perf overflow interrupts are not NMIs on RISC-V,
    and every pmu->lock critical section in this driver is held under
    raw_spin_lock_irqsave(). There is no context that can interrupt them
    and re-enter ->read().

No other driver under drivers/perf/ uses a trylock or in_nmi() check in
its ->read() callback, so dropping it also brings this driver in line
with the rest.

sashiko-bot also reported that migration calling trigger a NULL pointer
dereference. I don't think this can happen on current mainline.
perf_pmu_migrate_context() does not touch pmu->cpu_pmu_context unless it
actually finds events to migrate. This used to be a real hazard: before
commit bd2756811766 ("perf: Rewrite core context handling", v6.2-rc1)
the first two lines were per_cpu_ptr(pmu->pmu_cpu_context, ...), which
did dereference a pmu-owned pointer unconditionally. That is also why
several in-tree drivers pre-seed thier ->cpu field with a real CPU number
rather than a sentinel, and so do call perf_pmu_migrate_context() in
this window, without any reported oops.

Changed in v15:
- Rebasd onto v7.3-rc6
- Use devm_add_action() instead of devm_add_action_or_reset() for pmu
  unregister. Reported by sashiko-bot
- Move local64_set() before riscv_iommu_pmu_set_counter() in
  set_period(). Reported by sashiko-bot

Changed in v14:
- Rebased onto v7.3-rc5
- Support sparse counters and the different width of each counter
- Accecpt custom event ranges
- Verify IDT supported in event
- Add warning message if riscv_iommu_hpm_enable is failure
- Remove raw_spin_lock for ->read() flow

Changed in v13:
- Reorder the registration of cpuhp action

Changed in v12:
- Rebased onto v7.3-rc4
- Add raw_spin_trylock_irqsave for ->read() flow

Changed in v11:
- Rebased onto v7.3-rc3
- Add riscv_iommu_hpm_disaable to destroy aux dev before MSI is freed
- Fix CPU hotplug race risks reported by sashiko-bot as follows
- Re-validate pre_count after reading hw counter
- Move hwc-state into atomic critical section (pmu->lock)

Changed in v10:
- Optimize hi-lo-hi by do while for hypervisor case
- Add raw spinlock for cpu hotplug race and IRQCHIP_MOVE_DEFERRED
- Remove irq work mechanism for IRQCHIP_MOVE_DEFERRED

Changed in v9:
- Clear PMIP in irq handler on wrong CPU for re-triggering IRQ
- Add a lock in offline_cpu to avoid cpu hotplug race condition

Changed in v8:
- Rebased onto v7.3-rc2
- Add irq work mechanism for IRQCHIP_MOVE_DEFERRED case
- Filter multiple cycle event case

Changed in v7:
- Rebased onto the v7.3-rc1
- Remove raw spinlock
- Check CPU matching at the beginning of irq handler
- Add PERF_HES_STOPPED check before overflow handling

Changed in v6:
- Rebased onto the latest v7.3-rc
- Use sysfs_emit instead of cpumap_print_to_pagebuf
- Set up on_cpu and irq affinity by cpuhp callbacks
- Change type of on_cpu from unsigned int to int
- Reject filter operands of cycle event in event_init
- Check return value of counter number and  masks in probe
- Add raw spinlock for race condition (third commit)

Changed in v5:
- Pick up suggestions from sashiko-bot as follows
- Fix event group validation for sw event
- Bind IRQ to aux PMU dev instead of parent IOMMU dev
- Clear OF bit when event is NULL
- Improve hi-lo-hi patten
- Add back IRQF_SHARED flag due to mismatch
- Manage cpuhp and pmu register by devre

Changed in v4:
- Rebased onto v7.3-rc
- Use is_sampling_event() instead of accessing vairable directly
- Rename the matching name from "iommu.pmu" to "riscv-iommu.pmu"
- Change the naming of PMU device for avoid ":" in PCIe case
- Add suppress_bind_attrs attribute
- Remove IRQF_SHARED flag
- Set irq affinity to local CPU of IOMMU
- Allocate ID by IDA for auxiliary device
- Pick up suggestions from sashiko-bot

Changed in v3:
- Rebased onto v7.2-rc3
- Use hi_lo_writeq/readq to access register
- Pick comments from sashiko-bot as follows
- Set IRQ CPU affinity
- Remove IRQF_ONESHOT flag when request irq
- Adjust cycle event check by checking event_id field only
- Fix bug for group events verificaiton
- Fix KASAN issue about casting 32-bit variable to unsigned long pointer
- Clear IPSR pending bit before starting counter
- Clear OF bit in event selector register in irq handler
- Release irq by devm instead of explicit free_irq

Changed in v2:
- Rebased onto v7.2-rc1
- Use hi-lo-hi mechanism to read counter.
  Suggested by Guo Ren and David Laight

Changed in v1:
- Rebased onto v6.19-rc8
- Pick all suggestions and feedbacks from v1 series
- Add cpu hotplug implementation to avoid race enablement
- Move PMU-related definition from header to c file
- Change PMU driver to auxiliary device driver

Changed in RFC:
- Rebase onto v6.13-rc7
- Clear interrupt pending before handling interrupt
- Fix the counter value issue caused by OF bit in the cycle counter.
- Invoke riscv_iommu_hpm_disable() instead of riscv_iommu_pmu_uninit()
  in riscv_iommu_remove()

Zong Li (2):
  drivers/perf: riscv-iommu: add risc-v iommu pmu driver
  iommu/riscv: create a auxiliary device for HPM

 drivers/iommu/riscv/Kconfig      |    1 +
 drivers/iommu/riscv/iommu-bits.h |   61 --
 drivers/iommu/riscv/iommu.c      |   58 ++
 drivers/iommu/riscv/iommu.h      |    4 +
 drivers/perf/Kconfig             |   12 +
 drivers/perf/Makefile            |    1 +
 drivers/perf/riscv_iommu_pmu.c   | 1102 ++++++++++++++++++++++++++++++
 7 files changed, 1178 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
