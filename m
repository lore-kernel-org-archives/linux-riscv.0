Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3419BC3ABB6
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uj+JxnpZuq2VCLnhBDdVKYbPIbvJ2/3lRf2kB+flaM=; b=Ct9qsG26kMqLyT
	3lJjPAhzuy7ltSAuNirXjQzfLG+t76FlKI/9pRdpaDYUyB6VHtIWBo07JGODOuVp0FWVMLl3NPyB/
	DdNQYN9YG0AUvFQOiW6ynDHTSTs9X98+9+xLp+AyPSNs6fYO4D0S4cJLCNvMeEBO/dstThCMONPmm
	fAcGRo1PondtPHD8WLbnTm7QmIWfP+pskDxfmFuSSZqCveGDW0ziifpuU+ZVV7Cuy6VgwreIpcYjb
	tRWFVzW29JOmIrbx8bgkT4ZyEfdhFDIAUSYivMKZpjKx0qPy4N9KHy/Q+C3pdLB2iJVKO+VmNhT82
	vV33d1z0n9GsfulFuU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yw-00000008dp9-3siX;
	Mon, 05 May 2025 21:41:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XG-00000008dJo-0N99
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e3b069f23so781795ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481177; x=1747085977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuR/z1GpxuJ9rGb2JSweVgvKX4SVj6nkkUnTCjHYUz4=;
        b=dTjUzo8oiruXvVTrLg0sCkBW3vjEu/oFcnoS8GM3VmFJhAudIy6IBN+LXl7IeIuhzl
         gSaLn+kkpkRqBVE4agzIs7wwZjZyR27arJg4u7s4m2er8TtZDUuKC81IuHfQAMRM341l
         GUjC6tj1BFetdmkHt49MVI5cuigWpUkuCxKS9AksLifypmN0HhbN6iPFqOR/uvnjAHP8
         T/QhCVE3YokXm91sGWWUfHTqxE2dHHgED13bGn6ebUSoBmPeMxR271QU4k0rjWtaY9Vl
         iE/h/eLNQINyF3mzGOSevu/AW5UTSkWjpYdrYYIrJF03kqsZpuUrSw0F2fV1POEWVDVb
         z0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481177; x=1747085977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuR/z1GpxuJ9rGb2JSweVgvKX4SVj6nkkUnTCjHYUz4=;
        b=ghb8e5ZsNyRJA/Ox1kO4+er+cwE0Gy413B4qKXtyrHxnbQuoVHKXle6lWW9xZhonjY
         9SC2tSg5TLaiFxV0u2KB7+FcctISAW7R3iQXlHPxBhAPfHbf0RmzvxUN6Sj9MGiOW61C
         dxcVcX2Irk+F4QdHbN606os04x1bOlwUoAyvomORbRza+0HytGjltV2L5vJ9/qjKytpV
         Zi91P4k8CsEUF5TJRv0Sd6e5IIQf4o7Pf6M1q8YRVeiWh5enoK0A+SJEmL6SsOhzQAHe
         7t2jVt6KI9c2EscuNLy058fC1UytGhanuywlXcFxkrHk7Qqemw9hLgcyIZyYHNXNzly3
         udIw==
X-Forwarded-Encrypted: i=1; AJvYcCUQWXf/toRLzTmLgkZp6Duuz39+Qzfch9JDsfiRSSGhGh4Pvjsh+f2J9p/RcHEfz7S8PwtBKBp80hfikA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDsN3dcDjltgCNKRF/dsgSLxl1vp48FBf4EkQwbHELeCGrDL+n
	HNk5NlWRL8RkXojCrsvCaH9EIYK+d+osZTafeYlb9iYd5/pLM3STeolPoZwzk1Q=
X-Gm-Gg: ASbGncshbC+fMgYV63fQuYPPvzPiQpjw0BZb/0D15TttWCKW/O3T3tIU0SZ380ED5t1
	0jsOxO/HIrXf2TupHm/sMwofQ61sPEAup5AJl1RU/e93nvxUNKmOuMlqvX+uM/RKA+xXZHSl3sy
	D2QVs8z4O9rAlP3jMw+jrdu+cki/nvj7EDPTj2mLd+4dP0e2CvOdMjM3kUJ8WoddunNMX0Vs0uV
	0MficGBt4nONXQtnihuUDpDF+WM2LUu0XSOYY20aGGjoz+lwGQVKSW9NO+yhI2KpErCBWaGkzku
	hZnrnV6SfDz6KJnMv86o5JSB/Nh62i+sWrtRwC2Ftj0Bu0QD9yeepA==
X-Google-Smtp-Source: AGHT+IGhry+0GqEK0QENhdqzpXsxfdR/JgSEWuVPvlQK1RPcseXdT65lptZT2IHTz8U/93rQIvZwKw==
X-Received: by 2002:a17:903:41cb:b0:220:e1e6:4472 with SMTP id d9443c01a7336-22e328cf92emr13304615ad.13.1746481177225;
        Mon, 05 May 2025 14:39:37 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:26 -0700
