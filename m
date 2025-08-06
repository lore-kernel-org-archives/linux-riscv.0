Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2801FC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dT9+ueh4EQgsEz15PoZckXTSxSyAQvZGiwQBBpMld7s=; b=F+UF4UeBUjOO9v
	kebrFdbTB3CdP3WcHFqcj0zbevXEvJydJsP3JG8Gr8ZPN0HzWyL7oeiTFGz9dpfeUH4lRjIBiOaZ9
	aFFYig46cjW91bjCmouqB07/H1irwI8nV8J8Z6ymcdZ3jk8CelUfziDxhK/CmEvDutLgSRlTryPvV
	u3TbsYTEC+eIpE65lzFiZZrYiJwzDgc+9ZpkRZdDaimyiloasyoYrUs6cotKnyFbstqI+dKhkLBkL
	Mv2phJtQm9PgNp46v0zY+5LWf0H4VcJ5BsCbJGk7K3c3A11EK2oYJ5mBc5qFAmzoprR6IMq/OIFvs
	UUfA24wfyMLhkrMBKMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlte-0000000GbWg-1HLP;
	Wed, 06 Aug 2025 21:42:06 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHY-0000000GH7b-2p4b
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:42 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31effad1358so224073a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510319; x=1755115119; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AlJpQpYzAXA8yQUaTEjcLu5rmW1zUT5mjcWEtsvn+qY=;
        b=2w3zSSZMTVh+Xp15XSB1xGX1K+DxLje25+Ykq7cPAnYmFzWFS48bnPG1cYP7y3NioY
         lekkhrKwy2pyhH4kA1rzsGmE9QSLL5Ym8f3feeXYGbaHhIPp4BDYWxF7ULxQGYC8BqZn
         uu/VnavlKx3XMtKJ4DTRCH7rvNvkm1OPjJWG4s23aZ0UQEc5P7+5fmV6ye9qHx5hTZgF
         waTT6uzYdz1SVCMmsHy5UuLIC5lqRZ2cSV7LGy5x2vpKjEtCghcutd3G3fuu820wqTav
         T91z+gHWSCHCcE4RkqOKGJrCAzIdnP+3msyPYv1CkTIzly7gjJxgY/gYBOrfI3vkW2ke
         GGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510319; x=1755115119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlJpQpYzAXA8yQUaTEjcLu5rmW1zUT5mjcWEtsvn+qY=;
        b=vSp87LWtV+izFtt5qnOCmbTOtQQSO4o3plO056SYiuVC59WirO7GiCikK9CoR+PfFa
         pjQjsdPrj9a5EdO+mvhYQAfsAeoDo9lDX+5Ny/ipExF4RxcfzKgV0QsIgnRi8jUPSJD0
         rPiDkhi5VhlP+T6L0/IA+2Srt/SU9m5yJgBxfNpvFTszxyQSAzVP5aLBprDxVRBno+QI
         dcdxsxxE8X/oyJ/kptteD/OMYWBeSfjNtVmJ4gnEO6lJqrrl3QKc/c5AW0IIFqGVvVfD
         cHv2y6S5oZmwbVfQxZcjLZlSGCoGISAyiQgOvXw5ndfp+19O5ys8cGTf7NdpZLBxOMH2
         FUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxvWcZluEEmk1FouYCKEzi/1fdi+j8QLqpF74VTFT+Kgw//e210Brv3+D2BYwNMxtRjLQqIro4Ibve8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkM2f1DNfWCGUnmIFtcwSihZ9bSkghQ+6F8bLwx+ka0sW3ktOh
	tRsElz+uKZDT67fty1NaEWf4aNQglJ9w9uJQ66s1BZWeKsVUeZrZdnkhgM1saSFmnOkqrsfGLSk
	VfIQdPQ==
X-Google-Smtp-Source: AGHT+IFAT6PWSjUL0hLa4l6orw0CuXbesqbqOENgS6V/LUSfRrl7M4gZLDmaQmAh4Zg14qO5rj6Zp5FZNJo=
X-Received: from pjx15.prod.google.com ([2002:a17:90b:568f:b0:31c:32f8:3f88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5110:b0:31f:4e9b:7c6a
 with SMTP id 98e67ed59e1d1-3217562accemr1061143a91.15.1754510319397; Wed, 06
 Aug 2025 12:58:39 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:01 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-40-seanjc@google.com>
Subject: [PATCH v5 39/44] KVM: x86/pmu: Handle emulated instruction for
 mediated vPMU
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
X-CRM114-CacheID: sfid-20250806_125840_719301_BF27DBE6 
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Mediated vPMU needs to accumulate the emulated instructions into counter
and load the counter into HW at vm-entry.

Moreover, if the accumulation leads to counter overflow, KVM needs to
update GLOBAL_STATUS and inject PMI into guest as well.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 77042cad3155..ddab1630a978 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1018,10 +1018,45 @@ void kvm_pmu_destroy(struct kvm_vcpu *vcpu)
 	kvm_pmu_reset(vcpu);
 }
 
+static bool pmc_is_pmi_enabled(struct kvm_pmc *pmc)
+{
+	u8 fixed_ctr_ctrl;
+
+	if (pmc_is_gp(pmc))
+		return pmc->eventsel & ARCH_PERFMON_EVENTSEL_INT;
+
+	fixed_ctr_ctrl = fixed_ctrl_field(pmc_to_pmu(pmc)->fixed_ctr_ctrl,
+					  pmc->idx - KVM_FIXED_PMC_BASE_IDX);
+	return fixed_ctr_ctrl & INTEL_FIXED_0_ENABLE_PMI;
+}
+
 static void kvm_pmu_incr_counter(struct kvm_pmc *pmc)
 {
-	pmc->emulated_counter++;
-	kvm_pmu_request_counter_reprogram(pmc);
+	struct kvm_vcpu *vcpu = pmc->vcpu;
+
+	/*
+	 * For perf-based PMUs, accumulate software-emulated events separately
+	 * from pmc->counter, as pmc->counter is offset by the count of the
+	 * associated perf event. Request reprogramming, which will consult
+	 * both emulated and hardware-generated events to detect overflow.
+	 */
+	if (!kvm_vcpu_has_mediated_pmu(vcpu)) {
+		pmc->emulated_counter++;
+		kvm_pmu_request_counter_reprogram(pmc);
+		return;
+	}
+
+	/*
+	 * For mediated PMUs, pmc->counter is updated when the vCPU's PMU is
+	 * put, and will be loaded into hardware when the PMU is loaded. Simply
+	 * increment the counter and signal overflow if it wraps to zero.
+	 */
+	pmc->counter = (pmc->counter + 1) & pmc_bitmask(pmc);
+	if (!pmc->counter) {
+		pmc_to_pmu(pmc)->global_status |= BIT_ULL(pmc->idx);
+		if (pmc_is_pmi_enabled(pmc))
+			kvm_make_request(KVM_REQ_PMI, vcpu);
+	}
 }
 
 static inline bool cpl_is_matched(struct kvm_pmc *pmc)
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
