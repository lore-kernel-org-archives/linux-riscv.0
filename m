Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EA4C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2lb017B0/uycnd3eww/P7ELMGbM2lZkIImNC5I+Kgw=; b=Cx2vQHeQkContK
	HOsTIRZTI0OTvnNb6epJQCnofS6uHPOWr8dOk6/HDq38bShfLdipnMbl40TjNSvfLnaR8VX2TT2S0
	7ssZebVJ+94Oj6ESjSsbgYPXYnGKUyPu4UxNMn4+DEdOIjG7+Wfph/O6rc5EkQljV2dKC4XCboUcp
	bGsyzC/3aoYSXZ8EQfCumpfGyP5Knsoc9zirTNcf7mAe9N4j/q7KzxtYPOdVj/FRu78g5MotAVLDs
	eGKyRo3ibo4MkU9fXYqcmuxugatkeojqRYIgyxo8u8pQuyK/EdbgDttNUTQ2HTycS2AtMGysTD+n8
	wTL5bf8pl5mdpDrnqeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7u-006T1n-23;
	Wed, 19 Apr 2023 22:18:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7r-006SnP-0y
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a69f686345so4526955ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942687; x=1684534687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHi27AH8EgCkCQBErjcLInO9Ogd99Uht/0Y2I/rPxr0=;
        b=YSIfA3fBHehSI9sfNw8kNY3SjYw3MKpDND587n51K3eoVf8RJTCG1iSaqqG9yfNjCx
         jwqPpoi/ITD0shW0NUnRyZli8JT8h1t3/2gNbp76WuPUO0CZ5s8zSvoyiHQFyjfIMwOE
         1ZldJnGMaXcDrIoP6ErfdR2UHM3fNFztr08TXf0xVGRFo5tk0moUvzoYm/r0hkRFoy0K
         cWLNwCIHBfTQ0bCQR3c38U1nAB1slt1q42rqYoamEUYp5QQ79+wtILJqFzbQlYA06O6P
         OEHwUmVOCGHeSnw6bqeEZSZ4KjU2xfgwWJGo24N5J96VrnqV0nME7zdNFrLcXHLPuPgD
         RkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942687; x=1684534687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHi27AH8EgCkCQBErjcLInO9Ogd99Uht/0Y2I/rPxr0=;
        b=GIA1EKzZDTqYlaCiQYXu/xQHiqdGXaVTWbGee0v0cUhlhPJHgOsCRCmF9dB14KRejf
         ErUfXYcB24lrWngm0cfuiUUsazXgBVrJ+7ZtYQT+CRBWxwmcJHHCsxrbCf1o246RnRBK
         CT3EDpWGr9EumIvmZh1MypOHdM+vc0i9ytZT6pa9+/8zUfm76eAxT01tRR8fcta8eSu2
         MIWJZoHhcBXo6V9YB+tlX9YmMRqggISa8fgIFzNETFylPZcDFL+YdIdvFamDSGBoCjT3
         CfZO26yDQopf4v2thrSPvkamvMcnUK3QlxTu9pjTecrruxwrN31pIoRwRKHZLZ2t33qk
         25DQ==
X-Gm-Message-State: AAQBX9eMHEKhlVdHULBih1euSjxYK5a2bZ2xA+cwA13UV1GRGbzIoJk5
	mvGDm4uQYLSqP9Z8+Fe80g2cEg==
X-Google-Smtp-Source: AKy350a7uqnn10B5RYMJKbmqBxpZkXHpV8hWE2JbxUvi5COFiIeLm7AFkPV91DbiIrXf3nFN1rwkeg==
X-Received: by 2002:a17:902:ec8b:b0:1a9:23b7:9182 with SMTP id x11-20020a170902ec8b00b001a923b79182mr2674160plg.27.1681942686991;
        Wed, 19 Apr 2023 15:18:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 17/48] RISC-V : KVM: Skip vmid/hgatp management for TVMs
Date: Wed, 19 Apr 2023 15:16:45 -0700
Message-Id: <20230419221716.3603068-18-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151807_356764_1816C4D5 
X-CRM114-Status: GOOD (  18.92  )
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

The TSM manages the vmid for the guests running in CoVE. The host
doesn't need to update vmid at all. As a result, the host doesn't
need to update the hgatp as well.

Return early for vmid/hgatp management functions for confidential
guests.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 +-
 arch/riscv/kvm/mmu.c              |  4 ++++
 arch/riscv/kvm/vcpu.c             |  2 +-
 arch/riscv/kvm/vmid.c             | 17 ++++++++++++-----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index ca2ebe3..047e046 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -325,7 +325,7 @@ unsigned long kvm_riscv_gstage_pgd_size(void);
 void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm *kvm);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1d5e4ed..4b0f09e 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -778,6 +778,10 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	unsigned long hgatp = gstage_mode;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
+	/* COVE VCPU hgatp is managed by TSM. */
+	if (is_cove_vcpu(vcpu))
+		return;
+
 	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3b600c6..8cf462c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1288,7 +1288,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		kvm_riscv_update_hvip(vcpu);
 
 		if (ret <= 0 ||
-		    kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
+		    kvm_riscv_gstage_vmid_ver_changed(vcpu->kvm) ||
 		    kvm_request_pending(vcpu) ||
 		    xfer_to_guest_mode_work_pending()) {
 			vcpu->mode = OUTSIDE_GUEST_MODE;
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index ddc9871..dc03601 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -14,6 +14,7 @@
 #include <linux/smp.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/kvm_cove.h>
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
@@ -54,12 +55,13 @@ int kvm_riscv_gstage_vmid_init(struct kvm *kvm)
 	return 0;
 }
 
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid)
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm *kvm)
 {
-	if (!vmid_bits)
+	/* VMID version can't be changed by the host for TVMs */
+	if (!vmid_bits || is_cove_vm(kvm))
 		return false;
 
-	return unlikely(READ_ONCE(vmid->vmid_version) !=
+	return unlikely(READ_ONCE(kvm->arch.vmid.vmid_version) !=
 			READ_ONCE(vmid_version));
 }
 
@@ -72,9 +74,14 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 {
 	unsigned long i;
 	struct kvm_vcpu *v;
+	struct kvm *kvm = vcpu->kvm;
 	struct kvm_vmid *vmid = &vcpu->kvm->arch.vmid;
 
-	if (!kvm_riscv_gstage_vmid_ver_changed(vmid))
+	/* No VMID management for TVMs by the host */
+	if (is_cove_vcpu(vcpu))
+		return;
+
+	if (!kvm_riscv_gstage_vmid_ver_changed(kvm))
 		return;
 
 	spin_lock(&vmid_lock);
@@ -83,7 +90,7 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	 * We need to re-check the vmid_version here to ensure that if
 	 * another vcpu already allocated a valid vmid for this vm.
 	 */
-	if (!kvm_riscv_gstage_vmid_ver_changed(vmid)) {
+	if (!kvm_riscv_gstage_vmid_ver_changed(kvm)) {
 		spin_unlock(&vmid_lock);
 		return;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
