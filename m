Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2859CC5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IV2WnP3TUyJaEzva5CwB1wJIoJBy6ut0Qs5lsVIytYk=; b=oMi9GByV0Hm+zC
	mxNMssKAzrLLnXc271sTn1F3kGpBg86opNmjX+M/GGLCP2i7/pYEYC0vwIOmH/owkiXqRvu9RmzZZ
	5nh7heQkzbr+1aEOVvMOjny5zEiFHbKWC+Hn49ygEsDMqoRiF9QROjoJArMSKtqF5CqyaB2tsw6vu
	xnanT1llOFcIrAyy1kvSLjcnGwY6p6ywdKz9yIW8j0GT2N0KmpucL5S7q5tgHSf3UgWiw8HGNv7ln
	QmNZD/JaT+aGwWQPXb4NN90bh+UPCVT9oGeZrJbTTfM4jAIaekydePJryO4ayJSm2YD+rfGMbDQg3
	zlxBxRLQwkVlm5hfd4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sx-0000000Ep2Y-45cr;
	Thu, 05 Jun 2025 06:15:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sr-0000000Eovm-2g01
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so143820a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104125; x=1749708925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9lKrNhC1LriCt2AmMWJPIsLGEeoSE3sCtMNzfw5vMI=;
        b=lbEvLY5r6T6xHbU8gtfgwKRTHBuOh5z01ulER9a0X6YdlzVfHwTYcKwsXWBAsoFneV
         3ff9bNTGAWfTGTTZOwq6g60UXzbLcZFiuug5QtaxIQ31rHCKLPrCLxxBe+98f9z9dLx2
         8AiSyjOXV4q2iqjmiDHM6M8n1cep2x4ABVZYpM0iveCQg+1JBntUXOXn2DcKsYhtcYVz
         UaBFHIo+drsqLlIacb+BYJ0vWRo1XOSj+vGpVzCcsHn37Jpmd/Yf/CPghhUEfeBcOMzA
         pXabMzDrg2KmxWisxGK9Y5LTbRezRq6k1aAfzDuHHgiYR+TJjiYu8rE+3bwBaE1zHzaA
         i5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104125; x=1749708925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9lKrNhC1LriCt2AmMWJPIsLGEeoSE3sCtMNzfw5vMI=;
        b=dnbe9bCOZUbO6Cgs/Sc/37C+lwRFTpEyo5uiAFnhMG+veVt3qceqhSLnBBATkcvzzR
         gyV+9UimuSAeJxYrBl9GsDat/2iSipVNjGI9SA8O++kRNq6ZIisSfYk3ABZaKLNkqlDT
         vqQh6AZGkXc0mR4dxJ7r71FMFG67BJ03fdliFVLtNIWFYUtop1OO0gfuxmHwnLlAl2/x
         dLxHC1T4Wd2ENYkwTPytemDhARql5gpDp+GN9d+qQojLexM25a4Ad5j2z9b2CQ1JI7NA
         kxrX8mMJ5NZYP23iZ4eslf58+gvJnb0ahLBNuHCJVgbJ/Y2t2WQLIk3SuqqNPfxtD5yb
         WKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW16o9OFaoDti96S0gEcXlIh1yEqkUbcJU7P/xILnEoCWNGLF3XMUv/IVc8hOX49t6KS4Gea+/s3yGiqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBS12F+axcEIJQylqiD7UQgRfNRxepoTXmdwQ5UCLA44rdotUl
	81BDCGPZCyqhHy3F13AyRt98PzSUx4yu/PTMCnomR/+Cm7GWME20/vuGG1Y4/KP/Q/E=
