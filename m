Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E99C79F80
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p+M9uJhDkQyyKO58/NxyjA6N02+bfZISIgVt6mk4esA=; b=nNKCYIB2gG1b2d
	fti56+RrGaTaVGEL8eP96QlfseGJWM4mRkjYexu0tOdM/0qj9eUGBzAnojZTESawIxuWfWtdqMCT8
	Kbk4W6Xtu788E5na55i1xjf7UfygA1K13Y2xUw801tNUV76bAqKEy0P7aWK3K6n0FClpDSD2SSPTW
	u6tOGsUNcdaU9QrOVAx+ShwtXzRr5LZ7dGayDEbGxLOmyFbAEza5QFTIVPi1iU8pGppe+yZTahlH3
	8GlusSt9OJU2J2DhCqcP0DR9HG9rBQT7npsRhu9CpAshJiQ4tje1TTscWeIiKhPbAPbbXMfSwTGyu
	gd5NTBprbKS3FR4iDkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q7D-00000001Vti-1pG0;
	Fri, 04 Sep 2026 09:21:43 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q7B-00000001Vs4-2NKy
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 09:21:42 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38759bcd877so767375a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788513701; x=1789118501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9+T08Ol1yj/MMF/M6cDqb87S/P26Yho6EBQQNhwINA=;
        b=MLU8RVnJsOlyys6zuzCh2P2xyhye5LOAJxaGvnKgJg/ARGv37tNSfA8okXR18gInE1
         ktM0KEMRQ6jp5r4fi71EdDNYt+i24QUMhK3Y3yxTTphKD7ZQjlgsotqbint27wad4i3W
         raOe4uxiKafOYLJT2Kf0qOBpo35xca4t8JJMJYrZQZJVei9+VUE9OpXuKLGEDbB62yPG
         hMSaY4PN8XmkD6njsL1XNQIxk2Dezqff8ZbNAkcnd6bSnkoEmUrNjaF51dUnL5bRuwHz
         OYG3+zokIuMhqN5pHZnYkKbhNeSM0689Bm7KI/RRh2vjGJQCAPVZoY/98bORiQpncAuu
         lk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513701; x=1789118501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9+T08Ol1yj/MMF/M6cDqb87S/P26Yho6EBQQNhwINA=;
        b=gboH0+mX82gJtoy3Ff77VeJMhypCySs8+rVBXJN+kndXZB+dshV4WtWmyBWD5sbx5V
         lYthZDkDjzwwNNkMCLZyHYOX0GgDzfEkmCwYxQTg12ayxOSxpdHxlrilHwTQcmTFDXj6
         hqDvHOigVLMC7SdQqYMEafM7G4YTwugN0i4GPqlOGcH+F6FIIDHxvbm4xZ8Xau4B7G6E
         FOuuWpDW7nzvE05nn0vks7E4a9MUt3MNGorgqwwlEGBwVy0czjGch8oaWURppLL+d8Mm
         /f5pXI6NS+Dr6majNAiUJU7RPcfoaqtJDj9S7LM4sUnNJU9v45BsR+fPWnxIi0L2+hS1
         KUBA==
X-Forwarded-Encrypted: i=1; AKwUvBw+27Hck6A9FDCcTiFHHs8Q7j22V4nzfFnq3zJLhKWmFubwINF5Qb1ZP1+5Qo0SqZ+5s2gi/71K+Ant6A==@lists.infradead.org
X-Gm-Message-State: AFuF++mP6Myqk92tk2uXl4en0r+hljwzSewBvj2kQxaCxalruIfx8VRE
	UKK2q9zmi9NedHfj2N6T6c1oL3EDsiaEuiuH+eUAwjXjJ3iCIsnOr/1iT35gwBv7iI0=
X-Gm-Gg: AYBFou0cVrVu7SwbAM3WSI/+7Cv3jcPN94MaiJjMoUm9wCYvEXTSl4gxnR00CwzrcmT
	QkzSXGMkX3uXzGb+nseL82GsRxT2WpnIMd0fcXC6y/cnpMkITtEwIcci/z274hDuJjOhuVFyUkn
	4Spzow7bOZnVAjZwF9uVUdTK29XEezi/DBsz9EyKf7uKiBnypM9wdSH6E0SIQH37mdFDeZoiLmB
	dCAhxBiuI0HhvYOfiGPCZxjnUhqrXyUIEE8HyiPjZ+hpCImIzzxIIaTz+i/8DzlHfwZY9bZwwun
	G1hQYe0b27U/w+zweMJSmOOM4HdeAErVUMyPJhK9GAaY+1V+grKh8Q+YOmn4u/otjwQBmzE/K/U
	kYW5P/gycyh8NeiRobHz35Mn0vHEyZQcFoy4vSyjTvxqEVY0gZHRAAPWbrFBJKqXZGdd0prVJuU
	2UEt5JA5tkV9eooeC07Vxcb6sgDnRBn2shBLsgBGeGFwoPSal+rFp7J8/8uSD3BPsm8WxWIFuop
	BIN0jBLTuE=
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr7536728a91.17.1788513700711;
        Fri, 04 Sep 2026 02:21:40 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432438497csm5275575c88.8.2026.09.04.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:21:39 -0700 (PDT)
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
Subject: [PATCH v8 0/2] RISC-V IOMMU HPM support
Date: Fri,  4 Sep 2026 02:21:31 -0700
Message-ID: <20260904092136.113321-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_022141_666006_DA574B41 
X-CRM114-Status: GOOD (  16.55  )
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
 drivers/perf/riscv_iommu_pmu.c   | 941 +++++++++++++++++++++++++++++++
 6 files changed, 992 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
