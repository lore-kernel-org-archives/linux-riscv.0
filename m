Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ECEC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rIwXIc+2BDzydPPOhslvNIuWyRE7/QuMB2RfNxeyjI=; b=4wy87mpdRWLZfD
	Iy/bLdgRCrQyuRPgJxyvxwK+pgm2AJtkARlNeLuJxFNSzq6AHhnNlhnUwknBrxxroszTrn3mLjZG7
	ubbvfNSKqneYP1b2ItJeH6trLjJqIrjqkvEsyelMBfGWSegCjX8Vh7If85bfvEImol5lrhbicLHVL
	kSeyjBnYiv/pTH0pz1r5tkFRcKDyTI6j8adCpF87OAOi9UF3hvB5DdbkIn5mltpJiRUxrahMDC/tM
	8HLfz9CBN/UiIFeWDdjzO26SAA9KH8CR2VdxAOsDuVxMSujIS3grDfjEANENqVjmnbtGtASGksp+U
	1HVMgZEjFbT+K4F69wnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBh-00000003Bwi-3GDp;
	Fri, 19 Jul 2024 16:10:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBP-00000003Bfa-40Fd
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:10:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fbe6f83957so18444225ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405410; x=1722010210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qyi9hrGfVRmOD1WpD5vxj3JpORinviXBA5VC8Qc3Jso=;
        b=GUP5vqaDmuZjfFzslUetgninflMgNUq75i3EEFqywsbmuY6ify5FPDnbYeemyTDdMM
         9KBpRe+QcYGStRGmQrqGkGI2cCdQXeJqfJYqf+ISGuu5pOio6Eetiz4ZuEGuRy4iCJvR
         YSMmdwEvvzG1sHbc0JSMS4zdL1NILpLoLGM3nYQsFdi4VCRgQIp0AoV+NiePmPFivMhx
         k2sXLZt/pRo9ZgLkjQt+A/+Wf16twrZZmmRKOP2/xZU9PqAV890iLDaRA7TxAjatS1A9
         CqTrjgP09FpobZikA9j+p+PWJATc63DBeZMzO7oLLSv4rrt8MaABydYLo3JgaXoun4vw
         qU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405410; x=1722010210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qyi9hrGfVRmOD1WpD5vxj3JpORinviXBA5VC8Qc3Jso=;
        b=PjQwtuYmBGLLoTaC5HcT6uTOqFz8NacJEUPuDvMFjz0PXgPHUlNAezn5rGeKVeH2Gq
         kD5K3xeM1lr2Xmf5gpNZsy5v29Jd6o5rpk1Wa47USNGpMdUHrAq1lu6FKNl6ZWKC1XS6
         VSSklRchLBD/UmGWRyotvwG6NSIDcIMAfRGTJR1mabJwjmuJZBGZ0XQKcjL6ZSlfh6bJ
         ITD3YqjPRcT1TqD4HmQJD2yVopAnvejOAEW3DMIjtkINz/ry0s2eSouPuyIIJ+GgR1Iw
         hgH3+ZqiK6e0zUEKBz0fgD5lDsaR2M28sm/XiH8f97qLR58lPXwcbLybLnFGiyNTWMeA
         TmFg==
X-Forwarded-Encrypted: i=1; AJvYcCUrAggrYU9c2PRPBms46qaQw7N/5C16ysTQ/SdjKoUGDxRvv7d1p3PvibG/QEKgR8OMWcfsvgsjYEbzo3BfWXvcKZ5N2Fbyg1brVSy2QNR8
X-Gm-Message-State: AOJu0Yx4Np8JcbPf+BDeMZph5vp3lZfd0t2wZdgwoMM/s1aPqJz1vFhd
	S7UnP3sG0M0sizuRC44/sItsFmpowXsprVEOGulfK623stu/eHahLsGIhbDpKkE=
X-Google-Smtp-Source: AGHT+IFxxJQJMT1yPV9iBgyfcleth8inhyBwlA3lhunIDQ81CpWWGH98IspVcY6bKB19yLGgqpEUJg==
X-Received: by 2002:a17:902:ecc5:b0:1fb:7978:6b1 with SMTP id d9443c01a7336-1fd74578fb2mr4074945ad.31.1721405410214;
        Fri, 19 Jul 2024 09:10:10 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:10:09 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 13/13] RISC-V: KVM: Use NACL HFENCEs for KVM request based HFENCEs
