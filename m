Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D2BC87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNkWt9wx7OLUz6m/PxaUtKY0i37OiZfRc1z1ltLAaQQ=; b=iwa8IxyAAEW+6A
	N8MYlCb7nf6YunkeRLCCYH1iBD83FI6rVe2xkgkHWOGJz9ONg8M6IQ+Ad8QT6GO98tj7uUpIzHnNr
	K78OGGZxJhdnwWHoLL3vm7Ai1wS30VTh75rFI6QcjBmRZKwdQ5HKrMNvXG5bKvaJVHc2eEhe0UIWb
	QGGoljEqp+9sv6+9lJBPyrIQ1epJN6NeZ4C5kHFjicZEjnPH9EAcqmCu9Z9uPvXboOosLcidGdvGs
	4jRLFJ7PTQC+TvtETqfHykTwSxbAGjYwY0P/wk59SLQqgnhNtCyLHQ43Z8cTE3E/XpBgNAoMOUTvh
	Y0rgPnSfZErKFpnIXGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujljg-0000000Ga7x-3sic;
	Wed, 06 Aug 2025 21:31:48 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHR-0000000GGzY-2deC
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:35 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31eb41391f3so293885a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510312; x=1755115112; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xm7g2YivXo6aQ0SA/h1DnHmIX017hVekqEmykFx3Fp8=;
        b=mhL/KeUcw4NUz/0olcHbFn4ZLIFh9+8lSdAEIq/SgzhOgNj5gxypRoweZe3MOCFHUd
         oPSqYi3rpyklSA8uJAGOnDh2AkFAVZN1EvVvKnYX/qpqaodwJC+2yAG4gk5TtLwtNqs2
         aJrO7IFG81qVikCsEENBwhgXMANmXlmrqrJy0L9yS8j6xqeDntKn/GjTg6/6IGjHP/vn
         fKUJmRQYFQYR3RA8bSWlUnMaIM7M3NCVX6+xdg4NvmQkTuLKtZCbLZWS43P6SI18GpIh
         JIXwYc3X7Dcj80alnDGgydNbF9maJuxX/4tKr2v9f6d61naoHLHRlgwI5zpzOm2ZdoYG
         YX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510312; x=1755115112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm7g2YivXo6aQ0SA/h1DnHmIX017hVekqEmykFx3Fp8=;
        b=G2Rf6OoqsekwCzFKbE2cvmGNp+S1oSuUURpxNjuPV5hJixB6Gtdc1Dmtr4amGXwya4
         UBOSHfTB0soACucnMkBEWu8MtFfGDBbWTE8fZ6lVfaRpy8vThmF+FIAITJoi1858m5Rc
         wd+kmNIkTWaaZgP0MOvboHh3rm1+5ysh4h7a/eCmZMy8fAWYdvByMp5ta5kDuNM2tVfH
         yYi1fpbNTpcQr6dXzGWHJWb4L9FKy7yM2vV65kCO+ojAioBMn/hsAT/RWYDkdpTymCJa
         0sQ4bDaq4hfXfqtqdvfRYTH7bb/uRt0oEGue+9S8wQqLK1eHI2wA+O8+JOeUatBqCAMY
         SxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXROGGH05IhDOsn9n1uP4GfM28OBhsXtBHOs5NTmEUBgwOFXDAinGF1rVBjPyzTevEL3gvWfyKUxKdbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1CFLFn7hyr1igfvNXLIFOpPCiBa7M+xzqbAZqIko/K2HIgSM
	mbd/L6W+csH5CTbo3pGDl4wTJi8Ht9HhQlBdLpYx829YFsb3ut578HSBvCCrdsLv7Bfhhcb3m8H
	7G/Hpxw==
X-Google-Smtp-Source: AGHT+IEYZIIJpt/ZXd2reg+ZYe1ccOM3EaPSbjMXbuV7EDQKePHF+PpZ3A2kJS4xCp7zKjQzYF60hKA/y+o=
X-Received: from pjbok13.prod.google.com ([2002:a17:90b:1d4d:b0:31c:2fe4:33bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fc4:b0:31f:867:d6b4
 with SMTP id 98e67ed59e1d1-321694b7c0dmr5279932a91.10.1754510312321; Wed, 06
 Aug 2025 12:58:32 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:57 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-36-seanjc@google.com>
Subject: [PATCH v5 35/44] KVM: x86/pmu: Reprogram mediated PMU event selectors
 on event filter updates
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125833_667986_B0648375 
X-CRM114-Status: GOOD (  13.78  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Refresh the event selectors that are programmed into hardware when a PMC
is "reprogrammed" for a mediated PMU, i.e. if userspace changes the PMU
event filters

Note, KVM doesn't utilize the reprogramming infrastructure to handle
counter overflow for mediated PMUs, as there's no need to reprogram a
non-existent perf event.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: add a helper to document behavior, split patch and rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index e39ae37f0280..b4c6a7704a01 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -518,6 +518,25 @@ static bool pmc_is_event_allowed(struct kvm_pmc *pmc)
 	return is_fixed_event_allowed(filter, pmc->idx);
 }
 
+static void kvm_mediated_pmu_refresh_event_filter(struct kvm_pmc *pmc)
+{
+	bool allowed = pmc_is_event_allowed(pmc);
+	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
+
+	if (pmc_is_gp(pmc)) {
+		pmc->eventsel_hw &= ~ARCH_PERFMON_EVENTSEL_ENABLE;
+		if (allowed)
+			pmc->eventsel_hw |= pmc->eventsel &
+					    ARCH_PERFMON_EVENTSEL_ENABLE;
+	} else {
+		u64 mask = intel_fixed_bits_by_idx(pmc->idx - KVM_FIXED_PMC_BASE_IDX, 0xf);
+
+		pmu->fixed_ctr_ctrl_hw &= ~mask;
+		if (allowed)
+			pmu->fixed_ctr_ctrl_hw |= pmu->fixed_ctr_ctrl & mask;
+	}
+}
+
 static int reprogram_counter(struct kvm_pmc *pmc)
 {
 	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
@@ -526,6 +545,11 @@ static int reprogram_counter(struct kvm_pmc *pmc)
 	bool emulate_overflow;
 	u8 fixed_ctr_ctrl;
 
+	if (kvm_vcpu_has_mediated_pmu(pmu_to_vcpu(pmu))) {
+		kvm_mediated_pmu_refresh_event_filter(pmc);
+		return 0;
+	}
+
 	emulate_overflow = pmc_pause_counter(pmc);
 
 	if (!pmc_is_globally_enabled(pmc) || !pmc_is_locally_enabled(pmc) ||
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
