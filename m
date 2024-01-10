Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821DDC4725D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74g6h1lAryNwN2w6ftaVxS9vEtaA0bX5HXSmCuvLK4o=; b=L9Vp6Rr8TnAbt9
	toMafvXhDzSEWoSfniLv78Oi+/rbopRqRksX/lY5nYmnYGvbU1g8NCC/rbPXtoLLvPoHcCHw8BWbj
	sT0OTyIA0m0biVOQ5MkLxAFxvQWmcb6ss1mUvuAUZQPj+Ceov/yTFL/LMaXlyUX44HVQ/tjVwpNTG
	u35mWj9aHGiYUaspm2h1wHH592W/3J0OTbZv7H5dTxI8duY1m+S7b58ajcK/+f5r+erY1Ekd+oGW+
	VqLg7gR3gY/5LYTVhpHrGe/C2D/lapGigoP6j5oQbSu9TQNuDuX56QuksMrVAoY5RF2yrWqT9u9ZA
	KOwoAn4OtdYO4aO95WbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmi-00EddS-2t;
	Wed, 10 Jan 2024 23:14:56 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmb-00EdT4-15
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:52 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7bee3761bb4so91507539f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928487; x=1705533287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QezjoA6tUvS/5tHzC/r6igb3Gn0pDkI0esE0F/349nk=;
        b=SJ5Qc1GRGQBYBI6Z6CeALGHqMMHAsiteh4F1yxuuBRt9ArZ1pyXf4sGHDh9DJcEi0X
         UtdaXJRKqD+h7JMZaaX67Q275E5o4ctvsP7PeNr1q5sTdNsg/PGw1bSMfPWEIoWe8L9v
         O8Ik3Dtxp4i2NdAVaZDpY8mKcrZ9ejk0Ycib8RF/cDBfFWSawYN84wiv1/pCXOPMkxZ0
         eOKYCZ8CMHfhy2DZPvFBn2ClDTd+TnyENgn8Mrfoq//M2blZ7X/dZrrUxxNPLGnOrmC0
         Qs+VwjeKE3FWJRtEPvFRhVxTa3hosVG+2K0upCNXiopw2E56RbZLgCo47T6jqUikzT9t
         9X3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928487; x=1705533287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QezjoA6tUvS/5tHzC/r6igb3Gn0pDkI0esE0F/349nk=;
        b=wGerHBnAZzwGjCd0RywqDQ4OlQ7jdL0MeXcUq0qXgzPqD+HWCbNKnXtQsAd1QviP2O
         NOGlfbb3KvLfGjWoAJ8ZxFya+2DIqddsj9RFa9mntJvsHGb7mjfmH4u0FYCmMivlZXCD
         4ro1yTtzxjL0tOANBIpDtTcQRJZVJVvZGUDnBPoNMOsN6raHOi6ZcVQB4m2YgzNCiK8W
         72fqRhhgxHM50xinluJ/N9EG6RSN6n2tFJHn1KfKjgDxgR7P6uLVdx2lQ75r5Ja1Zkzv
         0VimCj0YBj5M816I4JjtBtlqKfGlK0Sypg3EG+ksmLq4clAW/eRPTeMPoaxZ1ohlDxCU
         UROQ==
X-Gm-Message-State: AOJu0YzxD4zmu1WcniJmEz3dR9fxfprvpMJRekUKqbsNWRhBPaFAszit
	hGZIOPtrPJVgbUu34kA1cjDj/slJPQ33fA==
X-Google-Smtp-Source: AGHT+IEDUT17GMF4Ey0i/oYBIUhinUi3IYTlxkvNGgesi1C9N3qaiFERFQSZ9E+my76bd2GnH6ne4g==
X-Received: by 2002:a5e:890c:0:b0:7bb:df90:6936 with SMTP id k12-20020a5e890c000000b007bbdf906936mr380036ioj.41.1704928487361;
        Wed, 10 Jan 2024 15:14:47 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 06/10] RISC-V: KVM: No need to update the counter value during reset
Date: Wed, 10 Jan 2024 15:13:55 -0800
Message-Id: <20240110231359.1239367-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110231359.1239367-1-atishp@rivosinc.com>
References: <20240110231359.1239367-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151449_393746_89CAC563 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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
