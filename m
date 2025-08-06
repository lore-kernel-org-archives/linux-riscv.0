Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C93EC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16D9jfuXlrnlvDTU89PNSwcnUb4jlkh0GJXfKlTIdfM=; b=Ar6klpCrE0BgmT
	ENKfxz3EFP59RRLHQ16OANXw9ecPSuuoefjjoJSDDtQPuPars5zRpjLq4YKg7rUsooFtTkcirvQBG
	y3Ff5xNjfFyXPwaYT6CKjZ/B1GhTADp0eOcgCjFbbEq7/vEOg/sC2H5yZJEpr82R5LCagRMuD0knu
	WT5/othSHlI+WPu0VGpEwtBbv6D7W1FPtEem1WiOexiDTD4sZXZa9/njcxFAhuneauStej+Riuig3
	0r5rm3o3rvUl6sb7+BEBs6HNln8EksCYzpPBnUd6Z9Ws8B78k/y79x52msqmtSZhmtUak8qoP9QPk
	vAJrNLLD1554ri6LWMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlcA-0000000GYrg-1dCe;
	Wed, 06 Aug 2025 21:24:02 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHN-0000000GGvH-3Gsw
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:31 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2403c86ff97so2463945ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510309; x=1755115109; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h+R0RK6o+FBkoODCsg4/sPruy7k1VkLsFBuytBNeaEE=;
        b=1mA7rBR/I6HwUswNiBr2Nk4A09ZrVGIskSfNvXllmn5aAscdoYjaVCk1eQXBbiTPNO
         KELxz1eZnbOcKPoDDvVJFb1rCL3nRSIYHFp3+HtLclHQzGTrS6moeokQIdCxkR53UC7O
         oSRZ38jnIS4AyVuus47l60GXtdGR6/S29jNzpcvQrVydQGJPqpSOMsEO760Q+1PjwnJh
         ew1ynCj3Tx48nai+39t5zs7BXfUGAKDuUSHCfYj4sBBskbqfLNtYlTCCdrqTyE8etEne
         4CPhmh54HY3iSCkBBb7/VgukTE79h5dgtJ7rflInYV1phSs3joi0xZyh8LD5qLRWHaO9
         nCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510309; x=1755115109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+R0RK6o+FBkoODCsg4/sPruy7k1VkLsFBuytBNeaEE=;
        b=e8ZCCE1GpME0wXB3r0e5B4hZDpTbsWXoa/pvJfsaDCgXr8JCkCOP5iOidrB/vfHdZN
         gqOWyRJNS7RQGRTDw5ASRTSQuvA6FFWt2tV0QJKdyX3HZKlFwuG61VHvknySu25TF/0Q
         I815iCosv013wsat0MM5Fy3t7Qu1WQTjCaElWynlJ7fHV1Je6OXGezp48rbuqQ5KdoEP
         KF+MIxZuOouFaLrCFjhMG5zP1eTuBR6N1AuELgx441D3svsQubpjuFNWxLuTtlpYUum6
         cgONXSbVPc49pTVMiEf6UNdqjaK37Z0yVDqBZawbzT+uyi1ViIRdtVhFf5iZeJO8OlVp
         iOsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkdNnTt5Q2IwmAjvovpla8eNmXHM+nIlm/mn0GmJ8TmjN6k1nupibFw7tQFQQLmq6oOMA0qA7Lq9oGHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7iaNX3ZFcnFehTGgMRHBZel9v9BCvdnwvncosJuReNQqPszS0
	4wF3OvWvW+sPn2awy0dODez6fzodW5A6YPD7SHPXqYWMdtNTBP4Z8SlPFwPQ7cAyzOROn+omY17
	ZvDpwDQ==
X-Google-Smtp-Source: AGHT+IEfUJQHCKm2Ka63Vh1rz9TId3URvafpVHxlHcjND/kCO75vRaPMhhxSn7fVXTy0Nxb/+lRjTxRhOaU=
X-Received: from pgbcz12.prod.google.com ([2002:a05:6a02:230c:b0:b42:1518:df18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d510:b0:240:763d:e9a6
 with SMTP id d9443c01a7336-242a0ae9d65mr50650645ad.25.1754510308841; Wed, 06
 Aug 2025 12:58:28 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:55 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-34-seanjc@google.com>
Subject: [PATCH v5 33/44] KVM: x86/pmu: Bypass perf checks when emulating
 mediated PMU counter accesses
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
X-CRM114-CacheID: sfid-20250806_125829_849158_BC817FC2 
X-CRM114-Status: GOOD (  11.64  )
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

When emulating a PMC counter read or write for a mediated PMU, bypass the
perf checks and emulated_counter logic as the counters aren't proxied
through perf, i.e. pmc->counter always holds the guest's up-to-date value,
and thus there's no need to defer emulated overflow checks.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: split from event filtering change, write shortlog+changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 5 +++++
 arch/x86/kvm/pmu.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 817ef852bdf9..082d2905882b 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -377,6 +377,11 @@ static void pmc_update_sample_period(struct kvm_pmc *pmc)
 
 void pmc_write_counter(struct kvm_pmc *pmc, u64 val)
 {
+	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu)) {
+		pmc->counter = val & pmc_bitmask(pmc);
+		return;
+	}
+
 	/*
 	 * Drop any unconsumed accumulated counts, the WRMSR is a write, not a
 	 * read-modify-write.  Adjust the counter value so that its value is
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 51963a3a167a..1c9d26d60a60 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -111,6 +111,9 @@ static inline u64 pmc_read_counter(struct kvm_pmc *pmc)
 {
 	u64 counter, enabled, running;
 
+	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu))
+		return pmc->counter & pmc_bitmask(pmc);
+
 	counter = pmc->counter + pmc->emulated_counter;
 
 	if (pmc->perf_event && !pmc->is_paused)
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
