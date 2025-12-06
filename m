Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B21AD3ABC5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLvg3vl9d0ozNWpdmaH2U02cJGCi6XlQzFaZ8RTcaZw=; b=5BUR7j1RecN/tN
	mMaZIwqUtOZNzg9IMqjIc4zoj0giC6SqyWd0isRaSThgSa0M9muVPO3RtHOlDDsTmA4Wjp64Wsn16
	cEJJemqEPbRg5uHeGq/4ibfsBR8VwvlkNfiZLSYiCMqL6lCTLOcHkbSYWmVx4ujO6LpGlwdVKbUAo
	DuxNQYB4506XxFUBs/GkRyD2MIhUu0RBTObDFGEqQUbE2E8iRQy6KpM5G3p9dvOt8dSwTItk6r1Fq
	XTqJPWXzy4l5mxuYXYTZUAmjaZcZMhYV/pH3uyPD4mz98PXWjpv/cUAfLml1b3UpM3TmjOap4Bsa2
	nBdg/ABlwB+jZHBNz2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg02-0000000AF8D-1lVC;
	Sat, 06 Dec 2025 00:18:10 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfze-0000000AEV9-46Ow
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:48 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34566e62f16so3089756a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980266; x=1765585066; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CUuCYzCJ+7mOkcgENgUcVnWD5HNM+Ecxc29Wc5gu0a8=;
        b=ki+/NtDQkzcwqUxOPgZ6SQmZKwgF8o7/uVBiYbxIllV360//RA3ob/pETYukap9WnK
         BdS5dgdgFca9FKb8DV7nnRP7BgSbchINPFCp9lEZqWMSEaSxM1NNdd3iT6H/BRPNTTbF
         0uKqCY9gc4G9uYXSgTwcd3mMVVKPEDE5Ln9LPfhyH0KdnjpLW54xcDV/9YCKjXRcmZkI
         7ByE6zyidBquGII/61XEBhgZigzh0WNel4IlyKSO2yHyoeDyToU/wTQAeYXZaXiOFAli
         /C94RnhWA/2FYtavvDMBa5DFkcODjzVsLBawT/Ht0eyoz3+5Yni+I2NEKiHEWvT51R/A
         iWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980266; x=1765585066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUuCYzCJ+7mOkcgENgUcVnWD5HNM+Ecxc29Wc5gu0a8=;
        b=E/xwiiq1epx3usHtt9wZFSfsPYB4PP+KcyKA0xzljs2y2izMZTnvBFIRf0M9ENN1vY
         vMf/dqZgnhkQ3I5I7TCwj/GHyjgG/Fb/v4LldWcTaItCIgsFrcel0dOJogSN+x/9quLu
         JsS0qDWRt0x4K+WlfMmZrg0Q9hjBfDf8qqCjjOOvBMX70DqRXx2BpGP57mhLuHeZ1TMr
         TCfzMGBdqG3Jw9++wltPcYH28wqAIhB9nrMc+7Zn5paUMI1R0lKs/bZ1jcJptVNE6LJ9
         PmUNqtW706Lw0Pirs4dpZ9GB3Ds8JmH70a1Eidjq3nu9TGRjnh/IZUiz7dC+uLU9NhNQ
         TeXw==
X-Forwarded-Encrypted: i=1; AJvYcCVzTi5rJYRnD+ciRIc+bfE5k7PC52BX7jkh3g52Pi/MukXvqMJKmrLvtRn4jkQGETLmCJCUYNlFOS7pwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynpHHVgGWYyvDdM3QEmgjWsyqZxDtOhfGwmO0whoFq8Y6J+tSk
	7d/TPIxuqcUhCqZ0kY1Lj/IWYuKXQ2AFKPXE0xjjHD2kMr01FTQ+ohCopXEdbqxuRMxtRnGaiAr
	40MGUBw==
X-Google-Smtp-Source: AGHT+IEudAc+RtrsthgQd29i5TzWwClBzh0orawUsXJ6SsndAr08K8DVgHn3KuIiiMIFAwisOcz2YNtd49Q=
X-Received: from pjqx1.prod.google.com ([2002:a17:90a:b001:b0:33b:5907:81cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d92:b0:340:b572:3b7d
 with SMTP id 98e67ed59e1d1-349a25fb840mr628818a91.19.1764980265902; Fri, 05
 Dec 2025 16:17:45 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:46 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-11-seanjc@google.com>
Subject: [PATCH v6 10/44] perf/x86/core: Do not set bit width for unavailable counters
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
X-CRM114-CacheID: sfid-20251205_161747_176540_D9334546 
X-CRM114-Status: GOOD (  11.24  )
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

From: Sandipan Das <sandipan.das@amd.com>

Not all x86 processors have fixed counters. It may also be the case that
a processor has only fixed counters and no general-purpose counters. Set
the bit widths corresponding to each counter type only if such counters
are available.

Fixes: b3d9468a8bd2 ("perf, x86: Expose perf capability to other modules")
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index abe6a129a87f..bd9abe298469 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3132,8 +3132,8 @@ void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
 	cap->version		= x86_pmu.version;
 	cap->num_counters_gp	= x86_pmu_num_counters(NULL);
 	cap->num_counters_fixed	= x86_pmu_num_counters_fixed(NULL);
-	cap->bit_width_gp	= x86_pmu.cntval_bits;
-	cap->bit_width_fixed	= x86_pmu.cntval_bits;
+	cap->bit_width_gp	= cap->num_counters_gp ? x86_pmu.cntval_bits : 0;
+	cap->bit_width_fixed	= cap->num_counters_fixed ? x86_pmu.cntval_bits : 0;
 	cap->events_mask	= (unsigned int)x86_pmu.events_maskl;
 	cap->events_mask_len	= x86_pmu.events_mask_len;
 	cap->pebs_ept		= x86_pmu.pebs_ept;
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
