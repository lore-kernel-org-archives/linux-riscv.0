Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B1FC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyGdwU3gvgkWAJiwZ32jXd2DyOy3JiGExzjsd8SuDZk=; b=jTjeGOzgIe6kDh
	qynS/xhGLYsSNckaQItTcjVYKZIlIxyYGtd/I8KiV1YGeli5poFGMc77vT7ijh4lSEZ5VTzlpWjN/
	o28tk7mwJO3cohoZ0occRp6BbKYrVIdKdzFtothqVb0zkcAuqehRErUUxkp0yBfxj3PrSQGGw4Wci
	rwvWCEJn+qozHsjnzrWWBIcFqsY9G+DBznqFSQkNrRkfhz53uhScGxDpaTtfwJCfjG3lVXZSQvY5M
	t+MfEW61SbQWVHDtBTbySyUoYPVjwJTNAeZAkX3F1KJbfVCt19RvR7Mlugrl6HIKtwmIWTTaVYyZi
	IR4lpoZX+yJAopUhH+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBN-00000003Be4-0FzJ;
	Fri, 19 Jul 2024 16:10:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBH-00000003BYW-3sw5
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Jul 2024 16:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IsurUNCBwKbasFP+LQ4AwV8kcPbxaWWGXZnVmJhCYpY=; b=PydxK/J3Bk9+1NH7NzTPGW9rGE
	8Fzk+ozR7i2QSXy0q2uCZOndL4VIs27mHiIXchwdMT9QNuAnC2JDXGSp5KMe2KARAVFPsh5sngDoU
	qL+q4R38RO/YKLm8FqJCY8nCbv+dborWtayIN3Gn11t7ieScBMYIwpvXFMZ/RFzRW4eX6gJrNwFht
	inptd9KQ87PSmbGlj7yeMIv2zfFjArSgFmAZ4x0BzmthsYHn2pm0HoqkCmQafqV9pFVSrSTx7clZh
	qOvLj3IzIN4l9xfw8H9tmjTcc7vBiaQD3SSv8jBmDR7XYejdDWgSdcI4cmMtMs44zXSyC6a71fGy/
	TxnlCAuw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBE-00000002qF5-0Hy0
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:10:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fc49c0aaffso20453765ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405396; x=1722010196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsurUNCBwKbasFP+LQ4AwV8kcPbxaWWGXZnVmJhCYpY=;
        b=P5VkDxtzu2aPTduafE0Mh7iCDEZ+qEIWcy+ujmh/wKpViT0f8MM9ap07HfvQVSmvil
         MvPaCB5Y4C5lQe8d0zTwN4zK1KXbMP/WDxlZRDRwfwKDQAu1LO/I91I9sDOKWYf/mCdy
         UhwFSrheX0XJ/58c0vde04KPQTHGOy+wvkMr0rN4ianSRKRgBmFx7AlQOjFqaYxJFhid
         CfSt/pT/gd4la+FYxDoB+vfDBHnTx/UGudF3O3Nm94RM+AAipN9f+yL/Tnz/6/Dz2mwL
         xtVQGbbOszynk/2P2xdBhgAtE1E/Mz9yr5jNlwAEbE05m591PG/nek8YWV/8JalmW04n
         11sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405396; x=1722010196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsurUNCBwKbasFP+LQ4AwV8kcPbxaWWGXZnVmJhCYpY=;
        b=POKmJH79oGeL37aZ/dx4uCRyfXxStf+j6zvnklM7DHiBEIqbiG+rF2Tse9pfcOLUvV
         sCnX3pZAIWAQ0OcHWH0lWqQG3B6dTIhZcuPlnclhqwlMUBPJZT1FwQVONwkwD27ifHhT
         pVk8zxaFYk4qp7Jq8FGEJwTRmC73RiJ4BmsfmZq62ByqF5z1GWGvZcCa14Gg2XT5CLJG
         /t6eULvu/FQEUhMi/13WxCyC19tz5c/b48dz8equp9auUr5VMKYeLC+GxEDicoy5LOa0
         h3xsa6pQRPk1cCZ5KR9BoFaG8Xqxt3VNV8twFTha6aUojU4dw5+NtRV77cGCwtDKSZGP
         UeZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0FXAxxUcEysDubUjJ9RQQhOvm779RoGpput5//uqmDJsPjlgtIIRZjWnY5mjHzmdGMqfU/Pdat3siWljK6IkzIJfVXx5oVE7MCJdyi/gs
