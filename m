Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A8BC44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 08:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KIpxbWW1ZkYU/YbdNLDXjUwMvYyXJAaz4DZHD11Ky+A=; b=HpX3lPg4nX4TIb
	Ik2qc7XldvS3lFbpeaiRnTqHM8e5ctdg5gpamZo/HwQez87PaqRdRqvILV8xAwb1NCC+IEvHEniaw
	/gZ2t0gZlKRPlObEPhjmVjbhJVOst7EgaQcE5plPIzCykp2To6hFKXIa3LhQK0ue432pRP4VfBZ27
	Ae1k2Xdg00qo2rXMLfvAhb5e76fw7MGI5lBFNieKSup2TiaPBgZBIghmAVwC34GbWEiSVeUQO/ajN
	pjeesg27wSJPmQeuVhJvLshtQykIBsHGWPFa9V7FyqQmSpfQSFDFA/BKBbznpSmGV7hY62BIzpTcJ
	9//aCoPBtVPej1+ng2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYcz-0000000BKAl-0Hyd;
	Tue, 14 Jul 2026 08:36:33 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYcw-0000000BK99-2Q4G
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 08:36:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso2826479a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784018189; x=1784622989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jn0RkqkJtLXr9ENR5GursZsBgfA51fWj50aI39fixhE=;
        b=T0EPTbjU602lC7xMCgBsZ0Wdo2QoA+xiioxJjPLaA/aPFkbqmB5p+lRcTbZHefjNyh
         ejJOugRN2AI/n1RN8oCwNnKYSjTd0z85fdAROK5t/GW/yg7YgbgGyED53zdUeC6Xv6Pj
         vgQIKHCdXgOD1mLld+3pBD/gWQ/DXpGF6ge58PT2q4TfaWdpz+ed/KvVLW9dS1cI9mq8
         K2NmjQHRKiwJZicphUVYeAUgT7PAaDtE+oPK5IKS7yyxWbao/tHzyxfoJhe2Q/D5gBi+
         ZRfFDQozUXlIRt6zl+DTml01SC6x0Sk6j0nVaIFOJmEpw3QoKCRKt4AMke5Qr83y9zCC
         nqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018189; x=1784622989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn0RkqkJtLXr9ENR5GursZsBgfA51fWj50aI39fixhE=;
        b=jluQ2mtRxS7QbJPdu1hnL7m6KNojVDYtQ0kf9sN0wxtr8Kb3biL9yZ73g0DPqrnhg3
         cOmhpeEDPIFsfNcb5UmEYWMmsloYZVfGa0jpIB3HCrOPcEr96Gzyw9dw3dfTQasnpiNA
         vZkp5kZEY6GGGXt4adRauXXlBg8lXdevhl4cVHE/O1De05ENn7dEpFXskl1ROLcDtuG5
         mTq0RBcXpB3HITx7a+qJAZLGcy4bYl9w3KGga6l3Ww4kkAjkTxeNf58rJkCgdL7ODJpZ
         XrCsOQPfQ6fava2GZfht7MvcV8hYeKjcWLfpry4XfJW85inXWKU2+3uGUUIRXv5gOOiT
         zdQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4OqBqgPGCN8ZDDczw3uP99l1/39ereg60u+FmIMu+3ok78JsR2BsfU9z4x66+KW0Mixafb/JWEwBKLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/4iV1Uu7rGSCUXVaJdzZC8P3NFFTbqpkwP4d8wieeBFkBnBrK
	5+z/aMUe63BuvmOxcoJp2gqBXQ6fnfOYvzGbm7iYnoU8X37rb0y9GACJmS3B8AjymsA=
X-Gm-Gg: AfdE7ckeypvYcaWXjZWl0+C1d6+q53CVtcpUWszhF+W1J5mZpSrPSJRfQiwjKd8Zseo
	OmFXWcVtCVv/Kls5i7MbIeBib3dZOKky2mr4kj/2n2QrSgCAfoPpgGEzqiJ/rvlvTD5+PFtmspo
	l9ISAgwepJC4wnpmY7oW43aMvwuAnpiE3rFC7d+bq6qQk0hcS0gF16MLRi2VWTNvYoY4sV+AcF3
	m2b6ijJ10VKrx6+yPdK3wYQQ2mOY+eLPntG8qityozrOXPZEDPGK0tNAdV+sB9AUK83sNbKONNl
	S7PfEqNMmW1aHWkqEnBYA4LrdsWJPUgpaj8i4VlUfk++Vg5QM/p4EDhefYDQ405Ljie4+9COLYM
	qtnSrkU9RSvHBL7An0ohcdT4teERkZK6ICVYcUo99aSF4i9qtE8RthXVSPB9tA/nWR59oG1OEBS
	hUAbMSIJfrJjoYi3VG3dcazrlXPYWffybZe4E=
X-Received: by 2002:a05:6a21:9f17:b0:3c0:9c19:65c4 with SMTP id adf61e73a8af0-3c110aaff03mr15644136637.76.1784018188774;
        Tue, 14 Jul 2026 01:36:28 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm55932938eec.8.2026.07.14.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:36:28 -0700 (PDT)
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
	zhangzhanpeng.jasper@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 0/2] RISC-V IOMMU HPM support
Date: Tue, 14 Jul 2026 01:36:20 -0700
Message-ID: <20260714083625.1083606-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_013630_685408_64DC16FE 
X-CRM114-Status: GOOD (  12.15  )
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

Changed in v3:
- Rebased oto v7.2-rc3
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
 drivers/iommu/riscv/iommu.c      |  19 +
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 722 +++++++++++++++++++++++++++++++
 6 files changed, 755 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
