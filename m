Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD56D3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTPKU3gB8v2iNRjpX4WugdRJTOZUN1ZGsqOneS1ZFdE=; b=Ra1X2w6HXQws/a
	HWJgS5CpC/MoBiJf0gp0QWm9/D0BzwJAg9VPNFTCxCUu8euBXF1nDlbrIZRAv8Z9tFLaldGojPjrE
	rZfRiegjwpMXKj6vud1Ay98UbWXDsYxWl3dHolpFImM0InOssplqmNhfg6z6V60Q7ID6py/qa0Rwc
	rWZhTNdYOmNxWqy1xQi8uKNtvSEgEq8dx9tQkshBFgyRfuwSrDA1E6cjxZ75WDWgKb4GpZxZn9GHp
	02GGvGyu8yFwvk6FP5N71KvSzZNSAaM3G5mmnWtq8zdhIPhFEo9JcqFLsISoUqVMfAm3ZGJqLE2HE
	OfNTm2vymUfFAipgxHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bup-00000005NLX-2Mo5;
	Sun, 20 Oct 2024 19:48:39 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buI-00000005Mst-1oXb
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:48:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so1792968a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453685; x=1730058485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4C7ZduGC7pkN/JUl6gfB/F71HinWDzomU4MOEbWcFt4=;
        b=Dh6wTKOi7z9OQeQPXG/vA/HvStv2lGnub7kG4clcW+Wdo0IskzGZcCFpSWiDczsfoz
         vD13n7sBTQNUOt9HGoP5Au8lgUr6hnOTq02TH6P6BANGGi15v2QcC2DmrsfcglOfFcvS
         q2YrDFDwt5YzF0e65Q7kRbEXnp7OXQTNg7g9k6w6Hf3TVcGPJWhslXX8ARFyzNNBM9PO
         uDVsadrHCZ6XxJW+6QZJCyhlGC2mOAzWSPrmIEdap1F9fVJ7XYbf/MW80ygqGahzL77j
         XSN2aT+0pdPSZKikR7NvCIRee62S0ZQg0NmNQ6ptA4YhUDeOn+se93OqRkjEXBMCruk5
         59Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453685; x=1730058485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C7ZduGC7pkN/JUl6gfB/F71HinWDzomU4MOEbWcFt4=;
        b=JdUzKsaEN6Ag1byvtGMQL56ao934Ru6QrC3t5cisHTwQNWKBXkPR1MtTrnGF1Zdmx9
         uxJr+K2NTSj/CejfiAtAbMMZgHZEnJSV/iJsT5EU8lL+jTKS+hNng2qcyWqowTyzT7+R
         D+7ueWLrmDa568kdggvE8CM7hU1GYNtbVfLdSpo2bRAKnPgcWYmqNi/JAIhmxM0aw+go
         d0SrIr2jBHGn6iPdl7TYn25dy4YkA+65YJsR4CPg6BnvPWaG06Lsgf7B8jazcVWuVy2f
         Qw1631qLPl+gNTsLSjur3iYcGctyumh+MVQWOXzl1SEM/5c6C9ZNzuyI5Wka4jI8yfrv
         9F0w==
X-Forwarded-Encrypted: i=1; AJvYcCXtXjCElTtwz3eG+iwTFV1w7LMJOkzL3HWfwXhh1O1tcC+mWrbi47TEoJux9/AkjmfTL7dFpuqNFX1Ghw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOI3qkj0U3fk+GKeI59s9I7zAXzkhXs9EgqaAgCDw0N9tF6GWP
	yjZyr3McLrja0QgGKdXrkGF2BfURDZQ4o10K8UvIMvwVXfShXxTeiPrOHZgUwgA=
X-Google-Smtp-Source: AGHT+IG/11qYdtlLvAcC5cZkvAaWerEVivMA/dGwxaUtWguVGnxVgD9ylKyt8Lr3PM/GRQspnVP0aw==
X-Received: by 2002:a17:90a:15c9:b0:2e2:bad3:e393 with SMTP id 98e67ed59e1d1-2e5616de72amr10855206a91.3.1729453685228;
        Sun, 20 Oct 2024 12:48:05 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:48:04 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 11/13] RISC-V: KVM: Use SBI sync SRET call when available
Date: Mon, 21 Oct 2024 01:17:32 +0530
Message-ID: <20241020194734.58686-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124806_720642_32D5321F 
X-CRM114-Status: GOOD (  12.72  )
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

Implement an optimized KVM world-switch using SBI sync SRET call
when SBI nested acceleration extension is available. This improves
KVM world-switch when KVM RISC-V is running as a Guest under some
other hypervisor.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_nacl.h |  6 ++++
 arch/riscv/kvm/vcpu.c             | 48 ++++++++++++++++++++++++++++---
 arch/riscv/kvm/vcpu_switch.S      | 29 +++++++++++++++++++
 3 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_nacl.h b/arch/riscv/include/asm/kvm_nacl.h