X-Gm-Message-State: AOJu0YxKxaPFSstZ+MbubqCAt3zRzzTnGopTSKiSUSDRE5GHA53JuY+h
	wWFh5bDbJTyln8dI20mSop+1U+0PvDMW2HjNx6M47GpZzkZV9yd/Ngt7bgZLFhE=
X-Google-Smtp-Source: AGHT+IFt4vd1+c8reh4Ha+aYln2xe2c29bGKPEtqrRXGFbhD4f57xNlONljHLht5FR4B0fjb/WuV9g==
X-Received: by 2002:a17:903:182:b0:1fb:8924:df95 with SMTP id d9443c01a7336-1fd7466af15mr2373085ad.48.1721405396302;
        Fri, 19 Jul 2024 09:09:56 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:55 -0700 (PDT)
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
Subject: [PATCH 09/13] RISC-V: KVM: Use nacl_csr_xyz() for accessing H-extension CSRs
Date: Fri, 19 Jul 2024 21:39:09 +0530
Message-Id: <20240719160913.342027-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_171000_326036_D3784CAF 
X-CRM114-Status: GOOD (  14.69  )
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

When running under some other hypervisor, prefer nacl_csr_xyz()
for accessing H-extension CSRs in the run-loop. This makes CSR
access faster whenever SBI nested acceleration is available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c        |   4 +-
 arch/riscv/kvm/vcpu.c       | 103 +++++++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_timer.c |  28 +++++-----
 3 files changed, 87 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..45ace9138947 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -15,7 +15,7 @@
 #include <linux/vmalloc.h>
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
-#include <asm/csr.h>
+#include <asm/kvm_nacl.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
 
@@ -732,7 +732,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
-	csr_write(CSR_HGATP, hgatp);
+	ncsr_write(CSR_HGATP, hgatp);
 
 	if (!kvm_riscv_gstage_vmid_bits())
 		kvm_riscv_local_hfence_gvma_all();
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 957e1a5e081b..00baaf1b0136 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -17,8 +17,8 @@
 #include <linux/sched/signal.h>
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/cacheflush.h>
+#include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_vector.h>
 
 #define CREATE_TRACE_POINTS
@@ -361,10 +361,10 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	/* Read current HVIP and VSIE CSRs */
-	csr->vsie = csr_read(CSR_VSIE);
+	csr->vsie = ncsr_read(CSR_VSIE);
 
 	/* Sync-up HVIP.VSSIP bit changes does by Guest */
