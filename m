Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D69CA0FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZtAbvuXGK/KusZ9inM3eKU7AeHk0x1UwU0PM2TIA3Hk=; b=CYtCIykTtJyinA
	Cc8DDU79Pkuf9UWwXvhaRIfEctZB42E9ts1uzU905OE8JouWx9XOq0v5foyhQ5efvgqigNie43LYa
	UHTP2RIGgJkLhabyCJHgz7rl+kbqXbbD6N/RSTarWH9jHK8NVvlCtr1ALT/I1ImTsF4Md0loMAdjd
	IxL+kknZ6mnjxU4KIf4HxEYrkHKd4g/sFvwGUawMszU9M3N4+/aoN0m/RUNdWyIk+epbr71aH51dm
	DDtKWJ3iCnpkTd/7FG9B0+YFp7YqDn2Ph3qTWJU1olDslDeN15hsot/76mrUGilW0EhLJxEXTaKwv
	F8ufBSuJeZ+ESpB3hSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ac-00000006fda-1QVX;
	Fri, 29 Aug 2025 18:49:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Ht-000000063zN-1wxr
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7722c8d2694so637777b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478468; x=1757083268; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oF5TQ5tmAgJotT6TBzfmeh55EB+gENZQcbLkBFQiOtM=;
        b=F+8lBN4F3yVERDnsTcQsqUBiC+lEoCA8PkW/4EhrX2oZWNjTf2UdGJ4ZkjbwABsnVl
         p43geBLnKK3pOoz/VqhFc5kDjtdoP6izL9kWERkTnNoBYlxz9e36APCx2tW38w9CH1nW
         7V830J5/4cqGXWP1Z4AGMM0VwaV+6Oq6m4tEv+cm2RX6xZJYEHDg/k/2k4BzhBl7RylS
         PneXMRW0X7N7XWLgdOIOF84O34Dj0o966wuZt+KgZkYMQm3bsMPJ8S1seiRYZEpz06yG
         c8UPp338HOxVIAmJMnjU8casmR8KsJhunf7xv1pjHSxWi8HQQESZE+W95NOX5JOaLmrT
         6EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478468; x=1757083268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF5TQ5tmAgJotT6TBzfmeh55EB+gENZQcbLkBFQiOtM=;
        b=uN6Cez3be/3jL6CK4M9UgJvUAmCEpsOdbGyVxYNqza22Lfgvj7HJ+KVMBrda30yScg
         IyAf2XD4zkLOUGIq4ZaOfDnlJP3ZCy3bU0pRsXCOQKLZAjpIwLz6yC12M/xcJJO7MpDQ
         a6198g/hxPC76Ne8PSuAZzhKkmqj0kGdAl/KdaNYqACNRL4Ve5lLzoa/ED1Dt/nOMXgc
         9MYgVcDFfMcBW/EUXxcezJ2hAtX7t++SXMVbqNZS/kX24DyFRDv0SYmw3dgutpb0U4kl
         f2aYQFYf7KdOCMZB1oIj/Pd1iYFaJtm9OfCBq14mnG7RG3gYWkGze5qxL/MUkR/NDwqR
         teYA==
X-Gm-Message-State: AOJu0YxeoYGxwWwayxVIEAhGg9LSdk5tZGkSErQJdrwsD+Fo34tj7/2f
	hzuooICKQv00MmCAeP7BX8zWsi2obLB/qP9ie/aFtfU7KLFnupONH6MIzmmbpP5GoV0=
X-Gm-Gg: ASbGncs2gjP/aJzXK/FeRazTeyP8AfNI0ZurO4N69ShvA6H1kgiF8JOTYbQUZAmbc4w
	Is5sRR0bf5VivX0VeB7iK+LR4GU/lYs4j6ojYrw7pYQVdDtUOcvmdJXExGTqRFKBS55W4Ia8X2+
	uBeVaT6ho77RrEWkrAz5eHzBIZ9+QJ9wK6v2oBlI9Ofqza5QNZLgHQGaQ9vrNNSRB/FX5WwhveB
	Rv7zwjtKgP+qpOszGGdSEQxTQ7TojORr6do7OQYRVXZSHUfcQ59x5s/e4OMZsqV5tCco63GDhTc
	8Oq3vvL8Yc/2bDpZWySwUnrWlpdRvs536Ngn6Rkkp5qBqTr3bhjfee1O9RVvGnz2oWGpWx8NGMm
	hWHP8mrkHQmjYYirI0CKXH4ahj3Y9/dXKI30=
X-Google-Smtp-Source: AGHT+IGfKLBhrAwQIfIo51JxqP/Uh80E+uh15u67yO328vBecr+7D5ezoUnfonrgJ2TgVx7Oab+e/A==
X-Received: by 2002:a05:6a20:12d1:b0:243:98b1:395c with SMTP id adf61e73a8af0-24398b13d1cmr16044556637.31.1756478468352;
        Fri, 29 Aug 2025 07:41:08 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 0/9] Add SBI v3.0 PMU enhancements
Date: Fri, 29 Aug 2025 07:41:01 -0700
Message-Id: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP27sWgC/23RTW7DIBAF4KtYrEvkGX4MUVX1HlUV2WRoWNhOw
 UGtoty92FaVNsnyIfHBvDmzRDFQYtvqzCLlkMI4lKCeKuYO7fBBPOxLZlijhBoMP/anHWUapl0
 Y/Mit0YTgSHd7wcqlYyQfvhbw7b3kQ0jTGL8XP8N8ulIA9pbKwGveSm+1BYngzWsMeUxhcBs39
 mzWMv4KqgZQdwIWwUgDqmtqYUT3QBBXQSHeCaIIvum6tvF76zw9EORVaBDuBDlP4RrdKNNK1PZ
 GuKwlRfo8lbKntSnWU0rtUva2el4KQvj7uaXTXZlvHREEFdwrq/Ef/zKvoGsT8RL6MG2rrDcge
 HRYXr78APgRHZ3uAQAA
X-Change-ID: 20241018-pmu_event_info-986e21ce6bd3
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074109_502257_7642D6B0 
X-CRM114-Status: GOOD (  13.82  )
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
The SBI v3.0 specification is frozen and under public review phase as
per the RISC-V International guidelines. 

1. Added an additional get_event_info function to query event availablity
in bulk instead of individual SBI calls for each event. This helps in
improving the boot time.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

Apart from implementing these new features, this series improves the gpa
range check in KVM and updates the kvm SBI implementation to SBI v3.0.

The opensbi patches have been merged. This series can be found at [3].

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf 
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v4

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v5:
- Rebased on top of v6.17-rc3
- Updated PATCH 6 as per feedback to improve the generic helper function
- Adapted PATCH 7 & 8 as per PATCH 6.
- Link to v4: https://lore.kernel.org/r/20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com

Changes in v4:
- Rebased on top of v6.16-rc7 
- Fixed a potential compilation issue in PATCH5.
- Minor typos fixed PATCH2 and PATCH3.
- Fixed variable ordering in PATCH6 
- Link to v3: https://lore.kernel.org/r/20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com

Changes in v3:
- Rebased on top of v6.15-rc7 
- Link to v2: https://lore.kernel.org/r/20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com

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
      KVM: Add a helper function to check if a gpa is in writable memselot
      RISC-V: KVM: Use the new gpa validate helper function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  77 +++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   8 ++
 include/linux/perf/riscv_pmu.h        |   1 +
 9 files changed, 245 insertions(+), 59 deletions(-)
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
