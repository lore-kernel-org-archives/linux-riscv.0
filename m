Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B16CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DV3oq+YRiEGtPmCju0OXPY0Q4vEO6aD5/m61jK526JY=; b=zVwCcLoqgJkn/+
	PBE2M5e03UCcifAIGmF+Bnh2Jp5aal8Uct4TOa1+VF5CpS4A8CAjIkV39ckHRIVDxFc/2rLbcmJ0J
	GijG3cDDSz7NVRXtStbmdTaL5/xNTMc9FV9/73IHPFgFATeOpbl8kVAAVFgLgsRW6aTs812dKAVy3
	foi/q7iPB4DjZURb6g4xU3yE7O5QhCXBdBw78/Bba2/Ibcq0hJIFoZls4kQA/2n67i1bkgE/CY9em
	1bYC+YO1ZU8Puy/cNWkgZwkTmSariPrKmV/wlxyADzrpTdTHaFoL1b9lH4DpgDZk7N1DSQAjXaONA
	2wSSur+mVgM9/6+jrHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWpd-0000000Aj9i-2Bi1;
	Fri, 02 Oct 2026 06:33:21 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWpb-0000000Aj95-1OPL
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:33:20 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-34c4a0868b6so1449634eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790922798; x=1791527598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7cgR6ZneSf8y5V7zAIslHSi/tYxEvm4mPs702VSwro=;
        b=amFnWaF/94R4nJHFAAW1Au15wrQ9ifBZr/jZ3ct/P2lfbsIgZ8x9qrDXsnZ4D0DNEJ
         jr+eK5xg1L1yh14dwaFL7XLBRR2CjuW69Y5HZn7C2RndmXQlYeLoX8dsAybclTdMh9Xo
         4Vr71PCD5KYFLtezvTJx6eepX0xy+ONqMvV+F3lGMEas7FafJkgDp2eyyh9qkMVOGN3/
         HTaJ2aUpAusa41BvGLJPQYFN6ZrV1jkRHocD2Gmd2rV7m3IVD8/4P8NMSGSbazKXPxpT
         hUyIvN+dzCkRBtyZTDVEKBtveaXOz92o060MwzWLFABBxvD7HnZGOnmcwurVAqai9ahQ
         dcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922798; x=1791527598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7cgR6ZneSf8y5V7zAIslHSi/tYxEvm4mPs702VSwro=;
        b=ywf622NKJz6houvIhLLeS07SIErItId7/LdBepS0RhesxrkNk2c0XJMY6Kfa0o4b4c
         bFFPxLEqOfZ0W+LgG8S30+RzcNQxqptRsbqJAdBYBamG3UhbHs6zgNlpQNVRsKXPhnDv
         hMiz6ZFrNlFBv0bCnhQ8Vv8TYQedNc59+qybzLlRY+SlzkW6UYfeu1drFBVG0EeO2gJx
         x6IODwobDWBWl1ZUp0zXoJYOucluLq2Bl+pFdwdOkRsNmjB9lz8htvQeD6JW6iboS0g/
         tlPEzIbocyogpzPTBEUBFiPYEHSrPZDkX51JXBrYQxzZXiSs2VPdbYELiqUHKWVf/2dO
         JWfw==
X-Forwarded-Encrypted: i=1; AKwUvBzWB27HbnwRDiHUi0mMAe0vKqf1FbC1aFetQ3hnt6U4KggFutt6enfg6CHbFgcJCJH4IyVjx9HGNwePHA==@lists.infradead.org
X-Gm-Message-State: AFuF++nZehOOEsOV40KZpP6BPEQI+/1Z/Ra9mgN6thPlhchm5edgY+GR
	CxRC/qUZ6CbJKz49W41BmrcGX7x1qqF9UMgWPDUkIJAabDWlGLU36LZHTobd74RmUyg=
X-Gm-Gg: AYBFou35dofnOA6xbTp1n6PtEMOT85wN40TREXt+zLWNRG2vnURVpx8mbGHLULq2XUa
	GQOPJ2D1aPlLhw1858YzmiU2OEbUA0tK8qXQyNgmokpQO/3Tz4QQ5FHeGRfKNudnLt/J5/W0/kl
	t1hqOExqoTysCDp+OawAhZt1zaAi7wL+9AsIRP6XUN8LCF006rgYJO9P9hzwdVvd1whFRajpGsV
	imDJYA761GvhfKtm5rhfuMhLsUtlTth6Ho9/8uPznfXELp9SyVDm6a9IRLPGQ10jRtErZVN7baL
	FCW8Y6f0uQrtomeC2xV1KcxXayUGaH+72q1/W3ojYA1iBn8CYWvhlDYlyLP0s2P3eXUOIXOFLxk
	jYXKKahRUQoFo0so/LF5UAhAb3xY0V0pH6LJvcwBdjx83+NhLt01+vliud2kVRxIV08lDw7CMx8
	kUTLa8IKtAVe7nfkv2CPxOD3xML65/j4W6MzZLfO3IQMzrzPLFFVlIYTcH6i6mWN10KHuMLKQag
	kVha9RyfPs=
X-Received: by 2002:a05:7022:7e82:b0:149:f2b3:efcb with SMTP id a92af1059eb24-14dd10af1famr6118991c88.14.1790922797740;
        Thu, 01 Oct 2026 23:33:17 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6315754c88.4.2026.10.01.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:33:17 -0700 (PDT)
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
Subject: [PATCH v15 0/2] RISC-V IOMMU HPM support
Date: Thu,  1 Oct 2026 23:33:10 -0700
Message-ID: <20261002063315.1535817-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_233319_393340_066FF20D 
X-CRM114-Status: GOOD (  25.15  )
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

Thank Joreg for reporting some differences with the spec.
One issue is that the spec does not say if the counters must be
continuous, or if the mask must be the same for all counters.
Since non-continuous counters and different widths are very rare, the
original driver assumed that all counters were continuous and had the
same width. However, this does not follow the spec. I also fixed this
problem in this version

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
 drivers/perf/riscv_iommu_pmu.c   | 1081 ++++++++++++++++++++++++++++++
 7 files changed, 1157 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
