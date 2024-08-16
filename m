Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC24EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5QwJFfWIoD9EBJZAUiWJfIxYC82ndXMKwJzvoQJkTA=; b=tB3qH4mCL5uPVB
	GrNIVEp8h4kXhiMjxmL/Eh2iy4k8U7GQcPbIblwKyKzGB0Oq91+mewOqGsQl1StNxNO3B/E6sGYf1
	JTvL3qdas7419TiITTaJLf3C8BcuVGEs760F+3/2UxYyGGNnbFnbkI7IpX2LL+ibh4oJXOIJkmg6U
	YrFAy9uRfilaVcOhNTxJY31lEJ/gCU9alMZjC/gnwrbOCoO6odoU90v8Z84xlbnp7Mpqm63jiF/qy
	grgLElP0t+jIul8/8wPS96Ah6C5vhrC8mwhzBxexyTMHrhwjxkx7O9HgaQQso/HX56rIbt0sFtTbK
	vRZb4/E9w4k6cHVfrcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ser5I-0000000C2Ol-3RYT;
	Fri, 16 Aug 2024 07:09:16 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ser4n-0000000C2Dw-3W2I
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 07:08:51 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3db19caec60so1085892b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 00:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723792124; x=1724396924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gK7gcmoudAbCqj7iaqTuRq1w3RESYnAkJX7cowgaEr4=;
        b=j+nGyqC2gkxZczgW60exp99WqpCJvJvV6S2p1kxXVXx0iKK8voJzyKcJII8dDzWp5V
         vMIqC4iwdkkQNKU+43mzo2KatwFWAHt9w24lAAP5MrHXAaiv7+6usjIJknQRJsRVvaEi
         Vl5NOVa4+tfwPGj0meFgNqhMx8v1jtqDOQfNCLNPdcg7pmngBJwa6BltLKhi0Rpdazht
         G8v+yDdMlhPSLBIc273ixc5AcMdlbn1HuoyDsb2yvCi65Z+D6/eaOlmCa6PjAgXLBjUP
         uHMItpBt+GS6YkvO51R8IqW0KLZCWmzUB8oUVNOBJxCoFJIjjK//742OrKmuCArTmD4I
         kI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723792124; x=1724396924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK7gcmoudAbCqj7iaqTuRq1w3RESYnAkJX7cowgaEr4=;
        b=jdC5zf8bvdsyNefeAV9I443ZBulaSiSQMLCE8tixC/X6if5VBL1aeBH5/6YldhJdsl
         r0gISILKxRtKjf0ms9CXB3OPFnpawnNKJyWfaQEQlvJT5fQIzI7j6ioa6/+fO07gCNcs
         C1Oi8KammAnith/byDoIUZ+wK4t9IL714D1qdXXqXIYuTZhqzSPyEiXqiR0/76AAsMHs
         6RQvAscb46ipuajKcDvtbHa43WXWWMH+2nL1EOMwykhGo2letaepSBNt08hHHlGWzose
         A3/rJYC6sO3nKkgofyEOgzAarpfkShfmciFoUmM6PRFXFgcvl6bQraE2iDjtDpTV1c2U
         05hQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4Vl4bobNlueBANp8eIpaw6qhHP/teJ0PphWRj6Qo2wDP24nZj12CVnpCYswRuQIpZactI/jo+kJ0UwP9XAP94Xc3ZvJdBrTPgdanDk2kb
X-Gm-Message-State: AOJu0YwGT8ldudepaRWgYCJChBl4Su7eFfaYuyMgvj3nRx1JW5liSIp+
	DrhJkOGMtiI/RuVZmSO9dDLSqS0ASVTBU2HS5nykWjBcIjeDNGkI0f7o0rGsAJM=
X-Google-Smtp-Source: AGHT+IE+/4hnr8pi/hB7OE22f8NAJk7FUg2stklMrqV9hhE+HQc45Z6KkT09rm4aZzQByvzCn2SBnA==
X-Received: by 2002:a05:6808:3008:b0:3d9:30a2:f8fc with SMTP id 5614622812f47-3dd3ad525b6mr2167419b6e.20.1723792124349;
        Fri, 16 Aug 2024 00:08:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b636bcabsm2293792a12.90.2024.08.16.00.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:08:43 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Aug 2024 00:08:08 -0700
Subject: [PATCH 1/2] RISC-V: KVM: Allow legacy PMU access from guest
MIME-Version: 1.0
Message-Id: <20240816-kvm_pmu_fixes-v1-1-cdfce386dd93@rivosinc.com>
References: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
In-Reply-To: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_000845_927580_A2C98C77 
X-CRM114-Status: GOOD (  13.52  )
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

Currently, KVM traps & emulates PMU counter access only if SBI PMU
is available as the guest can only configure/read PMU counters via
SBI only. However, if SBI PMU is not enabled in the host, the
guest will fallback to the legacy PMU which will try to access
cycle/instret and result in an illegal instruction trap which
is not desired.

KVM can allow dummy emulation of cycle/instret only for the guest
if SBI PMU is not enabled in the host. The dummy emulation will
still return zero as we don't to expose the host counter values
from a guest using legacy PMU.

Fixes: a9ac6c37521f ("RISC-V: KVM: Implement trap & emulate for hpmcounters")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index fa0f535bbbf0..c309daa2d75a 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -10,6 +10,7 @@
 #define __KVM_VCPU_RISCV_PMU_H
 
 #include <linux/perf/riscv_pmu.h>
+#include <asm/kvm_vcpu_insn.h>
 #include <asm/sbi.h>
 
 #ifdef CONFIG_RISCV_PMU_SBI
@@ -104,8 +105,20 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 struct kvm_pmu {
 };
 
+static inline int kvm_riscv_vcpu_pmu_read_legacy(struct kvm_vcpu *vcpu, unsigned int csr_num,
+						 unsigned long *val, unsigned long new_val,
+						 unsigned long wr_mask)
+{
+	if (csr_num == CSR_CYCLE || csr_num == CSR_INSTRET) {
+		*val = 0;
+		return KVM_INSN_CONTINUE_NEXT_SEPC;
+	} else {
+		return KVM_INSN_ILLEGAL_TRAP;
+	}
+}
+
 #define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
-{.base = 0,	.count = 0,	.func = NULL },
+{.base = CSR_CYCLE,	.count = 3,	.func = kvm_riscv_vcpu_pmu_read_legacy },
 
 static inline void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu) {}
 static inline int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
