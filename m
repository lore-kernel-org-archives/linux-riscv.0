Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FDFC54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MIVZ2tQPs9gEmJVFt5kHXtVYVysoHhw3uNgci8heBmw=; b=sGKBBP2H1TUeSs
	MqaZbJR8qgwDOYzObzi8fpGbeRvZLDpiQDjx+r8NtepH5RYYzRWUsGAZQU2zdt+rXG9preO/GTfAs
	YtjaXKKTRyVZRuEW86oIE4u8bpqvrszrfYw3ylJyX96xw09mHWKK7Y5+1oZHuI9PdKpWMfF8Nunwx
	vl7Y+20Ej9YocWGEyY8QG8L45hmf2o1dEJ9tc6NcIEmSz9wcg7+EOMg3dP/uTc732zcScj6ujjR0S
	N8SoMO7x+1I2AmKyJbMDK5CrUVysxIZ0CBAqoZ1JMXwbya2jQ+mSWUydeIBTfFZPMwI/0wTfkKco6
	+PEjumQmXlFuFAM0mZyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdh-0000000285x-1IXx;
	Thu, 22 May 2025 20:35:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdd-0000000283Y-3z4R
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:35:39 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-30e80f03760so6114707a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946137; x=1748550937; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJeI3hczrGcorf0zoQdD5/qF+d8TPGNC2tDxL+T9ilg=;
        b=PizfqPGh5cmc/0B+x642MjkYKL9uqjbq2B8itMocy+am5Qlbyk8XX0ODiSjMRIedkz
         3gZIMj05plgPutqDsBqM/TN0njYABfZQyS6Grp/ecfuqKM7KmXvAKIBKf0tm7A1m3dJx
         C5lgGjCqtUEfA+GhoPu84SyYMJKIyRCcXUn9hSh5f05U94G8oxQ20TpQtoQuRtFTSsCs
         Qcb8+f/FxuHVbivyADk6ZVM2/xBzVbeJRaQbMuIBtYHAeKCrcGUgmXgxvup6cNE5zTDJ
         EhtREGT1ZN56K1npF+om07UVe/fKsLlg4cdUzmVhZhg9WsnBsm4wXw1t+puDhBTmyVhn
         ivLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946137; x=1748550937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJeI3hczrGcorf0zoQdD5/qF+d8TPGNC2tDxL+T9ilg=;
        b=HYki5NgoSVnRD2WdmPhykofhUxtoimXnh+lm9SJeXxocjTbYzKI9ae1leXetCm4jW0
         OjxyvC340MlsoGgUZ7JoV+RyiZwgpF8mG9aQWClFPx83XsrIuuuQFyhLgvwQ4Cu8e4VR
         2ZOgt7uV4ir1xC60wN3NYn8YrfW+g28TR9kFKk0K36zXL7P1jWGyiMk7dhh2FMAkn258
         JDLh79mZkVL4SF5n6N9X7q4ZMZIfSnfbHmtVk7RzMlU6VnwfwNtwEonn2ilqWf5YqGHJ
         KZxXJgxLJ1/0/J7pfhARbkWl9+NwUnIYeBUpCbVWiDGAZFCWtoacgjPaM1dE4dP54BY3
         8JNA==
X-Forwarded-Encrypted: i=1; AJvYcCU6dycz8K/vQIi/fgP1Sk3zs8cVmr6n35c8IqN7QBi2VcSy/dv0r6eQduv2zKGVmddI3TtQZnaAMROXrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8iJ9f716ihnGVDUPvyiQd8quNgIc5wsZesjl4m6AbQjyQlz2Q
	RxbjcItGcsY8uU4WMvxey5KPxBALnII8fza0eGtVBcK/ZVLfXnl7FzQZgXSomIENQpY=
