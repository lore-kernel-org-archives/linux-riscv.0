Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB55C61DCD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hx5TIf4ucDGAUxPi3vC5ID0k47LCPq9qyPCDB/cw1Bs=; b=h/4PSpWKkjz+Es
	3IXYXIiZSebrO4dPlu7WBTzsAzmMt+l4p61erjXVKnAWrd5txdEp6uah9zqryEye/KGmW5Hf/wsnm
	HDL3gq6UkYZJUqUwHIVOyf7GgctO9wZyB9r0ei3SiqvjwArbHTI4iSMzmu/6Txoa2CcAJkyO/BjLf
	o9DsZlixdpnUM5YGPbm5LuX7cAcMEcT5C3aZfiJHUwAEnP4icJ19++AgTBfuSEy77FgU6RJFOOwxg
	CaMSuY1As3r/feIBJZNLJ4QB2XRDOIZE+/Ja1aNhY2ywGFX0cTU30opUz1xSmDrRRas92dTa4FomJ
	MfjWSXr1w2K8EhbxFlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsPq-00000005NdA-2KaA;
	Fri, 28 Aug 2026 08:58:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsPn-00000005Nc9-0VSB
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 08:58:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d58efc7356so7055035ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787907502; x=1788512302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WDVfXLhAuXc31tRDpwaJFHu44kz3FUXcbnM3HPDaEo=;
        b=gAJuJYfA/1oTejUBgaOhlf8uH1s8Pt+zJScuMQWO8YL+E5bphmrwTWLrnxd6D7vzyv
         j8voRDn8IIWBovqVE48+NbwWtGEzXAHIkCKA5lXucxuRQWQbi0z+bEHA80IcXnn4aF0j
         SCiZIQojJK2GXCA7KbK8Zf3drn83WsRrVlvXWhqY5Xtn1hpXTzdp2u0MwO7AfA5wd98Z
         LBsZZ+LbmjDxnWmiVlDe9C9tKLuwV71hLHXaou3laykZhAwIv9PtI6hg2+4yo743Yo4O
         tgq9b+TFzOh/4Mwu/LG9EDZxbv+a7E8dUZzpKtMGeFPNUgkScHzhL4kR7SvVzixps/yO
         Gq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907502; x=1788512302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WDVfXLhAuXc31tRDpwaJFHu44kz3FUXcbnM3HPDaEo=;
        b=DZ+Awo7t/8ODco/uOWTPJPzA6mtGj4VLP5Axz/clV2kSJLf1DacoA9t35Jsj+aPcCv
         +Abh09ontqJKEPbalkV8J7/Xrd4e1dKEup8z2LutE8y++tL0e7OG+NAA3RspJJ3XH2oT
         2dALwx/J43yizCqZg9LfKX/3tgbgOm97zipk9Z+8I3RnIoeZqGOwg7EXX3sqWYoUjyIE
         XNg0LIvEmsbZ1ph7Cgv3TRp8VPpDA/dvpFY8o030h9wr9rTADPLfIYNCLZV47bRAwYFN
         hjx7iFgom6ciYmG+voCGED1Axq3MQacROl+4c2P+EkwuxGKl6DG05ieE52FRsBbx2mLM
         eJxA==
X-Forwarded-Encrypted: i=1; AHgh+RqitVikpLak+JCYxtdL3g0BQWDtvqOj5Hsvz9RcSRIWxJ58c5odzJA168cDx4ltH306sbMH7KN1IXEE8A==@lists.infradead.org
X-Gm-Message-State: AFuF++mikQmGleAmTvSAhVafHXc/Za4vPNIUt7JTgYwmCeJEtpYiQMrw
	wjZvTOkKRGa6RiNztmI1r8jihsazjaESWZJAj7stNUsUU08XiIdQPTOrHRGzbeWnwMo=
X-Gm-Gg: AR+sD10vD/hS5x6yvhGftYCornfli9jwpw8uvCpVI0cVDOdU0A2sJCu3Earrjf1UO8S
	ubMZgQ6FwcBoocyL4wdbc5NKAI0QbgaRU0BsQLqBjQh5b9zSQQTc7tz1V8XfdkY08B4oSm4DYX3
	cp9Rlxq/adXJUM5fyCqHBUHR80WpMXsB+61yEZaWF2cqnIlT0aUxch0hwrlSg3zlLUcMJsMKKLn
	6DlbQo0EovyhEI3bszEkG1YoXrNTMaN7ZqC0kyQdyCYH91Mu0/Jj/009Fu8D2qvK4IYF7Skq4gQ
	qNgNY7OzUvbHtOxXz81obf0tmDVXa9M0qofyY5cPYlzJVryxZya+A9sAxsJXSizf5MaSaQd8oNS
	yzbnKYUionZZHJNBFVZPZOUCiCy/JJhfEKKMjtyGJ/jDH7x9tDazO2gqhxF2y0rMtpqXAhImG4Z
	yStOxau0fJpLj2oQKrXPvlog+zbPik5tcdaSQtk+oXAvi1mbvh8R2dvt6WCVvY3+6oNsj2FJoF
X-Received: by 2002:a17:903:fad:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d74dcc2d3cmr107576915ad.8.1787907502171;
        Fri, 28 Aug 2026 01:58:22 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm3838814eec.26.2026.08.28.01.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:58:21 -0700 (PDT)
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
Subject: [PATCH RESEND v7 0/3] RISC-V IOMMU HPM support
Date: Fri, 28 Aug 2026 01:58:14 -0700
Message-ID: <20260828085819.4076449-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015823_747724_841031D0 
X-CRM114-Status: GOOD (  19.19  )
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

The thrid commit adds raw spinlock for race condition when PCI MSI/MSI-X
on IMSIC. As the commit message mentioned:
Events are bound to one CPU and the interrupt is affine to it, so the
perf callbacks running with interrupts disabled would be enough to
exclude the handler. But PCI MSI/MSI-X on IMSIC breaks that:
The irqchip sets IRQCHIP_MOVE_DEFERRED, so irq_set_affinity() reports
success while only recording the request, and the move is applied in
interrupt context upon the next device interrupt. Until then the
interrupt is still routed to the CPU IMSIC picked initially, so the
first overflow interrupt can run concurrently with the perf callbacks
on the CPU the events are bound to.

I noticed that xgene_pmu and arm-cci have similar implementation, so add
it in riscv_iommu_pmu should be accepted.

Resend v7 due to missing the first commit.

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

Zong Li (3):
  drivers/perf: riscv-iommu: add risc-v iommu pmu driver
  iommu/riscv: create a auxiliary device for HPM
  drivers/perf: riscv-iommu: protect shared state with a raw spinlock

 drivers/iommu/riscv/Kconfig      |   1 +
 drivers/iommu/riscv/iommu-bits.h |  61 --
 drivers/iommu/riscv/iommu.c      |  37 ++
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 948 +++++++++++++++++++++++++++++++
 6 files changed, 999 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
