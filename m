Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808DEC88E75
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mxYuapWsEWxFoYp2HdXOnZ6K/V7xUc76Sjaely/T2fY=; b=c6NId1a6aFtFaq
	9QideluFeP6xiyrsGV7FPQN/c99xwdr44ifZLnDGvz6cpGIkpdy6qsLTUA86sRXCbCTFzUpoPE1vf
	yEDLyS1jzvxBEo/2aqLjkw/CW6FKtypbJ0hy7Np5+FDiJwcA/kFHIqkd5XsiZCeUp9H4QqnoFH7kZ
	MhbF3mhqpw56te06F08vWJCu/F2x4hXnbut6u7ue/CX22sOIUFxgRW/lUm4TxSGQsaimM5hsinR8C
	gLLmt32kx6T9B56lBjTdvsQZMLVcS+9FYl1uSjZtiekHXmA/H5jUmV/MgTGovSrq+V1jc7XxgUGEI
	eCwf7LyQ2E31ESQ0i9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Stg-0000000Dg1S-1cC5;
	Fri, 18 Sep 2026 07:20:36 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Std-0000000Dg0w-4AX9
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 07:20:35 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so350275a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789716033; x=1790320833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ey2Q/vsiZe0TmezjSQD1jn0tWr1spPz2HHVIhZhd4Uw=;
        b=j3wROVCn6OaUvXU00RJTSuxibPViksjRnTSJGV0Vbx/rozTGjDAar9h5UyBiyy5aTd
         /yRPk0C8rsgf1Wni+9bWbTX+V+XHVZBdocIIJvW+PWr4JBvruT4MljXaYSb2xj7lIaZC
         WMZbP2Ijy7aUYAWQ78WduYC4+FoCo79fBBKXKgeM8PGPhFLN8UZQlrMpMOJQZskNib2A
         0Q2mMX8JPYqRdk/XVOO/hJPswL3uwT0i8cY4GjZM/btzJgjOcTvfjIJOi0NYH93PNWxY
         6bNy5LR4WUGDlHpFkrE/5ZwsM1nV8UIlFSAL18sc9k0wvFtoCrQIksFZ/W2BBQW5ImCe
         IkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716033; x=1790320833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey2Q/vsiZe0TmezjSQD1jn0tWr1spPz2HHVIhZhd4Uw=;
        b=S/WUQfxrabVyBL9++SWob3SN5bonjRv7a2sY7veQ8dRiGQ09wuYbfGSH1CE9aN1t8B
         giXD/ZlcQ9tWGjcW5/5rAjALzbsxZ/HqIOHab+fYRQ5WjNiVPMS+Pb/wAhEY74U0Inan
         41/GWU93PA7qNThh9PWwDi7Oho9bNI6IOpG+T9N2mJdvfqcnqNQ5rUC8F/3vIc63xjrD
         gSJwO7/bfszSvTzyGPe2TLvQLMv4rMnCkQUIh4u+2/GFy4eXjn7b8RTwDf3Pi0wZZXZi
         7wJOr2a+5VRMhfrF0LHPpMwOBtkcplW0oqDfnszorWcLQjot8l5qLqSQ9YUo+4udIqvq
         Obbw==
X-Forwarded-Encrypted: i=1; AKwUvBxmXuiXIbhgd1SWwjgul3zDKutTWcmJcUrMlVHtdBgcfX/z0p4/ppzwWrdBsT4l2Gpus1IwzlWQN/7RCw==@lists.infradead.org
X-Gm-Message-State: AFuF++lG+RNMJEJQ/t7UsBqLW8zF4bhQcfyWek9TzEnJUduAuSXftiFZ
	O0TGmCFHAU72dqgzfMO86ZLiZyRMns6mOYM1+y/i2lY3rXuc6XcQ45hDiFQbv2anbKo=
X-Gm-Gg: AYBFou3hBwcHseM24eaJXzykIa1jvKkH7dGRrJRGPem8hjL9gKQWpbP/f1QraSYoKhV
	UnJQvOgxz0Ii9sAMW1xcpy4Xn54sqTkdfnlMS4lAm05sEvLOa+11QVCf0OCwrMU/syP/s4yqDhd
	aWVSNz0Vv3ZevGGfDIo77c4ODHRb+9FsSZKMRthTaR6hY0UioIU3byuUFQZLxbWwveGkbzHsLc4
	dGKTxFOwUVHnxFJJJ+6kubb1hmPP40cnkhj7QFyDY7OyPu+7NK0dWRitZUDPZwYNgvKODUEd5gT
	/c1Y1xRLAb7ccyN2mSmQrQJzRyhQNVKmUHV8e8+aEP2Ogiq+WPuUXxGuGzZV2r3D0eB6HLvpxOx
	afbVgZQH7PNTWyQ1RJ7rk2VtJvPFuY0bWalVOnzovVYQIhlF92DgHF72CRzTaBJOJgrwr15yfKb
	zw7mwxTYOkf3Aii6L0evTG6onP14Bx6MSDfpp30DVupu3NtTW5r7fdLDAnbcP9JwR6IKZ4RjIbF
	yjOmuApLww=
X-Received: by 2002:a17:90b:398c:b0:39e:35e4:d31b with SMTP id 98e67ed59e1d1-39e54ce1651mr5897094a91.5.1789716032935;
        Fri, 18 Sep 2026 00:20:32 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm4416046c88.10.2026.09.18.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:20:32 -0700 (PDT)
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
Subject: [PATCH v12 0/2] RISC-V IOMMU HPM support
Date: Fri, 18 Sep 2026 00:20:24 -0700
Message-ID: <20260918072027.639239-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_002034_050219_332D790D 
X-CRM114-Status: GOOD (  17.05  )
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

 drivers/iommu/riscv/Kconfig      |   1 +
 drivers/iommu/riscv/iommu-bits.h |  61 --
 drivers/iommu/riscv/iommu.c      |  48 ++
 drivers/iommu/riscv/iommu.h      |   4 +
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 994 +++++++++++++++++++++++++++++++
 7 files changed, 1060 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
