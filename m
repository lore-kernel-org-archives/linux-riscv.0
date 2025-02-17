Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54390C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7N7LNRleh3g6HmsYbcy1LUDHv1/mhmbBqIYSW/cBeo=; b=MOTbemeWbyLtS7
	qExnO0Y7BaHTC/y4Iifs/Aua8q+1Fo5vu6bPj7GlD6EUgCoWVglmzafvfXOomCAU0C6YjdJexxTdh
	n8rSFkf2eYIFeHh8ZcgakuOfXR97FmZLCsZaPCd9sab2puBgpQhQZpxDC9BpufhbzJP/fyOXTY7Mt
	BS9ryOdVuaSJCTHQHrk6QqI66uiXOyohhpFb5rgQh+VVHSb/7SphxTiN0xvIppWMnSOQkArXWg3+9
	xRepyyg36cLtFvtAXsboUJN6QRS9z34pqjk2M3FKA2XobZoa2B1K57z3uQw7TYJmqEZxzRVT/QbG1
	zk7bGma+gQcj7DwygqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwke-00000003nRZ-3IRY;
	Mon, 17 Feb 2025 08:45:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwka-00000003nMG-1wGe
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-439714a799aso15413575e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781911; x=1740386711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiPZGt3cqKuKVygJ0gOXQMkedPlfCXA7o5CUpSUfKvM=;
        b=XzoLg4FQSBNwx7LBE88Q4CyVGGv0o2mzpuIxD51yz6z/dcL1QvWY908gjTA83esEvt
         2IMKWFm/kxTTqUG3RbC4SH6276Kj2vsA87xfNzP2FO0pkveTYdVolGoXCMYo452RmtSg
         z4ApoNg3LbfPc8bcH9g6MGUCeOPguLrXq5r5Wz7Qmw6bB0xA3WYGT9XCY07coXn8KuFa
         d5AU4VqTt6cMZkNRsO6Ar/UR4f7MEM+ZID0KozR5Lz3AXBnoBJ59GRjWLp0GqBIH5Oc+
         5AiaJdbaO5NBhyvtYL+iHUlFYfGP9b4pMs5jeoykI3baKOTbG89z/3nsuu022AIc9IBb
         3BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781911; x=1740386711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiPZGt3cqKuKVygJ0gOXQMkedPlfCXA7o5CUpSUfKvM=;
        b=meFcciRjdZ7SM1dry12I3b+61t6tPANlw6/bfXLxPiQUYgkCy0LDmUXqGVxJH1YshW
         /TyuWLkGNF0x+G58S7mYtaRADiQm7Pfqh1LSjax9DeqWkBI4XGpMJZiE1c6Uai3fmyg+
         Wir8jkvExUxhiGjI9rwBcU9hoPuyCS1qbDo1fW97sNWbQ7XgrWHF+uSHZULA961h+bmG
         jmSoihdVye2R759Z0ARcr/Nqga7xf5VmDVnbfjs8L168LxIFPQLfsc+bWl6ICqp/torK
         u9HrE7FtBGiD1WFTfCUG4Sl0PP00DIkSBx2ATibA5bnOcPgDv+rCR12sXytcy97Sb8yE
         rHCw==
X-Forwarded-Encrypted: i=1; AJvYcCUXz+boMpjt9BKTBoHMFbrCHAgiRAUK4praq2MUDJN+buvg61fgItLGcOZbygRaVLYYobgh98Pz/gi12w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUNU9+ZUycuwQgAeKk87yF+8MCmcTbLeQt8HmJR2G5gSBjJmRt
	OYwX0fgN2/hvSOqtXZSCPcTLc0IPhxDBtZvWllu9EUl2RsUERCwWybLAd7wlDwk=
X-Gm-Gg: ASbGncsnMqRPApjeH1D7Bz5z5u2Yka+VibTZ7kPe1yvtoBrauJ3LrzJqIza8xK96T8c
	F3/4xa2dMdoyqCdhxIBfi4agcKoar8ketpFGDb/spQiZgcj6X60cU/iJiwnzpk0APFQQ78FufGN
	qW3OCX6XAMiCKrI3cUTzG63sw3GzkgU2L54ecZEG7nM7JJ98b44h/Xw75Qdpwx60SWbzsa1zuEP
	465CIBLTVmcsndNJQRlcAR75vh8s7lsZ+pO2k2B60XA8EYbKkawlYHhykOG+ybX4MmyE8KnpXzi
	/s8=
X-Google-Smtp-Source: AGHT+IE+AUAR1iy2Ln8DmzcEm5nnGqOi/Plq/QkgSq3ISWZGeoiGgqYDSZCBPokxQUbiUvFLMTErfQ==
X-Received: by 2002:a05:600c:1c24:b0:439:6304:e28a with SMTP id 5b1f17b1804b1-4396e5b56e7mr95001465e9.0.1739781910716;
        Mon, 17 Feb 2025 00:45:10 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439858741e9sm14517775e9.1.2025.02.17.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:10 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 2/5] riscv: KVM: Fix hart suspend_type use
Date: Mon, 17 Feb 2025 09:45:09 +0100
Message-ID: <20250217084506.18763-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
References: <20250217084506.18763-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004512_492388_A1C6E8EA 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The spec says suspend_type is 32 bits wide and "In case the data is
defined as 32bit wide, higher privilege software must ensure that it
only uses 32 bit data." Mask off upper bits of suspend_type before
using it.

Fixes: 763c8bed8c05 ("RISC-V: KVM: Implement SBI HSM suspend call")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_hsm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 13a35eb77e8e..3070bb31745d 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -9,6 +9,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
+#include <linux/wordpart.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
 
@@ -109,7 +110,7 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		}
 		return 0;
 	case SBI_EXT_HSM_HART_SUSPEND:
-		switch (cp->a0) {
+		switch (lower_32_bits(cp->a0)) {
 		case SBI_HSM_SUSPEND_RET_DEFAULT:
 			kvm_riscv_vcpu_wfi(vcpu);
 			break;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
