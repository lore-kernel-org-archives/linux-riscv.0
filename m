Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26251C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 02:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+deVH4Xj+PxspSK9Bd0Di4tyiNhk4Ray1kv5yOnMvA=; b=WivYoyh3VGbm4w
	VEbF4kufRc1o3tf043S2d2YlNwlV1DVgQPcjcob12GxGmp3M9/YYORUHKMu56yQ+8V5GuN3/U3iLt
	5q0KPpl6/DV5qSFDJ8KhVN71cpaPGScRbIhrSQs++5JeduSt327aA2BacUT3NQvNUE0TM+lykzWzo
	u5K88f+87bP7c7o2Si4r6w/PnXiqjgPEnOgGHHe95OwujYpQ+MrZQ0z920zLqA/DbTU20EUEPpOyi
	ou8KKcMnMgoG07JlFNKntA1hANCSRHbvoF2MY7+g6Aukya7feWCCAJiPSGl08Ii9yPO+hX4oEJ767
	C7ThT9Vn4NFEndPoGhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKIm-0000000FlkB-0DKB;
	Mon, 24 Aug 2026 02:20:44 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKIh-0000000FliD-0Zc4
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 02:20:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cacb8416a1so24738665ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 23 Aug 2026 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787538037; x=1788142837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EM7lljqiPKnFmEvR8seE5KmzQ2mD6+J09RR+VPh3RxA=;
        b=b1r7d7VXa8bAvGptySQ7sc5kNtxgLca5KlsKL2KExNrPTit6NgSRLRR/iN2X0VwX2X
         fgm9SeETu7cb8M0yE3XrJTRqYR6p1oGIQa/ru4YdkdGuD0t0qg2qrW+feW9iIeiKlP7E
         VoNm/v21T3OiZaqvS6FfXw3rCiZBp+4AyXXgo7UaWeOdFK9mSFmdxGnf6+8u8f5ZU8jF
         onRMEOMsBHaOtcvJZPZLDsAxZyAg4M4QKy0W1CiP/erEQBGn3D5P2tJ7O3AuTu3gP+xL
         eiGgRuMxvNbc0ax7YI/TvxZTI7oCvod66fTitxfXoHWH1hvfkK3J0p8cTB47YE5mVNNp
         J3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787538037; x=1788142837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM7lljqiPKnFmEvR8seE5KmzQ2mD6+J09RR+VPh3RxA=;
        b=kyZ9jhqmwgZfzxSZFJ1OsoHYEeODTsBZFi+yqPFIS013ev64wB+WtaIOZ6saeAhkz+
         H/iO6z036NuQ+YE/PhQa+PiyFWnzMMSjtMvk0GJTH74oW07lgc2tb4DgAi//b4s77YtQ
         BkZmQYyzbORdWdpey3Yb/GYJQVArTfE+AgOypf6/csdja+odds74RcEicHR+oQn6CJ4E
         DLtG0k5SbebAYFwHnXelfKyCI5RTOJXnYfk3keNYx+uukwNqsUWVEqmGxZOUtwzHos5j
         3IS2L7tpTJrMwq6L/Cb2Kg45dkqyijX5fgE83U4e5rIQZsoPkSKfug9VfGNTctC2BAI1
         K2vA==
X-Forwarded-Encrypted: i=1; AHgh+Rpto7bmwIoXtVTFgwhE+30NL8U3r3hfWtQmWPvAG1E9G+FsKDIunXsqyQ7C31SYKEFrfKQV6jgqIb7ebw==@lists.infradead.org
X-Gm-Message-State: AFuF++lwWuEvzIuRDSqkRX/A7G2gMcqzDx3osRZzgKsMa/QWY2Pri5Vc
	aZ+1Os+8lWkz+09EYd/71YFR8yCvK4c5s1yeTuVTcitp6SmIh8bw/WmjWM8RLGTG3pc=
X-Gm-Gg: AR+sD11pXV4NMYMbiQrB54cIRuZe4Ffq4AEDdUcDj4sQezEfarpZJeGGRLDI0X6qt24
	H07h+fhUZDHsjmbbOMvb7JoYbWb62rnIlEaEtK/VG3vLxAXvfknk9vJWDQ+mgfEFTgLOC7BVthM
	OSitAuksCQ97SxY6l2mETOMK+EokWUqQeh1Tkf2j3vjeFu+3toRGNQ+Vbc0W3dtlVkR5ortDO7V
	DPMWIt+33N9INlyMWJYk/pah3h427udrW+HiI9/HYKCFk/cMNKY9tOW1MQ/4oh6PA1aIK2jH0i6
	dKBH9fohpHCtGB0ReevPPzYoDdrXhYtgWdI5JvgI5LWup07ClCqAvVC2N1GbiiKDaffKzXrkt3P
	Ynr4oI7yHVB/38QaiFszklMlF8sF04n3e2fMP44l4xSVh1fwF84IjNVxA8L2SJXEo0Z1RzwSK6E
	rsXm8A3QyYFkqQogOsa0FyUMRlgJUjx9p7fFWMZf4dplpeljZk/drve/zi6f+DE6eB/RHEXf9+
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-395c39cbc42mr41491359a91.11.1787538037613;
        Sun, 23 Aug 2026 19:20:37 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14186183c0esm31175869c88.12.2026.08.23.19.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 19:20:37 -0700 (PDT)
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
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v6 0/2] RISC-V IOMMU HPM support
Date: Sun, 23 Aug 2026 19:20:27 -0700
Message-ID: <20260824022034.3916570-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_192039_195776_D5025B4C 
X-CRM114-Status: GOOD (  14.26  )
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
 drivers/iommu/riscv/iommu-bits.h |  61 ---
 drivers/iommu/riscv/iommu.c      |  37 ++
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 813 +++++++++++++++++++++++++++++++
 6 files changed, 864 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