index 8f3e3ebf5017..4124d5e06a0f 100644
--- a/arch/riscv/include/asm/kvm_nacl.h
+++ b/arch/riscv/include/asm/kvm_nacl.h
@@ -12,6 +12,8 @@
 #include <asm/csr.h>
 #include <asm/sbi.h>
 
+struct kvm_vcpu_arch;
+
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_nacl_available);
 #define kvm_riscv_nacl_available() \
 	static_branch_unlikely(&kvm_riscv_nacl_available)
@@ -43,6 +45,10 @@ void __kvm_riscv_nacl_hfence(void *shmem,
 			     unsigned long page_num,
 			     unsigned long page_count);
 
+void __kvm_riscv_nacl_switch_to(struct kvm_vcpu_arch *vcpu_arch,
+				unsigned long sbi_ext_id,
+				unsigned long sbi_func_id);
+
 int kvm_riscv_nacl_enable(void);
 
 void kvm_riscv_nacl_disable(void);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 0aad58f984ff..e191e6eae0c0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -770,19 +770,59 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
  */
 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
+	void *nsh;
 	struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
 	struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
 
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
-	hcntx->hstatus = ncsr_swap(CSR_HSTATUS, gcntx->hstatus);
+	if (kvm_riscv_nacl_sync_sret_available()) {
+		nsh = nacl_shmem();
 
-	nsync_csr(-1UL);
+		if (kvm_riscv_nacl_autoswap_csr_available()) {
+			hcntx->hstatus =
+				nacl_csr_read(nsh, CSR_HSTATUS);
+			nacl_scratch_write_long(nsh,
+						SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
+						SBI_NACL_SHMEM_AUTOSWAP_HSTATUS,
+						gcntx->hstatus);
+			nacl_scratch_write_long(nsh,
+						SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
+						SBI_NACL_SHMEM_AUTOSWAP_FLAG_HSTATUS);
+		} else if (kvm_riscv_nacl_sync_csr_available()) {
+			hcntx->hstatus = nacl_csr_swap(nsh,
+						       CSR_HSTATUS, gcntx->hstatus);
+		} else {
+			hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
+		}
 
-	__kvm_riscv_switch_to(&vcpu->arch);
+		nacl_scratch_write_longs(nsh,
+					 SBI_NACL_SHMEM_SRET_OFFSET +
+					 SBI_NACL_SHMEM_SRET_X(1),
+					 &gcntx->ra,
+					 SBI_NACL_SHMEM_SRET_X_LAST);
+
+		__kvm_riscv_nacl_switch_to(&vcpu->arch, SBI_EXT_NACL,
+					   SBI_EXT_NACL_SYNC_SRET);
+
+		if (kvm_riscv_nacl_autoswap_csr_available()) {
+			nacl_scratch_write_long(nsh,
+						SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
+						0);
+			gcntx->hstatus = nacl_scratch_read_long(nsh,
+								SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
+								SBI_NACL_SHMEM_AUTOSWAP_HSTATUS);
+		} else {
+			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+		}
+	} else {
+		hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
 
-	gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+		__kvm_riscv_switch_to(&vcpu->arch);
+
+		gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+	}
 
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 9f13e5ce6a18..47686bcb21e0 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -218,6 +218,35 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	ret
 SYM_FUNC_END(__kvm_riscv_switch_to)
 
+	/*
+	 * Parameters:
+	 * A0 <= Pointer to struct kvm_vcpu_arch
+	 * A1 <= SBI extension ID
+	 * A2 <= SBI function ID
+	 */
+SYM_FUNC_START(__kvm_riscv_nacl_switch_to)
+	SAVE_HOST_GPRS
+
+	SAVE_HOST_AND_RESTORE_GUEST_CSRS .Lkvm_nacl_switch_return
+
+	/* Resume Guest using SBI nested acceleration */
+	add	a6, a2, zero
+	add	a7, a1, zero
+	ecall
+
+	/* Back to Host */
+	.align 2
+.Lkvm_nacl_switch_return:
+	SAVE_GUEST_GPRS
+
+	SAVE_GUEST_AND_RESTORE_HOST_CSRS
+
+	RESTORE_HOST_GPRS
+
+	/* Return to C code */
+	ret
+SYM_FUNC_END(__kvm_riscv_nacl_switch_to)
+
 SYM_CODE_START(__kvm_riscv_unpriv_trap)
 	/*
 	 * We assume that faulting unpriv load/store instruction is
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