Date: Fri, 19 Jul 2024 21:39:13 +0530
Message-Id: <20240719160913.342027-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091012_114102_72338389 
X-CRM114-Status: GOOD (  10.51  )
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

When running under some other hypervisor, use SBI NACL based HFENCEs
for TLB shoot-down via KVM requests. This makes HFENCEs faster whenever
SBI nested acceleration is available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/tlb.c | 57 +++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 23c0e82b5103..2f91ea5f8493 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -14,6 +14,7 @@
 #include <asm/csr.h>
 #include <asm/cpufeature.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_nacl.h>
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
@@ -186,18 +187,24 @@ void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vmid *vmid;
+	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
+	unsigned long vmid = READ_ONCE(v->vmid);
 
-	vmid = &vcpu->kvm->arch.vmid;
-	kvm_riscv_local_hfence_gvma_vmid_all(READ_ONCE(vmid->vmid));
+	if (kvm_riscv_nacl_available())
+		nacl_hfence_gvma_vmid_all(nacl_shmem(), vmid);
+	else
+		kvm_riscv_local_hfence_gvma_vmid_all(vmid);
 }
 
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vmid *vmid;
+	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
+	unsigned long vmid = READ_ONCE(v->vmid);
 
-	vmid = &vcpu->kvm->arch.vmid;
-	kvm_riscv_local_hfence_vvma_all(READ_ONCE(vmid->vmid));
+	if (kvm_riscv_nacl_available())
+		nacl_hfence_vvma_all(nacl_shmem(), vmid);
+	else
+		kvm_riscv_local_hfence_vvma_all(vmid);
 }
 
 static bool vcpu_hfence_dequeue(struct kvm_vcpu *vcpu,
@@ -251,6 +258,7 @@ static bool vcpu_hfence_enqueue(struct kvm_vcpu *vcpu,
 
 void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 {
+	unsigned long vmid;
 	struct kvm_riscv_hfence d = { 0 };
 	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
 
@@ -259,26 +267,41 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 		case KVM_RISCV_HFENCE_UNKNOWN:
 			break;
 		case KVM_RISCV_HFENCE_GVMA_VMID_GPA:
-			kvm_riscv_local_hfence_gvma_vmid_gpa(
-						READ_ONCE(v->vmid),
-						d.addr, d.size, d.order);
+			vmid = READ_ONCE(v->vmid);
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_gvma_vmid(nacl_shmem(), vmid,
+						      d.addr, d.size, d.order);
+			else
+				kvm_riscv_local_hfence_gvma_vmid_gpa(vmid, d.addr,
+								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			kvm_riscv_local_hfence_vvma_asid_gva(
-						READ_ONCE(v->vmid), d.asid,
-						d.addr, d.size, d.order);
+			vmid = READ_ONCE(v->vmid);
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_vvma_asid(nacl_shmem(), vmid, d.asid,
+						      d.addr, d.size, d.order);
+			else
+				kvm_riscv_local_hfence_vvma_asid_gva(vmid, d.asid, d.addr,
+								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_ALL:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			kvm_riscv_local_hfence_vvma_asid_all(
-						READ_ONCE(v->vmid), d.asid);
+			vmid = READ_ONCE(v->vmid);
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_vvma_asid_all(nacl_shmem(), vmid, d.asid);
+			else
+				kvm_riscv_local_hfence_vvma_asid_all(vmid, d.asid);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
-			kvm_riscv_local_hfence_vvma_gva(
-						READ_ONCE(v->vmid),
-						d.addr, d.size, d.order);
+			vmid = READ_ONCE(v->vmid);
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_vvma(nacl_shmem(), vmid,
+						 d.addr, d.size, d.order);
+			else
+				kvm_riscv_local_hfence_vvma_gva(vmid, d.addr,
+								d.size, d.order);
 			break;
 		default:
 			break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