Subject: [PATCH 1/5] RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
MIME-Version: 1.0
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-1-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_143938_136615_04D2D32C 
X-CRM114-Status: GOOD (  15.34  )
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

Currently, we enable the smstateen bit at vcpu configure time by
only checking the presence of required ISA extensions.

These bits are not required to be enabled if the guest never uses
the corresponding architectural state. Enable the smstaeen bits
at runtime lazily upon first access.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_aia.h |  1 +
 arch/riscv/kvm/aia.c             | 43 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/aia_imsic.c       |  8 ++++++++
 3 files changed, 52 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 1f37b600ca47..760a1aef09f7 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -112,6 +112,7 @@ int kvm_riscv_aia_aplic_has_attr(struct kvm *kvm, unsigned long type);
 int kvm_riscv_aia_aplic_inject(struct kvm *kvm, u32 source, bool level);
 int kvm_riscv_aia_aplic_init(struct kvm *kvm);
 void kvm_riscv_aia_aplic_cleanup(struct kvm *kvm);
+bool kvm_riscv_aia_imsic_state_hw_backed(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_32BIT
 void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 19afd1f23537..1e0d2217ade7 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -241,6 +241,8 @@ int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 				 unsigned long new_val,
 				 unsigned long wr_mask)
 {
+	bool vsfile_present = kvm_riscv_aia_imsic_state_hw_backed(vcpu);
+
 	/* If AIA not available then redirect trap */
 	if (!kvm_riscv_aia_available())
 		return KVM_INSN_ILLEGAL_TRAP;
@@ -249,6 +251,26 @@ int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 	if (!kvm_riscv_aia_initialized(vcpu->kvm))
 		return KVM_INSN_EXIT_TO_USER_SPACE;
 
+	/* Continue if smstaeen is not present */
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		goto skip_hstateen;
+
+	/* Enable the bit in hstateen0 lazily upon first access */
+	if (!(vcpu->arch.cfg.hstateen0 & SMSTATEEN0_AIA_IMSIC)) {
+		vcpu->arch.cfg.hstateen0 |= SMSTATEEN0_AIA_IMSIC;
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_set(CSR_HSTATEEN0H, SMSTATEEN0_AIA_IMSIC >> 32);
+		else
+			csr_set(CSR_HSTATEEN0, SMSTATEEN0_AIA_IMSIC);
+		if (vsfile_present)
+			return KVM_INSN_CONTINUE_SAME_SEPC;
+	} else if (vsfile_present) {
+		pr_err("Unexpected trap for CSR [%x] with hstateen0 enabled and valid vsfile\n",
+		       csr_num);
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	}
+
+skip_hstateen:
 	return kvm_riscv_vcpu_aia_imsic_rmw(vcpu, KVM_RISCV_AIA_IMSIC_TOPEI,
 					    val, new_val, wr_mask);
 }
@@ -400,11 +422,32 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 				unsigned long wr_mask)
 {
 	unsigned int isel;
+	bool vsfile_present = kvm_riscv_aia_imsic_state_hw_backed(vcpu);
 
 	/* If AIA not available then redirect trap */
 	if (!kvm_riscv_aia_available())
 		return KVM_INSN_ILLEGAL_TRAP;
 
+	/* Continue if smstaeen is not present */
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		goto skip_hstateen;
+
+	/* Enable the bit in hstateen0 lazily upon first access */
+	if (!(vcpu->arch.cfg.hstateen0 & SMSTATEEN0_AIA_ISEL)) {
+		vcpu->arch.cfg.hstateen0 |= SMSTATEEN0_AIA_ISEL;
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_set(CSR_HSTATEEN0H, SMSTATEEN0_AIA_ISEL >> 32);
+		else
+			csr_set(CSR_HSTATEEN0, SMSTATEEN0_AIA_ISEL);
+		if (vsfile_present)
+			return KVM_INSN_CONTINUE_SAME_SEPC;
+	} else if (vsfile_present) {
+		pr_err("Unexpected trap for CSR [%x] with hstateen0 enabled and valid vsfile\n",
+		       csr_num);
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	}
+
+skip_hstateen:
 	/* First try to emulate in kernel space */
 	isel = ncsr_read(CSR_VSISELECT) & ISELECT_MASK;
 	if (isel >= ISELECT_IPRIO0 && isel <= ISELECT_IPRIO15)
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 29ef9c2133a9..d8e6f14850c0 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -361,6 +361,14 @@ static int imsic_mrif_rmw(struct imsic_mrif *mrif, u32 nr_eix,
 	return 0;
 }
 
+bool kvm_riscv_aia_imsic_state_hw_backed(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
+	struct imsic *imsic = vaia->imsic_state;
+
+	return imsic && imsic->vsfile_cpu >= 0;
+}
+
 struct imsic_vsfile_read_data {
 	int hgei;
 	u32 nr_eix;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
