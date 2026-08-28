Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F614C61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ey/P4wrI8eKiQss9EPxpM4Q5cpcsyqjIq1ZTip7hN0w=; b=jCO74xRRgsOsYM
	ROfIjeIA5mB9IPZfwxLEIzOeotUy71th9HMSGmK9VsbRuxY8N/C8NzFYq3oXzRzcKFOK4N+w6pb06
	gtdasVatHOYRANsPTWB0/Ep4AUJ7fFs4PKCz9yGx9B9v4Q4ikrmaHsD4LblKITZWjGZl29w1XPFjE
	PkT6l87BBQ70S1UE1OE5ehwMBu58dXPU9d2f0vXNTS2n4kZnaUNYWuQnHlNMluY87UCrHvDLjiOxA
	3sOC+LJ5kpgO0TLdSRIBp/1RfkV1RcNToia6y8o7UbbGBBFQoD1ztfuVcde8zuvOBb7UowBFD3MPG
	9oezkg2e/8PFQc18/S0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqgs-00000005Foy-3I5V;
	Fri, 28 Aug 2026 07:07:55 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqgp-00000005Fnz-2sqL
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 07:07:52 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso746170a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 00:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787900870; x=1788505670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRXFOZFial7txsdAx7JQk2q/tHsDJDeYpiV+eFKuNdk=;
        b=Ep1mnKl8x+P/mZLj4iyAjhCZeD4RMUkE90QinA/9G3STo0wt23PEIgHRFLp34Z1pIK
         2TECXzl+RFR+LG4V1j6wQlTtykKMybj5DtLVQNTPPqqpCv+2ngf8V5x1gCfjIHVEr+C3
         j7GOfQgxfRRDkxpVRMXr3QrHMwJTRJ5co0Lv8y1ndZ8WlcTXKgaMlFyMlSAh3qCH2tH8
         GpX3Sq4UJLxNqqaMUc19caq84T13BMrC1IqH5i7jv4mxQH5iA3HTHbVdekwTTXBh7f2n
         g7wb8cl5oCNaAgXUUabUrPSyYUZtLo/wO4P7YdYswivoDrKRU7jxH8WMnGK00k9PDwOe
         rWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900870; x=1788505670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRXFOZFial7txsdAx7JQk2q/tHsDJDeYpiV+eFKuNdk=;
        b=qrs73gT2ZD4JktvzQKl18eWP7pRcsCBiZ2YagP+gNR5oGg1m5ufu4eWy+DZrXLF5AP
         cL0F3Nbu0oHqR94/wHg6LUEs73+/FHiZHGRNNK+ugWnFtafjhJEint/DRTJQ3y0CDsD8
         o/kvY3N0sWUwaa6upgCdTy7GyCaKKwO8CKM8DrzZiVnPUYcBU7ro3cKnew/mCCqFMcPg
         q1o2V4ntQZcjovuDgG7ob5tBGW7xwd4v6D2Pkeb34iHnoYu10QAmcP+9AGpevT4jPy+L
         bPxdI9JNSopEys4IA8djcu1KRSuhGPu/JDCs6Lw2+/1/25yHbTjeTsLvzF+WXNkv40oU
         /y+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrS9N/Oe3eeQVqN5A5QInAU7o0QNZlUIsan/LhQI55uVGChGOo2dtwF9RATOt3oEwEuwM7Xsp16/qDbJw==@lists.infradead.org
X-Gm-Message-State: AFuF++naFFNe3voZexz6B5rZrDnMDzWvUHndDE9y3CAQ/MWGRHja2at7
	YnvAoOO25AWYRMkehoXL7U9LclxdHyqrjyJNrHwB6vmP8Vn/xGyRC4JCUfKTJjvuhKI=
X-Gm-Gg: AR+sD12f6iNVTr8rhGkbMYyyGjbISVYXYObOVljc69JwAHzw9cAhMHi4FRc1+/PaT0O
	Lb5Bl8Ef+OYM2EH9fw/5qD8AgsWKlpy2DmezsO6jCoEhCYBLqtRR0bkabhlRNPiKfocV5chNIPw
	gc1Fzpsg0yuW/ds9pB/xitnjudt437HRFMSWEc2ilDykA1NZo3d+Z+sC7h9oyiV9tgzLV5PYLzy
	4hRnFHroDuaGA/ttD0fkLvJF8AkZEG4ZI/7YCVAB7U9lv2mpdcJKMohbDBrSA/oaEJhUmOAEQ8r
	VmrVSe+f50Z40h2uH0FcrL2AMq0/MqssR0oiOaQ8/UN1tQamzTIKx4yJScluUCA79BKi/mY29Ah
	2yfFIvC7i3MTlVDG24BTPGrAGw0dJxrSw+d8i6ByGiPF1cRzTOv4vWw2HxWYtCJOuafZNBRZFCE
	/pGBw+Xx/w9L+XuGNNp+m/MDNC+LxCGS8r1p2Qeuk6KKcpGRbjJo48R66pEkQ+vFxkSeDfiBr8
X-Received: by 2002:a17:90b:3ec3:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-396d0e37613mr9125343a91.1.1787900870554;
        Fri, 28 Aug 2026 00:07:50 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm3156610c88.3.2026.08.28.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:07:49 -0700 (PDT)
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
Subject: [PATCH v7 0/2] RISC-V IOMMU HPM support
Date: Fri, 28 Aug 2026 00:07:45 -0700
Message-ID: <20260828070747.4009519-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_000751_762807_46F34A5E 
X-CRM114-Status: GOOD (  18.14  )
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
  iommu/riscv: create a auxiliary device for HPM
  drivers/perf: riscv-iommu: protect shared state with a raw spinlock

 drivers/iommu/riscv/Kconfig    |  1 +
 drivers/iommu/riscv/iommu.c    | 37 +++++++++++++++++++
 drivers/perf/riscv_iommu_pmu.c | 66 ++++++++++++++++++++++++++++++----
 3 files changed, 98 insertions(+), 6 deletions(-)

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
