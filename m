Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D53C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJjds4yxYpquKypc21gQQKS5hIDU50/rA043WkBJbk0=; b=lRhe4kmp8akCi9
	6tyytIfFs4YCgk+sh+OxayfZ02asLSM+Dq3Qm2h/sn0nFe3sXSy9KY1c6II2DTpmHXcBCeHgENuB0
	i4c19p0+hNlHQowdJaBwT5Mk57BtV8/z+RcQWrWWqj2LinEurxc+zgT+OS6ZdMRzYHYGqMq0brzTi
	bUtcNIiZRYJJD6J5VQ7ZZnD7t4tzEkWws4JNd+x9NSinKcReC5FJU7MgheEPtAA2PqomQmbHqETq7
	Y5+I6wD/yme3T36cj9Xn9xwthyP0FAacDXGSDKBdCAEiQ49FcN35pqQjGTuPQwIPhbJ7zyaKL6ZY2
	BMex3hwlp+gxM+lUkXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEGL-00BtGK-40; Fri, 04 Mar 2022 20:10:53 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEGD-00Bt94-1m
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:10:46 +0000
Received: by mail-qt1-x82b.google.com with SMTP id e2so8346171qte.12
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 12:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=La2sWt3lJ51N8aiXaLxTZ81rzxffeRmbKmdg2xjj9EM=;
 b=llfQGxUrGrIoejHojVcb0Y3KUScFEeqhQN64bg0W4G16w2e2xy20xTh4VNEgip99So
 7EIAnl+l6HMTK+Y1H2tYXX0B0OANzxweW3TS6UmqFdhSes5f/e8/muPvXtpilTy1Rl/Q
 MCtur+l2VFqXJM3gqXE0SmrsJqMVydFtm0mH8+Fqn4YEFDSSuwa3n5LubdlQRqcop1X7
 tLDTiG7PokjlHkftXZrmY/k420PmVZKPhGp32eo3k4QrC/G3XmzH3l6HB2PMpG+2WFQL
 JZIwTm9my8jlHWQiiVx4InmFOJMfvlxtaRbhDWCMF7nO2chX8XlnOlmlEf5nQOaQXQfS
 7HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=La2sWt3lJ51N8aiXaLxTZ81rzxffeRmbKmdg2xjj9EM=;
 b=pnMVDPBE0FhXlhqpStVjysgynQikaEa+YN1jfhdFtt4M6vJj4ArTsHoLAb2WRvpc3c
 Jef23Uox6VTXv5wp04y/g5SExPuTm2sREQwaZtAihdi6oOIYjMWVEFdYuvJOoH7hzQA8
 VQpBGCPAEIJNcCRNEewXtOMkq+BJi3IK/oS1hce8eClXwmL0tHQxSkVpdHPVkbdGffqH
 6diJgzKjQsqYSrrESrbENqlAeeagfzKKJsT36/kI62VPJfJilgWZ5IBUz4wZiQIKSyDt
 /L83JpoWTH4O42GYNDvRx6UYDtKjcU2JuN/CQBa891EUiTHR9ryneb/nvX/kePK8ZCmH
 bg2g==
X-Gm-Message-State: AOAM532bfZMjH+luj9nQrFgBigo5VO/x+Fll2lfkatTz/QsBwmaeKuUo
 Hh5nR6O+Wxt30zNAeXigAZqj5A==
X-Google-Smtp-Source: ABdhPJySb8vTeaMNOaVqmNeyuKGat3EV0t1E2R+ui2Q6dQN1/Nz3MPMm95v3MmBjR1PmrcRFvR5rTA==
X-Received: by 2002:ac8:7ed2:0:b0:2de:6f9b:5c3a with SMTP id
 x18-20020ac87ed2000000b002de6f9b5c3amr388493qtj.203.1646424643609; 
 Fri, 04 Mar 2022 12:10:43 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm4605481qtp.1.2022.03.04.12.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:10:43 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 3/7] RISC-V: Prefer sstc extension if available
Date: Fri,  4 Mar 2022 12:10:16 -0800
Message-Id: <20220304201020.810380-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304201020.810380-1-atishp@rivosinc.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_121045_123434_58CA9DF6 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V ISA has sstc extension which allows updating the next clock event
via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
if sstc extension is available. Otherwise, it will fallback to SBI call
to maintain backward compatibility.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/clocksource/timer-riscv.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..d9398ae84a20 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -23,11 +23,24 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
+static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
+	uint64_t next_tval = get_cycles64() + delta;
+
 	csr_set(CSR_IE, IE_TIE);
-	sbi_set_timer(get_cycles64() + delta);
+	if (static_branch_likely(&riscv_sstc_available)) {
+#if __riscv_xlen == 32
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMPH, next_tval >> 32);
+#else
+		csr_write(CSR_STIMECMP, next_tval);
+#endif
+	} else
+		sbi_set_timer(next_tval);
+
 	return 0;
 }
 
@@ -165,6 +178,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (error)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
+
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
+		static_branch_enable(&riscv_sstc_available);
+	}
+
 	return error;
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