X-Gm-Gg: ASbGnct1IvmdU6tVqH3vBtW2xipFMKKiziNbI9t7MI1haico55BVbVMzUCYWgVtqe35
	Eq2oh86924M4tNcAABhgM3OjfDx7wzV9U+WTK+y2ZAH5eRegX2yggC5EK3yIZhsurahSuESc0hU
	ztRMyuUvwc3CtxkAs7zAEio1jDJTfwOVZTmhroPje9qS+R3OmU05Hr8xrt1A7/5m8li+y1/qgLk
	K5O3VvwVog7gWq5K3pZ7rl+cuvDLMC8wqLb/gIDUJMUOdaNeT2iGN7D6AmcwWZD/LDWMuksTa3F
	JyoyZeoFhGip5mECz2CI8A21cE2W4SN4ybjkysPcifh48bgE6I64XrVKsYQqRokEC6tsq6cBLwA
	=
X-Google-Smtp-Source: AGHT+IFc2kSfwF3mamOSnGj80fjCx3PhuRYqTPiDeh2Maj3FvlzMuzjpvViHalbc+sE51fOiA8fqhw==
X-Received: by 2002:a17:90b:1d45:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-30e82fc1905mr45589271a91.0.1747946136890;
        Thu, 22 May 2025 13:35:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
Date: Thu, 22 May 2025 13:35:24 -0700
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIyKL2gC/3WNwQ6CMBBEf4Xs2ZqFxYCe/A9DSKmLbMTWtKQRC
 f9uxbOZ05tk3iwQ2AsHOGULeI4SxNkExS4DM2h7YyXXxFBgccCSUN3jox31e27Z6m7kNkx6Yra
 KyNRaHzVhlUNaPz338trMlybxIGFyft6OYv5tf86Uv86YK1TU9aZErKkic/YSXRBr9sY9oFnX9
 QNP+zsRwQAAAA==
X-Change-ID: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_133538_261897_16793BFA 
X-CRM114-Status: GOOD (  13.54  )
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

This series adds support for enabling hstateen bits lazily at runtime
instead of statically at bootime. The boot time enabling happens for
all the guests if the required extensions are present in the host and/or
guest. That may not be necessary if the guest never exercise that
feature. We can enable the hstateen bits that controls the access lazily
upon first access. This providers KVM more granular control of which
feature is enabled in the guest at runtime.

Currently, the following hstateen bits are supported to control the access
from VS mode.

1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
2. BIT(59): AIA       : SIPH/SIEH/STOPI
3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
4. BIT(62): HSENVCFG  : SENVCFG access
5. BIT(63): SSTATEEN0 : SSTATEEN0 access

KVM already support trap/enabling of BIT(58) and BIT(60) in order
to support sw version of the guest interrupt file. This series extends
those to enable to correpsonding hstateen bits in PATCH1. The remaining
patches adds lazy enabling support of the other bits.

I am working on a followup series to add indirect CSR extension and move the
siselect/sireg handlers out of AIA so that other features(e.g CTR) can leverage
it.

Note: This series just updates the hstateen bit in cfg so that any update
would reflect in the correct VM state during the next vcpu load.
Alternatively, we can save the hstateen state in vcpu_put to achieve this.
However, it will incur additional cost on every VM exit while the current
approach just updates the configuration once per VM life time upon first
access.

To: Anup Patel <anup@brainfault.org>
To: Atish Patra <atishp@atishpatra.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Added a preventive check for lower 32 bits of hstateen. 
- Link to v1: https://lore.kernel.org/r/20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com

---
Atish Patra (5):
      RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
      RISC-V: KVM: Add a hstateen lazy enabler helper function
      RISC-V: KVM: Support lazy enabling of siselect and aia bits
      RISC-V: KVM: Enable envcfg and sstateen bits lazily
      RISC-V: KVM: Remove the boot time enabling of hstateen bits

 arch/riscv/include/asm/kvm_aia.h       | 14 ++++++-
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 ++
 arch/riscv/kvm/aia.c                   | 77 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/aia_imsic.c             |  8 ++++
 arch/riscv/kvm/vcpu.c                  | 10 -----
 arch/riscv/kvm/vcpu_insn.c             | 61 +++++++++++++++++++++++++++
 6 files changed, 163 insertions(+), 11 deletions(-)
---
base-commit: fb13a11917ea679b12b0d51905dea1cec23c015f
change-id: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
