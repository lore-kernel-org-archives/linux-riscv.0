Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EE0CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dlm4sSxbY1fyzHcKkTxLOM1+NHO1ZNpUte53SulpTKs=; b=dsODGU/JeuabyG
	0SKoAnw4mE9wpKx3n0SKXBnBvbq6Zjaxo18i5MboFPcpjuTK6c+RYT1kRRKg2FLYgFkchh9viQdEY
	/k/H/T4KelB8qmj2YwGGtJ3sWR9RMq/mUFKo3M0xTOnhS3b+A+arzJ7+LPeWnRT/S5d0lzNGhf2vb
	S6ZHynrdX/qJ+7SaRZUcBlgeNxs2AYZJV/+REnLY757O8o6YG2JYPpDPC/szGowJ997EwbZgegZ0t
	NQBp9S7iYAgngQ3BUv9G7Ddli/r4bmJA3WAr5d5zxJdSCvdTy6oMIqtDyWX31sPd1OrRFwtOHQMHE
	320wV4fISsUeSEebHNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE0L-0000000FAwO-2MrH;
	Wed, 27 Aug 2025 11:07:49 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urD6n-0000000EzsN-2KPO
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 10:10:27 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b4c1ed55930so3021673a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756289421; x=1756894221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBu9j6IaTs08Cy0/naQSIbDYy/Ds97IIeYDx16xjQz0=;
        b=Oh0qxLWzqEHBLTO7I0jwISzYIcphzIImP6TWp/LCMVmnc28cdNV2JBmgH+DsYX9RZJ
         8xOTCHFksgOeyN49GDym2K9HeyxdpN8BhF9R5HkNLEwGUkICDxIqbIfR5TZ6J/i4sR9N
         SafVk6hbcRslYMrBM2dhopHCapOrpltF5IK0rNJlJSVbOL3Stp87bJ2Fp1durK3cJyvl
         0jEerYhESZrsC6zZ6RCh2b7lRGwiOMD/968jtg/N9R/3O0LcLlzfdsuU8XKRvOZ2N0M2
         Oe0+oGcW38swOQFJkbmeJmZJ5lxH4hY2LIw7zDyAaU8QVFUGaTetW3+N0wd4nwHAPDK8
         H9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289421; x=1756894221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBu9j6IaTs08Cy0/naQSIbDYy/Ds97IIeYDx16xjQz0=;
        b=xPfZnetcnvgXPmewgawEqynxp9WfkMiNe4zqf+dpKDdTXhGoFuSzi9SLsjUPhLcrJE
         gEajucpxJpgMHFg3YMJcr5h9xF+QGtcAB/X33fTYHJ9n+UKe5HfV5XzycibAw1WKm1sv
         BWc+RVKElqZMuXnsENaUcG6pxUCxuto/je95pXzRKnv/o2DBM01MYzd5bmglAS3isECj
         iOHCTvhmCUieYKQ/xXUpHHBDhQzJQtKSQDIvYx4QofayL1gaD1OXG0IH4v9ndD5w14NM
         bCvqELsKpQ7JX6fGwMnpB8y3ILfIeAQyJdzfCglb6guz+Awn+WLOPxC06csek2wPmuCs
         Rm9w==
X-Forwarded-Encrypted: i=1; AJvYcCXZmkWy2dS6HWItbO9vJCvZYopc3GFEsoQK67IFpvZ8S1D8jy/+YEH83eEwpRxFUw1HC3Stm3FyEt3FUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkQpDv1Qet2NuKSShTPERWqTksxV8VDC/yf08MjLUHe736/bAG
	ECvND6mSlhga+JeGYyI4Vl9ls+naljg4kiHvAYjlbHvAY1NgZXpW//xZwFqDxSuIMGo=
X-Gm-Gg: ASbGncsIrInbdHOpQ5h+hsMIPE2/ETPmLrJ2Qm5iF+0OeF9MAJ0Ssf4Xt+EZ6wS0Rpx
	s1EhYY0gcmEcTae/afWTIDKLJYZlB+IP016TTKnoaOx59va0ShJh/C7QmEGzQUNThZtpjcfW13j
	sOyG+oRKhDfRu0nX693NT4Z50hw1j5hjeXlG96hPje5IHYQqxoQxG0w+IIv+CB7+fViV8AtrRTn
	IyAe1d9/RPXGPOcxob/oL0doBeCBplOgeji6nHp9ojkcZ0RrzbhziUbCBCUii7ZRmjta9/AU7NS
	fsBqzHWliCr6dLV86Y6VUfr/46ro5K8l1mgnolsCU/MWxREpeUxlxXaGX1/uVh2KcAcYfGuuXqV
	rzjA/Xxo76vlhx8Or07TTThpZ8sTn7dPROMBzOMMKPjoxPvm8WrvM+R0kWpyj3Qsd+jYN+1EmPw
	==
X-Google-Smtp-Source: AGHT+IE247z+6IbaCQjI/JRybcT+dCJSxuMKhLrRKRCY3vXFrDNcNNm2FeQS/0dKWf+BL5aq7dNmLQ==
X-Received: by 2002:a17:90b:538b:b0:325:cce7:f65b with SMTP id 98e67ed59e1d1-325cce7f86emr11644260a91.29.1756289420620;
        Wed, 27 Aug 2025 03:10:20 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm12813462b3a.79.2025.08.27.03.10.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 03:10:20 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	masahiroy@kernel.org,
	suzuki.poulose@arm.com,
	cuiyunhui@bytedance.com,
	maz@kernel.org,
	zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com,
	dianders@chromium.org,
	mingo@kernel.org,
	lihuafei1@huawei.com,
	akpm@linux-foundation.org,
	jpoimboe@kernel.org,
	rppt@kernel.org,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de
Subject: [PATCH 0/2] Add HARDLOCKUP_DETECTOR_PERF for riscv 
Date: Wed, 27 Aug 2025 18:09:57 +0800
Message-Id: <20250827100959.83023-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031025_709244_BCBCF2B0 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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

This patchset is mainly based on RISCV_SSE, and the enabling of the
hardlockup perf feature depends on RISCV_PMU_SSE.
Link: https://lore.kernel.org/all/20250808153901.2477005-1-cleger@rivosinc.com/
patch[1]: Move watchdog_hld.c to kernel/ to facilitate reuse by RISC-V.
patch[2]: Add Kconfig selections for RISC-V.

Yunhui Cui (2):
  watchdog: refactor watchdog_hld functionality
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/kernel/Makefile                   | 1 -
 arch/riscv/Kconfig                           | 3 +++
 drivers/perf/arm_pmu.c                       | 2 +-
 drivers/perf/riscv_pmu_sbi.c                 | 8 ++++++++
 include/linux/nmi.h                          | 1 +
 include/linux/perf/arm_pmu.h                 | 2 --
 kernel/Makefile                              | 2 +-
 {arch/arm64/kernel => kernel}/watchdog_hld.c | 8 ++++++--
 8 files changed, 20 insertions(+), 7 deletions(-)
 rename {arch/arm64/kernel => kernel}/watchdog_hld.c (97%)

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
