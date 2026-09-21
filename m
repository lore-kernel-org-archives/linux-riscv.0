Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E23C982DE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1czk7lvVWrwILeJhtWjuuFIONd76rZ8eITfCfSBEdZs=; b=JMarW+cVZ0UVxq
	5Hh8QLXHiRDPDMvfPndkzeEzX3ykb/q4FaG6jUKtlTMfm4uCYEan3BoiEABHmumGPfitq9hgM4jBE
	qaX84l2PcGNg2xYRzE+PHJr5asV16ZVy14oYlUX6Ew4T6F2YPc0RaRDnS0nhUe0doDk0W6+JSmdV3
	E4P1ouSeMIEwkl8dGrPishksJ/2tgMIMDSCM69SUHMYTXXxugIT/SKK/URPMjqMjDyHu/35Wd98LL
	KVMbKe9y+n8OWMgWZnxDxBwLrJvVM8XIRxAKoiJ8cZn/q6JIGhQgx1+F2ulcNYA37U5rHY8bEljPE
	kd6mh67IlULRCwToddtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZC0-00000001JgI-3Lbd;
	Mon, 21 Sep 2026 08:16:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZBv-00000001Jet-2KYF
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 08:16:03 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2caced6038eso23604855ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789978557; x=1790583357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=txdK8zZNvr3IeIOXJRWIc2g69quLivVkGnF05uJ2f70=;
        b=WgOmCdUuG4MUR/tnDahRiq/LqXsyfWC+sYejEfrL9OK38Mgk7//rerPxRnPV0QHEQS
         nxNQN2pJeg8BkNuQTGFhMKohq9x+sIFrYRtTN72H2HInmVaX87QKRdr0YGwdSxdZpRp4
         Zscuk2m+vdL6TEAZH+VA+vlbwbvM221GrJzFQQvVhgYRGpHKFaO1ZzcdalRkWbVbzUpj
         W39kCO2qnep/sjljIqTNYOB0/R25xBFmmBsCv80HxjuX7mq3bVqbz6kSRFbH9GrRthQR
         hkClIQCJYbHGQXvZt+QOp8TC3DwjwO3obR8nBy4IxQ+vuMCIqrGq9IC+nLGgG2qMm0of
         /84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978557; x=1790583357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txdK8zZNvr3IeIOXJRWIc2g69quLivVkGnF05uJ2f70=;
        b=FChZR/CdIHtN56qQidgfz4BXXxVEQz+SrvL/sifpl9kUpd5a8HdX0xYfGGlJKJ5HQy
         AB66PEQwah/vYjKJ7SKhWe1Pf0heqaauwEeTSH132n+fJ96eIpQTpM8o1J8aFCJvCMnq
         etndSnzFnDuZvHCEB2JJtvYs6X6KJfm3SgvuNorLmawwm9a2qBC90VIKZhI46Ft/I/VB
         ybB4qYcr6hNYkPLtMBHaNBL0uk7/n9JjgVvrh6p40vdTlkgj70xKjXa4879ehzPRZxw3
         HHAV7EST3JdSpqAdoi1l/RFbfl3s0M3PAr1lApcySXDMmP6L81JA70WUaLa3qK8jNmYN
         iyUg==
X-Forwarded-Encrypted: i=1; AKwUvBzIzaW8ENQR9wLy8VRG4SoCpwTtW+/gxfMH71KNyK9DM6PrvdDTSZMMYu2/yA7yfFuDd+6R95gmRaanHg==@lists.infradead.org
X-Gm-Message-State: AFuF++l0rWj2aNJKYW3e92osit9/OJ6z4B74u1TcHGvZUs+HcjV8Ifi9
	Z8h9ZmOIEPwUiEJD4eDJsoPSOh7mi3SCKu4MRgwQBKoQqs4fNsBDelJdcA8FODb6Ep4=
X-Gm-Gg: AYBFou2/ubLwUGAQgXqdhp6UymQt8MKkv0VCG5p/1lzOxzPhsbVhlH+G1GcxvMz14D1
	hNgzY22PUKkDKiorb1s1baSbEdZlWMiSriDiCYnVXk45YnE6xMnmAhjvS45DOKbqaDged1GRBrx
	EAcjqHlNfs2iEZRTAslW0XTDV92w+1YnPcE42tUresKkL/c/G+r92uufhK3FQY1jL7kGzaDMvvF
	KjhywD3tweSFwQApBWVzAN2FZZekNG//bfXP9+Q3l0MwWdpPbmaZQ7LB0QUuAHoE3p36OFOJiXT
	LB1fCEUXTlmRReIHP81P4r5PL00vxKZz/+ivcGlqoK3ScBy1oRAo8wOUuNxZQr3OFbhS0k5G0yI
	Ck4TiXN4OkOpAv8mXCj3I2TmZ3RACYVqAMuprLFu+bjS2YEGx9iRqBFlMaHveLMy9id0yE3O7p7
	5SL71/7RFaQ3VjOdcvJzHXMEgqHeWWvj2gsJKJhxnbYGr9mZ1uGuo08TBKXVGyMm29qrCi1YUuL
	EguoJ/LWpw=
X-Received: by 2002:a17:902:cf09:b0:2db:3734:cfa4 with SMTP id d9443c01a7336-2dd9c6b9151mr156850515ad.5.1789978557003;
        Mon, 21 Sep 2026 01:15:57 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f16f9csm17151344eec.2.2026.09.21.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:15:56 -0700 (PDT)
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
Subject: [PATCH v13 0/2] RISC-V IOMMU HPM support
Date: Mon, 21 Sep 2026 01:15:41 -0700
Message-ID: <20260921081544.1797510-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_011602_404763_BC5DD667 
X-CRM114-Status: GOOD (  17.21  )
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
 drivers/iommu/riscv/iommu.c      |   48 ++
 drivers/iommu/riscv/iommu.h      |    4 +
 drivers/perf/Kconfig             |   12 +
 drivers/perf/Makefile            |    1 +
 drivers/perf/riscv_iommu_pmu.c   | 1007 ++++++++++++++++++++++++++++++
 7 files changed, 1073 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
