Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7CBD3ABC4
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUXizRpfsIgv2WCc4lXyQhC95EbqZW3CEC1aLb+E1pk=; b=2u5MPB3mC/TzcR
	2lx65O1M5JrA0Yr3qGvGEXrGwJVhltUvLlKHpmFl17rKWl+UaddanEncyDU2j7J0QSwfzpBaR+SZE
	bxMu16y6HTn0Wg0deQ14bcBJkxy0tiNSW1asMvI+cTuoh/4GlZtRoo/WjHR6wVT6QmlzhuXHOMJNT
	U75iwAa+1z0NEGaF7+SrjkxfNraGlKoT/4Ns7qEjXjOMyvN8HtPWWzNDUnrSc4msHdyDQDmdCVFAw
	l8dF0F8/RmaCX8OuV5s7BmtSEW1xWDsRMtUrThM8YSKbNWs/XAI0IaC5FWskm9fnqGPi13JlBiC8b
	TcBqKzp5mK0BmuMvzEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0n-0000000AGP9-1X8Y;
	Sat, 06 Dec 2025 00:18:57 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzw-0000000AEwm-1NWK
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:06 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34992a92fa0so1248099a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980282; x=1765585082; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m3Z5nHAcUfdxfKrbAwjeK85mE0dJR71iRHLzzuZPmpA=;
        b=hyMWLGmih2ud/hZjqt9TCvAUeYOCMUEd7vP4LmYA/sKOlW6PnOZiQEgiAKvaeSsJdn
         SXdHfr8o2yMhiJHvMjVgyqaa+Zk9p+H5vk2MQ6htCkXIDRDM/R/9CnMiBCL8cc8SfhAx
         EKc0Gl0FCcnqLJRkEHjhr7YyHoW2A7f8x1PNcQl1isx6CZY7iaDLZAjrWLDArz5FBXvQ
         3qZLLK0Fz8bjxIIkMbrmrYdHH4WSS/u61lXo8+zdbs6KsqsGAu4qKaUaitD3kJ4BN/Gx
         NEJ30MKe9YpZnHG848/PIUmRoHFQ7N87ITIPs9uJBEmv7siv4pAaVPN2oeBhItlcDWsC
         /ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980282; x=1765585082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3Z5nHAcUfdxfKrbAwjeK85mE0dJR71iRHLzzuZPmpA=;
        b=SbYyagxWwb954+aITNYkDDGRkMMxwUFPC/q1pmynQNnzWR3GLfc2+O5rsm9RHj1yM/
         xid8kgSU7fkQu5/GTgBlbkaQRb34fHrhbaWpDkck1QpJsvkJptivlRQCDr+IC4L6jBor
         LlbIREjjApuOJKs1xtsPLXfoEKfIH+c6GbOOusscQjsEJfuDALpQn17OOGBcdMKpnP+j
         Rdm7wZQ7HHmQpfoDdAdczCgPC6aRWKfmgpiHceoAogNxq3yRT7Wcq78nT2GcR20z99zZ
         gOgkvvbDYMeyJ4c3SHyaj84KPMijnNjx2y90e9XChQnExQFq/ar4Ncrc6eCp2d+PvsxS
         OcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF9Pv0bLfv5mPLQTmdTKoDDX/XUhvXi0IpQrGyUagm4WxhfGHQLv/b4LC61JqbKdfK1FK2n3ayYC+3fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwU2QO2Ic07LRsyMdSxtbdNfNluGz0kOujYFuPaPjYm9Q3Pnq0q
	VWy0+MJCMEzIvoFUgC9OaxRtk+wKkjqoJUtzEUOOgnpSQ/UFfQ8kfbSLWoCTmeIZUOpeKWMTJQ7
	f8iWf4w==
X-Google-Smtp-Source: AGHT+IGcOklQOzJ/lNZWJnk8g0uw9rVYfuzrIb6PtX+N9IOeiT702eHEqjavt0HC1DcnaOX9m2isN8tDRpE=
X-Received: from pjyt22.prod.google.com ([2002:a17:90a:e516:b0:340:92f6:5531])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d2cb:b0:33b:b078:d6d3
 with SMTP id 98e67ed59e1d1-349a25bcd68mr661307a91.23.1764980281984; Fri, 05
 Dec 2025 16:18:01 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:54 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-19-seanjc@google.com>
Subject: [PATCH v6 18/44] KVM: x86/pmu: Implement AMD mediated PMU requirements
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161804_648438_52303293 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Require host PMU version 2+ for AMD mediated PMU support, as
PERF_GLOBAL_CTRL and friends are hard requirements for the mediated PMU.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: extract to separate patch, write changelog]
Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index bc062285fbf5..16c88b2a2eb8 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -227,6 +227,11 @@ static void amd_pmu_init(struct kvm_vcpu *vcpu)
 	}
 }
 
+static bool amd_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_pmu)
+{
+	return host_pmu->version >= 2;
+}
+
 struct kvm_pmu_ops amd_pmu_ops __initdata = {
 	.rdpmc_ecx_to_pmc = amd_rdpmc_ecx_to_pmc,
 	.msr_idx_to_pmc = amd_msr_idx_to_pmc,
@@ -236,6 +241,9 @@ struct kvm_pmu_ops amd_pmu_ops __initdata = {
 	.set_msr = amd_pmu_set_msr,
 	.refresh = amd_pmu_refresh,
 	.init = amd_pmu_init,
+
+	.is_mediated_pmu_supported = amd_pmu_is_mediated_pmu_supported,
+
 	.EVENTSEL_EVENT = AMD64_EVENTSEL_EVENT,
 	.MAX_NR_GP_COUNTERS = KVM_MAX_NR_AMD_GP_COUNTERS,
 	.MIN_NR_GP_COUNTERS = AMD64_NUM_COUNTERS,
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
