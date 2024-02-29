Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C05C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74g6h1lAryNwN2w6ftaVxS9vEtaA0bX5HXSmCuvLK4o=; b=sDxgF6i5sVj/EX
	blV75SIWc6UUsPJ2AcucbEbTximGoKwszWrtxG8LiLJVFgW2GkinjexVjKINCMteTHKspGZ87WpCC
	GCI061KWDOlRcwXD7st9s2LQGwpiXjaFoUHvzsB1LLi0UQL4bDnYrrgvMDBSJuq+yWKlnaEA1h3la
	67qj2bc7fXhGyr7wKxM8sulmQhJQ1oE9Oj85nY3h5t52XA/gGKNZtj0IhEFEsPxmA0O7rS+Gcowma
	d3WvrCWr0cs29O7rkeWVmgJDPWJd5Db7wou7xJvrBj4YqYy1Vfb7En38JmQwfqb0KKo0kMjc5R+yC
	ZjwPB4J/gpbpCt2kav8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoW-0000000BWRb-2o5F;
	Thu, 29 Feb 2024 01:02:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUo5-0000000BW5i-04cw
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:01:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so3230835ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168512; x=1709773312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QezjoA6tUvS/5tHzC/r6igb3Gn0pDkI0esE0F/349nk=;
        b=wd5BkPVq/O3oDbHr3sJvZRUrFcKTVybRwAIGwftOWJ88OKjvUnsJbaJETGhzy/bfnQ
         UFr0yvNgl3iszuK5NVHKPyrkGaUNUUBxPcgOGfvuLX7IrZIx8DvD1yeRNio8FsxOZazH
         Mko6LvaEJO4pNwspDobsLPV6LNyvgmf1lzdMXyMpzpeKa3iwHcVs0MmWx5pJRymBjHBV
         1VIijIYAKshUhkSVwRiK4tIXtFNa7w4RF2wddwdyM1LEC21MeDr41Db7Yek3mR0DD5Q+
         Zz3tlgzalCJ5ET4sytnAeuJt8hQVJ0kCqlp2iFZgoAQ5kcxEWXi4NpUAiVuqfg5NxtwN
         Yj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168512; x=1709773312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QezjoA6tUvS/5tHzC/r6igb3Gn0pDkI0esE0F/349nk=;
        b=PBics1KB+P54NdQHWlTR9KMxVjJDO8C954KCDAeWUl9m/MCCToNN1/4UEyKRwpkpcr
         jenfQnGxcZmZXJQQe9D2yX1KKQ79GfcxiJ5RWo94CKPW9lhmOOjrVDVmsImim7y4YZep
         I0a8WcaDCbwQ+jXixAVGfAVk2J/imWj9ae/BtjvwCKmrk54M3vCiMiy/7a8QZA8Xf9lI
         D0EkLQ7yxHfvuoOV3qkSgeRePppxq273oI60BM/tapBZOxUFS2eqtTPseZjxHCc4RPuZ
         FqqmKPbIX+amo8ppot+OFS3S1M4xKbvviN1/otgf4gtQySWDZRe8weulx3eJxtFVZ3Xm
         DTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoUb7csMOErUTd0th1DxDqksnVEewUFGNJyE5zlM/Cw4BADvjfjkHAXDJdDpCmWY3hXfodxdhAyByqvhgpo3iNcqoDJrsDJXL23F6yXBVU
X-Gm-Message-State: AOJu0YyLHagS4/io4ufIACi1MHn3HuqdWVzmpt2/jx4myllsio3mHAeE
	cLj4MPvwrcABk4k8ULEybz90FPz4OZrJFilGxJS+jSz3OGXXZ2esxmGnL2SsrkA=
X-Google-Smtp-Source: AGHT+IH+EET8Cs2/q8Wdb2LR8HizaxTodw9btWcX4EbiH9oLwp/Rp0ha58Tl1o83d2hPXDRaMhd1dg==
X-Received: by 2002:a17:902:d486:b0:1dc:1ca9:daf4 with SMTP id c6-20020a170902d48600b001dc1ca9daf4mr595765plg.12.1709168512153;
        Wed, 28 Feb 2024 17:01:52 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:01:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] RISC-V: KVM: No need to update the counter value during reset
Date: Wed, 28 Feb 2024 17:01:21 -0800
Message-Id: <20240229010130.1380926-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170153_446080_EE60107D 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The virtual counter value is updated during pmu_ctr_read. There is no need
to update it in reset case. Otherwise, it will be counted twice which is
incorrect.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 86391a5061dd..b1574c043f77 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -397,7 +397,6 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	int i, pmc_index, sbiret = 0;
-	u64 enabled, running;
 	struct kvm_pmc *pmc;
 	int fevent_code;
 
@@ -432,12 +431,9 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				sbiret = SBI_ERR_ALREADY_STOPPED;
 			}
 
-			if (flags & SBI_PMU_STOP_FLAG_RESET) {
-				/* Relase the counter if this is a reset request */
-				pmc->counter_val += perf_event_read_value(pmc->perf_event,
-									  &enabled, &running);
+			if (flags & SBI_PMU_STOP_FLAG_RESET)
+				/* Release the counter if this is a reset request */
 				kvm_pmu_release_perf_event(pmc);
-			}
 		} else {
 			sbiret = SBI_ERR_INVALID_PARAM;
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
