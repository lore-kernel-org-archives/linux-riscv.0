Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDA2C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJLs8tlgfxAC+d5G1YPzQYfthB9UsXHRanu7nshiKDI=; b=HPU2EFEmZAZEhe
	aLlvw49uCeydUlVNq+WSihW+JYiy+KGN9ah7ZF2kgXwgOtcMhWu0sDz6k9fOhTS5jxXw9XRVse0Js
	dqFKb5F9Upxz+epxf5r5A1vmg1Ikbkl0jVy2YCdtinr6vWq6Kv/exLnjtj4zV2lbGf3bZ/Aubo9p+
	Xckx4TJIQyOEmO8/R4C2CKUgzAm6Tdj0DinLXouMgYMiP2TsWMO9XqWtLdxekL7Rvq6apf2+jjBJr
	oqEyR+6XNmlkEkuoWGDMkwxuo+Hdq+a+G6u9OHw3UeAZg4UNXCsMhcteq6b5Hzzi6pba+IC3aqEdz
	GmyZZeKB8gs89DlGE+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbt-00ARZo-5I; Thu, 15 Dec 2022 17:01:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbg-00ARQd-KH
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so3356653pjj.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe+UropDcs41uZsJl5UoQsMteKaso09Ma6XjETIRZjA=;
        b=pv5pECr+7yhCoGDeSuvAT6ApQZ4t2eT4MBkXtO3ghYvONHQbcMSuQGcD9oGpIsBLnY
         /xLSkLLvxmyncb6xOOfdWjHyOw/ArLKeJf/3mj4P6+7Bmr4tkGvqunp9WMoatiCBSwD7
         hND+BjAF9VNuICeGf4XADiRiWjW71fp1xI/2HaFUI174oykQvLOPa1/Ny/anECFnDjB5
         7HzLQhqbjKh0RSmKFzwZRjmBSXmLk4JKeO5oXCoP50lXYLrIu2fOkOlWaspGWkaDYpGk
         3GpeYxJjVG0fGpyj4ohFiMTZpw/FCZy/Hqm++CmBZ36Zz+0jR4sUxHU15x5dHYBOEEOP
         L1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oe+UropDcs41uZsJl5UoQsMteKaso09Ma6XjETIRZjA=;
        b=dLlHmDfql4goClmE9FWbOytqzRHBAVWyRvAhXUw5uRiRVR1k+w8V+WW/6UBI5sgoUH
         pcym025ZpB5vNwhSmXQNRf8j1HT9KY/3w6W7ujk/PjHKeK0gKJwggfRTE70JOJBQv5JK
         7VbwR6bhpyfLXV4V3d+BTIDAYTIYfRwd7HNbiIWGD9g06okJOS/XJJSRc47zb36PcDKL
         BGGiAXukLACbz4YPgwyFjEjsi+c+uOb5SzIXR8hHFEDn0G/KY9EMRv9k9UWCQYwV5sS3
         uDXELFLKHtmDn0Br6CRuyBWAe5018T8BZTG2Oy5Xq9/SMc70tE2qdLrEIUaJ5OJF1fNT
         1a1A==
X-Gm-Message-State: ANoB5pn4/dFIHOc4juMpYjLEKOX3TA7ORgldizdymYtCGURiThCmDZvr
	ExievPrtYqQcknhEYW+ip/2okA==
X-Google-Smtp-Source: AA0mqf7rpf1DYdCy6MEJCPXmVFu1iVBoY4PGgeIxOVYoUigt1rdcD6Iks5r7UqhKDjTl7/0JeAcqkg==
X-Received: by 2002:a17:902:7044:b0:186:ada3:c1a0 with SMTP id h4-20020a170902704400b00186ada3c1a0mr27971825plt.45.1671123675053;
        Thu, 15 Dec 2022 09:01:15 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:14 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 02/11] RISC-V: KVM: Define a probe function for SBI extension data structures
Date: Thu, 15 Dec 2022 09:00:37 -0800
Message-Id: <20221215170046.2010255-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090116_765329_F534F9B6 
X-CRM114-Status: GOOD (  14.74  )
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

Currently the probe function just checks if an SBI extension is
registered or not. However, the extension may not want to advertise
itself depending on some other condition.
An additional extension specific probe function will allow
extensions to decide if they want to be advertised to the caller or
not. Any extension that does not require additional dependency checks
can avoid implementing this function.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
 arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index f79478a..61dac1b 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
 	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
 		       bool *exit);
+
+	/* Extension specific probe function */
+	unsigned long (*probe)(struct kvm_vcpu *vcpu, unsigned long extid);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 5d65c63..89e2415 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
@@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 */
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
 			*exit = true;
-		} else
-			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+		} else {
+			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
+			if (sbi_ext) {
+				if (sbi_ext->probe)
+					*out_val = sbi_ext->probe(vcpu, cp->a0);
+				else
+					*out_val = 1;
+			} else
+				*out_val = 0;
+		}
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
 		*out_val = vcpu->arch.mvendorid;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