-	hvip = csr_read(CSR_HVIP);
+	hvip = ncsr_read(CSR_HVIP);
 	if ((csr->hvip ^ hvip) & (1UL << IRQ_VS_SOFT)) {
 		if (hvip & (1UL << IRQ_VS_SOFT)) {
 			if (!test_and_set_bit(IRQ_VS_SOFT,
@@ -561,26 +561,49 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
+	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
-	csr_write(CSR_VSSTATUS, csr->vsstatus);
-	csr_write(CSR_VSIE, csr->vsie);
-	csr_write(CSR_VSTVEC, csr->vstvec);
-	csr_write(CSR_VSSCRATCH, csr->vsscratch);
-	csr_write(CSR_VSEPC, csr->vsepc);
-	csr_write(CSR_VSCAUSE, csr->vscause);
-	csr_write(CSR_VSTVAL, csr->vstval);
-	csr_write(CSR_HEDELEG, cfg->hedeleg);
-	csr_write(CSR_HVIP, csr->hvip);
-	csr_write(CSR_VSATP, csr->vsatp);
-	csr_write(CSR_HENVCFG, cfg->henvcfg);
-	if (IS_ENABLED(CONFIG_32BIT))
-		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-		csr_write(CSR_HSTATEEN0, cfg->hstateen0);
+	if (kvm_riscv_nacl_sync_csr_available()) {
+		nsh = nacl_shmem();
+		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
+		nacl_csr_write(nsh, CSR_VSIE, csr->vsie);
+		nacl_csr_write(nsh, CSR_VSTVEC, csr->vstvec);
+		nacl_csr_write(nsh, CSR_VSSCRATCH, csr->vsscratch);
+		nacl_csr_write(nsh, CSR_VSEPC, csr->vsepc);
+		nacl_csr_write(nsh, CSR_VSCAUSE, csr->vscause);
+		nacl_csr_write(nsh, CSR_VSTVAL, csr->vstval);
+		nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);
+		nacl_csr_write(nsh, CSR_HVIP, csr->hvip);
+		nacl_csr_write(nsh, CSR_VSATP, csr->vsatp);
+		nacl_csr_write(nsh, CSR_HENVCFG, cfg->henvcfg);
+		if (IS_ENABLED(CONFIG_32BIT))
+			nacl_csr_write(nsh, CSR_HENVCFGH, cfg->henvcfg >> 32);
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+			nacl_csr_write(nsh, CSR_HSTATEEN0, cfg->hstateen0);
+			if (IS_ENABLED(CONFIG_32BIT))
+				nacl_csr_write(nsh, CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+		}
+	} else {
+		csr_write(CSR_VSSTATUS, csr->vsstatus);
+		csr_write(CSR_VSIE, csr->vsie);
+		csr_write(CSR_VSTVEC, csr->vstvec);
+		csr_write(CSR_VSSCRATCH, csr->vsscratch);
+		csr_write(CSR_VSEPC, csr->vsepc);
+		csr_write(CSR_VSCAUSE, csr->vscause);
+		csr_write(CSR_VSTVAL, csr->vstval);
+		csr_write(CSR_HEDELEG, cfg->hedeleg);
+		csr_write(CSR_HVIP, csr->hvip);
+		csr_write(CSR_VSATP, csr->vsatp);
+		csr_write(CSR_HENVCFG, cfg->henvcfg);
 		if (IS_ENABLED(CONFIG_32BIT))
-			csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+			csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+			csr_write(CSR_HSTATEEN0, cfg->hstateen0);
+			if (IS_ENABLED(CONFIG_32BIT))
+				csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+		}
 	}
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
@@ -603,6 +626,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
+	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	vcpu->cpu = -1;
@@ -618,15 +642,28 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 					 vcpu->arch.isa);
 	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
 
-	csr->vsstatus = csr_read(CSR_VSSTATUS);
-	csr->vsie = csr_read(CSR_VSIE);
-	csr->vstvec = csr_read(CSR_VSTVEC);
-	csr->vsscratch = csr_read(CSR_VSSCRATCH);
-	csr->vsepc = csr_read(CSR_VSEPC);
-	csr->vscause = csr_read(CSR_VSCAUSE);
-	csr->vstval = csr_read(CSR_VSTVAL);
-	csr->hvip = csr_read(CSR_HVIP);
-	csr->vsatp = csr_read(CSR_VSATP);
+	if (kvm_riscv_nacl_available()) {
+		nsh = nacl_shmem();
+		csr->vsstatus = nacl_csr_read(nsh, CSR_VSSTATUS);
+		csr->vsie = nacl_csr_read(nsh, CSR_VSIE);
+		csr->vstvec = nacl_csr_read(nsh, CSR_VSTVEC);
+		csr->vsscratch = nacl_csr_read(nsh, CSR_VSSCRATCH);
+		csr->vsepc = nacl_csr_read(nsh, CSR_VSEPC);
+		csr->vscause = nacl_csr_read(nsh, CSR_VSCAUSE);
+		csr->vstval = nacl_csr_read(nsh, CSR_VSTVAL);
+		csr->hvip = nacl_csr_read(nsh, CSR_HVIP);
+		csr->vsatp = nacl_csr_read(nsh, CSR_VSATP);
+	} else {
+		csr->vsstatus = csr_read(CSR_VSSTATUS);
+		csr->vsie = csr_read(CSR_VSIE);
+		csr->vstvec = csr_read(CSR_VSTVEC);
+		csr->vsscratch = csr_read(CSR_VSSCRATCH);
+		csr->vsepc = csr_read(CSR_VSEPC);
+		csr->vscause = csr_read(CSR_VSCAUSE);
+		csr->vstval = csr_read(CSR_VSTVAL);
+		csr->hvip = csr_read(CSR_HVIP);
+		csr->vsatp = csr_read(CSR_VSATP);
+	}
 }
 
 static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
