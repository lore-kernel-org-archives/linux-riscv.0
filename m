Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87107C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 07:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKR3OfjqdGHAev4u3UGN2d/MrAuian0bZJVOEB/twCs=; b=irNpReAiSpyeUa
	5eQ5N7ND+3Vj41Ps+VgSwSPAPfeJ/Khn190Llib9A7kpzZraet8NPaYO6rXl5CcdPmDo/XPu50Ak+
	xzqEj0pEJbRy/9Q4G9MsXF+Ov8Yg+1RV9gVp+A4Y0A+YznOIzHqdoHp4UC0fWHmqytHAjIAcVmXFs
	aFIQOno6KbjMHc+yOkvXfuaRDDrvazYSkTE3rJULdz41m2W+Uh+zWKll1/bbdzFdd1OtJHXsg5sc1
	f9Dmea1FaIp6BUyRrpN0JB0ZjraDbEcVYuEOmCfICJYI7K3I7T2NCDeV5lCnxW6ui89wfGi2BZ34u
	Xfy4IEEYc2zmTU1TGG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN51p-0000000EweV-0LLL;
	Thu, 05 Jun 2025 07:28:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3tU-0000000Epf0-44BO
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Jun 2025 06:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qJnA2ITAN8AbKW8vRXTI9OBsRCn2zeX47qUEnC92+48=; b=LuEs0+4ldZE0LfuIjvamuotffR
	9vRwU5QsROPYFU073XdTLwIvMGtb8o0edEA+yQtfNWB55dQmrvBTbJa/+rv73SJwdPV5/3qziV1B2
	RpDUQhOx3Tza0OJWdy02bglQHOvEWN9rjDE2blm0tXW+pp5jZIlZPL68BRueI7mBKAwnURDznwRDn
	XoNLqaU7rVHxdA1t4X5/g8dhOglILj232Kfh/AdMyVt5Gcfdgo0Fb0pKfJMN7TiMWHJjMghmakCGZ
	uBf1Q6Sbkw9VIDvpQC2hWYU58q4/NHimbwaE8BYv6WpluVm5b7AisG0P0a1BSHddhAPjPjfrTt1IR
	zGc/YBcQ==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3tR-000000014E2-2vzb
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:16:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-312150900afso628931a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104156; x=1749708956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJnA2ITAN8AbKW8vRXTI9OBsRCn2zeX47qUEnC92+48=;
        b=Ov22IoB/AcHL9abEv9vpG3g4RctRt7NerCSBga8wE8QFFNEMBDM53/BHd81qRUk2nF
         NmTOyfvVNXFy3vDt8v9fwDevat4MEQxUpm3rujoBwGESBkDKp+pR4RKt1UEbgutjHcyj
         0J2uxRXZp0l8Az1fm3zzv8umn+KZ2Nl005+Q3JPzISv6imBQHyYULCKKBAeNSvcQZxcH
         aUF/Wo3OFs72VjCWjzQ7cQZK3fXPl4Ks7SHqaaV9AyVllkZX7GFFMhfAz33O7SO4BYtd
         Cxu+dO+ivb47W4NYFsXcqVRCmBpzOj6m/L2mUAyoFxYUcLsmJfbkr0QsNWTroXzwPhey
         +rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104156; x=1749708956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJnA2ITAN8AbKW8vRXTI9OBsRCn2zeX47qUEnC92+48=;
        b=qLoFZKXpW1gw0QnukJeunUE08KSArncD5gJ4Ea+jv1vunaerr+rYElzN5fit12DkXC
         SQenFEiJUZrBQEBpBT0YKBrSoJbDg9tkZ0PrWh/zkUkupIdlYk6gCL2WRX0s836sV8vY
         l7t6bPkxbD/PQV0iCyz7/ccd5Pt/3d/PfZFOiegPytwnOtO0h1gAFp0RYcT/1sqx0l2j
         5mIlyuIxyg90464OJoIbqBnPIgpEHfstFHyPOr1CfXaSUgHb96y4KIS8c79f2SVK0Vcn
         jrGZ8+WZWSJd86dGFZmApDYSiJ6MdhA9kqDxdEW8bA+E/nku4DZCMQiGNd8d1mi/ICT0
         4P+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWP2KnbuTirlP2fsmcCI4MJNTKNH6oeNlsTF31Qw7dRhN7PGsgkP/ez0Bd/S1+h8Bb15X0t5pM9b+o5xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMgccBIuT4nuxPP8vDAUIvjEnRk71DYXhnF7669B/urWxhmNZp
	ZzDrE1VeLdmQvhpsrnBwioD7L6MCdOW8v4IqU9WFnuX4MLLneEFs5Cal3eEUa4TS++8=
