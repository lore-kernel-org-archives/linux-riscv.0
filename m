Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878DCC88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 03:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d94FY7HDWNAw9SkEx7m/Da9itnVWqrXQZSUlBtfUlc4=; b=pnZEZ2nY1elSn/
	f8sHU0L8HCzwpFda0t55ez0sgK2zY2Sr4X9fU8WQL/Laf5ykO6a0XNEa5OOeMcF1cHZad3VEcXnpi
	oF7hMAA6f1oX/jHv+T0Y2Tvdziy3R4wFd3rdAjgNnCjAErkRPuigvRAObjoFUW21Mwrp7pt2mNxdd
	LfYdLh2itwocUZ/rMXgjJAxPGeOXf168oQ0CyVxqiRQQ7mDRg+8aMZTowkjVJzYncu5wirK6XiYyM
	Z7BEp9aGTeJPvx8AYuxXzqoeX7Mfd/oioPk07Vx5ezP2ZtXp62dD1YSTIhR/yYly2LZ6YtTG5Ikz/
	PYKduOxtkoXJo3alkqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xoy-00000002IWz-2USu;
	Mon, 14 Sep 2026 03:57:33 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xou-00000002IW2-3DzS
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 03:57:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3201795a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 20:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789358247; x=1789963047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K9L+6nxd8BbOVzEqV6s1z3C44XoF9Mo5LgjNFUvJLM=;
        b=FCU7G1TxLD6nkH8lqghLyK+W5F7OmhTlneunKhp4epqE05/0RNYlI7cRFuJGeH8aMO
         mt/O+gybXJ3PzsaVLuDDKqv5TP9Rsw6v4RqjFQnqbY2e3GoiP2Eo4CtwTYdGf9QVZz+f
         tBowL87tE23UZFUH2SFhQitFoMYPiboE4jP3iGxmIWFMk7GRrRJVMDdynMNGgZbLRaCv
         A1i0OMthgFELeeEY05Sca/4WoTm+2l2qp4QS/ZATCCOQwVWIPKpesp+sXBq54B/7+Kuw
         TN/pH18IQAa1sftWsI0jW6essA9hs1UFHEcnsl5PbP9eQKtDKR+n03H7fHJq96rT5buq
         /mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789358247; x=1789963047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K9L+6nxd8BbOVzEqV6s1z3C44XoF9Mo5LgjNFUvJLM=;
        b=awdyM029Y4ZJ+2RHcYsXc2Rj/Cgh7NEsPW53QRcsupvIj9xYKnB6YF6TPJtnZRMljD
         ABsqlOfudk362exQ1/mO7bJeVPseaDBqP2n/KJEQnuSiNhgQ3+G7WC5cYYl62k/s/Sf4
         z0O5o3zUerfrlqz4hOgXyznlquaptwKw2gvALkIWLjKaTb2JGjIODzastAUOvLL054m0
         UWEX8xrEqnzxuFuj3PsunVfCFZLhW5Y0bXXfwYbvT5tdzLm10Z+Af4jlWRQW1HtJWaJl
         9BPg72keKJQwPUyHhwvk6GK4WWs10gJtF7RT96UKHoO6ZZauUHZoPSk+Omt/x9sCrvUl
         rzKw==
X-Forwarded-Encrypted: i=1; AKwUvBz2taa8xTuAf3rGoOBmOq50hNc0gCXbraToSD7K2gfHFVUSwsJ+JoBfawTNAtcS1qCC2KGNayhqgL8lig==@lists.infradead.org
X-Gm-Message-State: AFuF++lbkLR2SHLTSza4CK+azsRgj1WmtAXVcPlgU5PVEyUZLswHVuDb
	+DFGqTuIhA8H6+G21TfsshQTG6UzOXD3ZMdf7hRFdinnNq11nwfoDhph57bijCUvWa4=
X-Gm-Gg: AYBFou2ysTDfpnF+fTw7lCUoKHaCAVbLRmvMwWOoxiXV5rMbad0zXH/wA36cALpS82Y
	HH5oRKVVitrPshdhIfjpt+hQH1GQor2ki1ZgnuVj+xfRZ7QYZPIiWwgjp+OVfZneg7soetBimXz
	70nNPMZhiQbVW3yVwvbk4DperWgS3zF3n6Lsvf5Ir9BoUQcr2OPB4hYjahQ/eU9Elq/AUWdbgN6
	mVKxAwxbjL38VUmERLoMXKPeEJ3oiKpBd1v2ijTAGWXeOAb2Zjcj+3/L6GEJmkPXshHQpccuWSr
	fcEIytHATZRbDsDPRGkRVa0lHs0jaJSBdUplCWslNeHUv8aU1O49+d6PUpdftyHDanB1XbETOhY
	vUD6GqcrXKH7yO3ItELPEM8PBhA/5GqZUW3RVrmHTqSJb9V/3CBKHTP6NvWKL25k8xZt6r1U+r/
	Nms6uHMoNWxZGiv7ubxNntfHgxgwvQwUQrCXjateZHZO70IZWhOjhMEUq5beJ7BK4dCKjYeQvdQ
	psBrV6Clzus
X-Received: by 2002:a05:6a20:2455:b0:3da:eff0:c162 with SMTP id adf61e73a8af0-3db26cc13e7mr5962189637.6.1789358246992;
        Sun, 13 Sep 2026 20:57:26 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm22862554eec.12.2026.09.13.20.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:57:26 -0700 (PDT)
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
Subject: [PATCH v11 0/2] RISC-V IOMMU HPM support
Date: Sun, 13 Sep 2026 20:57:20 -0700
Message-ID: <20260914035723.2922057-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_205728_847497_264876F6 
X-CRM114-Status: GOOD (  19.15  )
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

In v7, we added raw spinlocks to some paths to fix IRQCHIP_MOVE_DEFERRED
issue. Later, we improved this by using irq_work to make it lockless.
However, Sashiko AI pointed out that there are some CPU hotplug race
conditions. To fix this, we are adding the raw spinlocks back in this
version. This will solve both the IRQCHIP_MOVE_DEFERRED issue and the
CPU hotplug race condition.

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

 drivers/iommu/riscv/Kconfig      |   1 +
 drivers/iommu/riscv/iommu-bits.h |  61 --
 drivers/iommu/riscv/iommu.c      |  37 ++
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 987 +++++++++++++++++++++++++++++++
 6 files changed, 1038 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
