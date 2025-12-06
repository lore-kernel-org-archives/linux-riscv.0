Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDBED3ABC2
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2PQxC84NWOXHNsFD029E2kD9hJQWkyzd/IENB80w4M=; b=2XVmCK6/3jC4gN
	8LlnvY7ml4mfgpDFIvNoSlk1GvHyHXOqIQZ7Kcp5Tr5RWEaz7ue4S8NZhC6HolNBeiPT++nxBokqb
	KwIxVklnGC3gmfKdbOPAV7JB/j10Pi11U6Bv7ux6He4ZLf1K+5jwHOlHBgZkBBfNuqmN5d+DrrxI3
	coG1AyYmUxt4bIdYZQKPlvdW5htQliqsyPwUuDfshxFc9hPUZiUgq9HtvxF30ixrDsYr1//5iWJ+g
	YHQs2K5PdYuZ92EAnTv91yf8QqNZyMKEHpAQKcJlGKnZI1oXGycz1sFiuga8hKWvv4Qyr/a9IdqAs
	42hbpUkeSvwoAofCUReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0B-0000000AFLj-3t8U;
	Sat, 06 Dec 2025 00:18:19 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzi-0000000AEay-37X8
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:52 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7ba9c366057so6696399b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980269; x=1765585069; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OFskCraMCAt1o1jXv8Q2cmHJ2OyK2yl9CAVs1/Lc01w=;
        b=jzQG93zY7+kSHfh6tCQmVBRYXkXZdwMJ3aNPoxvAnAx0wv+MHVRaoh8LccPTiMk1Kn
         FmgJNGiMJk1KlouiWO1D/O7TH9OeMAJ/h31em8Ctn0L9m0c2/82uoZxo0LSe8Tvm+Vih
         5BNYb22S040XFFUgBtwI8+Od2cj8DVInoPUSx2RMi+HUGy7E5Od0LvmhPltMnutiV5ib
         vsboSfLyyAikJZQEv+Zuf+1BzY/5Ml3QsZC4FTwxZDZCDZ8FekCzuktBV/V14WO7dFBV
         KboZMih8afC3+kqbTBi+PferLvDm1dMm13scT36K5fvNljL0jEAFx+ti9E4ksnvXwfJZ
         8fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980269; x=1765585069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFskCraMCAt1o1jXv8Q2cmHJ2OyK2yl9CAVs1/Lc01w=;
        b=qxhwX6124uswD1MZ7cOLxxKybQVAji4T0tqwv3iimqvDt508uvnRLE8V/BttTmhQwj
         sYgrDJKs3OjVSYIg5JwBxWX91Z82FTibu4rtHHHUCtcAO+QInhi2WEZyKl9KMVP1mFNf
         6G2G2Gh9NjA/PIrT92OHrAF/CCDAlq8K2oCnJ40hJynTn45//8btN2oB4Pvf76AjMYcS
         x7dvCtXa28X9Hiq5Xv+Hvf1O43+l/ha/7Wa551+zy18cO1XtgWFW7UfJHcQb+RqaRahC
         VDHGoF3tXsAJM+pOQWzyFwQGnIwbzCamZRi5YCBXBF+BrKEQhGH7wyZkEkFABksJFhXs
         rq2A==
X-Forwarded-Encrypted: i=1; AJvYcCXbgmWTsKQh3njyL4dXVx1KNa8LEVNjj8/eoYwQyfBvmN1QT3l0ahoS+BWzg6eQenROXCuA1mofViu24A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxegyz7tmOLE6w6niCMzgDX+tIKRkuL5eumdhw6S41vKKDT+kZ7
	S4oTL99rYO2NQ3e15OBxbMPPrgnndl48s+xsz8KuKAhl0YMrBZcKU5H8EIN+38bpW16DUJYsFz6
	jqor1oA==
X-Google-Smtp-Source: AGHT+IFfI+s5eY5Nrz61icCfCwYv8IGUZBRQf6oh7KDogWUJprIuAF6nUR9g3xDsrE/LDxUvXG6Y79XK/ls=
X-Received: from pfuf34.prod.google.com ([2002:a05:6a00:b22:b0:781:26f4:7855])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:234c:b0:7e8:450c:6195
 with SMTP id d2e1a72fcca58-7e8c6dac143mr767576b3a.44.1764980268965; Fri, 05
 Dec 2025 16:17:48 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:47 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-12-seanjc@google.com>
Subject: [PATCH v6 11/44] perf/x86/core: Plumb mediated PMU capability from
 x86_pmu to x86_pmu_cap
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
X-CRM114-CacheID: sfid-20251205_161750_927079_6C705829 
X-CRM114-Status: UNSURE (   9.00  )
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

From: Mingwei Zhang <mizhang@google.com>

Plumb mediated PMU capability to x86_pmu_cap in order to let any kernel
entity such as KVM know that host PMU support mediated PMU mode and has
the implementation.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c            | 1 +
 arch/x86/include/asm/perf_event.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index bd9abe298469..1b50f0117876 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3137,6 +3137,7 @@ void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
 	cap->events_mask	= (unsigned int)x86_pmu.events_maskl;
 	cap->events_mask_len	= x86_pmu.events_mask_len;
 	cap->pebs_ept		= x86_pmu.pebs_ept;
+	cap->mediated		= !!(pmu.capabilities & PERF_PMU_CAP_MEDIATED_VPMU);
 }
 EXPORT_SYMBOL_GPL(perf_get_x86_pmu_capability);
 
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 4cd38b9da0ba..4714bdee17b2 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -296,6 +296,7 @@ struct x86_pmu_capability {
 	unsigned int	events_mask;
 	int		events_mask_len;
 	unsigned int	pebs_ept	:1;
+	unsigned int	mediated	:1;
 };
 
 /*
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