X-Gm-Gg: ASbGncvbudrWGm4GrWPr8K5S0JrIAwk6+9ZFX98HvPio21ozVVirDcVz0u1Uvunxjg3
	5yCz1MkXNIr6bEpkZCf8YbhQJPCDrGSo790hcnitGUV4juJb3hcqvYu99p7Ry+QtDPwG/dnh5jh
	HwlyHI2HdppdCy4LKU44qCGlelrpkA3uACXQnZhDu/ADuDIMR0M2zuRwkGf/4IfHzeMKUsp+FEO
	6RmYF+SRxyFjBqtzjbxdtt3t/qeKbluS75KkIilAMh9FEGNaAdZmu5u1s51nXHMrvxKfWe8gb0Q
	livZZ173mgERnQikpLZ//6SxDbVqKzPA3s8p3y1m864IXU9InC6WJUyVWe+dyQDajhKa8N3Knnc
	s/vNFag==
X-Google-Smtp-Source: AGHT+IGidU5oO/NtKWVZfC9oWMHMT1bnyxO6WBsndaUc4qqkBjwaBRbjIPk9+Qztot5hQY4gLIxDWQ==
X-Received: by 2002:a17:90b:2e49:b0:311:a314:c2ca with SMTP id 98e67ed59e1d1-3130ccf6f95mr7911585a91.6.1749104155801;
        Wed, 04 Jun 2025 23:15:55 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:55 -0700 (PDT)
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
Subject: [PATCH 13/13] RISC-V: KVM: Pass VMID as parameter to kvm_riscv_hfence_xyz() APIs
Date: Thu,  5 Jun 2025 11:44:58 +0530
Message-ID: <20250605061458.196003-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_071601_889474_66C67AD4 
X-CRM114-Status: GOOD (  15.73  )
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

Currently, all kvm_riscv_hfence_xyz() APIs assume VMID to be the
host VMID of the Guest/VM which resticts use of these APIs only
for host TLB maintenance. Let's allow passing VMID as parameter
to all kvm_riscv_hfence_xyz() APIs so that they can be re-used
for nested virtualization related TLB maintenance.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_tlb.h  | 17 ++++++---
 arch/riscv/kvm/gstage.c           |  3 +-
 arch/riscv/kvm/tlb.c              | 61 ++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_sbi_replace.c | 17 +++++----
 arch/riscv/kvm/vcpu_sbi_v01.c     | 25 ++++++-------
 5 files changed, 73 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
index f67e03edeaec..38a2f933ad3a 100644
--- a/arch/riscv/include/asm/kvm_tlb.h
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -11,9 +11,11 @@
 enum kvm_riscv_hfence_type {
 	KVM_RISCV_HFENCE_UNKNOWN = 0,
 	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
+	KVM_RISCV_HFENCE_GVMA_VMID_ALL,
 	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
 	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
 	KVM_RISCV_HFENCE_VVMA_GVA,
+	KVM_RISCV_HFENCE_VVMA_ALL
 };
 
 struct kvm_riscv_hfence {
@@ -59,21 +61,24 @@ void kvm_riscv_fence_i(struct kvm *kvm,
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order);
+				    unsigned long order, unsigned long vmid);
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask);
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long vmid);
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid);
+				    unsigned long order, unsigned long asid,
+				    unsigned long vmid);
 void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid);
+				    unsigned long asid, unsigned long vmid);
 void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long hbase, unsigned long hmask,
 			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order);
+			       unsigned long order, unsigned long vmid);
 void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask);
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long vmid);
 
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index c7d61f14f6be..c5dc47b156c4 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -117,7 +117,8 @@ static void gstage_tlb_flush(struct kvm_gstage *gstage, u32 level, gpa_t addr)
 	if (gstage->flags & KVM_GSTAGE_FLAGS_LOCAL)
 		kvm_riscv_local_hfence_gvma_vmid_gpa(gstage->vmid, addr, BIT(order), order);
 	else
-		kvm_riscv_hfence_gvma_vmid_gpa(gstage->kvm, -1UL, 0, addr, BIT(order), order);
+		kvm_riscv_hfence_gvma_vmid_gpa(gstage->kvm, -1UL, 0, addr, BIT(order), order,
+					       gstage->vmid);
 }
 
 int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 349fcfc93f54..3c5a70a2b927 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -251,6 +251,12 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 				kvm_riscv_local_hfence_gvma_vmid_gpa(d.vmid, d.addr,
 								     d.size, d.order);
 			break;
+		case KVM_RISCV_HFENCE_GVMA_VMID_ALL:
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_gvma_vmid_all(nacl_shmem(), d.vmid);
+			else
+				kvm_riscv_local_hfence_gvma_vmid_all(d.vmid);
+			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
 			if (kvm_riscv_nacl_available())
