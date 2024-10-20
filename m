Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9AAD3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 21:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfV/eudo9yMF7HPwlUAVotRzo82aLbWs85Z4t6emJNc=; b=sTt1fCgtUPUK1Q
	Md+ZU4Paq6LEMKMbVfVoMSTfBejt1FgbGG+/9JTBSniVmlrj3tlMfTs3aGWmQxSLjjEtUAcOxYR41
	btfZpNraenH2KWevddvsVj3pETsjFG0ibPQcesC6AsumXsVs1TKX9RzUhMGryl69WOFnQowtL++tV
	8ETcl9KPjHJOgtzZ64mYXcvBeUlRKBMlhXdz/6dnPK2U2ye/A/kjjHyyueohoH+vZOYtDKsd55jS0
	6Q5zAmkIoAJ3oXe5biwjntcUF14EXx77weU7HP58Ty7sZSSQDrcczppPPqk63o4RnJAiyUBQG+VPo
	TPMatk19uogaBGdKECTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2d29-00000005SL1-4BkN;
	Sun, 20 Oct 2024 21:00:18 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buL-00000005Mvg-2KgN
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:48:14 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso2741731a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453688; x=1730058488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jpt4DbIfoiuDWJOlua/tAIaTx6f+U6YQBxkTpe5jPP4=;
        b=RgZzWrXF0X/w3vc1eAOc5O59fV2dVQVKulWeSrJMWgHu3/oS/tHGVgdgeXZlDbmG/I
         T8N+T/6qmzRctnNG+YFpUkA7xyb5MJs8usTNiAkuh+gt5c9XA/jTwuDgWGK0dWwmDTUo
         z9lz7URrdX/f9carwD+XH6VXNp7aWeTJCdgulDhSapN5Tqi5GixZkN8AGHIFLCKAYFAx
         IHooavW5Sf5soBGYXhHleW7vwlznPofCPuvPuEXzi2z/DnbXvqBRN9a/NycsVy/1K9vr
         V3g0rCN5s6t6sKEdbECGDKtOtKMJ1bTiyJKOoAk4CIdae2G+HPrtcsAuHu+/qSkE6JgT
         kUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453688; x=1730058488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jpt4DbIfoiuDWJOlua/tAIaTx6f+U6YQBxkTpe5jPP4=;
        b=aFR1qY7wcgaHOn2NyrI4ctskmLror/2IoAiySIedael2myRD0l8o19PWk9A8OFDacr
         howhpTD/3gT699XzzaLU+8f18WLHER0QdlyyBEXzbc5dcM11zzWl8v+M3kp77tvRUzWC
         Tn3gGzTAXNIwLsH1AS8XMjsiL83PsBct3IbjNaOVPnAYQH4i5Z4VlqsKx1+/mS/HOLi+
         AOiXxZfHTv5/BzCILucdjqNHi8hI0+t6GuqnXPqwdHBXynkvlZ9wLmWWH0y8MZezsZq8
         Az8ccOYKKlm87QmYK00GFWGh4i/o4/X8L1ySY7+J6QMW5uFOvP2Wy2xlQN2mRzNhkIQP
         5imw==
X-Forwarded-Encrypted: i=1; AJvYcCV7wiM+K87CWWS5XiWJ/q7oTZAiEJkVQOH3ZSbehYLYYDpUdrAIj05FKzWRFNu1ORI7s7ewp/erP2h0ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGin0mL1AWbANqesSCY+gAMtePqkpWAfPLRl9TjxbugkVgcBmM
	rR9+n+1wQizw5r4JRksDrosusnitiex+oZdu65O5B5i482wquCU4SdmjMaCBKK8=
X-Google-Smtp-Source: AGHT+IFBmef3AeMvYK7vRhNOkgHPNp9TfRjR+EjTOWv2i/hsD5eBK3uDXWFjXdE3v54cHEOsNVWYNw==
X-Received: by 2002:a17:90a:17cc:b0:2e0:5748:6ea1 with SMTP id 98e67ed59e1d1-2e56172aad1mr11159778a91.37.1729453688471;
        Sun, 20 Oct 2024 12:48:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:48:07 -0700 (PDT)
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
Subject: [PATCH v2 13/13] RISC-V: KVM: Use NACL HFENCEs for KVM request based HFENCEs
Date: Mon, 21 Oct 2024 01:17:34 +0530
Message-ID: <20241020194734.58686-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124809_859182_445A2B51 
X-CRM114-Status: GOOD (  10.10  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
