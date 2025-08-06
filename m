Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF98C87FDA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0uL6y3/V4L9N455O33bYBBMyBgDEnsaYAbmRBw7dOg=; b=P905l9SNEt9cuV
	WHC68t6OugCECK7SgWlpLfGxoEX1HFUYXhOHMco4TWk8J8oN9ncwZ/Hh8YWqIola2WKAVKON0lrNK
	b08KrlbR2Fyxs8XYebl3+f5fBNNozRraReREuORfpgYsNzvjAyP9eKbDSNc8u819s/CRNgFJYkxSQ
	meuRBbOKef4Rt/vMlpgt6vfhLr71DABw72U8Kcyr+UhgQHnVE9kwiaqwv93KX30O1FwasTrKvRRZ0
	PtZ3fBriwRuxRjdBGuqms5oUHnCTgKvsVEh8yjA4jqfFinRitNvIJXi6NrsI1PCN6tTzWSrDUtBB0
	gOoglaDRthSvSEkxHR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujl83-0000000GTzK-0iGt;
	Wed, 06 Aug 2025 20:52:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkH1-0000000GGYC-099B
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:09 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-24011ceafc8so1594765ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510286; x=1755115086; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UYs6XLsbq3wmUfEBezJ9021CIzqcfmK4yWnl0Vk41Lo=;
        b=K4IBHmVbrYwQZpT3RXIcvLMl8ttF8ueCio1bKb3sDtQGN0j2Z61DdjyWVVIjA65grz
         xeTIt2DEhGnNxbSyX1Pq3bdJbrf4+ynLHvO1nKJfgKZj8Q0g8K7Uqi80iMUyc2Hu6r1V
         ndfzSVrIEY74HiU6AQOFw7fsX4q4orokfTvaeRIYB2EPtnuqSjv0i8qk4TSJtgX/9oTu
         i+ekMEbYmrOdmkkcUUEN4Qxn5IVfjgPselUSV2t7pnI7bZqUk6Af6gMf82k1EFnS2mHR
         Ms1MdlXBRSHPzEhavfea1IIaj9g1feJy+xcLMzb3wF9ViZPZ75DYHUJPjxQHOZ5mYVbH
         3+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510286; x=1755115086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYs6XLsbq3wmUfEBezJ9021CIzqcfmK4yWnl0Vk41Lo=;
        b=dk9Yb7jThoyfHz0CcNmdKle1Pr7jGilSBy5eO45ybskEVqOah2thf1cBa9t7JShm4y
         kj3bc464HZ8tEf+kwo6tPSxcFyec1X2OVTKKu4YEbCzaq7RrD/ghA4jO//x3HeFSBKAf
         3vfDo7ZOGQB8D0MkF0Le0P7Ilkwp9XOJ5c5AT4O/maXgdi60PfbQqgJfY6uL1d/fGPdt
         uVI0Cg5uvatbqrrIBJU7qzMbWtSJ4zVFCVHbuBg/LhB3lQmxB/DtsJDFFJLIsliNAZJ0
         X3/lNNuCdw6n9m2wfHCCn2FxOxjYtOB0l+paiPN9Z9h+bknlva5NyfSjqjrWIDLZkklI
         ndtg==
X-Forwarded-Encrypted: i=1; AJvYcCVITl8qRGi06HVquO9bCj9x3wGmqqLkwVd5O5zA/pXKzOpoXp2qVs42Hmb3A5zuAXrDgRFjLkWFVyVOFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL7yvXL1iphTsAHpgghskF4CVioWClBhq5nGPGYoKed0wxrMBt
	ynAy+NtxDzbW5hx8mDIAhXtoU4E2lITm636zGS7oEMqJsZ1HNtl6dMxbUe1hD0ohenfMnF9hEYD
	iKxJh3g==
X-Google-Smtp-Source: AGHT+IEjtNNsSzvoH0/VB3MvaueTobKjhNGxenKGyVkg+/CWGpyESmYfNsRK9kQsugEnvTMUeRjISaSTO8s=
X-Received: from pjov3.prod.google.com ([2002:a17:90a:9603:b0:31c:2fe4:33b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b44:b0:240:b28:22a3
 with SMTP id d9443c01a7336-242b1a687dfmr5147985ad.29.1754510285965; Wed, 06
 Aug 2025 12:58:05 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:42 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-21-seanjc@google.com>
Subject: [PATCH v5 20/44] KVM: x86/pmu: Implement AMD mediated PMU requirements
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
X-CRM114-CacheID: sfid-20250806_125807_078601_9B251C90 
X-CRM114-Status: GOOD (  10.10  )
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
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 7b8577f3c57a..96be2c3e0d65 100644
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
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