@@ -276,6 +282,13 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 				kvm_riscv_local_hfence_vvma_gva(d.vmid, d.addr,
 								d.size, d.order);
 			break;
+		case KVM_RISCV_HFENCE_VVMA_ALL:
+			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_vvma_all(nacl_shmem(), d.vmid);
+			else
+				kvm_riscv_local_hfence_vvma_all(d.vmid);
+			break;
 		default:
 			break;
 		}
@@ -328,14 +341,13 @@ void kvm_riscv_fence_i(struct kvm *kvm,
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order)
+				    unsigned long order, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_GVMA_VMID_GPA;
 	data.asid = 0;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gpa;
 	data.size = gpsz;
 	data.order = order;
@@ -344,23 +356,28 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 }
 
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask)
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long vmid)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
-			    KVM_REQ_TLB_FLUSH, NULL);
+	struct kvm_riscv_hfence data = {0};
+
+	data.type = KVM_RISCV_HFENCE_GVMA_VMID_ALL;
+	data.vmid = vmid;
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
+			    KVM_REQ_TLB_FLUSH, &data);
 }
 
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid)
+				    unsigned long order, unsigned long asid,
+				    unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_GVA;
 	data.asid = asid;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -370,15 +387,13 @@ void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 
 void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid)
+				    unsigned long asid, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
-	struct kvm_riscv_hfence data;
+	struct kvm_riscv_hfence data = {0};
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_ALL;
 	data.asid = asid;
-	data.vmid = READ_ONCE(v->vmid);
-	data.addr = data.size = data.order = 0;
+	data.vmid = vmid;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
 			    KVM_REQ_HFENCE_VVMA_ALL, &data);
 }
@@ -386,14 +401,13 @@ void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long hbase, unsigned long hmask,
 			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order)
+			       unsigned long order, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_GVA;
 	data.asid = 0;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -402,16 +416,21 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 }
 
 void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask)
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long vmid)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
-			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
+	struct kvm_riscv_hfence data = {0};
+
+	data.type = KVM_RISCV_HFENCE_VVMA_ALL;
+	data.vmid = vmid;
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
+			    KVM_REQ_HFENCE_VVMA_ALL, &data);
 }
 
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
 {
 	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
 				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
-				       PAGE_SHIFT);
+				       PAGE_SHIFT, READ_ONCE(kvm->arch.vmid.vmid));
 	return 0;
 }
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index b17fad091bab..b490ed1428a6 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -96,6 +96,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
 	unsigned long funcid = cp->a6;
+	unsigned long vmid;
 
 	switch (funcid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
@@ -103,22 +104,22 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+		vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
-			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask);
+			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask, vmid);
 		else
 			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
-						  cp->a2, cp->a3, PAGE_SHIFT);
+						  cp->a2, cp->a3, PAGE_SHIFT, vmid);
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+		vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
-			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
-						       hbase, hmask, cp->a4);
+			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, hbase, hmask,
+						       cp->a4, vmid);
 		else
-			kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm,
-						       hbase, hmask,
-						       cp->a2, cp->a3,
-						       PAGE_SHIFT, cp->a4);
+			kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, hbase, hmask, cp->a2,
+						       cp->a3, PAGE_SHIFT, cp->a4, vmid);
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 8f4c4fa16227..368dfddd23d9 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -23,6 +23,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	struct kvm_cpu_trap *utrap = retdata->utrap;
+	unsigned long vmid;
 
 	switch (cp->a7) {
 	case SBI_EXT_0_1_CONSOLE_GETCHAR:
@@ -78,25 +79,21 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
 			kvm_riscv_fence_i(vcpu->kvm, 0, hmask);
 		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA) {
+			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_all(vcpu->kvm,
-							  0, hmask);
+				kvm_riscv_hfence_vvma_all(vcpu->kvm, 0, hmask, vmid);
 			else
-				kvm_riscv_hfence_vvma_gva(vcpu->kvm,
-							  0, hmask,
-							  cp->a1, cp->a2,
-							  PAGE_SHIFT);
+				kvm_riscv_hfence_vvma_gva(vcpu->kvm, 0, hmask, cp->a1,
+							  cp->a2, PAGE_SHIFT, vmid);
 		} else {
+			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
-							       0, hmask,
-							       cp->a3);
+				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, 0, hmask,
+							       cp->a3, vmid);
 			else
-				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm,
-							       0, hmask,
-							       cp->a1, cp->a2,
-							       PAGE_SHIFT,
-							       cp->a3);
+				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, 0, hmask,
+							       cp->a1, cp->a2, PAGE_SHIFT,
+							       cp->a3, vmid);
 		}
 		break;
 	default:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
