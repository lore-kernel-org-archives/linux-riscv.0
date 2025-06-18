Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA64C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRSeOxMHGfXL4C3xLOIsoERMrXiBb67xht/6MBdyoSI=; b=TQqooKOgZ5nkRR
	d/qVd7X2e3CSEGJkdRLi/WGoXtT2qhQ+54jPTw1VJZ6jvlX84SGCnmvTuRLBZskIt0bHtKoBhIlLx
	fMyw1NO/bDqlXolzEoKHViz3lmssuDjf9h6/5ZuqEFPAzr8n92p4ZkYg2PfpYmxzbWbj92RYgs4+B
	ACYy9n2fke4TegzsG2tnUS9kcmG6002x0uYSC1ZcW9Ew/hc1X025wcmUwwnL4M3K4w/NEqHeF0DgF
	/3H5/u4t91CYSk4cWg3jqCLeJ5C+kGtX/jxWvdSL4mfTDM/oM4qbyfngacdNWby/J+KibqHUNZcQP
	xjz9WABCe71SVQAR1ZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWk-0000000AEaV-42CC;
	Wed, 18 Jun 2025 13:08:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5E-00000009xfL-2S0G
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2350fc2591dso5606535ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246560; x=1750851360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=kMhCbrwz2/W6LZUkWiS1WdU+d/1U3Mzbh1Lhf8uk1ePUlef6B0pHhucV+4dn/0bfNy
         UlfOheb6GfNa5oNx0wb4k8QdmE4U7na0WoakFvm5Lf1YVdQlJigL4RDVjT2Tx7TjtVLj
         ZdS+vgRkdIYiINpTekFYOMxjwFWoVCrWxLr1HyJ5uiH0KtQg0SxjKD5Jqcm9cz/mIlPK
         gzAf7QYlqEHAYr3GMjwffVI94WbC/ZFA64LyMIZjFM4a1Pq2+EagjrJee+OdE0+vZ8/V
         +vmttWy1FHVq/t7SbUc9U2g+0ppETSGIj9AsaI5OLG83n8ayMvFF09p6u3OhrMJ/asNG
         6nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246560; x=1750851360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=mbRYPGz4UFRcmKbNu8OLvaetsoGSXTpRKWp8ixzByyeJwVQaH0Cd/HTrLmSdbDHIBA
         QTuxwPXfxrTSUE6PrnmWmUNzweKEJrkLdquKnPTMdNft3qNBJt/RECnfRow2VYCju16B
         1dvK+lqAgy6t7bgQE2kIItmFmjbrRw3GqkaV5NjiKj/khRu5NSkA7ChSUB1H+kFvoVzT
         9g9ornBuaZ/7ef16hEFMU5Ghjo6NNSBueRKgg/HBOoL+dmCWCSbIWiQtuOpUGJSwK5q7
         w+GLFXwhBiSAZ++l9sO8/1pHSkM7D38e3nMhzOgrC2tjeUFAw7F4rll0eJZMLT1jt09A
         +CrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUim4/tqdOVHubdpc+0UGvKL4YMM4tiJc9a/vs23R3ArwfUpSDOK2289zeDL3GXzUmzmpTEiVJzgqSvpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQX9H/gGUv2Kc4z3H6j1iWaM0Qr7qPDBNx27+H5L+UdErff3EM
	K+kcKV7DcD5V1kRPLG1eDjMskegX6dZJ6Cgw5Q4AQ3PqeCACFdnSy9FKZuYzMXDAKo8=
X-Gm-Gg: ASbGncvXkfdvTZDYfXWGlJXLVSwwsOmtfQZeb9ktyrxk033oNN9nXv1nYE+xoOHU5Ut
	j3QNA1gjxTcpxLgWXhXFWk3hAAtk5Cwqi75+XQTGLQX7PlYg7dqHD7lZdc9W6S5VCZbnF3DXrVQ
	XKhE7haRWMJJJindwaag8TRuxLnLBhzLxjsxGGroFP0BxEWJsMxiXB0lNAcCKcnydmhiNav7+do
	UFdK+MJztqVA/OSedP3URcmo9AIK+614TPIjSsLhT9yKpBKf+zp3dqN+JYBiJ0Y5IaOjROmzE4f
	8+VG3bDaePq4IXvukPaW7fQGyk8Jel8PFNXoB/GLO+g7BZAea6VWEsHce2BEng/i934yn0NfV/U
	GGqd9ZP/gebqZafwmgQ==
X-Google-Smtp-Source: AGHT+IG6YfMEu9lcXrd2qiAepReJXbM/lA1ChWg4x51TipxipgSLPLblK8ZINKPH1NwWxJ/vO5o07w==
X-Received: by 2002:a17:902:c94e:b0:231:9817:6ec1 with SMTP id d9443c01a7336-237c20e022cmr32723525ad.17.1750246559668;
        Wed, 18 Jun 2025 04:35:59 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:59 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v3 03/12] RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
Date: Wed, 18 Jun 2025 17:05:23 +0530
Message-ID: <20250618113532.471448-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043600_621538_6DF81268 
X-CRM114-Status: GOOD (  12.84  )
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 +--
 arch/riscv/kvm/tlb.c              | 23 -----------------------
 arch/riscv/kvm/vcpu.c             |  4 ++--
 arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 9a617bf5363d..8aa705ac75a5 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -331,8 +331,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
@@ -380,6 +378,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
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
index f9fb3dbbe0c3..a2dd4161e5a4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -962,12 +962,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
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
