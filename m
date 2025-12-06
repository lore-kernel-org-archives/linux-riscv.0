Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FBCD3ABC2
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91MYjjPurYeCK6oI00n0Q7wSpVyIiF4gOrD17oHIvFA=; b=X+76TPl+6XF9ID
	rJKOb1LEZkmtxIupD7HqucEEYaD+pbMWF4scxuf7xBZ3Mw4feJiZHjjAT/n+dsyIdFPntGUN0ctqI
	9UNEx7phKTMp6mfiy0Fjl6z56SQDa7Aeoq3KqMOxsA3LW/BBPAfLhpFZABmbfbV9jH3JcK8zKLUO/
	lFoNlbVMUi846y1nLRpZ3Y2p7YwHBCCKQlNB0RhTMFC7PjkRk54Vyp9yDiAcViqzOsO971TQgKNYI
	6mnbPnEl/MiGx6DOpcX5dDYrFgHIA9YM6gKAP707QeumLSvuMGQdGepxL7+rb4X62KkQ1Kw+0jF9g
	EwNTj2HB4GPjHtRmZp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0W-0000000AFun-2Zi7;
	Sat, 06 Dec 2025 00:18:40 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzp-0000000AEne-3zE9
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-29da1ea0b97so53766005ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980276; x=1765585076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RvT5QOLTrPlZDM6KRmJviB3G20BHxxiuQcblXVA4XhQ=;
        b=QJcWQDW5zDjx31P8Wd4OtSK5KUCV++7V+pbQFtDDR9iHTuZ7QZ3Wr8h8Tf236N8cSn
         SbIK6HrWNwkpa+TFGr/jdrC41Nr4X+IiMpYMW74MFLnr24XRYXP8ybvyYwXkAUPWmzS4
         HVZvcR0awdQW+UMH9KdhT8nc+6mIhIGC/xRHoOGi3CQR0iF575SuaCQ5QiyQp5/m6oPE
         86aZ/EGalhYOcvkbS4SSNGfbIgTwo88F84ldgSTe6Bcy6qvrRpLNPPn9o03ACCfkhwi4
         3nNgh+sm73FnOKU+BpUHPoIgTDyp70URJOi0Iw5IwbPKDWtzbm3papYdZJ+kRvbjtcgt
         XzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980276; x=1765585076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvT5QOLTrPlZDM6KRmJviB3G20BHxxiuQcblXVA4XhQ=;
        b=coHpemiS/ut3U1+pgdvGRuoqplw2r6qrwLQj5YkhMJfzlB9LguPts0YbyooCtIJgIP
         JQdwvqiahxaJtIJ3tjy6PwJYhuMFYby5oe+q3StarCrpUDd3RcLpZHEMXqXYshRRMaKo
         1nhBpeAMr8O66IDBBgl/1RGBaRQ2wFTfgxmo/2j8DODbIBV7XWU/lhEfScaYT/0KSNdA
         N60DmaP1gj3J7+qBSp6gB8Mf5WrvP93TVU/k/T/fM2UPM/aaxbcU3AZSjOpkwpymcWak
         JAHXd+Hcr9HauKKIt4eFbN1QZXpGJERy0FrA1WAUl2zcvADj1XO+IWRkrVqfHT3Su2YY
         znTw==
X-Forwarded-Encrypted: i=1; AJvYcCUPfgF1ZMlStdIoKgk/CV25pjZLZQmokVyVzzexAi4QnaXNeQqFlTqwIo5LAtq2t9cyVtJC+p+HRKLG1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrffFzbGod2VBwgc2fhmcagKBhDxTmTdaeFV2PXPtyv3q0/Si5
	MKlSZJfOSXar5ZIeyoOySs1jqEUWqBneBhRQCfLcOgbRsiQ67ULzL3qZlAQJgZXVL0xgywG81IB
	1PEWqNQ==
X-Google-Smtp-Source: AGHT+IGYBlCmb/gXYXB/w+eLYeN/6lSsoZJHvJE9tm9YKGnjFm45dzt4nCYHuTcqC75ktumYKLC92IIPc9g=
X-Received: from plbko16.prod.google.com ([2002:a17:903:7d0:b0:29d:5afa:2c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d488:b0:295:5668:2f2e
 with SMTP id d9443c01a7336-29df880d025mr4171385ad.37.1764980276326; Fri, 05
 Dec 2025 16:17:56 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:51 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-16-seanjc@google.com>
Subject: [PATCH v6 15/44] KVM: x86/pmu: Snapshot host (i.e. perf's) reported
 PMU capabilities
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
X-CRM114-CacheID: sfid-20251205_161758_126180_CE5216D5 
X-CRM114-Status: UNSURE (   8.62  )
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

Take a snapshot of the unadulterated PMU capabilities provided by perf so
that KVM can compare guest vPMU capabilities against hardware capabilities
when determining whether or not to intercept PMU MSRs (and RDPMC).

Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 487ad19a236e..7c219305b61d 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -108,6 +108,8 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 	bool is_intel = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
 	int min_nr_gp_ctrs = pmu_ops->MIN_NR_GP_COUNTERS;
 
+	perf_get_x86_pmu_capability(&kvm_host_pmu);
+
 	/*
 	 * Hybrid PMUs don't play nice with virtualization without careful
 	 * configuration by userspace, and KVM's APIs for reporting supported
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
