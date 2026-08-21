Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF3C5DF81
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 02:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bVI0km+X0LdDv8Zcfl6TPbNh/RIlDrmKPXkLjdJtr/A=; b=DCgte/lMXTzV2V
	R7hJ8I/hkBE1pTSIT7ZW4+4m7jja57fhbaMJJrqvl7EsXZQcWv9ZIqHVtzc2n6L61D04NiZtYI7Ub
	88yL0DODAP/lgYOoj3Q4QNB4djBT5Brad0N/o9adSszcNLg/J4CMFsdvITbbg7n8+SssFnpb/mfzz
	oyKCHsFdUneDy6vhKPKrLDSD/G9MLzeybfgQu33FgDDae0nMUc0UVpS+AAtHNHUuSEP1OklB91xKs
	j2VfRdxFSoY0I+20GaRSwTXgflSpUul2vWTjmdxLz9kxl+dOeGgh8UCB1GhphaVmjfvehTO6Q2+3b
	Ft5wwHI8h45dGxt/omig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxF9q-0000000CSki-28Qc;
	Fri, 21 Aug 2026 02:39:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxF9o-0000000CSjp-2jsM
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 02:39:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d58efc7356so6507065ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 19:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787279938; x=1787884738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XQisBlmr2bHAob1EYT/0m2uyrfjgMQQJZM+u5d629A=;
        b=lIkDkqelCWkc8EI9RAi220MeyBr8Jrxwwin6mr3Jg6MyI8CGQq99JBP25Ih+oTIh8V
         dJmlS+VsT633zFj+H5+fndCud+tMsy5PN2pVnAAHIpxQZwtE8vtfsu00hPeQAHsLP6Bc
         ZvUph5nT/qD9YHJPReYD1rnYq5wT0UVjs4kBvb0zOhmqmH0hq0qpkFfo6KYxj2aAHFV+
         wkJc0QoVks6NJvVFoIZpry96XY6kTELf1YsBVpvk84Pcyg57V1e5WTjP76fR+JHDMnEc
         LKYfrEHXCCXnSh8BunLQtkYYkYIEUSvtRJGoeNixBT5P9pfpRL3LG+PjlDhsJdy3xrd6
         CAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787279938; x=1787884738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XQisBlmr2bHAob1EYT/0m2uyrfjgMQQJZM+u5d629A=;
        b=TWHTllVivuma3oIQ3fnrq/9n5kUb8Yf6E5loIwOEhNJdt4OfSAu6+JdF1icirYMxht
         PRUobrjYxguMbW4Khc5XWI0hr7DJI0ob4v+tCFEcGFS+ZZFdGEg3ms43H/8cV5ZKZpPE
         v9/XYvQNleLEx+gK0LQf0Z/WTB/iRSRJxEx2rE+qiUPb7Adfl8pu1m3TUeLN+zwTFYNE
         yKOTV02a1uCyUiOMSXnI6VsqfFgLdIzS64iWPqRtidYQunlkOgD/bShPqa6ljX3SJA1m
         dy5xbN9K7dwfunXvqo1b9ew8b102rafJGvNeLTNhGa8KTIwLiju83B2AvwHgk/4Mf+jd
         2ZUg==
X-Forwarded-Encrypted: i=1; AHgh+RpJwrJanUUiEpMTxGhNSURDhmX+8VyifsYIF9R0qaXicyo41nkNZ7+c5Qw3cWAEYs18bHFLbRPeVSuM9w==@lists.infradead.org
X-Gm-Message-State: AFuF++k5popL2rZkpgUjaneIHtrMPdztsiDUQG8nlGuQwfPgO3K+HY1K
	2nfZizpOSas+OFtY69QFNsdHCiVTMMlL5yqgj/7JD3g5ajDh+ygfD9g0Pl7yBxyvmnpWN64Fuo2
	S6+0Z/cc=
X-Gm-Gg: AR+sD12PSlECVPsbVlsgzLzVjEklupOkE/CowlBbO0KgX9s1DJq0LdZfFwf5IUE7wqK
	YWXxgLGOp2c4Y83GAuFF7bmUipIKm58PMgXDL900mUcOA/Penv3esTjUPAswJwQZ8jtwr0DX7i8
	HnX978znCC/u8hEZEN6JaFNEDMUTRn+AJzp7EnE3xRS1X8k7CAAN3cw76F89xyyJR7FYoI2u+tE
	j6RshtRIJSKEFUagAwsRlgM15pDrmpr05qQm3BHBtKBaSe7iopfh3dyINLOOZdF2A6Qje0ua/Yb
	3YHKcKgXK+UOrofUwlIlwroWMuy32SGU8wK2K9Uny6W5YKIbY+VOGN2xcOpIfm2gZroxhPnxzHD
	+Ishqg+kYo2l/Oo+KgQWZBQM1cFQkV3Wffd2MFQu/tFB6FdcG4yFY6MoG5GNMJvL28AxHZWAtLJ
	JYeMRft9W097NUHqTywNsr9oeJWmSj5kgcyVHICPZ0O4porCnxNT5R0xx0CjItcumZpH1qfTNE
X-Received: by 2002:a17:903:22d0:b0:2d5:cb05:49d9 with SMTP id d9443c01a7336-2d64ade785fmr48981615ad.5.1787279938105;
        Thu, 20 Aug 2026 19:38:58 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm35370427eec.16.2026.08.20.19.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:38:57 -0700 (PDT)
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
Subject: [PATCH v5 0/2] RISC-V IOMMU HPM support
Date: Thu, 20 Aug 2026 19:38:51 -0700
Message-ID: <20260821023854.2746349-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_193900_709010_118BAD71 
X-CRM114-Status: GOOD (  13.38  )
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
 drivers/perf/riscv_iommu_pmu.c   | 758 +++++++++++++++++++++++++++++++
 6 files changed, 809 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
