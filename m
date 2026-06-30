Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EB8C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2llkPFVsU60II/JajMBtGhF+NRdbH8D+IntpcJiq5zw=; b=q7RmCoTDQnKxhp
	EjajZ4ko1lqczMT2ulc9R6wk5cUPesF67LseEAI/GeBaxNzYOhBKY07Dkntn9Pea5fsGFy4rbPDUL
	VuYJIROqGvvG+r+B4RldhVn3M7NIyWHnwlqdNovJQRZfwH+gvkAi5BkYGXgYhFEiDy4f4OCwHzqHt
	B7yOB98tOyu6+jIqhMEIbHnOqiUDBKpdEoeeGOpVkrzpGjkK4qoWIxIGUoR7DxXSGjkcSXfIKic4R
	4CPOe0J0UPR7dlfYH+hPyPAaaztRin7TzYkfE6wN2S65NjTi+2D80DWcZA/pVZOB6uQUsAb61ysIE
	BTUAQmEUUEQcgUl6D/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTzN-0000000GHNR-0ctC;
	Tue, 30 Jun 2026 08:38:41 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTzK-0000000GHN1-2XmO
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 08:38:39 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-30c944aacbaso4601091eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782808718; x=1783413518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pcbh2hH4jKecepaLWhXNqv0o5ONWwPeeMm+RS/NEOcE=;
        b=MpxE8Gdeu425hMS+viQxh3JG3VbsPONNUyoSTxe8xOXQ8Zt7M9R6wt5vnw7As4v9Xt
         xDeVwa9S2dgl/pfP0KHpUuovRjKNrRJLSrmwYtA1HBiZVaZUmyZu0ETI6iT0rrvFo6m3
         kemtAWpUh5phSfl/nIuye0sJj+E+jZvnPqIW4oUihRtfS7A6vKAcIdLOHJa0IDABFuHY
         8Ssndr/iiDypmZeTtfzNkhTCsz/lisDtayG+GQpKr+1AW9KbNUIo/FYVuGfOnhJyygBr
         wxTsMFend5m98Uv4ic38+P6qw4qTP2FH2/WHH8n3dhGmVTf+GJlKNQ+Yf+KB4DJXipkd
         eZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808718; x=1783413518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcbh2hH4jKecepaLWhXNqv0o5ONWwPeeMm+RS/NEOcE=;
        b=O6OR0beZdnlwhc76p9n39twk0BgBU8t0IAac2ubsdAYv7Ei4GwsZ+IXlR+Dr26p39m
         p2IhQEHbZ6mGqcgIA05nHGymuu0B0w7x1AyI4qWNFYTUDtmjlyJF9S4Qbk1boWUhrqGU
         nwOcVCnJCmHPaQdU1Zj05gT5vaL8XWY11HQyMFgs1N6jgGwml5abSmT36eH1/5K4yofg
         K9cfMOxBXCBY58r66gXv88K+7K+fOEN3Xbsm+WN4bVIq3knSt6+43JEST2Nl5oy6f96H
         4e1nkW4uWs0VeetS7OtgnTGvIdShiI/DTXz77wl2M9PGxt3T5+PXHiDgLNMRO9aK35A0
         jl5w==
X-Forwarded-Encrypted: i=1; AHgh+RpzAWe5DkZXMjPZoVetDFQM4+gsYJMJKFNcvS1+BtuZ5kDSo4K4RqzFe5U5qir8DOgiLZzVaT3BxRUT9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnOpXcloZt2/5ALkQndr0toamYGnYGxQBjXX0T+KRBERNWcX3e
	G7zcuRdYZIuxlf4jeP8XS+saEkmqP+IYon4IBRjdfF+kRnK+V5OOAQiFn6ILQi9mLvvfmnSnnNw
	xz14JwnQ=
X-Gm-Gg: AfdE7ckEGX1zFu6m/vnrnGKtyfRK5Qn6GRQKd+ZAEaT1Mk5upQ/ckd2AF4RlTuC7D9W
	S6T/2rJ39ZAcaxIRV//hUrauVe+xFmmCu99UZkOIezHKdXpCxFoGu7Sjl78VANgWzoVuOrmqBr8
	YnbgEyiyQGQIGLB+0ixGF1QGPBlhXiyNUcFQ83/LA+/acV7ocUrUwDMqOfo/UsWP/3WXY7P2TGA
	aht8rbWSuCGVRrFWV7ntOG1jeXHI5lg5LUueQVcJHmCrirgvvmweIiibnivDtyUt3vsAfraPuuz
	lpqrtlnWNwLhDJZ9oRIuf4qMVlTOC/pmIk86SRoG7kAn3h8sOU4Wmtw6Z0j9wLlcdDT3q1PHvtp
	ZZA2tyUllMiSaF4IQQhIm7s40ALzE1Mb3wBYl9pIEY7Zk2YBM0zPtrTv61KlWjI2spFscW6F4DT
	FnO4SNHylUJHBjMXOkf5gveIIlAytApYu+KB0=
X-Received: by 2002:a05:7300:1824:b0:30e:da5b:2725 with SMTP id 5a478bee46e88-30ee12c0a42mr2097408eec.6.1782808717684;
        Tue, 30 Jun 2026 01:38:37 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5aeb0sm6756444eec.3.2026.06.30.01.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 01:38:37 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tjeznach@rivosinc.com,
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
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 0/2] RISC-V IOMMU HPM support
Date: Tue, 30 Jun 2026 01:38:05 -0700
Message-ID: <20260630083833.1275837-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_013838_663057_1D984DAD 
X-CRM114-Status: GOOD (  11.16  )
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

 drivers/iommu/riscv/iommu-bits.h |  61 ---
 drivers/iommu/riscv/iommu.c      |  19 +
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 703 +++++++++++++++++++++++++++++++
 5 files changed, 735 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
