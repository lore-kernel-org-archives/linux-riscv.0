Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E571FC88E41
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gRrLeGDNBJPeFcvDg0vPSkbn04BX11VFM6TlHs5jEYg=; b=HELIxiRl7XxAtF
	TwbLXmr0fUDauOSPn/9JQ4MP+c5ZIef9HgLAU74jC+o8vJU3Vn0dNuHfRc80jiSRcanI6N/cmM3hB
	225SoMxsAhDWTHXRi4TpVotttLdp8aqEqDM49Z1IgT9XxwNAP0MCd0xYF6Yw/PtAXYKU8Xo8HwaDJ
	ZCFsX1Fi0Gzln3mMAF7kkG63D/VeHadWiRZYfFco6JTRH5lbXCeYpZFBqcPJGe94LcE//fPrq+DvN
	hD6GF2H3tRa8CwqF0doHS2s+tvnDKE5G067NpIxrQAQfCycrnJ5qQe1NRBUOm2Gxs1Z34oRZuTzGc
	tpT1MyCz/cmJKMUKy8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4umf-0000000FvuY-0l1q;
	Fri, 11 Sep 2026 06:30:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4umd-0000000Fvtz-1Wc5
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 06:30:48 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cbedf433a99so688212a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 23:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789108246; x=1789713046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6fEOf/IOiBj0LrijFeZ/8VfHCADIoPG1CxdjXEq88Q=;
        b=VRNcnqiI+Y0KvejsDqc66u78DC+4bEOi56OfULHeW7dJ2Qfou7QnDp8N4n7v9W1cpr
         E1JeLJebp55cN+gfcetaBekJIOPpSsVVy2VtlxtMkyuzGNEvXWvKG1nyD/UOl816ZTd1
         5E9DuWL3E+nH4Tz6EmxjBkXCFPR6UwMsaJ+4U0AGfMdSMyNrCue5XFfimk3J8xbGNL2T
         OWA5jxvvGFSeqo/mLTdGsBzYZDDkMIK8R0rzKYiWwCayslr8r/r/CulIlzCzx79c8LpS
         SAt7Huv+QnKUa80fSTVAlkdOsRvyLURXTFc9J1fUNy0MraU2M68axlS7lZ4h5SUo+Ion
         8gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108246; x=1789713046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6fEOf/IOiBj0LrijFeZ/8VfHCADIoPG1CxdjXEq88Q=;
        b=Vj7AvhEm4Uwpujiby2QxKUnSjI9KJ6rXbUV2tbIDXuinU4d8dxsnWUNzcTjvqQliBf
         /wf/QcziBYbPmCTzyt2ZlA7bRNv1MdIioYxrATMcMIFcQ9nJ2y9GEnWIpwyEdlVD0Tdi
         b9QriEMOm4j7weucvAmbDmLhjCUFLIOjTkomjchcxxXbV9ORKZN5ENJR3283B7Fwp6aZ
         BU3s4iGN1X6rnJtoz9OgbWdoYomV5CuMEdPLMSwc1iHpgUzrYWdwoocryCpRXOy7Y+V8
         AVkg6G2AR/W4jrVbJmi6fOr1XJ/Vvr1xOahBrFR4k7HCNgPzKaTB6nVDlyNev5yhDo8D
         8l3w==
X-Forwarded-Encrypted: i=1; AKwUvBxc7alvk1NW58ZnvpbUl7oCvmOM2Hos/aE4sQo2LXhpv/VVR2ZTRnfx+sw4pgBtouX4Gjqtg6YNz+eGAg==@lists.infradead.org
X-Gm-Message-State: AFuF++kYWpPcLLtCBqQ/FAdYtmGomP9z5jzxp65b6d8uRpDJUtpJ6cZe
	MjRc9LN3humrFI6GnFCnpNwdBzyjOWbiKd65pMTMMpSEpZ4jiOVxHuWov9wATNQAuD4=
X-Gm-Gg: AYBFou36KVI3VVd/9AsOiAgZ0JC2x+bEmVXpbQFv0oS7JfJzTghNDE2ohMl0snMCMMa
	tTWZ4jUMIQfzTThSkPwb9ihQ1wAqCtrjrVsaMFQFZw6c/YaKqmPP6c/GDEy+48/44WJkuHfYKXC
	WEN5m8owJsOhxYep7jQphra1UyCT8SsW7TRh1GuLt9RmQV8rnMT1H8sSn5AbunBMzXC9TZobXnM
	EM6UhdqP+NRNhHCY5pWCfhPMjaOey/XxSVpCXFCVNkU+7FPFBFjjF6Xf9VCNe0jHMjih7Obq9Ei
	6fEiRhXCUoBoWuD+hYLx2UET9m2wCREj4o5tVQnyEgiX/uY8aFOvCPQu8Km+WILCmNBD6FdupOe
	LHx6jS7eBL1V7biZ5r/WZWfJxx6si6ezzWrZqbTWAoDBueU3IYrW5KT+oXKVvAwDmIkXBWXLBXG
	fBv/V5u/80ZVLA4BlzY5evaoMCBFtUtc3DRZmhFp/K2nBhvLuI64wluRnUXqlR1RFaODx/rO+5Y
	6pW10ZCff/koHCNEcpvvw==
X-Received: by 2002:a17:90b:1650:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39d9c34266dmr4534758a91.23.1789108245853;
        Thu, 10 Sep 2026 23:30:45 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm331152eec.8.2026.09.10.23.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:30:45 -0700 (PDT)
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
Subject: [PATCH v10 0/2] RISC-V IOMMU HPM support
Date: Thu, 10 Sep 2026 23:30:40 -0700
Message-ID: <20260911063043.916844-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_233047_411476_2A02C18D 
X-CRM114-Status: GOOD (  16.77  )
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
 drivers/iommu/riscv/iommu.c      |   37 ++
 drivers/perf/Kconfig             |   12 +
 drivers/perf/Makefile            |    1 +
 drivers/perf/riscv_iommu_pmu.c   | 1042 ++++++++++++++++++++++++++++++
 6 files changed, 1093 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