X-Gm-Gg: ASbGncujQMUFoQz4cgDDeMFypYXMTxHaeaiyvNVRFs+250j8rxubo+t6z4VVRGsx4YR
	Oi8eHMMuKEIog9RQKH2q41Xde7QVnHNPS4TkFp6uOXbbKK3osL9/nTiyoCPn03lv4Wo0MToToQj
	kY+ZqsFvARAhnhYbLpljx93XtGhj5aCDQ/DAXhkOHSOn7sYeBV2XMr7vEEKfNfmSEXaXw/bmSF/
	LXXltMJnhnw6YNbwJAKJ3DqIj9tms9Rsx3t5ZlcpZoWCb4ivc2+GEhiGqpkxey7t3M4OJEfoAxf
	Gy5+XpsKRk/gCLtgH6z4cIW8V4DybBLKbZJXPm0gfVUwrB9+C3CYXVBMvC2coCsbRZjmigpJREy
	SIkrcgbGBs2A6KVcU
X-Google-Smtp-Source: AGHT+IE/5a5zgQx+kk8SDVCqYIhLKXbR1w/+yPtxXvmHoTXBZp+TCtx5+O8hPK0X2ObUlWcFQP661w==
X-Received: by 2002:a17:90b:1d84:b0:312:1508:fb4d with SMTP id 98e67ed59e1d1-3130ce9fecfmr9750546a91.33.1749104124548;
        Wed, 04 Jun 2025 23:15:24 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 05/13] RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
Date: Thu,  5 Jun 2025 11:44:50 +0530
Message-ID: <20250605061458.196003-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231525_694099_F65F8745 
X-CRM114-Status: GOOD (  13.07  )
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

The kvm_riscv_local_tlb_sanitize() deals with sanitizing current
VMID related TLB mappings when a VCPU is moved from one host CPU
to another.

Let's move kvm_riscv_local_tlb_sanitize() to VMID management
sources and rename it to kvm_riscv_gstage_vmid_sanitize().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 +--
 arch/riscv/kvm/tlb.c              | 23 -----------------------
 arch/riscv/kvm/vcpu.c             |  4 ++--
 arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4c..134adc30af52 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -327,8 +327,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
@@ -376,6 +374,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
 
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 2f91ea5f8493..b3461bfd9756 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -156,29 +156,6 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 	csr_write(CSR_HGATP, hgatp);
 }
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
-{
-	unsigned long vmid;
-
-	if (!kvm_riscv_gstage_vmid_bits() ||
-	    vcpu->arch.last_exit_cpu == vcpu->cpu)
-		return;
-
-	/*
-	 * On RISC-V platforms with hardware VMID support, we share same
-	 * VMID for all VCPUs of a particular Guest/VM. This means we might
-	 * have stale G-stage TLB entries on the current Host CPU due to
-	 * some other VCPU of the same Guest which ran previously on the
-	 * current Host CPU.
-	 *
-	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
-	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
-	 */
-
-	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
-	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
-}
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 {
 	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f98a1894d55b..cc7d00bcf345 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -961,12 +961,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		}
 
 		/*
-		 * Cleanup stale TLB enteries
+		 * Sanitize VMID mappings cached (TLB) on current CPU
 		 *
 		 * Note: This should be done after G-stage VMID has been
 		 * updated using kvm_riscv_gstage_vmid_ver_changed()
 		 */
-		kvm_riscv_local_tlb_sanitize(vcpu);
+		kvm_riscv_gstage_vmid_sanitize(vcpu);
 
 		trace_kvm_entry(vcpu);
 
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index ddc98714ce8e..92c01255f86f 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -122,3 +122,26 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	kvm_for_each_vcpu(i, v, vcpu->kvm)
 		kvm_make_request(KVM_REQ_UPDATE_HGATP, v);
 }
+
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu)
+{
+	unsigned long vmid;
+
+	if (!kvm_riscv_gstage_vmid_bits() ||
+	    vcpu->arch.last_exit_cpu == vcpu->cpu)
+		return;
+
+	/*
+	 * On RISC-V platforms with hardware VMID support, we share same
+	 * VMID for all VCPUs of a particular Guest/VM. This means we might
+	 * have stale G-stage TLB entries on the current Host CPU due to
+	 * some other VCPU of the same Guest which ran previously on the
+	 * current Host CPU.
+	 *
+	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
+	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
+	 */
+
+	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
+	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
