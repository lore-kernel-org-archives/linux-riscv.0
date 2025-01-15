Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF116C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s1IZiJMvZoH1o3SbXg9rAJHNEMA6MeGz5+db42KAzis=; b=dBcTVrDU9ZXzxz
	gMOVRmTCfbnoL37NKieMSVJ/zR4YO0OFu0QR2RA6ZHHZgTg+uk5VsiYlSYQFvT/PPSw0yH29HBT8n
	iEWOY9scx6sawK2fvc4iTF53DkYY8hXRPatMy1rJyUGjttbgmm0mxPGl3BGy0XSS8qtVLr6I71eXG
	GecC9hB8fSCje8Wt5eATpCPWh7u1QURGQknZghzn3DIVJ1i7ADA2hgkNU1H/tbci1MxFYSHzyvGnm
	47gnObpWcqVV5jGg/wlqwY7ZQLTsxhKsVGKiqFbo66SpAA0QNYoCqZrXWbAnivGtjJs4oAUZKef+t
	wASRx3eYtlshbk915H9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AN-0000000ClAg-0rez;
	Wed, 15 Jan 2025 18:30:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AK-0000000Cl7H-0niA
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:30:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21669fd5c7cso131360455ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965855; x=1737570655; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ajGRMGn1FxbsN+PpYAIsQKTZUngiruAaZC1M7x3JFs=;
        b=udUACYozp/mvJGuPk9/HHeHdXfo8zfThLka/42LNdY/lWaQmpX+cRCPscl9I9qMMq2
         GN6Skz/IHzE44kMG8Qb0ZY9GwX5minQ5a5JbiP3o4mNpdku2Rwo5Iuq9PMwmxzOYPgUM
         hqLNb1Fy/vhK1kXUMYlsBTB7xgfxDyzpkWmkjru9C95pQNCPIGUwFVxn/IU/XIl05TUZ
         9f1vuhQdyMgiKEfiJLThjVVVm1wYMEI2sa11mgZC8Yv+bqmr+DYBpny1wohluMbeEIZD
         995e126YArBADeYpC1QyrhCZKXSmKG5sKMPunXk1HHOw+Vek/JWCHVT0DXSm0Otsf/97
         eKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965855; x=1737570655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ajGRMGn1FxbsN+PpYAIsQKTZUngiruAaZC1M7x3JFs=;
        b=Ar2lWqiUG+2tDWRv7RhLNZE3KRLLKcNQnEk2cFyPVGe/f5QvRWWra3t0/fou+OvEyy
         cRreyVBFPlDONkv6RscvhedRMUvjU/u8JrOrhcpz+j2PD16rE9XUw+ydYsKV21J1hjkC
         Ho2vMgu+JqwjB9N2o99PpDG6NiqlAwgM97KlsZVxfxqbIYaIFSs5sR+OMqTeCve2mO1J
         LMFaL+V/sgNjqgpvTU+ss6kzZyez2OhPbevMbj1VgDxY5sGalv92VXfH6msrvXzm4aVA
         fEyMorSc2rfuy+uQQ9LIjijVvFpqlcCGBm/GlILKtpZINB9D+LnLu09DYMtS58CRbsUd
         XHGg==
X-Gm-Message-State: AOJu0YwLzesghchgSWdso9eevKOjQ0zOFSHtqthPgoBhl9v3rOO54k3S
	gBaAwbM6PLTBE2PuUKqApbHo86067zOqNMPNWcQP6yFnz6hL/uFTg59kglL1XbE=
X-Gm-Gg: ASbGnctH32S0K/cS9xjh5ZuIx34Kb8tfSTBfhK58Ut+TJ1SXFWgohmAaV3/JzzO/pbS
	CvNnYADprxBD73XQGbPH/xSSZSRuC2l+QTpzF2z9T8lcF+YQ3XosS3jItIOy8rk8PfAdK0Dg//u
	Tnp/Gz8QEnVhhjfULCpaLsi4Q98qlKumkySTrzCvzA9ix5jhPsswwb6uqe4f/bMmCyiCqe+2LnX
	qfaFuLeUkRmF/mD6BjVtQEqvccDrisP8gSWeyNbliFxgfab81vIpdJBC+QtsRbFnJ6EzQ==
X-Google-Smtp-Source: AGHT+IEFG9EqfNb6O2FfoTObOooM3/6B60y7w3sfOaKZm6tCWCH+RNJht379tQ8uKw/jXGcfHEEVRQ==
X-Received: by 2002:a17:902:f644:b0:212:40e0:9562 with SMTP id d9443c01a7336-21a83f69651mr458458845ad.25.1736965855468;
        Wed, 15 Jan 2025 10:30:55 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:55 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/9] Add SBI v3.0 PMU enhancements
Date: Wed, 15 Jan 2025 10:30:40 -0800
Message-Id: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAND+h2cC/12OQWrDMBBFr2K07gTP2BWSKaX3CME4yriZhaVUc
 kRKyN2ryJu2oM0TzPvvrhJH4aSG5q4iZ0kSfAF6aZQ7T/6TQU6FFbXUY4sGLst15Mx+HcXPAaz
 RTOhYH0+dKkeXyLPcqnB/KHyWtIb4Xf0Zn7+bCtH+V2WEFqZ+ttpiTzibjyg5JPFu58KiDo9NH
 /nrWjLXbUMtnNJUM4fmraoJ6Ze61oyZoLwWDHZsysar1fRH//6MP06JocAi69BkvcMOoqOy/Pg
 BmvULkCgBAAA=
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103056_234824_A642B809 
X-CRM114-Status: GOOD (  12.84  )
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

SBI v3.0 specification[1] added two new improvements to the PMU chaper.

1. Added an additional get_event_info function to query event availablity
in bulk instead of individual SBI calls for each event. This helps in
improving the boot time.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

Apart from implementing these new features, this series improves the gpa
range check in KVM and updates the kvm SBI implementation to SBI v3.0.

The opensbi patches have been merged. This series can be found at [4].
This series will conflict with counter delegation patch series[4]. This
series is gated on SBI v3.0 freeze requirement while counter delegation
series is very early. I will rebase one of them on the other as we gather
more reviews and closer to merge.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/vv3.0-rc2/riscv-sbi.pdf
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v2
[4] https://lore.kernel.org/kvm/20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Dropped PATCH 2 to be taken during rcX.
- Improved gpa range check validation by introducing a helper function
  and checking the entire range.
- Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com

---
Atish Patra (9):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      KVM: Add a helper function to validate vcpu gpa range
      RISC-V: KVM: Use the new gpa range validate helper function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  75 +++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 190 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   2 +
 include/linux/perf/riscv_pmu.h        |   2 +
 virt/kvm/kvm_main.c                   |  21 ++++
 10 files changed, 258 insertions(+), 59 deletions(-)
---
base-commit: e32a80927434907f973f38a88cd19d7e51991d24
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
