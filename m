Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654B9E7718E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30HPs25huYEiHoIad30ivRy/4ReQ8n9CnIVnl0kvQXw=; b=I9ahE6GnxetD5o
	pyLitpeJtL55Q1eVcC43TtK8Q7bsd90AZTKEFMm1bBH7Dh/uZdxuVKUx0PvL4A9GB+sIA0x9XaDm4
	xQwZL5fbruKkJ7fmKL2ZHotic/vX8VP12rdVF0gfVlDlXSXrlc2be4qJ60mgKQxSHxQqgjdGWYJQ+
	QOa3oxwy1fbJpLcw23NpELL5jfV6ljQbD7NunJNurM+CO0UaYhnqgijwe44xhHI6UopdGRbj3Rt1W
	NxPmkNoUrF6YT7a68L6O7SlS/i9wsLHuVMsjy/bKtNlZTdXyQ69Uf4h6Qa0SpZ+4ciWNIJPfB6PBZ
	RvDFyKBH+tH7jpAO0GEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5Q-0000000CnUJ-1jg1;
	Tue, 24 Dec 2024 21:05:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5M-0000000CnRk-2pXU
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 21:05:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216401de828so55240105ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 13:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735074300; x=1735679100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyrUQMinm9VfIkz//Zqi5azyB73CtB0XBmp3HQwwuxA=;
        b=l2GPhqpAxO1Ju9VS8vhndc7qDLqctOKN6zkdl+eRkWOJzWnSq+GbsOTPFHL4SAuAfG
         UX4QAv8JP0ihfn06Ut76ecQ1zB9I0mzuiNhNCNqUqfzFGD4HDMqff/wzWq5VhbqWZb5O
         AA3enyTIQ/+IKnhXRcSMaNV8yCpB8tEZVba0fZUSCxLFoznveF0VWyrnJr2EaTxS6680
         bVK7iAIk+nKF7InWFs7Bt25tkn8g3cc2G4oCuGITmDxVWfyD8phFVTEX/y3uOosUmhgS
         N33QQxfogWElp4Le2tSN/Pvrmwc2DOqxS45V1N6EtHKPcZN9o8IXkgakyX5snVDR6l63
         +TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735074300; x=1735679100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyrUQMinm9VfIkz//Zqi5azyB73CtB0XBmp3HQwwuxA=;
        b=raLyCcSweGZFJ2e0p1FeataN3UJ4K3CO+RQaCdsv6qSgvwFHTsD5cEUHVDMhTWq8wp
         Tz+xJXSRXSIs+rw7Z4RottlY3dS7y4sT2Q9sBJNPQPYL5JiNdCLwX5lxeoSesA7CHRDy
         f1+jxukS9EOFieDjC5RKWmzXh28b7TI4a6/Xvo29/l9c7HTm15Ri1Ui2634Z0TlZ9XRP
         00U2YyTtLH2EIlHC3PwuXkDNxfBx191g60PuAlreagtm3TN4dhXLASOWGwuOWkllBNki
         0I0M6i1i5WNTgCJUmQJzUK0mt0C7gAPqbPMbZPWdn28aZRpTpAYilzZCeGZvRUQamcDe
         pNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjJhiVKi/o0NOKC2MIPVeQzz/lRTJym4rtlzGyHqnyaZtKBqdqHL/vu47yguLRTcncePYfz68W4btpwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXSNkXPll4sD3HEc/COw9uSEbRxViyNhqiHQRB06xc3kU9uyM7
	9KSOWEhzISiHfEjwdPsROdFtOWxh84v4kTbYoLb5t+RRzeUndnnZ7xR5BYYetOY=
X-Gm-Gg: ASbGncunDuNO4TD+HjEFrqFOTashNS43qkUVLjNA3qtHkftoMHQ0dtl35mpReRyiMTF
	hyTKczBQn/2HXVhVIG8kuI8r9covdW2C4K5Wh0KigPeg4l46YICReGR/34dI1jf3EbUUvBHzlLi
	0Pumj6QodBj/S1GcjIetxhzvvphSQDuKDmBVYhldrF8z/lXaT78F7DAke1siOlJMjozN5KwHw1J
	zZN7SxHrPJBzttGqcaHxiktACdO7Omubmssnsn727xsp5zAuqmuRmsatPv61N8b9Bfd6A==
X-Google-Smtp-Source: AGHT+IFDnCQ0fa4NqS6VnWu4yH1L9kNVbzZkBTsq+P+df9RDRyuUZJOIb8A9T8ylvjy7lFyFnN1bzg==
X-Received: by 2002:a05:6a21:7e8a:b0:1e1:ae9a:6316 with SMTP id adf61e73a8af0-1e606dfe621mr13695856637.35.1735074300205;
        Tue, 24 Dec 2024 13:05:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c344sm10445925b3a.186.2024.12.24.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 13:04:59 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 24 Dec 2024 13:04:54 -0800
Subject: [PATCH v2 2/3] RISC-V: KVM: Update firmware counters for various
 events
MIME-Version: 1.0
Message-Id: <20241224-kvm_guest_stat-v2-2-08a77ac36b02@rivosinc.com>
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_130500_724209_643CB7C7 
X-CRM114-Status: GOOD (  12.48  )
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

SBI PMU specification defines few firmware counters which can be
used by the guests to collect the statstics about various traps
occurred in the host.

Update these counters whenever a corresponding trap is taken

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_exit.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index c9f8b2094554..acdcd619797e 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -165,6 +165,17 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	vcpu->arch.guest_context.sstatus |= SR_SPP;
 }
 
+static inline int vcpu_redirect(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
+{
+	int ret = -EFAULT;
+
+	if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
+		kvm_riscv_vcpu_trap_redirect(vcpu, trap);
+		ret = 1;
+	}
+	return ret;
+}
+
 /*
  * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
  * proper exit to userspace.
@@ -183,15 +194,27 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
 	case EXC_INST_ILLEGAL:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ILLEGAL_INSN);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_LOAD_MISALIGNED:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_LOAD);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_STORE_MISALIGNED:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_STORE);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_LOAD_ACCESS:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_LOAD);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_STORE_ACCESS:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_STORE);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_INST_ACCESS:
-		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
-			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
-			ret = 1;
-		}
+		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_VIRTUAL_INST_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
