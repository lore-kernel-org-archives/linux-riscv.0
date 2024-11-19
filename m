Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A79CD6C295
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UpESpcGt0166Mavf/xLCTdDQYvS+4bCl/eT/Q8DHTrk=; b=X/TZoyqm+eY9jN
	rPjlXQgOw5lhLfMp7fIeW6y9hVnvkioYgURG31KrqmaseY/vMyq/IvG4PS8R++OQIZ7tKFPkAKUcQ
	lRsMhrVZn0k/ICJSwlKpCs2XQj/3N+SEui3bCXS9N6M2m8NxeI/GUdeYlAFOijztAFLGz3x7qJJKk
	zKIs+pqMOgogq5XreYR4YP6PUJAv1aJNKfTXAQdOrW+6bLXvyjiGflfdZ7Ct+pBE7KP1Pe2MewG+7
	eIZ0noTFT0Kr7oQubhPJywVFTk49bxLZnPY+SxPTYl+YPdXLI05URn/rpkSfVCmJ8kG2jdlwxf4WB
	uFx7ZjxdsGuXwnP7zRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUs8-0000000DgzW-2dGp;
	Tue, 19 Nov 2024 20:30:52 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUs6-0000000Dgxh-1nr0
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:51 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ea39f39666so1028672a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048249; x=1732653049; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7pVc5JoetXII2KdB/NlP4OQnm3jFWw4yJ8lHbJ+BI8=;
        b=TT2eC5QhPzEaZ+UdXBMYIKWotTcLd29F6vmshkVX9N2yHvB8YoV+WHS0ic5qC3M/TM
         kCqy1fQHE9JcYRYnMgJFeU5aU8oD6rCZGCvMsciMX8aph/7W+RIbajOmPm8npMTFX4OU
         ZnajBpuTjckXkULz0YIn0Zz0CkNN8SAl1HZKqOxyhNfkM9nyzgD8ZoeThba20Ojcwu4U
         N0XRpKQm0B4ksvKjBuzr3uCgvhisTZAvCFPdOtGDTwhlZIkj2vpxw5W5wrX3R4hXduuX
         u6Ku49dDtSqp5CxHke0sIBTWY2EFSYLjnvr6DNHYOeb6zgYX2dK8+1DBQCI1NNG2+Qdz
         ZSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048249; x=1732653049;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7pVc5JoetXII2KdB/NlP4OQnm3jFWw4yJ8lHbJ+BI8=;
        b=gQx7rk0EDyuu87MV1v5kfpJWj+AejuneaZPbi9LMjPB7pZ3YSfVcnX1DiqqSqrMUXE
         EQ3BIaSKeD0LRUfaZDabSZEUvZTZ3cLK9f6MHPoK3lcyjXWLEMxtkw3vC3TNF8BTmYT9
         s6nAVuDDQLLd3qWCwaF8gthCtiII7B4Oiz4VEeScZjHzCtcqcRRUdjcioYJrCIS/wd9I
         RSICIjb1nL/TxnaDuKO3YKKndMRUdh9+1Lmj454xDOAfB3iIM9msIJ1CHyP/aP5M2ju8
         5E3KhoR9rLVN3VJDuu3feLKFn6YNUEv8DrZWt691p0qvYd/FS9niw/ZO7OvCN/7GZcYF
         GMVA==
X-Gm-Message-State: AOJu0YygdpJyswvFPWy+8H0bZgqt0dNYrTSXatXCAZQguu2w7l1sqSa4
	zJMlEyKeT23qchF4yKOTuS/EK1BdfkcJvOWhyo5ma+WxXtX9/7OgYdeEodpfPFM=
X-Google-Smtp-Source: AGHT+IEGqDbbCzCtdsEZW2eFYW9EW+r2eubpzXN5mXs90RA5OdnIHgt1XlLafqwuVADVSx84uXt6IA==
X-Received: by 2002:a17:90b:1dce:b0:2ea:956b:deb9 with SMTP id 98e67ed59e1d1-2eaca7e8b27mr126213a91.37.1732048249221;
        Tue, 19 Nov 2024 12:30:49 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/8] Add SBI v3.0 PMU enhancements
Date: Tue, 19 Nov 2024 12:29:48 -0800
Message-Id: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD31PGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0ML3YLc0vjUstS8kvjMvLR8XUsLs1Qjw+RUs6QUYyWgpoKi1LTMCrC
 B0bG1tQC3PSxyYAAAAA==
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
X-CRM114-CacheID: sfid-20241119_123050_474143_89647B7F 
X-CRM114-Status: GOOD (  12.02  )
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

Apart from implementing these new features, this series adds a fix
in firmware event mapping and updates the kvm SBI implementation to
SBI v3.0.

The opensbi patches can be found at [3]. This series can be found at [4].

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/vv3.0-rc2/riscv-sbi.pdf
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/opensbi/tree/b4/pmu_event_info
[4] https://github.com/atishp04/linux/tree/b4/pmu_event_info

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (8):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Fix Platform firmware event data
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  12 +++
 arch/riscv/kvm/vcpu_pmu.c             |  71 +++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 drivers/perf/riscv_pmu_sbi.c          | 184 +++++++++++++++++++++++++---------
 include/linux/perf/riscv_pmu.h        |   2 +
 7 files changed, 228 insertions(+), 49 deletions(-)
---
base-commit: acb481ddd977ab669128bab61024d05e7dc1654f
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
