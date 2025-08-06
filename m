Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C83BC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65zCEA2HK0NWPZNFGThegWr94XgjN1ux6/mQcuck5W4=; b=xsSGRXqDgLDKD7
	VzNNQQI0IMuGB8h7T693YS+Vg9gyZ1taKBvfU4KVzIoeKzcUztyKz7EWk1avGfocmsQPiuHdiXwmT
	EOJIIZDJwbJAuTNi9+RmJaLdLCAagCYZC1lnY8TXgD3diULNlVmclZtdmZPRIffdzgq4EWJSazl09
	q8VSm5o0s4T1HDh/8tNizvH8TzRKrnyNEj0+x5gtH4RVebBO8kcGREG1JD2G9o4PZTmJPVyrr66qa
	qmjDpwO6btDpJBapwM4LAQBp74bEV6UW9wkBonDYqO/q6cG83sDPLbS6EX+D9yjXA/8SUlAb+X5P6
	s9QGz1cEasl0vLuMlh3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm3i-0000000Gdwy-4B9M;
	Wed, 06 Aug 2025 21:52:31 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHg-0000000GHGk-2kfd
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:49 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-242abac2cb4so2086315ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510328; x=1755115128; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FEfQdODxvc/WYDgKcBJNCqpRp5QcBVEYBtlnYDr8f+A=;
        b=eRuV09HOdk4SWWulYarCvwBR3let4rMrNc6jKyYxwtkjCAYyC3War6D3vuTaG/idoa
         zAPilGBfOSHaWxRB2L8OEBQT2Kru6yndgMgWn6aayFtUEjvuw2m/wMbUBOCfQ7j6oUKw
         bDpUMe6nQ+4ZSjtgQEbjiC+0n8C1+lSCy4zeirRl9fteiJC9lNlxEMOohmmBsAnAWAFs
         /ODjR6+s9Dbk8sCEXSFfZCDwo3/HDmI51FI7G8zzjeEORRqJG2IdQCv6jY+FlFdcvN7u
         kSQK36p/cY4rbbfmlcQpDwTOHFdpdnMyHHwoLR2VJi6om6hYryPTbwzPXuQtqqnZkqTo
         MGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510328; x=1755115128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEfQdODxvc/WYDgKcBJNCqpRp5QcBVEYBtlnYDr8f+A=;
        b=omojm2M4JpMD1g4Qs93kwkKU38jTmdQoOclTjWcfpVt1UwhFcTEWPjjqujoQtjvixL
         AyjtL1Z5IE41Z/UKMJKcucysFLBL8Cie4VJ6Zwr/1iSkkh2b4Jq0jBk9zFQCAwpwdDQM
         TFB8DDOdv1zhWoB1mavlIiKeFSd9ftkUoJU7eeg7KW5ErqbKHHOk8XNX6HhCpL/2J0Yg
         B7HnvVLV1EwDVg+EhXqwI/jxms06ww4UCbrWVPmqL4apjplePaIHu9g2Y0ZliZYBXnnQ
         fIjMelGECifXBJ6gEWY1AqmLt45smBvBlyqvwVoemIeEwTHuo4xS8Hox0sbvAb0A8qon
         5pLg==
X-Forwarded-Encrypted: i=1; AJvYcCVxmvoRT7Lc+Wql/yiKwMuMkuAKDT8BGxFGvupRXHzS5bDs4OZqI/+MaS9ZEwdLLoPcP/725HOOqLFUJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3FH5QiKCjjdWJhLK3nX1ztNbYO+TVGmwbWel6C5A6ReA96C49
	cih90daCxiJkK+PvLoeF1m7364iULGTr4bvgX8r2AXivuST6qqjvIOyKzidmsGoPZ98LYWYjiNc
	VVeS+cA==
X-Google-Smtp-Source: AGHT+IHKT98t7sh+NJ88sddK4YezK7lHLHfrTfL2AYLv+RO+SAkhLkiCccC37Go9T+seI3ZwHUra06wFxFw=
X-Received: from plbmp11.prod.google.com ([2002:a17:902:fd0b:b0:23f:fa41:1de3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bcc:b0:234:c8ec:51b5
 with SMTP id d9443c01a7336-242a0bffb31mr47813405ad.53.1754510327813; Wed, 06
 Aug 2025 12:58:47 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:06 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-45-seanjc@google.com>
Subject: [PATCH v5 44/44] KVM: x86/pmu: Elide WRMSRs when loading guest PMCs
 if values already match
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
X-CRM114-CacheID: sfid-20250806_125848_723624_31E7618C 
X-CRM114-Status: GOOD (  12.52  )
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

When loading a mediated PMU state, elide the WRMSRs to load PMCs with the
guest's value if the value in hardware already matches the guest's value.
For the relatively common case where neither the guest nor the host is
actively using the PMU, i.e. when all/many counters are '0', eliding the
WRMSRs reduces the latency of handling VM-Exit by a measurable amount
(WRMSR is significantly more expensive than RDPMC).

As measured by KVM-Unit-Tests' CPUID VM-Exit testcase, this provides a
a ~25% reduction in latency (4k => 3k cycles) on Intel Emerald Rapids,
and a ~13% reduction (6.2k => 5.3k cycles) on AMD Turing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index ddab1630a978..0e5048ae86fa 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1299,13 +1299,15 @@ static void kvm_pmu_load_guest_pmcs(struct kvm_vcpu *vcpu)
 	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
 		pmc = &pmu->gp_counters[i];
 
-		wrmsrl(gp_counter_msr(i), pmc->counter);
+		if (pmc->counter != rdpmc(i))
+			wrmsrl(gp_counter_msr(i), pmc->counter);
 		wrmsrl(gp_eventsel_msr(i), pmc->eventsel_hw);
 	}
 	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
 		pmc = &pmu->fixed_counters[i];
 
-		wrmsrl(fixed_counter_msr(i), pmc->counter);
+		if (pmc->counter != rdpmc(INTEL_PMC_FIXED_RDPMC_BASE | i))
+			wrmsrl(fixed_counter_msr(i), pmc->counter);
 	}
 }
 
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