@@ -681,7 +718,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
-	csr_write(CSR_HVIP, csr->hvip);
+	ncsr_write(CSR_HVIP, csr->hvip);
 	kvm_riscv_vcpu_aia_update_hvip(vcpu);
 }
 
@@ -728,7 +765,9 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
-	hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
+	hcntx->hstatus = ncsr_swap(CSR_HSTATUS, gcntx->hstatus);
+
+	nsync_csr(-1UL);
 
 	__kvm_riscv_switch_to(&vcpu->arch);
 
@@ -863,8 +902,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		trap.sepc = vcpu->arch.guest_context.sepc;
 		trap.scause = csr_read(CSR_SCAUSE);
 		trap.stval = csr_read(CSR_STVAL);
-		trap.htval = csr_read(CSR_HTVAL);
-		trap.htinst = csr_read(CSR_HTINST);
+		trap.htval = ncsr_read(CSR_HTVAL);
+		trap.htinst = ncsr_read(CSR_HTINST);
 
 		/* Syncup interrupts state with HW */
 		kvm_riscv_vcpu_sync_interrupts(vcpu);
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 75486b25ac45..96e7a4e463f7 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -11,8 +11,8 @@
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
 #include <clocksource/timer-riscv.h>
-#include <asm/csr.h>
 #include <asm/delay.h>
+#include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_timer.h>
 
 static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
@@ -72,12 +72,12 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
-		csr_write(CSR_VSTIMECMPH, ncycles >> 32);
+	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
+	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
 #else
-		csr_write(CSR_VSTIMECMP, ncycles);
+	ncsr_write(CSR_VSTIMECMP, ncycles);
 #endif
-		return 0;
+	return 0;
 }
 
 static int kvm_riscv_vcpu_update_hrtimer(struct kvm_vcpu *vcpu, u64 ncycles)
@@ -289,10 +289,10 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
 #if defined(CONFIG_32BIT)
-	csr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
-	csr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
+	ncsr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
+	ncsr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
 #else
-	csr_write(CSR_HTIMEDELTA, gt->time_delta);
+	ncsr_write(CSR_HTIMEDELTA, gt->time_delta);
 #endif
 }
 
@@ -306,10 +306,10 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	csr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
-	csr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
+	ncsr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
+	ncsr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
 #else
-	csr_write(CSR_VSTIMECMP, t->next_cycles);
+	ncsr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
 
 	/* timer should be enabled for the remaining operations */
@@ -327,10 +327,10 @@ void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	t->next_cycles = csr_read(CSR_VSTIMECMP);
-	t->next_cycles |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
+	t->next_cycles = ncsr_read(CSR_VSTIMECMP);
+	t->next_cycles |= (u64)ncsr_read(CSR_VSTIMECMPH) << 32;
 #else
-	t->next_cycles = csr_read(CSR_VSTIMECMP);
+	t->next_cycles = ncsr_read(CSR_VSTIMECMP);
 #endif
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
